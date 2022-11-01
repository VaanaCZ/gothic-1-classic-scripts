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
	
	AI_Output 			(self, other,"Info_HighPriest1_17_01"); //ŚMIERTELNY!
	AI_Output 			(self, other,"Info_HighPriest1_17_02"); //JAK ŚMIESZ ZAKŁÓCAĆ MÓJ SPOKÓJ?!
	AI_Output 			(self, other,"Info_HighPriest1_17_03"); //PRZYGOTUJ SIĘ NA ŚMIERĆ!
	AI_Output 			(other, self,"Info_HighPriest1_15_04"); //Jeszcze się przekonamy, na kogo przyszła pora, ty gnijący ochłapie.
	
	B_LogEntry			(CH4_EnterTemple,"Przede mną stoi Varrag-Hashor, jeden z pięciu orkowych szamanów, którzy sprowadzili Śniącego do tego świata. Wybiła ostatnia godzina tego ożywieńca!");

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
};

