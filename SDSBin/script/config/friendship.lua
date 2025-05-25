FriendShipCfg =
{
	{0; text = _t"1级"},
	{100; text = _t"2级"},
	{500; text = _t"3级"},
	{1000; text = _t"4级"},
	{2000; text = _t"5级"},
	{3000; text = _t"6级"},
	{4000; text = _t"7级"},
	{5000; text = _t"8级"},
	{6000; text = _t"9级"},
	{8000; text = _t"10级"},
}

function FriendShipCfg:Format(value)
	if value < 0 then return "" end
	
	local level = 1
	for k, v in ipairs(self) do
		if value < v[1] then break end
		level = k
	end
	return FriendShipCfg[level].text
end