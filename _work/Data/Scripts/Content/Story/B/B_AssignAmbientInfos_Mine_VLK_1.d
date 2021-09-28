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
	description = "FINE";
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
	description = "Parlami della miniera.";
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
	AI_Output(other,self,"Info_Mine_Vlk_1_Mine_15_00"); //Parlami della miniera.
	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_01"); //Nelle caverne crescono funghi ed erbe. Tutta roba molto digeribile, ma che non riempie come una bella bistecca.
	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_02"); //Nemmeno i pidocchi sono molto appetitosi. Che posto di merda.
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
	description = "Chi è il capo, qui?";
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
	AI_Output(other,self,"Info_Mine_Vlk_1_WichtigePersonen_15_00"); //Chi è il capo, qui?
	AI_Output(self,other,"Info_Mine_Vlk_1_WichtigePersonen_01_01"); //Ian organizza il lavoro e gli scambi di merci con il campo. Se ti serve qualcosa, parlane con lui.
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
	description = "Cosa mi dici dei pidocchi di miniera?";
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
	AI_Output(other,self,"Info_Mine_Vlk_1_Minecrawler_15_00"); //Cosa mi dici dei pidocchi di miniera?
	AI_Output(self,other,"Info_Mine_Vlk_1_Minecrawler_01_01"); //I templari hanno stretto un patto con Gomez. Uccidono i pidocchi e si tengono le loro mascelle.
	
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
	description = "Come va?";
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
	AI_Output(other,self,"Info_Mine_Vlk_1_DieLage_15_00"); //Come va?
	AI_Output(self,other,"Info_Mine_Vlk_1_DieLage_01_01"); //Molto lavoro, poco riposo. Se devi chiedermi qualcosa, fallo in fretta: non ho tempo da perdere.
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
