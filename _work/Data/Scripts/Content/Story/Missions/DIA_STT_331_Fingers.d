// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_331_Fingers_Exit (C_INFO)
{
	npc			= STT_331_Fingers;
	nr			= 999;
	condition	= DIA_STT_331_Fingers_Exit_Condition;
	information	= DIA_STT_331_Fingers_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_331_Fingers_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_331_Fingers_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				 Schatten werden
// **************************************************
	var int Fingers_CanTeach;
// **************************************************

INSTANCE DIA_Fingers_BecomeShadow (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_BecomeShadow_Condition;
	information		= DIA_Fingers_BecomeShadow_Info;
	permanent		= 1;
	description		= "Я хочу стать Призраком."; 
};

FUNC INT DIA_Fingers_BecomeShadow_Condition()
{	
	if ( (Fingers_CanTeach == FALSE) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_BecomeShadow_Info()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_15_00"); //Я хочу стать Призраком.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_05_01"); //И что?
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
	Info_AddChoice		(DIA_Fingers_BecomeShadow,DIALOG_BACK										,DIA_Fingers_BecomeShadow_BACK);
	if (Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice		(DIA_Fingers_BecomeShadow,"Мне нужен человек, который сможет меня чему-нибудь научить."	,DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice		(DIA_Fingers_BecomeShadow,"Ты мог бы помочь мне?"					,DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_AnyTips_15_00"); //Ты мог бы помочь мне?
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_AnyTips_05_01"); //Я не знаю, как...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_00"); //Мне нужен человек, который сможет меня чему-нибудь научить.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_01"); //Зачем ты меня нашел?
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_02"); //Меня прислал Диего.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_03"); //Ты должен был сразу сказать это мне.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_04"); //Если ты хочешь, чтобы тебя приняли в лагерь, ты должен стать хорошим вором или бойцом.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_05"); //Влиятельные Призраки будут испытывать тебя. Они дадут задание, на котором ты не должен попасться.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_06"); //Поэтому для начала тебе следует избрать путь вора.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_07"); //К счастью, я лучший вор, какого только можно найти в Старом лагере.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry			(GE_TeacherOC,"Фингерс может научить меня воровать и взламывать замки.");
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

// **************************************************
// 						 Lehrer
// **************************************************
	var int Fingers_Wherecavalorn;

INSTANCE DIA_Fingers_Lehrer (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Lehrer_Condition;
	information		= DIA_Fingers_Lehrer_Info;
	permanent		= 1;
	description		= "Ты можешь научить меня чему-нибудь?"; 
};

FUNC INT DIA_Fingers_Lehrer_Condition()
{	
	if (Fingers_CanTeach == TRUE)
	{
		return 1;	
	};
};

FUNC VOID DIA_Fingers_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_15_00"); //Ты можешь научить меня чему-нибудь?
	AI_Output (self, other,"DIA_Fingers_Lehrer_05_02"); //Зависит от того, что ты хочешь узнать.



	Info_ClearChoices	(DIA_Fingers_Lehrer);
	Info_AddChoice		(DIA_Fingers_Lehrer,DIALOG_BACK																	,DIA_Fingers_Lehrer_BACK);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2	,	LPCOST_TALENT_PICKPOCKET_2,0)	,DIA_Fingers_Lehrer_Pickpocket2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1	,	LPCOST_TALENT_PICKPOCKET_1,0)	,DIA_Fingers_Lehrer_Pickpocket);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2		,	LPCOST_TALENT_PICKLOCK_2,0)	,DIA_Fingers_Lehrer_Lockpick2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1		,	LPCOST_TALENT_PICKLOCK_1,0)	,DIA_Fingers_Lehrer_Lockpick);
	Info_AddChoice		(DIA_Fingers_Lehrer,"Я хочу научиться подкрадываться." 								,DIA_Fingers_Lehrer_Schleichen);
};


func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Schleichen_15_00"); //Я хочу научиться подкрадываться.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_01"); //Я думаю, мое мнение разделяют многие, что я лучший вор, когда-либо попадавший в эту колонию.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_02"); //Но если ты действительно хочешь научиться подкрадываться, то тебе следует обратиться к Кавалорну!
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick_15_00"); //Я хотел бы знать, как вскрывать замки.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_01"); //Хочешь, я тебя научу? Это не слишком сложно.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_02"); //Очень важно следить за тем, чтобы у тебя не сломалась отмычка.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_03"); //Если ты будешь действовать очень осторожно, ты заметишь, что во многих случаях тебе не понадобится больше одной отмычки.
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick2_15_00"); //Я хочу знать все о взломе замков.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_01"); //После некоторых тренировок ты сможешь распознать момент, когда отмычка вот-вот сломается. Это будет заметно по звуку.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_02"); //С опытом к тебе придет умение различать щелчки в замке при повороте отмычки. При этом ты будешь ломать их гораздо реже.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_03"); //Настоящему профессионалу часто удается открыть замок, не сломав ни одной отмычки.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //Я хочу стать хорошим карманником.
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //Так ты хочешь облегчать кошельки местных богачей, да? Что ж.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //Риск будет оправдан только в том случае, если ты остаешься один на один со своей жертвой.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //Но только профессиональный вор может совершенно незаметно вытащить что-нибудь ценное из кармана зазевавшегося прохожего!
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //Незаметно вытащить вещь из чьего-то кармана ты сможешь только тогда, когда станешь настоящим профессионалом.
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //Ничего не выйдет! Тот, кто не умеет подкрадываться, никогда не станет настоящим вором.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Pickpocket2_15_00"); //Я хочу знать все о карманных кражах.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_01"); //Думаю, ты уже готов постичь тайны моего мастерства.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_02"); //Но даже лучшего вора могут застать на месте преступления.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Будь осторожен.
	};
};

func VOID DIA_Fingers_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Fingers_Lehrer );
};

// **************************************************
// 					Wo Cavalorn
// **************************************************

INSTANCE DIA_Fingers_WhereCavalorn (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_WhereCavalorn_Condition;
	information		= DIA_Fingers_WhereCavalorn_Info;
	permanent		= 1;
	description		= "Где можно найти Кавалорна?"; 
};

FUNC INT DIA_Fingers_WhereCavalorn_Condition()
{	
	if (Fingers_Wherecavalorn == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_WhereCavalorn_Info()
{
	AI_Output (other, self,"DIA_Fingers_WhereCavalorn_15_00"); //Где можно найти Кавалорна?
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_01"); //Он охотится в диких лесах. Ты найдешь его на пути к Новому лагерю. К западу от Старого лагеря расположено широкое ущелье.
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_02"); //В нем ты увидишь старую хижину лесорубов. Он живет именно там.
	
	B_LogEntry( GE_TeacherOW, "Кавалорн может научить меня подкрадываться. Его дом находится в неглубоком ущелье к западу от Старого лагеря, по дороге в Новый лагерь.");
};

// **************************************************
// 					Gutes Wort
// **************************************************
	var int Fingers_Learnt;
// **************************************************

INSTANCE DIA_Fingers_Learnt (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Learnt_Condition;
	information		= DIA_Fingers_Learnt_Info;
	permanent		= 1;
	description		= "Ты можешь замолвить за меня словечко перед Диего?"; 
};

FUNC INT DIA_Fingers_Learnt_Condition()
{	
	if ( (Fingers_Learnt != LOG_SUCCESS) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Learnt_Info()
{
	AI_Output (other, self,"DIA_Fingers_Learnt_15_00"); //Ты можешь замолвить за меня словечко перед Диего?

	if ( Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK)+Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET)+Npc_GetTalentSkill(other, NPC_TALENT_SNEAK)	> 0)
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_01"); //Да, ты уже многое знаешь, твои знания пригодятся нашему лагерю.
		AI_Output (self, other,"DIA_Fingers_Learnt_05_02"); //Нам нужны опытные воры. Я отдам за тебя свой голос.
		Fingers_Learnt = LOG_SUCCESS;
		
		B_GiveXP (XP_Fingerstrain);
		B_LogEntry( CH1_JoinOC, "Фингерсу нравится, как я работаю.");
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_03"); //Все не так просто...
		AI_Output (self, other,"DIA_Fingers_Learnt_05_04"); //Если ты покажешь себя с лучшей стороны, мы примем тебя!
		AI_Output (other, self,"DIA_Fingers_Learnt_15_05"); //И как это сделать?
		AI_Output (self, other,"DIA_Fingers_Learnt_05_06"); //Найди себе хорошего учителя. Когда ты научишься подкрадываться или открывать замки, тогда я смогу тебе помочь.
		Fingers_Learnt = LOG_RUNNING;
		
		B_LogEntry( CH1_JoinOC, "Фингерс сможет замолвить за меня словечко, если я смогу обучиться одному из воровских навыков.");
	};
};




























