GM.Actions = {}

function GM.Actions.ForceUse (ent, on, int)
	for k, v in pairs(player.GetAll()) do
		if v:Alive() then
			ent:Use(v, v, on, int)
		end
	end
end

nextgateaopen = 0
function GM.Actions.RequestOpenGateA (ply)
	if preparing or postround then return end
	if ply:CLevelGlobal() < 4 then return end
	if !(ply:Team() == TEAM_GUARD or ply:Team() == TEAM_CHAOS) then return end
	if nextgateaopen > CurTime() then
		ply:PrintMessage(HUD_PRINTTALK, "You cannot open Gate A now, you must wait " .. math.Round(nextgateaopen - CurTime()) .. " seconds")
		return
	end
	local gatea
	local rdc
	for id,ent in pairs(ents.FindByClass("func_rot_button")) do
		for k,v in pairs(MAPBUTTONS) do
			if v["pos"] == ent:GetPos() then
				if v["name"] == "Remote Door Control" then
					rdc = ent
					rdc:Use(ply, ply, USE_ON, 1)
				end
			end
		end
	end
	for id,ent in pairs(ents.FindByClass("func_button")) do
		for k,v in pairs(MAPBUTTONS) do
			if v["pos"] == ent:GetPos() then
				if v["name"] == "Gate A" then
					gatea = ent
				end
			end
		end
	end
	if IsValid(gatea) then
		nextgateaopen = CurTime() + 60
		timer.Simple(2, function()
			if IsValid(gatea) then
				gatea:Use(ply, ply, USE_ON, 1)
			end
		end)
	end
end

function GM.Actions.OpenGateA ()
	for k, v in pairs( ents.FindByClass( "func_rot_button" ) ) do
		if v:GetPos() == POS_GATEABUTTON then
			GAMEMODE.Actions.ForceUse (v, 1, 1)
		end
	end
end

function GM.Actions.CloseSCPDoors ()
	// hook needed
	for k,v in pairs( ents.FindByClass( "func_door" ) ) do
		vecDoor = v:GetPos ()

		// 173 doors
		if vecDoor == POS_173DOORS then
			GAMEMODE.Actions.ForceUse (v, 0, 1)
		end
		// 106 doors
		if vecDoor == POS_106DOORS then
			GAMEMODE.Actions.ForceUse (v, 0, 1)
		end
		// 049 doors
		if vecDoor == POS_049BUTTON then
			GAMEMODE.Actions.ForceUse (v, 0, 1)
		end

		// any other spawn gates
		if table.HasValue (POS_SPAWNGATES, vecDoor) then
			GAMEMODE.Actions.ForceUse (v, 0, 1)
		end
	end
	for k,v in pairs( ents.FindByClass( "func_button" ) ) do
		vecDoor = v:GetPos ()
		if vecDoor == POS_173BUTTON then
			GAMEMODE.Actions.ForceUse (v, 1, 1)
		end
		if vecDoor == POS_049BUTTON then
			GAMEMODE.Actions.ForceUse (v, 1, 1)
		end
	end
end

local lasttime914 = 0
function GM.Actions.Use914(ent)
	if CurTime() < lasttime914 then return end
	lasttime914 = CurTime() + 20
	GAMEMODE.Actions.ForceUse (ent, 0, 1)
	local pos = ENTER914
	local pos2 = EXIR914
	timer.Create("914Use", 4, 1, function()
		for k,v in pairs(ents.FindInSphere( pos, 80 )) do
			if v.betterone != nil or v.GetBetterOne != nil then
				local useb
				if v.betterone then useb = v.betterone end
				if v.GetBetterOne then useb = v:GetBetterOne() end
				local betteritem = ents.Create( useb )
				if IsValid( betteritem ) then
					betteritem:SetPos( pos2 )
					betteritem:Spawn()
					WakeEntity(betteritem)
					v:Remove()
				end
			end
		end
	end)
	//for k,v in pairs( ents.FindByClass( "func_button" ) ) do
	//	if v:GetPos() == Vector(1567.000000, -832.000000, 46.000000) then
			//print("Found ent!")
			//GAMEMODE.Actions.ForceUse (v, 0, 1)
			//return
	//	end
	//end
end

local buttonstatus = 0
local lasttime914b = 0
function GM.Actions.Use914B (activator, ent)
	if CurTime() < lasttime914b then return end
	lasttime914b = CurTime() + 1.3
	GAMEMODE.Actions.ForceUse (ent, 1, 1)
	if buttonstatus == 0 then
		buttonstatus = 1
		activator:PrintMessage(HUD_PRINTTALK, "Changed to coarse")
	elseif buttonstatus == 1 then
		buttonstatus = 2
		activator:PrintMessage(HUD_PRINTTALK, "Changed to 1:1")
	elseif buttonstatus == 2 then
		buttonstatus = 3
		activator:PrintMessage(HUD_PRINTTALK, "Changed to fine")
	elseif buttonstatus == 3 then
		buttonstatus = 4
		activator:PrintMessage(HUD_PRINTTALK, "Changed to very fine")
	elseif buttonstatus == 4 then
		buttonstatus = 0
		activator:PrintMessage(HUD_PRINTTALK, "Changed to rough")
	end
end