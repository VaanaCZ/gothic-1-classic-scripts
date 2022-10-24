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
	AI_Output (self, other,"DIA_cavalorn_Hunter_12_01"); //Я охотник. Здесь я охочусь на падальщиков.
	
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
		B_LogEntry		(GE_TeacherOW,"Кавалорн - охотник. Я могу научиться у него подкрадываться и стрелять из лука. Он живет в доме между Старым и Новым лагерями.");
		log_cavalorntrain = TRUE;
	};
	AI_Output (other, self,"DIA_cavalorn_Lehrer_15_00"); //Ты можешь научить меня чему-нибудь?
	AI_Output (self, other,"DIA_cavalorn_Lehrer_12_01"); //А чему бы ты хотел научиться?
	
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
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Bow_15_00"); //Научи меня стрелять из лука.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_01"); //Начинающему воину нетрудно совершенствовать свое мастерство. Главное здесь - положение тела.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_02"); //Ноги должны быть широко расставлены, руки на одной линии, вдох и - выстрел!
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_03"); //Иногда, чтобы убить жертву, достаточно направить стрелу в уязвимое место на теле. У новичка не так уж много шансов найти эти места. 
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_04"); //Но если ты будешь следовать моим советам, твои выстрелы будут более точными.
	};
};

func void DIA_Cavalorn_Lehrer_Schleichen()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //Я хочу научиться подкрадываться.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //Хороший выбор. Это умение пригодится тому, кто хочет незаметно пробраться в чужой дом и застать хозяина врасплох.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //Если ты немного присядешь, тебе будет легче контролировать тело и видеть, куда ступают твои ноги.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //Нужно тебя предупредить: когда ты крадешься, это привлекает много внимания. Постарайся, чтобы тебя не заметили.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Запомни это и никогда не попадайся.
	};
};
func void DIA_Cavalorn_Lehrer_Bow_2()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //Ты уже стал хорошим охотником. Теперь ты можешь узнать самое главное.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //Ты должен научиться двигаться бессознательно, не раздумывая над тем, что делать в следующий момент.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Запомни закон стрельбы: рассчитываешь расстояние до цели, скорость полета, силу натяжения тетивы - и стрела летит в цель. Будь всегда внимателен.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //Технику ты очень хорошо освоил. Теперь настало время применить свои знания на практике.
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
	description		= "У кого я могу купить хороший лук?"; 
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
	AI_Output (other, self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //У кого я могу купить хороший лук?
	AI_Output (self, other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //У меня. Лучших луков ты в Старом лагере ни у кого не найдешь.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Кавалорн продает луки и стрелы. Он живет в неглубоком ущелье между Старым и Новым лагерями.");
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
	description		= "Покажи мне свои товары."; 
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
	AI_Output (other, self,"STT_336_cavalorn_TRADE_Info_15_01"); //Покажи мне твои товары.
	
};  








