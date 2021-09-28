// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_grd_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_grd_7_EXIT_Condition;
	information	= Info_grd_7_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_grd_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_grd_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_grd_7_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_7_EinerVonEuchWerden_Condition;
	information	= Info_grd_7_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Что нужно сделать, чтобы стать одним из стражников Гомеза?";
};                       

FUNC INT Info_grd_7_EinerVonEuchWerden_Condition()
{
	if	(Npc_GetTrueGuild(other) != GIL_GRD)
	&&	(Npc_GetTrueGuild(other) != GIL_KDF)
	&&  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_grd_7_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00"); //Что нужно сделать, чтобы стать одним из стражников Гомеза?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01"); //Тебе?! Ты шутишь. Ты что, думаешь, можно просто прийти сюда с важным видом и сразу оказаться наверху, так?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02"); //Стражниками становятся лучшие из лучших.
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03"); //Ты будешь пробиваться наверх так же, как и все остальные, и для начала докажешь свою верность Лагерю, став одним из Призраков.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_grd_7_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_7_WichtigePersonen_Condition;
	information	= Info_grd_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь командует?";
};                       

FUNC INT Info_grd_7_WichtigePersonen_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00"); //Кто здесь командует?
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01"); //Торус следит за тем, что происходит в Лагере. Диего - его помощник.
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02"); //Если ты хочешь чего-то добиться здесь, говорить нужно с ними.
	var C_NPC Diego;		Diego 	= Hlp_GetNpc(PC_Thief);
	Diego.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_grd_7_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_7_DasLager_Condition;
	information	= Info_grd_7_DasLager_Info;
	permanent	= 1;
	description = "И все люди здесь работают на Гомеза?";
};                       

FUNC INT Info_grd_7_DasLager_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_7_DasLager_15_00"); //Все люди здесь работают на Гомеза?
	AI_Output(self,other,"Info_grd_7_DasLager_07_01"); //Не-а. Большинство из них - простые рудокопы.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02"); //С Гомезом только стража и Призраки.
	Info_ClearChoices(Info_grd_7_DasLager);
	Info_AddChoice(Info_grd_7_DasLager,"НАЗАД", Info_grd_7_DasLager_Zurueck);
	Info_AddChoice(Info_grd_7_DasLager,"Что делают стражники?", Info_grd_7_DasLager_Gardisten);
	Info_AddChoice(Info_grd_7_DasLager,"Чем занимаются Призраки?", Info_grd_7_DasLager_Schatten);
	Info_AddChoice(Info_grd_7_DasLager,"Что делают рудокопы?", Info_grd_7_DasLager_Buddler);
};

FUNC VOID Info_grd_7_DasLager_ZURUECK()
{
	Info_ClearChoices(Info_grd_7_DasLager);
};

FUNC VOID Info_grd_7_DasLager_Gardisten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00"); //Что делают стражники?
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01"); //Мы охраняем Лагерь и защищаем рудокопов.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02"); //Деньги нам платит Гомез, да и рудокопы отстегивают за свою защиту. Дело довольно прибыльное.
};

FUNC VOID Info_grd_7_DasLager_Schatten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00"); //Чем занимаются Призраки?
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01"); //Призраки следят за тем, чтобы исполнялись приказы Гомеза.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02"); //Большинство из них - простые подхалимы, мечтающие продвинуться по службе. Если ты хочешь чего-нибудь добиться здесь, это правильный путь.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03"); //Прослужив достаточно долго, ты можешь стать одним из нас.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04"); //Ну а если ты с Гомезом, ни один человек в этой колонии не посмеет тебя обидеть, малыш.
};

FUNC VOID Info_grd_7_DasLager_Buddler()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00"); //Что делают рудокопы?
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01"); //Хороший вопрос. Они даже из шахты-то, можно считать, не выходят.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02"); //То есть, они выходят сюда потратить руду, когда просидят там достаточно долго.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03"); //Но, промотав все, отправляются обратно. Этим занимается большинство людей в округе.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04"); //Мне кажется, ты способен на большее, чем просто махать киркой. Поговори с Торусом, если ты еще не сделал этого.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_grd_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_7_DieLage_Condition;
	information	= Info_grd_7_DieLage_Info;
	permanent	= 1;
	description = "Как дела?";
};                       

FUNC INT Info_grd_7_DieLage_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_7_DieLage_15_00"); //Как дела?
	AI_Output(self,other,"Info_grd_7_DieLage_07_01"); //Для тебя, ты имеешь в виду? Пока ты не решишь, в каком ты Лагере, никто не будет воспринимать тебя всерьез, малыш!
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_grd_7(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_grd_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_grd_7_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_grd_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_grd_7_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_grd_7_DieLage.npc				= Hlp_GetInstanceID(slf);
};
