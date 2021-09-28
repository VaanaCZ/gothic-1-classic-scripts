func void B_Story_GornJoins()
{
	//-------- Missionsgegenstдnde --------
	CreateInvItem		(hero, ItKe_Freemine);
	
	//-------- Monster platziern --------
	Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE");
	Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE2");
	Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE3");
	//Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE3");
	Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE4");
	//Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE4");

	//-------- Tagesablдufe дndern --------
	var C_NPC gorn;	gorn = Hlp_GetNpc(PC_Fighter);	Npc_ExchangeRoutine(gorn,	"FollowToFMC");	
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_GornJoins);

	//-------- Tagebucheintrдge --------
	B_LogEntry			(CH4_UluMulu,"Горн и я должны отбить свободную шахту, проведя операцию. То, что друг Ур-Шака содержится как раз там, можно счесть за благосклонность судьбы."); 
	
	//-------- globale Variable setzen --------
	gorn.aivar[AIV_PARTYMEMBER] = TRUE;
	Gorn_JoinedForFM = TRUE;
};
