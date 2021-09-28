// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_grd_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_grd_13_EXIT_Condition;
	information	= Info_grd_13_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_grd_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_grd_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_grd_13_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_13_EinerVonEuchWerden_Condition;
	information	= Info_grd_13_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Quiero ingresar en la guardia.";
};                       

FUNC INT Info_grd_13_EinerVonEuchWerden_Condition()
{
	if	(Npc_GetTrueGuild(other) != GIL_GRD)
	&&	(Npc_GetTrueGuild(other) != GIL_KDF)
	&&  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_grd_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_13_EinerVonEuchWerden_15_00"); //Quiero ingresar en la guardia.
	AI_Output(self,other,"Info_grd_13_EinerVonEuchWerden_13_01"); //�Entonces tienes un largo camino por delante, muchacho!
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_grd_13_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_13_WichtigePersonen_Condition;
	information	= Info_grd_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "�Qui�n manda por aqu�?";
};                       

FUNC INT Info_grd_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_grd_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_13_WichtigePersonen_15_00"); //�Qui�n manda por aqu�?
	AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_01"); //Yo. �Y te aconsejo que tengas cuidado con lo que dices, muchacho!
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_grd_13_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_13_DasLager_Condition;
	information	= Info_grd_13_DasLager_Info;
	permanent	= 1;
	description = "�C�mo consigo entrar en el castillo?";
};                       

FUNC INT Info_grd_13_DasLager_Condition()
{
	if (Kapitel == 1) 
	{
	return 1;
	};
};

FUNC VOID Info_grd_13_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_13_DasLager_15_00"); //�C�mo consigo entrar en el castillo?
	AI_Output(self,other,"Info_grd_13_DasLager_13_01"); //No se puede. S�lo la gente de G�mez entra all�.
	Info_ClearChoices(Info_grd_13_DasLager);
	Info_AddChoice(Info_grd_13_DasLager,"Entiendo.", Info_grd_13_DasLager_Verstehe);
	Info_AddChoice(Info_grd_13_DasLager,"�Y si soborno a los guardias?", Info_grd_13_DasLager_WachenBestechen);
	Info_AddChoice(Info_grd_13_DasLager,"�C�mo consigo hablar con G�mez?", Info_grd_13_DasLager_GomezSprechen);
};

FUNC VOID Info_grd_13_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_grd_13_DasLager_Verstehe_15_00"); //Entiendo.
	Info_ClearChoices(Info_grd_13_DasLager);
};

FUNC VOID Info_grd_13_DasLager_WachenBestechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_00"); //�Y si soborno a los guardias?
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_01"); //Eres valiente, muchacho. Supongo que podr�as convencerles para que miraran a otro lado un minuto... si les das suficiente mineral.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_02"); //Pero si G�mez se entera de que han dejado entrar al castillo a un novato, les arrojar� a las mazmorras.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_03"); //Por supuesto, ese riesgo har� que sea m�s dif�cil aun entrar.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_04"); //Pero aunque consiguieras pasar �qu� har�as una vez dentro? Todos los edificios est�n muy vigilados.
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_05"); //S�lo ten�a curiosidad, eso es todo.
};

FUNC VOID Info_grd_13_DasLager_GomezSprechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_GomezSprechen_15_00"); //�C�mo consigo hablar con G�mez?
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_01"); //A G�mez no le interesan los muchachos nuevos que no han demostrado su val�a.
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_02"); //Si hablas en serio, charlar� con Thorus.

	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_grd_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_13_DieLage_Condition;
	information	= Info_grd_13_DieLage_Info;
	permanent	= 1;
	description = "�Qu� tal?";
};                       

FUNC INT Info_grd_13_DieLage_Condition()
{	
	if  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_grd_13_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_13_DieLage_15_00"); //�Qu� tal?
	AI_Output(self,other,"Info_grd_13_DieLage_13_01"); //Todo tranquilo. Alguna pelea de vez en cuando con el Campamento Nuevo o con un par de los zumbados de la secta.
	AI_Output(self,other,"Info_grd_13_DieLage_13_02"); //Mientras seas nuevo, da igual. Pero en cuanto decidas en qu� campamento ingresar�s, te meter�s hasta el cuello.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_grd_13(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_grd_13_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_grd_13_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_grd_13_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_grd_13_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_grd_13_DieLage.npc				= Hlp_GetInstanceID(slf);
};
