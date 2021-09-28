// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Org_6_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_6 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Org_6_EXIT_Condition;
	information	= Info_Org_6_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Org_6_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Org_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Org_6_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Org_6_EinerVonEuchWerden_Condition;
	information	= Info_Org_6_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Я хочу присоединиться к вам!";
};                       

FUNC INT Info_Org_6_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_6_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_00"); //Я хочу присоединиться к вам.
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_01"); //Ларс решает, кто может присоединиться к шайке.
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_02"); //Но тебе понадобится веская причина, чтобы увидеть его.
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_03"); //Например?
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_04"); //Допустим, кто-нибудь пошлет тебя к нему.
	var C_NPC Lares;		Lares	= Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Org_6_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Org_6_WichtigePersonen_Condition;
	information	= Info_Org_6_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь главный?";
};                       

FUNC INT Info_Org_6_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Org_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Org_6_WichtigePersonen_15_00"); //Кто здесь главный?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_01"); //Ты пришел из Старого Лагеря, да?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_02"); //Здесь нет главных. Этот чертов Ли пытается держать всех в узде, но мы все равно делаем лишь то, что считаем нужным.
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_03"); //Если у нас и есть главный, то это Ларс. Но он достаточно умен, чтобы не встревать в чужие дела.
	var C_NPC Lee;			Lee		= Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Lares;		Lares	= Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Org_6_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Org_6_DasLager_Condition;
	information	= Info_Org_6_DasLager_Info;
	permanent	= 1;
	description = "Расскажи мне об этом месте.";
};                       

FUNC INT Info_Org_6_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Org_6_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_6_DasLager_15_00"); //Расскажи что-нибудь еще об этом месте.
	AI_Output(self,other,"Info_Org_6_DasLager_06_01"); //В середине пещеры есть здоровенная яма, полная руды. Если ты собираешься прибрать ее к рукам, забудь об этом.
	AI_Output(self,other,"Info_Org_6_DasLager_06_02"); //Я сам пытался однажды, но эти наемники несут стражу днем и ночью.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Org_6_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Org_6_DieLage_Condition;
	information	= Info_Org_6_DieLage_Info;
	permanent	= 1;
	description = "Как дела?";
};                       

FUNC INT Info_Org_6_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Org_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_6_DieLage_15_00"); //Как дела?
	AI_Output(self,other,"Info_Org_6_DieLage_06_01"); //Парень! А ты как думаешь? Целыми днями есть рис и все время ждать, пока подвернется шанс получить немного руды.
	AI_Output(self,other,"Info_Org_6_DieLage_06_02"); //А потом идешь в бар и набираешься до краев дрянным рисовым шнапсом.
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

INSTANCE Info_Org_6_Krautprobe (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_Org_6_Krautprobe_Condition;
	information	= Info_Org_6_Krautprobe_Info;
	permanent	= 1;
	description = "У меня есть немного болотника. Хочешь?";
};                       

FUNC INT Info_Org_6_Krautprobe_Condition()
{
	if	((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_6_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00"); //У меня есть немного болотника. Хочешь?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_01"); //Конечно. Вот, здесь 10 кусков руды.
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_02"); //Возвращайся, когда раздобудешь еще, ладно?
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output (self, other,"Info_Org_6_Krautprobe_No_Joint_06_00"); //Где? Я не вижу ни стебелька.
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Org_6(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);
	
	Info_Org_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Org_6_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Org_6_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Org_6_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Org_6_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Org_6_Krautprobe.npc			= Hlp_GetInstanceID(slf);
};
