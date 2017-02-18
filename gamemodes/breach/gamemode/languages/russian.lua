
russian = {}

russian.roundtype = "Round type: {type}"
russian.preparing = "Приготовьтесь, раунд начнется через {num} секунд"
russian.round = "Игра началась, удачи!"

russian.lang_pldied = "{num} player(s) died"
russian.lang_descaped = "{num} Class D(s) escaped"
russian.lang_sescaped = "{num} SCP(s) escaped"
russian.lang_rescaped = "{num} Researcher(s) escaped"
russian.lang_dcaptured = "{num} Class D(s) were captured by Chaos Insurgency"
russian.lang_rescorted = "{num} Researcher(s) were escorted by MTF"
russian.lang_teleported = "{num} player(s) were captured to Pocket Dimension"
russian.lang_snapped = "{num} neck(s) were snapped by SCP173"
russian.lang_zombies = "{num} human(s) were cured by SCP049"
russian.lang_secret_found = "Secret has been found"
russian.lang_secret_nfound = "Secret has not been found"

russian.starttexts = {
	{
		"Вы SCP-173",
		{"Ваша задача выбраться из комплекса",
		"Вы не можете двигаться пока на вас смотрят",
		"Запомните, люди моргают",
		"У вас есть специальное усиление на правую кнопку мыши: вы телепортируетесь"}
	},
	{
		"Вы SCP-106",
		{"Ваша задача выбраться из комплекса",
		"Вы можете телепортировать людей",
		"В свое карманное измерение "}
	},
	{
		"Вы SCP-049",
		{"Ваша задача выбраться из комплекса",
		"Своим прикосновение вы можете превращать людей в зомби"}
	},
	{
		"Вы MTF охранник",
		{"Ваша задача найти всех и эвакуировать из комплекса",
		"У вас есть возможность убить класс-D, но это уже по вашему выбору",
		"Слушайте приказы MTF коммандира!"}
	},
	{
		"Вы MTF охранник",
		{"Ваша задача убить всех шпионов Хаоса",
		"Не стоит доверять всем"}
	},
	{
		"Вы MTF коммандир",
		{"Ваша задача найти всех и эвакуировать из комплекса",
		"У вас есть возможность убить класс-D, но это уже по вашему выбору",
		"Отдавайте приказы своим подчиненным!"}
	},
	{
		"Вы MFT отряд Девятихвостая Лиса",
		{"У вас есть возможность убить класс-D, но не стоит забывать об SCP",
		"Следуйте в комплекс и помогите Охранникам MTF"}
	},
	{
		"Вы класс-D",
		{"Ваша задача выбраться из комплекса живым",
		"Вам нужно действовать вместе с другими классами-D",
		"Вам нужно искать ключ карты"}
	},
	{
		"Вы ученный",
		{"Ваша задача выбраться из комплекса живым",
		"Вам нужно найти MTF охранну чтобы они помогли вам выбраться",
		"Остерегайтесь Класс-D ни могут убить вас, но не все Класс-D плохие"}
	},
	{
		"Вы SCP-049-2",
		{"Ваша задача выбраться из комплекса",
		"Скооперируйтесь SCP-049 чтобы убить больше людей"}
	},
	{
		"Вы Повстанец Хаоса",
		{"Ваша задача захватить каждого Класса-D",
		"Проведите их к месту высадки",
		"Вы можете убивать кого угодно кроме своих, вас ничто не остановит!"}
	},
	{
		"Вы шпион солдатов Хаоса",
		{"Ваша задача убить всю охранну MTF",
		"Они будут думать во вы их товарищ, но это не так",
		"Убивайте их скрытно, чтобы вас никто не увидел",
		"Вам также нужно найти Класс-D и эвакуировать их на зону посадки"}
	},
	{
		"Вы повстанец Хаоса",
		{"Ваша задача убить всех охранников MTF",
		"Они находятся в входной зоне, убейти их там!",
		"Кооперируйтесь со своими повстанцами"}
	},
	{
		"Вы наблюдатель",
		{"Ожидайте пока окончется раунд!"}
	},
	{
		"Вы SCP-457",
		{"Ваша задача сбежать из комплекса",
		"Вы всегда горите",
		"Если вы достаточно близко к человеку, вы будете сжигать его!"}
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

russian.lang_end1 = "Игра закончилась"
russian.lang_end2 = "Окончание по времени было достигнуто"
russian.lang_end3 = "Игра закончилась в связи невозможностью продолжить ее"

russian.escapemessages = {
	{
		main = "Вы сбежали!",
		txt = "Вы сбежали из комплекса в {t} минут, хорошая работа!",
		txt2 = "В следующий раз постарайтесь сбежать с MTF чтобы получить бонусные очки!",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "Вы сбежали!",
		txt = "Вы сбежали из комплекса в {t} минут, хорошая работа!",
		txt2 = "Try to get escorted by Chaos Insurgency Soldiers next time to get bonus points.",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "Вы были сопровождены",
		txt = "Вы были сопровождены в {t} минут, хорошая работа!",
		txt2 = "",
		clr = team.GetColor(TEAM_SCP)
	},
	{
        main = "Вы сбежали!",
		txt = "Вы сбежали из комплекса в {t} минут, хорошая работа!",
		txt2 = "",
		clr = team.GetColor(TEAM_SCP)
	}
}



russian.ROLE_SCP173 = "SCP-173"
russian.ROLE_SCP106 = "SCP-106"
russian.ROLE_SCP049 = "SCP-049"
russian.ROLE_SCP457 = "SCP-457"
russian.ROLE_SCP0492 = "SCP-049-2"
russian.ROLE_MTFGUARD = "MTF охранник"
russian.ROLE_MTFCOM = "MTF коммандир"
russian.ROLE_MTFNTF = "MTF Девятихвостый Лис"
russian.ROLE_CHAOS = "Повстанец Хаоса"
russian.ROLE_CLASSD = "Класс-D"
russian.ROLE_RES = "Ученный"
russian.ROLE_SPEC = "Наблюдатель"

ALLLANGUAGES.russian = russian
