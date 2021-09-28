// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_3 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_3_EXIT_Condition;
	information	= Info_Vlk_3_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Vlk_3_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_3_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_3_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_3_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Jak se mùžu pøidat k táboru?";
};                       

FUNC INT Info_Vlk_3_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_3_EinerVonEuchWerden_15_00"); //Jak se mùžu pøidat k táboru?
	AI_Output(self,other,"Info_Vlk_3_EinerVonEuchWerden_03_01"); //Já jsem akorát kopáè, takže ti k tomu nemám co øíct. Mìl by sis promluvit se strážemi nebo se Stíny.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_3_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_3_WichtigePersonen_Condition;
	information	= Info_Vlk_3_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo je tady šéf?";
};                       

FUNC INT Info_Vlk_3_WichtigePersonen_Condition()
{	
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_3_WichtigePersonen_15_00"); //Kdo je tady šéf?
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_01"); //Gomez. Žije na hradì. Ale my kopáèi se máme poøádnì na pozoru pøed strážemi.
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_02"); //Nejlepší je, jít jim z cesty. Pokud tak neudìláš, máš malér.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_3_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_3_DasLager_Condition;
	information	= Info_Vlk_3_DasLager_Info;
	permanent	= 1;
	description = "Jaký jsou tady nejdùležitìjší místa?";
};                       

FUNC INT Info_Vlk_3_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_3_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DasLager_15_00"); //Jaký jsou tady nejdùležitìjší místa?
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_01"); //Jestli rád sázíš, musíš zajít veèer do arény. Jestli si chceš nìco koupit, zajdi na tržištì.
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_02"); //Prodávají tam prakticky všechno. Jestli chceš mapy, zajdi ke Grahamovi. Jeho chatrè je pøímo naproti hradní bránì.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_3_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_3_DieLage_Condition;
	information	= Info_Vlk_3_DieLage_Info;
	permanent	= 1;
	description = "Co se dìje?";
};                       

FUNC INT Info_Vlk_3_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DieLage_15_00"); //Co se dìje?
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_01"); //Brzy se dozvíš víc. Mìj se poøád na pozoru. Hlavnì v noci.
	AI_Output(self,other,"Info_Vlk_3_DieLage_03_02"); //Už jsem se celé dny poøádnì nevyspal. Jestli nemùžeš spát v kolonii, pak budeš mít dvakrát víc èasu!
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_3(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_3_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_3_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_3_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_3_DieLage.npc				= Hlp_GetInstanceID(slf);
};
