// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Vlk_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Vlk_4_EXIT_Condition;
	information	= Info_Mine_Vlk_4_EXIT_Info;
	permanent	= 1;
	description = "FINE";
};                       

FUNC INT Info_Mine_Vlk_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Vlk_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Die Mine
// *************************************************************************

INSTANCE Info_Mine_Vlk_4_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Vlk_4_Mine_Condition;
	information	= Info_Mine_Vlk_4_Mine_Info;
	permanent	= 1;
	description = "Parlami della miniera.";
};                       

FUNC INT Info_Mine_Vlk_4_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_4_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_Mine_15_00"); //Parlami della miniera.
	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_01"); //Picconi e sudore, ecco cosa ti aspetta. Tutto qui.
	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_02"); //E quando te ne sarai andato da molto tempo, io sarò ancora qui a estrarre il metallo: è il mio lavoro... e la mia vita.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Vlk_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Vlk_4_WichtigePersonen_Condition;
	information	= Info_Mine_Vlk_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "Chi è il capo, qui?";
};                       

FUNC INT Info_Mine_Vlk_4_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_WichtigePersonen_15_00"); //Chi è il capo, qui?
	AI_Output(self,other,"Info_Mine_Vlk_4_WichtigePersonen_01_01"); //Santino e Alberto scambiano il metallo che noi estraiamo con merci di vario tipo e ci forniscono le razioni quotidiane.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Mine_Vlk_4_Minecrawler(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Vlk_4_Minecrawler_Condition;
	information	= Info_Mine_Vlk_4_Minecrawler_Info;
	permanent	= 1;
	description = "Cosa mi dici dei pidocchi di miniera?";
};                       

FUNC INT Info_Mine_Vlk_4_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_4_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_Minecrawler_15_00"); //Cosa mi dici dei pidocchi di miniera?
	AI_Output(self,other,"Info_Mine_Vlk_4_Minecrawler_01_01"); //Se vedi uno di quei mostri, colpiscilo forte in mezzo agli occhi col piccone. Però devi mirare bene, perché non avrai una seconda possibilità.
	
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Vlk_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Vlk_4_DieLage_Condition;
	information	= Info_Mine_Vlk_4_DieLage_Info;
	permanent	= 1;
	description = "Come va?";
};                       

FUNC INT Info_Mine_Vlk_4_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_DieLage_15_00"); //Come va?
	AI_Output(self,other,"Info_Mine_Vlk_4_DieLage_01_01"); //Sono stato meglio.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Vlk_4(var c_NPC slf)
{
	
	
	Info_Mine_Vlk_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_DieLage.npc					= Hlp_GetInstanceID(slf);
};
