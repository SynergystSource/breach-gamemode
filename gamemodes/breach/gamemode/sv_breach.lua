function util.PaintDown(start, effname, ignore)
   local btr = util.TraceLine({start=start, endpos=(start + Vector(0,0,-256)), filter=ignore, mask=MASK_SOLID})

   util.Decal(effname, btr.HitPos+btr.HitNormal, btr.HitPos-btr.HitNormal)
end

function util.DoBleed(ent)
   if not IsValid(ent) or (ent:IsPlayer() and (not ent:Alive() or not ent:IsTerror())) then
      return
   end

   local jitter = VectorRand() * 30
   jitter.z = 20

   util.PaintDown(ent:GetPos() + jitter, "Blood", ent)
end

GM.Breach = {}

function GM.Breach.EarthquakePhys ()
	tblEnts = ents.FindByClass ("prop_physics")

	for i = 1, #tblEnts do
		eProp 	 = tblEnts [i]
		ePhysics = eProp:GetPhysicsObject ()
		iMass    = ePhysics:GetMass ()
		ePhysics:SetVelocity (VectorRand () * Vector (iMass * 10, iMass * 10, iMass * 10))
	end
end

function GM.Breach.OpenSCPDoors()
	// hook needed
	for k, v in pairs( ents.FindByClass( "func_door" ) ) do
		// 173 doors
		if v:GetPos() == POS_173DOORS then
			GAMEMODE.Actions.ForceUse (v, 1, 1)
		end
		// 106 doors
		if v:GetPos() == POS_106DOORS then
			GAMEMODE.Actions.ForceUse (v, 1, 1)
		end
	end
	// 173 button to open doors
	for k, v in pairs( ents.FindByClass( "func_button" ) ) do
		if v:GetPos() == POS_173BUTTON then
			GAMEMODE.Actions.ForceUse (v, 1, 1)
		end
		if v:GetPos() == POS_049BUTTON then
			GAMEMODE.Actions.ForceUse (v, 1, 1)
		end
	end
end

function GM.Breach.SpawnSCPs ()
	for i = 1, #SCPs do
		tblEnt = SCPs [i]
		local scp = ents.Create (tblEnt ["entity"])
		scp:SetPos    (tblEnt ["pos"])
		scp:SetAngles (tblEnt ["ang"])
		scp:Spawn     ()
		scp:Activate  ()
	end
end

function GM.Breach.SpawnPickups ()
	for k,v in pairs(SPAWN_FIREPROOFARMOR) do
		local vest = ents.Create( "armor_fireproof" )
		if IsValid( vest ) then
			vest:Spawn()
			vest:SetPos( v + Vector(0,0,-5) )
			WakeEntity(vest)
		end
	end
	for k,v in pairs(SPAWN_ARMORS) do
		local vest = ents.Create( "armor_mtfguard" )
		if IsValid( vest ) then
			vest:Spawn()
			vest:SetPos( v + Vector(0,0,-15) )
			WakeEntity(vest)
		end
	end
	for k,v in pairs(SPAWN_PISTOLS) do
		local wep = ents.Create( table.Random({"weapon_mtf_usp", "weapon_mtf_deagle"}) )
		if IsValid( wep ) then
			wep:Spawn()
			wep:SetPos( v + Vector(0,0,-25) )
			wep.SavedAmmo = wep.Primary.ClipSize
			WakeEntity(wep)
		end
	end
	for k,v in pairs(SPAWN_SMGS) do
		local wep = ents.Create( table.Random({"weapon_mtf_p90", "weapon_mtf_tmp", "weapon_mtf_ump45"}) )
		if IsValid( wep ) then
			wep:Spawn()
			wep:SetPos( v + Vector(0,0,-25) )
			wep.SavedAmmo = wep.Primary.ClipSize
			WakeEntity(wep)
		end
	end
	for k,v in pairs(SPAWN_RIFLES) do
		local wep = ents.Create( table.Random({"weapon_chaos_ak47", "weapon_chaos_famas"}) )
		if IsValid( wep ) then
			wep:Spawn()
			wep:SetPos( v + Vector(0,0,-25) )
			wep.SavedAmmo = wep.Primary.ClipSize
			WakeEntity(wep)
		end
	end
	for k,v in pairs(SPAWN_AMMO_RIFLE) do
		local wep = ents.Create( "item_rifleammo" )
		if IsValid( wep ) then
			wep:Spawn()
			wep:SetPos( v + Vector(0,0,-25) )
		end
	end
	for k,v in pairs(SPAWN_AMMO_SMG) do
		local wep = ents.Create( "item_smgammo" )
		if IsValid( wep ) then
			wep:Spawn()
			wep:SetPos( v + Vector(0,0,-25) )
		end
	end
	for k,v in pairs(SPAWN_AMMO_PISTOL) do
		local wep = ents.Create( "item_pistolammo" )
		if IsValid( wep ) then
			wep:Spawn()
			wep:SetPos( v + Vector(0,0,-25) )
		end
	end

	local tblSpawner = {
		{
			tbl = SPAWN_KEYCARD3,
			ent = "keycard_level3"
		},
		{
			tbl = SPAWN_KEYCARD4,
			ent = "keycard_level4"
		},
		{
			tbl = SPAWN_KEYCARD2,
			ent = "keycard_level2"
		},
	}


	for i = 1, #tblSpawner do
		tblSeed = tblSpawner [i]
		for _, tblVectors in pairs (tblSeed.tbl) do
			for i = 1, #tblVectors do
				if math.random (0, 5) == 0 then continue end

				vecPosition = tblVectors [i]

				--imported from svn, uncomment if you want corpses
				--corpse      = ents.Create ("prop_ragdoll")
				--corpse:SetModel ("models/player/kerry/class_scientist_"..math.random(1,7)..".mdl")
				--corpse:SetPos   (vecPosition)
				--corpse:Spawn    ()
				--corpse:Activate ()
				--corpse:SetCollisionGroup (COLLISION_GROUP_DEBRIS)

				keycard     = ents.Create (tblSeed.ent)
				keycard:Spawn     ()
				keycard:SetPos    (vecPosition)

				--timer.Simple (1, function ()
				--	for i = 1, 10 do
				--		util.DoBleed (item)
				--	end
				--end)
			end
		end
	end
	
	local resps_items = table.Copy(SPAWN_MISCITEMS)
	local resps_melee = table.Copy(SPAWN_MELEEWEPS)
	local resps_medkits = table.Copy(SPAWN_MEDKITS)
	
	local item = ents.Create( "item_medkit" )
	if IsValid( item ) then
		local spawn4 = table.Random(resps_medkits)
		item:Spawn()
		item:SetPos( spawn4 )
		table.RemoveByValue(resps_medkits, spawn4)
	end
	
	local item = ents.Create( "item_medkit" )
	if IsValid( item ) then
		local spawn4 = table.Random(resps_medkits)
		item:Spawn()
		item:SetPos( spawn4 )
		table.RemoveByValue(resps_medkits, spawn4)
	end
	
	local item = ents.Create( "item_radio" )
	if IsValid( item ) then
		local spawn4 = table.Random(resps_items)
		item:Spawn()
		item:SetPos( spawn4 )
		table.RemoveByValue(resps_items, spawn4)
	end
	
	local item = ents.Create( "item_eyedrops" )
	if IsValid( item ) then
		local spawn4 = table.Random(resps_items)
		item:Spawn()
		item:SetPos( spawn4 )
		table.RemoveByValue(resps_items, spawn4)
	end
	
	local item = ents.Create( "item_snav_300" )
	if IsValid( item ) then
		local spawn4 = table.Random(resps_items)
		item:Spawn()
		item:SetPos( spawn4 )
		table.RemoveByValue(resps_items, spawn4)
	end
	
	local item = ents.Create( "item_snav_ultimate" )
	if IsValid( item ) then
		local spawn4 = table.Random(resps_items)
		item:Spawn()
		item:SetPos( spawn4 )
		table.RemoveByValue(resps_items, spawn4)
	end
	
	local item = ents.Create( "weapon_crowbar" )
	if IsValid( item ) then
		local spawn4 = table.Random(resps_melee)
		item:Spawn()
		item:SetPos( spawn4 )
		table.RemoveByValue(resps_melee, spawn4)
	end
	
	local item = ents.Create( "weapon_crowbar" )
	if IsValid( item ) then
		local spawn4 = table.Random(resps_melee)
		item:Spawn()
		item:SetPos( spawn4 )
		table.RemoveByValue(resps_melee, spawn4)
	end
	
end

spawnedntfs = 0
function GM.Breach.SpawnNTFS ()
	//if roundtype.allowntfspawn == false then return end
	if spawnedntfs > 6 then return end
	local allspecs = {}
	for k,v in pairs(team.GetPlayers(TEAM_SPEC)) do
		if v.ActivePlayer == true then
			table.ForceInsert(allspecs, v)
		end
	end
	local num = math.Clamp(#allspecs, 0, 3)
	local spawnci = false
	spawnedntfs = spawnedntfs + num
	if math.random(1,5) == 1 then
		spawnci = true
	end
	for i=1, num do
		local pl = table.Random(allspecs)
		if spawnci then
			pl:SetChaosInsurgency(3)
			pl:SetPos(SPAWN_OUTSIDE[i])
		else
			pl:SetNTF()
			pl:SetPos(SPAWN_OUTSIDE[i])
		end
		table.RemoveByValue(allspecs, pl)
	end
	if num > 0 then
		PrintMessage(HUD_PRINTTALK, "MTF Units NTF has entered the facility.")
		BroadcastLua('surface.PlaySound ("EneteredFacility.ogg")')
	end
end