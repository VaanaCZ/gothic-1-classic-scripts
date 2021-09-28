// ************************ EXIT **************************

instance  Tpl_1400_GorNaBar_Exit (C_INFO)
{
	npc			= Tpl_1400_GorNaBar;
	nr			= 999;
	condition	= Tpl_1400_GorNaBar_Exit_Condition;
	information	= Tpl_1400_GorNaBar_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1400_GorNaBar_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1400_GorNaBar_Exit_Info()
{
	AI_Output			(self, other,"Tpl_1400_GorNaBar_Exit_Info_09_02"); //Kéž tì Spáè ochrání!
	AI_StopProcessInfos	( self );
};




// ***************** TEMPLER SAMMELN  *****************************

instance  Tpl_1400_GorNaBar_SUGGEST (C_INFO)
{
	npc				= Tpl_1400_GorNaBar;
	condition		= Tpl_1400_GorNaBar_SUGGEST_Condition;
	information		= Tpl_1400_GorNaBar_SUGGEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Potøebuju tvoji pomoc."; 
};

FUNC int  Tpl_1400_GorNaBar_SUGGEST_Condition()
{	
	if	 Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN)
	&&	!Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN_NOW)
	{
		return TRUE;
	};
};

FUNC void  Tpl_1400_GorNaBar_SUGGEST_Info()
{
	AI_Output			(other, self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_01"); //Potøebuju tvoji pomoc.
	AI_Output			(other, self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_02"); //Hledám pro Kaloma výmìšek a asi vím, kde je èerví hnízdo.
	AI_Output			(other, self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_03"); //Jestli otevøeme chodbu, budeš tam taky?
	AI_Output			(self, other,"Tpl_1400_GorNaBar_SUGGEST_Info_09_04"); //Hnízdo dùlních èervù. Koneènì! Mùj meè je ti k službám!

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"GATE"); 
	Npc_SetPermAttitude (self,ATT_FRIENDLY); 
	B_GiveXP			(XP_HireGorNaBar);

	B_LogEntry		(CH2_MCEggs,"Když jsem se zmínil o hnízdì dùlních èervù, templáø Gor Na Bar pøislíbil posilu posádce u Asghanových vrat. Tam ho také najdu.");
};

// ***************** Infos *****************************

instance  Tpl_1400_GorNaBar_INFO (C_INFO)
{
	npc				= Tpl_1400_GorNaBar;
	condition		= Tpl_1400_GorNaBar_INFO_Condition;
	information		= Tpl_1400_GorNaBar_INFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Co víš o dùlních èervech?";
};

FUNC int  Tpl_1400_GorNaBar_INFO_Condition()
{	
	if ! ( Npc_KnowsInfo (hero, Grd_263_Asghan_NEST ) )
	{
		return 1;
	};
};

FUNC void  Tpl_1400_GorNaBar_INFO_Info()
{
	AI_Output			(other, self,"Tpl_1400_GorNaBar_INFO_Info_15_01"); //Co víš o dùlních èervech?
	AI_Output			(self, other,"Tpl_1400_GorNaBar_INFO_Info_09_02"); //Èervi tu musí mít nìkde hnízdo. Kdybysme jenom vìdìli kde, mohli bysme znièit všechna mláïata.
};    


// EIER AM START
instance  Tpl_1400_GorNaBar_VICTORY (C_INFO)
{
	npc				= Tpl_1400_GorNaBar;
	condition		= Tpl_1400_GorNaBar_VICTORY_Condition;
	information		= Tpl_1400_GorNaBar_VICTORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Našel jsem hnízdo královny!"; 
};

FUNC int  Tpl_1400_GorNaBar_VICTORY_Condition()
{	
	if Npc_HasItems (hero,ItAt_Crawlerqueen ) >= 1 
	{
		return TRUE;
	};

};
FUNC void  Tpl_1400_GorNaBar_VICTORY_Info()
{
	AI_Output			(other, self,"Tpl_1400_GorNaBar_VICTORY_Info_15_01"); //Našel jsem hnízdo královny!
	AI_Output			(self, other,"Tpl_1400_GorNaBar_VICTORY_Info_09_02"); //Ukázal jsi odvahu a dùvtip! Potøebujeme lidi, jako jsi ty!
	
	Log_CreateTopic (GE_BecomeTemplar,LOG_NOTE);
	B_LogEntry (GE_BecomeTemplar,"Až pøinesu ta vajíèka, mìl bych si promluvit s Corem Angarem. Možná mi dovolí, abych se pøidal k templáøùm.");
};  
