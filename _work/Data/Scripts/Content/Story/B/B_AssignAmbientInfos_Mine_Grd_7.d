// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Grd_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Grd_7_EXIT_Condition;
	information	= Info_Mine_Grd_7_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};                       

FUNC INT Info_Mine_Grd_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Grd_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Mine
// *************************************************************************

INSTANCE Info_Mine_Grd_7_Mine (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Grd_7_Mine_Condition;
	information	= Info_Mine_Grd_7_Mine_Info;
	permanent	= 1;
	description = "Расскажи мне о шахте.";
};                       

FUNC INT Info_Mine_Grd_7_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_7_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_Mine_15_00"); //Расскажи мне о шахте.
	AI_Output(self,other,"Info_Mine_Grd_7_Mine_07_01"); //А что тут рассказывать? Рудокопы добывают руду, а мы их защищаем от ползунов.
	
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Grd_7_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Grd_7_WichtigePersonen_Condition;
	information	= Info_Mine_Grd_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь командует?";
};                       

FUNC INT Info_Mine_Grd_7_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_WichtigePersonen_15_00"); //Кто здесь командует?
	AI_Output(self,other,"Info_Mine_Grd_7_WichtigePersonen_07_01"); //Ян и Асгхан. Обращайся к ним, если тебе что-нибудь понадобится.
	
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Grd_7_Minecrawler(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Grd_7_Minecrawler_Condition;
	information	= Info_Mine_Grd_7_Minecrawler_Info;
	permanent	= 1;
	description = "Что ты знаешь о ползунах?";
};                       

FUNC INT Info_Mine_Grd_7_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_7_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_Minecrawler_15_00"); //Что ты знаешь о ползунах?
	AI_Output(self,other,"Info_Mine_Grd_7_Minecrawler_07_01"); //Вот что я думаю, их всех нужно уничтожить как можно быстрее.
	
	
};
// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Grd_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Grd_7_DieLage_Condition;
	information	= Info_Mine_Grd_7_DieLage_Info;
	permanent	= 1;
	description = "Как дела?";
};                       

FUNC INT Info_Mine_Grd_7_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_DieLage_15_00"); //Как жизнь?
	AI_Output(self,other,"Info_Mine_Grd_7_DieLage_07_01"); //Слушай, не отвлекай меня от работы!
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_grd_7(var c_NPC slf)
{
	
	
	Info_Mine_Grd_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_Mine.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_DieLage.npc				= Hlp_GetInstanceID(slf);
};
