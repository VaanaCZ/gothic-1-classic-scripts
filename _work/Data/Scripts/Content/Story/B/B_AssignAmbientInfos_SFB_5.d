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
	description = "ЗАКОНЧИТЬ";
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
	description = "Что если я хочу присоединиться к вам?";
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
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00"); //Что если я хочу присоединиться к вам?
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01"); //Присоединиться к нам? И кем ты хочешь быть - водоносом?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02"); //Нет, рудокопом.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03"); //Послушай, что я скажу тебе: никто ДОБРОВОЛЬНО не становится рудокопом.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04"); //Конечно, если ты настаиваешь... Иди и поговори со Суини - уверен, у него найдется для тебя старая кирка. 
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
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01"); //Важным? Меня, конечно.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02"); //Я думаю, ты хотел спросить, кто здесь главный.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03"); //Я думаю, тебе стоит поговорить с наемниками или с ворами. Магов Воды ты даже не увидишь. 
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04"); //Суини - большая задница, но считает себя большой шишкой. На самом деле он просто раскладывает кирки и делает то, что ему прикажет Окил.
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
	description = "Что хорошего в этом Лагере?";
};                       

FUNC INT Info_SFB_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00"); //Что хорошего в этом Лагере?
	AI_Output(self,other,"Info_SFB_5_DasLager_02_01"); //Это зависит от человека. Одним не достанется ничего, кроме работы, другие получат чертову уйму удовольствия.
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
	description = "И как здесь живется?";
};                       

FUNC INT Info_SFB_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00"); //Как здесь живется?
	AI_Output(self,other,"Info_SFB_5_DieLage_02_01"); //Отлично!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_02"); //Именно потому, что нам так нравится здесь, мы изо всех сил пытаемся отсюда выбраться.
	AI_Output(self,other,"Info_SFB_5_DieLage_02_03"); //Как, ты думаешь, называется это место? Это тюрьма, а в тюрьме жить никому не нравится.
	
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
