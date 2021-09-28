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
	description = "Чем ты занимаешься?";
};                       

FUNC INT DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output (other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //В чем заключается твоя работа?
	AI_Output (self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //Я отвечаю за арену - организую ставки, нанимаю новых бойцов... и все такое.
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
	description = "Я хочу присоединиться к этому Лагерю. Ты можешь мне помочь?";
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
	AI_Output (other,self,"DIA_Scatty_JoinOC_15_00"); //Я хочу присоединиться к этому Лагерю. Ты можешь мне помочь?
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_01"); //Мог бы, если тебе удастся произвести на меня впечатление.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_02"); //Здесь соревнуются лучшие бойцы всех трех Лагерей.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_03"); //Вызови на бой одного из них. Поглядим, насколько ты хорош, и, может быть, я подумаю о твоей просьбе.
	
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kharim;	Kharim = Hlp_GetNpc(Sld_729_Kharim);		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC GorHanis;	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	
	B_LogEntry( CH1_JoinOC,"На Скатти, мастера арены, произведет впечатление, если я вызову на бой одного из воинов.");
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
	description = "Я дрался с Кирго!";
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
	
	AI_Output (other,self,"DIA_Scatty_KirgoSuccess_15_00"); //Я дрался с Кирго!
	if (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_01"); //Да, и проиграл!
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_02"); //Думаю, ты не надеялся удивить меня этим...
		Scatty_ChargeKirgo = LOG_FAILED;
		
		B_LogEntry( CH1_JoinOC,"Победа Кирго надо мной вряд ли произвела на Скатти впечатление.");
	}
	else if (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_03"); //И ты победил его! Совсем неплохо для новичка! Я удивлен!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"Мой бой против Кирго произвел на Скатти впечатление.");
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
	description = "Я сражался с Харимом!";
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
	
	AI_Output (other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //Я сражался с Харимом!
	if (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //Да, и он надрал тебе задницу!
		if (Npc_GetTrueGuild (hero) == GIL_NONE)
		{
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //Ты правильно выбрал противника. Нельзя терпеть этих ублюдков из Нового Лагеря.
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Похоже, ты это понимаешь - как раз такие люди нужны нам!
		};
		Scatty_ChargeKHARIM = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry( CH1_JoinOC,"Харим побил меня! Моя смелость понравилась Скатти, но вот мой бой - нет.");
		
	}
	else if (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //И ты победил его! Должен признать, это было неплохо. Его всегда считали одним из лучших бойцов.
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //Ты удивил меня!
		Scatty_ChargeKHARIM = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"Я надавал Хариму! Скатти остался под впечатлением.");
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
	description = "Почему ты позволяешь бойцам из других Лагерей драться здесь?";
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
	AI_Output (other,self,"DIA_Scatty_OtherCamps_15_00"); //Мне казалось, что Новый Лагерь и Старый Лагерь не очень-то ладят между собой - так почему же ты позволяешь этим людям сражаться здесь?
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_01"); //Все очень просто: они дерутся здесь один раз в неделю, и рудокопам очень нравится смотреть, как раскатывают по земле воров из Нового Лагеря.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_02"); //Когда дерется один из них, люди делают больше ставок - и это, как ты понимаешь, совсем не плохо.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_03"); //Лично я терпеть не могу этих наглецов из Нового Лагеря - но бизнес есть бизнес...
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
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_01"); //Но сейчас же никто не дерется.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_02"); //Следующий бой состоится через несколько дней. Будет дополнительное сообщение.
	
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
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_01"); //Я не могу позволить тебе этого, пока ты не присоединишься к одному из Лагерей!
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_02"); //Никому не нужны независимые бойцы-одиночки!
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
	description = "А вы вообще тренируете бойцов?";
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
    B_LogEntry(GE_TeacherOC,"Скатти, мастер арены, может научить меня сражаться одноручным оружием.");
    log_scattytrain = TRUE;
    };
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_00"); //А вы вообще тренируете бойцов?
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_01"); //Да, но не ради развлечения. Если ты хочешь, чтобы я учил тебя, тебе придется заплатить.


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
	AI_Output (other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Я хотел бы потренироваться с одноручным оружием.
	
	if (Npc_HasItems(other,itminugget) >= 50)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_01"); //Хорошая мысль! Но прежде чем заниматься техникой, тебе нужно научиться правильно держать оружие.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Новички часто держатся за рукоять двумя руками. Это неправильно, к этому лучше не привыкать.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Возьмись за рукоять одной рукой. Лезвие вверх, и не держи его неподвижно.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Оружие должно стать продолжением твоей руки, вписываться в твои движения. Это поможет ускорить атаку.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Если запомнишь все, о чем я тебе говорил, твои удары станут более изящными и быстрыми.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_06"); //Да, и вот еще что: некоторые удары куда эффективнее остальных. У новичка не так много шансов выполнить их.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Но чем больше ты будешь тренироваться, тем лучше они у тебя будут получаться.
			B_GiveInvItems(other,self,itminugget,50);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //У тебя недостаточно руды!
	};
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Расскажи мне еще что-нибудь про одноручное оружие.
	
	if (Npc_HasItems(other,itminugget) >= 150)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //Ладно, ты уже знаешь главное. Если держать клинок немного ниже, первый удар получится более сильным.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Рубящий удар, помнишь? Ладно, теперь о том, как нужно двигаться. Нанеси два удара и разворачивайся - враг наверняка растеряется, а ты окажешься в выгодном положении.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Еще один взмах клинком справа налево...
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //...и возвращаешься в исходную стойку. Главное, не забывай тренироваться. Иди, отрабатывай технику.
			B_GiveInvItems(other,self,itminugget,150);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //Возвращайся, когда наберешь достаточно руды!
	};
};
