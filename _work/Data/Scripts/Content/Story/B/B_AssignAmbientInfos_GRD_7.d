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
	description = "Co mám udìlat proto, abych byl pøijat mezi Gomezovy stráže?";
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
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00"); //Co mám udìlat proto, abych byl pøijat mezi Gomezovy stráže?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01"); //Ty?! Jsi blázen. Myslíš, že si sem pøijdeš jen tak a budeš hned nahoøe, nebo co?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02"); //Gomez má mezi stráží jen ty nejlepší.
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03"); //Musíš tu pracovat jako každý jiný a prokázat svou oddanost jako Stín.
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
	description = "Kdo to tady vede?";
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
	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00"); //Kdo to tady vede?
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01"); //Thorus kontroluje všechno, co se dìje v táboøe. Diego je jeho pravá ruka.
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02"); //Pokud chceš kamkoliv jít, musíš to tìm hochùm øíci.
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
	description = "Pracují tady všichni pro Gomeze?";
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
	AI_Output(other,self,"Info_grd_7_DasLager_15_00"); //Pracují tady všichni pro Gomeze?
	AI_Output(self,other,"Info_grd_7_DasLager_07_01"); //Ne. Vìtšinou jsou to obyèejní kopáèi.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02"); //Jenom my, stráže a Stínové jsou s Gomezem.
	Info_ClearChoices(Info_grd_7_DasLager);
	Info_AddChoice(Info_grd_7_DasLager,"ZPÌT", Info_grd_7_DasLager_Zurueck);
	Info_AddChoice(Info_grd_7_DasLager,"Co stráže dìlají?", Info_grd_7_DasLager_Gardisten);
	Info_AddChoice(Info_grd_7_DasLager,"Co dìlají Stínové?", Info_grd_7_DasLager_Schatten);
	Info_AddChoice(Info_grd_7_DasLager,"Co dìlají kopáèi?", Info_grd_7_DasLager_Buddler);
};

FUNC VOID Info_grd_7_DasLager_ZURUECK()
{
	Info_ClearChoices(Info_grd_7_DasLager);
};

FUNC VOID Info_grd_7_DasLager_Gardisten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00"); //Co stráže dìlají?
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01"); //Støežíme tábor a chráníme kopáèe.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02"); //Od Gomeze dostáváme žold a kopáèi nám platí za ochranu. Je to dobrej džob.
};

FUNC VOID Info_grd_7_DasLager_Schatten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00"); //Co dìlají Stínové?
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01"); //Stínové dohlížejí na plnìní Gomezových pøíkazù.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02"); //Vìtšinou jsou to patolízalové, kteøí se pokoušejí propracovat nahoru. Pokud tu nìco chceš dokázat, je to jediná cesta.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03"); //Dìláš už svou práci dost dlouho tak dobøe, aby ses stal jedním z nás.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04"); //Jakmile budeš s Gomezem, mladej, už si tu na tebe nikdo nedovolí.
};

FUNC VOID Info_grd_7_DasLager_Buddler()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00"); //Co dìlají kopáèi?
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01"); //Dobrá otázka! Nemìli bysme ty umounìnce vùbec pouštìt z dolù ven!
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02"); //Když budou chvilku v dolech, pøijdou ven utratit svùj výdìlek.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03"); //Když všechno promrhají, vrátí se do dolù. Tak to tu dìlá vìtšina lidí.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04"); //Vypadá to, že máš na víc, než se ohánìt s krumpáèem. Mìl bys prohodit slovo s Thorusem, jestli se na to cítíš...
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
	description = "Jak to jde?";
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
	AI_Output(other,self,"Info_grd_7_DieLage_15_00"); //Jak to jde?
	AI_Output(self,other,"Info_grd_7_DieLage_07_01"); //Tak jak to vidíš? Dokud se nerozhodneš, do kterého tábora se dáš, nikdo tì nebude brát vážnì, mladej!
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
