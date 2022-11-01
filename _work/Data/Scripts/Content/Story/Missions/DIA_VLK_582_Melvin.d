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
	description		= "Cześć! Nie jesteś z tego obozu, prawda?";
};

FUNC INT DIA_Melvin_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Melvin_Hello_Info()
{
	AI_Output (other, self,"DIA_Melvin_Hello_15_00"); //Cześć! Nie jesteś z tego obozu, prawda?
	AI_Output (self, other,"DIA_Melvin_Hello_03_01"); //Cóż, teraz już jestem! Tydzień temu wyruszyłem ze Starego Obozu. Mój kumpel, Dusty, miał iść ze mną, ale postanowił jeszcze trochę poczekać.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Kopacz Melvin dołączył do Bractwa. Jego kumpel, Dusty, został w Starym Obozie, ale on też zastanawia się nad przejściem do obozu na bagnie.");
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
	description		= "Znam Dustego - zamieniliśmy kiedyś kilka słów.";
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
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_00"); //Znam Dustego - zamieniliśmy kiedyś kilka słów.
	AI_Output (self, other,"DIA_Melvin_MetDusty_03_01"); //Gdybyś go jeszcze kiedyś spotkał, powiedz mu, że głupio zrobił nie idąc ze mną. Życie w Bractwie jest sto razy lepsze od ciągłego użerania się ze Strażnikami ze Starego Obozu.
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_02"); //Nie omieszkam mu tego powtórzyć.
};


