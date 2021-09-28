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
	description = "Chcia�bym zosta� stra�nikiem.";
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
	AI_Output(other,self,"Info_grd_13_EinerVonEuchWerden_15_00"); //Chcia�bym zosta� stra�nikiem.
	AI_Output(self,other,"Info_grd_13_EinerVonEuchWerden_13_01"); //Zatem d�uga droga przed tob�, ch�opcze!
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
	description = "Kto tu rz�dzi?";
};                       

FUNC INT Info_grd_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_grd_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_13_WichtigePersonen_15_00"); //Kto tu rz�dzi?
	AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_01"); //Ja. I dobrze ci radz�: uwa�aj na to, co m�wisz, ch�opcze!
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
	description = "Jak mog� si� dosta� do zamku?";
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
	AI_Output(other,self,"Info_grd_13_DasLager_15_00"); //Jak mog� si� dosta� do zamku?
	AI_Output(self,other,"Info_grd_13_DasLager_13_01"); //Nie mo�esz. Prawo wst�pu maj� tylko ludzie Gomeza.
	Info_ClearChoices(Info_grd_13_DasLager);
	Info_AddChoice(Info_grd_13_DasLager,"Rozumiem.", Info_grd_13_DasLager_Verstehe);
	Info_AddChoice(Info_grd_13_DasLager,"A gdybym tak... przekupi� stra�nik�w?", Info_grd_13_DasLager_WachenBestechen);
	Info_AddChoice(Info_grd_13_DasLager,"Co musz� zrobi�, �eby porozmawia� z Gomezem?", Info_grd_13_DasLager_GomezSprechen);
};

FUNC VOID Info_grd_13_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_grd_13_DasLager_Verstehe_15_00"); //Rozumiem.
	Info_ClearChoices(Info_grd_13_DasLager);
};

FUNC VOID Info_grd_13_DasLager_WachenBestechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_00"); //A gdybym tak... przekupi� stra�nik�w?
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_01"); //Masz tupet, ch�opcze! C�, my�l�, �e za odpowiedni� ilo�� rudy m�g�by� ich przekona� by przez chwil�... patrzyli w inn� stron�.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_02"); //Ale je�li Gomez dowie si�, �e kto� taki jak ty dosta� si� za mury, ka�e ich migiem wtr�ci� do lochu.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_03"); //A to oczywi�cie podnosi cen�...
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_04"); //Zreszt�, nawet gdyby� dosta� si� do �rodka, co by� tam robi�? Wszystkie budynki s� pilnie strze�one.
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_05"); //Tak tylko pytam...
};

FUNC VOID Info_grd_13_DasLager_GomezSprechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_GomezSprechen_15_00"); //Co musz� zrobi�, �eby porozmawia� z Gomezem?
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_01"); //Gomez nie zwraca uwagi na nowych. Musisz si� najpierw czym� wykaza�.
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_02"); //Je�li my�lisz o tym powa�nie, zamie� s�owo z Thorusem.

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
	AI_Output(self,other,"Info_grd_13_DieLage_13_01"); //Cisza i spok�j. Od czasu do czasu jaka� rozr�ba z Nowym Obozem albo paru �wir�w z Sekty, ot i wszystko!
	AI_Output(self,other,"Info_grd_13_DieLage_13_02"); //Tak d�ugo, jak jeste� tu nowy, to nie ma znaczenia. Ale jak ju� zdecydujesz, do kt�rego obozu chcesz nale�e�, utkwisz w tym po szyj�!
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
