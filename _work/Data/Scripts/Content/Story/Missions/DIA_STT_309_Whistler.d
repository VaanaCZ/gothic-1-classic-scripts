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
	description = "Привет! Я здесь новенький.";
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
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_00"); //Привет! Я здесь новенький!
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_01"); //И что тебе от меня нужно?
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_02"); //Я хочу стать одним из вас - хочу присоединиться к вашему Лагерю.
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_03"); //Ищешь кого-нибудь, кто бы помог, а?
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_04"); //Если ты хочешь, чтобы я замолвил за тебя словечко перед Диего, тебе придется немного помочь мне.
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
	description = "Что я должен сделать?";
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
	AI_Output (other,self,"DIA_Whistler_Favour_15_00"); //Что я должен сделать?
	AI_Output (self,other,"DIA_Whistler_Favour_11_01"); //Мне нужен один меч... Его продает Фиск - это один из торговцев на рынке.
	AI_Output (self,other,"DIA_Whistler_Favour_11_02"); //Шикарный палаш с украшениями. Но мне он его не продаст...
	AI_Output (self,other,"DIA_Whistler_Favour_11_03"); //Я дам тебе 100 кусков руды, чтобы ты купил его. Только не говори Фиску про меня.

	Info_ClearChoices(DIA_Whistler_Favour);
	Info_AddChoice	 (DIA_Whistler_Favour,"Ладно, давай свои 100 кусков. Я куплю тебе меч.",DIA_Whistler_Favour_Ok);
	Info_AddChoice	 (DIA_Whistler_Favour,"А ты не думаешь, что я могу сбежать с твоей рудой?..",DIA_Whistler_Favour_OreAway);
	Info_AddChoice	 (DIA_Whistler_Favour,"А почему он больше не хочет продавать тебе оружие?",DIA_Whistler_Favour_WhyNotSell);
};

func void DIA_Whistler_Favour_Ok()
{
	AI_Output (other,self,"DIA_Whistler_Favour_Ok_15_00"); //Ладно, давай свои 100 кусков. Я куплю тебе меч.
	AI_Output (self,other,"DIA_Whistler_Favour_Ok_11_01"); //Вот они. И сразу возвращайся ко мне!
	
	Whistler_BuyMySword = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry (CH1_JoinOC,"Уистлер поможет мне, если я схожу на рынок к Фиску и куплю ему меч. Для этого он дал мне 100 кусков руды.");
	
	var C_NPC fisk; fisk = Hlp_GetNpc(Stt_311_Fisk);
	
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, hero, itminugget, 100);
	
	Whistler_BuyMySword_Day = Wld_GetDay();
	
	Info_ClearChoices(DIA_Whistler_Favour);
};

func void DIA_Whistler_Favour_OreAway()
{
	AI_Output (other,self,"DIA_Whistler_Favour_OreAway_15_00"); //А ты не думаешь, что я могу сбежать с твоей рудой?..
	AI_Output (self,other,"DIA_Whistler_Favour_OreAway_11_01"); //Не забывай: эта колония такая маленькая. Если попытаешься меня надуть, я тебя найду!
};

func void DIA_Whistler_Favour_WhyNotSell()
{
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //А почему он больше не хочет продавать тебе оружие?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //Мы тут немного поспорили.
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //И?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //И ничего. Тебе это знать незачем!
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
	description = "Фиск теперь хочет 110 кусков за свой меч.";
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
	AI_Output (other,self,"DIA_Whistler_Running110_15_00"); //Фиск теперь хочет 110 кусков за свой меч.
	AI_Output (self,other,"DIA_Whistler_Running110_11_01"); //И ты хочешь, чтобы я тебе дал еще 10 кусков...
	AI_Output (other,self,"DIA_Whistler_Running110_15_02"); //Я думал, тебе нужен этот меч.
	AI_Output (self,other,"DIA_Whistler_Running110_11_03"); //Вот, держи руду и поторопись!
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
	description = "Я не сумел купить меч. Вот тебе твои 100 кусков назад.";
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
	AI_Output (other,self,"DIA_Whistler_RunningPayBack_15_00"); //Я не сумел купить меч. Вот тебе твои 100 кусков назад.
	
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_01"); //Ты идиот, а идиотов у нас здесь своих хватает! Проваливай с глаз моих!
		B_GiveInvItems (hero, self, itminugget, 100);
		Whistler_BuyMySword = LOG_OBSOLETE;
		
		B_LogEntry (CH1_JoinOC,"Я все испортил. Уистлер никогда не получит свой меч.");
		
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_02"); //Здесь нет 100 кусков, и лучше бы тебе найти их побыстрее, или у тебя начнутся крупные неприятности.
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
	AI_Output (self,other,"DIA_Whistler_MySword_TooLate_11_00"); //Вот ты где! Хотел сбежать с моей рудой, да? Иди-ка сюда, сынок!
	
	Whistler_BuyMySword = LOG_FAILED;
	
	B_LogEntry (CH1_JoinOC,"Я все испортил. Уистлер теперь очень зол на меня.");
	
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
	description = "Твой меч у меня...";
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
	AI_Output (other,self,"DIA_Whistler_MySword_Success_15_00"); //Твой меч у меня...

    B_GiveInvItems (other, self, Whistlers_Schwert, 1);
	
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_01"); //Я же говорил тебе, что это будет несложно. Но все равно: ты помог мне - я помогу тебе.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_02"); //Если Диего спросит меня, я замолвлю за тебя словечко. Ну а пока - счастливо оставаться!
	
	B_LogEntry (CH1_JoinOC,"Уистлер остался доволен мечом. Он порекомендует меня Диего.");
	}
	else
	{
	B_LogEntry (CH1_JoinOC,"Уистлер остался доволен мечом. К сожалению, это для меня ровным счетом ничего не значит: призраком стать я уже не могу.");
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
	AI_Output (self,other,"DIA_Whistler_StandardKap1_11_01"); //Все хорошо! Ты помог мне - я помогу тебе. Я скажу Диего, что ты надежный парень.
};





	
	





















