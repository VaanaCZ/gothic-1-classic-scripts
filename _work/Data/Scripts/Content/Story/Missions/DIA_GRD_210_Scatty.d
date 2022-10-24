// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Scatty_Exit (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 999;
	condition	= DIA_Scatty_Exit_Condition;
	information	= DIA_Scatty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Scatty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Was machst du hier 
// **************************************************

INSTANCE DIA_Scatty_WhatDoYouDo (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WhatDoYouDo_Condition;
	information	= DIA_Scatty_WhatDoYouDo_Info;
	permanent	= 0;
	description = "Что ты здесь делаешь?";
};                       

FUNC INT DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output (other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //Что ты здесь делаешь?
	AI_Output (self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //Я отвечаю за бои на арене: организую ставки, нанимаю бойцов, ну, еще что-то делаю.
};

// **************************************************
// 					 Join OC
// **************************************************
	var int Scatty_ChargeKirgo;
	var int Scatty_ChargeKharim;
	var int Scatty_ChargeGorHanis;
// **************************************************

INSTANCE DIA_Scatty_JoinOC (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_JoinOC_Condition;
	information	= DIA_Scatty_JoinOC_Info;
	permanent	= 0;
	description = "Я хочу присоединиться к этому лагерю. Ты можешь мне помочь?";
};                       

FUNC INT DIA_Scatty_JoinOC_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Scatty_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Scatty_JoinOC_15_00"); //Я хочу присоединиться к этому лагерю. Ты можешь мне помочь?
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_01"); //Если ты сможешь удивить меня, то, может быть, помогу.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_02"); //У меня на арене состязаются лучшие бойцы трех лагерей.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_03"); //Вызови кого-нибудь из них на бой, а я посмотрю, как ты себя покажешь. Ну, а там увидим, смогу ли я тебе помочь.
	
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kharim;	Kharim = Hlp_GetNpc(Sld_729_Kharim);		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC GorHanis;	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	
	B_LogEntry( CH1_JoinOC, "Скатти, распорядитель боев на арене, будет удивлен, если я вызову одного из бойцов.");
};

// **************************************************
// 					 KIRGO SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KirgoSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KirgoSuccess_Condition;
	information	= DIA_Scatty_KirgoSuccess_Info;
	permanent	= 0;
	description = "Я сразился с Кирго!";
};                       

FUNC INT DIA_Scatty_KirgoSuccess_Condition()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			

	if ( (Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ( (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KirgoSuccess_Info()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);	
	
	AI_Output (other,self,"DIA_Scatty_KirgoSuccess_15_00"); //Я сразился с Кирго!
	if (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_01"); //И ты просто так отдал ему победу?!
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_02"); //Думаю, ты уже знаешь, что этим меня не удивить...
		Scatty_ChargeKirgo = LOG_FAILED;
		
		B_LogEntry( CH1_JoinOC, "Мое поражение в бою с Кирго не принесло мне расположения Скатти.");
	}
	else if (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_03"); //Ты победил его! Неплохо для новичка! Ты действительно удивил меня!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC, "Скатти был удивлен моими успехами в бою с Кирго.");
		B_GiveXP (XP_kirgovictory);
	};
};

// **************************************************
// 					 KHARIM SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KHARIMSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KHARIMSuccess_Condition;
	information	= DIA_Scatty_KHARIMSuccess_Info;
	permanent	= 0;
	description = "Я сразился с Каримом!";
};                       

FUNC INT DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);			

	if ( (Scatty_ChargeKHARIM == LOG_RUNNING) && (Kharim_Charged == TRUE) && ( (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KHARIMSuccess_Info()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);	
	
	AI_Output (other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //Я сразился с Каримом!
	if (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //Да, как же и он тебя избил!
		if (Npc_GetTrueGuild (hero) == GIL_NONE)
		{
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //Хорошо, что ты выбрал именно этого противника! Я терпеть не могу этих лентяев из Нового лагеря. 
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Мне кажется, ты тоже так думаешь. Такой человек, как ты, нам еще пригодится!
		};
		Scatty_ChargeKHARIM = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry( CH1_JoinOC, "Я проиграл бой с Каримом! Моя смелость порадовала Скатти, а вот боевые таланты - не очень.");
		
	}
	else if (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //Ты победил его! Признаться, я от тебя такого не ожидал. Он считался одним из самых сильных бойцов.
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //Ты действительно удивил меня!
		Scatty_ChargeKHARIM = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC, "Я показал Кариму, как нужно драться! Скатти был впечатлен.");
		B_GiveXP(XP_kharimvictory);
	};
};


// **************************************************
// 				 Warum andere Lager Kдmpfer
// **************************************************

INSTANCE DIA_Scatty_OtherCamps (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_OtherCamps_Condition;
	information	= DIA_Scatty_OtherCamps_Info;
	permanent	= 0;
	description = "Почему же люди из Старого и Нового лагеря сражаются здесь?";
};                       

FUNC INT DIA_Scatty_OtherCamps_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_OtherCamps_Info()
{
	AI_Output (other,self,"DIA_Scatty_OtherCamps_15_00"); //Я думал, что отношения между людьми из Старого и Нового лагеря не самые дружеские. Почему же они сражаются здесь? 
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_01"); //Все просто: раз в неделю на арене устраиваются бои, а рудокопы после тяжелой работы с удовольствием приходят посмотреть, как наши бойцы бьют лентяев из Нового лагеря.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_02"); //Обычно наши люди делают больше ставок, когда дерется кто-нибудь из них.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_03"); //Лично мне не нравятся люди из Нового лагеря, но дело есть дело...
};

// **************************************************
// 					Will Wetten
// **************************************************

INSTANCE DIA_Scatty_WannaBet (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaBet_Condition;
	information	= DIA_Scatty_WannaBet_Info;
	permanent	= 1;
	description = "Я хочу сделать ставку.";
};                       

FUNC INT DIA_Scatty_WannaBet_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_WannaBet_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaBet_15_00"); //Я хочу сделать ставку.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_01"); //Но сейчас никто не дерется.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_02"); //Следующий бой состоится через несколько дней. Об этом будет объявлено заранее.
	
};

// **************************************************
// 					Will Kдmpfen
// **************************************************

INSTANCE DIA_Scatty_WannaFight (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaFight_Condition;
	information	= DIA_Scatty_WannaFight_Info;
	permanent	= 1;
	description = "Я хочу сражаться на арене!";
};                       

FUNC INT DIA_Scatty_WannaFight_Condition()
{
//	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
//	{
//		return 1;
//	};
};

FUNC VOID DIA_Scatty_WannaFight_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaFight_15_00"); //Я хочу сражаться на арене!
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_01"); //Ты еще не вступил ни в один из лагерей, поэтому я не разрешу тебе выходить на арену!
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_02"); //Никто не захочет видеть здесь независимого бойца-одиночку!
};

// **************************************************
// 					TRAIN
// **************************************************

INSTANCE DIA_Scatty_TRAIN (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 10;
	condition	= DIA_Scatty_TRAIN_Condition;
	information	= DIA_Scatty_TRAIN_Info;
	permanent	= 1;
	description = "А ты тренируешь бойцов?";
};                       

FUNC INT DIA_Scatty_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_TRAIN_Info()
{
	if( log_scattytrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
    B_LogEntry(GE_TeacherOC, "Скатти, распорядитель боев на арене, может научить меня обращаться с одноручным мечом.");
    log_scattytrain = TRUE;
    };
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_00"); //А ты тренируешь бойцов?
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_01"); //Конечно, но я делаю это не ради развлечения. Если хочешь, чтобы я тебя тренировал, придется заплатить.


	Info_ClearChoices	(DIA_Scatty_TRAIN );
	Info_AddChoice		(DIA_Scatty_TRAIN,DIALOG_BACK		,DIA_Scatty_TRAIN_BACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,150)	,DIA_Scatty_TRAIN_2h);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,50)	,DIA_Scatty_TRAIN_1h);
	};
};

func void DIA_Scatty_TRAIN_BACK()
{
	Info_ClearChoices	(DIA_Scatty_TRAIN );
};

func void DIA_Scatty_TRAIN_1h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Я хотел бы научиться лучше владеть одноручным мечом.
	
	if (Npc_HasItems(other,itminugget) >= 50)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_01"); //Хороший выбор! Чтобы улучшить технику ведения боя, ты должен научиться правильно держать оружие.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Начиная тренироваться, многие неопытные воины стараются держать рукоять меча двумя руками. Это ненужная привычка, которая может помешать тебе в дальнейшем. 
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Держи меч одной рукой. Клинок направь вверх и не держи его неподвижно.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Ты должен научиться чувствовать меч как часть самого себя, и тогда его движения будут согласованы с движениями твоего тела. Это увеличит скорость атаки.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Если ты будешь следовать моим советам, ты сможешь виртуозно вести бой. Но самое главное, твои движения станут быстрее.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_06"); //Да, есть еще кое-что: некоторые удары наносят большее повреждение противнику. Ты еще новичок, поэтому у тебя не так много шансов на решающий удар.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Но частые тренировки помогут тебе совершенствоваться и наносить все больше таких ударов.
			B_GiveInvItems(other,self,itminugget,50);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Твоей руды недостаточно!
	};
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Научи меня лучше владеть одноручным мечом.
	
	if (Npc_HasItems(other,itminugget) >= 150)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //Ты уже получил начальное представление о владении этим оружием. Если ты будешь держать меч клинком вниз, ты сможешь вложить большую силу в свой первый удар.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Помнишь, что я говорил о хорошем размахе? Следующий шаг на пути к мастерству - умение использовать движения собственного тела. Если ты успел нанести два удара, сделай разворот. Это отвлечет противника и даст тебе возможность выбрать более удачную позицию.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Затем размахнись и нанеси удар справа налево.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //И вернись в исходную стойку. Не забывай при этом, что мастерство приходит с опытом. А теперь иди и не забывай о тренировках.
			B_GiveInvItems(other,self,itminugget,150);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //Приходи, когда у тебя будет больше руды!
	};
};
