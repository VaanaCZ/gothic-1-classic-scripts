// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Stt_10_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Stt_10 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Stt_10_EXIT_Condition;
	information	= Info_Stt_10_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ";
};                       

FUNC INT Info_Stt_10_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_10_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Stt_10_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Stt_10_EinerVonEuchWerden_Condition;
	information	= Info_Stt_10_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Я хочу стать Призраком.";
};                       

FUNC INT Info_Stt_10_EinerVonEuchWerden_Condition()
{
	 if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Stt_10_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_15_00"); //Я хочу стать Призраком.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_10_01"); //Да? Ты уже поговорил с Диего?
	
	var C_NPC Diego;		Diego 	= Hlp_GetNpc(PC_Thief);
	Diego.aivar[AIV_FINDABLE] = TRUE;
	
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden,"Нет.", Info_Stt_10_EinerVonEuchWerden_Nein);
	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden,"Да.", Info_Stt_10_EinerVonEuchWerden_Ja);
};

FUNC VOID Info_Stt_10_EinerVonEuchWerden_Nein()
{
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Nein_15_00"); //Еще нет.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Nein_10_01"); //Так сделай это. Ты найдешь его перед входом в замок.
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
};

FUNC VOID Info_Stt_10_EinerVonEuchWerden_Ja()
{
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Ja_15_00"); //Я так и сделаю.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Ja_10_01"); //Хорошо. Мне от этого все равно хуже не будет. Хотя, кто знает...
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Stt_10_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Stt_10_WichtigePersonen_Condition;
	information	= Info_Stt_10_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто еще здесь может быть мне полезен?";
};                       

FUNC INT Info_Stt_10_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_10_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Stt_10_WichtigePersonen_15_00"); //Кто еще здесь может быть мне полезен?
	AI_Output(self,other,"Info_Stt_10_WichtigePersonen_10_01"); //Если у тебя возникнут проблемы со стражниками, поговори с Граво. Ты найдешь его в купальне рядом с воротами замка. Он занимается теми, кто попал в неприятности - а это случается чаще, чем ты думаешь, особенно с новичками.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Stt_10_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Stt_10_DasLager_Condition;
	information	= Info_Stt_10_DasLager_Info;
	permanent	= 1;
	description = "Расскажи мне о Лагере.";
};                       

FUNC INT Info_Stt_10_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_10_DasLager_Info()
{
	AI_Output(other,self,"Info_Stt_10_DasLager_15_00"); //Расскажи мне о Лагере.
	AI_Output(self,other,"Info_Stt_10_DasLager_10_01"); //Я думаю, самое интересное место - это рынок. Обязательно загляни туда, если тебе что-то понадобится.
	AI_Output(self,other,"Info_Stt_10_DasLager_10_02"); //Он находится под большой крышей к югу от Внешнего Кольца.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Stt_10_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Stt_10_DieLage_Condition;
	information	= Info_Stt_10_DieLage_Info;
	permanent	= 1;
	description = "Привет!";
};                       

FUNC INT Info_Stt_10_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Stt_10_DieLage_Info()
{
	AI_Output(other,self,"Info_Stt_10_DieLage_15_00"); //Привет!
	AI_Output(self,other,"Info_Stt_10_DieLage_10_01"); //Что тебе нужно?
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Stt_10(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Stt_10_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_Stt_10_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Stt_10_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_Stt_10_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_Stt_10_DieLage.npc				= Hlp_GetInstanceID(slf);
};
