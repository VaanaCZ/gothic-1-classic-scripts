// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_4_EXIT_Condition;
	information	= Info_Vlk_4_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Vlk_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_EXIT_Info()
{	
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00"); //Gracias. Buena suerte.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01"); //Esa barbilla arriba, chaval.
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_4_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_4_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_4_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "¿Qué tengo que hacer para ingresar en este campamento?";
};                       

FUNC INT Info_Vlk_4_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_4_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01"); //¿Qué tengo que hacer para ingresar en este campamento?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04"); //¿Como Sombra o como guardia? No será fácil, tío. Tienes que superar unas cuantas pruebas antes de que Thorus te deje ver a Gómez.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02"); //Y tendrás que caerle bien a la gente de aquí. Pero mientras no pertenezcas a ningún campamento, nadie va a tomarte en serio.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03"); //Si yo estuviese en tu lugar, hablaría con alguna de las Sombras. Tal vez encuentres a alguien que esté dispuesto a ayudarte. Es decir, si le ofreces algo a cambio.
	
	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_4_WichtigePersonen_Condition;
	information	= Info_Vlk_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "¿Hay algo especial que deba saber?";
};                       

FUNC INT Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00"); //¿Hay algo especial que deba saber?
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01"); //Siendo nuevo, asegúrate de no pelearte con Gravo. Puede que sólo sea un cavador, pero sabe cómo tratar con los magnates del mineral.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02"); //Si te metes en líos con la panda de Gómez, puede ayudarte a salir de ellos.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_4_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_4_DasLager_Condition;
	information	= Info_Vlk_4_DasLager_Info;
	permanent	= 1;
	description = "¿Qué lugares debo conocer por aquí?";
};                       

FUNC INT Info_Vlk_4_DasLager_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00"); //¿Qué lugares debo conocer por aquí?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01"); //A menos que te guste cavar en las minas, deberías moverte entre la puerta norte y la puerta del castillo.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02"); //Si tienes suerte, tal vez Thorus o Diego te den algo que hacer... Eso te ofrecerá la posibilidad de congraciarte con ellos. No puede perjudicarte llevarte bien con la gente de Gómez.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03"); //O puede que te encuentres con un mago. A veces piden a la gente que hagan recados. Y pagan bien.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04"); //¿Los magos salen del castillo? ¿Cuándo?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05"); //¿Y yo qué sé? Pregunta a la gente que vive allí.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_4_DieLage_Condition;
	information	= Info_Vlk_4_DieLage_Info;
	permanent	= 1;
	description = "¿Estás bien?";
};                       

FUNC INT Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00"); //¿Estás bien?
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01"); //Tan bien como hace 20 años. No ha cambiado gran cosa desde entonces.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_4(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_4_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_4_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_4_DieLage.npc				= Hlp_GetInstanceID(slf);
};
