// ************************ EXIT **************************

instance  Org_843_Sharky_Exit (C_INFO)
{
	npc			=  Org_843_Sharky;
	nr			=  999;
	condition	=  Org_843_Sharky_Exit_Condition;
	information	=  Org_843_Sharky_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_843_Sharky_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_843_Sharky_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

/*------------------------------------------------------------------------
						HANDEL								
------------------------------------------------------------------------*/

instance  Org_843_Sharky_Fisk (C_INFO)
{
	npc				= Org_843_Sharky;
	nr 				= 2;
	condition		= Org_843_Sharky_Fisk_Condition;
	information		= Org_843_Sharky_Fisk_Info;
	permanent		= 0;
	description		= "Fisk ze Starego Obozu szuka nowego partnera do interesów."; 
	trade 			= 1;
};

FUNC int  Org_843_Sharky_Fisk_Condition()
{	
	if (Fisk_GetNewHehler == LOG_RUNNING)
	{
		return TRUE;
	};

};
FUNC void  Org_843_Sharky_Fisk_Info()
{
	AI_Output (other, self,"Org_843_Sharky_Fisk_Info_15_00"); //Fisk ze Starego Obozu szuka nowego partnera do interesów.
	AI_Output (self, other,"Org_843_Sharky_Fisk_Info_10_01"); //A dlaczego mówisz o tym właśnie mi?
	AI_Output (other, self,"Org_843_Sharky_Fisk_Info_15_02"); //Pomyślałem, że zainteresuje cię możliwość zarobienia paru bryłek rudy.
	AI_Output (self, other,"Org_843_Sharky_Fisk_Info_10_03"); //Czemu nie... Powiedz Fiskowi, że może na mnie liczyć.
};  


/*------------------------------------------------------------------------
						HANDEL								
------------------------------------------------------------------------*/

instance  Org_843_Sharky_TRADE (C_INFO)
{
	npc				= Org_843_Sharky;
	condition		= Org_843_Sharky_TRADE_Condition;
	information		= Org_843_Sharky_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Przydałoby mi się kilka drobiazgów."; 
	trade 			= 1;
};

FUNC int  Org_843_Sharky_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero, Org_843_Sharky_GREET))
	{
		return TRUE;
	};

};
FUNC void  Org_843_Sharky_TRADE_Info()
{
	AI_Output (other, self,"Org_843_Sharky_TRADE_Info_15_01"); //Przydałoby mi się kilka drobiazgów.
};  

/*------------------------------------------------------------------------
							TRADE BEGRÜßUNG 								
------------------------------------------------------------------------*/

instance  Org_843_Sharky_GREET (C_INFO) 
{
	npc				= Org_843_Sharky;
	condition		= Org_843_Sharky_GREET_Condition;
	information		= Org_843_Sharky_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Cześć, jak leci?"; 
};

FUNC int  Org_843_Sharky_GREET_Condition()
{
	return TRUE;
};


FUNC void  Org_843_Sharky_GREET_Info()
{
	AI_Output		(other, self,"Org_843_Sharky_GREET_Info_15_01"); //Cześć, jak leci?
	AI_Output		(self, other,"Org_843_Sharky_GREET_Info_10_02"); //Chcesz coś kupić?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"Szkodnik Sharky handluje bronią i innymi dobrami. Przebywa zwykle na terenie Nowego Obozu."); 
};





	



