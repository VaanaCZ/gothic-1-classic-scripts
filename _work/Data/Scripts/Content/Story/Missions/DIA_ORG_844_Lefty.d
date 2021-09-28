// **************************************
//					EXIT 
// **************************************

instance DIA_Lefty_Exit (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 999;
	condition	= DIA_Lefty_Exit_Condition;
	information	= DIA_Lefty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Lefty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Lefty_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				First At Night
// **************************************

instance DIA_Lefty_FirstAtNight (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_FirstAtNight_Condition;
	information	= DIA_Lefty_FirstAtNight_Info;
	permanent	= 0;
	description = "Чем ты занимаешься?";
};                       

FUNC int DIA_Lefty_FirstAtNight_Condition()
{
	if	(Wld_IsTime(19,00,08,00))
	&&	(!Npc_KnowsInfo(hero,DIA_Lefty_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_FirstAtNight_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Чем ты занимаешься?
	AI_Output (self, other,"DIA_846_Hello_07_01"); //Я работаю на Лорда.
	AI_Output (other, self,"DIA_Ricelord_Arbeit_15_00"); //А у тебя есть для меня работа?
	AI_Output (self, other,"DIA_Shrike_GetLost_07_01"); //Поговорим позже.
	AI_StopProcessInfos	(self);
};

// **************************************
//				First
// **************************************

instance DIA_Lefty_First (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_First_Condition;
	information	= DIA_Lefty_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Lefty_First_Condition()
{
	if	(Wld_IsTime(08,00,19,00))
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_First_Info()
{
	AI_Output (self, other,"DIA_Lefty_First_07_00"); //Эй! Новенький? Мы ищем человека, чтобы он отнес воду крестьянам на рисовые поля. 
	AI_Output (self, other,"DIA_Lefty_First_07_01"); //Тебе сейчас нужно обзаводиться новыми друзьями. Что скажешь? 
	
	Log_CreateTopic		(CH1_CarryWater,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_RUNNING);
	B_LogEntry			(CH1_CarryWater,"Вор из Нового Лагеря по имени Лефти хочет, чтобы я отнес воду крестьянам на рисовые поля.");
	
	Info_ClearChoices	(DIA_Lefty_First );
	Info_AddChoice		(DIA_Lefty_First,"В другой раз.",DIA_Lefty_First_Later);
	Info_AddChoice		(DIA_Lefty_First,"Сам тащи воду своим крестьянам!",DIA_Lefty_First_Never);
	Info_AddChoice		(DIA_Lefty_First,"Буду рад помочь.",DIA_Lefty_First_Yes);
};

func void DIA_Lefty_First_Yes()
{
	AI_Output (other, self,"DIA_Lefty_First_Yes_15_00"); //Буду рад помочь.
	AI_Output (self, other,"DIA_Lefty_First_Yes_07_01"); //Отлично! Отправляйся к Лорду. Он даст тебе воду и расскажет все, что нужно. 
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_RUNNING;
	An_Bauern_verteilt = 0;
	B_LogEntry			(CH1_CarryWater,"Может, это и глупая задача, но я согласился, потому что именно так и заводят знакомства. Мне нужно сначала забрать воду у так называемого Лорда.");

	Info_ClearChoices	(DIA_Lefty_First);
};

func void DIA_Lefty_First_Never()
{
	AI_Output (other, self,"DIA_Lefty_First_Never_15_00"); //Сам тащи воду своим крестьянам!
	AI_Output (self, other,"DIA_Lefty_First_Never_07_01"); //Хамить друзьям - это плохо. Я научу тебя хорошим манерам!
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_FAILED;
	B_LogEntry			(CH1_CarryWater,"Лефти очень не понравилось то, что я отверг его предложение. А я-то думал, что это в Старом Лагере жить тяжело.");
	
	Info_ClearChoices	(DIA_Lefty_First );
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_First_Later()
{
	AI_Output (other, self,"DIA_Lefty_First_Later_15_00"); //Может быть позже...
	AI_Output (self, other,"DIA_Lefty_First_Later_07_01"); //Позже' будет уже поздно. Твоя помощь мне нужна СЕЙЧАС. Ты хочешь мне помочь или нет?
};

// **************************************
//				Every Day
// **************************************
var int CarriedWaterForLefty;
// **************************************

instance DIA_Lefty_WorkDay (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_WorkDay_Condition;
	information	= DIA_Lefty_WorkDay_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC int DIA_Lefty_WorkDay_Condition()
{
	if	(Wld_IsTime(08,00,19,00) || (Lefty_Mission == LOG_SUCCESS))				// wenn Wasser verteilt, dann auch abends am Lagerfeuer!
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	&&	((Lefty_WorkDay <= Wld_GetDay()-1) || (Lefty_Mission == LOG_SUCCESS))	// wenn Wasser verteilt, dann auch noch am selben Tag! 
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_WorkDay_Info()
{
	AI_Output (self, other,"DIA_Lefty_WorkDay_07_00"); //Эй, ты!
	
	if (Lefty_Mission == LOG_FAILED)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_00"); //Тебе повезло! Я даю тебе еще один шанс.
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_01"); //Постарайся не облажаться на этот раз! Отправляйся к Лорду, забирай воду и тащи ее крестьянам. Усек? 
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		B_LogEntry			(CH1_CarryWater,"Я снова встретил Лефти! Он хочет, чтобы я пошел к Лорду и забрал воду для крестьян на рисовых полях.");
		
		AI_StopProcessInfos	(self);
	}
	else if (Lefty_Mission == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_00"); //Я же велел тебе отнести воду крестьянам!
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_01"); //Не люблю людей, которые раздают обещания, а потом не выполняют их!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_FAILED;
		B_LogEntry			(CH1_CarryWater,"Лефти просто с ума сошел, когда услышал, что я так и не разобрался с водой до сих пор! Забавный паренек этот Лефти.");
		
		AI_StopProcessInfos	(self);
		Npc_SetTarget (self, other);
		AI_StartState (self, ZS_ATTACK, 1, "");
	}
	else if (Lefty_Mission == LOG_SUCCESS)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_00"); //Хорошо! Кое для чего ты все-таки годишься.
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_01"); //Думаю, это дело как раз для тебя. Теперь ты будешь разносить воду каждый день. И хватит отдыхать - иди, займись делом!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		if	!CarriedWaterForLefty
		{
			B_LogEntry		(CH1_CarryWater,"Ушам своим не верю. Я доставил воду всем нуждавшимся, но теперь Лефти хочет, чтобы я этим каждый день занимался. Думаю, этому тупице надо объяснить пару вещей подоступнее.");
			B_GiveXP		(XP_LeftyCarriedWater);
			CarriedWaterForLefty = TRUE;
		};
		
		AI_StopProcessInfos	(self);
	};
};

// **************************************
//				NICHT MEHR
// **************************************

instance DIA_Lefty_NeverAgain (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_NeverAgain_Condition;
	information	= DIA_Lefty_NeverAgain_Info;
	permanent	= 1;
	description	= "Теперь ты можешь носить эту воду сам.";
};                       

FUNC int DIA_Lefty_NeverAgain_Condition()
{
	if ( (Lefty_Mission == LOG_RUNNING) && (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_NeverAgain_Info()
{
	AI_Output (other, self,"DIA_Lefty_NeverAgain_15_00"); //Теперь ты можешь носить эту воду сам.
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_01"); //О? Нашел себе дело получше?
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_02"); //Думаю, стоит напомнить тебе, кто из нас главный!
	
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};	

// **************************************
//				PERM
// **************************************
var int LeftyWasBeaten;
// **************************************
instance DIA_Lefty_PERM (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_PERM_Condition;
	information	= DIA_Lefty_PERM_Info;
	permanent	= 1;
	description	= "Как дела, друг мой?";
};                       

FUNC int DIA_Lefty_PERM_Condition()
{
	if (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE) 
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_PERM_Info()
{
	AI_Output (other, self,"DIA_Lefty_PERM_15_00"); //Как дела, друг мой?
	AI_Output (self, other,"DIA_Lefty_PERM_07_01"); //Ох, парень! Что тебе нужно?

	if	!LeftyWasBeaten
	{
		B_LogEntry			(CH1_CarryWater,"Я втолковал Лефти, что ему лучше больше не приставать ко мне со своими предложениями. Некоторые люди не способны понять, когда им объясняешь по-хорошему.");
		Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
		B_GiveXP			(XP_LeftyConfronted);
		LeftyWasBeaten = TRUE;
	};
	
	Info_ClearChoices	(DIA_Lefty_PERM );
	Info_AddChoice		(DIA_Lefty_PERM,"Просто хотел проведать тебя.",DIA_Lefty_PERM_Nothing);
	Info_AddChoice		(DIA_Lefty_PERM,"Похоже, крестьяне хотят пить.",DIA_Lefty_PERM_Durstig);
	Info_AddChoice		(DIA_Lefty_PERM,"У меня был паршивый день... ",DIA_Lefty_PERM_AufsMaul);

};	

func void DIA_Lefty_PERM_AufsMaul()
{
	AI_Output (other, self,"DIA_Lefty_PERM_AufsMaul_15_00"); //У меня был паршивый день, и я просто хочу немного расслабиться... просто постоять так минутку-другую. 
	B_Say (self,other,"$YOUWANNAFOOLME");
	Info_ClearChoices	(DIA_Lefty_PERM );
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_PERM_Durstig()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Durstig_15_00"); //Похоже, крестьяне хотят пить.
	AI_Output (self, other,"DIA_Lefty_PERM_Durstig_07_01"); //Я разберусь... Не волнуйся.
	AI_StopProcessInfos	(self);
};

func void DIA_Lefty_PERM_Nothing()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Nothing_15_00"); //Просто хотел проведать тебя.
	AI_StopProcessInfos	(self);
};




	
	
	
	
	
