func void B_Story_GornJoins()
{
	//-------- Missionsgegenstände --------
	CreateInvItem		(hero, ItKe_Freemine);
	
	//-------- Monster platziern --------
	Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE");
	Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE2");
	Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE3");
	//Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE3");
	Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE4");
	//Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE4");

	//-------- Tagesabläufe ändern --------
	var C_NPC gorn;	gorn = Hlp_GetNpc(PC_Fighter);	Npc_ExchangeRoutine(gorn,	"FollowToFMC");	
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_GornJoins);

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_UluMulu,"Gorn i ja mamy cichaczem odzyskaæ kontrolê nad Woln¹ Kopalni¹. Szczêœliwym zbiegiem okolicznoœci w³aœnie tam ma przebywaæ przyjaciel Ur-Shaka."); 
	
	//-------- globale Variable setzen --------
	gorn.aivar[AIV_PARTYMEMBER] = TRUE;
	Gorn_JoinedForFM = TRUE;
};
