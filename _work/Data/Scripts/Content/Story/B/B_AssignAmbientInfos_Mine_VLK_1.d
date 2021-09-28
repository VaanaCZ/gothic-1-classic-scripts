// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Vlk_1_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_1 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Vlk_1_EXIT_Condition;
	information	= Info_Mine_Vlk_1_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Mine_Vlk_1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Vlk_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Vlk_1_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Vlk_1_Mine_Condition;
	information	= Info_Mine_Vlk_1_Mine_Info;
	permanent	= 1;
	description = "Opowiedz mi o kopalni.";
};                       

FUNC INT Info_Mine_Vlk_1_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_1_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_Mine_15_00"); //Opowiedz mi o kopalni.
	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_01"); //W jaskiniach rosn¹ ró¿ne grzyby i zio³a. Da siê to prze³kn¹æ, ale nie ma to jak soczysty kawa³ miêsa.
	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_02"); //Pe³zacze te¿ nie nale¿¹ do przysmaków. Cholerna nora!
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Vlk_1_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Vlk_1_WichtigePersonen_Condition;
	information	= Info_Mine_Vlk_1_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto wami dowodzi?";
};                       

FUNC INT Info_Mine_Vlk_1_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_WichtigePersonen_15_00"); //Kto wami dowodzi?
	AI_Output(self,other,"Info_Mine_Vlk_1_WichtigePersonen_01_01"); //Ian organizuje si³ê robocz¹ i wymianê dóbr z obozem. Jeœli szukasz czegoœ konkretnego, najlepiej pogadaj z nim.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Vlk_1_Minecrawler(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Vlk_1_Minecrawler_Condition;
	information	= Info_Mine_Vlk_1_Minecrawler_Info;
	permanent	= 1;
	description = "Co mo¿esz mi powiedzieæ o pe³zaczach?";
};                       

FUNC INT Info_Mine_Vlk_1_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_1_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_Minecrawler_15_00"); //Co mo¿esz mi powiedzieæ o pe³zaczach?
	AI_Output(self,other,"Info_Mine_Vlk_1_Minecrawler_01_01"); //Stra¿nicy Œwi¹tynni zawarli uk³ad z Gomezem. Zabijaj¹ pe³zacze, w zamian za co mog¹ zatrzymaæ ich wnêtrznoœci.
	
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Vlk_1_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Vlk_1_DieLage_Condition;
	information	= Info_Mine_Vlk_1_DieLage_Info;
	permanent	= 1;
	description = "Jak leci?";
};                       

FUNC INT Info_Mine_Vlk_1_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_1_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_1_DieLage_15_00"); //Jak leci?
	AI_Output(self,other,"Info_Mine_Vlk_1_DieLage_01_01"); //Mnóstwo pracy, niewiele odpoczynku. Dlatego jeœli chcesz czegoœ ode mnie, lepiej siê streszczaj.
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Vlk_1(var c_NPC slf)
{
	Info_Mine_Vlk_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_1_DieLage.npc					= Hlp_GetInstanceID(slf);
};
