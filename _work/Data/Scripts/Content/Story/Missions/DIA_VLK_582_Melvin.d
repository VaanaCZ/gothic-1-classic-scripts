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
	description		= "Czeœæ! Nie jesteœ z tego obozu, prawda?";
};

FUNC INT DIA_Melvin_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Melvin_Hello_Info()
{
	AI_Output (other, self,"DIA_Melvin_Hello_15_00"); //Czeœæ! Nie jesteœ z tego obozu, prawda?
	AI_Output (self, other,"DIA_Melvin_Hello_03_01"); //Có¿, teraz ju¿ jestem! Tydzieñ temu wyruszy³em ze Starego Obozu. Mój kumpel, Dusty, mia³ iœæ ze mn¹, ale postanowi³ jeszcze trochê poczekaæ.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Kopacz Melvin do³¹czy³ do Bractwa. Jego kumpel, Dusty, zosta³ w Starym Obozie, ale on te¿ zastanawia siê nad przejœciem do obozu na bagnie.");
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
	description		= "Znam Dustego - zamieniliœmy kiedyœ kilka s³ów.";
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
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_00"); //Znam Dustego - zamieniliœmy kiedyœ kilka s³ów.
	AI_Output (self, other,"DIA_Melvin_MetDusty_03_01"); //Gdybyœ go jeszcze kiedyœ spotka³, powiedz mu, ¿e g³upio zrobi³ nie id¹c ze mn¹. ¯ycie w Bractwie jest sto razy lepsze od ci¹g³ego u¿erania siê ze Stra¿nikami ze Starego Obozu.
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_02"); //Nie omieszkam mu tego powtórzyæ.
};


