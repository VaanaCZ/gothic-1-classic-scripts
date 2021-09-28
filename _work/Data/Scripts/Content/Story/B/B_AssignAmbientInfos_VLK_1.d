// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_1_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_1 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_1_EXIT_Condition;
	information	= Info_Vlk_1_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Vlk_1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_1_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_1_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_1_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "¿Cómo ingreso en este campamento?";
};                       

FUNC INT Info_Vlk_1_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_1_EinerVonEuchWerden_15_00"); //¿Cómo ingreso en este campamento?
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_01"); //Es sencillo. Coge un pico y métete en la mina. La mitad del mineral que extraigas es para protección, y el resto te permitirá sobrevivir.
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_02"); //El precio que Gómez pide por sus provisiones es un robo. Aun así, es mejor que masticar arroz todo el día como hacen en el Campamento Nuevo.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_1_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_1_WichtigePersonen_Condition;
	information	= Info_Vlk_1_WichtigePersonen_Info;
	permanent	= 1;
	description = "¿Quién manda por aquí?";
};                       

FUNC INT Info_Vlk_1_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_1_WichtigePersonen_15_00"); //¿Quién manda por aquí?
	AI_Output(self,other,"Info_Vlk_1_WichtigePersonen_01_01"); //Los magnates del mineral. Ellos organizan el intercambio de mineral con el rey. Cuanto más importante eres, más recibes.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_1_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_1_DasLager_Condition;
	information	= Info_Vlk_1_DasLager_Info;
	permanent	= 1;
	description = "¿Hay algo interesante que ver que no sean chozas?";
};                       

FUNC INT Info_Vlk_1_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_1_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_1_DasLager_15_00"); //¿Hay algo interesante que ver que no sean chozas?
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_01"); //Bueno, puedes ir a la arena por las noches y ver cómo los guardias se parten la cara.
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_02"); //Realmente vale lo que cuesta la entrada.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_1_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_1_DieLage_Condition;
	information	= Info_Vlk_1_DieLage_Info;
	permanent	= 1;
	description = "¿Qué tal estás?";
};                       

FUNC INT Info_Vlk_1_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_1_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_1_DieLage_15_00"); //¿Qué tal estás?
	AI_Output(self,other,"Info_Vlk_1_DieLage_01_01"); //Me he pasado las dos últimas semanas trabajando en la mina. Lo único que quiero es paz. Quítate de en medio.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_1(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_1_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_1_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_1_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_1_DieLage.npc				= Hlp_GetInstanceID(slf);
};
