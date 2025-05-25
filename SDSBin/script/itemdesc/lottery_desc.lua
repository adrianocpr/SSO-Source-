--[[ @i18n item ]]
local _t = require("i18n").context("item")

Lottery_Desc = {};

	
function Lottery_Desc:GetLotteryDesc(id, dicedata)
	if id == 6576 then	--神木宝盒
		if ZLottery_FindSameNum(dicedata,4)==3 then
			return _t"一等奖"
		elseif ZLottery_FindSameNum(dicedata,4)==2 or ZLottery_FindSameNum(dicedata,3)==3
			or ZLottery_FindSameNum(dicedata,2)==3 or ZLottery_FindSameNum(dicedata,1)==3 then
			return _t"二等奖"		
		elseif ZLottery_FindSameNum(dicedata,4)==1 then
			return _t"三等奖"
		else	
			return _t"四等奖"	
		end		
		
	elseif id == 7916 then	--玄龟金鼎
		if ZLottery_FindSameNum(dicedata,1)==3 then
			return _t"一等奖"
		elseif ZLottery_FindSameNum(dicedata,2)==3 then
			return _t"二等奖"		
		elseif ZLottery_FindSameNum(dicedata,3)==3 or 
		(ZLottery_FindSameNum(dicedata,1)==1 and ZLottery_FindSameNum(dicedata,2)==1 and ZLottery_FindSameNum(dicedata,3)==1) then  
			return _t"三等奖"
		else	
			return _t"四等奖"	
		end	
		
	elseif id == 10484 then	--仙工宝箱
		if ZLottery_FindSameNum(dicedata,1)==3 then
			return _t"一等奖"
		elseif ZLottery_FindSameNum(dicedata,1)==2 then
			return _t"二等奖"		
		elseif ZLottery_FindSameNum(dicedata,1)==1 then  
			return _t"三等奖"
		else	
			return _t"四等奖"	
		end		
		
	elseif id == 10722 then	--灵狐元丹
		if ZLottery_FindSameNum(dicedata,1)==1 and ZLottery_FindSameNum(dicedata,2)==1 and ZLottery_FindSameNum(dicedata,3)==1 then
			return _t"一等奖"
		elseif ZLottery_FindSameNum(dicedata,1)>=1 and ZLottery_FindSameNum(dicedata,2)>=1 and ZLottery_FindSameNum(dicedata,3)==0 then
			return _t"二等奖"		
		elseif ZLottery_FindSameNum(dicedata,1)>=1 and ZLottery_FindSameNum(dicedata,2)==0 then  
			return _t"三等奖"
		else	
			return _t"四等奖"	
		end		
		
	elseif id == 11537 then	--玄蛇之心
		if ZLottery_FindSameNum(dicedata,1)==1 and ZLottery_FindSameNum(dicedata,2)==1 and ZLottery_FindSameNum(dicedata,3)==1 then
			return _t"一等奖"
		elseif ZLottery_FindSameNum(dicedata,1)>=1 and ZLottery_FindSameNum(dicedata,2)>=1 and ZLottery_FindSameNum(dicedata,3)==0 then
			return _t"二等奖"		
		elseif ZLottery_FindSameNum(dicedata,1)>=1 and ZLottery_FindSameNum(dicedata,2)==0 then  
			return _t"三等奖"
		else	
			return _t"四等奖"	
		end		
		
	elseif id == 11742 then	--山河扇大礼包
			return _t"一等奖"
		
	elseif id == 11743 then	--万毒鼎大礼包
			return _t"一等奖"
			
	elseif id == 12006 then	--龙驹宝鉴
		if ZLottery_FindSameNum(dicedata,1)==1 and ZLottery_FindSameNum(dicedata,2)==1 and ZLottery_FindSameNum(dicedata,3)==1 then
			return _t"一等奖"
		elseif ZLottery_FindSameNum(dicedata,1)>=1 and ZLottery_FindSameNum(dicedata,2)>=1 and ZLottery_FindSameNum(dicedata,3)==0 then
			return _t"二等奖"		
		elseif ZLottery_FindSameNum(dicedata,1)>=1 and ZLottery_FindSameNum(dicedata,2)==0 then  
			return _t"三等奖"
		else	
			return _t"四等奖"	
		end		
		
	elseif id == 13318 then	--绽魂仙羽 
	  if ZLottery_FindSameNum(dicedata,1)==1 and ZLottery_FindSameNum(dicedata,2)==1 and ZLottery_FindSameNum(dicedata,3)==1 then
			return _t"一等奖"
		elseif ZLottery_FindSameNum(dicedata,1)>=1 and ZLottery_FindSameNum(dicedata,2)>=1 and ZLottery_FindSameNum(dicedata,3)==0 then
			return _t"二等奖"		
		elseif ZLottery_FindSameNum(dicedata,1)>=1 and ZLottery_FindSameNum(dicedata,2)==0 then  
			return _t"四等奖"
		elseif ZLottery_FindSameNum(dicedata,4)==3 then  
			return _t"三等奖"		
		else	
			return _t"五等奖"	
		end		
		
	elseif id == 13377 then	--虚拟币出产箱子的绽魂仙羽
	  if ZLottery_FindSameNum(dicedata,1)==1 and ZLottery_FindSameNum(dicedata,2)==1 and ZLottery_FindSameNum(dicedata,3)==1 then
			return _t"一等奖"
		elseif ZLottery_FindSameNum(dicedata,1)>=1 and ZLottery_FindSameNum(dicedata,2)>=1 and ZLottery_FindSameNum(dicedata,3)==0 then
			return _t"二等奖"		
		elseif ZLottery_FindSameNum(dicedata,1)>=1 and ZLottery_FindSameNum(dicedata,2)==0 then  
			return _t"四等奖"
		elseif ZLottery_FindSameNum(dicedata,4)==3 then  
			return _t"三等奖"		
		else	
			return _t"五等奖"	
		end		
		
	elseif id == 13319 then	--乾坤遁宝
	  if ZLottery_FindSameNum(dicedata,1)==1 and ZLottery_FindSameNum(dicedata,2)==1 and ZLottery_FindSameNum(dicedata,3)==1 then
			return _t"一等奖"
		elseif ZLottery_FindSameNum(dicedata,1)>=1 and ZLottery_FindSameNum(dicedata,2)>=1 and ZLottery_FindSameNum(dicedata,3)==0 then
			return _t"二等奖"		
		elseif ZLottery_FindSameNum(dicedata,1)>=1 and ZLottery_FindSameNum(dicedata,2)==0 then  
			return _t"三等奖"
		else	
			return _t"四等奖"	
		end		
		
	elseif id>=13320 and id<=13339 then	--材料
			return _t"一等奖"

	elseif id == 13593 then	--月光宝盒
	  if ZLottery_FindSameNum(dicedata,1)==3 then
			return _t"一等奖"
		elseif ZLottery_FindSameNum(dicedata,2)==3 then
			return _t"二等奖"		
		elseif ZLottery_FindSameNum(dicedata,1)==0 and ZLottery_FindSameNum(dicedata,2)==0 then  
			return _t"三等奖"
		elseif ZLottery_FindSameNum(dicedata,1)==2 or ZLottery_FindSameNum(dicedata,2)==2 then  
			return _t"三等奖"
		else	
			return _t"四等奖"	
		end		
								
	end		
	return ""
end


function ZLottery_FindSameNum(s1,a) --寻找某个数的个数
	local i,j
	j=0
	for i=1,table.getn(s1) do
		if s1[i]==a then 
		j=j+1
		end 
	end 
	return j	
end 
