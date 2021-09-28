// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kharim_Exit (C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 999;
	condition		= Info_Kharim_Exit_Condition;
	information		= Info_Kharim_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Kharim_Exit_Condition()
{
	return 1;
};

func VOID Info_Kharim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Kharim_What(C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 1;
	condition		= Info_Kharim_What_Condition;
	information		= Info_Kharim_What_Info;
	permanent		= 0;
	description 	= "Я здесь новенький. Кто ты?";
};                       

FUNC INT Info_Kharim_What_Condition()
{
	return 1;
};

func VOID Info_Kharim_What_Info()
{
	AI_Output (other, self,"Info_Kharim_What_15_00"); //Я здесь новенький. Кто ты?
	AI_Output (self, other,"Info_Kharim_What_09_01"); //Меня зовут Харим. Тебя, должно быть, только что зашвырнули сюда - иначе ты бы обо мне слышал.
	AI_Output (self, other,"Info_Kharim_What_09_02"); //Я лучший боец из всех, что когда-либо были в этом чертовом Лагере!
};

// **************************************
//				Fordern
// **************************************
	var int Kharim_Charged;
// **************************************

instance Info_Kharim_Charge(C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 2;
	condition		= Info_Kharim_Charge_Condition;
	information		= Info_Kharim_Charge_Info;
	permanent		= 1;
	description 	= "Я вызываю тебя на бой! Идем на арену!";
};                       

FUNC INT Info_Kharim_Charge_Condition()
{
	if ( Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo(hero,Info_Kharim_What) && (Kharim_Charged != TRUE) && (Kapitel <= 1) ) // Kapitelfix ***Bjцrn***
	{
		return 1;
	};
};

func VOID Info_Kharim_Charge_Info()
{
	AI_Output (other, self,"Info_Kharim_Charge_15_00"); //Я вызываю тебя на бой! Идем на арену!
	AI_Output (self, other,"Info_Kharim_Charge_09_01"); //ТЫ?! Да я сожру тебя на завтрак, малыш!
	AI_Output (self, other,"Info_Kharim_Charge_09_02"); //Окажи себе услугу и проваливай, пока еще не поздно.

	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Ладно, ладно, забудь об этом.",Info_Kharim_Charge_BACK);
	Info_AddChoice		(Info_Kharim_Charge,"Значит, ты боишься драки, трус?!",Info_Kharim_Charge_Insult);

};

func void Info_Kharim_Charge_BACK()
{
	AI_Output (other, self,"Info_Kharim_Charge_BACK_15_00"); //Ладно, ладно, забудь об этом.
	
	AI_StopProcessInfos (self);
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_15_00"); //Значит, ты боишься драки, трус?!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_09_01"); //Ничего получше придумать не мог?
	
	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Ты здесь только затем, чтобы поцеловать Гомеза в задницу!",Info_Kharim_Charge_Insult_GomezAss);
	Info_AddChoice		(Info_Kharim_Charge,"Как насчет этого: твоя мать была похожа на овцу...",Info_Kharim_Charge_Insult_Goats);
	Info_AddChoice		(Info_Kharim_Charge,"Не могу придумать ничего такого, что ты бы смог понять.",Info_Kharim_Charge_Insult_Stupid);
	Info_AddChoice		(Info_Kharim_Charge,"...но потом я увидел твою отвратительную рожу.",Info_Kharim_Charge_Insult_Face);
	Info_AddChoice		(Info_Kharim_Charge,"Ладно, ладно, забудь об этом.",Info_Kharim_Charge_BACK);
	
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult_Goats()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Goats_15_00"); //Как насчет этого: твоя мать похожа на овцу...
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Goats_09_01"); //Да, думаю, так оно и есть...
};

func void Info_Kharim_Charge_Insult_GomezAss()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_GomezAss_15_00"); //Ты здесь только затем, чтобы получить шанс поцеловать своего драгоценного Гомеза в задницу!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_01"); //ЧТО!?! Ах ты, червяк навозный! Ты ничего о нас не знаешь! В Новом Лагере НЕТ всего этого дерьма!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_02"); //И помимо всего прочего, я здесь только по одной причине: чтобы была возможность выбивать дурь из таких задниц, как ты!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_03"); //С удовольствием сделаю это и с ТОБОЙ. Пусть нас рассудит арена!
	
	Kharim_Charged = TRUE;
	
	Info_ClearChoices	(Info_Kharim_Charge );
	AI_StopProcessInfos	( self );
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

func void Info_Kharim_Charge_Insult_Stupid()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Stupid_15_00"); //Подумай-ка вот о чем... Хотя нет, не могу придумать ничего такого, что ты бы смог понять.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Stupid_09_01"); //А ты попытайся.
};

func void Info_Kharim_Charge_Insult_Face()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Face_15_00"); //Сперва я хотел сказать что-нибудь по поводу твоих тоненьких ручонок, но потом я увидел твою отвратительную рожу.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Face_09_01"); //Я дам тебе еще один шанс ИСЧЕЗНУТЬ ОТСЮДА!
};

// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kharim_InArena (C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 1;
	condition		= Info_Kharim_InArena_Condition;
	information		= Info_Kharim_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kharim_InArena_Condition()
{
	if ( (Kharim_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kharim_InArena_Info()
{
	if (Kapitel <= 1)				// Kapitelfix ***Bjцrn***
	{
		AI_Output (self, other,"Info_Kharim_InArena_09_00"); //Боль - это вопрос силы духа!
		
		AI_StopProcessInfos	( self );
		
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_9_LetsForgetOurLittleFight"); //Von mir aus kцnnen wir unseren Streit vergessen ...	
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
	
	
};
