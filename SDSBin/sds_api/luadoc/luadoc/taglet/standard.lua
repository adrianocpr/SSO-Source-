-------------------------------------------------------------------------------
-- This is just copy of standard.lua with support for <pre> tag in 
-- documentation. See example bellow:
-- <pre>
--	if info ~= nil then
--		assert(info.name, "function name undefined")
--	end
-- </pre>
--
--
-- LuaDoc modules functionality was amended (misused) to generate 
-- index of all functions.
--


-------------------------------------------------------------------------------
-- @release $Id: standard.lua,v 1.39 2007/12/21 17:50:48 tomas Exp $
-------------------------------------------------------------------------------

local assert, pairs, tostring, type = assert, pairs, tostring, type
local io = require "io"
local lfs = require "lfs"
local luadoc = require "luadoc"
local util = require "luadoc.util"
local tags = require "luadoc.taglet.standard.tags"
local string = require "string"
local table = require "table"
local print = print

module 'luadoc.taglet.standard'

-------------------------------------------------------------------------------
-- Creates an iterator for an array base on a class type.
-- @param t array to iterate over
-- @param class name of the class to iterate over

function class_iterator (t, class)
	return function ()
		local i = 1
		return function ()
			while t[i] and t[i].class ~= class do
				i = i + 1
			end
			local v = t[i]
			i = i + 1
			return v
		end
	end
end

-- Patterns for function recognition
local identifiers_list_pattern = "%s*(.-)%s*"
local identifier_pattern = "[^%(%s]+"
local function_patterns = {
	"^()%s*function%s*("..identifier_pattern..")%s*%("..identifiers_list_pattern.."%)",
	"^%s*(local%s)%s*function%s*("..identifier_pattern..")%s*%("..identifiers_list_pattern.."%)",
	"^()%s*("..identifier_pattern..")%s*%=%s*function%s*%("..identifiers_list_pattern.."%)",
}

-------------------------------------------------------------------------------
-- Checks if the line contains a function definition
-- @param line string with line text
-- @return function information or nil if no function definition found

local function check_function (line)
	line = util.trim(line)

	local info = table.foreachi(function_patterns, function (_, pattern)
		local r, _, l, id, param = string.find(line, pattern)
		if r ~= nil then
			return {
				name = id,
				private = (l == "local"),
				param = util.split("%s*,%s*", param),
			}
		end
	end)

	-- TODO: remove these assert's?
	if info ~= nil then
		assert(info.name, "function name undefined")
		assert(info.param, string.format("undefined parameter list for function `%s'", info.name))
	end

	return info
end

-------------------------------------------------------------------------------
-- Checks if the line contains a module definition.
-- @param line string with line text
-- @param currentmodule module already found, if any
-- @return the name of the defined module, or nil if there is no module 
-- definition

local function check_module (line, currentmodule)
	line = util.trim(line)
	
	-- module"x.y"
	-- module'x.y'
	-- module[[x.y]]
	-- module("x.y")
	-- module('x.y')
	-- module([[x.y]])
	-- module(...)

	local r, _, modulename = string.find(line, "^module%s*[%s\"'(%[]+([^,\"')%]]+)")
	if r then
		-- found module definition
		logger:debug(string.format("found module `%s'", modulename))
		return modulename
	end
	return currentmodule
end

-------------------------------------------------------------------------------
-- Extracts summary information from a description. The first sentence of each 
-- doc comment should be a summary sentence, containing a concise but complete 
-- description of the item. It is important to write crisp and informative 
-- initial sentences that can stand on their own
-- @param description text with item description
-- @return summary string or nil if description is nil

local function parse_summary (description)
	-- summary is never nil...
	description = description or ""
	
	-- append an " " at the end to make the pattern work in all cases
	description = description.." "

	-- read until the first period followed by a space or tab	
	local summary = string.match(description, "(.-%.)[%s\t]")
	
	-- if pattern did not find the first sentence, summary is the whole description
	summary = summary or description
	
	return summary
end

-------------------------------------------------------------------------------
-- @param f file handle
-- @param line current line being parsed
-- @param modulename module already found, if any
-- @return current line
-- @return code block
-- @return modulename if found

local function parse_code (f, line, modulename)
	local code = {}
	while line ~= nil do
		if string.find(line, "^[\t ]*%-%-%-") then
			-- reached another luadoc block, end this parsing
			return line, code, modulename
		else
			-- look for a module definition
			modulename = check_module(line, modulename)

			table.insert(code, line)
			line = f:read()
		end
	end
	-- reached end of file
	return line, code, modulename
end


-------------------------------------------------------------------------------
-- Simply tests if trimmed line without pre /pre tags is blank
-- @return true/false 
function skipNewline(line)
	if string.find(line, "<[pP][rR][eE]>") or string.find(line, "</[pP][rR][eE]>") then
		line = string.gsub(line, "<[pP][rR][eE]>", "")
		line = string.gsub(line, "</[pP][rR][eE]>", "")
		line = string.gsub(line, "^%s*(.-)%s*$", "%1")
		return line == ""
	else
		return false
	end
end


-------------------------------------------------------------------------------
-- Simply tests if trimmed line without @usage tags is blank
-- @return true/false 
function addNewlineAfterUsage(line)
	line = string.gsub(line, "@usage", "")
	line = string.gsub(line, "^%s*(.-)%s*$", "%1")
	return line == ""
end



-------------------------------------------------------------------------------
-- Removes lua comment from the begining of the line and add newLine char.
-- This was implemented to add <pre> support to LuaDoc.
-- @param s string to be trimmed
-- @return trimmed string
local function trim_comment_pre(s) 
	-- detect start/end of pre block - case sensitive
	if string.find(s, "<[pP][rR][eE]>") then luadoc_taglet_mudlet_pre = true end
	if string.find(s, "</[pP][rR][eE]>") then luadoc_taglet_mudlet_pre = false end
	-- process line
	s = string.gsub(s, "%-%-+(.*)$", "%1")
	if luadoc_taglet_mudlet_pre then
		if not skipNewline(s) then
			return s .. "\n"
		else
			return s
		end 
	else
		s = string.gsub(s, "^%s*(.-)%s*$", "%1")
		if string.find(s, "@usage") then 
			if addNewlineAfterUsage(s) then
				s = s .. "\n"
			end
		end
		return s
	end
end


-------------------------------------------------------------------------------
-- Parses the information inside a block comment
-- @param block block with comment field
-- @return block parameter

local function parse_comment (block, first_line)

	-- get the first non-empty line of code
	local code = table.foreachi(block.code, function(_, line)
		if not util.line_empty(line) then
			-- `local' declarations are ignored in two cases:
			-- when the `nolocals' option is turned on; and
			-- when the first block of a file is parsed (this is
			--	necessary to avoid confusion between the top
			--	local declarations and the `module' definition.
			if (options.nolocals or first_line) and line:find"^%s*local" then
				return
			end
			return line
		end
	end)
	
	-- parse first line of code
	if code ~= nil then
		local func_info = check_function(code)
		local module_name = check_module(code)
		if func_info then
			block.class = "function"
			block.name = func_info.name
			block.param = func_info.param
			block.private = func_info.private
		elseif module_name then
			block.class = "module"
			block.name = module_name
			block.param = {}
		else
			block.param = {}
		end
	else
		-- TODO: comment without any code. Does this means we are dealing
		-- with a file comment?
	end

	-- parse @ tags
	local currenttag = "description"
	local currenttext
	
	table.foreachi(block.comment, function (_, line)
		-- added new line char to support <pre> formatted code
		line = trim_comment_pre(line)

		local r, _, tag, text = string.find(line, "@([_%w%.]+)%s+(.*)")
		if r ~= nil then
			-- found new tag, add previous one, and start a new one
			-- TODO: what to do with invalid tags? issue an error? or log a warning?
			tags.handle(currenttag, block, currenttext)
			
			currenttag = tag
			currenttext = text
		else
			currenttext = util.concat(currenttext, line)
-- commented out, so I can user <pre> formatted code
--			assert(string.sub(currenttext, 1, 1) ~= " ", string.format("`%s', `%s'", currenttext, line))
		end
	end)
	tags.handle(currenttag, block, currenttext)

	-- Store file name info
	tags.handle("filename", block, luadoc_taglet_mudlet_filename)

	-- extracts summary information from the description
	block.summary = parse_summary(block.description)
-- commented out, so I can user <pre> formatted code
--	assert(string.sub(block.description, 1, 1) ~= " ", string.format("`%s'", block.description))

	return block
end

-------------------------------------------------------------------------------
-- Parses a block of comment, started with ---. Read until the next block of
-- comment.
-- @param f file handle
-- @param line being parsed
-- @param modulename module already found, if any
-- @return line
-- @return block parsed
-- @return modulename if found

local function parse_block (f, line, modulename, first)
	local block = {
		comment = {},
		code = {},
	}

	while line ~= nil do
		if string.find(line, "^[\t ]*%-%-") == nil then
			-- reached end of comment, read the code below it
			-- TODO: allow empty lines
			line, block.code, modulename = parse_code(f, line, modulename)
			
			-- parse information in block comment
			block = parse_comment(block, first)

			return line, block, modulename
		else
			table.insert(block.comment, line)
			line = f:read()
		end
	end
	-- reached end of file
	
	-- parse information in block comment
	block = parse_comment(block, first)
	
	return line, block, modulename
end

-------------------------------------------------------------------------------
-- Parses a file documented following luadoc format.
-- @param filepath full path of file to parse
-- @param doc table with documentation
-- @return table with documentation

function parse_file (filepath, doc)
	local blocks = {}
	local modulename = nil
	
	-- read each line
	local f = io.open(filepath, "r")
	local i = 1
	local line = f:read()
	local first = true
	while line ~= nil do
		if string.find(line, "^[\t ]*%-%-%-") then
			-- reached a luadoc block
			local block
			line, block, modulename = parse_block(f, line, modulename, first)
			table.insert(blocks, block)
		else
			-- look for a module definition
			modulename = check_module(line, modulename)
			
			-- TODO: keep beginning of file somewhere
			
			line = f:read()
		end
		first = false
		i = i + 1
	end
	f:close()
	-- store blocks in file hierarchy
	assert(doc.files[filepath] == nil, string.format("doc for file `%s' already defined", filepath))
	table.insert(doc.files, filepath)
	doc.files[filepath] = {
		type = "file",
		name = filepath,
		doc = blocks,
--		functions = class_iterator(blocks, "function"),
--		tables = class_iterator(blocks, "table"),
	}

	-- added initial file comment
	local first = doc.files[filepath].doc[1]
	if first and modulename then
		doc.files[filepath].author = first.author
		doc.files[filepath].copyright = first.copyright
		doc.files[filepath].description = first.description
		doc.files[filepath].release = first.release
		doc.files[filepath].summary = first.summary
	end

	-- if module definition is found, store in module hierarchy
	if modulename ~= nil then
		if modulename == "..." then
				modulename = string.gsub (filepath, "%.lua$", "")
				modulename = string.gsub (modulename, "/", ".")
		end
		if doc.modules[modulename] ~= nil then
			-- module is already defined, just add the blocks
			table.foreachi(blocks, function (_, v)
				table.insert(doc.modules[modulename].doc, v)
			end)
		else
			-- TODO: put this in a different module
			table.insert(doc.modules, modulename)
			doc.modules[modulename] = {
				type = "module",
				name = modulename,
				doc = blocks,
--				functions = class_iterator(blocks, "function"),
--				tables = class_iterator(blocks, "table"),
				author = first and first.author,
				copyright = first and first.copyright,
				description = "",
				release = first and first.release,
				summary = "",
			}
			
			-- find module description
			for m in class_iterator(blocks, "module")() do
				doc.modules[modulename].description = util.concat(
					doc.modules[modulename].description, 
					m.description)
				doc.modules[modulename].summary = util.concat(
					doc.modules[modulename].summary, 
					m.summary)
				if m.author then
					doc.modules[modulename].author = m.author
				end
				if m.copyright then
					doc.modules[modulename].copyright = m.copyright
				end
				if m.release then
					doc.modules[modulename].release = m.release
				end
				if m.name then
					doc.modules[modulename].name = m.name
				end
			end
			doc.modules[modulename].description = doc.modules[modulename].description or (first and first.description) or ""
			doc.modules[modulename].summary = doc.modules[modulename].summary or (first and first.summary) or ""
		end
		
		-- make functions table
		doc.modules[modulename].functions = doc.modules[modulename].functions or {}
		for f in class_iterator(blocks, "function")() do
			table.insert(doc.modules[modulename].functions, f.name)
			doc.modules[modulename].functions[f.name] = f
		end
		
		-- make tables table
		doc.modules[modulename].tables = {}
		for t in class_iterator(blocks, "table")() do
			table.insert(doc.modules[modulename].tables, t.name)
			doc.modules[modulename].tables[t.name] = t
		end
	end
	
	-- make functions table
	doc.files[filepath].functions = {}
	for f in class_iterator(blocks, "function")() do
		table.insert(doc.files[filepath].functions, f.name)
		-- added link, so we can refer this function later
		f.link = string.gsub(filepath, ".lua", ".html") .. "#" .. f.name
		doc.files[filepath].functions[f.name] = f
		-- new array for master index of all functions
		local funcId = f.name
		table.insert(doc.mIndex, funcId)
		doc.mIndex[funcId] = f
	end
	
	-- make tables table
	doc.files[filepath].tables = {}
	for t in class_iterator(blocks, "table")() do
		table.insert(doc.files[filepath].tables, t.name)
		doc.files[filepath].tables[t.name] = t
	end
	
	return doc
end

-------------------------------------------------------------------------------
-- Checks if the file is terminated by ".lua" or ".luadoc" and calls the 
-- function that does the actual parsing
-- @param filepath full path of the file to parse
-- @param doc table with documentation
-- @return table with documentation
-- @see parse_file

function file (filepath, doc, patterns)
	local patterns = patterns-- or {"%.lua$", "%.luadoc$" }
	local valid = table.foreachi(patterns, function (_, pattern)
		if string.find(filepath, pattern) ~= nil then
			return true
		end
	end)
	
	if valid then
		logger:info(string.format("processing file `%s'", filepath))
		doc = parse_file(filepath, doc)
	end
	
	return doc
end

-------------------------------------------------------------------------------
-- Recursively iterates through a directory, parsing each file
-- @param path directory to search
-- @param doc table with documentation
-- @return table with documentation

function directory (path, doc, patterns)
	for f in lfs.dir(path) do
		local fullpath = path .. "/" .. f
		local attr = lfs.attributes(fullpath)
		assert(attr, string.format("error stating file `%s'", fullpath))
		
		if attr.mode == "file" then
			doc = file(fullpath, doc, patterns)
		elseif attr.mode == "directory" and f ~= "." and f ~= ".." then
			doc = directory(fullpath, doc, patterns)
		end
	end
	return doc
end

-- Recursively sorts the documentation table
local function recsort (tab)
	table.sort (tab)
	-- sort list of functions by name alphabetically
	for f, doc in pairs(tab) do
		if doc.functions then
			table.sort(doc.functions)
		end
		if doc.tables then
			table.sort(doc.tables)
		end
	end
end

-------------------------------------------------------------------------------

function start (files, doc, patterns)
	assert(files, "file list not specified")
	
	-- Create an empty document, or use the given one
	doc = doc or {
		files = {},
		modules = {},
		mIndex = {}, -- master index
	}
	assert(doc.files, "undefined `files' field")
	assert(doc.modules, "undefined `modules' field")
	
	table.foreachi(files, function (_, path)
		local attr = lfs.attributes(path)
		assert(attr, string.format("error stating path `%s'", path))
	
		-- current file
		luadoc_taglet_mudlet_filename = path
	
		if attr.mode == "file" then
			doc = file(path, doc, patterns)
		elseif attr.mode == "directory" then
			doc = directory(path, doc, patterns)
		end
	end)
	
	-- order arrays alphabetically
	recsort(doc.files)
	recsort(doc.modules)
	table.sort(doc.mIndex)

	return doc
end
