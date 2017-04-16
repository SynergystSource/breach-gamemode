local obj = scp:Start ("SCP 173", CLASS_EUCLID)


function obj:OnPlayerSpawn (pActor)
	self:OnPlayerSpawnBase (pActor)

	pActor.handsmodel = nil
	pActor:SetPos(SPAWN_173)
	pActor:SetNClass(ROLE_SCP173)
	pActor:SetModel("models/breach173.mdl")
	pActor:SetHealth(1700)
	pActor:SetMaxHealth(1700)
	pActor:SetArmor(0)
	pActor:SetWalkSpeed(350)
	pActor:SetRunSpeed(350)
	pActor:SetMaxSpeed(350)
	pActor:SetJumpPower(200)
	pActor:SetNoDraw(false)
	pActor:SetNoCollideWithTeammates(false)
	pActor.Active = true
	pActor:SetupHands()
	pActor:AllowFlashlight( false )
	pActor.WasTeam = TEAM_SCP
	pActor:SetNoTarget( true )
	pActor:Give("weapon_scp_173")
	pActor:SelectWeapon("weapon_scp_173")
end