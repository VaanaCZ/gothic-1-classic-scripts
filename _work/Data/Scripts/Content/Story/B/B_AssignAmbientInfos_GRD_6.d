// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Grd_6_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Grd_6 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Grd_6_EXIT_Condition;
	information	= Info_Grd_6_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Grd_6_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Grd_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Grd_6_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Grd_6_EinerVonEuchWerden_Condition;
	information	= Info_Grd_6_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Nie przyda³by siê wam dodatkowy cz³owiek?";
};                       

FUNC INT Info_Grd_6_EinerVonEuchWerden_Condition()
{
	if	(Npc_GetTrueGuild(other) != GIL_GRD)
	&&	(Npc_GetTrueGuild(other) != GIL_KDF)
	&&  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Grd_6_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Grd_6_EinerVonEuchWerden_15_00"); //Nie przyda³by siê wam dodatkowy cz³owiek?
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_01"); //Jesteœ tu nowy, co? Jeœli chcesz szybko do³¹czyæ do jakiegoœ Obozu, spróbuj u tych œwirów z sekty. Nie s¹ zbyt wybredni, jeœli chodzi o nowych cz³onków.
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_02"); //Nie przyjmujemy byle kogo. No, chyba ¿e chcesz pracowaæ w Starej Kopalni!
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Grd_6_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_Grd_6_WichtigePersonen_Condition;
	information	= Info_Grd_6_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu rz¹dzi?";
};                       

FUNC INT Info_Grd_6_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Grd_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Grd_6_WichtigePersonen_15_00"); //Kto tu rz¹dzi?
	AI_Output(self,other,"Info_Grd_6_WichtigePersonen_06_01"); //Thorus dba tu o wzglêdny porz¹dek. Nad nim jest ju¿ tylko Gomez.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Grd_6_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_Grd_6_DasLager_Condition;
	information	= Info_Grd_6_DasLager_Info;
	permanent	= 1;
	description = "Jestem tu nowy. Co s³ychaæ?";
};                       

FUNC INT Info_Grd_6_DasLager_Condition()
{	
	if (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToNewCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_Grd_6_DasLager_Info()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_15_00"); //Jestem tu nowy.
	AI_Output(self,other,"Info_Grd_6_DasLager_06_01"); //W³aœnie widzê.
	AI_Output(other,self,"Info_Grd_6_DasLager_15_02"); //Co s³ychaæ?
	AI_Output(self,other,"Info_Grd_6_DasLager_06_03"); //Jak bêdziesz sprawia³ k³opoty, dostaniesz w ucho.
	Info_ClearChoices(Info_Grd_6_DasLager);
	Info_AddChoice(Info_Grd_6_DasLager,"Rozumiem.", Info_Grd_6_DasLager_Verstehe);
	Info_AddChoice(Info_Grd_6_DasLager,"Co masz na myœli mówi¹c 'k³opoty'?", Info_Grd_6_DasLager_WasIstAerger);
};

FUNC VOID Info_Grd_6_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_Verstehe_15_00"); //Rozumiem.
	Info_ClearChoices(Info_Grd_6_DasLager);
};

FUNC VOID Info_Grd_6_DasLager_WasIstAerger()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_00"); //Co masz na myœli mówi¹c "k³opoty"?
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_01"); //Wiêkszoœæ Kopaczy p³aci nam za ochronê.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_02"); //Jak zaczepisz któregoœ z nich, bêdziesz mia³ do czynienia z nami.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_03"); //Jeœli z³apiê ciê na grzebaniu w cudzych chatach...
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); //Dobrze, dobrze. Zrozumia³em aluzjê.
	Info_ClearChoices(Info_Grd_6_DasLager);
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Grd_6_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Grd_6_DieLage_Condition;
	information	= Info_Grd_6_DieLage_Info;
	permanent	= 1;
	description = "Jak leci?";
};                       

FUNC INT Info_Grd_6_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Grd_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Grd_6_DieLage_15_00"); //Jak leci?
	AI_Output(self,other,"Info_Grd_6_DieLage_06_01"); //Szukasz k³opotów?
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_GRD_6(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Grd_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Grd_6_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Grd_6_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Grd_6_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Grd_6_DieLage.npc				= Hlp_GetInstanceID(slf);
};
