// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Melvin_Exit (C_INFO)
{
	npc			= Vlk_582_Melvin;
	nr			= 999;
	condition	= DIA_Melvin_Exit_Condition;
	information	= DIA_Melvin_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Melvin_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Melvin_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Was machst du?
// **************************************************

INSTANCE DIA_Melvin_Hello (C_INFO)
{
	npc				= Vlk_582_Melvin;
	nr				= 1;
	condition		= DIA_Melvin_Hello_Condition;
	information		= DIA_Melvin_Hello_Info;
	permanent		= 0;
	description		= "Привет! Ты ведь из этого Лагеря, да?";
};

FUNC INT DIA_Melvin_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Melvin_Hello_Info()
{
	AI_Output (other, self,"DIA_Melvin_Hello_15_00"); //Привет! Ты ведь из этого Лагеря, да?
	AI_Output (self, other,"DIA_Melvin_Hello_03_01"); //Теперь уже да! Я ушел из Старого Лагеря еще неделю назад. У меня там остался приятель - Дасти. Я предложил ему пойти вместе, но он решил подождать.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Рудокоп Мелвин присоединился к Братству. Его знакомый Дасти тоже подумывает о том, чтобы покинуть Старый Лагерь.");
};

// **************************************************
// 				Dusty getroffen
// **************************************************

INSTANCE DIA_Melvin_MetDusty (C_INFO)
{
	npc				= Vlk_582_Melvin;
	nr				= 1;
	condition		= DIA_Melvin_MetDusty_Condition;
	information		= DIA_Melvin_MetDusty_Info;
	permanent		= 0;
	description		= "Я знаю Дасти - разговаривал с ним совсем недавно.";
};

FUNC INT DIA_Melvin_MetDusty_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Melvin_Hello)) && (Npc_KnowsInfo(hero,DIA_Dusty_Hello)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Melvin_MetDusty_Info()
{
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_00"); //Я знаю Дасти - разговаривал с ним совсем недавно.
	AI_Output (self, other,"DIA_Melvin_MetDusty_03_01"); //Если увидишь его снова, скажи, что оставаться там глупо. Здесь в десять раз лучше, чем в Старом Лагере, где над тобой измываются эти болваны-стражники!
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_02"); //Я передам ему, если увижу.
};


