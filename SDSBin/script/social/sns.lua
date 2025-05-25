module("sns", package.seeall)


function GetNameValuePairs(self,strText)
	local list = {}
	-- "name":"value"
	for name,value in string.gfind(strText,"\"([^\"]+)\":\"([^\"]*)\"") do 
	    table.insert(list, name)
	    table.insert(list, value)
	end
	-- "name":value
	for name,value in string.gfind(strText,"\"([^\"]+)\":(%P+)") do 
	    table.insert(list, name)
	    table.insert(list, value)
	end
	-- name:value
	for name,value in string.gfind(strText,"(%P+):(%P+)") do 
	    table.insert(list, name)
	    table.insert(list, value)
	end
	-- name:"value"
	for name,value in string.gfind(strText,"(%P+):\"([^\"]*)\"") do 
	    table.insert(list, name)
	    table.insert(list, value)
	end          
    return list
end

function FindSentences(self,strText)
    local list = {}
    for sen in string.gfind(strText,"{([^{^}]+)}") do
        table.insert(list,sen)
    end
    return list
end