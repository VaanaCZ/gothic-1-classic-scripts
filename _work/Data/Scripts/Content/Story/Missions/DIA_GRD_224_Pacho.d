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
	AI_Output			(self, hero,"Info_Pacho_STOP_13_01"); //Ehi, tu!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_02"); //Chi, io?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_03"); //No, tuo nonno... Ci sei solo tu, qui!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_04"); //Io non andrei da quella parte, se fossi in te!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_05"); //Perché?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_06"); //Devi essere nuovo di queste parti!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_07"); //Amico, quella è la strada che porta alla terra degli orchi...
	AI_Output			(self, hero,"Info_Pacho_STOP_13_08"); //Ti ridurranno in polpette!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_09"); //Oh.
	AI_Output			(self, hero,"Info_Pacho_STOP_13_10"); //Prego, non c'è di che!

	AI_StopProcessInfos	(self);
};
