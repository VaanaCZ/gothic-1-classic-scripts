// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Sld_11_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_Mine_Sld_11_EXIT_Condition;
	information	= Info_Mine_Sld_11_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ";
};                       

FUNC INT Info_Mine_Sld_11_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Mine_Sld_11_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Sld_11_EinerVonEuchWerden_Condition;
	information	= Info_Mine_Sld_11_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Как стать одним из вас?";
};                       

FUNC INT Info_Mine_Sld_11_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};	

FUNC VOID Info_Mine_Sld_11_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_EinerVonEuchWerden_15_00"); //Как мне стать одним из вас?
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_01"); //Прежде чем стать одним из нас, ты должен как-то проявить себя.
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_02"); //Покажи, на что ты способен, и может быть тогда тебе позволят прислуживать в Лощине.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Sld_11_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Sld_11_WichtigePersonen_Condition;
	information	= Info_Mine_Sld_11_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь командует?";
};                       

FUNC INT Info_Mine_Sld_11_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_WichtigePersonen_15_00"); //Кто здесь командует?
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_01"); //Здесь, в Лощине, все делают так, как скажет Окил. Он знаком со всеми большими шишками в Лагере. 
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_02"); //Так что если ты сделаешь что-нибудь не так, маги Воды в Новом Лагере обязательно об этом узнают.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Mine_Sld_11_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Sld_11_DasLager_Condition;
	information	= Info_Mine_Sld_11_DasLager_Info;
	permanent	= 1;
	description = "Что-нибудь интересное?";
};                       

FUNC INT Info_Mine_Sld_11_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DasLager_15_00"); //Что-нибудь еще?
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_01"); //Сделаешь какую-нибудь глупость - заработаешь кучу проблем на свою задницу. А так больше ничего...
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_02"); //Да, и проблем будет куда больше, если ты попытаешься без разрешения проникнуть в шахту или в караулку.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Sld_11_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Sld_11_DieLage_Condition;
	information	= Info_Mine_Sld_11_DieLage_Info;
	permanent	= 1;
	description = "Как дела?";
};                       

FUNC INT Info_Mine_Sld_11_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_00"); //Как дела?
	AI_Output(self,other,"Info_Mine_Sld_11_DieLage_011_01"); //Все тихо. Слишом тихо, по-моему.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Sld_11(var c_NPC slf)
{
	//B_AssignFindNpcInfos(slf);
	
	Info_Mine_Sld_11_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_DieLage.npc				= Hlp_GetInstanceID(slf);
};
