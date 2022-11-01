// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Vlk_2_EXIT_Condition;
	information	= Info_Mine_Vlk_2_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Mine_Vlk_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Vlk_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Vlk_2_Mine_Condition;
	information	= Info_Mine_Vlk_2_Mine_Info;
	permanent	= 1;
	description = "Opowiedz mi o kopalni.";
};                       

FUNC INT Info_Mine_Vlk_2_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Mine_15_00"); //Opowiedz mi o kopalni.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_01"); //Jest jeszcze wiele jaskiń, gdzie zostało trochę rudy, ale pełzacze nie pozwalają nam w nich pracować.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_02"); //Zbyt wiele napadów, zbyt poważne straty.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Vlk_2_WichtigePersonen_Condition;
	information	= Info_Mine_Vlk_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu dowodzi?";
};                       

FUNC INT Info_Mine_Vlk_2_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_WichtigePersonen_15_00"); //Kto może mieć tu coś do powiedzenia?
	AI_Output(self,other,"Info_Mine_Vlk_2_WichtigePersonen_01_01"); //Wąż, jest hutnikiem. Wie wszystko o wytapianiu rudy. Zresztą chyba sam jest z żelaza - cały dzień spędza przed piecem. Nie mam pojęcia jak wytrzymuje ten żar.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_Minecrawler(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Vlk_2_Minecrawler_Condition;
	information	= Info_Mine_Vlk_2_Minecrawler_Info;
	permanent	= 1;
	description = "Co możesz mi powiedzieć o pełzaczach?";
};                       

FUNC INT Info_Mine_Vlk_2_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Minecrawler_15_00"); //Co możesz mi powiedzieć o pełzaczach?
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_01"); //Musieliśmy zamknąć wielki szyb na dole. Aż roi się w nim od pełzaczy.
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_02"); //Pełzacze są tu wszędzie. Nie słyszysz ich? Bo ja słyszę.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Vlk_2_DieLage_Condition;
	information	= Info_Mine_Vlk_2_DieLage_Info;
	permanent	= 1;
	description = "Jak się masz?";
};                       

FUNC INT Info_Mine_Vlk_2_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_DieLage_15_00"); //Jak się masz?
	AI_Output(self,other,"Info_Mine_Vlk_2_DieLage_01_01"); //Muszę pracować. Jak strażnicy zobaczą, że z tobą rozmawiam, obetną mi racje.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Vlk_2(var c_NPC slf)
{
	Info_Mine_Vlk_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_DieLage.npc					= Hlp_GetInstanceID(slf);
};
