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
	description = "KONIEC";
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
	description = "Chciałbym przyłączyć się do Cieni.";
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
	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_00"); //Chciałbym przyłączyć się do Cieni.
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_01"); //Och. W takim razie powinieneś wiedzieć, że Gomez nie toleruje błędów. Jeśli chcesz zostać jednym z nas, musisz być gotów pójść za nim choćby w ogień.
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_02"); //Tylko niecała połowa z tych, którzy próbowali, została przyjęta.
	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_03"); //A co się stało z resztą?
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_04"); //Pewnie siedzą w Nowym Obozie i pałaszują ryż. He he he.
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
	description = "Kto tu rządzi?";
};                       

FUNC INT Info_Stt_12_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_12_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Stt_12_WichtigePersonen_15_00"); //Kto tu rządzi?
	AI_Output(self,other,"Info_Stt_12_WichtigePersonen_12_01"); //Diego jest... jakby to powiedzieć - szefem Cieni, ale to Thorus decyduje, kto może się spotkać z Gomezem.
	
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
	description = "Chciałbym wiedzieć, co ten obóz ma do zaoferowania.";
};                       

FUNC INT Info_Stt_12_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_12_DasLager_Info()
{
	AI_Output(other,self,"Info_Stt_12_DasLager_15_00"); //Chciałbym wiedzieć, co ten obóz ma do zaoferowania.
	AI_Output(self,other,"Info_Stt_12_DasLager_12_01"); //O to najlepiej zapytać Kopaczy. Oni i tak nie mają nic do roboty.
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
	description = "Cześć. Jak leci?";
};                       

FUNC INT Info_Stt_12_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_12_DieLage_Info()
{
	AI_Output(other,self,"Info_Stt_12_DieLage_15_00"); //Cześć. Jak leci?
	AI_Output(self,other,"Info_Stt_12_DieLage_12_01"); //Czego chcesz?
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
