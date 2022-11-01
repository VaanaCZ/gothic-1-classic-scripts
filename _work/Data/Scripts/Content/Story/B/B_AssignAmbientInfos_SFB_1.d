// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_1_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_1_EXIT_Condition;
	information	= Info_SFB_1_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_SFB_1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_1_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_1_EinerVonEuchWerden_Condition;
	information	= Info_SFB_1_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "W jaki sposób mogę dołączyć do związku Kretów?";
};                       

FUNC INT Info_SFB_1_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_1_EinerVonEuchWerden_15_00"); //W jaki sposób mogę dołączyć do Kretów?
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_01"); //Dołączyć do nas? Tylko sobie nie myśl, że skoro nikt nas nie pilnuje, nie musimy tutaj harować w pocie czoła.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_02"); //Jeśli wyobrażasz sobie, że będziesz tu zbijał bąki, to grubo się mylisz, przyjacielu.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_03"); //No, ale jeśli wciąż uważasz, że to praca w sam raz dla ciebie, porozmawiaj ze Swineyem. Łatwo go poznasz - pali na okrągło.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_1_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_1_WichtigePersonen_Condition;
	information	= Info_SFB_1_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu dowodzi?";
};                       

FUNC INT Info_SFB_1_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_1_WichtigePersonen_15_00"); //Kto tu dowodzi?
	AI_Output(self,other,"Info_SFB_1_WichtigePersonen_01_01"); //Kto dowodzi? Rozejrzyj się! Na pewno nie ci, którzy tyrają cały dzień przy zbieraniu rudy! Ha!
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_1_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_1_DasLager_Condition;
	information	= Info_SFB_1_DasLager_Info;
	permanent	= 1;
	description = "Co to jest?";
};                       

FUNC INT Info_SFB_1_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_1_DasLager_15_00"); //Co to jest?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_01"); //A na co ci to wygląda? Królewski pałac?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_02"); //Jeśli naprawdę chcesz pracować w Wolnej Kopalni, musisz najpierw pokazać ludziom w Kotle, na co cię stać.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_1_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_1_DieLage_Condition;
	information	= Info_SFB_1_DieLage_Info;
	permanent	= 1;
	description = "Jak się masz?";
};                       

FUNC INT Info_SFB_1_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_1_DieLage_15_00"); //Co słychać?
	AI_Output(self,other,"Info_SFB_1_DieLage_01_01"); //A jak myślisz? Fatalnie, jak zwykle zresztą. Nic do jedzenia a mnóstwo do zrobienia! Psia mać!
	AI_Output(self,other,"Info_SFB_1_DieLage_01_02"); //Jedyną osobą, która się tu nie przepracowuje jest Swiney. Okyl awansował go na oficjalnego przedstawiciela Kretów. Teraz facet kręci się tu przez cały dzień, uważając żeby nie pobrudzić sobie rączek.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_1(var c_NPC slf)
{
	
	Info_SFB_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_1_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_1_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_1_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_1_DieLage.npc				= Hlp_GetInstanceID(slf);
};
