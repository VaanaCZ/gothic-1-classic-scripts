func void B_Story_GornJoins()
{
	//-------- Missionsgegenst�nde --------
	CreateInvItem		(hero, ItKe_Freemine);
	
	//-------- Monster platziern --------
	Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE");
	Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE2");
	Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE3");
	//Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE3");
	Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE4");
	//Wld_InsertNpc		(Razor,	"OW_PATH_3001_MOVE4");

	//-------- Tagesabl�ufe �ndern --------
	var C_NPC gorn;	gorn = Hlp_GetNpc(PC_Fighter);	Npc_ExchangeRoutine(gorn,	"FollowToFMC");	
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_GornJoins);

	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_UluMulu,"P�edpokl�d� se, �e tajnou operac� s Gornem z�sk�me Svobodn� d�l zp�t. Skute�nost, �e je zde sk�et� Ur-Shak�v p��tel, je p�edzv�st toho, �e se karta obrac�."); 
	
	//-------- globale Variable setzen --------
	gorn.aivar[AIV_PARTYMEMBER] = TRUE;
	Gorn_JoinedForFM = TRUE;
};
