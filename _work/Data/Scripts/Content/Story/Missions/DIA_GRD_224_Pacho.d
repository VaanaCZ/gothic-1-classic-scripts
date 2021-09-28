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
	AI_Output			(self, hero,"Info_Pacho_STOP_13_01"); //�Eh, t�!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_02"); //�Qui�n? �Yo?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_03"); //No, tu abuela... �A qui�n m�s podr�a referirme?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_04"); //�Si estuviese en tu lugar, no ir�a por ese camino!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_05"); //�Por qu� no?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_06"); //�No llevas mucho tiempo por aqu�!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_07"); //T�o, �se es el camino hacia el territorio orco.
	AI_Output			(self, hero,"Info_Pacho_STOP_13_08"); //�Te har�n picadillo!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_09"); //Oh.
	AI_Output			(self, hero,"Info_Pacho_STOP_13_10"); //�T� mismo!

	AI_StopProcessInfos	(self);
};
