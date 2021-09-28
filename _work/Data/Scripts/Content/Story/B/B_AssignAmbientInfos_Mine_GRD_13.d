// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Grd_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Grd_13_EXIT_Condition;
	information	= Info_Mine_Grd_13_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ";
};                       

FUNC INT Info_Mine_Grd_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Grd_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Grd_13_Mine (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Grd_13_Mine_Condition;
	information	= Info_Mine_Grd_13_Mine_Info;
	permanent	= 1;
	description = "Как дела на шахте?";
};                       

FUNC INT Info_Mine_Grd_13_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_13_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_Mine_15_00"); //Что происходит на шахте?
	AI_Output(self,other,"Info_Mine_Grd_13_Mine_13_01"); //Шахта - сердце Старого Лагеря. Нет шахты - нет руды. Нет руды - нет товаров из внешнего мира. Понятно?
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Grd_13_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Grd_13_WichtigePersonen_Condition;
	information	= Info_Mine_Grd_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь командует?";
};                       

FUNC INT Info_Mine_Grd_13_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_WichtigePersonen_15_00"); //Кто здесь главный?
	AI_Output(self,other,"Info_Mine_Grd_13_WichtigePersonen_13_01"); //Наш босс - Асгхан. Но ты к нему не лезь. Ян занимается парнями типа тебя.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Grd_13_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Grd_13_DasLager_Condition;
	information	= Info_Mine_Grd_13_DasLager_Info;
	permanent	= 1;
	description = "Расскажи мне о ползунах.";
};                       

FUNC INT Info_Mine_Grd_13_DasLager_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_DasLager_15_00"); //Расскажи мне о ползунах.
	AI_Output(self,other,"Info_Mine_Grd_13_DasLager_13_01"); //Члены Братства отдают Старому Лагерю немало болотника, и им позволяют охотиться на ползунов в шахте.
	
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Grd_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Grd_13_DieLage_Condition;
	information	= Info_Mine_Grd_13_DieLage_Info;
	permanent	= 1;
	description = "Как жизнь?";
};                       

FUNC INT Info_Mine_Grd_13_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_DieLage_15_00"); //Как жизнь?
	AI_Output(self,other,"Info_Mine_Grd_13_DieLage_13_01"); //Я ни с кем не дрался уже целую вечность!
	
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_grd_13(var c_NPC slf)
{
	
	
	Info_Mine_Grd_13_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_Mine.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_DieLage.npc				= Hlp_GetInstanceID(slf);
};
