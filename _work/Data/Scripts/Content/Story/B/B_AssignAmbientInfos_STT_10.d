// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Stt_10_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Stt_10 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Stt_10_EXIT_Condition;
	information	= Info_Stt_10_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Stt_10_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_10_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Stt_10_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Stt_10_EinerVonEuchWerden_Condition;
	information	= Info_Stt_10_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Chcia�bym zosta� Cieniem.";
};                       

FUNC INT Info_Stt_10_EinerVonEuchWerden_Condition()
{
	 if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Stt_10_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_15_00"); //Chcia�bym zosta� Cieniem.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_10_01"); //Czy�by? Rozmawia�e� ju� z Diego?
	
	var C_NPC Diego;		Diego 	= Hlp_GetNpc(PC_Thief);
	Diego.aivar[AIV_FINDABLE] = TRUE;
	
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden,"Nie.", Info_Stt_10_EinerVonEuchWerden_Nein);
	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden,"Tak.", Info_Stt_10_EinerVonEuchWerden_Ja);
};

FUNC VOID Info_Stt_10_EinerVonEuchWerden_Nein()
{
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Nein_15_00"); //Jeszcze nie.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Nein_10_01"); //Wi�c zr�b to czym pr�dzej. Znajdziesz go przy wej�ciu do zamku.
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
};

FUNC VOID Info_Stt_10_EinerVonEuchWerden_Ja()
{
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Ja_15_00"); //Tak, rozmawia�em.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Ja_10_01"); //To �wietnie. S�uchaj go we wszystkim. Mi to nie zaszkodzi�o... w ka�dym razie - powa�nie.
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Stt_10_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Stt_10_WichtigePersonen_Condition;
	information	= Info_Stt_10_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kogo warto tutaj pozna�?";
};                       

FUNC INT Info_Stt_10_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_10_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Stt_10_WichtigePersonen_15_00"); //Kogo warto tutaj pozna�?
	AI_Output(self,other,"Info_Stt_10_WichtigePersonen_10_01"); //Jak podpadniesz stra�nikom, porozmawiaj z Gravo. Znajdziesz go na k�pielisku, obok bramy do zamku. On zajmuje si� lud�mi, kt�rzy wpl�tali si� w k�opoty. Zw�aszcza nowym zdarza si� to niezwykle cz�sto.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Stt_10_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Stt_10_DasLager_Condition;
	information	= Info_Stt_10_DasLager_Info;
	permanent	= 1;
	description = "Co mo�esz mi powiedzie� o Obozie?";
};                       

FUNC INT Info_Stt_10_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_10_DasLager_Info()
{
	AI_Output(other,self,"Info_Stt_10_DasLager_15_00"); //Co mo�esz mi powiedzie� o Obozie?
	AI_Output(self,other,"Info_Stt_10_DasLager_10_01"); //Chyba najciekawsz� cz�ci� Starego Obozu jest targowisko. Je�li chcesz co� kupi�, wal tam jak w dym.
	AI_Output(self,other,"Info_Stt_10_DasLager_10_02"); //Znajdziesz je pod tym wielkim zadaszeniem, w po�udniowej cz�ci Zewn�trznego Pier�cienia.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Stt_10_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Stt_10_DieLage_Condition;
	information	= Info_Stt_10_DieLage_Info;
	permanent	= 1;
	description = "Cze��!";
};                       

FUNC INT Info_Stt_10_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_10_DieLage_Info()
{
	AI_Output(other,self,"Info_Stt_10_DieLage_15_00"); //Cze��!
	AI_Output(self,other,"Info_Stt_10_DieLage_10_01"); //Czego chcesz? 
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Stt_10(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Stt_10_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_Stt_10_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Stt_10_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_Stt_10_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_Stt_10_DieLage.npc				= Hlp_GetInstanceID(slf);
};
