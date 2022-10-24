// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									Vor Gesprдch
// *************************************************************************

INSTANCE Info_SFB_5_Pre(C_INFO)
{
	nr			= 1;
	condition	= Info_SFB_5_Pre_Condition;
	information	= Info_SFB_5_Pre_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_SFB_5_Pre_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_Pre_Info()
{	
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_00"); //Привет!
};

// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_5_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_5_EXIT_Condition;
	information	= Info_SFB_5_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};                       

FUNC INT Info_SFB_5_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_5_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_5_EinerVonEuchWerden_Condition;
	information	= Info_SFB_5_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Я вот думаю присоединиться к вам.";
};                       

FUNC INT Info_SFB_5_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00"); //Я думаю присоединиться к вам.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01"); //Хочешь присоединиться, да? Водоносом хочешь стать, что ли?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02"); //Нет, рудокопом.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03"); //Лучше послушай меня: Никто в этой проклятой шахте не работает добровольно.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04"); //Но раз ты так хочешь... Иди и найди Суини. Уж он-то снабдит тебя старой киркой, которая может еще пойти в дело.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_5_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_5_WichtigePersonen_Condition;
	information	= Info_SFB_5_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кого здесь можно считать важным человеком?";
};                       

FUNC INT Info_SFB_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00"); //Кого здесь можно считать важным человеком?
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01"); //Важные? Конечно. Я один из них.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02"); //Думаю, ты хотел узнать, кому здесь принадлежит власть.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03"); //Что ж, по-моему, тебе следует поговорить с наемниками или ворами. А вот к магам Круга Воды подходить не стоит.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04"); //Суини не самый лучший тип, но сам он считает себя большой шишкой. А ведь он просто раздает кирки и подчиняется приказам Окила.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_5_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_5_DasLager_Condition;
	information	= Info_SFB_5_DasLager_Info;
	permanent	= 1;
	description = "Что может дать мне этот лагерь?";
};                       

FUNC INT Info_SFB_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00"); //Что может дать мне этот лагерь?
	AI_Output(self,other,"Info_SFB_5_DasLager_02_01"); //Все зависит от того, кем ты здесь будешь. Некоторые работают в поте лица, а некоторые пользуются их трудом.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_5_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_5_DieLage_Condition;
	information	= Info_SFB_5_DieLage_Info;
	permanent	= 1;
	description = "Как здесь живется?";
};                       

FUNC INT Info_SFB_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00"); //Как здесь живется?
	AI_Output(self,other,"Info_SFB_5_DieLage_02_01"); //Хорошо!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_02"); //Да, нам здесь так нравится, что мы изо всех сил пытаемся сбежать отсюда.
	AI_Output(self,other,"Info_SFB_5_DieLage_02_03"); //Где мы, по-твоему, находимся? Мы в тюрьме, а кто может наслаждаться жизнью заключенного?
	
};	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_5(var c_NPC slf)
{

	Info_SFB_5_Pre.npc					= Hlp_GetInstanceID(slf);
	
	Info_SFB_5_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_5_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_5_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_5_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_5_DieLage.npc				= Hlp_GetInstanceID(slf);
};
