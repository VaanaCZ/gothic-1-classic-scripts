// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_grd_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_grd_13_EXIT_Condition;
	information	= Info_grd_13_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_grd_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_grd_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_grd_13_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_13_EinerVonEuchWerden_Condition;
	information	= Info_grd_13_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Chci se stát strážcem.";
};                       

FUNC INT Info_grd_13_EinerVonEuchWerden_Condition()
{
	if	(Npc_GetTrueGuild(other) != GIL_GRD)
	&&	(Npc_GetTrueGuild(other) != GIL_KDF)
	&&  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_grd_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_13_EinerVonEuchWerden_15_00"); //Chci se stát strážcem.
	AI_Output(self,other,"Info_grd_13_EinerVonEuchWerden_13_01"); //Pak pøed sebou budeš mít dlouhou cestu, chlapèe.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_grd_13_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_13_WichtigePersonen_Condition;
	information	= Info_grd_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo to tady vede?";
};                       

FUNC INT Info_grd_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_grd_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_13_WichtigePersonen_15_00"); //Kdo to tady vede?
	AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_01"); //Já tu dohlížím. A øíkám ti: mìl bys dávat, hochu, pozor na to, co øíkáš!
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_grd_13_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_13_DasLager_Condition;
	information	= Info_grd_13_DasLager_Info;
	permanent	= 1;
	description = "Jak se dostanu na hrad?";
};                       

FUNC INT Info_grd_13_DasLager_Condition()
{
	if (Kapitel == 1) 
	{
	return 1;
	};
};

FUNC VOID Info_grd_13_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_13_DasLager_15_00"); //Jak se dostanu na hrad?
	AI_Output(self,other,"Info_grd_13_DasLager_13_01"); //Nedostaneš. Tam smí jen Gomezovi lidé.
	Info_ClearChoices(Info_grd_13_DasLager);
	Info_AddChoice(Info_grd_13_DasLager,"Aha...", Info_grd_13_DasLager_Verstehe);
	Info_AddChoice(Info_grd_13_DasLager,"Co kdybych podplatil stráže?", Info_grd_13_DasLager_WachenBestechen);
	Info_AddChoice(Info_grd_13_DasLager,"Jak bych si mohl promluvit s Gomezem?", Info_grd_13_DasLager_GomezSprechen);
};

FUNC VOID Info_grd_13_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_grd_13_DasLager_Verstehe_15_00"); //Aha...
	Info_ClearChoices(Info_grd_13_DasLager);
};

FUNC VOID Info_grd_13_DasLager_WachenBestechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_00"); //Co kdybych podplatil stráže?
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_01"); //Máš ale nervy, mladej. Jediné, jak bys je mohl pøesvìdèit, aby se na minutku dívali jinam, je pøinést jim nìco rudy.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_02"); //Jak se ale Gomez dozví, že nechali takové èerstvé maso napochodovat do jeho zámku, uvrhne je do vìzení.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_03"); //Jistì, takovýhle risk je ale nutný.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_04"); //Ale i když se dostaneš dovnitø, co tam budeš dìlat? Všechny budovy jsou pøísnì støežené.
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_05"); //Byl jsem zvìdavý, to je vše.
};

FUNC VOID Info_grd_13_DasLager_GomezSprechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_GomezSprechen_15_00"); //Jak bych si mohl promluvit s Gomezem?
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_01"); //Gomeze nezajímají nováèci, kteøí neprokázali své schopnosti.
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_02"); //Jestli to myslíš vážnì, promluv si s Thorusem.

	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_grd_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_13_DieLage_Condition;
	information	= Info_grd_13_DieLage_Info;
	permanent	= 1;
	description = "Jak to jde?";
};                       

FUNC INT Info_grd_13_DieLage_Condition()
{	
	if  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_grd_13_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_13_DieLage_15_00"); //Jak to jde?
	AI_Output(self,other,"Info_grd_13_DieLage_13_01"); //Je klid. Obèas nìjaký problém s Novým táborem nebo pár sektáøskými blázny.
	AI_Output(self,other,"Info_grd_13_DieLage_13_02"); //Pokud jsi nový, všechno je jedno. Jakmile se ale rozhodneš, ke kterému táboru se dáš, pak jsi v tom jako my všichni.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_grd_13(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_grd_13_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_grd_13_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_grd_13_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_grd_13_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_grd_13_DieLage.npc				= Hlp_GetInstanceID(slf);
};
