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
	
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_01"); //Nareszcie, zn�w si� spotykamy!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_02"); //M�j pan uprzedzi� mnie o twoim przybyciu!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_03"); //On potrafi wyczu�, �e jeste� w pobli�u!
	AI_Output			(hero, self,"GUR_1212_MadCorKalom_Talk2SC_15_04"); //Wkr�tce znajd� si� bli�ej niego, ni� m�g�by sobie tego �yczy�!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_05"); //Nie pozwolimy, by� pokrzy�owa� nasze plany.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_06"); //�wiat do�wiadczy wkr�tce przebudzenia wielkiego Odkupiciela i nikt nie jest w stanie temu zapobiec.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_07"); //Wszyscy niewierni zap�ac� s�on� cen�.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_08"); //A ty b�dziesz mia� zaszczyt by� pierwszym z nich.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_09"); //�NI�CY, ZBUD� SI�!!!

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
	
	AI_Wait				(self, 2);
	Npc_SetTarget		(self, hero );
	AI_StartState		(self, ZS_Attack, 0, "" );
};
