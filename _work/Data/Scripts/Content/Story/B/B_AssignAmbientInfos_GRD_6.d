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
	description = "Nepotøebujete jednoho dobrého chlapa?";
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
	AI_Output(other,self,"Info_Grd_6_EinerVonEuchWerden_15_00"); //Nepotøebujete jednoho dobrého chlapa?
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_01"); //Ty musíš být jedním z tìch nových, co? Jestli se rozmýšlíš, ke kterému táboru se dát, zkus ty sektáøské blázny, tìm je fuk, koho zamìstnávají.
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_02"); //Nikoho nebereme, ale ty bys mohl jít kopat do Starého dolu!
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
	description = "Kdo to tady vede?";
};                       

FUNC INT Info_Grd_6_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Grd_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Grd_6_WichtigePersonen_15_00"); //Kdo to tady vede?
	AI_Output(self,other,"Info_Grd_6_WichtigePersonen_06_01"); //Thorus je jedním z tìch, kteøí hlídají, aby se nic neztratilo. Je dvojka hned po Gomezovi.
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
	description = "Jsem tady nový.";
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
	AI_Output(other,self,"Info_Grd_6_DasLager_15_00"); //Jsem tady nový.
	AI_Output(self,other,"Info_Grd_6_DasLager_06_01"); //Tak uvidíme.
	AI_Output(other,self,"Info_Grd_6_DasLager_15_02"); //Jak to jde?
	AI_Output(self,other,"Info_Grd_6_DasLager_06_03"); //Jestli tu budeš dìlat problémy, budeš potrestán.
	Info_ClearChoices(Info_Grd_6_DasLager);
	Info_AddChoice(Info_Grd_6_DasLager,"Aha...", Info_Grd_6_DasLager_Verstehe);
	Info_AddChoice(Info_Grd_6_DasLager,"Èemu øíkáš problémy?", Info_Grd_6_DasLager_WasIstAerger);
};

FUNC VOID Info_Grd_6_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_Verstehe_15_00"); //Já vím.
	Info_ClearChoices(Info_Grd_6_DasLager);
};

FUNC VOID Info_Grd_6_DasLager_WasIstAerger()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_00"); //Èemu øíkáš problémy?
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_01"); //Vìtšina kopáèù nám platí za ochranu.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_02"); //Pokud se nìkoho z nich dotkneš, vyøídíme si to s tebou.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_03"); //Jestli tì nachytám šmejdit kolem cizích chatrèí..
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); //Dobøe, dobøe. Dám si pozor.
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
	description = "Jak to jde?";
};                       

FUNC INT Info_Grd_6_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Grd_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Grd_6_DieLage_15_00"); //Jak to jde?
	AI_Output(self,other,"Info_Grd_6_DieLage_06_01"); //Øíkáš si o malér?
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
