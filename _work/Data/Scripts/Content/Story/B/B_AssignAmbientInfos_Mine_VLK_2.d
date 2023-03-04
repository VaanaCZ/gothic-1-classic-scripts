// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Vlk_2_EXIT_Condition;
	information	= Info_Mine_Vlk_2_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Mine_Vlk_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Vlk_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Vlk_2_Mine_Condition;
	information	= Info_Mine_Vlk_2_Mine_Info;
	permanent	= 1;
	description = "Raconte-moi sur la mine.";
};                       

FUNC INT Info_Mine_Vlk_2_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Mine_15_00"); //Raconte-moi sur la mine.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_01"); //Il y a beaucoup de caves où il reste encore beaucoup de minerai. Mais les Chenilles les rendent inaccessibles.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_02"); //Trop d'attaques, trop de pertes.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Vlk_2_WichtigePersonen_Condition;
	information	= Info_Mine_Vlk_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Qui dirige ici ?";
};                       

FUNC INT Info_Mine_Vlk_2_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_WichtigePersonen_15_00"); //Qui dirige ici ?
	AI_Output(self,other,"Info_Mine_Vlk_2_WichtigePersonen_01_01"); //Viper est le fondeur. Il sait tout sur le four, il a un corps en fer forgé. Il ne craint pas la douleur. Il passe toute la journée à fondre le minerai.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_Minecrawler(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Vlk_2_Minecrawler_Condition;
	information	= Info_Mine_Vlk_2_Minecrawler_Info;
	permanent	= 1;
	description = "Que sais-tu sur les Chenilles des Mines ?";
};                       

FUNC INT Info_Mine_Vlk_2_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Minecrawler_15_00"); //Que sais-tu sur les Chenilles des Mines ?
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_01"); //Nous devons nous écarter du grand puit. ça fourmille de Chenilles des mines.
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_02"); //Il y a plein de Chenilles des mines par ici. Tu ne les entends pas ? Moi oui !
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Vlk_2_DieLage_Condition;
	information	= Info_Mine_Vlk_2_DieLage_Info;
	permanent	= 1;
	description = "Comment vas-tu ?";
};                       

FUNC INT Info_Mine_Vlk_2_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_DieLage_15_00"); //Comment vas-tu ?
	AI_Output(self,other,"Info_Mine_Vlk_2_DieLage_01_01"); //J'ai du travail. Si les gardes me prennent en train de parler, ils me couperont mes rations.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Vlk_2(var c_NPC slf)
{
	Info_Mine_Vlk_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_DieLage.npc					= Hlp_GetInstanceID(slf);
};
