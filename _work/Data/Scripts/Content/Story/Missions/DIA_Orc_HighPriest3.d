
// *********************** PRIESTER 3 ***********************

INSTANCE Info_HighPriest3 (C_INFO)
{
	npc			= ORC_Priest_3;
	nr			= 1;
	condition	= Info_HighPriest3_Condition;
	information	= Info_HighPriest3_Info;
	important	= 1;
};                       

FUNC INT Info_HighPriest3_Condition()
{
	return 1;
};

FUNC VOID Info_HighPriest3_Info()
{
	B_SelectWeapon		(self, other);
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	
	AI_Output			(self, other,"Info_HighPriest3_17_01"); //SMMRRRTEEELLNNÍÍÍÍKKÙÙÙÙÙ!
	AI_Output			(self, other,"Info_HighPriest3_17_02"); //TVÁÁÁÁ CEESTAAA KOONÈÍÍÍ TAADYYY UU MÌÌÌ!!
	AI_Output 			(other, self,"Info_HighPriest3_15_03"); //Nejdøív pošlu na cestu já tebe, ty zatuchlá utkvìlá pøedstavo ráje!

	B_LogEntry			(CH4_EnterTemple,"Varrag-Unhilqt, jeden z pìti Spáèových šamanù, stojí pøede mnou. Jen jeden z nás vyjde z této komnaty živý!");

	AI_StopProcessInfos	(self);
	
	Npc_SetAttitude		(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);
};

