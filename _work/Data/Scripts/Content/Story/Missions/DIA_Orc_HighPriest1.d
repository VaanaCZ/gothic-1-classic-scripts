// *********************** PRIESTER 1 ***********************

INSTANCE Info_HighPriest1 (C_INFO)
{
	npc			= ORC_Priest_1;
	nr			= 1;
	condition	= Info_HighPriest1_Condition;
	information	= Info_HighPriest1_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_HighPriest1_Condition()
{
	return TRUE;
};

FUNC VOID Info_HighPriest1_Info()
{
	B_SelectWeapon		(self, other);
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	
	AI_Output 			(self, other,"Info_HighPriest1_17_01"); //SMMRRRTEEELLNN����KK�����!
	AI_Output 			(self, other,"Info_HighPriest1_17_02"); //JAK SE OOPOOVAA�UUJEE�� RUU��IIIT M���JJ KLIIIIID?
	AI_Output 			(self, other,"Info_HighPriest1_17_03"); //P�IIIPRAAAV SEE NAAA KOONEEC!
	AI_Output 			(other, self,"Info_HighPriest1_15_04"); //Ot�zka je, �� konec nadch�z�, ty �ervem okousan� hroudo masa!
	
	B_LogEntry			(CH4_EnterTemple,"Stoj�m tv��� v tv�� Varrag-Hashorovi, jednomu z p�ti sk�et�ch �aman�, kte�� do tohoto sv�ta vnesli Sp��e. Skon��m jeho nemrtvou existenci.");

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
};

