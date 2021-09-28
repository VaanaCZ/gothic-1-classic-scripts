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
	
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_01"); //Kone�n� se znovu setk�v�me!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_02"); //M�j mistr mi u� vypr�v�l o tv�m p��chodu!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_03"); //Dok�e vyc�tit tvoji p��tomnost.
	AI_Output			(hero, self,"GUR_1212_MadCorKalom_Talk2SC_15_04"); //Brzy mu budu bl�, ne� se mu bude l�bit.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_05"); //Nechceme, abys zma�il na�e pl�ny.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_06"); //Sv�t se stane sv�dkem probuzen� spasitele a nikdo ho nezastav�.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_07"); //V�ichni nev�rci zaplat� sv�j dluh.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_08"); //A tob� se dostane t� cti zaplatit jako prvn�.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_09"); //SSSP������������, PRROOBUUU��� SSEEE!!!!!!!!

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
	
	AI_Wait				(self, 2);
	Npc_SetTarget		(self, hero );
	AI_StartState		(self, ZS_Attack, 0, "" );
};
