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
	description = "FIN";
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
	description = "Que se passe t'il dans la mine ?";
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
	AI_Output(other,self,"Info_Mine_Grd_6_Mine_15_00"); //Que se passe t'il dans la mine ?
	AI_Output(self,other,"Info_Mine_Grd_6_Mine_06_01"); //Les mineurs récoltent le minerai sinon, ils se prennent une branlé !
	
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
	description = "Qui dirige par ici ?";
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
	AI_Output(other,self,"Info_Mine_Grd_6_WichtigePersonen_15_00"); //Qui dirige par ici ?
	AI_Output(self,other,"Info_Mine_Grd_6_WichtigePersonen_06_01"); //Asghan est notre chef, mais Ian s'occupe de tout, du minerai et des mineurs.
	
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
	description = "Raconte-moi pour les Chenilles.";
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
	AI_Output(other,self,"Info_Mine_Grd_6_Minecrawler_15_00"); //Raconte-moi pour les Chenilles.
	AI_Output(self,other,"Info_Mine_Grd_6_Minecrawler_06_01"); //Ces créatures n'apportent que des ennuis. Je ne sais pas ce qui nous donne le plus de travail, ces créatures ou les mineurs.
	
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
	description = "Comment va ?";
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
	AI_Output(other,self,"Info_Mine_Grd_6_DieLage_15_00"); //Comment va ?
 	AI_Output(self,other,"Info_Mine_Grd_6_DieLage_06_01"); //Hé bien, que penses-tu ?
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
