// Initialization file

//AddCSLuaFile( "class_default.lua" )
AddCSLuaFile( "fonts.lua" )
AddCSLuaFile( "class_default.lua" )
AddCSLuaFile( "cl_hud.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_scoreboard.lua" )
AddCSLuaFile( "cl_mtfmenu.lua" )
AddCSLuaFile( "sh_player.lua" )
mapfile = "mapconfigs/" .. game.GetMap() .. ".lua"
AddCSLuaFile(mapfile)
ALLLANGUAGES = {}
clang = nil
local files, dirs = file.Find(GM.FolderName .. "/gamemode/languages/*.lua", "LUA" )
for k,v in pairs(files) do
	local path = "languages/"..v
	if string.Right(v, 3) == "lua" then
		AddCSLuaFile( path )
		include( path )
		print("Language found: " .. path)
	end
end
AddCSLuaFile( "rounds.lua" )
AddCSLuaFile( "cl_sounds.lua" )
AddCSLuaFile( "cl_targetid.lua" )
AddCSLuaFile( "cl_init.lua" )
include( "server.lua" )
include( "rounds.lua" )
include( "class_default.lua" )
include( "shared.lua" )
include( mapfile )
include( "sh_player.lua" )
include( "sv_player.lua" )
include( "player.lua" )
include( "sv_round.lua" )
include( "sv_breach.lua" )
include( "sv_info.lua" )
include( "sv_actions.lua" )
include( "sv_workshop.lua" )
/*
PrintTable(ALLLANGUAGES)
local trytofind = ALLLANGUAGES[GetConVar("br_svlanguage"):GetString()]
if trytofind != nil then
	if istable(trytofind) then
		clang = trytofind
	end
end
if clang == nil then
	clang = ALLLANGUAGES.english
end
*/
resource.AddFile( "sound/radio/chatter1.ogg" )
resource.AddFile( "sound/radio/chatter2.ogg" )
resource.AddFile( "sound/radio/chatter3.ogg" )
resource.AddFile( "sound/radio/chatter4.ogg" )
resource.AddFile( "sound/radio/franklin1.ogg" )
resource.AddFile( "sound/radio/franklin2.ogg" )
resource.AddFile( "sound/radio/franklin3.ogg" )
resource.AddFile( "sound/radio/franklin4.ogg" )
resource.AddFile( "sound/radio/radioalarm.ogg" )
resource.AddFile( "sound/radio/radioalarm2.ogg" )
resource.AddFile( "sound/radio/scpradio0.ogg" )
resource.AddFile( "sound/radio/scpradio1.ogg" )
resource.AddFile( "sound/radio/scpradio2.ogg" )
resource.AddFile( "sound/radio/scpradio3.ogg" )
resource.AddFile( "sound/radio/scpradio4.ogg" )
resource.AddFile( "sound/radio/scpradio5.ogg" )
resource.AddFile( "sound/radio/scpradio6.ogg" )
resource.AddFile( "sound/radio/scpradio7.ogg" )
resource.AddFile( "sound/radio/scpradio8.ogg" )
resource.AddFile( "sound/radio/ohgod.ogg" )

SPCS = {
	{name = "SCP 173",
	func = function(pl)
		pl:SetSCP173()
	end},
	{name = "SCP 049",
	func = function(pl)
		pl:SetSCP049()
	end},
	{name = "SCP 106",
	func = function(pl)
		pl:SetSCP106()
	end},
	{name = "SCP 457",
	func = function(pl)
		pl:SetSCP457()
	end}
}

/*
Names = {
	researchers = {
		"Dr. Django Bridge",
		"Dr. Jack Bright",
		"Dr. Jeremiah Cimmerian",
		"Dr. Alto Clef",
		"Researcher Jacob Conwell",
		"Dr. Kain Crow",
		"Dr. Chelsea Elliott",
		"Dr. Charles Gears",
		"Dr. Simon Glass",
		"Dr. Frederick Heiden",
		"Dr. Everett King",
		"Dr. Zyn Kiryu",
		"Dr. Mark Kiryu",
		"Dr. Adam Leeward",
		"Dr. Everett Mann",
		"Dr. Riven Mercer",
		"Dr. Johannes Sorts",
		"Dr. Thaddeus Xyank"
	}
}
*/

// Variables
gamestarted = false
preparing = false
postround = false
roundcount = 0
MAPBUTTONS = table.Copy(BUTTONS)

function GM:PlayerSpray( sprayer )
	return !sprayer:Team() == TEAM_SPEC
end

function GM:PlayerNoClip (pInvolker)
	return pInvolker:IsSuperAdmin ()
end

function GM:ShutDown()
	for k,v in pairs(player.GetAll()) do
		v:SaveKarma()
	end
end

function WakeEntity(ent)
	local phys = ent:GetPhysicsObject()
	if ( phys:IsValid() ) then
		phys:Wake()
		phys:SetVelocity(Vector(0,0,25))
	end
end

function PlayerNTFSound(sound, ply)
	if (ply:Team() == TEAM_GUARD or ply:Team() == TEAM_CHAOS) and ply:Alive() then
		if ply.lastsound == nil then ply.lastsound = 0 end
		if ply.lastsound > CurTime() then
			ply:PrintMessage(HUD_PRINTTALK, "You must wait " .. math.Round(ply.lastsound - CurTime()) .. " seconds to do this.")
			return
		end
		//ply:EmitSound( "Beep.ogg", 500, 100, 1 )
		ply.lastsound = CurTime() + 3
		//timer.Create("SoundDelay"..ply:SteamID64() .. "s", 1, 1, function()
			ply:EmitSound( sound, 450, 100, 1 )
		//end)
	end
end

function OnUseEyedrops(ply)
	if ply.usedeyedrops == true then
		ply:PrintMessage(HUD_PRINTTALK, "Don't use them that fast!")
		return
	end
	ply.usedeyedrops = true
	ply:StripWeapon("item_eyedrops")
	ply:PrintMessage(HUD_PRINTTALK, "Used eyedrops, you will not be blinking for 10 seconds")
	timer.Create("Unuseeyedrops" .. ply:SteamID64(), 10, 1, function()
		ply.usedeyedrops = false
		ply:PrintMessage(HUD_PRINTTALK, "You will be blinking now")
	end)
end

timer.Create("BlinkTimer", GetConVar("br_time_blinkdelay"):GetInt(), 0, function()
	local time = GetConVar("br_time_blink"):GetFloat()
	if time >= 5 then return end
	for k,v in pairs(player.GetAll()) do
		if v.canblink and v.blinkedby173 == false and v.usedeyedrops == false then
			net.Start("PlayerBlink")
				net.WriteFloat(time)
			net.Send(v)
			v.isblinking = true
		end
	end
	timer.Create("UnBlinkTimer", time + 0.2, 1, function()
		for k,v in pairs(player.GetAll()) do
			if v.blinkedby173 == false then
				v.isblinking = false
			end
		end
	end)
end)

/* pus
AAXDX = nil
xxmaxs = Vector(1618.056274, -669.712402, 4.825635)
// lua_run checkxdxdx()
function checkxdxdx()
	local mins = Vector(1677.644653, -546.118469, 122.206375)
	//local maxs = Vector(1618.056274, -669.712402, 4.825635)
	//xxmaxs = Vector(1618.056274, -669.712402, 4.825635)
	if IsValid(AAXDX) == false then
		AAXDX = ents.Create( "prop_physics" )
		if IsValid( AAXDX ) then
			AAXDX:SetPos( xxmaxs )
			AAXDX:SetModel("models/props_junk/popcan01a.mdl")
			AAXDX:Spawn()
		end
	end
	maxs = Vector(1625.541992, -663.348633, 4.904104)
	PrintTable(ents.FindInBox( mins, xxmaxs ))
end

hook.Add("Tick", "debug3254t3t35", function()
	if IsValid(AAXDX) then
		AAXDX:SetPos(xxmaxs)
	end
end)
*/

function GM:GetFallDamage( ply, speed )
	return ( speed / 6 )
end

function CheckPLAYER_SETUP()
	local si = 1
	for i=3, #PLAYER_SETUP do
		local v = PLAYER_SETUP[si]
		local num = v[1] + v[2] + v[3] + v[4]
		if i != num then
			print(tostring(si) .. " is not good: " .. tostring(num) .. "/" .. tostring(i))
		else
			print(tostring(si) .. " is good: " .. tostring(num) .. "/" .. tostring(i))
		end
		si = si + 1
	end
end

function GM:OnEntityCreated( ent )
	ent:SetShouldPlayPickupSound( false )
end

