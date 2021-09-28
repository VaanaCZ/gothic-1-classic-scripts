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
	
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_01"); //Alla fine ci rincontriamo!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_02"); //Il mio maestro mi aveva avvertito del tuo arrivo!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_03"); //Lui può percepire la tua presenza.
	AI_Output			(hero, self,"GUR_1212_MadCorKalom_Talk2SC_15_04"); //Presto gli sarò più vicino di quanto lui stesso non desideri!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_05"); //Non ti permetteremo di rovinare i nostri piani.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_06"); //Il mondo sta per testimoniare la grandezza del Redentore e nessuno può impedirlo.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_07"); //Tutti gli infedeli la pagheranno.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_08"); //E tu avrai l'onore di essere il primo.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_09"); //DDDOOOOOORRRRRRRRRMMMIIIIIIIEEEENNNNNNTTTTTTTEEEEEE, SSVVVVEEEEEEEGGGGGLLLLLLLIIIIIIAAAAAAAAATIIIIIII!!!

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
	
	AI_Wait				(self, 2);
	Npc_SetTarget		(self, hero );
	AI_StartState		(self, ZS_Attack, 0, "" );
};
