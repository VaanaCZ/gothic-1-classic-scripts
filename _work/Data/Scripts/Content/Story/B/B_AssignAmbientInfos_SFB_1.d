// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_1_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_1_EXIT_Condition;
	information	= Info_SFB_1_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ";
};                       

FUNC INT Info_SFB_1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_1_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_1_EinerVonEuchWerden_Condition;
	information	= Info_SFB_1_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Как мне стать одним из рудокопов?";
};                       

FUNC INT Info_SFB_1_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_1_EinerVonEuchWerden_15_00"); //Как мне стать одним из рудокопов?
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_01"); //Стать одним из нас? Ты что, думаешь, раз нас никто не заставляет работать, мы ничего не делаем?
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_02"); //Если ты думаешь, что сможешь здесь просто бездельничать, займись лучше чем-нибудь еще, дружище.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_03"); //Теперь, если ты все еще думаешь, что это дело тебе подходит, поговори со Суини. Это тот рудокоп, который весь день стоит в сторонке и курит.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_1_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_1_WichtigePersonen_Condition;
	information	= Info_SFB_1_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь командует?";
};                       

FUNC INT Info_SFB_1_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_1_WichtigePersonen_15_00"); //Кто здесь отвечает за все?
	AI_Output(self,other,"Info_SFB_1_WichtigePersonen_01_01"); //Отвечает за все? Оглянись вокруг. Здесь нет никого, кто бы целый день не надрывал задницу, стараясь собрать побольше руды, это точно.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_1_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_1_DasLager_Condition;
	information	= Info_SFB_1_DasLager_Info;
	permanent	= 1;
	description = "Что это?";
};                       

FUNC INT Info_SFB_1_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_1_DasLager_15_00"); //Что это?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_01"); //А на что это похоже? На королевский дворец?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_02"); //Если ты действительно хочешь работать в Свободной Шахте, тебе прежде придется пробиться наверх здесь, в Лощине, чтобы доказать, что от тебя есть прок.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_1_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_1_DieLage_Condition;
	information	= Info_SFB_1_DieLage_Info;
	permanent	= 1;
	description = "Как идут дела?";
};                       

FUNC INT Info_SFB_1_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_1_DieLage_15_00"); //Как дела?
	AI_Output(self,other,"Info_SFB_1_DieLage_01_01"); //А ты как думаешь? Как всегда, паршиво. Полно работы и совсем нечего жрать.
	AI_Output(self,other,"Info_SFB_1_DieLage_01_02"); //Единственный из нас, кто не слишком загружен, это Суини. Окил назначил его нашим представителем. Суини теперь проводит здесь все дни напролет - следит за тем, чтобы никто не нажил себе мозолей.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_1(var c_NPC slf)
{
	
	Info_SFB_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_1_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_1_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_1_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_1_DieLage.npc				= Hlp_GetInstanceID(slf);
};
