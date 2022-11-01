// ************************ EXIT **************************
instance  KDW_604_Cronos_Exit (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  999;	
	condition	=  KDW_604_Cronos_Exit_Condition;
	information	=  KDW_604_Cronos_Exit_Info;
	permanent	=  1;
	important	=  0;
	description = DIALOG_ENDE;
};                       

FUNC int  KDW_604_Cronos_Exit_Condition()
{
	return 1;
};

FUNC VOID  KDW_604_Cronos_Exit_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneIceCube))
	{
	CreateInvItem (self, ItArRuneIceCube);
	};
	if (!Npc_HasItems (self,ItArRuneThunderbolt))
	{
	CreateInvItem (self, ItArRuneThunderbolt);
	};
};

/*
// *****************************************
//					Greet
// *****************************************

instance  KDW_604_Cronos_Greet (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  1;	
	condition	=  KDW_604_Cronos_Greet_Condition;
	information	=  KDW_604_Cronos_Greet_Info;
	permanent	=  0;
	description = "Ich grьЯe dich, Magier.";
};                       

FUNC int  KDW_604_Cronos_Greet_Condition()
{
	return 1;
};

FUNC VOID  KDW_604_Cronos_Greet_Info()
{
	AI_Output (other, self,"DIA_Cronos_Greet_15_00"); //Приветствую тебя, маг!
	AI_Output (self, other,"DIA_Cronos_Greet_08_01"); //Warum stцrst du den Hьter des Erzes?
};
*/

// *****************************************
//					Brief
// *****************************************

instance  KDW_604_Cronos_Brief (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  1;	
	condition	=  KDW_604_Cronos_Brief_Condition;
	information	=  KDW_604_Cronos_Brief_Info;
	permanent	=  0;
	description = "У меня есть послание к Верховному Магу Круга Огня.";
};                       

FUNC int  KDW_604_Cronos_Brief_Condition()
{
	if	Npc_KnowsInfo(hero, KDW_604_Cronos_Greet)
	&&	(Npc_GetTrueGuild(hero) != GIL_STT)
	&&	(Npc_GetTrueGuild(hero) != GIL_KDF)
	&&	(hero.level < 10)
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Brief_Info()
{
	AI_Output (other, self,"DIA_Cronos_Brief_15_00"); //У меня есть послание к Верховному Магу Круга Огня.
	AI_Output (self, other,"DIA_Cronos_Brief_08_01"); //Здесь живут только маги Круга Воды. Магов Круга Огня можно найти в Старом лагере.
	AI_Output (other, self,"DIA_Cronos_Brief_15_02"); //Но мне нельзя в замок. Ты можешь помочь мне попасть туда?
	AI_Output (self, other,"DIA_Cronos_Brief_08_03"); //Иногда мы посылаем гонцов к нашим братьям в Старом лагере...
	AI_Output (self, other,"DIA_Cronos_Brief_08_04"); //Но мы доверяем свои послания только людям Ларса. Он заботится о сохранности наших посланий в течение многих лет.
};

// *****************************************
//					Barrier
// *****************************************

instance  KDW_604_Cronos_Barrier (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  2;	
	condition	=  KDW_604_Cronos_Barrier_Condition;
	information	=  KDW_604_Cronos_Barrier_Info;
	permanent	=  0;
	description = "Вы хотите разрушить Барьер? А как это можно сделать?";
};                       

FUNC int  KDW_604_Cronos_Barrier_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Barrier_Info()
{
	AI_Output (other, self,"DIA_Cronos_Barrier_15_00"); //Вы хотите разрушить Барьер? А как это можно сделать?
	AI_Output (self, other,"DIA_Cronos_Barrier_08_01"); //Для этого нам нужно очень много руды. 
	AI_Output (self, other,"DIA_Cronos_Barrier_08_02"); //Во время особой церемонии мы направим всю силу собранной руды на Барьер и уничтожим его.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_03"); //Конечно, эта руда привлекает многих, кто любит брать все, что плохо лежит.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_04"); //Поэтому у нас каждый защитник нашего плана на счету.
};

// *****************************************
//					WannaJoin
// *****************************************

instance  KDW_604_Cronos_WannaJoin (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_WannaJoin_Condition;
	information	=  KDW_604_Cronos_WannaJoin_Info;
	permanent	=  0;
	description = "Я хочу присоединиться к этому лагерю.  ";
};                       

FUNC int  KDW_604_Cronos_WannaJoin_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Cronos_WannaJoin_15_00"); //Я хочу присоединиться к этому лагерю.  
	AI_Output (self, other,"DIA_Cronos_WannaJoin_08_01"); //Если ты хочешь присоединиться к этому лагерю, поговори с Ли или с Ларсом. 
};

// *****************************************
//					WannaMage
// *****************************************

instance  KDW_604_Cronos_WannaMage (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_WannaMage_Condition;
	information	=  KDW_604_Cronos_WannaMage_Info;
	permanent	=  0;
	description = "Я хочу стать магом!";
};                       

FUNC int  KDW_604_Cronos_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_WannaJoin))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_WannaMage_Info()
{
	AI_Output (other, self,"DIA_Cronos_WannaMage_15_00"); //Я хочу стать магом!
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_01"); //Мы не можем раскрывать наше тайное знание своим врагам. 
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_02"); //Только когда ты докажешь нам, что ты верен нашему делу, мы сможем приступить к твоему обучению.
};

///////////////////////////////////////////////////
///////////////////////////////////////////////////
////////////////   Kapitel 2        ///////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////

// *****************************************
//					Bandit --> Messenger
// *****************************************

instance  KDW_604_Cronos_Bandit (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  4;	
	condition	=  KDW_604_Cronos_Bandit_Condition;
	information	=  KDW_604_Cronos_Bandit_Info;
	permanent	=  0;
	description = "Я стал одним из людей Ларса... У тебя есть для меня что-нибудь?";
};                       

FUNC int  KDW_604_Cronos_Bandit_Condition()
{
	if ( (Npc_GetTrueGuild(hero)==GIL_ORG) || (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Bandit_Info()
{
	AI_Output (other, self,"DIA_Cronos_Bandit_15_00"); //Я стал одним из людей Ларса. Теперь я могу носить послания магам Огня. У тебя есть для меня что-нибудь?
	AI_Output (self, other,"DIA_Cronos_Bandit_08_01"); //Да, есть. Но тебе нужен знак нашего посланника, иначе люди Гомеза не пропустят тебя в замок.
	AI_Output (self, other,"DIA_Cronos_Bandit_08_02"); //Вот, возьми это письмо и знак. А теперь тебе нужно спешить!
	
	CreateInvItem (other,KdW_Amulett);
	CreateInvItem (other,Cronos_Brief);
	
	Cronos_Messenger = LOG_RUNNING;
};

// *****************************************
//					BriefBack
// *****************************************

instance  KDW_604_Cronos_BriefBack (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_BriefBack_Condition;
	information	=  KDW_604_Cronos_BriefBack_Info;
	permanent	=  0;
	description = "Я передал послание!";
};                       

FUNC int  KDW_604_Cronos_BriefBack_Condition()
{
	if (Cronos_Messenger == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_BriefBack_Info()
{
	AI_Output (other, self,"DIA_Cronos_BriefBack_15_00"); //Я передал послание!
	AI_Output (self, other,"DIA_Cronos_BriefBack_08_01"); //А, хорошо! Возьми это в награду за твои труды...
	
	CreateInvItems (self,itminugget, 200);
	B_GiveInvItems (self, other, itminugget, 200);
	
	B_GiveXP(XP_CronosLetter);
};

///////////////////////////////////////////////////
///////////////////////////////////////////////////
////////////////   Kapitel 3        ///////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////


//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Cronos_NEWS (C_INFO)
{
	npc			= KDW_604_Cronos;
	condition	= Info_Cronos_NEWS_Condition;
	information	= Info_Cronos_NEWS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Я хочу сообщить Сатурасу нечто важное.";
};

FUNC INT Info_Cronos_NEWS_Condition()
{	
	if	(CorAngar_SendToNC==TRUE)
	&&	!Npc_KnowsInfo(hero, Info_Cronos_SLEEPER)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_NEWS_Info()
{
	AI_Output			(other, self,"Info_Cronos_NEWS_15_01"); //Я хочу сообщить Сатурасу нечто важное.
	AI_Output			(self, other,"Info_Cronos_NEWS_08_02"); //Разве это послание так важно, чтобы отвлекать нашего духовного лидера от его важной работы?
};

//***************************************************************************
//	Info KALOM
//***************************************************************************
instance Info_Cronos_KALOM (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 10;
	condition	= Info_Cronos_KALOM_Condition;
	information	= Info_Cronos_KALOM_Info;
	permanent	= 0;
	important 	= 0;
	description = "Кор Галом с несколькими фанатиками Стражами ушли из Братства!";
};

FUNC INT Info_Cronos_KALOM_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS) && !Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_KALOM_Info()
{
	AI_Output			(other, self,"Info_Cronos_KALOM_15_01"); //Кор Галом с несколькими фанатиками Стражами ушли из Братства!
	AI_Output			(other, self,"Info_Cronos_KALOM_15_02"); //Они сами хотят найти Спящего и прервать его тысячелетний сон.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_03"); //Я никогда ему не доверял. Не важно, какое место он занимает, важно то, что его ослепила жажда власти. Он способен на все. 
	AI_Output			(self, other,"Info_Cronos_KALOM_08_04"); //Думаю, без него в Братстве будет гораздо лучше!
	AI_Output			(self, other,"Info_Cronos_KALOM_08_05"); //Я сообщу об этом Сатурасу, как только у меня будет возможность. А теперь иди!

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Cronos_YBERION (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 20;
	condition	= Info_Cronos_YBERION_Condition;
	information	= Info_Cronos_YBERION_Info;
	permanent	= 0;
	important 	= 0;
	description = "Юберион, лидер сектантов болотного лагеря, умер!";
};

FUNC INT Info_Cronos_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS) && !Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_YBERION_Info()
{
	AI_Output			(other, self,"Info_Cronos_YBERION_15_01"); //Юберион, лидер сектантов Болотного лагеря, умер!
	AI_Output			(self, other,"Info_Cronos_YBERION_08_02"); //Что? Как это могло произойти?
	AI_Output			(other, self,"Info_Cronos_YBERION_15_03"); //Гуру Братства провели одну церемонию. Они вызывали Спящего.
	AI_Output			(other, self,"Info_Cronos_YBERION_15_04"); //Но умственное напряжение плохо сказалось на Юберионе. Он этого не выдержал.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_05"); //Это очень печальная новость. Юберион был одним из наших союзников.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_06"); //Но не стоит из-за этого отвлекать Сатураса от исследований.

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SLEEPER
//***************************************************************************
instance Info_Cronos_SLEEPER (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_SLEEPER_Condition;
	information	= Info_Cronos_SLEEPER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Гуру узнали, что их бог Спящий на самом деле - злой демон!";
};

FUNC INT Info_Cronos_SLEEPER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_SLEEPER_Info()
{
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_01"); //Гуру узнали, что их бог Спящий на самом деле - настоящий злой демон!
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_02"); //Теперь они считают Спящего одним из демонов?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_03"); //Это очень похоже на очередную безумную идею братьев, но...
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_04"); //... Что если они правы... тогда вся наша колония находится в опасности.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_05"); //Ты должен сообщить об этом Сатурасу. Он сможет решить, что делать дальше.
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_06"); //Где найти Сатураса?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_07"); //Поднимись на верхний уровень. Скажи охранникам, что ты получил мое разрешение.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_08"); //Пароль входа - Тетриандох.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_09"); //Сатурас обычно стоит у большой пентаграммы.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_10"); //Там он проводит свои исследования, пытается вычислить, как лучше всего взорвать гору руды.

	B_LogEntry			(CH3_EscapePlanNC,	"Кронос дал мне разрешение на разговор с Сатурасом. Обычно верховного мага можно найти у пентаграммы. Нужно сказать стражникам пароль... Вот черт, неужели я его забыл?!");

	B_GiveXP			(XP_GetCronosPermission);

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info PAROLE
//***************************************************************************
instance Info_Cronos_PAROLE (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_PAROLE_Condition;
	information	= Info_Cronos_PAROLE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Скажи мне пароль, я не смог его запомнить.";
};

FUNC INT Info_Cronos_PAROLE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_SLEEPER) && !Npc_KnowsInfo(hero, Info_Saturas_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_PAROLE_Info()
{
	AI_Output			(other, self,"Info_Cronos_PAROLE_15_01"); //Скажи мне пароль, я не смог его запомнить.
	AI_Output			(self, other,"Info_Cronos_PAROLE_08_02"); //Да, памяти у тебя нет. Запомни, пароль Тетриандох.
};

//***************************************************************************
//	Info REWARD
//***************************************************************************
instance Info_Cronos_REWARD (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_REWARD_Condition;
	information	= Info_Cronos_REWARD_Info;
	permanent	= 0;
	important 	= 0;
	description = "Сатурас сказал, что у тебя есть для меня награда.";
};

FUNC INT Info_Cronos_REWARD_Condition()
{	
	if (Saturas_BringFoci == 5)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_REWARD_Info()
{
	AI_Output			(other, self,"Info_Cronos_REWARD_15_01"); //Сатурас сказал, что у тебя есть для меня награда.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_02"); //Как хранитель руды я дам тебе небольшую часть наших запасов, как награду за твои труды.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_03"); //Надеюсь, ты сможешь разумно использовать ее.

	B_LogEntry		(CH3_BringFoci,	"Кронос дал мне достаточно много руды, но от этого рудная гора нисколько не уменьшилась.");
	if	Npc_KnowsInfo(hero, Info_Riordian_REWARD)
	{
		Log_SetTopicStatus	(CH3_BringFoci,	LOG_SUCCESS);
	};
	
	CreateInvItems		(self, ItMiNugget,	1000);
	B_GiveInvItems (self, hero, ItMiNugget,	1000);
};
/*------------------------------------------------------------------------
//						NACH DER WEIHE							//
------------------------------------------------------------------------*/
instance KDW_604_Cronos_WELCOME (C_INFO)
{
	npc				= KDW_604_Cronos;
	condition		= KDW_604_Cronos_WELCOME_Condition;
	information		= KDW_604_Cronos_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_604_Cronos_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};
};
func void  KDW_604_Cronos_WELCOME_Info()
{
	AI_Output			(self, other,"KDW_604_Cronos_WELCOME_Info_08_01"); //Ты принял правильное решение. Теперь ты один из магов Воды. Добро пожаловать, брат!
	AI_StopProcessInfos	( self );  
};
//--------------------------------------------------------------------------
// 							MANA KAUFEN
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  KDW_604_Cronos_MANA (C_INFO)
{
	npc				= KDW_604_Cronos;
	nr				= 800;
	condition		= KDW_604_Cronos_MANA_Condition;
	information		= KDW_604_Cronos_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "Я хочу увеличить свою магическую силу."; 
};

FUNC int  KDW_604_Cronos_MANA_Condition()
{	
	if	(Npc_KnowsInfo (hero,KDW_604_Cronos_GREET))
	&&	((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Cronos_MANA_Info()
{
	AI_Output			(other, self,"KDW_604_Cronos_MANA_Info_15_01"); //Я хочу увеличить свою магическую силу.
	AI_Output			(self, other,"KDW_604_Cronos_MANA_Info_08_02"); //Я могу помочь тебе в этом. Используй свою силу с умом.
	
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);
};  
func void KDW_604_Cronos_MANA_BACK()
{
	Info_ClearChoices	(KDW_604_Cronos_MANA);
};

func void KDW_604_Cronos_MANA_MAN_1()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);

};

func void KDW_604_Cronos_MANA_MAN_5()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);

};
//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  KDW_604_Cronos_SELLSTUFF (C_INFO)
{
	npc				= KDW_604_Cronos;
	nr				= 900;
	condition		= KDW_604_Cronos_SELLSTUFF_Condition;
	information		= KDW_604_Cronos_SELLSTUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  KDW_604_Cronos_SELLSTUFF_Condition()
{	
	if	(Npc_KnowsInfo (hero,KDW_604_Cronos_GREET))
	&&	((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Cronos_SELLSTUFF_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_SELLSTUFF_Info_15_01"); //Я хочу приобрести магические свитки.
	
};  
/*------------------------------------------------------------------------
						BEGRЬSSUNG						
------------------------------------------------------------------------*/

instance  KDW_604_Cronos_GREET (C_INFO)
{
	npc				= KDW_604_Cronos;
	condition		= KDW_604_Cronos_GREET_Condition;
	information		= KDW_604_Cronos_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Приветствую тебя, маг!"; 
};

FUNC int  KDW_604_Cronos_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_604_Cronos_GREET_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_GREET_Info_15_01"); //Приветствую тебя, маг!
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_02"); //Да прибудет с тобой благословение Аданоса! Я могу помочь твоему духу стать сильнее или дать тебе что-то полезное.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_03"); //Что я могу сделать для тебя?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry (GE_TraderNC,"Кронос продает руны, свитки и кольца. Целыми днями он стоит у решетки, закрывающей рудную гору."); 
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry (GE_TeacherNC,"Кронос может помочь мне повысить мою магическую силу. Его можно найти у рудной горы.");
};
