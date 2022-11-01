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
// 					Ich Jäger
// **************************************************

INSTANCE DIA_cavalorn_Hunter (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Hunter_Condition;
	information		= DIA_cavalorn_Hunter_Info;
	permanent		= 0;
	description		= "Co děláš tady venku?"; 
};

FUNC INT DIA_cavalorn_Hunter_Condition()
{	
	return 1;	
};

FUNC VOID DIA_cavalorn_Hunter_Info()
{
	AI_Output (other, self,"DIA_cavalorn_Hunter_15_00"); //Co děláš tady venku?
	AI_Output (self, other,"DIA_cavalorn_Hunter_12_01"); //Jsem lovec - lovím především mrchožrouty..
	
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
	description		= "Můžeš mě naučit něco o lovu?"; 
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
		B_LogEntry		(GE_TeacherOW,"Cavalorn je lovec. Může mě naučit PLÍŽENÍ a také LUKOSTŘELBĚ. Žije v chatrči mezi Starým a Novým táborem.");
		log_cavalorntrain = TRUE;
	};
	AI_Output (other, self,"DIA_cavalorn_Lehrer_15_00"); //Můžeš mě naučit něco o lovu?
	AI_Output (self, other,"DIA_cavalorn_Lehrer_12_01"); //To záleží - co chceš umět?
	
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
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Bow_15_00"); //Můžeš mě naučit, jak se zlepšit v zacházení s lukem?
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_01"); //Pro začátečníka není těžké se zlepšit. Je to otázka postoje.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_02"); //Rozkroč nohy hodně od sebe, drž ruce ve stejné výšce, nadechni se - a vystřel!
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_03"); //Pokud zasáhneš určité partie těla, stačí jediný výstřel. Jako začátečník máš jen nepatrnou naději zasáhnout tyhle partie.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_04"); //Jestli si ale zapamatuješ, co ti řeknu, budeš už příště lepší.
	};
};

func void DIA_Cavalorn_Lehrer_Schleichen()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //Chci se naučit plížit.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //Dobrý nápad. To je nejdůležitější věc, když se chceš nepozorovaně dostat do něčí chalupy.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //Při chůzi se musíš prohnout v kolenou, abys viděl líp na zem a zároveň mohl líp kontrolovat celé tělo.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //Každý si ale tvého postoje všimne, a tak musíš dbát na to, aby tě nikdo při plížení neviděl.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Pamatuj si, co jsem ti řekl, ale především - nikdy se nenech přistihnout!
	};
};
func void DIA_Cavalorn_Lehrer_Bow_2()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //Už jsi dobrý lovec. Teď si osvojíš zbývající vědomosti.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //Aby ses stal dobrým střelcem, musíš se o to přestat snažit.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Objev zákony zraku, napětí, dráhy a cíle. Vždy buď ve střehu a buď připravený.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //Teď už jsi velmi dobře zvládl techniku. Tak pojď a vyzkoušej své znalosti a umění.
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
	description		= "Kde dostanu luk?"; 
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
	AI_Output (other, self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //Kde dostanu luk?
	AI_Output (self, other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //Tady. Prodávám nejlepší luky ve Starém táboře.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Cavalorn obchoduje s LUKY a ŠÍPY. Najdu ho na cestě k Novému táboru, v kaňonu na západ od Starého tábora.");
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
	description		= "Ukaž mi svoje zboží."; 
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
	AI_Output (other, self,"STT_336_cavalorn_TRADE_Info_15_01"); //Ukaž mi svoje zboží.
	
};  








