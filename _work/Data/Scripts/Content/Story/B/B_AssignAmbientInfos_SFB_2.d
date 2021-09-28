// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									Vor Gespräch
// *************************************************************************

INSTANCE Info_SFB_2_Pre(C_INFO)
{
	nr			= 1;
	condition	= Info_SFB_2_Pre_Condition;
	information	= Info_SFB_2_Pre_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_SFB_2_Pre_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_Pre_Info()
{	
	AI_Output(self,other,"Info_SFB_2_EinerVonEuchWerden_02_00"); //Czego chcesz? Nie chcê mieæ przez ciebie jakichœ k³opotów.
};

// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_2_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_2_EXIT_Condition;
	information	= Info_SFB_2_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_SFB_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_2_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_2_EinerVonEuchWerden_Condition;
	information	= Info_SFB_2_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Co mam zrobiæ, ¿eby do was do³¹czyæ?";
};                       

FUNC INT Info_SFB_2_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_2_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_2_EinerVonEuchWerden_15_00"); //Co mam zrobiæ, ¿eby do was do³¹czyæ?
	AI_Output(self,other,"Info_SFB_2_EinerVonEuchWerden_02_01"); //Tu ci nie pomogê. Jestem tylko drobn¹ p³otk¹. Porozmawiaj ze Swineyem.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_2_WichtigePersonen_Condition;
	information	= Info_SFB_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu dowodzi?";
};                       

FUNC INT Info_SFB_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_2_WichtigePersonen_15_00"); //Kto tu dowodzi?
	AI_Output(self,other,"Info_SFB_2_WichtigePersonen_02_01"); //Ca³ym Kot³em trzês¹ Najemnicy, ale w Nowym Obozie sprawy maj¹ siê nieco inaczej.
	AI_Output(self,other,"Info_SFB_2_WichtigePersonen_02_02"); //Dlatego lepiej uwa¿aj, z kim zadzierasz.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_2_DasLager_Condition;
	information	= Info_SFB_2_DasLager_Info;
	permanent	= 1;
	description = "Chcia³bym dowiedzieæ siê wiêcej o waszym Obozie.";
};                       

FUNC INT Info_SFB_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_2_DasLager_15_00"); //Chcia³bym dowiedzieæ siê czegoœ wiêcej o waszym Obozie.
	AI_Output(self,other,"Info_SFB_2_DasLager_02_01"); //Nie wiem, czy mogê ci z tym jakoœ pomóc. Porozmawiaj lepiej ze Swineyem albo z najemnikami.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_2_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_2_DieLage_Condition;
	information	= Info_SFB_2_DieLage_Info;
	permanent	= 1;
	description = "Jak wygl¹da ¿ycie tutaj?";
};                       

FUNC INT Info_SFB_2_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_2_DieLage_15_00"); //Jak wygl¹da ¿ycie tutaj?
	AI_Output(self,other,"Info_SFB_2_DieLage_02_01"); //Nie mogê narzekaæ. Ka¿dy musi odpracowaæ swoje i tyle.
	AI_Output(self,other,"Info_SFB_2_DieLage_02_02"); //Ale i tak jest tu lepiej ni¿ w Starym Obozie.
	AI_Output(self,other,"Info_SFB_2_DieLage_02_03"); //Przybywasz ze Starego Obozu?
	AI_Output(self,other,"Info_SFB_2_DieLage_02_04"); //Jeœli jesteœ ze Starego Obozu, wiedz, ¿e ja nie szukam ¿adnych k³opotów!
	AI_StopProcessInfos	(self);
};	
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_2(var c_NPC slf)
{

	Info_SFB_2_Pre.npc					= Hlp_GetInstanceID(slf);
	
	Info_SFB_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_2_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_2_DieLage.npc				= Hlp_GetInstanceID(slf);
};
