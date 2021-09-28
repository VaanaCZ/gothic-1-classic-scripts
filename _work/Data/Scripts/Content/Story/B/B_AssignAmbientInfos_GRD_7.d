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
	description = "�Qu� tengo que hacer para ser aceptado en la guardia de G�mez?";
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
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00"); //�Qu� tengo que hacer para ser aceptado en la guardia de G�mez?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01"); //�T�? Bromeas. �Crees que puedes presentarte aqu� pavone�ndote e ir directamente a la cima, o qu�?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02"); //G�mez s�lo selecciona a los mejores para ser guardias.
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03"); //Tienes que ascender por medio de tu trabajo como todos los dem�s, y demostrar tu lealtad como Sombra.
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
	description = "�Qui�n manda por aqu�?";
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
	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00"); //�Qui�n manda por aqu�?
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
	description = "�Aqu� todo el mundo trabaja para G�mez?";
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
	AI_Output(other,self,"Info_grd_7_DasLager_15_00"); //�Aqu� todo el mundo trabaja para G�mez?
	AI_Output(self,other,"Info_grd_7_DasLager_07_01"); //No. La mayor�a s�lo son cavadores.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02"); //S�lo los guardias y las Sombras est�n con G�mez.
	Info_ClearChoices(Info_grd_7_DasLager);
	Info_AddChoice(Info_grd_7_DasLager,"ATR�S", Info_grd_7_DasLager_Zurueck);
	Info_AddChoice(Info_grd_7_DasLager,"�Qu� hacen los guardias?", Info_grd_7_DasLager_Gardisten);
	Info_AddChoice(Info_grd_7_DasLager,"�Qu� hacen las Sombras?", Info_grd_7_DasLager_Schatten);
	Info_AddChoice(Info_grd_7_DasLager,"�Qu� hacen los cavadores?", Info_grd_7_DasLager_Buddler);
};

FUNC VOID Info_grd_7_DasLager_ZURUECK()
{
	Info_ClearChoices(Info_grd_7_DasLager);
};

FUNC VOID Info_grd_7_DasLager_Gardisten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00"); //�Qu� hacen los guardias?
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01"); //Vigilamos el campamento y protegemos a los cavadores.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02"); //G�mez nos paga, y los cavadores nos dan dinero a cambio de protecci�n. Es un negocio bastante lucrativo.
};

FUNC VOID Info_grd_7_DasLager_Schatten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00"); //�Qu� hacen las Sombras?
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01"); //Las Sombras hacen que se obedezcan las �rdenes de G�mez.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02"); //La mayor�a son pelotas tratando de ascender por el escalaf�n. Si quieres llegar a alguna parte aqu�, �se es el camino a seguir.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03"); //Si realizas tus quehaceres sin fallar durante bastante tiempo, puedes convertirte en uno de nosotros.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04"); //Una vez est�s con G�mez, nadie de la colonia te molestar� m�s, muchacho.
};

FUNC VOID Info_grd_7_DasLager_Buddler()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00"); //�Qu� hacen los cavadores?
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01"); //�Buena pregunta! No deber�amos dejar que esos comebarro salieran de la mina.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02"); //Cuando llevan bastante tiempo en la mina, salen para gastarse su bot�n.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03"); //Cuando lo han derrochado, vuelven a la mina. Eso es lo que hace la mayor�a de la gente.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04"); //Parece que est�s hecho para algo m�s que manejar un pico. Deber�as hablar con Thorus, si es que no lo has hecho ya.
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
	description = "�Qu� tal?";
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
	AI_Output(other,self,"Info_grd_7_DieLage_15_00"); //�Qu� tal?
	AI_Output(self,other,"Info_grd_7_DieLage_07_01"); //�Para ti, quieres decir? Hasta que decidas con qu� campamento est�s, nadie va a tomarte en serio, chaval.
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
