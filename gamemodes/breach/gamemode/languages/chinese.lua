
chinese = {}

chinese.roundtype = "回合种类: {type}"
chinese.preparing = "准备, 本回合将在 {num} 秒后开始"
chinese.round = "游戏已开始,祝你好运!"

chinese.lang_pldied = "{num} 个玩家已死亡"
chinese.lang_descaped = "{num} 个D级人员已逃脱"
chinese.lang_sescaped = "{num} 个SCP已逃脱"
chinese.lang_rescaped = "{num} 个研究员已逃脱"
chinese.lang_dcaptured = "混沌分裂者已经虏获了 {num} 个D级人员"
chinese.lang_rescorted = "机动特遣队已经护送了 {num} 个研究员"
chinese.lang_teleported = "SCP - 106 已经抓住了 {num} 个受害者到了口袋次元中"
chinese.lang_snapped = "{num} 个脖子已被SCP173割断"
chinese.lang_zombies = 'SCP - 049 "治愈瘟疫" {num} 次 '
chinese.lang_secret_found = "秘密已经被发现"
chinese.lang_secret_nfound = "秘密还未被发现"

chinese.starttexts = {
	{
		"你现在是 SCP-173",
		{"你的目标是逃离设施",
		"当有人看着你时，你不能移动",
		"但是记住，人类会眨眼",
		"你可以通过鼠标右键来使用特殊能力：使周围所有的人变瞎"}
	},
	{
		"你现在是SCP-106",
		{"你的目标是逃离设施",
		"当你碰到某个人的时候,他们将会进入",
		"你的口袋次元之中"}
	},
	{
		"你现在是SCP-049",
		{"你的目标是逃离设施",
		"如果你碰到某个人,他们将会变成SCP-049-2"}
	},
	{
		"你现在是机动特遣队队员",
		{"你的目标是找到和救援所有",
		"仍旧留在设施内的研究员",
		"你需要击杀所有你找得到的D级人员或者SCP",
		"听从机动特遣队指挥官的命令，并跟紧你的团队"}
	},
	{
		"你现在是机动特遣队队员",
		{"你的目标是击杀所有混沌分裂者间谍",
		"不要相信任何人"}
	},
	{
		"你现在是机动特遣队队长",
		{"你的目标是找到和救援所有",
		"仍旧留在设施内的研究员",
		"你需要击杀所有你找得到的D级人员或者SCP",
		"给予一些简单的命令给你的队员"}
	},
	{
		"你是机动特遣队-九尾狐小队",
		{"你的目标是找到和救援所有",
		"仍旧留在设施内的研究员",
		"你需要击杀所有你找得到的D级人员或者SCP",
		"去设施并帮助机动特遣队"}
	},
	{
		"你是D级人员",
		{"你的目标是逃离设施",
		"你需要和其他D级人员合作",
		"寻找钥匙卡并防范SCP和机动特遣队"}
	},
	{
		"你是研究员",
		{"你的目标是逃离设施",
		"你需要寻找会帮你的机动特遣队队员",
		"注意躲避D级人员他们会杀了你"}
	},
	{
		"你现在是SCP-049-2",
		{"你的目标是逃离设施",
		"和SCP-049共同合作并击杀更多人"}
	},
	{
		"你现在是混沌分裂者士兵",
		{"你的目标是俘获尽可能多的D级人员",
		"护送他们到设施的直升机停机坪帮助他们逃出去",
		"你需要击杀所有会阻止你的人"}
	},
	{
		"你是混沌分裂者间谍",
		{"你的目标是击杀所有的机动特遣队队员并俘获D级人员",
		"他们不知道你的伪装",
		"不要暴露你自己",
		"如果你找到任何D级人员请护送他们到设施的直升机停机坪帮助他们逃出去"}
	},
	{
		"你现在是混沌分裂者士兵",
		{"你的目标是击杀机动特遣队队员并俘获尽可能多的D级人员",
		"他们在设施里, 进去并杀了他们",
		"尝试和你的队友合作"}
	},
	{
		"你现在是观察者",
		{'使用指令 "br_spectate" 来退出观察者'}
	},
	{
		"你现在是SCP-457",
		{"你的目标是逃离设施",
		"你总是在燃烧",
		"如果你离一个人类够近,你会让他们也燃烧"}
	},
	{
		"你现在是机动特遣队队员",
		{"你的目的是杀光SCP-008-2",
		"在准备阶段结束的时候一些机动特遣队队员将会被感染"}
	},
	{
		"你现在是SCP-008-2",
		{"你的目的是感染所有的机动特遣队队员",
		"如果你攻击某个人,他们也会变成SCP-008-2"}
	},
}

chinese.lang_end1 = "游戏到此结束"
chinese.lang_end2 = "时间已达到限制"
chinese.lang_end3 = "游戏由于无法继续而结束"

chinese.escapemessages = {
	{
		main = "你成功逃脱了",
		txt = "你花了 {t} 分钟来逃离设施,干得好!",
		txt2 = "下次尝试被机动特遣队队员护送来获得更多分数.",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "你成功逃脱了",
		txt = "你花了 {t} 分钟来逃离设施,干得好!",
		txt2 = "下次尝试被混沌分裂者护送来获得更多分数.",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "你被成功护送了",
		txt = "你花了 {t} 分钟来成功被护送,干得好!",
		txt2 = "",
		clr = team.GetColor(TEAM_SCP)
	},
	{
		main = "你成功逃脱了",
		txt = "你花了 {t} 分钟来逃离设施,干得好!",
		txt2 = "",
		clr = team.GetColor(TEAM_SCP)
	}
}



chinese.ROLE_SCP173 = "SCP-173"
chinese.ROLE_SCP106 = "SCP-106"
chinese.ROLE_SCP049 = "SCP-049"
chinese.ROLE_SCP457 = "SCP-457"
chinese.ROLE_SCP0492 = "SCP-049-2"
chinese.ROLE_MTFGUARD = "机动特遣队队员"
chinese.ROLE_MTFCOM = "机动特遣队队长"
chinese.ROLE_MTFNTF = "机动特遣队九尾狐"
chinese.ROLE_CHAOS = "混沌分裂者"
chinese.ROLE_CLASSD = "D级人员"
chinese.ROLE_RES = "研究员"
chinese.ROLE_SPEC = "观察者"

ALLLANGUAGES.chinese = chinese