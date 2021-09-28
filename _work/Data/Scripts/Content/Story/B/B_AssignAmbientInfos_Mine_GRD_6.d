// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Grd_6_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Grd_6 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Grd_6_EXIT_Condition;
	information	= Info_Mine_Grd_6_EXIT_Info;
	permanent	= 1;
	description = "FINE";
};                       

FUNC INT Info_Mine_Grd_6_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Grd_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Grd_6_Mine (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Grd_6_Mine_Condition;
	information	= Info_Mine_Grd_6_Mine_Info;
	permanent	= 1;
	description = "Cosa succede nella miniera?";
};                       

FUNC INT Info_Mine_Grd_6_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_6_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_6_Mine_15_00"); //Cosa succede nella miniera?
	AI_Output(self,other,"Info_Mine_Grd_6_Mine_06_01"); //I minatori raccolgono il metallo, altrimenti ricevono una bella lezione.
	
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Grd_6_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Grd_6_WichtigePersonen_Condition;
	information	= Info_Mine_Grd_6_WichtigePersonen_Info;
	permanent	= 1;
	description = "Chi comanda qui?";
};                       

FUNC INT Info_Mine_Grd_6_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_6_WichtigePersonen_15_00"); //Chi comanda qui?
	AI_Output(self,other,"Info_Mine_Grd_6_WichtigePersonen_06_01"); //Il nostro capo è Asghan, ma è Ian che si occupa del metallo e dei minatori.
	
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Grd_6_Minecrawler(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Grd_6_Minecrawler_Condition;
	information	= Info_Mine_Grd_6_Minecrawler_Info;
	permanent	= 1;
	description = "Parlami dei pidocchi di miniera.";
};                       

FUNC INT Info_Mine_Grd_6_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_6_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_6_Minecrawler_15_00"); //Parlami dei pidocchi di miniera.
	AI_Output(self,other,"Info_Mine_Grd_6_Minecrawler_06_01"); //Quelle bestiacce causano solo guai. Non so se ci danno più grattacapi loro o i minatori!
	
};	

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Grd_6_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Grd_6_DieLage_Condition;
	information	= Info_Mine_Grd_6_DieLage_Info;
	permanent	= 1;
	description = "Come va?";
};                       

FUNC INT Info_Mine_Grd_6_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_6_DieLage_15_00"); //Come va?
 	AI_Output(self,other,"Info_Mine_Grd_6_DieLage_06_01"); //Tu che ne dici?
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_GRD_6(var c_NPC slf)
{
	Info_Mine_Grd_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_6_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_6_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_6_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_6_DieLage.npc					= Hlp_GetInstanceID(slf);
};
