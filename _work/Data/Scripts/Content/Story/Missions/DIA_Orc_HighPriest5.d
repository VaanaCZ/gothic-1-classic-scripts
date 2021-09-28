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
		AI_Output 			(self, other,"Info_HighPriest5_17_04"); //TYYY m� MOOCNOOUU ZBRAAA�!!!
		AI_Output 			(self, other,"Info_HighPriest5_17_05"); //J��� T�� ZAASTAAV���M!!!

		AI_StopProcessInfos	(self);
		self.npctype 		= NPCTYPE_MAIN;

		Npc_SetAttitude 	(self, ATT_HOSTILE);
		Npc_SetTempAttitude (self, ATT_HOSTILE);	
	}
	else
	{
		AI_Output 			(self, other,"Info_HighPriest5_17_01"); //MUUS��͊� SEE VR���TIIT ZP���TKYY!!!
		AI_Output 			(self, other,"Info_HighPriest5_17_02"); //NIIIKDOOO NEESM��� VYYRUU�OOVAAT P���NAAA VEE SP���NKUUU!!!
		AI_Output 			(other, self,"Info_HighPriest5_15_03"); //Chyba, tv�j SP�� bude brzy probuzen.
	
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
	AI_Output			(other, self,"Info_HighPriest5FAILED_15_01"); //Sakra! Nechci zp�sobit sebemen�� �kodu! Pot�ebuju n�co jin�ho...
	AI_Output			(self, other,"Info_HighPriest5FAILED_17_02"); //NYYN��I ZEEM�EE�!!!
	AI_Output			(other, self,"Info_HighPriest5FAILED_15_03"); //Rad�ji odtud co nejrychleji vypadnu!
	AI_RemoveWeapon		(other);
	AI_TurnAway			(other,	self);	
	
	self.npctype 		= NPCTYPE_MAIN;
	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	

	B_LogEntry			(CH4_EnterTemple,"Grash-Varrat-Arushat z�ejm� nepat�� k nemrtv�m sk�et�m �aman�m. Je daleko siln�j�� a m� zbran� mu nedok�ou ubl�it. Pot�ebuji daleko siln�j�� zbra�!");
	B_GiveXP			(XP_RetreatFromLastPriest);

	AI_StopProcessInfos	(self);
};
