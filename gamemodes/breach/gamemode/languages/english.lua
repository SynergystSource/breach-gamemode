
english = {}

english.roundtype = "Round type: {type}"
english.preparing = "Prepare, round will start in {num} seconds"
english.round = "Game is live, good luck!"

english.lang_pldied = "{num} player(s) died"
english.lang_descaped = "{num} Class D(s) escaped"
english.lang_sescaped = "{num} SCP(s) escaped"
english.lang_rescaped = "{num} Researcher(s) escaped"
english.lang_dcaptured = "Chaos Insurgency captured {num} Class D(s)"
english.lang_rescorted = "MTF escorted {num} Researcher(s)"
english.lang_teleported = "SCP - 106 caputred {num} victim(s) to the Pocket Dimension "
english.lang_snapped = "{num} neck(s) were snapped by SCP173"
english.lang_zombies = 'SCP - 049 "cured the disease" {num} time(s) '
english.lang_secret_found = "Secret has been found"
english.lang_secret_nfound = "Secret has not been found"

english.starttexts = {
	{
		"You are the SCP-173",
		{"Your objective is to escape the facility",
		"You cannot move when someone is looking at you",
		"Remember, humans are blinking",
		"You have a special ability on RMB: blind everyone around you"}
	},
	{
		"You are the SCP-106",
		{"Your objective is to escape the facility",
		"When you touch someone, they will teleport",
		"to your pocket dimension"}
	},
	{
		"You are the SCP-049",
		{"Your objective is to escape the facility",
		"If you touch someone, they will become SCP-049-2"}
	},
	{
		"You are a MTF Guard",
		{"Your objective is to find and rescue all",
		"of the researchers that are still in the facility",
		"You have to kill any Class D or SCP that you will find",
		"Listen to MTF Commander's orders and stick to your team"}
	},
	{
		"You are a MTF Guard",
		{"Your objective is to kill every Chaos Insurgency Spy",
		"Don't trust everyone"}
	},
	{
		"You are an MTF Commander",
		{"Your objective is to find and rescue all",
		"of the researchers that are still in the facility",
		"You have to kill any Class Ds or SCPs that you will find",
		"Give orders to Guards to simplify the task"}
	},
	{
		"You are a MTF Unit Nine-Tailed Fox",
		{"Your objective is to find and rescue all",
		"of the researchers that are still in the facility",
		"You have to kill any Class D or SCP that you will find",
		"Go to the facility and help Guards to embrace a chaos"}
	},
	{
		"You are a Class D",
		{"Your objective is to escape from the facility",
		"You need to cooperate with other Class Ds",
		"Search for keycards and be aware of MTF and SCPs"}
	},
	{
		"You are a Researcher",
		{"Your objective is to escape from the facility",
		"You need to find a MTF Guard that will help you",
		"Be on the look out of Class Ds as they might try to kill you"}
	},
	{
		"You are the SCP-049-2",
		{"Your objective is to escape the facility",
		"Cooperate with SCP-049 to kill more people"}
	},
	{
		"You are the Chaos Insurgency Soldier",
		{"Your objective is to capture as much Class Ds as it is possible",
		"Escort them to the helipad outisde of the facility",
		"You have to kill anyone who will stop you"}
	},
	{
		"You are the Chaos Insurgency Spy",
		{"Your objective is to kill all MTF Guards and capture the Class D",
		"They are unaware of your disguise",
		"Don't destroy your disguise",
		"If you find any class ds, try to escort them to the helipad"}
	},
	{
		"You are the Chaos Insurgency Soldier",
		{"Your objective is to kill every MTF Guard and capture the Class D",
		"They are in the facility, go there and kill them",
		"Try to cooperate with your teammates"}
	},
	{
		"You are a Spectator",
		{'Use command "br_spectate" to come back'}
	},
	{
		"You are the SCP-457",
		{"Your objective is to escape then facility",
		"You are always burning",
		"If you are close enough to a human, you will burn them"}
	},
	{
		"You are a MTF Guard",
		{"Your objective is to kill every SCP-008-2",
		"At the end of preparing, some MTFs will get infected"}
	},
	{
		"You are the SCP-008-2",
		{"Your objective is to infect every MTF Guard",
		"If you attack someone, they will become 008-2 aswell"}
	},
}

english.lang_end1 = "The game ends here"
english.lang_end2 = "Time limit has been reached"
english.lang_end3 = "Game ended due to the inability to continue"

english.escapemessages = {
	{
		main = "You escaped",
		txt = "You escaped the facility in {t} minutes, good job!",
		txt2 = "Try to get escorted by MTF next time to get bonus points.",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "You escaped",
		txt = "You escaped the facility in {t} minutes, good job!",
		txt2 = "Try to get escorted by Chaos Insurgency Soldiers next time to get bonus points.",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "You were escorted",
		txt = "You were escorted in {t} minutes, good job!",
		txt2 = "",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "You escaped",
		txt = "You escaped in {t} minutes, good job!",
		txt2 = "",
		clr = team.GetColor(TEAM_SCP)
	}
}



english.ROLE_SCP173 = "SCP-173"
english.ROLE_SCP106 = "SCP-106"
english.ROLE_SCP049 = "SCP-049"
english.ROLE_SCP457 = "SCP-457"
english.ROLE_SCP0492 = "SCP-049-2"
english.ROLE_MTFGUARD = "MTF Guard"
english.ROLE_MTFCOM = "MTF Commander"
english.ROLE_MTFNTF = "MTF Nine Tailed Fox"
english.ROLE_CHAOS = "Chaos Insurgency"
english.ROLE_CLASSD = "Class D Personel"
english.ROLE_RES = "Researcher"
english.ROLE_SPEC = "Spectator"

ALLLANGUAGES.english = english
