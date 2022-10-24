// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Grd_6_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Grd_6 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Grd_6_EXIT_Condition;
	information	= Info_Grd_6_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Grd_6_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Grd_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Grd_6_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Grd_6_EinerVonEuchWerden_Condition;
	information	= Info_Grd_6_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Вам нужны люди?";
};                       

FUNC INT Info_Grd_6_EinerVonEuchWerden_Condition()
{
	if	(Npc_GetTrueGuild(other) != GIL_GRD)
	&&	(Npc_GetTrueGuild(other) != GIL_KDF)
	&&  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Grd_6_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Grd_6_EinerVonEuchWerden_15_00"); //Вам нужны люди?
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_01"); //Ты недавно в колонии, да? Если ты ищешь лагерь, к которому хочешь присоединиться, поговори с сектантами. Они берут всех без разбора.
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_02"); //В наш лагерь не принимают кого попало... Конечно, если ты не хочешь пойти поработать в шахте!
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Grd_6_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_Grd_6_WichtigePersonen_Condition;
	information	= Info_Grd_6_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь командует?";
};                       

FUNC INT Info_Grd_6_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Grd_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Grd_6_WichtigePersonen_15_00"); //Кто здесь командует?
	AI_Output(self,other,"Info_Grd_6_WichtigePersonen_06_01"); //Торус следит за порядком. Он подчиняется Гомезу.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Grd_6_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_Grd_6_DasLager_Condition;
	information	= Info_Grd_6_DasLager_Info;
	permanent	= 1;
	description = "Я новенький.";
};                       

FUNC INT Info_Grd_6_DasLager_Condition()
{	
	if (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToNewCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_Grd_6_DasLager_Info()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_15_00"); //Я новенький.
	AI_Output(self,other,"Info_Grd_6_DasLager_06_01"); //Да, я вижу.
	AI_Output(other,self,"Info_Grd_6_DasLager_15_02"); //Каковы здешние порядки?
	AI_Output(self,other,"Info_Grd_6_DasLager_06_03"); //Не создавай нам проблем, и тебя никто не тронет.
	Info_ClearChoices(Info_Grd_6_DasLager);
	Info_AddChoice(Info_Grd_6_DasLager, "Ясно.", Info_Grd_6_DasLager_Verstehe);
	Info_AddChoice(Info_Grd_6_DasLager, "А что ты имеешь в виду, говоря о проблемах?", Info_Grd_6_DasLager_WasIstAerger);
};

FUNC VOID Info_Grd_6_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_Verstehe_15_00"); //Ясно.
	Info_ClearChoices(Info_Grd_6_DasLager);
};

FUNC VOID Info_Grd_6_DasLager_WasIstAerger()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_00"); //А что ты имеешь в виду, говоря о проблемах?
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_01"); //Большинство рудокопов платит нам, а мы их защищаем.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_02"); //Если ты обидишь кого-то из них, будешь иметь дело с нами.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_03"); //А если я замечу тебя в чужой хижине, то...
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); //Хорошо, хорошо. Я все понял.
	Info_ClearChoices(Info_Grd_6_DasLager);
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Grd_6_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Grd_6_DieLage_Condition;
	information	= Info_Grd_6_DieLage_Info;
	permanent	= 1;
	description = "Как дела?";
};                       

FUNC INT Info_Grd_6_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Grd_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Grd_6_DieLage_15_00"); //Как дела?
	AI_Output(self,other,"Info_Grd_6_DieLage_06_01"); //Ищешь неприятностей? 
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_GRD_6(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Grd_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Grd_6_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Grd_6_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Grd_6_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Grd_6_DieLage.npc				= Hlp_GetInstanceID(slf);
};
