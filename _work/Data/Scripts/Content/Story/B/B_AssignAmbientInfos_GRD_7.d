// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_grd_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_grd_7_EXIT_Condition;
	information	= Info_grd_7_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_grd_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_grd_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_grd_7_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_7_EinerVonEuchWerden_Condition;
	information	= Info_grd_7_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "¿Qué tengo que hacer para ser aceptado en la guardia de Gómez?";
};                       

FUNC INT Info_grd_7_EinerVonEuchWerden_Condition()
{
	if	(Npc_GetTrueGuild(other) != GIL_GRD)
	&&	(Npc_GetTrueGuild(other) != GIL_KDF)
	&&  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_grd_7_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00"); //¿Qué tengo que hacer para ser aceptado en la guardia de Gómez?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01"); //¿Tú? Bromeas. ¿Crees que puedes presentarte aquí pavoneándote e ir directamente a la cima, o qué?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02"); //Gómez sólo selecciona a los mejores para ser guardias.
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03"); //Tienes que ascender por medio de tu trabajo como todos los demás, y demostrar tu lealtad como Sombra.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_grd_7_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_7_WichtigePersonen_Condition;
	information	= Info_grd_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "¿Quién manda por aquí?";
};                       

FUNC INT Info_grd_7_WichtigePersonen_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00"); //¿Quién manda por aquí?
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01"); //Thorus controla todo lo que pasa en el campamento. Diego es su lugarteniente.
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02"); //Si quieres llegar a alguna parte, son los tipos con quienes tienes que hablar.
	var C_NPC Diego;		Diego 	= Hlp_GetNpc(PC_Thief);
	Diego.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_grd_7_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_7_DasLager_Condition;
	information	= Info_grd_7_DasLager_Info;
	permanent	= 1;
	description = "¿Aquí todo el mundo trabaja para Gómez?";
};                       

FUNC INT Info_grd_7_DasLager_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_7_DasLager_15_00"); //¿Aquí todo el mundo trabaja para Gómez?
	AI_Output(self,other,"Info_grd_7_DasLager_07_01"); //No. La mayoría sólo son cavadores.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02"); //Sólo los guardias y las Sombras están con Gómez.
	Info_ClearChoices(Info_grd_7_DasLager);
	Info_AddChoice(Info_grd_7_DasLager,"ATRÁS", Info_grd_7_DasLager_Zurueck);
	Info_AddChoice(Info_grd_7_DasLager,"¿Qué hacen los guardias?", Info_grd_7_DasLager_Gardisten);
	Info_AddChoice(Info_grd_7_DasLager,"¿Qué hacen las Sombras?", Info_grd_7_DasLager_Schatten);
	Info_AddChoice(Info_grd_7_DasLager,"¿Qué hacen los cavadores?", Info_grd_7_DasLager_Buddler);
};

FUNC VOID Info_grd_7_DasLager_ZURUECK()
{
	Info_ClearChoices(Info_grd_7_DasLager);
};

FUNC VOID Info_grd_7_DasLager_Gardisten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00"); //¿Qué hacen los guardias?
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01"); //Vigilamos el campamento y protegemos a los cavadores.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02"); //Gómez nos paga, y los cavadores nos dan dinero a cambio de protección. Es un negocio bastante lucrativo.
};

FUNC VOID Info_grd_7_DasLager_Schatten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00"); //¿Qué hacen las Sombras?
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01"); //Las Sombras hacen que se obedezcan las órdenes de Gómez.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02"); //La mayoría son pelotas tratando de ascender por el escalafón. Si quieres llegar a alguna parte aquí, ése es el camino a seguir.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03"); //Si realizas tus quehaceres sin fallar durante bastante tiempo, puedes convertirte en uno de nosotros.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04"); //Una vez estés con Gómez, nadie de la colonia te molestará más, muchacho.
};

FUNC VOID Info_grd_7_DasLager_Buddler()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00"); //¿Qué hacen los cavadores?
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01"); //¡Buena pregunta! No deberíamos dejar que esos comebarro salieran de la mina.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02"); //Cuando llevan bastante tiempo en la mina, salen para gastarse su botín.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03"); //Cuando lo han derrochado, vuelven a la mina. Eso es lo que hace la mayoría de la gente.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04"); //Parece que estás hecho para algo más que manejar un pico. Deberías hablar con Thorus, si es que no lo has hecho ya.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_grd_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_7_DieLage_Condition;
	information	= Info_grd_7_DieLage_Info;
	permanent	= 1;
	description = "¿Qué tal?";
};                       

FUNC INT Info_grd_7_DieLage_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_7_DieLage_15_00"); //¿Qué tal?
	AI_Output(self,other,"Info_grd_7_DieLage_07_01"); //¿Para ti, quieres decir? Hasta que decidas con qué campamento estás, nadie va a tomarte en serio, chaval.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_grd_7(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_grd_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_grd_7_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_grd_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_grd_7_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_grd_7_DieLage.npc				= Hlp_GetInstanceID(slf);
};
