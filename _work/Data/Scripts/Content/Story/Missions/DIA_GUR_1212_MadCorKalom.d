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
	
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_01"); //¡Por fin volvemos a encontrarnos!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_02"); //¡Mi maestro ya me ha informado de tu llegada!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_03"); //Siento tu cercana presencia.
	AI_Output			(hero, self,"GUR_1212_MadCorKalom_Talk2SC_15_04"); //¡Pronto estaré más cerca de él de lo que le gustaría!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_05"); //No permitiremos que frustres nuestros planes.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_06"); //El mundo va a ser testigo del despertar del Redentor y nadie podrá detenerle.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_07"); //Todos esos infieles lo pagarán caro.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_08"); //Y tuyo será el honor de ser el primero en pagar.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_09"); //¡DEEEEEEESSSPIEEEEEEEERRTAAAAAAAAAA, DUUUUUUUURRRRRMMMIIIIIEEEEENTEEEEE!

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
	
	AI_Wait				(self, 2);
	Npc_SetTarget		(self, hero );
	AI_StartState		(self, ZS_Attack, 0, "" );
};
