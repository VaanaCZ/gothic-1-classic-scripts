// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_3 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_3_EXIT_Condition;
	information	= Info_Vlk_3_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Vlk_3_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_3_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_3_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_3_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Co mam zrobić, żeby do was dołączyć?";
};                       

FUNC INT Info_Vlk_3_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_3_EinerVonEuchWerden_15_00"); //Co mam zrobić, żeby do was dołączyć?
	AI_Output(self,other,"Info_Vlk_3_EinerVonEuchWerden_03_01"); //Jestem zwykłym Kopaczem. Moje zdanie się nie liczy. Powinieneś porozmawiać ze Strażnikami, albo z Cieniami.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_3_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_3_WichtigePersonen_Condition;
	information	= Info_Vlk_3_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu rządzi?";
};                       

FUNC INT Info_Vlk_3_WichtigePersonen_Condition()
{	
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_3_WichtigePersonen_15_00"); //Kto tu rządzi?
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_01"); //Gomez. Mieszka w zamku. Ale my - Kopacze - mamy dość kłopotów z jego Strażnikami.
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_02"); //Lepiej trzymać się od nich z daleka. Jeśli wejdziesz im w drogę - masz kłopoty.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_3_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_3_DasLager_Condition;
	information	= Info_Vlk_3_DasLager_Info;
	permanent	= 1;
	description = "Co powinienem tutaj obejrzeć?";
};                       

FUNC INT Info_Vlk_3_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_3_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DasLager_15_00"); //Co warto tutaj obejrzeć?
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_01"); //Cóż, jeśli lubisz hazard, powinieneś zajrzeć wieczorem na arenę. Jeśli chcesz coś kupić, idź na targowisko.
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_02"); //Sprzedają tam prawie wszystko. Jeśli potrzebujesz mapy - porozmawiaj z Grahamem. Jego chata leży niemal dokładnie naprzeciw zamkowej bramy.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_3_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_3_DieLage_Condition;
	information	= Info_Vlk_3_DieLage_Info;
	permanent	= 1;
	description = "Co się dzieje?";
};                       

FUNC INT Info_Vlk_3_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DieLage_15_00"); //Co się dzieje?
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_01"); //Sam się dowiesz w swoim czasie. Miej oczy szeroko otwarte. Pilnuj się zwłaszcza w nocy.
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_02"); //Od kilku dni nie wyspałem się porządnie. A w tej kolonii kto nie śpi, ten pracuje na dwie zmiany!
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_3(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_3_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_3_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_3_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_3_DieLage.npc				= Hlp_GetInstanceID(slf);
};
