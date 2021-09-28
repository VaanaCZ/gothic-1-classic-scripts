// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Grd_6_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Grd_6 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Grd_6_EXIT_Condition;
	information	= Info_Grd_6_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Grd_6_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Grd_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Grd_6_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Grd_6_EinerVonEuchWerden_Condition;
	information	= Info_Grd_6_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "¿Necesitáis algún hombre más?";
};                       

FUNC INT Info_Grd_6_EinerVonEuchWerden_Condition()
{
	if	(Npc_GetTrueGuild(other) != GIL_GRD)
	&&	(Npc_GetTrueGuild(other) != GIL_KDF)
	&&  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Grd_6_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Grd_6_EinerVonEuchWerden_15_00"); //¿Necesitáis algún hombre más?
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_01"); //Debes ser uno de los nuevos, ¿eh? Si buscas ingresar en algún campamento, inténtalo con los zumbados de la secta. No son quisquillosos con las admisiones.
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_02"); //¡Nosotros no aceptamos a todo el mundo, a menos que quieras cavar en la Vieja Mina!
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Grd_6_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_Grd_6_WichtigePersonen_Condition;
	information	= Info_Grd_6_WichtigePersonen_Info;
	permanent	= 1;
	description = "¿Quién manda por aquí?";
};                       

FUNC INT Info_Grd_6_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Grd_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Grd_6_WichtigePersonen_15_00"); //¿Quién manda por aquí?
	AI_Output(self,other,"Info_Grd_6_WichtigePersonen_06_01"); //Thorus es el que asegura que todo siga en marcha. Está a las órdenes de Gómez.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Grd_6_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_Grd_6_DasLager_Condition;
	information	= Info_Grd_6_DasLager_Info;
	permanent	= 1;
	description = "Soy nuevo. ¿Qué tengo que saber?";
};                       

FUNC INT Info_Grd_6_DasLager_Condition()
{	
	if (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToNewCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_Grd_6_DasLager_Info()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_15_00"); //Soy nuevo.
	AI_Output(self,other,"Info_Grd_6_DasLager_06_01"); //Ya veo.
	AI_Output(other,self,"Info_Grd_6_DasLager_15_02"); //¿Qué tengo que saber?
	AI_Output(self,other,"Info_Grd_6_DasLager_06_03"); //Que si causas problemas, se te castigará.
	Info_ClearChoices(Info_Grd_6_DasLager);
	Info_AddChoice(Info_Grd_6_DasLager,"Entiendo.", Info_Grd_6_DasLager_Verstehe);
	Info_AddChoice(Info_Grd_6_DasLager,"¿Qué consideras que son problemas?", Info_Grd_6_DasLager_WasIstAerger);
};

FUNC VOID Info_Grd_6_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_Verstehe_15_00"); //Entiendo.
	Info_ClearChoices(Info_Grd_6_DasLager);
};

FUNC VOID Info_Grd_6_DasLager_WasIstAerger()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_00"); //¿Qué consideras que son problemas?
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_01"); //La mayoría de los cavadores nos pagan para protegerlos.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_02"); //Si te metes con uno de ellos, nos ocuparemos de ti.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_03"); //Si te cojo rebuscando en las cabañas de los demás...
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); //Vale, vale, entendido.
	Info_ClearChoices(Info_Grd_6_DasLager);
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Grd_6_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Grd_6_DieLage_Condition;
	information	= Info_Grd_6_DieLage_Info;
	permanent	= 1;
	description = "¿Qué tal?";
};                       

FUNC INT Info_Grd_6_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Grd_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Grd_6_DieLage_15_00"); //¿Qué tal?
	AI_Output(self,other,"Info_Grd_6_DieLage_06_01"); //¿Buscas bronca? ¡Lárgate de aquí!
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_GRD_6(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Grd_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Grd_6_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Grd_6_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Grd_6_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Grd_6_DieLage.npc				= Hlp_GetInstanceID(slf);
};
