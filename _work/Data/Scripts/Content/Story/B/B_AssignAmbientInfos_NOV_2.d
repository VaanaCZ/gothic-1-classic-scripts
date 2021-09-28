// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Nov_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Nov_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Nov_2_EXIT_Condition;
	information	= Info_Nov_2_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Nov_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Nov_2_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Nov_2_EinerVonEuchWerden_Condition;
	information	= Info_Nov_2_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Chcê do was do³¹czyæ.";
};                       

FUNC INT Info_Nov_2_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Nov_2_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_2_EinerVonEuchWerden_15_00"); //Chcê do was do³¹czyæ.
	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_01"); //Chcesz powiedzieæ, ¿e postanowi³eœ s³u¿yæ Œni¹cemu? Otwiera siê przed tob¹ droga wiecznej szczêœliwoœci!
	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_02"); //IdŸ! Porozmawiaj z Cor Kalomem. On oceni, w jakich zadaniach najlepiej siê sprawdzisz.
	
	var C_NPC CorKalom;		CorKalom= Hlp_GetNpc(Gur_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Nov_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Nov_2_WichtigePersonen_Condition;
	information	= Info_Nov_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto wami dowodzi?";
};                       

FUNC INT Info_Nov_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_2_WichtigePersonen_15_00"); //Kto wami dowodzi?
	AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_01"); //Y'Berion, Cor Kalom i Cor Agnar s¹ naszymi duchowymi przywódcami.
	AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_02"); //Dziêki nim mo¿emy nawi¹zywaæ kontakt ze Œni¹cym. W trakcie inwokacji to w³aœnie oni staj¹ przed jego obliczem.
	
	var C_NPC YBerion;		YBerion	= Hlp_GetNpc(Gur_1200_Yberion);
	var C_NPC CorKalom;		CorKalom= Hlp_GetNpc(Gur_1201_CorKalom);
	var C_NPC CorAngar;		CorAngar= Hlp_GetNpc(Gur_1202_CorAngar);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
	CorAngar.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Nov_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Nov_2_DasLager_Condition;
	information	= Info_Nov_2_DasLager_Info;
	permanent	= 1;
	description = "Co powinienem wiedzieæ o tym miejscu?";
};                       

FUNC INT Info_Nov_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Nov_2_DasLager_15_00"); //Co powinienem wiedzieæ o tym miejscu?
	AI_Output(self,other,"Info_Nov_2_DasLager_02_01"); //To miejsce wiary, bracie. Nie posiadamy wiele, ale chêtnie dzielimy siê ze wszystkimi, którzy chc¹ s³uchaæ nauk Œni¹cego.
	AI_Output(self,other,"Info_Nov_2_DasLager_02_02"); //Porozmawiaj z którymœ z Guru. Niech jego s³owa wzbogac¹ twoj¹ duszê.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Nov_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Nov_2_DieLage_Condition;
	information	= Info_Nov_2_DieLage_Info;
	permanent	= 1;
	description = "Co s³ychaæ?";
};                       

FUNC INT Info_Nov_2_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_2_DieLage_15_00"); //Co s³ychaæ?
	AI_Output(self,other,"Info_Nov_2_DieLage_02_01"); //Nie mam czasu. Mam jeszcze mnóstwo pracy.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Nov_2(var c_NPC slf)
{
	B_AssignFindNpc_ST(slf);
	
	Info_Nov_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Nov_2_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Nov_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Nov_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Nov_2_DieLage.npc				= Hlp_GetInstanceID(slf);
};
