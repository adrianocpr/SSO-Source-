
--------------------------------------------------------------------------------
--AI helper
AI_Helper = 
{
	m_hpRate,       	--hp
	m_mpRate,       	--mp
	
	m_hpCounter,    	--hpؼ
	m_mpCounter,    	--mpؼ
	
	m_tabCounter,   	--tabҲרü
	m_tab2Counter,  	--2
	m_tab3Counter,  	--3
	m_tab4Counter,      --4
	
	m_pickCounter,      --ʰȡ
	m_gatherCounter,    --Gather related
	m_reportCounter,    --
	m_skillCounter = {},    --ܼ,һ
	
	m_status,           --ǰ״̬
	m_isGathering,
	
	m_tabValid,         --ǷԶѡ(ֵ)
	m_anchorValid,      --Ƿ̶λ
	
	m_pickValid,        --ǷԶʰȡҪ
	m_gatherValid,      --Gather relatedҪ

	m_skillid,          --id
	m_x1,       --x
	m_y1,       --y
	m_z1,       --z
	
	m_petHpRate,        --hp
	m_petHungerRate,    --ﱥʳȱ

	m_petHpCounter,     --HP
	m_petHungerCounter, --ﱥʳȼ

};

local GameAI = GameApi;
-----------------------------AI_Helper:Init-------------------------------------
function AI_Helper:Init()
	self.m_hpCounter = Counter:new();
	self.m_mpCounter = Counter:new();
	self.m_petHpCounter = Counter:new();
	self.m_petHungerCounter = Counter:new();
	self.m_tabCounter = Counter:new();
	self.m_tab2Counter = Counter:new();
	self.m_tab3Counter = Counter:new();
	self.m_tab4Counter = Counter:new();
	self.m_pickCounter = Counter:new();
	self.m_gatherCounter = Counter:new();   --ɼ
	self.m_reportCounter = Counter:new();
	
	self.m_skillCounter[1] = Counter:new();
	self.m_skillCounter[2] = Counter:new();
	self.m_skillCounter[3] = Counter:new();
	self.m_skillCounter[4] = Counter:new();
	self.m_skillCounter[5] = Counter:new();
	self.m_skillCounter[6] = Counter:new();     --
	
	self:Reset();   --һreset
end
-----------------------------AI_Helper:Reset------------------------------------
function AI_Helper:Reset()
	self.m_hpCounter:SetPeriod(2500);   --òǺ
	self.m_hpRate = 0.75;
	self.m_mpCounter:SetPeriod(5000);
	self.m_mpRate = 0.6;
	self.m_petHpCounter:SetPeriod(2500);
	self.m_petHpRate = 0.75;
	self.m_petHungerCounter:SetPeriod(5000);
	self.m_petHungerRate = 0.96;
	self.m_tabCounter:SetPeriod(2000);      --2
	self.m_tab2Counter:SetPeriod(30000);    --30
	self.m_tab3Counter:SetPeriod(120000);   --120
	self.m_tab4Counter:SetPeriod(2000);     --2
	self.m_pickCounter:SetPeriod(800);
	self.m_gatherCounter:SetPeriod(1800);   --Gather related
	self.m_skillCounter[1]:SetPeriod(5000);
	self.m_skillCounter[2]:SetPeriod(5000);
	self.m_skillCounter[3]:SetPeriod(5000);
	self.m_skillCounter[4]:SetPeriod(5000);
	self.m_skillCounter[5]:SetPeriod(5000);
	self.m_skillCounter[6]:SetPeriod(5000);
	self.m_reportCounter:SetPeriod(10000);  --Ҫʲô?
	self.m_tabValid = true;
	self.m_anchorValid = true;
	self.m_pickValid = true;
	self.m_gatherValid = true;
	self.m_isGathering = false;
end

-----------------------------AI_Helper:SetDefault-------------------------------
function AI_Helper:SetDefault()
	self.m_hpCounter:SetPeriod(2500);   --òǺ
	self.m_hpRate = 0.75;
	self.m_mpCounter:SetPeriod(5000);
	self.m_mpRate = 0.6;
	self.m_petHpCounter:SetPeriod(2500);
	self.m_petHpRate = 0.75;
	self.m_petHungerCounter:SetPeriod(5000);
	self.m_petHungerRate = 0.96;
	self.m_tabCounter:SetPeriod(2000);      --2
	self.m_tab2Counter:SetPeriod(30000);    --30
	self.m_tab3Counter:SetPeriod(120000);   --120
	self.m_tab4Counter:SetPeriod(2000);     --2
	self.m_pickCounter:SetPeriod(800);
	self.m_gatherCounter:SetPeriod(1800);   --Gather related
	self.m_skillCounter[1]:SetPeriod(5000);
	self.m_skillCounter[2]:SetPeriod(5000);
	self.m_skillCounter[3]:SetPeriod(5000);
	self.m_skillCounter[4]:SetPeriod(5000);
	self.m_skillCounter[5]:SetPeriod(5000);
	self.m_skillCounter[6]:SetPeriod(5000);
	self.m_reportCounter:SetPeriod(10000);  --Ҫʲô?
	self.m_tabValid = true;
	self.m_anchorValid = true;
	self.m_pickValid = true;
	self.m_gatherValid = true;
	self.m_isGathering = false;
end

function AI_Helper:IsTabValid()
		return self.m_tabValid;
end
function AI_Helper:IsAnchorValid()
		return self.m_anchorValid;
end
function AI_Helper:SetTabValid(valid)
		self.m_tabValid = valid;
end
function AI_Helper:SetAnchorValid(valid)
		self.m_anchorValid = valid;
end
function AI_Helper:IsPickValid()
		return self.m_pickValid;
end
function AI_Helper:SetPickValid(valid)
		self.m_pickValid = valid;
end
function AI_Helper:IsGatherValid()
		return self.m_GatherValid;
end
function AI_Helper:SetGatherValid(valid)
		self.m_GatherValid = valid;
end
--------------------------------------------------
function AI_Helper:SetHpDelay(delay)
		self.m_hpCounter:SetPeriod(delay);
end
function AI_Helper:GetHpDelay()
	  return self.m_hpCounter:GetPeriod();
end
function AI_Helper:SetHpRate(rate)
		self.m_hpRate = rate*0.01;
end
function AI_Helper:GetHpRate()
		return self.m_hpRate*100;
end
function AI_Helper:SetMpDelay(delay)
		self.m_mpCounter:SetPeriod(delay);
end
function AI_Helper:GetMpDelay(delay)
		return self.m_mpCounter:GetPeriod();
end
function AI_Helper:SetMpRate(rate)
		self.m_mpRate = rate*0.01;
end
function AI_Helper:GetMpRate()
		return self.m_mpRate*100;
end
function AI_Helper:SetPetHpDelay(delay)
		self.m_petHpCounter:SetPeriod(delay);
end
function AI_Helper:GetPetHpDelay()
	  return self.m_petHpCounter:GetPeriod();
end
function AI_Helper:SetPetHpRate(rate)
		self.m_petHpRate = rate*0.01;
end
function AI_Helper:GetPetHpRate()
		return self.m_petHpRate*100;
end
function AI_Helper:SetPetHungerDelay(delay)
		self.m_petHungerCounter:SetPeriod(delay);
end
function AI_Helper:GetPetHungerDelay(delay)
		return self.m_petHungerCounter:GetPeriod();
end
function AI_Helper:SetPetHungerRate(rate)
		self.m_petHungerRate = rate*0.01;
end
function AI_Helper:GetPetHungerRate()
		return self.m_petHungerRate*100;
end
-----------------------------AI_Helper:Start------------------------------------
function AI_Helper:Start()
		self.m_x1,self.m_y1,self.m_z1 = GameAI.GetHostPos()     --ʼ
		local i
		for i=1,6 do
			self.m_skillCounter[i]:Reset();
		end
		self.m_status = false ;	
end

function AI_Helper:GetSkillDelay(index)
		if index == 1 then
				return self.m_skillCounter[1]:GetPeriod();
		elseif index == 2 then
				return self.m_skillCounter[2]:GetPeriod();
		elseif index == 3 then
				return self.m_skillCounter[3]:GetPeriod();
		elseif index == 4 then
				return self.m_skillCounter[4]:GetPeriod();
		elseif index == 5 then
				return self.m_skillCounter[5]:GetPeriod();
		elseif index == 6 then
				return self.m_skillCounter[6]:GetPeriod();
		else
				return 0;   --һֵʾ,ڸ߲ϵľṩ
		end		
end

function AI_Helper:SetSkillDelay(index, delay)
		if index == 1 then
				self.m_skillCounter[1]:SetPeriod(delay);
		elseif index == 2 then
				self.m_skillCounter[2]:SetPeriod(delay);
		elseif index == 3 then
				self.m_skillCounter[3]:SetPeriod(delay);
		elseif index == 4 then
				self.m_skillCounter[4]:SetPeriod(delay);
		elseif index == 5 then
				self.m_skillCounter[5]:SetPeriod(delay);
		elseif index == 6 then
				self.m_skillCounter[6]:SetPeriod(delay); 
		end		
end

-----------------------------AI_Helper:Tick-------------------------------------
function AI_Helper:Tick(dwPeriod)
		local hp,mp = GameAI.GetHostProp();
 	    local can_attack = GameAI.CanAttack();      			--ƺδѡ?
	    local target_id, target_hp = GameAI.GetTargetProp();    --ûѡ,Ժѽ?
	    local skillcounter = {};    --Ƿ㹻ļʱ
			self.m_pickValid 	= AI_Helper:IsPickValid() and GameAI.CanAutoPickUp();
			self.m_gatherValid 	= AI_Helper:IsGatherValid() and GameAI.CanAutoGather();
	    local j
	    for j=1,6 do 
	    	skillcounter[j] = self.m_skillCounter[j]:IncCounter(dwPeriod)   --true or false
	    end
--Ըҩ
	if self.m_reportCounter:IncCounter(dwPeriod) then   --ʱserver
			GameAI.Report2Svr();
			self.m_reportCounter:Reset();
	end
	

	local petList_summon, petList_combine = GameAI.GetActivePet()
	for i,v in pairs(petList_summon) do     --ٻ
		local petHp, petHunger = GameAI.GetPetProp(v);
		if petHunger and petHunger < self.m_petHungerRate and  self.m_petHungerCounter:IncCounter(dwPeriod) then
	   			GameAI.FeedPet(v);
				self.m_petHungerCounter:Reset();
		end
	end
	for i,v in pairs(petList_combine) do     --
		local petHp, petHunger = GameAI.GetPetProp(v);
		if petHunger and petHunger < self.m_petHungerRate and  self.m_petHungerCounter:IncCounter(dwPeriod) then
	   			GameAI.FeedPet(v);
				self.m_petHungerCounter:Reset();
		end
	end

	if not GameAI.IsAutoMoving() then   --ûԶƶ:
		local status = {}   --ʱ
		-- status[1] = is preparing pickup
		-- status[2] = is preparing skill
		-- status[3] = is casting spell
--Զɼ
        if self.m_gatherValid then
			if self.m_gatherCounter:IncCounter(dwPeriod) then     --Զɼ
				self.m_gatherCounter:Reset();
				GameAI.Gather();
				self.m_isGathering = true;
			end
		else
		    self.m_isGathering = false;
        end
--pickup
		if self.m_pickValid then
			if self.m_pickCounter:IncCounter(dwPeriod) then     --ʱͼ
				self.m_pickCounter:Reset();
				GameAI.PickUp();
			end
			if target_hp > 0.999 then       --ûͼ
     			GameAI.PickUp();
			end
		end

		if GameAI.IsPreparingPickingUp() then
			status[1] = true ;
		end
		if GameAI.IsPickingUp()  then
			status[1] = false;
		end
		
		if self.m_skillid ~= nil then   --м
			
			if GameAI.IsPreparingSkill(self.m_skillid) then
				status[2] = true ;
			end
			
			if self.m_status then
				status[2] = true ;
			end	
			
			if GameAI.IsUsingSkill(self.m_skillid)  then
				status[2] = false;
				status[3] = true;
			end
		end
		
--Ƿżܲ
		if self.m_isGathering == false then
			if (not status[1]) or (not GameAI.IsPreparingPickingUp()) and (not GameAI.IsPickingUp()) then
			--  ûڼ          û׼                            ûڼ  -.-
				if self.m_tabValid then
					if  self.m_tabCounter:IncCounter(dwPeriod) then
						self.m_tabCounter:Reset();
						if not can_attack and  target_hp == 0 then  --ɹhp=0,,ѡ¸
						    if self.m_pickValid then
								GameAI.PickUp();
							end
							GameAI.SelectMonster();
						end
					end
					if can_attack then  --Թ
						self.m_status = false ;
						if target_hp > 0.999 then
							self.m_tab2Counter:IncCounter(dwPeriod);
						else
							self.m_tab2Counter:Reset();
						end
						if self.m_tab2Counter:IsFull() then
							GameAI.SelectMonster();
							self.m_tab2Counter:Reset();
						end
						if (not status[2]) and (not status[3]) then     --û׼żܻڷż
							local i
							local tempList = {}
							for i = 6,1,-1 do
							    skillcounter[7], self.m_skillid =  GameAI.IsSkillAvailable(i)
							    --[[
								if skillcounter[i] and skillcounter[7] then
									if (not GameAI.IsSkillCooling(self.m_skillid)) and  GameAI.CheckSkillCastCondition(self.m_skillid) then
									    GameAI.UseSkill(i);
									    self.m_skillCounter[i]:Reset();
										self.m_status = true ;
										break;
			                        else
									    GameAI.NormalAttack();
									end
								else
									GameAI.NormalAttack();
								end
								]]--
				                skillcounter[7],self.m_skillid =  GameAI.IsSkillAvailable(i)
								if skillcounter[i] and skillcounter[7] then
									if (not GameAI.IsSkillCooling(self.m_skillid)) and GameAI.CheckSkillCastCondition(self.m_skillid) then
									    table.insert(tempList, i)
										break;
									end
								end
							end
							if #tempList > 0 then
							    local idx = tempList[math.random(#tempList)]
							    GameAI.UseSkill(idx)
							    self.m_skillCounter[idx]:Reset()
								self.m_status = true
							else
							    GameAI.NormalAttack()
							end
						end
					end
				end

				if not self.m_tabValid then
					if can_attack or target_id then
						self.m_status = false ;
						if (not status[2]) and (not status[3]) then     --û׼ʩż
							local i
							local tempList = {}
				            for i = 6,1,-1 do
				                skillcounter[7],self.m_skillid =  GameAI.IsSkillAvailable(i)
								if skillcounter[i] and skillcounter[7] then
									if (not GameAI.IsSkillCooling(self.m_skillid)) and GameAI.CheckSkillCastCondition(self.m_skillid) then
									    table.insert(tempList, i)
										break;
									end
								end
							end
							if #tempList > 0 then
							    local idx = tempList[math.random(#tempList)]
							    GameAI.UseSkill(idx)
							    self.m_skillCounter[idx]:Reset()
								self.m_status = true
							else
							    GameAI.NormalAttack()
							end
						end
					end
				end
			end
		end
	end
	
--Զƶѡ
	if self.m_isGathering == false and GameAI.IsAutoMoving() then
		if self.m_tabCounter:IncCounter(dwPeriod) then
			self.m_tabCounter:Reset();
			GameAI.SelectMonster();
		end	
	end	

--λж
	if not self.m_anchorValid then
		self.m_tab4Counter:Reset();
	end	
	if self.m_anchorValid then
		if not self.m_tab4Counter:IncCounter(dwPeriod) then
			self.m_x1,self.m_y1,self.m_z1 = GameAI.GetHostPos()
		end	
		local x1,y1,z1 = GameAI.GetHostPos()
			if (self.m_x1-x1)^2+(self.m_z1-z1)^2 > 900 then     --30׷Χ
				GameAI.StartAutoMove(self.m_x1,self.m_y1,self.m_z1)
			end
    	if GameAI.IsAutoMoving() then
        	self.m_tab3Counter:IncCounter(dwPeriod);
		else
        	self.m_tab3Counter:Reset();
		end
		if self.m_isGathering == false and self.m_tab3Counter:IsFull() then
			GameAI.SelectMonster();
			GameAI.NormalAttack();
			self.m_tab3Counter:Reset();
		end
	end
end