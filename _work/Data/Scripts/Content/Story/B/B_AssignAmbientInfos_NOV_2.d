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
	description = "KONEC";
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
	description = "Chci s k vám pøidat.";
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
	AI_Output(other,self,"Info_Nov_2_EinerVonEuchWerden_15_00"); //Chci s k vám pøidat.
	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_01"); //Opravdu jsi se rozhodl sloužit Spáèovi? Cesta ke štìstí a dobré vyhlídky ti leží pøímo u nohou.
	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_02"); //Jdi a promluv si s Corem Kalomem. Rozhodne, jaká práce pro tebe bude nejlepší.
	
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
	description = "Kdo je váš vùdce?";
};                       

FUNC INT Info_Nov_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_2_WichtigePersonen_15_00"); //Kdo je váš vùdce?
	AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_01"); //Y'Berion, Cor Kalom a Cor Angar jsou naši rádci.
	AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_02"); //Jsou naším spojením se Spáèem. Bìhem vzývání jsou jediní, kdo mají se Spáèem kontakt.
	
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
	description = "Co bych mìl o tomhle místì vìdìt?";
};                       

FUNC INT Info_Nov_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Nov_2_DasLager_15_00"); //Co bych mìl o tomhle místì vìdìt?
	AI_Output(self,other,"Info_Nov_2_DasLager_02_01"); //Toto je místo víry, bratøe. Nemáme toho mnoho, ale to co máme, sdílíme s každým, kdo je ochoten naslouchat Spáèovu uèení.
	AI_Output(self,other,"Info_Nov_2_DasLager_02_02"); //Promluv si s jedním z Guru a tvá duše bude povznesena.
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
	description = "Jak to jde?";
};                       

FUNC INT Info_Nov_2_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_2_DieLage_15_00"); //Jak to jde?
	AI_Output(self,other,"Info_Nov_2_DieLage_02_01"); //Nemám moc èasu. Musím pracovat.
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
