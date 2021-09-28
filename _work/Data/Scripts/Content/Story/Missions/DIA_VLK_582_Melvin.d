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
	description		= "Cze��! Nie jeste� z tego obozu, prawda?";
};

FUNC INT DIA_Melvin_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Melvin_Hello_Info()
{
	AI_Output (other, self,"DIA_Melvin_Hello_15_00"); //Cze��! Nie jeste� z tego obozu, prawda?
	AI_Output (self, other,"DIA_Melvin_Hello_03_01"); //C�, teraz ju� jestem! Tydzie� temu wyruszy�em ze Starego Obozu. M�j kumpel, Dusty, mia� i�� ze mn�, ale postanowi� jeszcze troch� poczeka�.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Kopacz Melvin do��czy� do Bractwa. Jego kumpel, Dusty, zosta� w Starym Obozie, ale on te� zastanawia si� nad przej�ciem do obozu na bagnie.");
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
	description		= "Znam Dustego - zamienili�my kiedy� kilka s��w.";
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
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_00"); //Znam Dustego - zamienili�my kiedy� kilka s��w.
	AI_Output (self, other,"DIA_Melvin_MetDusty_03_01"); //Gdyby� go jeszcze kiedy� spotka�, powiedz mu, �e g�upio zrobi� nie id�c ze mn�. �ycie w Bractwie jest sto razy lepsze od ci�g�ego u�erania si� ze Stra�nikami ze Starego Obozu.
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_02"); //Nie omieszkam mu tego powt�rzy�.
};


