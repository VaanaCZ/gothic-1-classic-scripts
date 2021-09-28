// *********************** HOHER PRIESTER ***********************
INSTANCE Info_HighPriest5 (C_INFO)
{
	npc				= ORC_Priest_5;
	nr				= 1;
	condition		= Info_HighPriest5_Condition;
	information		= Info_HighPriest5_Info;
	important		= 1;
};                       

FUNC INT Info_HighPriest5_Condition()
{
	return TRUE;
};

FUNC VOID Info_HighPriest5_Info()
{
	//B_SelectWeapon		(self, other);
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	
	if ( Npc_HasItems ( hero, Mythrilklinge02 )) || ( Npc_HasItems ( hero, UrizielRune ))
	{
		AI_Output 			(self, other,"Info_HighPriest5_17_04"); //MASZ ZE SOB¥ POTÊ¯NY ORÊ¯!
		AI_Output 			(self, other,"Info_HighPriest5_17_05"); //POWSTRZYMAM CIÊ!

		AI_StopProcessInfos	(self);
		self.npctype 		= NPCTYPE_MAIN;

		Npc_SetAttitude 	(self, ATT_HOSTILE);
		Npc_SetTempAttitude (self, ATT_HOSTILE);	
	}
	else
	{
		AI_Output 			(self, other,"Info_HighPriest5_17_01"); //MUSISZ TUTAJ ZAWRÓCIÆ!
		AI_Output 			(self, other,"Info_HighPriest5_17_02"); //NIKT NIE MO¯E ZAK£ÓCIÆ SNU MEGO PANA!
		AI_Output 			(other, self,"Info_HighPriest5_15_03"); //Nie ma lekko! Budzimy ŒPIOCHA!
	
		AI_StopProcessInfos	(self);
	
		B_Story_EncounteredHighPriest();
	};
};

// *********************** HOHER PRIESTER ***********************
INSTANCE Info_HighPriest5FAILED (C_INFO)
{
	npc				= ORC_Priest_5;
	nr				= 2;
	condition		= Info_HighPriest5FAILED_Condition;
	information		= Info_HighPriest5FAILED_Info;
	important		= 1;
};                       

FUNC INT Info_HighPriest5FAILED_Condition()
{
	if 	Npc_KnowsInfo(hero, Info_HighPriest5)
	&&	(self.aivar[AIV_MISSION1] >= HighPriest_MaxHit)
	&&	!Npc_HasItems(hero, Mythrilklinge02)
	&&	!Npc_HasItems(hero, UrizielRune)
	{
		return TRUE;
	};
};

FUNC VOID Info_HighPriest5FAILED_Info()
{
	AI_Output			(other, self,"Info_HighPriest5FAILED_15_01"); //Cholera! Nie zadajê mu nawet najmniejszych obra¿eñ. Potrzebujê innej...
	AI_Output			(self, other,"Info_HighPriest5FAILED_17_02"); //TERAZ ZGINIESZ!
	AI_Output			(other, self,"Info_HighPriest5FAILED_15_03"); //Lepiej siê st¹d wynosiæ! I to zaraz!
	AI_RemoveWeapon		(other);
	AI_TurnAway			(other,	self);	
	
	self.npctype 		= NPCTYPE_MAIN;
	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	

	B_LogEntry			(CH4_EnterTemple,"Wygl¹da na to, ¿e Grash-Varrag-Arushat nie nale¿y do przeklêtych orkowych szamanów. Jest o wiele bardziej potê¿ny i ma broñ zdaje siê go nie imaæ! Potrzebujê potê¿niejszego orê¿a!");
	B_GiveXP			(XP_RetreatFromLastPriest);

	AI_StopProcessInfos	(self);
};
