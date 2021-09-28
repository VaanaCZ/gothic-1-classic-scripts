// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Nov_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Nov_3 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Nov_3_EXIT_Condition;
	information	= Info_Nov_3_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Nov_3_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Nov_3_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Nov_3_EinerVonEuchWerden_Condition;
	information	= Info_Nov_3_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Jak mogê do was do³¹czyæ?";
};                       

FUNC INT Info_Nov_3_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Nov_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_3_EinerVonEuchWerden_15_00"); //Jak mogê do was do³¹czyæ?
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_01"); //To proste. Musisz siê po prostu otworzyæ.
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_02"); //Porozmawiaj z Guru, oni wska¿¹ ci drogê!
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Nov_3_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Nov_3_WichtigePersonen_Condition;
	information	= Info_Nov_3_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu rz¹dzi?";
};                       

FUNC INT Info_Nov_3_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_3_WichtigePersonen_15_00"); //Kto tu rz¹dzi?
	AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_01"); //Y'Berion! Chwa³a Œni¹cemu! To w³aœnie on sprowadzi³ nas do tego wspania³ego miejsca.
	AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_02"); //Wszystko tutaj powsta³o w rezultacie jego œwiêtych objawieñ.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Nov_3_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Nov_3_DasLager_Condition;
	information	= Info_Nov_3_DasLager_Info;
	permanent	= 1;
	description = "Jakie miejsca warto tu odwiedziæ?";
};                       

FUNC INT Info_Nov_3_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_3_DasLager_Info()
{
	AI_Output(other,self,"Info_Nov_3_DasLager_15_00"); //Jakie miejsca warto tu odwiedziæ?
	AI_Output(self,other,"Info_Nov_3_DasLager_03_01"); //Hmm... mo¿e Fortuno? On wydziela darmowe racje bagiennego ziela wszystkim cz³onkom Sekty.
	AI_Output(self,other,"Info_Nov_3_DasLager_03_02"); //Znajdziesz go pod laboratorium alchemicznym Cor Kaloma.
	
	var C_NPC CorKalom;		CorKalom= Hlp_GetNpc(Gur_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Nov_3_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Nov_3_DieLage_Condition;
	information	= Info_Nov_3_DieLage_Info;
	permanent	= 1;
	description = "Jak siê masz?";
};                       

FUNC INT Info_Nov_3_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_3_DieLage_15_00"); //Jak siê masz?
	AI_Output(self,other,"Info_Nov_3_DieLage_03_01"); //Znakomicie... fantastycznie... wspaniale...
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Nov_3(var c_NPC slf)
{
	B_AssignFindNpc_ST(slf);
	
	Info_Nov_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Nov_3_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Nov_3_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Nov_3_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Nov_3_DieLage.npc				= Hlp_GetInstanceID(slf);
};
