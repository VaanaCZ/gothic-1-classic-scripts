// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Tpl_8_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Tpl_8 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Tpl_8_EXIT_Condition;
	information	= Info_Tpl_8_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ";
};                       

FUNC INT Info_Tpl_8_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Tpl_8_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Tpl_8_EinerVonEuchWerden_Condition;
	information	= Info_Tpl_8_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Нужны ли вам верные люди?";
};                       

FUNC INT Info_Tpl_8_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) != GIL_TPL)
	&& (!C_NpcBelongsToNewCamp (other))
	&& (!C_NpcBelongsToOldCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Tpl_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Tpl_8_EinerVonEuchWerden_15_00"); //Нужны ли вам верные люди?
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_01"); //Верные люди нужны всегда. Но тебе придется серьезно поработать над собой. Только лучшие из лучших могут стать Стражами.
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_02"); //Это высочайшая честь для любого последователя Братства Спящего.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Tpl_8_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Tpl_8_WichtigePersonen_Condition;
	information	= Info_Tpl_8_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь командует?";
};                       

FUNC INT Info_Tpl_8_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_8_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00"); //Кто здесь командует?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_01"); //Мы подчиняемся Гуру. Служить им - наш почетный долг.
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_15_02"); //Кто они, эти Гуру?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_03"); //Главный Гуру - Ю`Берион Просвещенный. Ему помогают Кор Галом, Кор Ангар и остальные.
	var C_NPC YBerion;		YBerion	= Hlp_GetNpc(Gur_1200_Yberion);
	var C_NPC CorKalom;		CorKalom= Hlp_GetNpc(Gur_1201_CorKalom);
	var C_NPC CorAngar;		CorAngar= Hlp_GetNpc(Gur_1202_CorAngar);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
	CorAngar.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Tpl_8_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Tpl_8_DasLager_Condition;
	information	= Info_Tpl_8_DasLager_Info;
	permanent	= 1;
	description = "Расскажи мне об этом Лагере.";
};                       

FUNC INT Info_Tpl_8_DasLager_Condition()
{	
	if (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};

FUNC VOID Info_Tpl_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Tpl_8_DasLager_15_00"); //Расскажи мне об этом Лагере.
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_01"); //Ты новичок и можешь ходить где тебе вздумается. Для неверующих закрыт лишь храм Спящего.
	AI_Output(other,self,"Info_Tpl_8_DasLager_08_02"); //Постарайся не нарушать эти правила. И не беспокой наших наставников во время медитации.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Tpl_8_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Tpl_8_DieLage_Condition;
	information	= Info_Tpl_8_DieLage_Info;
	permanent	= 1;
	description = "Как идут дела?";
};                       

FUNC INT Info_Tpl_8_DieLage_Condition()
{	
	if (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};

FUNC VOID Info_Tpl_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Tpl_8_DieLage_15_00"); //Как жизнь?
	AI_Output(self,other,"Info_Tpl_8_DieLage_08_01"); //Предупреждаю тебя: я не потерплю неуважения. Ты разговариваешь с одним из избранных стражей пророков.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Tpl_8(var c_NPC slf)
{
	B_AssignFindNpc_ST(slf);
	
	Info_Tpl_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Tpl_8_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Tpl_8_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Tpl_8_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Tpl_8_DieLage.npc				= Hlp_GetInstanceID(slf);
};
