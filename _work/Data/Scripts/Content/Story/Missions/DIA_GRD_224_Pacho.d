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
	AI_Output			(self, hero,"Info_Pacho_STOP_13_01"); //Hé, toi !
	AI_Output			(hero, self,"Info_Pacho_STOP_15_02"); //Qui ? Moi ?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_03"); //Non, ta grand-mère... A qui crois-tu que je parle ?!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_04"); //Je ne prendrais pas par là si j'étais toi !
	AI_Output			(hero, self,"Info_Pacho_STOP_15_05"); //Pourquoi pas ?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_06"); //Tu ne dois pas être ici depuis longtemps !
	AI_Output			(self, hero,"Info_Pacho_STOP_13_07"); //C'est le chemin vers la terre des Orcs, l'ami...
	AI_Output			(self, hero,"Info_Pacho_STOP_13_08"); //Ils vont te transformer en bouillie !
	AI_Output			(hero, self,"Info_Pacho_STOP_15_09"); //Oh.
	AI_Output			(self, hero,"Info_Pacho_STOP_13_10"); //De rien !

	AI_StopProcessInfos	(self);
};
