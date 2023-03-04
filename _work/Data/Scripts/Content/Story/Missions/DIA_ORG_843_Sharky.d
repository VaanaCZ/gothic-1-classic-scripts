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
	description		= "Fisk du Vieux Camp cherche un nouvel associé de commerce."; 
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
	AI_Output (other, self,"Org_843_Sharky_Fisk_Info_15_00"); //Fisk du Vieux Camp cherche un nouvel associé de commerce.
	AI_Output (self, other,"Org_843_Sharky_Fisk_Info_10_01"); //Et pourquoi veux-tu me parler de lui ?
	AI_Output (other, self,"Org_843_Sharky_Fisk_Info_15_02"); //J'ai pensé que tu pourrais être intéressé par un peu de minerai.
	AI_Output (self, other,"Org_843_Sharky_Fisk_Info_10_03"); //Pourquoi pas... Dis à Fisk qu'il peut compter sur moi dans les jours à venir.
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
	description		= "J'ai besoin de plusieurs choses..."; 
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
	AI_Output (other, self,"Org_843_Sharky_TRADE_Info_15_01"); //J'ai besoin de plusieurs choses...
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
	description		= "Hé, comment ça va ?"; 
};

FUNC int  Org_843_Sharky_GREET_Condition()
{
	return TRUE;
};


FUNC void  Org_843_Sharky_GREET_Info()
{
	AI_Output		(other, self,"Org_843_Sharky_GREET_Info_15_01"); //Hé, comment ça va ?
	AI_Output		(self, other,"Org_843_Sharky_GREET_Info_10_02"); //Veux-tu acheter quelque chose ?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"Sharky, le brigand, vends des ARMES et d'autres marchandises. Il est souvent quelque part dans le Nouveau Camp."); 
};





	



