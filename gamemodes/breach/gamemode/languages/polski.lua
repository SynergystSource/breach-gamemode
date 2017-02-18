
polski = {}

polski.roundtype = "Typ rundy: {type}"
polski.preparing = "Przygotuj się, runda zacznie się za {num} sekund"
polski.round = "Gra się rozpoczeła, powodzenia"

polski.lang_pldied = "{num} graczy zginęło"
polski.lang_descaped = "{num} personel(u) Klasy D zginęło"
polski.lang_sescaped = "{num} obiektów SCP uciekło"
polski.lang_rescaped = "{num} Naukowców uciekło"
polski.lang_dcaptured = "{num} personel(u) Klasy D zostało pojmanych przez Chaos Insurgency"
polski.lang_rescorted = "{num} Naukowców zostało eskortowanych przez MTF"
polski.lang_teleported = "{num} graczy zostało porwane do wymiaru łuzowego"
polski.lang_snapped = "{num} graczy zostało zabitych przez SCP - 173"
polski.lang_zombies = '{num} graczy zostało "wyleczonych" przez SCP - 049'
polski.lang_secret_found = "Sekret nie został odnaleziony"
polski.lang_secret_nfound = "Sekret został odnaleziony"

polski.starttexts = {
	{
		"Jesteś SCP - 173",
		{"Twoim celem jest ucieczka z placówki",
		"Nie możesz sie ruszać jeśli ktoś się na ciebie patrzy",
		"Pamiętaj, ludzie mrugają",
		"PPM aktywuje specjalną moc: możesz oślepić wszystkich w około"}
	},
	{
		"Jesteś SCP - 106",
		{"Twoim celem jest ucieczka z placówki",
		"Jeśli klikniesz na kogoś, przeteleportujesz go do wymiaru łuzowego"}
	},
	{
		"Jesteś SCP - 049",
		{"Twoim celem jest ucieczka z placówki",
		"Jak dotkniesz kogoś, to stanie się SCP-049-2"}
	},
	{
		"Jesteś Ochroniarzem MTF",
		{"Twoim celem jest znalezienie wszystkich naukowców i eliminacja Klasy D",
		"Eskortuj ich do lądowiska",
		"Musisz zabić każdego kto ci przeszkodzi",
		"Słuchaj się swojego Dowódcy i wykonuj jego polecenia"}
	},
	{
		"Jesteś Ochroniarzem MTF",
		{"Twoim celem jest zabicie wszystkich szpiegów z Chaos Insurgency",
		"Nie ufaj nikomu"}
	},
	{
		"Jesteś Dowódcą MTF",
		{"Twoim celem jest znalezienie wszystkich naukowców",
		"Eskortuj ich do lądowiska",
		"Musisz zabić każdego kto ci przeszkodzi",
		"Wydawaj polecenia ochroniarzom"}
	},
	{
		"Jesteś agentem MTF Jednostki Nine-Tailed Fox",
		{"Twoim celem jest znalezienie wszystkich naukowców i eliminacja Klasy D",
		"Eskortuj ich do lądowiska",
		"Musisz zabić każdego kto ci przeszkodzi",
		"Wejdź do placówki i pomóż ochroniarzom"}
	},
	{
		"Jesteś personelem Klasy D",
		{"Twoim celem jest ucieczka z placówki",
		"Pomagaj swoim kolegom, samemu masz nikłe szanse na przeżycie",
		"Szukaj kart dostępu i uważaj na MTF i obiekty SCP"}
	},
	{
		"Jesteś naukowcem",
		{"Twoim celem jest ucieczka z placówki",
		"Szukaj pomocy i spróbuj wydostać się z placówki",
		"Uważaj na klasę D, mogą próbować cię zabić"}
	},
	{
		"Jesteś SCP - 049 - 2",
		{"Twoim celem jest ucieczka z placówki",
		"Pomagaj SCP-049"}
	},
	{
		"Jesteś żołnierzem Chaos Insurgency",
		{"Twoim zadaniem jest pojmanie Klasy D",
		"Eskortuj ich do lądowiska poza placówką",
		"Zabij każdego kto ci przeszkodzi"}
	},
	{
		"Jesteś szpiegiem Chaos Insurgency",
		{"Twoim celem jest zabicie ochroniarzy MTF",
		"Będą myśleć, że jesteś z nimi",
		"Nie zdradź się",
		"Jeśli znajdziesz personel Klasy D lub Naukowców eskortuj ich do lądowiska"}
	},
	{
		"Jesteś żołnierzem Chaos Insurgency",
		{"Twoim celem jest zabicie ochroniarzy MTF",
		"Są w placówce, idź tam i ich zabij",
		"Współpracuj ze swoją drużyną"}
	},
	{
		"Jesteś Obserwatorem",
		{'Użyj komendy "br_spectate" żeby wrócić'}
	},
	{
		"Jesteś SCP-457",
		{"Twoim celem jest ucieczka z placówki",
		"Zawsze się palisz",
		"Jeśli będziesz blisko kogoś, zaczniesz go podpalać"}
	},
	{
		"Jesteś Ochroniarzem MTF",
		{"Twoim celem jest zabicie wszystkich SCP-008-2",
		"Po rozpoczęciu rundy niektórzy zostaną zombie"}
	},
	{
		"Jesteś SCP-008-2",
		{"Twoim celem jest zarażenie wszystkich ochroniaży",
		"Jeśli zaatakujesz kogoś to stanie się 008-2"}
	},
}

polski.lang_end1 = "Runda kończy się w tym miejscu"
polski.lang_end2 = "Czas minął"
polski.lang_end3 = "Gra zakończyła się"

polski.escapemessages = {
	{
		main = "Uciekłeś",
		txt = "Uciekłeś w {t} minut, dobra robota!",
		txt2 = "Następnym razem spróbuj zostać eskortowanym przez MTF żeby dostać bonusowe punkty",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "Uciekłeś",
		txt = "Uciekłeś w {t} minut, dobra robota!",
		txt2 = "Następnym razem spróbuj zostać eskortowanym przez CI żeby dostać bonus punktów",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "Zostałeś eskortowany",
		txt = "Zostałeś eskortowany w {t} minut, dobra robota!",
		txt2 = "",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "Uciekłeś",
		txt = "Uciekłeś w {t} minut, dobra robota!",
		txt2 = "",
		clr = team.GetColor(TEAM_SCP)
	}
}



polski.ROLE_SCP173 = "SCP-173"
polski.ROLE_SCP106 = "SCP-106"
polski.ROLE_SCP049 = "SCP-049"
polski.ROLE_SCP457 = "SCP-457"
polski.ROLE_SCP0492 = "SCP-049-2"
polski.ROLE_MTFGUARD = "Ochroniarz MTF"
polski.ROLE_MTFCOM = "Dowódca MTF"
polski.ROLE_MTFNTF = "MTF Nine-Tailed Fox"
polski.ROLE_CHAOS = "Chaos Insurgency"
polski.ROLE_CLASSD = "Personel Klasy D"
polski.ROLE_RES = "Naukowiec"
polski.ROLE_SPEC = "Obserwator"

ALLLANGUAGES.polski = polski
