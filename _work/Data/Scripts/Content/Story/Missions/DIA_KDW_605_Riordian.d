// ************************ EXIT **************************

instance  Info_Riordian_EXIT (C_INFO)
{
	npc			= KDW_605_Riordian;
	nr			= 999;
	condition	= Info_Riordian_EXIT_Condition;
	information	= Info_Riordian_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Riordian_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_Riordian_EXIT_Info()
{
	AI_StopProcessInfos	(self);
	
	if (!Npc_HasItems (self,ItArRuneThunderball))
	{
		CreateInvItem (self,ItArRuneThunderball);
	};

};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************//Bist du der Wassermagier, der die Trдnke braut?
instance Info_Riordian_NEWS (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_NEWS_Condition;
	information	= Info_Riordian_NEWS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Меня прислал Сатурас. ";
};

FUNC INT Info_Riordian_NEWS_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_OFFER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_NEWS_Info()
{
	AI_Output (other, self,"Info_Riordian_NEWS_15_01"); //Меня прислал Сатурас. 
	AI_Output (self, other,"Info_Riordian_NEWS_14_02"); //А-ааа, заходи. Мне уже доложили.
	AI_Output (self, other,"Info_Riordian_NEWS_14_03"); //Вот, возьми эти эликсиры. Здесь все, что тебе может понадобиться.
	AI_Output (self, other,"Info_Riordian_NEWS_14_04"); //Теперь иди - и отыщи эти камни. В них наша последняя надежда.

	CreateInvItems (self, ItFo_Potion_Health_01,	20); 
	B_GiveInvItems (self,hero, ItFo_Potion_Health_01,	20); //Notwendig fьr die Ausschrift "20 Items ьbergeben", wird sofort ausgeglichen
	Npc_RemoveInvItems(hero, ItFo_Potion_Health_01,	15);

	CreateInvItems (hero, ItFo_Potion_Mana_01,		5);
	CreateInvItems (hero, ItFo_Potion_Health_02,	2);
	CreateInvItems (hero, ItFo_Potion_Mana_02,		2);
	CreateInvItems (hero, ItFo_Potion_Health_03,	1);
	CreateInvItems (hero, ItFo_Potion_Mana_03,		1);
	CreateInvItems (hero, ItFo_Potion_Haste_02,		2);
	CreateInvItems (hero, ItFo_Potion_Strength_01,	1);
	CreateInvItems (hero, ItFo_Potion_Dex_01,		1);
};

//***************************************************************************
//	Info REWARD
//***************************************************************************
instance Info_Riordian_REWARD (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_REWARD_Condition;
	information	= Info_Riordian_REWARD_Info;
	permanent	= 0;
	important 	= 0;
	description = "Сатурас сказал, что ты приготовил для меня награду?";
};

FUNC INT Info_Riordian_REWARD_Condition()
{	
	if (Saturas_BringFoci == 5)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_REWARD_Info()
{
	AI_Output			(other, self,"Info_Riordian_REWARD_15_01"); //Сатурас сказал, что ты приготовил для меня награду?
	AI_Output			(self, other,"Info_Riordian_REWARD_14_02"); //А-ааа, заходи, заходи. 
	AI_Output			(self, other,"Info_Riordian_REWARD_14_03"); //Наш духовный лидер рассказал мне о твоих героических подвигах.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_04"); //Все обитатели Лагеря - да что там, все жители колонии - в глубоком долгу перед тобой.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_05"); //Прими же от нас эту скромную награду.

	CreateInvItems		(self, ItFo_Potion_Health_02,		20);
	B_GiveInvItems      (self, hero, ItFo_Potion_Health_02, 20);//Notwenidg fьr Ausschrift "20 Items ьbergeben", wird sofort ausgeglichen
	Npc_RemoveInvItems  (hero, ItFo_Potion_Health_02, 		15);

	CreateInvItems		(hero, ItFo_Potion_Mana_02,			5);
	CreateInvItems		(hero, ItFo_Potion_Health_03,		2);
	CreateInvItems		(hero, ItFo_Potion_Mana_03,			2);
	CreateInvItems		(hero, ItFo_Potion_Haste_02,		3);
	CreateInvItems		(hero, ItFo_Potion_Master_01,		1);
	CreateInvItems		(hero, ItFo_Potion_Health_Perma_02,	1);
	CreateInvItems		(hero, ItFo_Potion_Mana_Perma_02,	1);

	B_LogEntry			(CH3_BringFoci,"Риордан был откровенен, как обычно. Он дал мне много эликсиров. Уверен, они мне пригодятся.");
	if	Npc_KnowsInfo(hero, Info_Cronos_REWARD)
	{
		Log_SetTopicStatus(CH3_BringFoci,	LOG_SUCCESS);
	};
};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info MESSAGE
//---------------------------------------------------------------------
instance Info_Riordian_MESSAGE (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_MESSAGE_Condition;
	information	= Info_Riordian_MESSAGE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Riordian_MESSAGE_Condition()
{	
	if	UrShak_SpokeOfUluMulu
	&&	!EnteredFreeMine
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_MESSAGE_Info()
{
	AI_Output (self, hero,"Info_Riordian_MESSAGE_14_01"); //Рад, что ты пришел! Я ждал тебя!
};

//---------------------------------------------------------------------
//	Info MESSAGEWHY
//---------------------------------------------------------------------
instance Info_Riordian_MESSAGEWHY (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_MESSAGEWHY_Condition;
	information	= Info_Riordian_MESSAGEWHY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ты ждал меня? Зачем?";
};

FUNC INT Info_Riordian_MESSAGEWHY_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Riordian_MESSAGE))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_MESSAGEWHY_Info()
{
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_01"); //Ты ждал меня? Зачем?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_02"); //Горн просил отправить тебя к нему, как только ты появишься.
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_03"); //Что случилось?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_04"); //У него есть план, как освободить захваченную шахту.
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_05"); //Он по-прежнему охраняет вход в шахту?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_06"); //Да. Прошу тебя, отправляйся к нему как можно скорее.
};
/*------------------------------------------------------------------------
//							WELCOME							//
------------------------------------------------------------------------*/
instance KDW_605_Riordian_WELCOME (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_WELCOME_Condition;
	information		= KDW_605_Riordian_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_605_Riordian_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW )
	
	{
		return TRUE;
	};
};
func void  KDW_605_Riordian_WELCOME_Info()
{
	AI_Output (self, other,"KDW_605_Riordian_WELCOME_Info_14_01"); //Я рад, что ты теперь с нами.
};
//-----------------------------------------------------------
instance KDW_605_Riordian_HEAL (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_HEAL_Condition;
	information		= KDW_605_Riordian_HEAL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_605_Riordian_HEAL_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	&& (Npc_KnowsInfo(hero,KDW_605_Riordian_WELCOME))
	{
		return TRUE;
	};
};
func void  KDW_605_Riordian_HEAL_Info()
{
	AI_Output (self, other,"KDW_605_Riordian_HEAL_Info_14_01"); //Если ты ранен, я вылечу тебя.
};
// ***************************** INFOS ****************************************//

instance  KDW_605_Riordian_HEALINFO (C_INFO)
{
	npc				= KDW_605_Riordian;
	nr				= 100;
	condition		= KDW_605_Riordian_HEALINFO_Condition;
	information		= KDW_605_Riordian_HEALINFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Я ранен. Ты можешь мне помочь?"; 
};

FUNC int  KDW_605_Riordian_HEALINFO_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]))
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_605_Riordian_HEALINFO_Info()
{
	AI_Output (other, self,"KDW_605_Riordian_HEALINFO_Info_15_01"); //Я ранен. Ты можешь мне помочь?
	AI_Output (self, other,"KDW_605_Riordian_HEALINFO_Info_14_02"); //Да исцелится дух твой и плоть твоя!
	 
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];
	Snd_Play  ("MFX_Heal_Cast");
};  
/*------------------------------------------------------------------------
							GREET									
------------------------------------------------------------------------*/

instance  KDW_605_Riordian_GREET (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_GREET_Condition;
	information		= KDW_605_Riordian_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Приветствую тебя, Маг!"; 
};

FUNC int  KDW_605_Riordian_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_605_Riordian_GREET_Info()
{
	AI_Output 		(other, self,"KDW_605_Riordian_GREET_Info_15_01"); //Приветствую тебя, Маг!
	AI_Output 		(self, other,"KDW_605_Riordian_GREET_Info_14_02"); //Я Риордан, алхимик. Полагаю, тебе нужен эликсир?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry 		(GE_TraderNC,"Риордан, маг воды, торгует эликсирами. Его можно найти в лаборатории на верхнем уровне.");
	
};  
/*------------------------------------------------------------------------
							TRADE								
------------------------------------------------------------------------*/

instance  KDW_605_Riordian_TRADE (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_TRADE_Condition;
	information		= KDW_605_Riordian_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Покажи мне, что у тебя есть."; 
	trade			= 1;
};

FUNC int  KDW_605_Riordian_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_605_Riordian_GREET))
	{
		return TRUE;
	};

};
FUNC void  KDW_605_Riordian_TRADE_Info()
{
	AI_Output (other, self,"KDW_605_Riordian_TRADE_Info_15_01"); //Покажи мне, что у тебя есть.
	
};  
