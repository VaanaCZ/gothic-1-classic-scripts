// ************************ EXIT **************************

instance  Tpl_1433_GorNaVid_Exit (C_INFO)
{
	npc			= Tpl_1433_GorNaVid;
	nr			= 999;
	condition	= Tpl_1433_GorNaVid_Exit_Condition;
	information	= Tpl_1433_GorNaVid_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1433_GorNaVid_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1433_GorNaVid_Exit_Info()
{
	AI_Output (self, other,"Tpl_1433_GorNaVid_Exit_Info_13_02"); //KÈû Sp·Ë procitne!
	AI_StopProcessInfos	( self );
};

// ***************** Infos *****************************

instance  Tpl_1433_GorNaVid_HEALTH (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_HEALTH_Condition;
	information		= Tpl_1433_GorNaVid_HEALTH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Pot¯ebuju tvoji pomoc."; 
};

FUNC int  Tpl_1433_GorNaVid_HEALTH_Condition()
{	
	if	 Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN)
	&&	!Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN_NOW)
	{
		return TRUE;
	};
};

FUNC void  Tpl_1433_GorNaVid_HEALTH_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_01"); //Pot¯ebuju tvoji pomoc.
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_02"); //Hled·m pro Kaloma v˝mÏöek a asi vÌm, kde je ËervÌ hnÌzdo.
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_03"); //Jestli otev¯eme chodbu, budeö tam taky?
	AI_Output (self, other,"Tpl_1433_GorNaVid_HEALTH_Info_13_04"); //Kdyû bojujeme s Ëervy, Ëasto to znamen· spousty krve. Kdyû mi p¯ineseö hojiv˝ lektvar, m˘ûeö se mnou poËÌtat.

};  
// ***************** Infos *****************************

instance  Tpl_1433_GorNaVid_IAN (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_IAN_Condition;
	information		= Tpl_1433_GorNaVid_IAN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hled·m hnÌzdo d˘lnÌch Ëerv˘."; 
};

FUNC int  Tpl_1433_GorNaVid_IAN_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING
	&&	!Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN))
	{
		return 1;
	};
};

FUNC void  Tpl_1433_GorNaVid_IAN_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNaVid_IAN_Info_15_01"); //Hled·m hnÌzdo d˘lnÌch Ëerv˘.
	AI_Output (self, other,"Tpl_1433_GorNaVid_IAN_Info_13_02"); //Vedle hlavnÌ öachty dolu je mnoho jeskynÌ, ale nenaöli jsme tam û·dnÈ hnÌzdo.
};  

// ***************** Infos *****************************
instance  Tpl_1433_GorNaVid_HEALTH_SUC (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_HEALTH_SUC_Condition;
	information		= Tpl_1433_GorNaVid_HEALTH_SUC_Info;
	important		= 0;
	permanent		= 0;
	description		= "(podej hojiv˝ lektvar)"; 
};

FUNC int  Tpl_1433_GorNaVid_HEALTH_SUC_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1433_GorNaVid_HEALTH )) &&
		(Npc_HasItems (hero, Itfo_Potion_Health_01)  || 
		 Npc_HasItems (hero, Itfo_Potion_Health_02)  ||
		 Npc_HasItems (hero, Itfo_Potion_Health_03))	
	{
		return 1;
	};

};
FUNC void  Tpl_1433_GorNaVid_HEALTH_SUC_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_01"); //Tady, to pom˘ûe.
	AI_Output (self, other,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_13_02"); //DÌky, m˘ûeö se mnou poËÌtat. Sejdeme se dole s Asghanem.
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_03"); //Budu tam.
	
	if Npc_HasItems (hero,Itfo_Potion_Health_01)
	{
		B_GiveInvItems (hero, self,Itfo_Potion_Health_01, 1);
	}
	else if Npc_HasItems (hero,Itfo_Potion_Health_02)
	{
		B_GiveInvItems (hero, self,Itfo_Potion_Health_02, 1);
	}	 
	else if Npc_HasItems (hero,Itfo_Potion_Health_03)
	{
	 	B_GiveInvItems (hero, self,Itfo_Potion_Health_03, 1);
	}
	else 
	{
		PrintDebugNpc (PD_MISSION, "KEINE POTION= UNM÷GLICH");
	};

	Npc_ExchangeRoutine (self,"GATE"); 
	Npc_SetPermAttitude	(self,ATT_FRIENDLY); 
	B_GiveXP			(XP_HireGorNaVid);
	B_LogEntry		(CH2_MCEggs,"Neû Gor Na Vid souhlasil, ûe se p¯id· k posile u Asghanov˝ch vrat, musel jsem mu d·t hojiv˝ lektvar.");	

	AI_StopProcessInfos	(self);
};

//---------EIER GEFUNDEN------------------------------------------------------
instance  Tpl_1433_GorNavid_VICTORY (C_INFO)
{
	npc				= Tpl_1433_GorNavid;
	condition		= Tpl_1433_GorNavid_VICTORY_Condition;
	information		= Tpl_1433_GorNavid_VICTORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Naöel jsem hnÌzdo kr·lovny!"; 
};

FUNC int  Tpl_1433_GorNavid_VICTORY_Condition()
{	
	if Npc_HasItems (hero,ItAt_Crawlerqueen ) >= 1 
	{
		return TRUE;
	};

};
FUNC void  Tpl_1433_GorNavid_VICTORY_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNavid_VICTORY_Info_15_01"); //Naöel jsem hnÌzdo kr·lovny!
	AI_Output (self, other,"Tpl_1433_GorNavid_VICTORY_Info_13_02"); //DÏkuju ti ve jmÈnu celÈho Bratrstva!
	AI_Output (self, other,"Tpl_1433_GorNavid_VICTORY_Info_13_03"); //Nechù Sp·Ë st·le nad tebou drûÌ ochrannou ruku!
};     
 
