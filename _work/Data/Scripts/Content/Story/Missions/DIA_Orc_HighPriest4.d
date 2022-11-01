
// *********************** PRIESTER 4 ***********************

INSTANCE Info_HighPriest4 (C_INFO)
{
	npc			= ORC_Priest_4;
	nr			= 1;
	condition	= Info_HighPriest4_Condition;
	information	= Info_HighPriest4_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_HighPriest4_Condition()
{
	return 1;
};

FUNC VOID Info_HighPriest4_Info()
{
	B_SelectWeapon		(self, other);
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	
	AI_Output			(self, other,"Info_HighPriest4_17_01"); //TWOJA DROGA KOŃCZY SIĘ TUTAJ!
	AI_Output			(self, other,"Info_HighPriest4_17_02"); //NIECH SCZEŹNIE TWA CIELESNA POWŁOKA!
	AI_Output			(other, self,"Info_HighPriest4_15_03"); //Wolałbym nie, jeśli łaska!
	
	B_LogEntry			(CH4_EnterTemple,"Varrag-Ruuushk, jeden z przeklętych szamanów Śniącego, stanął mi na drodze. Zobaczymy, kto jest silniejszy!");
	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
};

