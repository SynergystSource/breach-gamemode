local obj = scp:Start ("SCP 106", CLASS_KETER)

function obj:OnPlayerSpawn (pActor)
	self:OnPlayerSpawnBase (pActor)

	pActor:SetPos(SPAWN_106)
	pActor:SetNClass(ROLE_SCP106)
	pActor:SetModel("models/vinrax/player/scp106_player.mdl")
	pActor:SetHealth(1700)
	pActor:SetMaxHealth(1700)
	pActor:SetArmor(0)
	pActor:SetWalkSpeed(100)
	pActor:SetRunSpeed(100)
	pActor:SetMaxSpeed(100)
	pActor:SetJumpPower(200)
	pActor:SetNoDraw(false)
	pActor:SetNoCollideWithTeammates(false)
	pActor.Active = true
	pActor:SetupHands()
	pActor:Give("weapon_scp_106")
	pActor:SelectWeapon("weapon_scp_106")

	-- self.ambience = ents.Create ("106_amb")
	-- self.ambience:SetPos    (self:GetPos())
	-- self.ambience:SetOwner  (self)
	-- self.ambience:SetParent (self)
	-- self.ambience:Spawn     ()
	-- self.ambience:Activate  ()
end

-- function obj:OnRoundStart (pActor)
-- 	if pActor then return end
-- 	tblPlys = player.GetAll ()
-- 
-- 	local b106 = false
-- 	for i = 1, #tblPlys do
-- 		ply = tblPlys [i]
-- 		if ply:GetNClass () == ROLE_SCP106 then
-- 			b106 = true
-- 			break
-- 		end
-- 	end
-- 
-- 	if not b106 then
-- 		scp = ents.Create ("106")
-- 		scp:Spawn    ()
-- 		scp:Activate ()
-- 		scp:SetPos   (SPAWN_106)
-- 	end
-- end

-- function obj:OnPlayerDeath (pActor)
-- 	if pActor.ambience then
-- 		pActor.ambience:Remove ()
-- 		pActor.ambience = nil
-- 	end
-- end
-- 
-- obj.OnRoundFinish =  obj.OnPlayerDeath