//***************************************************************************
//	Info EXIT
//***************************************************************************
instance Info_Pacho_EXIT (C_INFO)
{
	npc			= Grd_224_Pacho;
	nr			= 999;
	condition	= Info_Pacho_EXIT_Condition;
	information	= Info_Pacho_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Pacho_EXIT_Condition()
{
	return TRUE;
};

func VOID Info_Pacho_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################
//---------------------------------------------------------------------
//	Info STOP
//---------------------------------------------------------------------
instance Info_Pacho_STOP (C_INFO)
{
	npc				= Grd_224_Pacho;
	condition		= Info_Pacho_STOP_Condition;
	information		= Info_Pacho_STOP_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Pacho_STOP_Condition()
{
	return TRUE;
};

func void Info_Pacho_STOP_Info()
{
	AI_Output			(self, hero,"Info_Pacho_STOP_13_01"); //Hej, ty!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_02"); //Kto? Ja?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_03"); //Nie, twoja babcia... Jasne, ¿e ty!!!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_04"); //Na twoim miejscu nie szed³bym dalej!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_05"); //Dlaczego?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_06"); //Widzê, ¿e jesteœ tu nowy, co?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_07"); //Stary, ta droga prowadzi na ziemie Orków...
	AI_Output			(self, hero,"Info_Pacho_STOP_13_08"); //Zrobi¹ z ciebie kotlety!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_09"); //Och!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_10"); //Nie ma za co!

	AI_StopProcessInfos	(self);
};
