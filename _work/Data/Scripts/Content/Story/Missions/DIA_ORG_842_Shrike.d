// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Shrike_Exit (C_INFO)
{
	npc			= ORG_842_Shrike;
	nr			= 999;
	condition	= DIA_Shrike_Exit_Condition;
	information	= DIA_Shrike_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Shrike_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Shrike_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ****************************************
// 					Hallo
// ****************************************

instance DIA_Shrike_Hello (C_INFO)
{
	npc				= Org_842_Shrike;
	nr				= 1;
	condition		= DIA_Shrike_Hello_Condition;
	information		= DIA_Shrike_Hello_Info;
	important		= 0;
	description		= "Co słychać?";
};

FUNC int  DIA_Shrike_Hello_Condition()
{	
	return 1;
};

func void  DIA_Shrike_Hello_Info()
{
	AI_Output (other, self,"DIA_Shrike_Hello_15_00"); //Co słychać?
	AI_Output (self, other,"DIA_Shrike_Hello_07_01"); //Spadaj!
	
	
	//FMTaken = TRUE; 			//******* TEST - Helper für Sld-KdW Aufnahme!!! *********************  
	//Kapitel = 4;

	
	AI_StopProcessInfos	( self );
};


// ****************************************
// 					GetLost
// ****************************************

instance DIA_Shrike_GetLost (C_INFO)
{
	npc				= Org_842_Shrike;
	nr				= 1;
	condition		= DIA_Shrike_GetLost_Condition;
	information		= DIA_Shrike_GetLost_Info;
	important		= 0;
	description		= "Zejdź mi z oczu.";
};

FUNC int  DIA_Shrike_GetLost_Condition()
{	
	if	self.aivar[AIV_WASDEFEATEDBYSC]
	{
		return 1;
	};
};

func void  DIA_Shrike_GetLost_Info()
{
	AI_Output (other, self,"DIA_Shrike_GetLost_15_00"); //Zejdź mi z oczu.
	AI_Output (self, other,"DIA_Shrike_GetLost_07_01"); //Porozmawiamy innym razem!

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,"Udało mi się przekonać Krzykacza, żeby poszukał sobie innej chaty. Ciekawe, co teraz powie mi Gorn.");
	B_GiveXP			(XP_KickedShrike);

	AI_StopProcessInfos	(self);	
	
	Npc_ExchangeRoutine(self, "start");
};

