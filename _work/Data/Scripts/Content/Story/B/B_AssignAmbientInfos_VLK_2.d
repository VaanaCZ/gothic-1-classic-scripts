// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_2_EXIT_Condition;
	information	= Info_Vlk_2_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Vlk_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_2_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_2_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_2_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Chci s k vám pøidat.";
};                       

FUNC INT Info_Vlk_2_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_2_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_2_EinerVonEuchWerden_15_00"); //Chci se k vám pøidat.
	AI_Output(self,other,"Info_Vlk_2_EinerVonEuchWerden_02_01"); //Nechápu, proè bys chtìl dobrovolnì pracovat v dolech. Nìkdo jako ty mùže brzy žít na hradì.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_2_WichtigePersonen_Condition;
	information	= Info_Vlk_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo to tady vede?";
};                       

FUNC INT Info_Vlk_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_2_WichtigePersonen_15_00"); //Kdo tady má velení?
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_01"); //Tady na vnìjším kruhu vybírají Fletcher, Bloodwyn a Jackal peníze za ochranu. Každý má svùj obvod.
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_02"); //Když s nimi budeš zadobøe, nic se ti nestane.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_2_DasLager_Condition;
	information	= Info_Vlk_2_DasLager_Info;
	permanent	= 1;
	description = "Chci vìdìt o táboøe víc.";
};                       

FUNC INT Info_Vlk_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DasLager_15_00"); //Chci vìdìt o táboøe víc.
	AI_Output(self,other,"Info_Vlk_2_DasLager_02_01"); //Mìl by sis promluvit se Stíny. Øeknou ti, co potøebuješ vìdìt. Buï ale opatrný, vìtšinì z nich nelze dùvìøovat.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_2_DieLage_Condition;
	information	= Info_Vlk_2_DieLage_Info;
	permanent	= 1;
	description = "Jak se tady žije?";
};                       

FUNC INT Info_Vlk_2_DieLage_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_00"); //Jak se tady žije?
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_01"); //Pokud tì posílají Rudobaroni, vzkaž jim, že nechci žádné problémy. Ode mì nic neuslyšíš.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_02"); //S tím, co nám dávají, jsem spokojený.
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_03"); //Nikdo mì neposlal. Jsem tu nový.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_04"); //Nováèek, co? Nováèci se vždycky hned dostanou do problémù. Nechci s tím mít nic spoleèného, jasný?
};	
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_2(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_2_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_2_DieLage.npc				= Hlp_GetInstanceID(slf);
};
