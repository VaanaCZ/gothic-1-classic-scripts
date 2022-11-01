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
	
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_01"); //Nareszcie, znów się spotykamy!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_02"); //Mój pan uprzedził mnie o twoim przybyciu!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_03"); //On potrafi wyczuć, że jesteś w pobliżu!
	AI_Output			(hero, self,"GUR_1212_MadCorKalom_Talk2SC_15_04"); //Wkrótce znajdę się bliżej niego, niż mógłby sobie tego życzyć!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_05"); //Nie pozwolimy, byś pokrzyżował nasze plany.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_06"); //Świat doświadczy wkrótce przebudzenia wielkiego Odkupiciela i nikt nie jest w stanie temu zapobiec.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_07"); //Wszyscy niewierni zapłacą słoną cenę.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_08"); //A ty będziesz miał zaszczyt być pierwszym z nich.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_09"); //ŚNIĄCY, ZBUDŹ SIĘ!!!

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
	
	AI_Wait				(self, 2);
	Npc_SetTarget		(self, hero );
	AI_StartState		(self, ZS_Attack, 0, "" );
};
