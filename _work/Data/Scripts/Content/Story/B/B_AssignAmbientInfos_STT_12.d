// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Stt_12_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Stt_12 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Stt_12_EXIT_Condition;
	information	= Info_Stt_12_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Stt_12_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_12_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Stt_12_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Stt_12_EinerVonEuchWerden_Condition;
	information	= Info_Stt_12_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Me gustaría enrolarme en las Sombras.";
};                       

FUNC INT Info_Stt_12_EinerVonEuchWerden_Condition()
{
	if  (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Stt_12_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_00"); //Me gustaría enrolarme en las Sombras.
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_01"); //Oh. Entonces debes saber que Gómez no tolera fallos. Si quieres ser uno de nosotros, tienes que estar dispuesto a atravesar fuego por él.
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_02"); //Sólo la mitad de los que lo intentan son aceptados.
	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_03"); //¿Qué pasa con el resto?
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_04"); //Probablemente estén sentados en el Campamento Nuevo mascando arroz. Je je je.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Stt_12_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Stt_12_WichtigePersonen_Condition;
	information	= Info_Stt_12_WichtigePersonen_Info;
	permanent	= 1;
	description = "¿Quién es el jefe de este lugar?";
};                       

FUNC INT Info_Stt_12_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_12_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Stt_12_WichtigePersonen_15_00"); //¿Quién es el jefe de este lugar?
	AI_Output(self,other,"Info_Stt_12_WichtigePersonen_12_01"); //Podría decirse que Diego es el jefe de las Sombras. Pero Thorus decide quién va a ver a Gómez.
	
	var C_NPC Diego;		Diego 	= Hlp_GetNpc(PC_Thief);
	Diego.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Stt_12_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Stt_12_DasLager_Condition;
	information	= Info_Stt_12_DasLager_Info;
	permanent	= 1;
	description = "Quiero saber lo que puede ofrecer este campamento.";
};                       

FUNC INT Info_Stt_12_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_12_DasLager_Info()
{
	AI_Output(other,self,"Info_Stt_12_DasLager_15_00"); //Quiero saber lo que puede ofrecer este campamento.
	AI_Output(self,other,"Info_Stt_12_DasLager_12_01"); //Entonces será mejor que preguntes a los cavadores. No tienen nada que hacer en todo el día.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Stt_12_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Stt_12_DieLage_Condition;
	information	= Info_Stt_12_DieLage_Info;
	permanent	= 1;
	description = "Bueno, ¿qué tal estás?";
};                       

FUNC INT Info_Stt_12_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_12_DieLage_Info()
{
	AI_Output(other,self,"Info_Stt_12_DieLage_15_00"); //Bueno, ¿qué tal estás?
	AI_Output(self,other,"Info_Stt_12_DieLage_12_01"); //¿Qué quieres?
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Stt_12(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Stt_12_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_Stt_12_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Stt_12_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_Stt_12_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_Stt_12_DieLage.npc				= Hlp_GetInstanceID(slf);
};
