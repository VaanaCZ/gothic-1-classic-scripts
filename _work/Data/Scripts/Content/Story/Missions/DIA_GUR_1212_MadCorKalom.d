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
	
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_01"); //Koneènì se znovu setkáváme!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_02"); //Mùj mistr mi už vyprávìl o tvém pøíchodu!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_03"); //Dokáže vycítit tvoji pøítomnost.
	AI_Output			(hero, self,"GUR_1212_MadCorKalom_Talk2SC_15_04"); //Brzy mu budu blíž, než se mu bude líbit.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_05"); //Nechceme, abys zmaøil naše plány.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_06"); //Svìt se stane svìdkem probuzení spasitele a nikdo ho nezastaví.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_07"); //Všichni nevìrci zaplatí svùj dluh.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_08"); //A tobì se dostane té cti zaplatit jako první.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_09"); //SSSPÁÁÁÁÁÈÈÈÍÍÍÍ, PRROOBUUUÏÏÏ SSEEE!!!!!!!!

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
	
	AI_Wait				(self, 2);
	Npc_SetTarget		(self, hero );
	AI_StartState		(self, ZS_Attack, 0, "" );
};
