// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Vlk_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Vlk_4_EXIT_Condition;
	information	= Info_Mine_Vlk_4_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ";
};                       

FUNC INT Info_Mine_Vlk_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Vlk_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Die Mine
// *************************************************************************

INSTANCE Info_Mine_Vlk_4_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Vlk_4_Mine_Condition;
	information	= Info_Mine_Vlk_4_Mine_Info;
	permanent	= 1;
	description = "Расскажи мне о шахте.";
};                       

FUNC INT Info_Mine_Vlk_4_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_4_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_Mine_15_00"); //Расскажи мне о шахте.
	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_01"); //Кирка и пот - вот и все, что здесь есть. Ты пришел и скоро уйдешь...
	AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_02"); //…А я останусь здесь, вырубая эту чертову руду из скалы. Это моя работа. Это моя жизнь.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Vlk_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Vlk_4_WichtigePersonen_Condition;
	information	= Info_Mine_Vlk_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь главный?";
};                       

FUNC INT Info_Mine_Vlk_4_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_WichtigePersonen_15_00"); //Кто здесь главный?
	AI_Output(self,other,"Info_Mine_Vlk_4_WichtigePersonen_01_01"); //Сантино и Альберто выменивают товары на руду, которую мы добываем. Они же раздают нам дневной паек.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Mine_Vlk_4_Minecrawler(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Vlk_4_Minecrawler_Condition;
	information	= Info_Mine_Vlk_4_Minecrawler_Info;
	permanent	= 1;
	description = "Что ты знаешь о ползунах?";
};                       

FUNC INT Info_Mine_Vlk_4_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_4_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_Minecrawler_15_00"); //Что ты знаешь о ползунах?
	AI_Output(self,other,"Info_Mine_Vlk_4_Minecrawler_01_01"); //Если встретишь одну из этих тварей, врежь ей хорошенько киркой промеж глаз. Только нужно хорошенько прицелиться - второго шанса у тебя не будет.
	
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Vlk_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Vlk_4_DieLage_Condition;
	information	= Info_Mine_Vlk_4_DieLage_Info;
	permanent	= 1;
	description = "Как дела?";
};                       

FUNC INT Info_Mine_Vlk_4_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_4_DieLage_15_00"); //Как дела?
	AI_Output(self,other,"Info_Mine_Vlk_4_DieLage_01_01"); //Бывало и лучше.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Vlk_4(var c_NPC slf)
{
	
	
	Info_Mine_Vlk_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_4_DieLage.npc					= Hlp_GetInstanceID(slf);
};
