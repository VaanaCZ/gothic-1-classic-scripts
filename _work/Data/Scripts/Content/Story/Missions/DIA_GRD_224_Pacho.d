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
	AI_Output			(hero, self,"Info_Pacho_STOP_15_02"); //Kdo? J�?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_03"); //Ne, tvoje b�ba... Kdo jin� asi?!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_04"); //B�t tebou, tak bych tudy nechodil!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_05"); //Pro� ne?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_06"); //Ty tady asi nejsi je�t� dlouho!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_07"); //�lov��e, to je cesta do zem� sk�et�...
	AI_Output			(self, hero,"Info_Pacho_STOP_13_08"); //Ud�laj� z tebe sekanou!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_09"); //Och.
	AI_Output			(self, hero,"Info_Pacho_STOP_13_10"); //V�tej!

	AI_StopProcessInfos	(self);
};
