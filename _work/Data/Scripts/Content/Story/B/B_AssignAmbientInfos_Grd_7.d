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
	description = "Я хочу быть одним из стражников Гомеза. Что сделать для этого?";
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
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00"); //Я хочу быть одним из стражников Гомеза. Что мне сделать для этого?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01"); //Что ты можешь сделать? Ты шутишь? Думаешь, можно просто прийти сюда и сразу стать одним из нас?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02"); //Гомез назначает своими стражниками только самых лучших.
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03"); //Тебе придется начинать так же, как и все остальные. Сначала нужно стать Призраком и доказать, что на тебя можно положиться.
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
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01"); //Торус следит за порядком в лагере. Диего - его правая рука.
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02"); //Если ты хочешь стать одним из нас, поговори с ними.
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
	description = "Здесь все работают на Гомеза?";
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
	AI_Output(other,self,"Info_grd_7_DasLager_15_00"); //Здесь все работают на Гомеза?
	AI_Output(self,other,"Info_grd_7_DasLager_07_01"); //Нет. Большинство людей лагеря простые рудокопы.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02"); //Только стражники и Призраки являются людьми Гомеза.
	Info_ClearChoices(Info_grd_7_DasLager);
	Info_AddChoice(Info_grd_7_DasLager, "НАЗАД", Info_grd_7_DasLager_Zurueck);
	Info_AddChoice(Info_grd_7_DasLager, "Чем занимаются стражники?", Info_grd_7_DasLager_Gardisten);
	Info_AddChoice(Info_grd_7_DasLager, "Что делают Призраки?", Info_grd_7_DasLager_Schatten);
	Info_AddChoice(Info_grd_7_DasLager, "Чем занимаются рудокопы?", Info_grd_7_DasLager_Buddler);
};

FUNC VOID Info_grd_7_DasLager_ZURUECK()
{
	Info_ClearChoices(Info_grd_7_DasLager);
};

FUNC VOID Info_grd_7_DasLager_Gardisten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00"); //Чем занимаются стражники?
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01"); //Мы охраняем лагерь и защищаем рудокопов.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02"); //Мы живем на то, что нам платит Гомез и рудокопы за защиту. Этой руды вполне хватает, чтобы иногда приятно провести время.
};

FUNC VOID Info_grd_7_DasLager_Schatten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00"); //Что делают Призраки?
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01"); //Они следят за тем, чтобы все приказы Гомеза выполнялись так, как нужно.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02"); //Большинство из них просто хотят занять место получше, но если ты хочешь чего-то добиться в этом лагере, то единственный верный путь - стать Призраком.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03"); //Если ты будешь хорошо выполнять свою работу, ты сможешь стать одним из стражников.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04"); //Ну, а когда ты станешь одним из людей Гомеза, никто во всей колонии не посмеет лезть к тебе, поверь мне.
};

FUNC VOID Info_grd_7_DasLager_Buddler()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00"); //Чем занимаются рудокопы?
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01"); //Хороший вопрос! Они работают в шахте, а мы их оттуда не выпускаем.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02"); //Правда, иногда они выходят, чтобы потратить заработанную руду, если, конечно, проработают там достаточно долго.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03"); //Когда руда заканчивается, они возвращаются в шахту. Так живет большинство из них.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04"); //Но, по-моему, ты не похож на человека, которому подойдет подобный образ жизни. Поговори с Торусом, если ты этого еще не сделал.
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
	AI_Output(self,other,"Info_grd_7_DieLage_07_01"); //Пока ты не присоединишься к одному из лагерей, тебя здесь никто не будет воспринимать всерьез!
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
