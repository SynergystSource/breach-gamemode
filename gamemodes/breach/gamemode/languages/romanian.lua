
romanian = {}

romanian.roundtype = "Tipul rundei: {type}"
romanian.preparing = "Pregătiți-vă, runda va începe în {num} secunde"
romanian.round = "Jocul a început, mult noroc!"

romanian.lang_pldied = "{num} jucători au murit"
romanian.lang_descaped = "{num} Class D(s) au scăpat"
romanian.lang_sescaped = "{num} SCP(s) au scăpat"
romanian.lang_rescaped = "{num} Cercetători au scăpat"
romanian.lang_dcaptured = "Chaos Insurgency au capturat {num} Class D(s)"
romanian.lang_rescorted = "MTF au escortat {num} Cercetători"
romanian.lang_teleported = "SCP - 106 a capturat {num} victimi în Dimensiunea de Buzunar "
romanian.lang_snapped = "{num} gâturi au fost rupte de SCP-173"
romanian.lang_zombies = 'SCP - 049 a "vindecat boala" de {num} ori '
romanian.lang_secret_found = "Secret has been found"
romanian.lang_secret_nfound = "Secret has not been found"

romanian.starttexts = {
	{
		"Tu ești SCP-173",
		{"Obiectivul tău este să scapi din clădire.",
		"Nu te poți mișca când cineva se uită la tine",
		"Dar ține minte, oameni clipesc",
		"Ai o abilitate specială cănd apeși RMB: poți orbi pe toată lumea în jurul tău"}
	},
	{
		"Tu ești SCP-106",
		{"Obiectivul tău este să scapi din clădire.",
		"Când atingi pe cineva, ei vor fi teleportați",
		"în dimensiunea ta de buzunar"}
	},
	{
		"Tu ești SCP-049",
		{"Obiectivul tău este să scapi din clădire.",
		"Dacă atingi pe cineva, ei vor deveni SCP-049-2"}
	},
	{
		"Tu ești o gardă MTF",
		{"Obiectivul tău este să găsești și să salvezi toți",
		"cercetătorii care au rămas în clădire",
		"Trebuie să omori orice Class D sau SCP pe care îi găsești",
		"Ascultă ordinele comandantului MTF și stai lângă echipa ta"}
	},
	{
		"Tu ești o gardă MTF",
		{"Obiectivul tău este să omori toți spionii grupului Chaos Insurgency",
		"Să nu ai încredere în nimeni"}
	},
	{
		"Tu ești comandantul MTF",
		{"Obiectivul tău este să găsești și să salvezi toți",
		"cercetătorii care au rămas în clădire",
		"Trebuie să ucizi orice Class D sau SCP pe care îi găsești",
		"Dă ordine gărzilor pentru a simplifica misiunea"}
	},
	{
		"Tu ești o unitate MTF Nine-Tailed Fox",
		{"Obiectivul tău este să găsești și să salvezi toți",
		"cercetătorii care au rămas în clădire",
		"Trebuie să omori orice Class D sau SCP pe care îi găsești",
		"Intră în clădire și ajută gărzile să controleze haosul"}
	},
	{
		"Tu ești un Class D",
		{"Obiectivul tău este să scapi din clădire",
		"Trebuie să cooperezi cu alți Class Ds",
		"Caută cartele de acces și ai grijă la MTF și SCPs"}
	},
	{
		"Tu ești un Cercetător",
		{"Obiectivul tău este să scapi din clădire",
		"Trebuie să găsești o gardă MTF care să te ajute",
		"Ai grijă la Class Ds deoarece ar putea să încerce să te omoare"}
	},
	{
		"Tu ești un SCP-049-2",
		{"Obiectivul tău este să scapi din clădire",
		"Cooperează cu SCP-049 ca să omori mai mulți oameni"}
	},
	{
		"Tu ești un soldat Chaos Insurgency",
		{"Obiectivul tău este să capturezi cât mai mulți Class Ds cât e posibil",
		"Escortează-i afară către rampa de lansare a elicopterului",
		"Trebuie să omori pe oricine îți stă în cale"}
	},
	{
		"Tu ești un spion din Chaos Insurgency",
		{"Obiectivul tău este să omori toate gărzile MTF și să capturezi class Ds",
		"MTF nu-ți cunosc deghizarea",
		"Așa că nu o distruge",
		"Dacă găsești un Class D, escortează-l la rampa de lansare a elicopterului"}
	},
	{
		"Tu ești un soldat Chaos Insurgency",
		{"Obiectivul tău este să omori toate gărzile MTF și să capturezi class Ds",
		"Ei sunt în clădire, intră și omoarăi",
		"Încearcă să cooperezi cu coechipierii tăi"}
	},
	{
		"Tu ești un Spectator",
		{'Folosește comanda "br_spectate" pentru a te întoarce'}
	},
	{
		"Tu ești SCP-457",
		{"Obiectivul tău este să scapi din clădire.",
		"Tu ești mereu în flăcări",
		"Dacă ești destul de aproape de un om, o să îl arzi"}
	},
}

romanian.lang_end1 = "Jocul se termină aici"
romanian.lang_end2 = "Limita de timp a expirat"
romanian.lang_end3 = "Jocul s-a terminat deoarece nu mai poate fi continuat"

romanian.escapemessages = {
	{
		main = "Ai scăpat",
		txt = "Ai scăpat din clădire în {t} minute, bravo!",
		txt2 = "Încearcă să fi escortat de o gardă MTF data viitoate pentru a primii puncte în plus.",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "Ai scăpat",
		txt = "Ai scăpat din clădire în {t} minute, bravo!",
		txt2 = "Încearcă să fi escortat de Chaos Insurgency data viitoate pentru a primii puncte în plus.",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "Ai fost escortat",
		txt = "Ai fost escortat în {t} minute, bravo!",
		txt2 = "",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "Ai scăpat",
		txt = "Ai scăpat în {t} minute, bravo!",
		txt2 = "",
		clr = team.GetColor(TEAM_SCP)
	}
}



romanian.ROLE_SCP173 = "SCP-173"
romanian.ROLE_SCP106 = "SCP-106"
romanian.ROLE_SCP049 = "SCP-049"
romanian.ROLE_SCP457 = "SCP-457"
romanian.ROLE_SCP0492 = "SCP-049-2"
romanian.ROLE_MTFGUARD = "Gardă MTF"
romanian.ROLE_MTFCOM = "Comandant MTF"
romanian.ROLE_MTFNTF = "MTF Nine-Tailed Fox"
romanian.ROLE_CHAOS = "Chaos Insurgency"
romanian.ROLE_CLASSD = "Personal Class D"
romanian.ROLE_RES = "Cercetător"
romanian.ROLE_SPEC = "Spectator"

ALLLANGUAGES.romanian = romanian