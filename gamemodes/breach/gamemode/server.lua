util.AddNetworkString("PlayerBlink")
util.AddNetworkString("DropWeapon")
util.AddNetworkString("RequestGateA")
util.AddNetworkString("RequestEscorting")
util.AddNetworkString("PrepStart")
util.AddNetworkString("RoundStart")
util.AddNetworkString("PostStart")
util.AddNetworkString("RolesSelected")
util.AddNetworkString("SendRoundInfo")
util.AddNetworkString("Sound_Random")
util.AddNetworkString("Sound_Searching")
util.AddNetworkString("Sound_Classd")
util.AddNetworkString("Sound_Stop")
util.AddNetworkString("Sound_Lost")
util.AddNetworkString("UpdateRoundType")
util.AddNetworkString("ForcePlaySound")
util.AddNetworkString("OnEscaped")
util.AddNetworkString("SlowPlayerBlink")
util.AddNetworkString("DropCurrentVest")
util.AddNetworkString("RoundRestart")
util.AddNetworkString("SpectateMode")
util.AddNetworkString("UpdateTime")

net.Receive( "SpectateMode", function( len, ply )
	if ply.ActivePlayer == true then
		if ply:Alive() and ply:Team() != TEAM_SPEC then
			ply:SetSpectator()
		end
		ply.ActivePlayer = false
		ply:PrintMessage(HUD_PRINTTALK, "Changed mode to spectator")
	elseif ply.ActivePlayer == false then
		ply.ActivePlayer = true
		ply:PrintMessage(HUD_PRINTTALK, "Changed mode to player")
	end
	CheckStart()
end)

net.Receive( "RoundRestart", function( len, ply )
	if ply:IsSuperAdmin() then
		RoundRestart()
	end
end)

net.Receive( "Sound_Random", function( len, ply )
	PlayerNTFSound("Random"..math.random(1,4)..".ogg", ply)
end)

net.Receive( "Sound_Searching", function( len, ply )
	PlayerNTFSound("Searching"..math.random(1,6)..".ogg", ply)
end)

net.Receive( "Sound_Classd", function( len, ply )
	PlayerNTFSound("ClassD"..math.random(1,4)..".ogg", ply)
end)

net.Receive( "Sound_Stop", function( len, ply )
	PlayerNTFSound("Stop"..math.random(2,6)..".ogg", ply)
end)

net.Receive( "Sound_Lost", function( len, ply )
	PlayerNTFSound("TargetLost"..math.random(1,3)..".ogg", ply)
end)

net.Receive( "DropCurrentVest", function( len, ply )
	if ply:Team() != TEAM_SPEC and ply:Team() != TEAM_SCP and ply:Alive() then
		if ply.UsingArmor != nil then
			print(ply)
			ply:UnUseArmor()
		end
	end
end)

net.Receive( "RequestEscorting", function( len, ply )
	if ply:Team() == TEAM_GUARD then
		CheckEscortMTF(ply)
	elseif ply:Team() == TEAM_CHAOS then
		CheckEscortChaos(ply)
	end
end)


net.Receive( "RequestGateA", function( len, ply )
	GAMEMODE.Actions.RequestOpenGateA(ply)
end)

net.Receive( "DropWeapon", function( len, ply )
	local wep = ply:GetActiveWeapon()
	if ply:Team() == TEAM_SPEC then return end
	if IsValid(wep) and wep != nil and IsValid(ply) then
		if wep.Primary then
			if wep.Primary.Ammo != "none" then
				wep.SavedAmmo = wep:Clip1()
			end
		end
		
		if wep:GetClass() == nil then return end
		if wep.droppable != nil then
			if wep.droppable == false then return end
		end
		ply:DropWeapon( wep )
		ply:ConCommand( "lastinv" )
	end
end )

function dofloor(num, yes)
	if yes then
		return math.floor(num)
	end
	return num
end

function GetRoleTable(all)
	local classds = 0
	local mtfs = 0
	local researchers = 0
	local scps = 0
	local chaosinsurgency = 0
	if all < 8 then
		scps = 1
		all = all - 1
	elseif all > 7 and all < 16 then
		scps = 2
		all = all - 2
	elseif all > 15 then
		scps = 3
		all = all - 3
	end
	//mtfs = math.Round(all * 0.299)
	local mtfmul = 0.33
	if all > 12 then
		mtfmul = 0.3
	elseif all > 22 then
		mtfmul = 0.28
	end
	mtfs = math.Round(all * mtfmul)
	all = all - mtfs
	if mtfs > 6 then
		if math.random(1,3) == 1 then
			chaosinsurgency = 1
		end
		mtfs = mtfs - chaosinsurgency
	end
	researchers = math.floor(all * 0.42)
	all = all - researchers
	classds = all
	//print(scps .. "," .. mtfs .. "," .. classds .. "," .. researchers .. "," .. chaosinsurgency)
	/*
	print("scps: " .. scps)
	print("mtfs: " .. mtfs)
	print("classds: " .. classds)
	print("researchers: " .. researchers)
	print("chaosinsurgency: " .. chaosinsurgency)
	*/
	return {scps, mtfs, classds, researchers, chaosinsurgency}
end

function GetRoleTableCustom(all, scps, p_mtf, p_res, p_chi, chaos)
	local classds = 0
	local mtfs = 0
	local researchers = 0
	local chaosinsurgency = 0
	all = all - scps
	mtfs = math.Round(all * p_mtf)
	all = all - mtfs
	if chaos then
		chaosinsurgency = math.floor(mtfs * p_chi)
		mtfs = mtfs - chaosinsurgency
	end
	researchers = math.floor(all * p_res)
	all = all - researchers
	classds = all
	return {scps, mtfs, classds, researchers, chaosinsurgency}
end

cvars.AddChangeCallback( "br_roundrestart", function( convar_name, value_old, value_new )
	RoundRestart()
	RunConsoleCommand("br_roundrestart", "0")
end )

function SetupPlayers(pltab)
	//local pltab = PLAYER_SETUP[#player.GetAll() - 2]
	//local pltab = GetRoleTable(#player.GetAll())
	local allply = GAMEMODE.Info.GetActivePlayers()
	-- SCP, MTF, Class D, Researchers, Chaos Insurgency --
	
	// SCP
	--local spctab = table.Copy (SPCS)
	--for i = 1, pltab [1] do
	--	if #spctab < 1 then
	--		spctab = table.Copy (SPCS)
	--		//print("not enough scps, copying another table")
	--	end
	--	local pl = table.Random(allply)
	--	local scp = table.Random(spctab)
	--	scp["func"] (pl)
	--	print("assigning " .. pl:Nick() .. " to scps")
	--	table.RemoveByValue(spctab, scp)
	--	table.RemoveByValue(allply, pl)
	--end

	tblSCPs = table.Copy (scp:GetAll ())

	for i = 1, pltab [1] do
		ply = table.Random (allply)
		scp = table.Random (tblSCPs)

		ply:SetSCP (scp ["name"])
		print("assigning " .. ply:Nick() .. " to scps")
		tblSCPs [scp ["name"]] = nil
	end

	// MTF Commander
	local mtfspawns = table.Copy(SPAWN_GUARD)
	if pltab[2] > 0 then
		local pl = table.Random(allply)
		local spawn = table.Random(mtfspawns)
		pl:SetCommander()
		pl:SetPos(spawn)
		print("assigning " .. pl:Nick() .. " as an mtf commander")
		table.RemoveByValue(mtfspawns, spawn)
		table.RemoveByValue(allply, pl)
	end
	
	// MTF
	for i=1, (pltab[2] - 1) do
		if #mtfspawns > 0 then
			local pl = table.Random(allply)
			local spawn = table.Random(mtfspawns)
			pl:SetGuard()
			pl:SetPos(spawn)
			print("assigning " .. pl:Nick() .. " to mtfs")
			table.RemoveByValue(mtfspawns, spawn)
			table.RemoveByValue(allply, pl)
		end
	end
	// Chaos Insurgency
	for i=1, (pltab[5]) do
		if #mtfspawns > 0 then
			local pl = table.Random(allply)
			local spawn = table.Random(mtfspawns)
			pl:SetChaosInsurgency(1)
			pl:SetPos(spawn)
			print("assigning " .. pl:Nick() .. " to chaos insurgency spies")
			table.RemoveByValue(mtfspawns, spawn)
			table.RemoveByValue(allply, pl)
		end
	end
	// Class D
	local dspawns = table.Copy(SPAWN_CLASSD)
	for i=1, pltab[3] do
		if #dspawns > 0 then
			local pl = table.Random(allply)
			local spawn = table.Random(dspawns)
			pl:SetClassD()
			pl:SetPos(spawn)
			print("assigning " .. pl:Nick() .. " to classds")
			table.RemoveByValue(dspawns, spawn)
			table.RemoveByValue(allply, pl)
		end
	end
	// Scientists
	local scispawns = table.Copy(SPAWN_SCIENT)
	for i=1, pltab[4] do
		if #scispawns > 0 then
			local pl = table.Random(allply)
			print("assigning " .. pl:Nick() .. " to scientists")
			local spawn = table.Random(scispawns)
			pl:SetScientist()
			pl:SetPos(spawn)
			table.RemoveByValue(scispawns, spawn)
			table.RemoveByValue(allply, pl)
		end
	end
	timer.Simple(0.1, function()
		net.Start("RolesSelected")
		net.Broadcast()
	end)
end
