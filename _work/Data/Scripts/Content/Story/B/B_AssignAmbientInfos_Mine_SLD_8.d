// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Sld_8_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_Mine_Sld_8_EXIT_Condition;
	information	= Info_Mine_Sld_8_EXIT_Info;
	permanent	= 1;
	description = "FIN";
};                       

FUNC INT Info_Mine_Sld_8_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Mine_Sld_8_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Sld_8_EinerVonEuchWerden_Condition;
	information	= Info_Mine_Sld_8_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "¿Cómo puedo ingresar en esta brigada?";
};                       

FUNC INT Info_Mine_Sld_8_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mine_Sld_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_EinerVonEuchWerden_15_00"); //¿Cómo puedo ingresar en esta brigada?
	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_01"); //Si quieres trabajar aquí en la Hondonada, antes tendrás que abrirte paso en el Campamento Nuevo.
	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_02"); //Ve y pregunta allí.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Sld_8_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Sld_8_WichtigePersonen_Condition;
	information	= Info_Mine_Sld_8_WichtigePersonen_Info;
	permanent	= 1;
	description = "¿Quién manda por aquí?";
};                       

FUNC INT Info_Mine_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_8_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_WichtigePersonen_15_00"); //¿Quién manda por aquí?
	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_01"); //Okyl está al mando aquí en la Hondonada. Lee es el que manda en el campamento.
	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_02"); //Será mejor que hables con ambos.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Mine_Sld_8_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Sld_8_DasLager_Condition;
	information	= Info_Mine_Sld_8_DasLager_Info;
	permanent	= 1;
	description = "¿Qué sucede en el campamento?";
};                       

FUNC INT Info_Mine_Sld_8_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_15_00"); //¿Qué sucede en el campamento?
	AI_Output(self,other,"Info_Mine_Sld_8_DasLager_08_01"); //Protegemos la entrada a la mina.
	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_08_02"); //Nadie que no sea de los nuestros puede entrar.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Sld_8_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Sld_8_DieLage_Condition;
	information	= Info_Mine_Sld_8_DieLage_Info;
	permanent	= 1;
	description = "¿Vale?";
};                       

FUNC INT Info_Mine_Sld_8_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_DieLage_15_00"); //¿Vale?
	AI_Output(self,other,"Info_Mine_Sld_8_DieLage_08_01"); //¿Por qué me lo preguntas? Todo está bajo control.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Sld_8(var c_NPC slf)
{
	//B_AssignFindNpcInfos(slf);
	
	Info_Mine_Sld_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_DieLage.npc				= Hlp_GetInstanceID(slf);
};
