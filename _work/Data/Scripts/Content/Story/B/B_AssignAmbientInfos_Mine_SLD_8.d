// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Sld_8_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_Mine_Sld_8_EXIT_Condition;
	information	= Info_Mine_Sld_8_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Mine_Sld_8_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Mine_Sld_8_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Sld_8_EinerVonEuchWerden_Condition;
	information	= Info_Mine_Sld_8_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Co mam zrobiæ, ¿eby do was do³¹czyæ?";
};                       

FUNC INT Info_Mine_Sld_8_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mine_Sld_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_EinerVonEuchWerden_15_00"); //Co mam zrobiæ, ¿eby do was do³¹czyæ?
	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_01"); //Jeœli chcesz pracowaæ w Kotle musisz najpierw wyrobiæ sobie znajomoœci w Nowym Obozie.
	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_02"); //Po prostu idŸ tam i pogadaj z ludŸmi.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Sld_8_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Sld_8_WichtigePersonen_Condition;
	information	= Info_Mine_Sld_8_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu rz¹dzi?";
};                       

FUNC INT Info_Mine_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_8_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_WichtigePersonen_15_00"); //Kto tu rz¹dzi?
	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_01"); //Okyl rozkazuje w Kotle, Lee rz¹dzi w Obozie.
	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_02"); //Najlepiej porozmawiaj z obydwoma.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Mine_Sld_8_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Sld_8_DasLager_Condition;
	information	= Info_Mine_Sld_8_DasLager_Info;
	permanent	= 1;
	description = "Co s³ychaæ w obozie?";
};                       

FUNC INT Info_Mine_Sld_8_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_15_00"); //Co s³ychaæ w obozie?
	AI_Output(self,other,"Info_Mine_Sld_8_DasLager_08_01"); //Pilnujemy wejœcia do kopalni.
	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_08_02"); //Tylko nasi ludzie mog¹ wejœæ do œrodka.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Sld_8_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Sld_8_DieLage_Condition;
	information	= Info_Mine_Sld_8_DieLage_Info;
	permanent	= 1;
	description = "Wszystko w porz¹dku?";
};                       

FUNC INT Info_Mine_Sld_8_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_DieLage_15_00"); //Wszystko w porz¹dku?
	AI_Output(self,other,"Info_Mine_Sld_8_DieLage_08_01"); //Co siê g³upio pytasz? Wszystko pod kontrol¹.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Sld_8(var c_NPC slf)
{
	//B_AssignFindNpcInfos(slf);
	
	Info_Mine_Sld_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_DieLage.npc				= Hlp_GetInstanceID(slf);
};
