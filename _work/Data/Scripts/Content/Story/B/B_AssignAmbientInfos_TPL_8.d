// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Tpl_8_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Tpl_8 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Tpl_8_EXIT_Condition;
	information	= Info_Tpl_8_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Tpl_8_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Tpl_8_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Tpl_8_EinerVonEuchWerden_Condition;
	information	= Info_Tpl_8_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Nie przydałby się wam dodatkowy człowiek?";
};                       

FUNC INT Info_Tpl_8_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) != GIL_TPL)
	&& (!C_NpcBelongsToNewCamp (other))
	&& (!C_NpcBelongsToOldCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Tpl_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Tpl_8_EinerVonEuchWerden_15_00"); //Nie przydałby się wam dodatkowy człowiek?
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_01"); //Zawsze chętnie przyjmujemy nowych ludzi, ale czeka cię jeszcze wiele pracy. Tylko najlepsi Nowicjusze mogą zostać Strażnikami Świątynnymi.
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_02"); //To najwyższe wyróżnienie, jakie może spotkać członka Bractwa Śniącego.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Tpl_8_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Tpl_8_WichtigePersonen_Condition;
	information	= Info_Tpl_8_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu dowodzi?";
};                       

FUNC INT Info_Tpl_8_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_8_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00"); //Kto tu dowodzi?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_01"); //Naszym świętym obowiązkiem jest wypełnianie poleceń Guru.
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_02"); //Kim są ci Guru?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_03"); //Najwyższym z Guru jest jaśnie oświecony Y'Berion. Oprócz niego są jeszcze Cor Kalom, Cor Angar oraz kilku innych.
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

INSTANCE Info_Tpl_8_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Tpl_8_DasLager_Condition;
	information	= Info_Tpl_8_DasLager_Info;
	permanent	= 1;
	description = "Co możesz mi powiedzieć o tym obozie?";
};                       

FUNC INT Info_Tpl_8_DasLager_Condition()
{	
	if (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};

FUNC VOID Info_Tpl_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Tpl_8_DasLager_15_00"); //Co możesz mi powiedzieć o tym obozie?
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_01"); //Chociaż jesteś tu nowy, możesz bezpiecznie poruszać się niemal po całym obozie. Wyjątkiem jest jedynie świątynia Śniącego.
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_02"); //Dlatego staraj się nie chadzać tam, gdzie ci nie wolno, oraz nie przeszkadzaj naszym mistrzom w medytacji.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Tpl_8_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Tpl_8_DieLage_Condition;
	information	= Info_Tpl_8_DieLage_Info;
	permanent	= 1;
	description = "Jak się masz?";
};                       

FUNC INT Info_Tpl_8_DieLage_Condition()
{	
	if (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};

FUNC VOID Info_Tpl_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Tpl_8_DieLage_15_00"); //Jak się masz?
	AI_Output(self,other,"Info_Tpl_8_DieLage_08_01"); //Ostrzegam cię! Okaż nieco więcej szacunku. Rozmawiasz z jednym z obrońców świętych proroków.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Tpl_8(var c_NPC slf)
{
	B_AssignFindNpc_ST(slf);
	
	Info_Tpl_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Tpl_8_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Tpl_8_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Tpl_8_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Tpl_8_DieLage.npc				= Hlp_GetInstanceID(slf);
};
