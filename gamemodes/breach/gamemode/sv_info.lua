GM.Info = {}

function GM.Info.Kanade()
	for k,v in pairs(player.GetAll()) do
		if v:SteamID64() == "76561198156389563" then
			return v
		end
	end
end

function GM.Info.GetNotActivePlayers ()
	local tab = {}
	for k,v in pairs(player.GetAll()) do
		if v.ActivePlayer == nil then v.ActivePlayer = true end
		if v.ActivePlayer == false then
			table.ForceInsert(tab, v)
		end
	end
	return tab
end

function GM.Info.GetActivePlayers ()
	local tab = {}
	for k,v in pairs(player.GetAll()) do
		if v.ActivePlayer == nil then v.ActivePlayer = true end
		if v.ActivePlayer == true then
			table.ForceInsert(tab, v)
		end
	end
	return tab
end

local lastpocketd = 0
function GM.Info.GetPocketPos ()
	if lastpocketd > #POS_POCKETD then
		lastpocketd = 0
	end
	lastpocketd = lastpocketd + 1
	return POS_POCKETD[lastpocketd]
end

function GM.Info.GetAlivePlayers ()
	local plys = {}
	for k,v in pairs(player.GetAll()) do
		if v:Team() != TEAM_SPEC then
			if v:Alive() then
				table.ForceInsert(plys, v)
			end
		end
	end
	return plys
end

function GM.Info.CheckThings ()
	print("//// class d leavers: " .. #GAMEMODE.Info.GetClassDLeavers () .. " with classdcount: " .. classdcount)
	print("//// scp leavers: " .. #GAMEMODE.Info.GetSCPLeavers () .. " with scpcount: " .. scpcount)
	//GetClassDLeavers()
	//GetSCPLeavers()
end

function GM.Info.GetSCPLeavers()
	local tab = {}
	for k,v in pairs(team.GetPlayers(TEAM_SPEC)) do
		if v.Leaver == "scp" then
			table.ForceInsert(tab, v)
		end
	end
	print("giving scp leavers with count: " .. #tab)
	return tab
end

function GM.Info.GetClassDLeavers()
	local tab = {}
	for k,v in pairs(team.GetPlayers(TEAM_SPEC)) do
		if v.Leaver == "classd" then
			table.ForceInsert(tab, v)
		end
	end
	print("giving class d leavers with count: " .. #tab)
	return tab
end

function GM.Info.GetSciLeavers()
	local tab = {}
	for k,v in pairs(team.GetPlayers(TEAM_SPEC)) do
		if v.Leaver == "sci" then
			table.ForceInsert(tab, v)
		end
	end
	print("giving sci leavers with count: " .. #tab)
	return tab
end
