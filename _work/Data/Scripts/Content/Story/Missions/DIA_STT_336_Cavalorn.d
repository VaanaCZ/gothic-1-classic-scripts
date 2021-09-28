// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Cavalorn_Exit (C_INFO)
{
	npc			= STT_336_Cavalorn;
	nr			= 999;
	condition	= DIA_Cavalorn_Exit_Condition;
	information	= DIA_Cavalorn_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cavalorn_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Cavalorn_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Jдger
// **************************************************

INSTANCE DIA_cavalorn_Hunter (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Hunter_Condition;
	information		= DIA_cavalorn_Hunter_Info;
	permanent		= 0;
	description		= "Чем ты занимаешься?"; 
};

FUNC INT DIA_cavalorn_Hunter_Condition()
{	
	return 1;	
};

FUNC VOID DIA_cavalorn_Hunter_Info()
{
	AI_Output (other, self,"DIA_cavalorn_Hunter_15_00"); //Чем ты занимаешься?
	AI_Output (self, other,"DIA_cavalorn_Hunter_12_01"); //Я охотник, охочусь в основном на падальщиков.
	
};

// **************************************************
// 						Lehrer
// **************************************************

INSTANCE DIA_cavalorn_Lehrer (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Lehrer_Condition;
	information		= DIA_cavalorn_Lehrer_Info;
	permanent		= 1;
	description		= "Ты можешь научить меня чему-нибудь?"; 
};

FUNC INT DIA_cavalorn_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return 1;	
	};
};

FUNC VOID DIA_cavalorn_Lehrer_Info()
{
	if (log_cavalorntrain == FALSE)
	{
		Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
		B_LogEntry		(GE_TeacherOW,"Кавалорн - охотник. Он может научить меня подкрадываться и стрелять из лука. Живет Кавалорн в хижине между Лагерями.");
		log_cavalorntrain = TRUE;
	};
	AI_Output (other, self,"DIA_cavalorn_Lehrer_15_00"); //Ты можешь научить меня чему-нибудь?
	AI_Output (self, other,"DIA_cavalorn_Lehrer_12_01"); //Это зависит от того, что ты хочешь узнать.
	
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
	Info_AddChoice		(DIA_cavalorn_Lehrer,DIALOG_BACK															,DIA_cavalorn_Lehrer_BACK);

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_2,		LPCOST_TALENT_BOW_2,0)	,DIA_cavalorn_Lehrer_Bow_2);
	};

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_1,		LPCOST_TALENT_BOW_1,0)	,DIA_cavalorn_Lehrer_Bow);
	};
	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)	,DIA_cavalorn_Lehrer_Schleichen);
	};
};

func void DIA_cavalorn_Lehrer_BACK()
{
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
};

func void DIA_Cavalorn_Lehrer_Bow()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Bow_15_00"); //Я хочу научиться стрелять из лука.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_01"); //Новичку не так уж сложно стать мастером. Все зависит от правильной позиции.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_02"); //Расставь ноги пошире, руки держи на одном уровне, задержи дыхание - и стреляй!
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_03"); //Если знать, куда целиться, можно уложить зверя с одного выстрела. Правда, у новичка на это не так уж много шансов.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_04"); //Но если ты запомнишь все, о чем я тебе говорил, с каждым разом ты будешь стрелять все лучше и лучше.
	};
};

func void DIA_Cavalorn_Lehrer_Schleichen()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //Я хочу научиться передвигаться без шума. 
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //Хорошая идея. Пригодится на тот случай, если нужно забраться в дом так, чтобы хозяин ничего не заметил.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //При ходьбе присядь немного, и ты будешь лучше видеть пол и сможешь точнее контролировать свои движения.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //Основной минус заключается в том, что в этой позе ты будешь привлекать к себе слишком много внимания. Следи за тем, чтобы никто не видел, как ты крадешься.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Запомни это. И главное: никогда не попадайся!
	};
};
func void DIA_Cavalorn_Lehrer_Bow_2()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //Тебя уже можно назвать хорошим охотником. Пришло время научиться тому, чего ты еще не знаешь.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //Для того чтобы стать хорошим лучником, одной ловкости мало. Важно понять, из чего складывается хороший выстрел.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Тут многое приходится учитывать: зоркий взгляд и натяжение тетивы, полет стрелы и расстояние до мишени. И главное, всегда быть начеку!
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //Ты уже очень хорошо освоил технику. Осталось найти применение новым знаниям и навыкам.
	};
};
/*------------------------------------------------------------------------
						BOGEN KAUFEN						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_SELLBOW (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_SELLBOW_Condition;
	information		= STT_336_cavalorn_SELLBOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Где мне достать хороший лук?"; 
};

FUNC int  STT_336_cavalorn_SELLBOW_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_SELLBOW_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //Где мне достать хороший лук?
	AI_Output (self, other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //У меня. Я продаю лучшие луки во всем Старом Лагере.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Кавалорн торгует луками и стрелами. Его можно найти на дороге к Новому Лагерю, в каньоне к западу от Старого Лагеря.");
};  

/*------------------------------------------------------------------------
						TRADE						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_TRADE (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_TRADE_Condition;
	information		= STT_336_cavalorn_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Покажи мне, что у тебя есть."; 
	trade 			= 1;
};

FUNC int  STT_336_cavalorn_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero,STT_336_cavalorn_SELLBOW))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_TRADE_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_TRADE_Info_15_01"); //Покажи мне, что у тебя есть.
	
};  








