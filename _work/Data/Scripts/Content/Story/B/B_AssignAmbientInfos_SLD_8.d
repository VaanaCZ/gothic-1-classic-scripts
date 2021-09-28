// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Sld_8_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Sld_8 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Sld_8_EXIT_Condition;
	information	= Info_Sld_8_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ";
};                       

FUNC INT Info_Sld_8_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Sld_8_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Sld_8_EinerVonEuchWerden_Condition;
	information	= Info_Sld_8_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Нужны ли вам верные люди?";
};                       

FUNC INT Info_Sld_8_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Sld_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Sld_8_EinerVonEuchWerden_15_00"); //Вам нужны люди?
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_01"); //Ли считает, что прежде чем стать наемником, человек должен прожить здесь несколько лет и набраться опыта.
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_02"); //Если хочешь остаться в Лагере, поначалу тебе придется общаться с ворами.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Sld_8_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Sld_8_WichtigePersonen_Condition;
	information	= Info_Sld_8_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь командует?";
};                       

FUNC INT Info_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_00"); //Кто здесь командует?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_01"); //Мы, наемники, подчиняемся Ли. Он заключил с магами сделку: мы защищаем их, а они должны вытащить нас отсюда.
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_02"); //Значит, маги главнее всех?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_03"); //Нет. В Лагере нет главного. Большинство людей здесь - те, кто не смог или не захотел остаться в Старом Лагере.
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_04"); //Каждый здесь занимается своим делом, и сходимся мы только в одном: лучше собрать руду в кучу и взорвать ее, чем послать хоть кусок этому королю!
	var C_NPC Lee;			Lee		= Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Cronos;		Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Sld_8_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Sld_8_DasLager_Condition;
	information	= Info_Sld_8_DasLager_Info;
	permanent	= 1;
	description = "Расскажи мне об этом Лагере.";
};                       

FUNC INT Info_Sld_8_DasLager_Condition()
{	
	if (!C_NpcBelongsToNewCamp(other))
	{
		return 1;
	};
};
FUNC VOID Info_Sld_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Sld_8_DasLager_15_00"); //Расскажи мне об этом Лагере.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_01"); //Будь здесь повнимательнее. В Лагере полно головорезов.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_02"); //Здесь есть несколько неписанных законов. Первый: к магам не заходит никто, кроме наемников.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_03"); //Второй: если попытаешься подобраться к нашей руде, ты покойник. Третий: лучше не заходить в бар на озере.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_04"); //Видишь ли, этот бар принадлежит ворам, и им не нравится когда новенькие, вроде тебя, туда заходят.
	var C_NPC Cronos;		Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Sld_8_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Sld_8_DieLage_Condition;
	information	= Info_Sld_8_DieLage_Info;
	permanent	= 1;
	description = "Как дела?";
};                       

FUNC INT Info_Sld_8_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Sld_8_DieLage_15_00"); //Как дела?
	AI_Output(self,other,"Info_Sld_8_DieLage_08_01"); //Как всегда. Слежу за тем, чтобы никто не подобрался к магам, да и к руде тоже.
	var C_NPC Cronos;		Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

INSTANCE Info_Sld_8_Krautprobe (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_Sld_8_Krautprobe_Condition;
	information	= Info_Sld_8_Krautprobe_Info;
	permanent	= 1;
	description = "У меня есть болотник. Хочешь?";
};                       

FUNC INT Info_Sld_8_Krautprobe_Condition()
{
	if	((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID Info_Sld_8_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Sld_8_Krautprobe_15_00"); //У меня есть болотник. Хочешь?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_01"); //Почему бы и нет? Я дам тебе за него 10 кусков руды.
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_02"); //Спроси остальных - думаю, они тоже будут не против.
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output (self, other,"Info_Sld_8_Krautprobe_No_Joint_08_00"); //Сперва покажи его. У тебя ведь нет ни стебля, так?
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Sld_8(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);
	
	Info_Sld_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Sld_8_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Sld_8_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Sld_8_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Sld_8_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Sld_8_Krautprobe.npc			= Hlp_GetInstanceID(slf);
};
