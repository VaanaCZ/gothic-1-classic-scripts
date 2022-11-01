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
	description = "Chciałbym zostać strażnikiem.";
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
	AI_Output(other,self,"Info_grd_13_EinerVonEuchWerden_15_00"); //Chciałbym zostać strażnikiem.
	AI_Output(self,other,"Info_grd_13_EinerVonEuchWerden_13_01"); //Zatem długa droga przed tobą, chłopcze!
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
	description = "Kto tu rządzi?";
};                       

FUNC INT Info_grd_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_grd_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_13_WichtigePersonen_15_00"); //Kto tu rządzi?
	AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_01"); //Ja. I dobrze ci radzę: uważaj na to, co mówisz, chłopcze!
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
	description = "Jak mogę się dostać do zamku?";
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
	AI_Output(other,self,"Info_grd_13_DasLager_15_00"); //Jak mogę się dostać do zamku?
	AI_Output(self,other,"Info_grd_13_DasLager_13_01"); //Nie możesz. Prawo wstępu mają tylko ludzie Gomeza.
	Info_ClearChoices(Info_grd_13_DasLager);
	Info_AddChoice(Info_grd_13_DasLager,"Rozumiem.", Info_grd_13_DasLager_Verstehe);
	Info_AddChoice(Info_grd_13_DasLager,"A gdybym tak... przekupił strażników?", Info_grd_13_DasLager_WachenBestechen);
	Info_AddChoice(Info_grd_13_DasLager,"Co muszę zrobić, żeby porozmawiać z Gomezem?", Info_grd_13_DasLager_GomezSprechen);
};

FUNC VOID Info_grd_13_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_grd_13_DasLager_Verstehe_15_00"); //Rozumiem.
	Info_ClearChoices(Info_grd_13_DasLager);
};

FUNC VOID Info_grd_13_DasLager_WachenBestechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_00"); //A gdybym tak... przekupił strażników?
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_01"); //Masz tupet, chłopcze! Cóż, myślę, że za odpowiednią ilość rudy mógłbyś ich przekonać by przez chwilę... patrzyli w inną stronę.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_02"); //Ale jeśli Gomez dowie się, że ktoś taki jak ty dostał się za mury, każe ich migiem wtrącić do lochu.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_03"); //A to oczywiście podnosi cenę...
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_04"); //Zresztą, nawet gdybyś dostał się do środka, co byś tam robił? Wszystkie budynki są pilnie strzeżone.
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_05"); //Tak tylko pytam...
};

FUNC VOID Info_grd_13_DasLager_GomezSprechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_GomezSprechen_15_00"); //Co muszę zrobić, żeby porozmawiać z Gomezem?
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_01"); //Gomez nie zwraca uwagi na nowych. Musisz się najpierw czymś wykazać.
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_02"); //Jeśli myślisz o tym poważnie, zamień słowo z Thorusem.

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
	description = "Jak leci?";
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
	AI_Output(other,self,"Info_grd_13_DieLage_15_00"); //Jak leci?
	AI_Output(self,other,"Info_grd_13_DieLage_13_01"); //Cisza i spokój. Od czasu do czasu jakaś rozróba z Nowym Obozem albo paru świrów z Sekty, ot i wszystko!
	AI_Output(self,other,"Info_grd_13_DieLage_13_02"); //Tak długo, jak jesteś tu nowy, to nie ma znaczenia. Ale jak już zdecydujesz, do którego obozu chcesz należeć, utkwisz w tym po szyję!
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
