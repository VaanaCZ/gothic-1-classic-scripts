// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Nov_5_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Nov_5 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Nov_5_EXIT_Condition;
	information	= Info_Nov_5_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ";
};                       

FUNC INT Info_Nov_5_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Nov_5_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Nov_5_EinerVonEuchWerden_Condition;
	information	= Info_Nov_5_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Как мне присоединиться к этому Лагерю?";
};                       

FUNC INT Info_Nov_5_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Nov_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_5_EinerVonEuchWerden_15_00"); //Как можно присоединиться к этому Лагерю?
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_01"); //Нет ничего проще. Поговори с младшими Гуру, они помогут тебе.
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_02"); //Тебе здесь понравится, вот увидишь.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Nov_5_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Nov_5_WichtigePersonen_Condition;
	information	= Info_Nov_5_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь командует?";
};                       

FUNC INT Info_Nov_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_5_WichtigePersonen_15_00"); //Кто здесь командует?
	AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_01"); //Здесь все под властью Гуру. Но если ты не будешь привлекать к себе внимания, они тебя не тронут.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Nov_5_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Nov_5_DasLager_Condition;
	information	= Info_Nov_5_DasLager_Info;
	permanent	= 1;
	description = "Расскажи мне об этом Лагере.";
};                       

FUNC INT Info_Nov_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_DasLager_Info()
{
	AI_Output(other,self,"Info_Nov_5_DasLager_15_00"); //Расскажи мне об этом Лагере.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_01"); //Это лучшее место во всей Богом забытой колонии.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_02"); //Даже если ты не веришь в учение Спящего, ты все равно получишь здесь еду и болотник. Все что тебе нужно, это поговорить с Фортуно.
	AI_Output(other,self,"Info_Nov_5_DasLager_15_03"); //Где мне его найти?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_04"); //Под лабораторией Кор Галома, радом со внутренним двором храма.
	
	var C_NPC CorKalom;		CorKalom = Hlp_GetNpc(Gur_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Nov_5_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Nov_5_DieLage_Condition;
	information	= Info_Nov_5_DieLage_Info;
	permanent	= 1;
	description = "Как дела?";
};                       

FUNC INT Info_Nov_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_5_DieLage_15_00"); //Как дела?
	AI_Output(self,other,"Info_Nov_5_DieLage_05_01"); //Пожаловаться не на что. Скажи, ты новенький?
	AI_Output(other,self,"Info_Nov_5_DieLage_15_02"); //Я только что прибыл.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Nov_5(var c_NPC slf)
{
	B_AssignFindNpc_ST(slf);
	
	Info_Nov_5_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Nov_5_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Nov_5_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Nov_5_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Nov_5_DieLage.npc				= Hlp_GetInstanceID(slf);
};
