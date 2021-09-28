// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_1_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_1_EXIT_Condition;
	information	= Info_SFB_1_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_SFB_1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_1_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_1_EinerVonEuchWerden_Condition;
	information	= Info_SFB_1_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "W jaki sposób mogê do³¹czyæ do zwi¹zku Kretów?";
};                       

FUNC INT Info_SFB_1_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_1_EinerVonEuchWerden_15_00"); //W jaki sposób mogê do³¹czyæ do Kretów?
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_01"); //Do³¹czyæ do nas? Tylko sobie nie myœl, ¿e skoro nikt nas nie pilnuje, nie musimy tutaj harowaæ w pocie czo³a.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_02"); //Jeœli wyobra¿asz sobie, ¿e bêdziesz tu zbija³ b¹ki, to grubo siê mylisz, przyjacielu.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_03"); //No, ale jeœli wci¹¿ uwa¿asz, ¿e to praca w sam raz dla ciebie, porozmawiaj ze Swineyem. £atwo go poznasz - pali na okr¹g³o.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_1_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_1_WichtigePersonen_Condition;
	information	= Info_SFB_1_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu dowodzi?";
};                       

FUNC INT Info_SFB_1_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_1_WichtigePersonen_15_00"); //Kto tu dowodzi?
	AI_Output(self,other,"Info_SFB_1_WichtigePersonen_01_01"); //Kto dowodzi? Rozejrzyj siê! Na pewno nie ci, którzy tyraj¹ ca³y dzieñ przy zbieraniu rudy! Ha!
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_1_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_1_DasLager_Condition;
	information	= Info_SFB_1_DasLager_Info;
	permanent	= 1;
	description = "Co to jest?";
};                       

FUNC INT Info_SFB_1_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_1_DasLager_15_00"); //Co to jest?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_01"); //A na co ci to wygl¹da? Królewski pa³ac?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_02"); //Jeœli naprawdê chcesz pracowaæ w Wolnej Kopalni, musisz najpierw pokazaæ ludziom w Kotle, na co ciê staæ.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_1_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_1_DieLage_Condition;
	information	= Info_SFB_1_DieLage_Info;
	permanent	= 1;
	description = "Jak siê masz?";
};                       

FUNC INT Info_SFB_1_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_1_DieLage_15_00"); //Co s³ychaæ?
	AI_Output(self,other,"Info_SFB_1_DieLage_01_01"); //A jak myœlisz? Fatalnie, jak zwykle zreszt¹. Nic do jedzenia a mnóstwo do zrobienia! Psia maæ!
	AI_Output(self,other,"Info_SFB_1_DieLage_01_02"); //Jedyn¹ osob¹, która siê tu nie przepracowuje jest Swiney. Okyl awansowa³ go na oficjalnego przedstawiciela Kretów. Teraz facet krêci siê tu przez ca³y dzieñ, uwa¿aj¹c ¿eby nie pobrudziæ sobie r¹czek.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_1(var c_NPC slf)
{
	
	Info_SFB_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_1_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_1_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_1_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_1_DieLage.npc				= Hlp_GetInstanceID(slf);
};
