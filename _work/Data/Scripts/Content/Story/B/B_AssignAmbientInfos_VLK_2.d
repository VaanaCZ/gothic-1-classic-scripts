// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_2_EXIT_Condition;
	information	= Info_Vlk_2_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Vlk_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_2_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_2_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_2_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Chcę do was dołączyć.";
};                       

FUNC INT Info_Vlk_2_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_2_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_2_EinerVonEuchWerden_15_00"); //Chcę do was dołączyć.
	AI_Output(self,other,"Info_Vlk_2_EinerVonEuchWerden_02_01"); //Nie bardzo wiem, czemu miałbyś chcieć na ochotnika pracować w kopalni. Ludzi takich jak ty spodziewałbym się raczej w zamkowej straży.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_2_WichtigePersonen_Condition;
	information	= Info_Vlk_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu rządzi?";
};                       

FUNC INT Info_Vlk_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_2_WichtigePersonen_15_00"); //Kto tu rządzi?
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_01"); //Fletcher, Bloodwyn i Szakal zbierają w Zewnętrznym Pierścieniu pieniądze za ochronę. Każdy z nich ma swój rewir.
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_02"); //Tak długo jak są po twojej stronie - jesteś bezpieczny.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_2_DasLager_Condition;
	information	= Info_Vlk_2_DasLager_Info;
	permanent	= 1;
	description = "Chciałbym dowiedzieć się więcej o waszym Obozie.";
};                       

FUNC INT Info_Vlk_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DasLager_15_00"); //Chciałbym dowiedzieć się czegoś więcej o waszym Obozie.
	AI_Output(self,other,"Info_Vlk_2_DasLager_02_01"); //Powinieneś pogadać z Cieniami. Oni będą mogli powiedzieć ci więcej niż ja. Tylko uważaj na siebie. Większości z nich nie można ufać do końca.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_2_DieLage_Condition;
	information	= Info_Vlk_2_DieLage_Info;
	permanent	= 1;
	description = "Jak wygląda życie tutaj?";
};                       

FUNC INT Info_Vlk_2_DieLage_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_00"); //Jak wygląda życie tutaj?
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_01"); //Jeśli przysłali cię Magnaci, powiedz im, że nie szukam kłopotów. Ode mnie nikt się niczego nie dowie.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_02"); //Wystarcza mi to, co nam dają.
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_03"); //Nikt mnie nie przysyła! Dopiero co tu przybyłem!
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_04"); //Żółtodziób, tak? Nowi zawsze pakują się w jakieś paskudne kłopoty. Nie chcę mieć z tobą nic wspólnego, jasne?
};	
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_2(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_2_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_2_DieLage.npc				= Hlp_GetInstanceID(slf);
};
