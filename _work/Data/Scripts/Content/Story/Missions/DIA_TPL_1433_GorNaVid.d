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
	AI_Output (self, other,"Tpl_1433_GorNaVid_Exit_Info_13_02"); //Kéž Spáč procitne!
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
	description		= "Potřebuju tvoji pomoc."; 
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
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_01"); //Potřebuju tvoji pomoc.
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_02"); //Hledám pro Kaloma výměšek a asi vím, kde je červí hnízdo.
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_03"); //Jestli otevřeme chodbu, budeš tam taky?
	AI_Output (self, other,"Tpl_1433_GorNaVid_HEALTH_Info_13_04"); //Když bojujeme s červy, často to znamená spousty krve. Když mi přineseš hojivý lektvar, můžeš se mnou počítat.

};  
// ***************** Infos *****************************

instance  Tpl_1433_GorNaVid_IAN (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_IAN_Condition;
	information		= Tpl_1433_GorNaVid_IAN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hledám hnízdo důlních červů."; 
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
	AI_Output (other, self,"Tpl_1433_GorNaVid_IAN_Info_15_01"); //Hledám hnízdo důlních červů.
	AI_Output (self, other,"Tpl_1433_GorNaVid_IAN_Info_13_02"); //Vedle hlavní šachty dolu je mnoho jeskyní, ale nenašli jsme tam žádné hnízdo.
};  

// ***************** Infos *****************************
instance  Tpl_1433_GorNaVid_HEALTH_SUC (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_HEALTH_SUC_Condition;
	information		= Tpl_1433_GorNaVid_HEALTH_SUC_Info;
	important		= 0;
	permanent		= 0;
	description		= "(podej hojivý lektvar)"; 
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
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_01"); //Tady, to pomůže.
	AI_Output (self, other,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_13_02"); //Díky, můžeš se mnou počítat. Sejdeme se dole s Asghanem.
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
		PrintDebugNpc (PD_MISSION, "KEINE POTION= UNMÖGLICH");
	};

	Npc_ExchangeRoutine (self,"GATE"); 
	Npc_SetPermAttitude	(self,ATT_FRIENDLY); 
	B_GiveXP			(XP_HireGorNaVid);
	B_LogEntry		(CH2_MCEggs,"Než Gor Na Vid souhlasil, že se přidá k posile u Asghanových vrat, musel jsem mu dát hojivý lektvar.");	

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
	description		= "Našel jsem hnízdo královny!"; 
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
	AI_Output (other, self,"Tpl_1433_GorNavid_VICTORY_Info_15_01"); //Našel jsem hnízdo královny!
	AI_Output (self, other,"Tpl_1433_GorNavid_VICTORY_Info_13_02"); //Děkuju ti ve jménu celého Bratrstva!
	AI_Output (self, other,"Tpl_1433_GorNavid_VICTORY_Info_13_03"); //Nechť Spáč stále nad tebou drží ochrannou ruku!
};     
 
