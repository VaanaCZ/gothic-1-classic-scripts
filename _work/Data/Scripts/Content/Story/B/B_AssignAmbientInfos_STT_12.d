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
	description = "KONEC";
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
	description = "Chtìl bych se dát ke Stínùm.";
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
	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_00"); //Chtìl bych se dát ke Stínùm.
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_01"); //Oh. Pak bys mìl vìdìt, že Gomez neodpouští chyby. Jestli chceš být jedním z nás, musíš být pøipravený jít za ním do ohnì!
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_02"); //Pøijal jen polovinu tìch, co to zkoušeli.
	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_03"); //Co se stalo s tìmi, kteøí neuspìli?
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_04"); //Nejspíš sedí v Novém táboøe a pøežvykují rýži. Hahaha.
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
	description = "Kdo je tady šéf?";
};                       

FUNC INT Info_Stt_12_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_12_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Stt_12_WichtigePersonen_15_00"); //Kdo je tady šéf?
	AI_Output(self,other,"Info_Stt_12_WichtigePersonen_12_01"); //Za hlavu Stínù se dá považovat Diego. Ale o tom, kdo se mùže setkat s Gomezem, rozhoduje Thorus.
	
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
	description = "Chci vìdìt, co tenhle tábor mùže nabídnout.";
};                       

FUNC INT Info_Stt_12_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_12_DasLager_Info()
{
	AI_Output(other,self,"Info_Stt_12_DasLager_15_00"); //Chci vìdìt, co tenhle tábor mùže nabídnout.
	AI_Output(self,other,"Info_Stt_12_DasLager_12_01"); //Pak se radìji zeptej kopáèù. Stejnì nemají celý den co na práci.
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
	description = "Jak to jde?";
};                       

FUNC INT Info_Stt_12_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_12_DieLage_Info()
{
	AI_Output(other,self,"Info_Stt_12_DieLage_15_00"); //Jak to jde?
	AI_Output(self,other,"Info_Stt_12_DieLage_12_01"); //Co chceš?
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
