// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Grd_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Grd_13_EXIT_Condition;
	information	= Info_Mine_Grd_13_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Mine_Grd_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Grd_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Grd_13_Mine (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Grd_13_Mine_Condition;
	information	= Info_Mine_Grd_13_Mine_Info;
	permanent	= 1;
	description = "Que se passe t'il dans la mine ?";
};                       

FUNC INT Info_Mine_Grd_13_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_13_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_Mine_15_00"); //Que se passe t'il dans la mine ?
	AI_Output(self,other,"Info_Mine_Grd_13_Mine_13_01"); //La mine est le coeur du Vieux Camp. Pas de mine, pas de minerai. Pas de minerai, pas de marchandises. Tu piges ?
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Grd_13_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Grd_13_WichtigePersonen_Condition;
	information	= Info_Mine_Grd_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "Qui dirige par ici ?";
};                       

FUNC INT Info_Mine_Grd_13_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_WichtigePersonen_15_00"); //Qui dirige par ici ?
	AI_Output(self,other,"Info_Mine_Grd_13_WichtigePersonen_13_01"); //Asghan est notre chef. Mais laisse le tranquille. Ian est celui à qui tu dois parler.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Grd_13_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Grd_13_DasLager_Condition;
	information	= Info_Mine_Grd_13_DasLager_Info;
	permanent	= 1;
	description = "Raconte-moi pour les Chenilles.";
};                       

FUNC INT Info_Mine_Grd_13_DasLager_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_DasLager_15_00"); //Raconte-moi pour les Chenilles.
	AI_Output(self,other,"Info_Mine_Grd_13_DasLager_13_01"); //La Confrérie paye le Vieux Camp en Herbe, alors ils les laissent chasser les Chenilles dans la mine.
	
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Grd_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Grd_13_DieLage_Condition;
	information	= Info_Mine_Grd_13_DieLage_Info;
	permanent	= 1;
	description = "Comment vont les choses ?";
};                       

FUNC INT Info_Mine_Grd_13_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_DieLage_15_00"); //Comment vont les choses ?
	AI_Output(self,other,"Info_Mine_Grd_13_DieLage_13_01"); //Je n'ai pas eu de combat depuis fort longtemps !
	
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_grd_13(var c_NPC slf)
{
	
	
	Info_Mine_Grd_13_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_Mine.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_DieLage.npc				= Hlp_GetInstanceID(slf);
};
