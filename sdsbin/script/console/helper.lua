local console = ConsoleApi

-- 提供一些控制台用的辅助函数 --
print = function(x)
	local clr = "b0b0b0";  -- rrggbb
	if( type(x) ~= "table" ) then
	    console.info( tostring(x), clr )
    else 
        local count = 0
        for k, v in pairs(x) do
            if count == 0 then console.info( tostring(x) .. "{", clr ) end
            count = count + 1;
		    console.info( "  ".. tostring(k) .. "=" .. tostring(v), clr )
		end
		if count == 0 then
		    console.info( tostring(x) .. "{}", clr )
		else
		    console.info( "}", clr )
		end
	end
end