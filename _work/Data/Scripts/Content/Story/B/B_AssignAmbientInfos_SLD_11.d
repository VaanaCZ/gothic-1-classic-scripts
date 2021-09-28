// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Sld_11_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Sld_11 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Sld_11_EXIT_Condition;
	information	= Info_Sld_11_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ";
};                       

FUNC INT Info_Sld_11_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Sld_11_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Sld_11_EinerVonEuchWerden_Condition;
	information	= Info_Sld_11_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Я хочу стать наемником у магов.";
};                       

FUNC INT Info_Sld_11_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Sld_11_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_00"); //Я хочу стать наемником у магов.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_01"); //Это не так уж сложно. Если ты готов сражаться за наше дело, Ли примет тебя. 
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_02"); //Но он берет только тех, кто хорошо владеет мечом. Ну, как у тебя с этим?
	AI_Output(other,self,"Info_Sld_11_EinerVonEuchWerden_15_03"); //Ну...
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_04"); //Я так и думал. Если ты решил серьезно, то поговори с Горном. Он раньше тренировал новичков.
	AI_Output(self,other,"Info_Sld_11_EinerVonEuchWerden_11_05"); //Может быть, тебе повезет, и он найдет время позаниматься с тобой.
	var C_NPC Gorn;			Gorn	= Hlp_GetNpc(PC_Fighter);
	Gorn.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Sld_11_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Sld_11_WichtigePersonen_Condition;
	information	= Info_Sld_11_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь командует?";
};                       

FUNC INT Info_Sld_11_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Sld_11_WichtigePersonen_15_00"); //Кто здесь командует?
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_01"); //Мы делаем то, что говорят маги. Но чаще всего они ничего не говорят - просто болтаются возле железной горы или зарываются в свои книги.
	AI_Output(self,other,"Info_Sld_11_WichtigePersonen_11_02"); //В основном, командует Ли. Он у нас главный.
	var C_NPC Lee;			Lee		= Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Cronos;		Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Sld_11_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Sld_11_DasLager_Condition;
	information	= Info_Sld_11_DasLager_Info;
	permanent	= 1;
	description = "В Лагере все спокойно?";
};                       

FUNC INT Info_Sld_11_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_DasLager_Info()
{
	AI_Output(other,self,"Info_Sld_11_DasLager_15_00"); //В Лагере все спокойно?
	AI_Output(self,other,"Info_Sld_11_DasLager_11_01"); //Знаешь, парень, проблемы всегда найдутся. Воры делают то, что хотят, а мы, наемники, должны охранять магов и защищать Лагерь.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Sld_11_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Sld_11_DieLage_Condition;
	information	= Info_Sld_11_DieLage_Info;
	permanent	= 1;
	description = "Все в порядке?";
};                       

FUNC INT Info_Sld_11_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_11_DieLage_Info()
{
	AI_Output(other,self,"Info_Sld_11_DieLage_15_00"); //Ты в порядке?
	AI_Output(self,other,"Info_Sld_11_DieLage_11_01"); //Пока все тихо...
	AI_Output(other,self,"Info_Sld_11_DieLage_15_02"); //Пока?
	AI_Output(self,other,"Info_Sld_11_DieLage_11_03"); //Если воры и дальше будут грабить караваны Гомеза, вскоре он и его армия окажутся перед нашим Лагерем.
	AI_Output(self,other,"Info_Sld_11_DieLage_11_04"); //И это будет не слишком здорово.
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

INSTANCE Info_Sld_11_Krautprobe (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_Sld_11_Krautprobe_Condition;
	information	= Info_Sld_11_Krautprobe_Info;
	permanent	= 1;
	description = "Хочешь болотника?";
};                       

FUNC INT Info_Sld_11_Krautprobe_Condition()
{
	if	((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID Info_Sld_11_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Sld_11_Krautprobe_15_00"); //Хочешь болотника?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_01"); //Конечно, хочу. Вот 10 кусков руды.
		AI_Output(self,other,"Info_Sld_11_Krautprobe_11_02"); //Если ты достанешь еще немного...
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output (self, other,"Info_Sld_11_Krautprobe_No_Joint_11_00"); //Словом, принеси еще, тогда и поговорим.
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Sld_11(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);
	
	Info_Sld_11_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_Sld_11_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Sld_11_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_Sld_11_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_Sld_11_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Sld_11_Krautprobe.npc			= Hlp_GetInstanceID(slf);
};
