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
		AI_Output 			(self, other,"Info_HighPriest5_17_04"); //””” “≈≈≈Ѕяяя ≈≈≈—“№ ћќќќўЌќ≈≈≈ ќ–”””∆»≈≈≈!!!
		AI_Output 			(self, other,"Info_HighPriest5_17_05"); //яяяя ќ—“јјјЌќ¬Ћёёё “≈≈≈Ѕяя!!!

		AI_StopProcessInfos	(self);
		self.npctype 		= NPCTYPE_MAIN;

		Npc_SetAttitude 	(self, ATT_HOSTILE);
		Npc_SetTempAttitude (self, ATT_HOSTILE);	
	}
	else
	{
		AI_Output 			(self, other,"Info_HighPriest5_17_01"); //“џџџ ƒќќќЋ∆≈Ќ ѕќ¬≈–Ќ”””“№ Ќј«јјјјƒ!!!
		AI_Output 			(self, other,"Info_HighPriest5_17_02"); //Ќ»»» “ќќќ Ќ≈ —ћ≈≈≈≈≈≈“ “–≈≈≈¬ќ∆»»»»“№ —ќќќќЌ ћќ≈≈≈≈√ќ ѕќќќќ¬≈Ћ»»»»“≈Ћя!!!
		AI_Output 			(other, self,"Info_HighPriest5_15_03"); //ќшибочка: ваш —ѕяў»… очень скоро проснетс€!
	
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
	AI_Output			(other, self,"Info_HighPriest5FAILED_15_01"); //„ерт! Ќа нем ни царапины! Ќужен другой...
	AI_Output			(self, other,"Info_HighPriest5FAILED_17_02"); //“≈≈≈ѕ≈≈≈–№ “џџџ ”ћ–≈≈≈Ў№!!!
	AI_Output			(other, self,"Info_HighPriest5FAILED_15_03"); //ѕора убиратьс€ отсюда, да побыстрее!
	AI_RemoveWeapon		(other);
	AI_TurnAway			(other,	self);	
	
	self.npctype 		= NPCTYPE_MAIN;
	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	

	B_LogEntry			(CH4_EnterTemple,"√раш-¬арраг-јрушат, очевидно, не из числа обычных орочьих шаманов. ќн гораздо сильнее, а мое оружие просто не способно ему повредить. ћне нужно найти более могущественное оружие!");
	B_GiveXP			(XP_RetreatFromLastPriest);

	AI_StopProcessInfos	(self);
};
