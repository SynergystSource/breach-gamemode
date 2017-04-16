local tblSCPs, _ = file.Find ("gamemodes/breach/gamemode/scps/*", "GAME")

for i = 1, #tblSCPs do
	include (("scps/%s"):format (tblSCPs [i]))
end