instance  GUR_1212_MadCorKalom_Talk2SC (C_INFO)
{
	npc				= GUR_1212_MadCorKalom;
	condition		= GUR_1212_MadCorKalom_Talk2SC_Condition;
	information		= GUR_1212_MadCorKalom_Talk2SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GUR_1212_MadCorKalom_Talk2SC_Condition()
{
	return TRUE;
};

FUNC void GUR_1212_MadCorKalom_Talk2SC_Info ()
{
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, hero);
	
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_01"); //Finalement, nous sommes encore réunis !
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_02"); //Mon maître m'a déjà informé de ton arrivée !
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_03"); //Il sent que tu es tout près.
	AI_Output			(hero, self,"GUR_1212_MadCorKalom_Talk2SC_15_04"); //Je serai bientôt plus proche de lui qu'il ne l'imagine !
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_05"); //Nous ne te laisserons pas contrecarrer nos plans !
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_06"); //Le monde va assister au réveil du Rédempteur, et rien ni personne ne peut l'arrêter.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_07"); //Tous les infidèles payeront le prix.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_08"); //Et tu auras l'honneur d'être le premier à payer.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_09"); //Dormeur RÉVEILLE TOI !!!!!!!!!

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
	
	AI_Wait				(self, 2);
	Npc_SetTarget		(self, hero );
	AI_StartState		(self, ZS_Attack, 0, "" );
};
