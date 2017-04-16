local obj = scp:Start ("SCP 457", CLASS_KETER)

function obj:PlayerSpawn (pActor)
	self:OnPlayerSpawnBase (pActor)

	pActor:SetPos(SPAWN_457)
	pActor:SetNClass(ROLE_SCP457)
	pActor:SetModel("models/player/corpse1.mdl")
	pActor:SetMaterial( "models/flesh", false )
	pActor:SetHealth(1700)
	pActor:SetMaxHealth(1700)
	pActor:SetArmor(0)
	pActor:SetWalkSpeed(135)
	pActor:SetRunSpeed(135)
	pActor:SetMaxSpeed(135)
	pActor:SetJumpPower(190)
	pActor:SetNoDraw(false)
	pActor:SetNoCollideWithTeammates(false)
	pActor.Active = true
	pActor:SetupHands()
	pActor:Give("weapon_scp_457")
	pActor:SelectWeapon("weapon_scp_457")
end