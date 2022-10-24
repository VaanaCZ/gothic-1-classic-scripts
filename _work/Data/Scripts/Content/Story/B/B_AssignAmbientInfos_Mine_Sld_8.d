// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Sld_8_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_Mine_Sld_8_EXIT_Condition;
	information	= Info_Mine_Sld_8_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};                       

FUNC INT Info_Mine_Sld_8_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Mine_Sld_8_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Sld_8_EinerVonEuchWerden_Condition;
	information	= Info_Mine_Sld_8_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Как мне присоединиться к вам?";
};                       

FUNC INT Info_Mine_Sld_8_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mine_Sld_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_EinerVonEuchWerden_15_00"); //Как мне присоединиться к вам?
	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_01"); //Прежде чем работать у нас, ты должен доказать людям в Новом лагере, что ты чего-то стоишь.
	AI_Output(self,other,"Info_Mine_Sld_8_EinerVonEuchWerden_08_02"); //Пойди туда и сам у них все узнай.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Sld_8_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Sld_8_WichtigePersonen_Condition;
	information	= Info_Mine_Sld_8_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь командует?";
};                       

FUNC INT Info_Mine_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_8_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_WichtigePersonen_15_00"); //Кто здесь командует?
	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_01"); //Главный здесь Окил. А в лагере все находится под контролем Ли.
	AI_Output(self,other,"Info_Mine_Sld_8_WichtigePersonen_08_02"); //Поэтому тебе стоит пойти и поговорить с ними.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Mine_Sld_8_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Sld_8_DasLager_Condition;
	information	= Info_Mine_Sld_8_DasLager_Info;
	permanent	= 1;
	description = "Как жизнь в лагере?";
};                       

FUNC INT Info_Mine_Sld_8_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_15_00"); //Как жизнь в лагере?
	AI_Output(self,other,"Info_Mine_Sld_8_DasLager_08_01"); //Мы здесь охраняем вход в шахту.
	AI_Output(other,self,"Info_Mine_Sld_8_DasLager_08_02"); //И никто из посторонних зайти не может.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Sld_8_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Sld_8_DieLage_Condition;
	information	= Info_Mine_Sld_8_DieLage_Info;
	permanent	= 1;
	description = "Все в порядке?";
};                       

FUNC INT Info_Mine_Sld_8_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_8_DieLage_15_00"); //Все в порядке?
	AI_Output(self,other,"Info_Mine_Sld_8_DieLage_08_01"); //Что за вопрос? Конечно, в порядке!
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Sld_8(var c_NPC slf)
{
	//B_AssignFindNpcInfos(slf);
	
	Info_Mine_Sld_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_8_DieLage.npc				= Hlp_GetInstanceID(slf);
};
