
french = {}

french.roundtype = "Type de munitions : {type}"
french.preparing = "Préparer-vous, le round commence dans {num} secondes"
french.round = "Le round commence, bonne chance!"

french.lang_pldied = "{num} joueur(s) mort"
french.lang_descaped = "{num} Classe D(s) échappé"
french.lang_sescaped = "{num} SCP(s) échappé"
french.lang_rescaped = "{num} Chercheur(s) échappé"
french.lang_dcaptured = "Chaos Insurgency a capturée {num} Classe D(s)"
french.lang_rescorted = "MTF a escorté {num} Chercheur(s)"
french.lang_teleported = "SCP - 106 capturée {num} victime(s) à la Pocket Dimension "
french.lang_snapped = "{num} cou(s) a été casser par SCP173"
french.lang_zombies = 'SCP - 049 "a guéri la maladie" {num} fois '
french.lang_secret_found = "Le secret a été trouvé"
french.lang_secret_nfound = "Le secret n'a pas été trouvé"

french.starttexts = {
	{
		"Vous êtes le SCP-173",
		{"Votre objectif est de vous échapper à l'établissement",
		"Vous ne pouvez pas bouger quand quelqu'un vous regarde",
		"Rappelez-vous, les humains clignotent des yeux.",
		"Vous avez une capacité spéciale sur Clic Droit: Sa aveugle tout le monde autour de vous"}
	},
	{
		"Vous êtes le SCP-106",
		{"Votre objectif est de vous échapper à l'établissement",
		"Quand vous touchez quelqu'un, ils se téléportent",
		"a votre pocket dimension"}
	},
	{
		"Vous êtes le SCP-049",
		{"Votre objectif est de vous échapper à l'établissement",
		"Si vous touchez quelqu'un, ils deviendront SCP-049-2"}
	},
	{
		"Vous êtes un gardien MTF",
		{"Votre objectif est de trouver et de sauver",
		"les chercheurs qui sont encore dans l'établissement",
		"Vous devez tuer n'importe quelle classe D ou SCP que vous trouverez",
		"Écoutez les commandes du commandant MTF et respectez votre équipe"}
	},
	{
		"Vous êtes un gardien MTF",
		{"Votre objectif est de tuer chaque espion Insurrection Chaos",
		"Don't trust everyone"}
	},
	{
		"Vous êtes un MTF Commander",
		{"Votre objectif est de trouver et de sauver",
		"les chercheurs qui sont encore dans l'établissement",
		"Vous devez tuer n'importe quelle classe D ou SCP que vous trouverez",
		"Donner des ordres aux gardes pour simplifier la tâche"}
	},
	{
		"Vous êtes un MTF Unit Nine-Tailed Fox",
		{"Votre objectif est de trouver et de sauver",
		"les chercheurs qui sont encore dans l'établissement",
		"Vous devez tuer n'importe quelle classe D ou SCP que vous trouverez",
		"Allez à l'établissement et aidez les gardes à enlacer un chaos"}
	},
	{
		"Vous êtes une classe D",
		{"Votre objectif est de vous échapper à l'établissement",
		"Vous devez coopérer avec d'autres classes D",
		"Rechercher des cartes-clés et attention au MTF et les SCP"}
	},
	{
		"Vous êtes un chercheur",
		{"Votre objectif est de vous échapper à l'établissement",
		"Vous devez trouver un gardien MTF qui vous aidera",
		"Soyez sur le regard des classes D car ils pourraient essayer de vous tuer"}
	},
	{
		"Vous êtes le SCP-049-2",
		{"Votre objectif est de vous échapper à l'établissement",
		"Coopérer avec le SCP-049 pour tuer plus de gens"}
	},
	{
		"Vous êtes le Soldat de l'Insurrection du Chaos",
		{"Votre objectif est de capturer autant de Classe D que possible",
		"Les escorter à l'héliport à l'extérieur de l'établissement",
		"Vous tuerez celui qui vous arreteras"}
	},
	{
		"Vous êtes l'espion de l'insurrection du Chaos",
		{"Votre objectif est de tuer tous les gardiens MTF et de capturer la classe D",
		"Ils ne connaissent pas votre déguisement",
		"Ne détruisez pas votre déguisement",
		"Si vous trouvez une classe d, essayez de les escorter à l'héliport"}
	},
	{
		"Vous êtes le Soldat de l'Insurrection du Chaos",
		{"Votre objectif est de capturer autant de Classe D que possible",
		"Vous tuerez celui qui vous arreteras",
		"Essayez de coopérer avec vos coéquipiers"}
	},
	{
		"Vous êtes un spectateur",
		{'Utilisez la commande "br_spectate" pour revenir'}
	},
	{
		"Vous êtes le SCP-457",
		{"Votre objectif est de vous échapper à l'établissement",
		"Tu brûles toujours",
		"Si vous êtes assez proche d'un être humain, vous les brûlerez"}
	},
	{
		"Vous êtes un gardien MTF",
		{"Votre objectif est de tuer chaque SCP-008-2",
		"À la fin de la préparation, certains MTF seront infectés"}
	},
	{
		"Vous êtes le SCP-008-2",
		{"Votre objectif est d'infecter chaque garde MTF",
		"Si vous attaquez quelqu'un, ils deviendront 008-2 aussi"}
	},
}

french.lang_end1 = "Le jeu se termine ici"
french.lang_end2 = "Le délai a été atteint"
french.lang_end3 = "Jeu terminé en raison de l'incapacité de continuer"

french.escapemessages = {
	{
		main = "Tu t'es échappé",
		txt = "Vous vous êtes échappé de l'établissement en {t} minutes, bon travail!",
		txt2 = "Essayez de vous faire escorter par MTF la prochaine fois pour obtenir des points bonus.",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "Tu t'es échappé",
		txt = "Vous vous êtes échappé de l'établissement en {t} minutes, bon travail!",
		txt2 = "Essayez de vous faire escorter par les soldats du Chaos Insurgency la prochaine fois pour obtenir des points bonus.",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "Vous avez été escorté",
		txt = "Vous avez été escortés en {t} minutes, bon travail!",
		txt2 = "",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "Vous avez été escorté",
		txt = "Vous êtes sorti en {t} minutes, bon travail!",
		txt2 = "",
		clr = team.GetColor(TEAM_SCP)
	}
}



french.ROLE_SCP173 = "SCP-173"
french.ROLE_SCP106 = "SCP-106"
french.ROLE_SCP049 = "SCP-049"
french.ROLE_SCP457 = "SCP-457"
french.ROLE_SCP0492 = "SCP-049-2"
french.ROLE_MTFGUARD = "Gardien MTF"
french.ROLE_MTFCOM = "MTF Commandant"
french.ROLE_MTFNTF = "MTF Nine Tailed Fox"
french.ROLE_CHAOS = "Chaos Insurgency"
french.ROLE_CLASSD = "Classe D"
french.ROLE_RES = "Chercheur"
french.ROLE_SPEC = "Spectateur"

ALLLANGUAGES.french = french
