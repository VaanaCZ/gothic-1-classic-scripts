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
	description		= "Co dìláš tady venku?"; 
};

FUNC INT DIA_cavalorn_Hunter_Condition()
{	
	return 1;	
};

FUNC VOID DIA_cavalorn_Hunter_Info()
{
	AI_Output (other, self,"DIA_cavalorn_Hunter_15_00"); //Co dìláš tady venku?
	AI_Output (self, other,"DIA_cavalorn_Hunter_12_01"); //Jsem lovec - lovím pøedevším mrchožrouty..
	
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
	description		= "Mùžeš mì nauèit nìco o lovu?"; 
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
		B_LogEntry		(GE_TeacherOW,"Cavalorn je lovec. Mùže mì nauèit PLÍŽENÍ a také LUKOSTØELBÌ. Žije v chatrèi mezi Starým a Novým táborem.");
		log_cavalorntrain = TRUE;
	};
	AI_Output (other, self,"DIA_cavalorn_Lehrer_15_00"); //Mùžeš mì nauèit nìco o lovu?
	AI_Output (self, other,"DIA_cavalorn_Lehrer_12_01"); //To záleží - co chceš umìt?
	
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
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Bow_15_00"); //Mùžeš mì nauèit, jak se zlepšit v zacházení s lukem?
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_01"); //Pro zaèáteèníka není tìžké se zlepšit. Je to otázka postoje.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_02"); //Rozkroè nohy hodnì od sebe, drž ruce ve stejné výšce, nadechni se - a vystøel!
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_03"); //Pokud zasáhneš urèité partie tìla, staèí jediný výstøel. Jako zaèáteèník máš jen nepatrnou nadìji zasáhnout tyhle partie.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_04"); //Jestli si ale zapamatuješ, co ti øeknu, budeš už pøíštì lepší.
	};
};

func void DIA_Cavalorn_Lehrer_Schleichen()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //Chci se nauèit plížit.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //Dobrý nápad. To je nejdùležitìjší vìc, když se chceš nepozorovanì dostat do nìèí chalupy.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //Pøi chùzi se musíš prohnout v kolenou, abys vidìl líp na zem a zároveò mohl líp kontrolovat celé tìlo.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //Každý si ale tvého postoje všimne, a tak musíš dbát na to, aby tì nikdo pøi plížení nevidìl.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Pamatuj si, co jsem ti øekl, ale pøedevším - nikdy se nenech pøistihnout!
	};
};
func void DIA_Cavalorn_Lehrer_Bow_2()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //Už jsi dobrý lovec. Teï si osvojíš zbývající vìdomosti.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //Aby ses stal dobrým støelcem, musíš se o to pøestat snažit.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Objev zákony zraku, napìtí, dráhy a cíle. Vždy buï ve støehu a buï pøipravený.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //Teï už jsi velmi dobøe zvládl techniku. Tak pojï a vyzkoušej své znalosti a umìní.
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
	AI_Output (self, other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //Tady. Prodávám nejlepší luky ve Starém táboøe.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Cavalorn obchoduje s LUKY a ŠÍPY. Najdu ho na cestì k Novému táboru, v kaòonu na západ od Starého tábora.");
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








