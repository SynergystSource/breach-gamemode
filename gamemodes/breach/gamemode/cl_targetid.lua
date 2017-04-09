local function FriendlyHealth (iHealth)
	strText = ""
	if iHealth >= 95 then
		strText = "Healthy"
	elseif iHealth >= 70 then
		strText = "Wounded"
	elseif iHealth >= 50 then
		strText = "Badly Wounded"
	elseif iHealth >= 25 then
		strText = "Bleeding Terribly"
	else
		strText = "Close To Death"
	end

	return strText
end



function GM:HUDDrawTargetID()
	local trace = LocalPlayer():GetEyeTrace()
	if !trace.Hit then return end
	if !trace.HitNonWorld then return end
	
	local text = "ERROR"
	local font = "TargetID"
	local ply =  trace.Entity
	
	if ply:IsPlayer() then
		if ply:Alive() == false then return end
		if ply:Team() == TEAM_SPEC then return end
		if ply:GetPos():Distance(LocalPlayer():GetPos()) > 700 then return end
		text = ply:Nick()
	else
		return
	end
	
	local x = ScrW() / 2
	local y = ScrH() / 2 + 30
	
	local clr = self:GetTeamColor( ply )
	local clr2 = color_white
	
	if not ply.GetNClass then
		player_manager.RunClass( ply, "SetupDataTables" )
	else
		text = ply:GetNClass()
	end
	if LocalPlayer():Team() == TEAM_CHAOS or LocalPlayer():Team() == TEAM_CLASSD then
		if ply:Team() == TEAM_CHAOS then
			text = "Chaos Insurgency"
			clr = Color(29, 81, 56)
		end
	end
	
	draw.Text( {
		text = ply:Nick() .. " (" .. FriendlyHealth (ply:Health ()) .. ")",
		pos = { x, y },
		font = "TargetID",
		color = clr2,
		xalign = TEXT_ALIGN_CENTER,
		yalign = TEXT_ALIGN_CENTER,
	})
	
	draw.Text( {
		text = text,
		pos = { x, y + 16 },
		font = "TargetID",
		color = clr,
		xalign = TEXT_ALIGN_CENTER,
		yalign = TEXT_ALIGN_CENTER,
	})
end
