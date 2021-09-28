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
	description = "Jak mogê do was do³¹czyæ?";
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
	AI_Output(other,self,"Info_Mine_Sld_11_EinerVonEuchWerden_15_00"); //Jak mogê do was do³¹czyæ?
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_01"); //Jeœli chcesz byæ jednym z nas, musisz najpierw zas³u¿yæ na odpowiedni¹ reputacjê.
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_02"); //IdŸ i udowodnij, co potrafisz, a mo¿e bêdziesz móg³ pracowaæ w Kotle.
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
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_01"); //W Kotle rz¹dzi Okyl. Ma kontakty ze wszystkimi szychami w Obozie.
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_02"); //A jak zaczniesz sprawiaæ k³opoty, zajm¹ siê tob¹ Magowie Wody z Nowego Obozu.
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
	description = "Dzieje siê tu coœ szczególnie interesuj¹cego?";
};                       

FUNC INT Info_Mine_Sld_11_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DasLager_15_00"); //Dzieje siê tu coœ szczególnie interesuj¹cego?
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_01"); //Nic, ale jak spróbujesz czegoœ g³upiego bêdziesz mia³ powa¿ne k³opoty.
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_02"); //Zw³aszcza, jeœli spróbujesz dostaæ siê do kopalni albo stró¿ówki bez pozwolenia.
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
	description = "Co s³ychaæ?";
};                       

FUNC INT Info_Mine_Sld_11_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_00"); //Co s³ychaæ?
	AI_Output(self,other,"Info_Mine_Sld_11_DieLage_011_01"); //Na razie cicho. Za cicho jak na mój gust.
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
