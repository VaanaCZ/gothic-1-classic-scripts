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
	AI_Output			(self, hero,"Info_Pacho_STOP_13_01"); //Эй, ты! 
	AI_Output			(hero, self,"Info_Pacho_STOP_15_02"); //Кто? Я?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_03"); //Нет, твоя бабушка... К кому еще я могу обращаться?!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_04"); //На твоем месте я бы не ходил туда!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_05"); //Почему нет?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_06"); //Сразу видно, что ты новичок.
	AI_Output			(self, hero,"Info_Pacho_STOP_13_07"); //Парень, эта дорога ведет к землям орков...
	AI_Output			(self, hero,"Info_Pacho_STOP_13_08"); //Они с радостью приготовят из тебя закуску к шнапсу!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_09"); //Ох...
	AI_Output			(self, hero,"Info_Pacho_STOP_13_10"); //Не за что!

	AI_StopProcessInfos	(self);
};
