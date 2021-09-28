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
	description = "Co m�m ud�lat proto, abych byl p�ijat mezi Gomezovy str�e?";
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
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00"); //Co m�m ud�lat proto, abych byl p�ijat mezi Gomezovy str�e?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01"); //Ty?! Jsi bl�zen. Mysl�, �e si sem p�ijde� jen tak a bude� hned naho�e, nebo co?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02"); //Gomez m� mezi str�� jen ty nejlep��.
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03"); //Mus� tu pracovat jako ka�d� jin� a prok�zat svou oddanost jako St�n.
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
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01"); //Thorus kontroluje v�echno, co se d�je v t�bo�e. Diego je jeho prav� ruka.
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02"); //Pokud chce� kamkoliv j�t, mus� to t�m hoch�m ��ci.
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
	description = "Pracuj� tady v�ichni pro Gomeze?";
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
	AI_Output(other,self,"Info_grd_7_DasLager_15_00"); //Pracuj� tady v�ichni pro Gomeze?
	AI_Output(self,other,"Info_grd_7_DasLager_07_01"); //Ne. V�t�inou jsou to oby�ejn� kop��i.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02"); //Jenom my, str�e a St�nov� jsou s Gomezem.
	Info_ClearChoices(Info_grd_7_DasLager);
	Info_AddChoice(Info_grd_7_DasLager,"ZP�T", Info_grd_7_DasLager_Zurueck);
	Info_AddChoice(Info_grd_7_DasLager,"Co str�e d�laj�?", Info_grd_7_DasLager_Gardisten);
	Info_AddChoice(Info_grd_7_DasLager,"Co d�laj� St�nov�?", Info_grd_7_DasLager_Schatten);
	Info_AddChoice(Info_grd_7_DasLager,"Co d�laj� kop��i?", Info_grd_7_DasLager_Buddler);
};

FUNC VOID Info_grd_7_DasLager_ZURUECK()
{
	Info_ClearChoices(Info_grd_7_DasLager);
};

FUNC VOID Info_grd_7_DasLager_Gardisten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00"); //Co str�e d�laj�?
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01"); //St�e��me t�bor a chr�n�me kop��e.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02"); //Od Gomeze dost�v�me �old a kop��i n�m plat� za ochranu. Je to dobrej d�ob.
};

FUNC VOID Info_grd_7_DasLager_Schatten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00"); //Co d�laj� St�nov�?
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01"); //St�nov� dohl�ej� na pln�n� Gomezov�ch p��kaz�.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02"); //V�t�inou jsou to patol�zalov�, kte�� se pokou�ej� propracovat nahoru. Pokud tu n�co chce� dok�zat, je to jedin� cesta.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03"); //D�l� u� svou pr�ci dost dlouho tak dob�e, aby ses stal jedn�m z n�s.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04"); //Jakmile bude� s Gomezem, mladej, u� si tu na tebe nikdo nedovol�.
};

FUNC VOID Info_grd_7_DasLager_Buddler()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00"); //Co d�laj� kop��i?
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01"); //Dobr� ot�zka! Nem�li bysme ty umoun�nce v�bec pou�t�t z dol� ven!
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02"); //Kdy� budou chvilku v dolech, p�ijdou ven utratit sv�j v�d�lek.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03"); //Kdy� v�echno promrhaj�, vr�t� se do dol�. Tak to tu d�l� v�t�ina lid�.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04"); //Vypad� to, �e m� na v�c, ne� se oh�n�t s krump��em. M�l bys prohodit slovo s Thorusem, jestli se na to c�t�...
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
	AI_Output(self,other,"Info_grd_7_DieLage_07_01"); //Tak jak to vid�? Dokud se nerozhodne�, do kter�ho t�bora se d�, nikdo t� nebude br�t v�n�, mladej!
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
