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
	
	AI_Output 			(self, other,"Info_HighPriest1_17_01"); //ŒMIERTELNY!
	AI_Output 			(self, other,"Info_HighPriest1_17_02"); //JAK ŒMIESZ ZAK£ÓCAÆ MÓJ SPOKÓJ?!
	AI_Output 			(self, other,"Info_HighPriest1_17_03"); //PRZYGOTUJ SIÊ NA ŒMIERÆ!
	AI_Output 			(other, self,"Info_HighPriest1_15_04"); //Jeszcze siê przekonamy, na kogo przysz³a pora, ty gnij¹cy och³apie.
	
	B_LogEntry			(CH4_EnterTemple,"Przede mn¹ stoi Varrag-Hashor, jeden z piêciu orkowych szamanów, którzy sprowadzili Œni¹cego do tego œwiata. Wybi³a ostatnia godzina tego o¿ywieñca!");

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
};

