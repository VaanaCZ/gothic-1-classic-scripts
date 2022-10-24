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
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
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
	description = "Расскажи мне об этой шахте.";
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
	AI_Output(other,self,"Info_Mine_Vlk_1_Mine_15_00"); //Расскажи мне об этой шахте.
	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_01"); //В шахте растут грибы и травы. Вообще-то их даже можно есть, но для восстановления сил лучше съесть хороший кусок мяса.
	AI_Output(self,other,"Info_Mine_Vlk_1_Mine_01_02"); //А вот ползуны почти несъедобны. К сожалению.
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
	description = "Кто здесь всем управляет?";
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
	AI_Output(other,self,"Info_Mine_Vlk_1_WichtigePersonen_15_00"); //Кто здесь всем управляет?
	AI_Output(self,other,"Info_Mine_Vlk_1_WichtigePersonen_01_01"); //Главный в шахте Ян. Он организует работу и обмен товаров с лагерем. Если тебе что-нибудь понадобится, поговори с ним.
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
	description = "Что ты знаешь о ползунах?";
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
	AI_Output(other,self,"Info_Mine_Vlk_1_Minecrawler_15_00"); //Что ты знаешь о ползунах?
	AI_Output(self,other,"Info_Mine_Vlk_1_Minecrawler_01_01"); //Стражи из Болотного лагеря заключили с Гомезом сделку. Они убивают ползунов и за это забирают их слюну.
	
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
	description = "Как жизнь?";
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
	AI_Output(other,self,"Info_Mine_Vlk_1_DieLage_15_00"); //Как жизнь?
	AI_Output(self,other,"Info_Mine_Vlk_1_DieLage_01_01"); //Уйма работы и слишком мало отдыха. Если есть вопросы, задавай их быстрее. Я очень занят.
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
