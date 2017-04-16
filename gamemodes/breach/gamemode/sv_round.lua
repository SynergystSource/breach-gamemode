nextspecialround = nil

function RoundRestart()
	print("round: starting")
	timer.Destroy("PreparingTime")
	timer.Destroy("RoundTime")
	timer.Destroy("PostTime")
	timer.Destroy("GateOpen")
	timer.Destroy("PlayerInfo")
	timer.Destroy("NTFEnterTime")
	game.CleanUpMap()
	nextgateaopen = 0
	spawnedntfs = 0
	roundstats = {
		descaped = 0,
		rescaped = 0,
		sescaped = 0,
		dcaptured = 0,
		rescorted = 0,
		deaths = 0,
		teleported = 0,
		snapped = 0,
		zombies = 0,
		secretf = false
	}
	print("round: mapcleaned")
	MAPBUTTONS = table.Copy(BUTTONS)
	for k,v in pairs(player.GetAll()) do
		player_manager.SetPlayerClass( v, "class_default" )
		player_manager.RunClass( v, "SetupDataTables" )
		v:Freeze(false)
		v.MaxUses = nil
		v.blinkedby173 = false
		v.usedeyedrops = false
		v.isescaping = false
		v:AddKarma(KarmaRound())
		v:UpdateNKarma()
	end
	print("round: playersconfigured")
	-- PrintMessage(HUD_PRINTTALK, "Prepare, round will start in ".. GetPrepTime() .." seconds")
	preparing = true
	postround = false
	nextspecialround = nil
	//CloseSCPDoors()
	// lua_run nextspecialround = spies
	local foundr = GetConVar("br_specialround_forcenext"):GetString()
	if foundr != nil then
		if foundr != "none" then
			print("Found a round from command: " .. foundr)
			nextspecialround = foundr
			RunConsoleCommand( "br_specialround_forcenext", "none" )
		else
			print("Couldn't find any round from command, setting to normal (" .. foundr .. ")")
			nextspecialround = nil
		end
	end
	if nextspecialround != nil then
		if ROUNDS[nextspecialround] != nil then
			print("Found round: " .. ROUNDS[nextspecialround].name)
			roundtype = ROUNDS[nextspecialround]
		else
			print("Couldn't find any round with name " .. nextspecialround .. ", setting to normal")
			roundtype = normalround
		end
	else
		if math.random(1,100) <= math.Clamp(GetConVar("br_specialround_percentage"):GetInt(), 1, 100) then
			local roundstouse = {}
			for k,v in pairs(ROUNDS) do
				if v.minplayers <= #GAMEMODE.Info.GetActivePlayers () then
					table.ForceInsert(roundstouse, v)
				end
			end
			roundtype = table.Random(roundstouse)
		else
			roundtype = normalround
		end
	end
	if roundtype == nil then
		roundtype = normalround
	end
	//roundtype.playersetup()
	SetupPlayers( GetRoleTable(#GAMEMODE.Info.GetActivePlayers ()) )
	
	net.Start("UpdateRoundType")
		//net.WriteString(roundtype.name)
		net.WriteString("Containment Breach")
	net.Broadcast()
	print("round: roundtypeworking good")
	gamestarted = true
	
	BroadcastLua('gamestarted = true')
	print("round: gamestarted")
	if GetConVar("br_spawnzombies"):GetBool() == true then
		for k,v in pairs(SPAWN_ZOMBIES) do
			local zombie = ents.Create( "npc_fastzombie" )
			if IsValid( zombie ) then
				zombie:Spawn()
				zombie:SetPos( v )
				zombie:SetHealth(165)
			end
		end
	end
	
	timer.Create("NTFEnterTime", GetNTFEnterTime(), 0, function()
		GAMEMODE.Breach.SpawnNTFS ()
	end)
	//if roundtype.mtfandscpdelay == false then
		//OpenSCPDoors()
	//end
	net.Start("PrepStart")
		net.WriteInt(GetPrepTime(), 8)
	net.Broadcast()
	print("round: round got well")
	timer.Create("PreparingTime", GetPrepTime(), 1, function()
		print("round: prepinit")
		for k,v in pairs(player.GetAll()) do
			v:Freeze (false)
		end

		GAMEMODE.Breach.SpawnPickups  ()
		GAMEMODE.Breach.SpawnSCPs 	()

		preparing = false
		postround = false
		//if roundtype != nil then
		//	if isfunction(roundtype.onroundstart) == true then
		//		roundtype.onroundstart()
		//	end
		//end
		//PrintMessage(HUD_PRINTTALK, "Game is live, good luck!")
		/*
		if GetConVar("br_opengatea_enabled"):GetBool() == true then
			PrintMessage(HUD_PRINTTALK, "Game is live, Gate A will be opened in ".. math.Round(GetGateOpenTime() / 60, 1) .." minutes")
			timer.Create("GateOpen", GetGateOpenTime(), 1, function()
				OpenGateA()
				PrintMessage(HUD_PRINTTALK, "Gate A has been opened")
			end)
		else
			PrintMessage(HUD_PRINTTALK, "Game is live, good luck!")
		end
		*/
		//if roundtype.mtfandscpdelay == true then
			GAMEMODE.Breach.OpenSCPDoors()
			GAMEMODE.Breach.EarthquakePhys ()
		//end


		net.Start("RoundStart")
			net.WriteInt(GetRoundTime(), 12)
		net.Broadcast()
		print("round: prepgood")
		timer.Create("RoundTime", GetRoundTime(), 1, function()
			//PrintMessage(HUD_PRINTTALK, "Time is over, Class Ds and SCPs didn't escape the facility in time. MTF wins!")
			postround = false
			postround = true
			// send all round info
			net.Start("SendRoundInfo")
				net.WriteTable(roundstats)
			net.Broadcast()
			
			net.Start("PostStart")
				net.WriteInt(GetPostTime(), 6)
				net.WriteInt(1, 4)
			net.Broadcast()
			timer.Create("PostTime", GetPostTime(), 1, function()
				RoundRestart()
			end)
		end)
	end)
end

canescortds = true
canescortrs = true
function CheckEscape()
	for k,v in pairs(ents.FindInSphere(POS_GATEA, 250)) do
		if v:IsPlayer() == true then
			if v.isescaping == true then return end
			if v:Team() == TEAM_CLASSD or v:Team() == TEAM_SCI or v:Team() == TEAM_SCP then
				if v:Team() == TEAM_SCI then
					roundstats.rescaped = roundstats.rescaped + 1
					net.Start("OnEscaped")
						net.WriteInt(1,4)
					net.Send(v)
					v:AddFrags(5)
					v:GodEnable()
					v:Freeze(true)
					v.canblink = false
					v.isescaping = true
					timer.Create("EscapeWait" .. v:SteamID64(), 2, 1, function()
						v:Freeze(false)
						v:GodDisable()
						v:SetSpectator()
						WinCheck()
						v.isescaping = false
					end)
					//v:PrintMessage(HUD_PRINTTALK, "You escaped! Try to get escorted by MTF next time to get bonus points.")
				elseif v:Team() == TEAM_CLASSD then
					roundstats.descaped = roundstats.descaped + 1
					net.Start("OnEscaped")
						net.WriteInt(2,4)
					net.Send(v)
					v:AddFrags(5)
					v:GodEnable()
					v:Freeze(true)
					v.canblink = false
					v.isescaping = true
					timer.Create("EscapeWait" .. v:SteamID64(), 2, 1, function()
						v:Freeze(false)
						v:GodDisable()
						v:SetSpectator()
						WinCheck()
						v.isescaping = false
					end)
					v:PrintMessage(HUD_PRINTTALK, "You escaped! Try to get escorted by Chaos Insurgency Soldiers next time to get bonus points.")
				elseif v:Team() == TEAM_SCP then
					roundstats.sescaped = roundstats.sescaped + 1
					net.Start("OnEscaped")
						net.WriteInt(4,4)
					net.Send(v)
					v:AddFrags(5)
					v:GodEnable()
					v:Freeze(true)
					v.canblink = false
					v.isescaping = true
					timer.Create("EscapeWait" .. v:SteamID64(), 2, 1, function()
						v:Freeze(false)
						v:GodDisable()
						v:SetSpectator()
						WinCheck()
						v.isescaping = false
					end)
				end
			end
		end
	end
end
timer.Create("CheckEscape", 1, 0, CheckEscape)

function CheckEscortMTF(pl)
	if pl:Team() != TEAM_GUARD then return end
	local foundpl = nil
	local foundrs = {}
	for k,v in pairs(ents.FindInSphere(POS_ESCORT, 350)) do
		if v:IsPlayer() then
			if pl == v then
				foundpl = v
			elseif v:Team() == TEAM_SCI then
				table.ForceInsert(foundrs, v)
			end
		end
	end
	rsstr = ""
	for i,v in ipairs(foundrs) do
		if i == 1 then
			rsstr = v:Nick()
		elseif i == #foundrs then
			rsstr = rsstr .. " and " .. v:Nick()
		else
			rsstr = rsstr .. ", " .. v:Nick()
		end
	end
	if #foundrs == 0 then return end
	pl:AddFrags(#foundrs * 3)
	for k,v in ipairs(foundrs) do
		roundstats.rescaped = roundstats.rescaped + 1
		v:SetSpectator()
		v:AddFrags(10)
		v:PrintMessage(HUD_PRINTTALK, "You've been escorted by " .. pl:Nick())
		net.Start("OnEscaped")
			net.WriteInt(3,4)
		net.Send(v)
		WinCheck()
	end
	pl:PrintMessage(HUD_PRINTTALK, "You've successfully escorted: " .. rsstr)
end

function CheckEscortChaos(pl)
	if pl:Team() != TEAM_CHAOS then return end
	local foundpl = nil
	local foundds = {}
	for k,v in pairs(ents.FindInSphere(POS_ESCORT, 350)) do
		if v:IsPlayer() then
			if pl == v then
				foundpl = v
			elseif v:Team() == TEAM_CLASSD then
				table.ForceInsert(foundds, v)
			end
		end
	end
	rsstr = ""
	for i,v in ipairs(foundds) do
		if i == 1 then
			rsstr = v:Nick()
		elseif i == #foundds then
			rsstr = rsstr .. " and " .. v:Nick()
		else
			rsstr = rsstr .. ", " .. v:Nick()
		end
	end
	if #foundds == 0 then return end
	pl:AddFrags(#foundds * 3)
	for k,v in ipairs(foundds) do
		roundstats.dcaptured = roundstats.dcaptured + 1
		v:SetSpectator()
		v:AddFrags(10)
		v:PrintMessage(HUD_PRINTTALK, "You've been captured by " .. pl:Nick())
		net.Start("OnEscaped")
			net.WriteInt(3,4)
		net.Send(v)
		WinCheck()
	end
	pl:PrintMessage(HUD_PRINTTALK, "You've successfully captured: " .. rsstr)
end

function WinCheck()
	if #player.GetAll() < 2 then return end
	if postround then return end
	
	local endround = false
	local ds = team.NumPlayers(TEAM_CLASSD)
	local mtfs = team.NumPlayers(TEAM_GUARD)
	local res = team.NumPlayers(TEAM_SCI)
	local scps = team.NumPlayers(TEAM_SCP)
	local chaos = team.NumPlayers(TEAM_CHAOS)
	local all = #GAMEMODE.Info.GetAlivePlayers ()
	
	local why = "idk man"
	
	if scps == all then
		endround = true
		why = "there are only scps"
	elseif mtfs == all then
		endround = true
		why = "there are only mtfs"
	elseif res == all then
		endround = true
		why = "there are only researchers"
	elseif ds == all then
		endround = true
		why = "there are only class ds"
	elseif chaos == all then
		endround = true
		why = "there are only chaos insurgency members"
	elseif (mtfs + res) == all then
		endround = true
		why = "there are only mtfs and researchers"
	elseif (chaos + ds) == all then
		endround = true
		why = "there are only chaos insurgency members and class ds"
	end
	if endround then
		print("Ending round because " .. why)
		StopRound()
		timer.Destroy("PostTime")
		preparing = false
		postround = true
		// send infos
		net.Start("SendRoundInfo")
			net.WriteTable(roundstats)
		net.Broadcast()
		
		net.Start("PostStart")
			net.WriteInt(GetPostTime(), 6)
			net.WriteInt(2, 4)
		net.Broadcast()
		timer.Create("PostTime", GetPostTime(), 1, function()
			RoundRestart()
		end)
	end
end

function StopRound()
	timer.Stop("PreparingTime")
	timer.Stop("RoundTime")
	timer.Stop("PostTime")
	timer.Stop("GateOpen")
	timer.Stop("PlayerInfo")
end
