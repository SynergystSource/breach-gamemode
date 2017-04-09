
local mply = FindMetaTable( "Player" )

// just for finding a bad spawns :p
function mply:FindClosest(tab, num)
	local allradiuses = {}
	for k,v in pairs(tab) do
		table.ForceInsert(allradiuses, {v:Distance(self:GetPos()), v})
	end
	table.sort( allradiuses, function( a, b ) return a[1] < b[1] end )
	local rtab = {}
	for i=1, num do
		if i <= #allradiuses then
			table.ForceInsert(rtab, allradiuses[i])
		end
	end
	return rtab
end

function mply:GiveRandomWep(tab)
	local mainwep = table.Random(tab)
	self:Give(mainwep)
	local getwep = self:GetWeapon(mainwep)
	if getwep.Primary == nil then
		print("ERROR: weapon: " .. mainwep)
		print(getwep)
		return
	end
	getwep:SetClip1(getwep.Primary.ClipSize)
	self:SelectWeapon(mainwep)
	self:GiveAmmo((getwep.Primary.ClipSize * 4), getwep.Primary.Ammo, false)
end

function mply:ReduceKarma(amount)
	if KarmaEnabled() == false then return end
	self.Karma = math.Clamp((self.Karma - amount), 1, MaxKarma())
end

function mply:AddKarma(amount)
	if KarmaEnabled() == false then return end
	self.Karma = math.Clamp((self.Karma + amount), 1, MaxKarma())
end

function mply:SetKarma(amount)
	if KarmaEnabled() == false then return end
	self.Karma = math.Clamp(amount, 1, MaxKarma())
end

function mply:UpdateNKarma()
	if KarmaEnabled() == false then return end
	if self.SetNKarma != nil then
		self:SetNKarma(self.Karma)
	end
end

function mply:SaveKarma()
	if KarmaEnabled() == false then return end
	if SaveKarma() == false then return end
	self:SetPData( "breach_karma", self.Karma )
end

function mply:GiveNTFwep()
	self:GiveRandomWep({"weapon_chaos_famas", "weapon_mtf_ump45"})
end

function mply:GiveMTFwep()
	self:GiveRandomWep({"weapon_mtf_tmp", "weapon_mtf_ump45", "weapon_mtf_p90"})
end

function mply:GiveCIwep()
	self:GiveRandomWep({"weapon_chaos_famas", "weapon_chaos_ak47", "weapon_chaos_m249"})
end

function mply:DeleteItems()
	for k,v in pairs(ents.FindInSphere( self:GetPos(), 150 )) do
		if v:IsWeapon() then
			if !IsValid(v.Owner) then
				v:Remove()
			end
		end
	end
end

function mply:MTFArmor()
	self.BaseStats = {
		wspeed = self:GetWalkSpeed(),
		rspeed = self:GetRunSpeed(),
		jpower = self:GetJumpPower(),
		 model = "models/player/kerry/class_scientist_"..math.random(1,7)..".mdl"
	}
	self:SetWalkSpeed(self.BaseStats.wspeed * 0.85)
	self:SetRunSpeed(self.BaseStats.rspeed * 0.85)
	self:SetJumpPower(self.BaseStats.jpower * 0.85)
	self:SetModel("models/player/kerry/class_securety.mdl")
	self.UsingArmor = "armor_mtfguard"
end

function mply:MTFComArmor()
	self.BaseStats = {
		wspeed = self:GetWalkSpeed(),
		rspeed = self:GetRunSpeed(),
		jpower = self:GetJumpPower(),
		 model = "models/player/kerry/class_scientist_"..math.random(1,7)..".mdl"
	}
	self:SetWalkSpeed(self.BaseStats.wspeed * 0.90)
	self:SetRunSpeed(self.BaseStats.rspeed * 0.90)
	self:SetJumpPower(self.BaseStats.jpower * 0.90)
	self:SetModel("models/player/riot.mdl")
	self.UsingArmor = "armor_mtfcom"
end

function mply:NTFArmor()
	self.BaseStats = {
		wspeed = self:GetWalkSpeed(),
		rspeed = self:GetRunSpeed(),
		jpower = self:GetJumpPower(),
		 model = "models/player/kerry/class_scientist_"..math.random(1,7)..".mdl"
	}
	self:SetWalkSpeed(self.BaseStats.wspeed * 0.85)
	self:SetRunSpeed(self.BaseStats.rspeed * 0.85)
	self:SetJumpPower(self.BaseStats.jpower * 0.85)
	self:SetModel("models/player/urban.mdl")
	self.UsingArmor = "armor_ntf"
end

function mply:ChaosInsArmor()
	self.BaseStats = {
		wspeed = self:GetWalkSpeed(),
		rspeed = self:GetRunSpeed(),
		jpower = self:GetJumpPower(),
		 model = "models/player/kerry/class_scientist_"..math.random(1,7)..".mdl"
	}
	self:SetWalkSpeed(self.BaseStats.wspeed * 0.86)
	self:SetRunSpeed(self.BaseStats.rspeed * 0.86)
	self:SetJumpPower(self.BaseStats.jpower * 0.86)
	self:SetModel("models/mw2/skin_04/mw2_soldier_04.mdl")
	self.UsingArmor = "armor_chaosins"
end

function mply:UnUseArmor()
	if self.UsingArmor == nil then return end
	self:SetWalkSpeed(self.BaseStats.wspeed)
	self:SetRunSpeed(self.BaseStats.rspeed)
	self:SetJumpPower(self.BaseStats.jpower)
	self:SetModel(self.BaseStats.model)
	local item = ents.Create( self.UsingArmor )
	if IsValid( item ) then
		item:Spawn()
		item:SetPos( self:GetPos() )
		self:EmitSound( Sound("npc/combine_soldier/zipline_clothing".. math.random(1, 2).. ".wav") )
	end
	self.UsingArmor = nil
end

function mply:SetSpectator()
	self.handsmodel = nil
	self:Spectate(6)
	self:StripWeapons()
	self:RemoveAllAmmo()
	self:SetTeam(TEAM_SPEC)
	self:SetNoDraw(true)
	self:SetNoCollideWithTeammates(true)
	if self.SetNClass then
		self:SetNClass(ROLE_SPEC)
	end
	self.Active = true
	print("adding " .. self:Nick() .. " to spectators")
	self.canblink = false
	self:AllowFlashlight( false )
	self:SetNoTarget( true )
	self.BaseStats = nil
	self.UsingArmor = nil
	//self:Spectate(OBS_MODE_IN_EYE)
end

function mply:SetClassD()
	self.handsmodel = nil
	self:UnSpectate()
	self:GodDisable()
	self:Spawn()
	self:StripWeapons()
	self:RemoveAllAmmo()
	self:SetTeam(TEAM_CLASSD)
	self:SetModel("models/player/kerry/class_d_"..math.random(1,7)..".mdl")
	self:SetHealth(100)
	self:SetMaxHealth(100)
	self:SetArmor(0)
	self:SetWalkSpeed(120)
	self:SetRunSpeed(240)
	self:SetMaxSpeed(240)
	self:SetJumpPower(200)
	self:SetNoDraw(false)
	self:SetNoCollideWithTeammates(false)
	self:SetNClass(ROLE_CLASSD)
	self.Active = true
	self:SetupHands()
	self.canblink = true
	self:AllowFlashlight( false )
	self.WasTeam = TEAM_CLASSD
	self:SetNoTarget( false )
	self.BaseStats = nil
	self.UsingArmor = nil
end

function mply:SetScientist()
	self.handsmodel = nil
	self:UnSpectate()
	self:GodDisable()
	self:Spawn()
	self:StripWeapons()
	self:RemoveAllAmmo()
	self:SetTeam(TEAM_SCI)
	self:SetModel("models/player/kerry/class_scientist_"..math.random(1,7)..".mdl")
	self:SetHealth(100)
	self:SetMaxHealth(100)
	self:SetArmor(0)
	self:SetWalkSpeed(120)
	self:SetRunSpeed(240)
	self:SetMaxSpeed(240)
	self:SetJumpPower(200)
	self:SetNoDraw(false)
	self:SetNoCollideWithTeammates(false)
	self:SetNClass(ROLE_RES)
	self.Active = true
	self:SetupHands()
	self.canblink = true
	self:AllowFlashlight( true )
	self.WasTeam = TEAM_SCI
	self:SetNoTarget( false )
	self:Give("keycard_level2")
	self.BaseStats = nil
	self.UsingArmor = nil
end

function mply:SetCommander()
	self.handsmodel = nil
	self:UnSpectate()
	self:GodDisable()
	self:Spawn()
	self:StripWeapons()
	self:RemoveAllAmmo()
	self:SetTeam(TEAM_GUARD)
	//self:SetModel("models/player/riot.mdl")
	self:SetHealth(100)
	self:SetMaxHealth(100)
	self:SetWalkSpeed(120)
	self:SetRunSpeed(240)
	self:SetMaxSpeed(240)
	self:SetJumpPower(200)
	self:SetNoDraw(false)
	self:SetNoCollideWithTeammates(false)
	self:SetNClass(ROLE_MTFCOM)
	self.Active = true
	self:Give("keycard_level4")
	self:Give("item_medkit")
	self:Give("weapon_stunstick")
	self:Give("weapon_mtf_mp5")
	self:Give("item_radio")
	self:GetWeapon("weapon_mtf_mp5"):SetClip1(30)
	self:SelectWeapon("weapon_mtf_mp5")
	self:GiveAmmo(150, "SMG1", false)
	self:SetupHands()
	self.canblink = true
	self:AllowFlashlight( true )
	self.WasTeam = TEAM_GUARD
	self:SetNoTarget( false )
	self:MTFComArmor()
end

function mply:SetGuard()
	self.handsmodel = nil
	self:UnSpectate()
	self:GodDisable()
	self:Spawn()
	self:StripWeapons()
	self:RemoveAllAmmo()
	self:SetTeam(TEAM_GUARD)
	//self:SetModel("models/player/swat.mdl")
	self:SetHealth(100)
	self:SetMaxHealth(100)
	self:SetWalkSpeed(120)
	self:SetRunSpeed(240)
	self:SetMaxSpeed(240)
	self:SetJumpPower(200)
	self:SetNoDraw(false)
	self:SetNoCollideWithTeammates(false)
	self:SetNClass(ROLE_MTFGUARD)
	self.Active = true
	self:Give("keycard_level3")
	self:Give("weapon_stunstick")
	self:Give("item_radio")
	self:GiveMTFwep()
	self:SetupHands()
	//PrintTable(debug.getinfo( self.SetupHands ))
	self.canblink = true
	self:AllowFlashlight( true )
	self.WasTeam = TEAM_GUARD
	self:SetNoTarget( false )
	self:MTFArmor()
end

function mply:SetChaosInsurgency(stealth)
	self.handsmodel = {
		model = "models/weapons/c_arms_cstrike.mdl",
		body = 10000000,
		skin = 0
	}
	self:UnSpectate()
	self:GodDisable()
	self:Spawn()
	self:StripWeapons()
	self:RemoveAllAmmo()
	self:SetTeam(TEAM_CHAOS)
	self:SetHealth(100)
	self:SetMaxHealth(100)
	self:SetArmor(25)
	self:SetWalkSpeed(120)
	self:SetRunSpeed(240)
	self:SetMaxSpeed(240)
	self:SetJumpPower(200)
	self:SetNoDraw(false)
	self:SetNoCollideWithTeammates(false)
	self.Active = true
	self:Give("weapon_slam")
	self:Give("weapon_stunstick")
	self:Give("item_radio")
	if stealth == 1 then
		//self:SetModel("models/player/swat.mdl")
		self:MTFArmor()
		self:Give("keycard_level3")
		self:GiveMTFwep()
		self:SetNClass(ROLE_MTFGUARD)
	elseif stealth == 2 then
		//self:SetModel("models/player/urban.mdl")
		self:NTFArmor()
		self:Give("keycard_level4")
		self:GiveNTFwep()
		self:SetNClass(ROLE_MTFNTF)
	else
		self:GiveCIwep()
		self:Give("keycard_omni")
		//self:SetModel("models/mw2/skin_04/mw2_soldier_04.mdl")
		self:ChaosInsArmor()
		if stealth == 3 then
			self:SetNClass(ROLE_MTFNTF)
		else
			self:SetNClass(ROLE_CHAOS)
		end
	end
	self:SetupHands()
	self.canblink = true
	self:AllowFlashlight( true )
	self.WasTeam = TEAM_CHAOS
	self:SetNoTarget( false )
end

function mply:SetChaosInsCom(spawn)
	self.handsmodel = {
		model = "models/weapons/c_arms_cstrike.mdl",
		body = 10000000,
		skin = 0
	}
	self:UnSpectate()
	self:GodDisable()
	local lpos = self:GetPos()
	if spawn == true then
		self:Spawn()
		self:SetPos(lpos)
	else
		self:Spawn()
	end
	self:StripWeapons()
	self:RemoveAllAmmo()
	self:SetTeam(TEAM_CHAOS)
	self:SetHealth(100)
	self:SetMaxHealth(100)
	self:SetArmor(25)
	self:SetWalkSpeed(135)
	self:SetRunSpeed(255)
	self:SetMaxSpeed(255)
	self:SetJumpPower(200)
	self:SetNoDraw(false)
	self:SetNoCollideWithTeammates(false)
	self.Active = true
	self:Give("weapon_slam")
	self:Give("weapon_stunstick")
	self:Give("item_radio")
	self:Give("keycard_omni")
	self:GiveCIwep()
	self:SetModel("models/mw2/skin_05/mw2_soldier_04.mdl")
	self:SetBodyGroups( "1411" )
	self:SetupHands()
	self.canblink = true
	self:AllowFlashlight( true )
	self.WasTeam = TEAM_CHAOS
	self:SetNClass(ROLE_CHAOSCOM)
	self:SetNoTarget( false )
end

function mply:SetSiteDirector(spawn)
	self:UnSpectate()
	self:GodDisable()
	local lpos = self:GetPos()
	if spawn == true then
		self:Spawn()
		self:SetPos(lpos)
	else
		self:Spawn()
	end
	self:StripWeapons()
	self:RemoveAllAmmo()
	self:SetTeam(TEAM_ADMIN)
	self:SetHealth(100)
	self:SetMaxHealth(100)
	self:SetWalkSpeed(135)
	self:SetRunSpeed(255)
	self:SetMaxSpeed(255)
	self:SetJumpPower(200)
	self:SetNoDraw(false)
	self:SetNoCollideWithTeammates(false)
	self.Active = true
	self:Give("item_radio")
	self:Give("keycard_omni")
	self:Give("weapon_mtf_deagle")
	self:GiveAmmo(35, "Pistol", false)
	self:SetModel("models/player/breen.mdl")
	self:SetPlayerColor( Vector(0,0,0) )
	self:SetupHands()
	self.canblink = true
	self:AllowFlashlight( true )
	self.WasTeam = TEAM_ADMIN
	self:SetNClass(ROLE_SITEDIRECTOR)
	self:SetNoTarget( false )
end

function mply:SetNTF()
	self.handsmodel = nil
	self:UnSpectate()
	self:GodDisable()
	self:Spawn()
	self:StripWeapons()
	self:RemoveAllAmmo()
	self:SetTeam(TEAM_GUARD)
	self:SetModel("models/player/urban.mdl")
	self:SetHealth(100)
	self:SetMaxHealth(100)
	self:SetArmor(25)
	self:SetWalkSpeed(120)
	self:SetRunSpeed(240)
	self:SetMaxSpeed(240)
	self:SetJumpPower(200)
	self:SetNoDraw(false)
	self:SetNoCollideWithTeammates(false)
	self:SetNClass(ROLE_MTFNTF)
	self.Active = true
	self:Give("keycard_level4")
	self:Give("weapon_stunstick")
	self:Give("item_radio")
	self:GiveNTFwep()
	self:SetupHands()
	self.canblink = true
	self:AllowFlashlight( true )
	self.WasTeam = TEAM_GUARD
	self:SetNoTarget( false )
	net.Start("RolesSelected")
	net.Send(self)
	self:NTFArmor()
end

function mply:SetSCP173()
	self.handsmodel = nil
	self:UnSpectate()
	self:GodDisable()
	self:Spawn()
	self:SetPos(SPAWN_173)
	self:StripWeapons()
	self:RemoveAllAmmo()
	self:SetTeam(TEAM_SCP)
	self:SetNClass(ROLE_SCP173)
	self:SetModel("models/breach173.mdl")
	self:SetHealth(1700)
	self:SetMaxHealth(1700)
	self:SetArmor(0)
	self:SetWalkSpeed(350)
	self:SetRunSpeed(350)
	self:SetMaxSpeed(350)
	self:SetJumpPower(200)
	self:SetNoDraw(false)
	self:SetNoCollideWithTeammates(false)
	self.Active = true
	self:SetupHands()
	self.canblink = false
	self:AllowFlashlight( false )
	self.WasTeam = TEAM_SCP
	self:SetNoTarget( true )
	self:Give("weapon_scp_173")
	self:SelectWeapon("weapon_scp_173")
	self.BaseStats = nil
	self.UsingArmor = nil
end

function mply:SetSCP106()
	self.handsmodel = nil
	self:UnSpectate()
	self:GodDisable()
	self:Spawn()
	self:SetPos(SPAWN_106)
	self:StripWeapons()
	self:RemoveAllAmmo()
	self:SetTeam(TEAM_SCP)
	self:SetNClass(ROLE_SCP106)
	self:SetModel("models/vinrax/player/scp106_player.mdl")
	self:SetHealth(1700)
	self:SetMaxHealth(1700)
	self:SetArmor(0)
	self:SetWalkSpeed(165)
	self:SetRunSpeed(165)
	self:SetMaxSpeed(165)
	self:SetJumpPower(200)
	self:SetNoDraw(false)
	self:SetNoCollideWithTeammates(false)
	self.Active = true
	self:SetupHands()
	self.canblink = false
	self:AllowFlashlight( false )
	self.WasTeam = TEAM_SCP
	self:SetNoTarget( true )
	self:Give("weapon_scp_106")
	self:SelectWeapon("weapon_scp_106")
	self.BaseStats = nil
	self.UsingArmor = nil
end

function mply:SetSCP049()
	self.handsmodel = nil
	self:UnSpectate()
	self:GodDisable()
	self:Spawn()
	self:SetPos(SPAWN_049)
	self:StripWeapons()
	self:RemoveAllAmmo()
	self:SetTeam(TEAM_SCP)
	self:SetNClass(ROLE_SCP049)
	self:SetModel("models/vinrax/player/scp049_player.mdl")
	self:SetHealth(1400)
	self:SetMaxHealth(1400)
	self:SetArmor(0)
	self:SetWalkSpeed(140)
	self:SetRunSpeed(140)
	self:SetMaxSpeed(140)
	self:SetJumpPower(200)
	self:SetNoDraw(false)
	self:SetNoCollideWithTeammates(false)
	self.Active = true
	self:SetupHands()
	self.canblink = false
	self:AllowFlashlight( false )
	self.WasTeam = TEAM_SCP
	self:SetNoTarget( true )
	self:Give("weapon_scp_049")
	self:SelectWeapon("weapon_scp_049")
	self.BaseStats = nil
	self.UsingArmor = nil
end

function mply:SetSCP457()
	self.handsmodel = nil
	self:UnSpectate()
	self:GodDisable()
	self:Spawn()
	self:SetPos(SPAWN_457)
	self:StripWeapons()
	self:RemoveAllAmmo()
	self:SetTeam(TEAM_SCP)
	self:SetNClass(ROLE_SCP457)
	self:SetModel("models/player/corpse1.mdl")
	//self:SetMaterial( "models/flesh", false )
	self:SetHealth(1700)
	self:SetMaxHealth(1700)
	self:SetArmor(0)
	self:SetWalkSpeed(135)
	self:SetRunSpeed(135)
	self:SetMaxSpeed(135)
	self:SetJumpPower(190)
	self:SetNoDraw(false)
	self:SetNoCollideWithTeammates(false)
	self.Active = true
	self:SetupHands()
	self.canblink = false
	self:AllowFlashlight( false )
	self.WasTeam = TEAM_SCP
	self:SetNoTarget( true )
	self:Give("weapon_scp_457")
	self:SelectWeapon("weapon_scp_457")
	self.BaseStats = nil
	self.UsingArmor = nil
end

function mply:DropWep(class, clip)
	local wep = ents.Create( class )
	if IsValid( wep ) then
		wep:SetPos( self:GetPos() )
		wep:Spawn()
		if isnumber(clip) then
			wep:SetClip1(clip)
		end
	end
end

function mply:SetSCP0082()
	self.handsmodel = nil
	self:UnSpectate()
	self:GodDisable()
	self:SetTeam(TEAM_SCP)
	self:SetModel("models/player/zombie_classic.mdl")
	self:SetHealth(850)
	self:SetMaxHealth(850)
	self:SetArmor(0)
	self:SetWalkSpeed(160)
	self:SetRunSpeed(160)
	self:SetMaxSpeed(160)
	self:SetJumpPower(200)
	self:SetNoDraw(false)
	self:SetNoCollideWithTeammates(false)
	self:SetNClass(ROLE_SCP0082)
	self.Active = true
	print("adding " .. self:Nick() .. " to zombies")
	self:SetupHands()
	WinCheck()
	self.canblink = false
	self:AllowFlashlight( false )
	self.WasTeam = TEAM_SCP
	self:SetNoTarget( true )
	net.Start("RolesSelected")
	net.Send(self)
	if #self:GetWeapons() > 0 then
		local pos = self:GetPos()
		for k,v in pairs(self:GetWeapons()) do
			local wep = ents.Create( v:GetClass() )
			if IsValid( wep ) then
				wep:SetPos( pos )
				wep:Spawn()
				wep:SetClip1(v:Clip1())
			end
			self:StripWeapon(v:GetClass())
		end
	end
	self:Give("weapon_br_zombie_infect")
	self:SelectWeapon("weapon_br_zombie_infect")
	self.BaseStats = nil
	self.UsingArmor = nil
end

function mply:SetSCP0492()
	self.handsmodel = nil
	self:UnSpectate()
	self:GodDisable()
	self:SetTeam(TEAM_SCP)
	self:SetModel("models/player/zombie_classic.mdl")
	self:SetHealth(750)
	self:SetMaxHealth(750)
	self:SetArmor(0)
	self:SetWalkSpeed(160)
	self:SetRunSpeed(160)
	self:SetMaxSpeed(160)
	self:SetJumpPower(200)
	self:SetNoDraw(false)
	self:SetNoCollideWithTeammates(false)
	self:SetNClass(ROLE_SCP0492)
	self.Active = true
	print("adding " .. self:Nick() .. " to zombies")
	self:SetupHands()
	WinCheck()
	self.canblink = false
	self:AllowFlashlight( false )
	self.WasTeam = TEAM_SCP
	self:SetNoTarget( true )
	net.Start("RolesSelected")
	net.Send(self)
	if #self:GetWeapons() > 0 then
		local pos = self:GetPos()
		for k,v in pairs(self:GetWeapons()) do
			local wep = ents.Create( v:GetClass() )
			if IsValid( wep ) then
				wep:SetPos( pos )
				wep:Spawn()
				wep:SetClip1(v:Clip1())
			end
			self:StripWeapon(v:GetClass())
		end
	end
	self:Give("weapon_br_zombie")
	self:SelectWeapon("weapon_br_zombie")
	self.BaseStats = nil
	self.UsingArmor = nil
end

function mply:IsActivePlayer()
	return self.Active
end

hook.Add( "KeyPress", "keypress_spectating", function( ply, key )
	if ply:Team() != TEAM_SPEC then return end
	if ( key == IN_ATTACK ) then
		ply:SpectatePlayerLeft()
	elseif ( key == IN_ATTACK2 ) then
		ply:SpectatePlayerRight()
	elseif ( key == IN_RELOAD ) then
		ply:ChangeSpecMode()
	end
end )

function mply:SpectatePlayerRight()
	if !self:Alive() then return end
	if self:GetObserverMode() != OBS_MODE_IN_EYE and
	   self:GetObserverMode() != OBS_MODE_CHASE 
	then return end
	self:SetNoDraw(true)
	local allply = GAMEMODE.Info.GetAlivePlayers ()
	if #allply == 1 then return end
	if not self.SpecPly then
		self.SpecPly = 0
	end
	self.SpecPly = self.SpecPly - 1
	if self.SpecPly < 1 then
		self.SpecPly = #allply 
	end
	for k,v in pairs(allply) do
		if k == self.SpecPly then
			self:SpectateEntity( v )
		end
	end
end

function mply:SpectatePlayerLeft()
	if !self:Alive() then return end
	if self:GetObserverMode() != OBS_MODE_IN_EYE and
	   self:GetObserverMode() != OBS_MODE_CHASE 
	then return end
	self:SetNoDraw(true)
	local allply = GAMEMODE.Info.GetAlivePlayers ()
	if #allply == 1 then return end
	if not self.SpecPly then
		self.SpecPly = 0
	end
	self.SpecPly = self.SpecPly + 1
	if self.SpecPly > #allply then
		self.SpecPly = 1
	end
	for k,v in pairs(allply) do
		if k == self.SpecPly then
			self:SpectateEntity( v )
		end
	end
end

function mply:ChangeSpecMode()
	if !self:Alive() then return end
	if !(self:Team() == TEAM_SPEC) then return end
	self:SetNoDraw(true)
	local m = self:GetObserverMode()
	local allply = #GAMEMODE.Info.GetAlivePlayers ()
	if allply < 2 then
		self:Spectate(OBS_MODE_ROAMING)
		return
	end
	/*
	if m == OBS_MODE_CHASE then
		self:Spectate(OBS_MODE_IN_EYE)
	else
		self:Spectate(OBS_MODE_CHASE)
	end
	*/
	
	if m == OBS_MODE_IN_EYE then
		self:Spectate(OBS_MODE_CHASE)
		self:SpectatePlayerLeft()
	elseif m == OBS_MODE_CHASE then
		self:Spectate(OBS_MODE_ROAMING)
	elseif m == OBS_MODE_ROAMING then
		self:Spectate(OBS_MODE_IN_EYE)
		self:SpectatePlayerLeft()
	else
		self:Spectate(OBS_MODE_ROAMING)
	end
	
end



