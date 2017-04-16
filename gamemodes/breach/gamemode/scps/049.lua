local obj = scp:Start ("SCP 049", CLASS_KETER)

function obj:PlayerSpawn (pActor)
	self:OnPlayerSpawnBase (pActor)

	pActor.handsmodel = nil
	pActor:SetPos(SPAWN_049)
	pActor:SetNClass(ROLE_SCP049)
	pActor:SetModel("models/vinrax/player/scp049_player.mdl")
	pActor:SetHealth(1400)
	pActor:SetMaxHealth(1400)
	pActor:SetArmor(0)
	pActor:SetWalkSpeed(140)
	pActor:SetRunSpeed(140)
	pActor:SetMaxSpeed(140)
	pActor:SetJumpPower(200)
	pActor:SetNoDraw(false)
	pActor:SetNoCollideWithTeammates(false)
	pActor.Active = true
	pActor:SetupHands()
	pActor:AllowFlashlight( false )
	pActor.WasTeam = TEAM_SCP
	pActor:SetNoTarget( true )
	pActor:Give("weapon_scp_049")
	pActor:SelectWeapon("weapon_scp_049")
end