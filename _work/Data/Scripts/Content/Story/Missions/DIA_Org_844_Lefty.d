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
	description = "Что ты здесь делаешь?";
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
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Что ты здесь делаешь?
	AI_Output (self, other,"DIA_846_Hello_07_01"); //Я работаю на Лорда.
	AI_Output (other, self,"DIA_Ricelord_Arbeit_15_00"); //А ты можешь мне что-то предложить?
	AI_Output (self, other,"DIA_Shrike_GetLost_07_01"); //Мы еще поговорим об этом!
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
	AI_Output (self, other,"DIA_Lefty_First_07_00"); //Эй, ты недавно здесь, да? Нам здесь нужен человек, который сможет разнести воду для крестьян, что работают на полях.
	AI_Output (self, other,"DIA_Lefty_First_07_01"); //Тебе сейчас как раз не помешают новые знакомства. Что скажешь?
	
	Log_CreateTopic		(CH1_CarryWater,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_RUNNING);
	B_LogEntry			(CH1_CarryWater,	"Лефти из Нового лагеря попросил меня разнести воду крестьянам, работающим на рисовых полях.");
	
	Info_ClearChoices	(DIA_Lefty_First );
	Info_AddChoice		(DIA_Lefty_First,"Может, позже."				,DIA_Lefty_First_Later);
	Info_AddChoice		(DIA_Lefty_First,"Сам носи свою воду!"	,DIA_Lefty_First_Never);
	Info_AddChoice		(DIA_Lefty_First,"Хорошо, я помогу тебе."			,DIA_Lefty_First_Yes);
};

func void DIA_Lefty_First_Yes()
{
	AI_Output (other, self,"DIA_Lefty_First_Yes_15_00"); //Хорошо, я помогу тебе.
	AI_Output (self, other,"DIA_Lefty_First_Yes_07_01"); //Хорошо! Иди к Лорду. Он даст тебе воду и скажет, что нужно делать.
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_RUNNING;
	An_Bauern_verteilt = 0;
	B_LogEntry			(CH1_CarryWater,	"Я согласился отнести воду крестьянам. Может, мне удастся завести полезные знакомства. Воду я смогу получить у так называемого Рисового Лорда.");

	Info_ClearChoices	(DIA_Lefty_First);
};

func void DIA_Lefty_First_Never()
{
	AI_Output (other, self,"DIA_Lefty_First_Never_15_00"); //Сам носи свою воду!
	AI_Output (self, other,"DIA_Lefty_First_Never_07_01"); //С друзьями так не разговаривают! Думаю, тебя следует научить хорошим манерам!
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_FAILED;
	B_LogEntry			(CH1_CarryWater,	"Я отказался от предложения Лефти. Это привело его в ярость! Думаю, в Старом лагере мне было бы гораздо спокойнее.");
	
	Info_ClearChoices	(DIA_Lefty_First );
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_First_Later()
{
	AI_Output (other, self,"DIA_Lefty_First_Later_15_00"); //Может, позже...
	AI_Output (self, other,"DIA_Lefty_First_Later_07_01"); //Позже не получится. Мне нужно, чтобы ты помог мне сейчас. Так ты будешь помогать или нет?
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
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_00"); //Тебе повезло! Я дам тебе еще один шанс.
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_01"); //Постарайся хоть на этот раз сделать все правильно! Иди к Лорду и разнеси всем крестьянам воду, которую он тебе даст. Ты понял?
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		B_LogEntry			(CH1_CarryWater,	"Я снова встретил Лефти. Он хочет, чтобы я взял воду у Лорда и разнес ее крестьянам.");
		
		AI_StopProcessInfos	(self);
	}
	else if (Lefty_Mission == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_00"); //Я же сказал тебе, что ты должен разнести воду крестьянам!
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_01"); //Мне не нравится, когда кто-то не держит своего слова!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_FAILED;
		B_LogEntry			(CH1_CarryWater,	"Лефти был в бешенстве, узнав, что я еще не разнес воду! Сложно иметь дело с этим неуравновешенным типом.");
		
		AI_StopProcessInfos	(self);
		Npc_SetTarget (self, other);
		AI_StartState (self, ZS_ATTACK, 1, "");
	}
	else if (Lefty_Mission == LOG_SUCCESS)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_00"); //Отлично! Ты все же можешь нам пригодиться.
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_01"); //Думаю, ты справишься с этой работой. Теперь ты будешь разносить воду каждый день. Иди и работай!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		if	!CarriedWaterForLefty
		{
			B_LogEntry		(CH1_CarryWater,	"Ничего не понимаю. Я разнес воду, а теперь этот Лефти хочет, чтобы я делал эту работу каждый день.");
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
	description	= "Сам носи свою воду. А на меня можешь больше не рассчитывать.";
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
	AI_Output (other, self,"DIA_Lefty_NeverAgain_15_00"); //Сам носи свою воду. А на меня можешь больше не рассчитывать.
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_01"); //Что? Нашел что-то более интересное?
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_02"); //По-моему, тебе следует напомнить, кто здесь главный!
	
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
	AI_Output (self, other,"DIA_Lefty_PERM_07_01"); //О, ну что тебе от меня нужно?

	if	!LeftyWasBeaten
	{
		B_LogEntry			(CH1_CarryWater,	"Я объяснил Лефти, что лучше ему отстать от меня. Жаль, что многим понимание дается с таким трудом.");
		Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
		B_GiveXP			(XP_LeftyConfronted);
		LeftyWasBeaten = TRUE;
	};
	
	Info_ClearChoices	(DIA_Lefty_PERM );
	Info_AddChoice		(DIA_Lefty_PERM,"Просто хотел посмотреть, как у тебя дела."												,DIA_Lefty_PERM_Nothing);
	Info_AddChoice		(DIA_Lefty_PERM,"Мне кажется, крестьяне хотят пить."														,DIA_Lefty_PERM_Durstig);
	Info_AddChoice		(DIA_Lefty_PERM,"У меня был плохой день, и я просто хочу отдохнуть..."	,DIA_Lefty_PERM_AufsMaul);

};	

func void DIA_Lefty_PERM_AufsMaul()
{
	AI_Output (other, self,"DIA_Lefty_PERM_AufsMaul_15_00"); //У меня был плохой день, и я просто хочу отдохнуть... постоять тут немного.
	B_Say (self,other,"$YOUWANNAFOOLME");
	Info_ClearChoices	(DIA_Lefty_PERM );
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_PERM_Durstig()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Durstig_15_00"); //Мне кажется, крестьяне хотят пить.
	AI_Output (self, other,"DIA_Lefty_PERM_Durstig_07_01"); //Я постараюсь что-нибудь придумать... Не волнуйся.
	AI_StopProcessInfos	(self);
};

func void DIA_Lefty_PERM_Nothing()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Nothing_15_00"); //Просто хотел посмотреть, как у тебя дела.
	AI_StopProcessInfos	(self);
};




	
	
	
	
	