// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_3 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_3_EXIT_Condition;
	information	= Info_Vlk_3_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Vlk_3_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_3_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_3_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_3_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "¿Cómo puedo ingresar en este campamento?";
};                       

FUNC INT Info_Vlk_3_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_3_EinerVonEuchWerden_15_00"); //¿Cómo puedo ingresar en este campamento?
	AI_Output(self,other,"Info_Vlk_3_EinerVonEuchWerden_03_01"); //Yo sólo soy un cavador. No tengo voz ni voto en el asunto. Deberías hablar con los guardias o las Sombras.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_3_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_3_WichtigePersonen_Condition;
	information	= Info_Vlk_3_WichtigePersonen_Info;
	permanent	= 1;
	description = "¿Quién es el jefe por aquí?";
};                       

FUNC INT Info_Vlk_3_WichtigePersonen_Condition()
{	
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_3_WichtigePersonen_15_00"); //¿Quién es el jefe por aquí?
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_01"); //Gómez. Vive en el castillo. Pero los cavadores ya tenemos bastante de qué preocuparnos con los guardias.
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_02"); //Lo mejor es que no te interpongas en su camino. Si lo haces, te meterás en líos.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_3_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_3_DasLager_Condition;
	information	= Info_Vlk_3_DasLager_Info;
	permanent	= 1;
	description = "¿Cuáles son los lugares más importantes?";
};                       

FUNC INT Info_Vlk_3_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_3_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DasLager_15_00"); //¿Cuáles son los lugares más importantes?
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_01"); //Bueno, si te gusta jugar, tienes que ir a la arena por las noches. Si quieres comprar cosas, ve al mercado.
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_02"); //Allí venden prácticamente de todo. Menos mapas. Si quieres mapas, mejor ve a ver a Graham. Su cabaña es la que está frente a la  puerta del castillo.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_3_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_3_DieLage_Condition;
	information	= Info_Vlk_3_DieLage_Info;
	permanent	= 1;
	description = "¿Qué pasa?";
};                       

FUNC INT Info_Vlk_3_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DieLage_15_00"); //¿Qué pasa?
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_01"); //Pronto aprenderás. Mantente alerta a todas horas. Especialmente de noche.
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_02"); //Llevo varios días sin dormir bien. Y, en esta colonia, si no duermes duplicas turno.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_3(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_3_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_3_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_3_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_3_DieLage.npc				= Hlp_GetInstanceID(slf);
};
