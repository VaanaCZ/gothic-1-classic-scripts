// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Whistler_Exit (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 999;
	condition	= DIA_Whistler_Exit_Condition;
	information	= DIA_Whistler_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Whistler_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Whistler_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Ich bin neu hier 
// **************************************************

INSTANCE DIA_Whistler_IAmNew (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_IAmNew_Condition;
	information	= DIA_Whistler_IAmNew_Info;
	permanent	= 0;
	description = "Привет! Я здесь новый!";
};                       

FUNC INT DIA_Whistler_IAmNew_Condition()
{	
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Whistler_IAmNew_Info()
{
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_00"); //Привет! Я здесь новый!
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_01"); //Что тебе от меня нужно?
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_02"); //Я хочу стать одним из вас, хочу присоединиться к этому лагерю.
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_03"); //Ищешь того, кто смог бы тебя поддержать?
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_04"); //Если ты хочешь, чтобы я порекомендовал тебя Диего, ты должен будешь оказать мне одну услугу.
};

// **************************************************
// 					 Welcher Gefallen
// **************************************************
	var int Whistler_BuyMySword;
	var int Whistler_BuyMySword_Day;
// **************************************************

INSTANCE DIA_Whistler_Favour (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_Favour_Condition;
	information	= DIA_Whistler_Favour_Info;
	permanent	= 0;
	description = "Чем я могу тебе помочь?";
};                       

FUNC INT DIA_Whistler_Favour_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Whistler_IAmNew))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Favour_Info()
{
	AI_Output (other,self,"DIA_Whistler_Favour_15_00"); //Чем я могу тебе помочь?
	AI_Output (self,other,"DIA_Whistler_Favour_11_01"); //Мне нужен меч, который продает Фиск. Он торговец на рыночной площади.
	AI_Output (self,other,"DIA_Whistler_Favour_11_02"); //Это отличный палаш, украшенный резьбой и гравировкой. Только он мне его не продает.
	AI_Output (self,other,"DIA_Whistler_Favour_11_03"); //Я тебе дам сто кусков руды, а ты купишь его для меня. Только не говори ему, что ты пришел от меня.

	Info_ClearChoices(DIA_Whistler_Favour);
	Info_AddChoice	 (DIA_Whistler_Favour, "Хорошо, давай сто кусков. Я достану тебе меч."								,DIA_Whistler_Favour_Ok);
	Info_AddChoice	 (DIA_Whistler_Favour, "И ты мне веришь? А может, я возьму эту руду и сбегу?"	,DIA_Whistler_Favour_OreAway);
	Info_AddChoice	 (DIA_Whistler_Favour, "Почему же он не хочет продать тебе этот меч?"									,DIA_Whistler_Favour_WhyNotSell);
};

func void DIA_Whistler_Favour_Ok()
{
	AI_Output (other,self,"DIA_Whistler_Favour_Ok_15_00"); //Хорошо, давай сто кусков. Я достану тебе меч.
	AI_Output (self,other,"DIA_Whistler_Favour_Ok_11_01"); //Вот руда. Как только достанешь меч, приходи ко мне.
	
	Whistler_BuyMySword = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry (CH1_JoinOC,"Уистлер поддержит меня, если я куплю для него меч у Фиска. Для этого он дал мне 100 кусков руды.");
	
	var C_NPC fisk; fisk = Hlp_GetNpc(Stt_311_Fisk);
	
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, hero, itminugget, 100);
	
	Whistler_BuyMySword_Day = Wld_GetDay();
	
	Info_ClearChoices(DIA_Whistler_Favour);
};

func void DIA_Whistler_Favour_OreAway()
{
	AI_Output (other,self,"DIA_Whistler_Favour_OreAway_15_00"); //И ты мне веришь? А может, я возьму эту руду и сбегу?
	AI_Output (self,other,"DIA_Whistler_Favour_OreAway_11_01"); //Не забывай: колония маленькая. Не вздумай уйти с моей рудой, все равно найду!
};

func void DIA_Whistler_Favour_WhyNotSell()
{
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //Почему же он не хочет продать тебе этот меч?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //Ну, мы с ним немного поссорились.
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //И что?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //И то, что тебе это знать совсем необязательно!
};

// **************************************************
// 					 RUNNING 110
// **************************************************

INSTANCE DIA_Whistler_Running110 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 4;
	condition	= DIA_Whistler_Running110_Condition;
	information	= DIA_Whistler_Running110_Info;
	permanent	= 0;
	description = "Фиск повысил цену. Меч стоит сто десять кусков.";
};                       

FUNC INT DIA_Whistler_Running110_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Fisk_SCknows110 == TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Running110_Info()
{
	AI_Output (other,self,"DIA_Whistler_Running110_15_00"); //Фиск повысил цену. Меч стоит сто десять кусков.
	AI_Output (self,other,"DIA_Whistler_Running110_11_01"); //И теперь ты хочешь, чтобы я добавил тебе еще десять кусков?
	AI_Output (other,self,"DIA_Whistler_Running110_15_02"); //А я-то думал, тебе этот меч действительно нужен.
	AI_Output (self,other,"DIA_Whistler_Running110_11_03"); //Вот, забери и поторопись!
	CreateInvItems  (self,itminugget,10);
	B_GiveInvItems  (self, hero, itminugget, 10);
};	

// **************************************************
// 				RUNNING - PayBack
// **************************************************

INSTANCE DIA_Whistler_RunningPayBack (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 5;
	condition	= DIA_Whistler_RunningPayBack_Condition;
	information	= DIA_Whistler_RunningPayBack_Info;
	permanent	= 1;
	description = "Я не смог купить меч. Вот тебе твоя сотня кусков.";
};                       

FUNC INT DIA_Whistler_RunningPayBack_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_RunningPayBack_Info()
{
	AI_Output (other,self,"DIA_Whistler_RunningPayBack_15_00"); //Я не смог купить меч. Вот тебе твоя сотня кусков.
	
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_01"); //Идиот! Таких у нас и без тебя хватает! Убирайся!
		B_GiveInvItems (hero, self, itminugget, 100);
		Whistler_BuyMySword = LOG_OBSOLETE;
		
		B_LogEntry (CH1_JoinOC,"Я все испортил. Теперь Уистлеру никогда не видать своего меча.");
		
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_02"); //Где ты здесь видишь сто кусков? Отдавай мою руду, иначе у тебя будут неприятности!
		AI_StopProcessInfos(self);
	};
};	




// **************************************************
// 					 Too late
// **************************************************

INSTANCE DIA_Whistler_MySword_TooLate (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_MySword_TooLate_Condition;
	information	= DIA_Whistler_MySword_TooLate_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Whistler_MySword_TooLate_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_TooLate_Info()
{
	AI_Output (self,other,"DIA_Whistler_MySword_TooLate_11_00"); //А, вот ты где! Хотел украсть мою руду, да? Ну-ка, иди сюда!
	
	Whistler_BuyMySword = LOG_FAILED;
	
	B_LogEntry (CH1_JoinOC,"Я все испортил. Уистлер рассержен на меня.");
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude (self, ATT_ANGRY);
	Npc_SetTarget (self,other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

// **************************************************
// 					Success
// **************************************************

INSTANCE DIA_Whistler_MySword_Success (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_MySword_Success_Condition;
	information	= DIA_Whistler_MySword_Success_Info;
	permanent	= 1;
	description = "Я достал твой меч...";
};                       

FUNC INT DIA_Whistler_MySword_Success_Condition()
{
	if ( 	(Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day>(Wld_GetDay()-2)) 
		&&	(Npc_HasItems (other,Whistlers_Schwert)>=1) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_Success_Info()
{
	AI_Output (other,self,"DIA_Whistler_MySword_Success_15_00"); //Я достал твой меч...

    B_GiveInvItems (other, self, Whistlers_Schwert, 1);
	
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_01"); //Ну, ведь это было совсем несложно, да? Ладно, как я и говорил, я помогу тебе.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_02"); //Если Диего спросит меня о тебе, я скажу, что тебе можно доверять. До встречи!
	
	B_LogEntry (CH1_JoinOC,"Я достал меч для Уистлера. Он остался доволен. Теперь он поддержит меня, если я захочу вступить в лагерь.");
	}
	else
	{
	B_LogEntry (CH1_JoinOC,"Уистлер был доволен тем, что я достал ему меч. Жаль, но мне его помощь не пригодится. Я больше не могу стать Призраком.");
	};
	Whistler_BuyMySword = LOG_SUCCESS;
	B_GiveXP (XP_Whistlerssword);
    
	AI_StopProcessInfos	( self );
};

// **************************************************
// 			STANDARD - Kap 1 nach SUCCESS
// **************************************************

INSTANCE DIA_Whistler_StandardKap1 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_StandardKap1_Condition;
	information	= DIA_Whistler_StandardKap1_Info;
	permanent	= 1;
	description = "Как дела?";
};                       

FUNC INT DIA_Whistler_StandardKap1_Condition()
{
	if ( Whistler_BuyMySword == LOG_SUCCESS )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_StandardKap1_Info()
{
	AI_Output (other,self,"DIA_Whistler_StandardKap1_15_00"); //Как дела?
	AI_Output (self,other,"DIA_Whistler_StandardKap1_11_01"); //Хорошо! Ты помог мне - я помогу тебе. Я скажу Диего, что тебе можно доверять.
};





	
	





















