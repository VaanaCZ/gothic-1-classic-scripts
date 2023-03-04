// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Vlk_1_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_1 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Vlk_1_EXIT_Condition;
	information	= Info_Mine_Vlk_1_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Mine_Vlk_1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Vlk_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Vlk_1_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Vlk_1_Mine_Condition;
	information	= Info_Mine_Vlk_1_Mine_Info;
	permanent	= 1;
	description = "Raconte-moi sur la mine.";
};                       

FUNC INT Info_Mine_Vlk_1_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_1_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_Mine_15_00"); //Raconte-moi sur la mine.
	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_01"); //Les champignons et les Herbes poussent dans les caves. Ces trucs sont faciles à digérer, mais ça ne vous rempli pas autant qu'un bon morceau de viande.
	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_02"); //Les Chenilles ne sont même pas bonnes. Quelle merde.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Vlk_1_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Vlk_1_WichtigePersonen_Condition;
	information	= Info_Mine_Vlk_1_WichtigePersonen_Info;
	permanent	= 1;
	description = "Qui est responsable ici ?";
};                       

FUNC INT Info_Mine_Vlk_1_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_WichtigePersonen_15_00"); //Qui est responsable ici ?
	AI_Output(self,other,"Info_Mine_Vlk_1_WichtigePersonen_01_01"); //Ian est le chef de la mine. Il organise les travaux et l'échange de marchandises avec le Camp. Si tu veux quelque chose, tu ferais mieux de lui parler.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Vlk_1_Minecrawler(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Vlk_1_Minecrawler_Condition;
	information	= Info_Mine_Vlk_1_Minecrawler_Info;
	permanent	= 1;
	description = "Que sais-tu sur les Chenilles des Mines ?";
};                       

FUNC INT Info_Mine_Vlk_1_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_1_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_Minecrawler_15_00"); //Que sais-tu sur les Chenilles des Mines ?
	AI_Output(self,other,"Info_Mine_Vlk_1_Minecrawler_01_01"); //Les templiers ont conclu un marché avec Gomez. Ils tuent les Chenilles, et ils peuvent garder les mandibules.
	
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Vlk_1_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Vlk_1_DieLage_Condition;
	information	= Info_Mine_Vlk_1_DieLage_Info;
	permanent	= 1;
	description = "Comment va ?";
};                       

FUNC INT Info_Mine_Vlk_1_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_1_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_DieLage_15_00"); //Comment va ?
	AI_Output(self,other,"Info_Mine_Vlk_1_DieLage_01_01"); //Beaucoup de travail, pas beaucoup de repos. Alors fait vite avec tes questions. J'ai à faire.
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Vlk_1(var c_NPC slf)
{
	Info_Mine_Vlk_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_DieLage.npc					= Hlp_GetInstanceID(slf);
};
