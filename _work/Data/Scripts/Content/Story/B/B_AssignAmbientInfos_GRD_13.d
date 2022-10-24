// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_grd_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_grd_13_EXIT_Condition;
	information	= Info_grd_13_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_grd_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_grd_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_grd_13_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_13_EinerVonEuchWerden_Condition;
	information	= Info_grd_13_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Я хочу стать одним из стражников.";
};                       

FUNC INT Info_grd_13_EinerVonEuchWerden_Condition()
{
	if	(Npc_GetTrueGuild(other) != GIL_GRD)
	&&	(Npc_GetTrueGuild(other) != GIL_KDF)
	&&  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_grd_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_13_EinerVonEuchWerden_15_00"); //Я хочу стать одним из стражников.
	AI_Output(self,other,"Info_grd_13_EinerVonEuchWerden_13_01"); //Для этого тебе нужно как-то показать себя.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_grd_13_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_13_WichtigePersonen_Condition;
	information	= Info_grd_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "А кто здесь главный?";
};                       

FUNC INT Info_grd_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_grd_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_13_WichtigePersonen_15_00"); //А кто здесь главный?
	AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_01"); //Здесь я главный. И послушай меня: следи за тем, что ты говоришь!
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_grd_13_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_13_DasLager_Condition;
	information	= Info_grd_13_DasLager_Info;
	permanent	= 1;
	description = "Как мне войти в замок?";
};                       

FUNC INT Info_grd_13_DasLager_Condition()
{
	if (Kapitel == 1) 
	{
	return 1;
	};
};

FUNC VOID Info_grd_13_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_13_DasLager_15_00"); //Как мне войти в замок?
	AI_Output(self,other,"Info_grd_13_DasLager_13_01"); //Никак. В замок могут заходить только люди Гомеза.
	Info_ClearChoices(Info_grd_13_DasLager);
	Info_AddChoice(Info_grd_13_DasLager, "Ясно.", Info_grd_13_DasLager_Verstehe);
	Info_AddChoice(Info_grd_13_DasLager, "А если подкупить стражников?", Info_grd_13_DasLager_WachenBestechen);
	Info_AddChoice(Info_grd_13_DasLager, "Мне нужно поговорить с Гомезом. Как мне с ним встретиться?", Info_grd_13_DasLager_GomezSprechen);
};

FUNC VOID Info_grd_13_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_grd_13_DasLager_Verstehe_15_00"); //Ясно.
	Info_ClearChoices(Info_grd_13_DasLager);
};

FUNC VOID Info_grd_13_DasLager_WachenBestechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_00"); //А если подкупить стражников?
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_01"); //Наглости тебе не занимать. Думаю, если ты предложишь им достаточно руды, они могут отвернуться ненадолго.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_02"); //Но если Гомез узнает о том, что они пропустили в замок чужака, он посадит их в подземелье.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_03"); //Поэтому подкуп обойдется тебе очень недешево.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_04"); //Но если уж ты попадешь в замок, тебе не удастся пройти дальше двора. Там кругом охрана.
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_05"); //Да, я просто поинтересовался, вот и все.
};

FUNC VOID Info_grd_13_DasLager_GomezSprechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_GomezSprechen_15_00"); //Мне нужно поговорить с Гомезом. Как мне с ним встретиться?
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_01"); //Гомезу не нужны люди, которых никто здесь не знает.
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_02"); //Но если для тебя это так важно, поговори с Торусом.

	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_grd_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_13_DieLage_Condition;
	information	= Info_grd_13_DieLage_Info;
	permanent	= 1;
	description = "Как дела?";
};                       

FUNC INT Info_grd_13_DieLage_Condition()
{	
	if  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_grd_13_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_13_DieLage_15_00"); //Как дела?
	AI_Output(self,other,"Info_grd_13_DieLage_13_01"); //Все спокойно. Была, правда, пара разборок с людьми Нового лагеря, да вот еще эти болотные сектанты заглядывают.
	AI_Output(self,other,"Info_grd_13_DieLage_13_02"); //Ты здесь еще новенький, поэтому для тебя это не так важно, но когда ты присоединишься к одному из лагерей, ты узнаешь, что приобретешь не только друзей.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_grd_13(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_grd_13_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_grd_13_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_grd_13_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_grd_13_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_grd_13_DieLage.npc				= Hlp_GetInstanceID(slf);
};
