// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_grd_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_grd_7_EXIT_Condition;
	information	= Info_grd_7_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_grd_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_grd_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_grd_7_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_7_EinerVonEuchWerden_Condition;
	information	= Info_grd_7_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Co mam zrobić, żeby zostać jednym ze strażników Gomeza?";
};                       

FUNC INT Info_grd_7_EinerVonEuchWerden_Condition()
{
	if	(Npc_GetTrueGuild(other) != GIL_GRD)
	&&	(Npc_GetTrueGuild(other) != GIL_KDF)
	&&  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_grd_7_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00"); //Co mam zrobić, żeby zostać jednym ze strażników Gomeza?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01"); //Ty?! Chyba żartujesz. Myślisz, że możesz tu przyjść i tak od razu dostać się na sam szczyt?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02"); //Strażnicy Gomeza to najlepsi z najlepszych.
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03"); //Będziesz musiał powoli piąć się do góry, i udowodnić swoją lojalność jako Cień.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_grd_7_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_7_WichtigePersonen_Condition;
	information	= Info_grd_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu rządzi?";
};                       

FUNC INT Info_grd_7_WichtigePersonen_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00"); //Kto tu rządzi?
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01"); //Thorus trzyma rękę na pulsie. Diego jest jego porucznikiem.
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02"); //Jeśli naprawdę chcesz do czegoś dojść, powinieneś porozmawiać właśnie z nimi.
	var C_NPC Diego;		Diego 	= Hlp_GetNpc(PC_Thief);
	Diego.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_grd_7_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_7_DasLager_Condition;
	information	= Info_grd_7_DasLager_Info;
	permanent	= 1;
	description = "Wszyscy tutaj pracują dla Gomeza?";
};                       

FUNC INT Info_grd_7_DasLager_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_7_DasLager_15_00"); //Wszyscy tutaj pracują dla Gomeza?
	AI_Output(self,other,"Info_grd_7_DasLager_07_01"); //Nie. Większość z tych ludzi to zwykli Kopacze.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02"); //Dla Gomeza pracują tylko Cienie... No i my - Strażnicy.
	Info_ClearChoices(Info_grd_7_DasLager);
	Info_AddChoice(Info_grd_7_DasLager,"WSTECZ", Info_grd_7_DasLager_Zurueck);
	Info_AddChoice(Info_grd_7_DasLager,"Czym się zajmują strażnicy?", Info_grd_7_DasLager_Gardisten);
	Info_AddChoice(Info_grd_7_DasLager,"Jaką funkcję pełnią Cienie?", Info_grd_7_DasLager_Schatten);
	Info_AddChoice(Info_grd_7_DasLager,"Co robią Kopacze?", Info_grd_7_DasLager_Buddler);
};

FUNC VOID Info_grd_7_DasLager_ZURUECK()
{
	Info_ClearChoices(Info_grd_7_DasLager);
};

FUNC VOID Info_grd_7_DasLager_Gardisten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00"); //Czym się zajmują Strażnicy?
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01"); //Pilnujemy porządku w Obozie i dbamy o bezpieczeństwo Kopaczy.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02"); //Gomez wypłaca nam żołd. Dodatkowo, Kopacze płacą za ochronę. To całkiem lukratywne zajęcie!
};

FUNC VOID Info_grd_7_DasLager_Schatten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00"); //Jaką funkcję pełnią Cienie?
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01"); //Cienie dbają o to, żeby ludzie wypełniali polecenia Gomeza.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02"); //Większość z nich to zwykłe lizusy, próbujące piąć się do góry. Jeśli chcesz dojść do czegoś w tej kolonii, powinieneś zacząć jako Cień.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03"); //Jak odsłużysz swoje bez żadnej wpadki, kto wie? Może zostaniesz jednym z nas.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04"); //Jak już będziesz u Gomeza, nikt z kolonii nie będzie ci uprzykrzał życia.
};

FUNC VOID Info_grd_7_DasLager_Buddler()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00"); //Co robią Kopacze?
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01"); //Dobre pytanie! Te krety nie powinny być nigdy wypuszczane z kopalni.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02"); //Po jakimś czasie spędzonym pod ziemią, Kopacze wychodzą na górę, żeby przepuścić swój urobek.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03"); //Jak już wszystko wydadzą - wracają do kopalni. I tak przez całe życie.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04"); //Wyglądasz mi na kogoś stworzonego do czegoś więcej niż machanie kilofem. Pogadaj z Thorusem, jeśli jeszcze tego nie zrobiłeś.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_grd_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_7_DieLage_Condition;
	information	= Info_grd_7_DieLage_Info;
	permanent	= 1;
	description = "Co słychać?";
};                       

FUNC INT Info_grd_7_DieLage_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_7_DieLage_15_00"); //Co słychać?
	AI_Output(self,other,"Info_grd_7_DieLage_07_01"); //O tobie? Nic. Dopóki nie dołączysz do któregoś z obozów, ludzie będą cię ignorowali, chłopcze.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_grd_7(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_grd_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_grd_7_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_grd_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_grd_7_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_grd_7_DieLage.npc				= Hlp_GetInstanceID(slf);
};
