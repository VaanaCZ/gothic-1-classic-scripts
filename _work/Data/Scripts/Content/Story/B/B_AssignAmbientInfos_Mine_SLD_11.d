// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Sld_11_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_Mine_Sld_11_EXIT_Condition;
	information	= Info_Mine_Sld_11_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Mine_Sld_11_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Mine_Sld_11_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Sld_11_EinerVonEuchWerden_Condition;
	information	= Info_Mine_Sld_11_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Jak mog� do was do��czy�?";
};                       

FUNC INT Info_Mine_Sld_11_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};	

FUNC VOID Info_Mine_Sld_11_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_EinerVonEuchWerden_15_00"); //Jak mog� do was do��czy�?
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_01"); //Je�li chcesz by� jednym z nas, musisz najpierw zas�u�y� na odpowiedni� reputacj�.
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_02"); //Id� i udowodnij, co potrafisz, a mo�e b�dziesz m�g� pracowa� w Kotle.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Sld_11_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Sld_11_WichtigePersonen_Condition;
	information	= Info_Mine_Sld_11_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu wydaje rozkazy?";
};                       

FUNC INT Info_Mine_Sld_11_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_WichtigePersonen_15_00"); //Kto tu wydaje rozkazy?
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_01"); //W Kotle rz�dzi Okyl. Ma kontakty ze wszystkimi szychami w Obozie.
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_02"); //A jak zaczniesz sprawia� k�opoty, zajm� si� tob� Magowie Wody z Nowego Obozu.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Mine_Sld_11_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Sld_11_DasLager_Condition;
	information	= Info_Mine_Sld_11_DasLager_Info;
	permanent	= 1;
	description = "Dzieje si� tu co� szczeg�lnie interesuj�cego?";
};                       

FUNC INT Info_Mine_Sld_11_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DasLager_15_00"); //Dzieje si� tu co� szczeg�lnie interesuj�cego?
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_01"); //Nic, ale jak spr�bujesz czego� g�upiego b�dziesz mia� powa�ne k�opoty.
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_02"); //Zw�aszcza, je�li spr�bujesz dosta� si� do kopalni albo str��wki bez pozwolenia.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Sld_11_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Sld_11_DieLage_Condition;
	information	= Info_Mine_Sld_11_DieLage_Info;
	permanent	= 1;
	description = "Co s�ycha�?";
};                       

FUNC INT Info_Mine_Sld_11_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_00"); //Co s�ycha�?
	AI_Output(self,other,"Info_Mine_Sld_11_DieLage_011_01"); //Na razie cicho. Za cicho jak na m�j gust.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Sld_11(var c_NPC slf)
{
	//B_AssignFindNpcInfos(slf);
	
	Info_Mine_Sld_11_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_DieLage.npc				= Hlp_GetInstanceID(slf);
};
