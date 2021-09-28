//*****************************************************************************
//***		Initialisiert die Ork-Schamanen-Szene am Kastell				***
//*****************************************************************************
func void B_Story_FindOrcShaman()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_FindXardas,"Kone�n� jsem se setkal s Xardasem. Setk�n� se v�ak v�bec nepodobalo tomu, co v�ichni o�ek�vali. Nem�l nejmen�� z�jem o rudnou haldu, ale vypr�v�l prvn� ��st Sp��ova p��b�hu. Nev�m, co Saturasovi o pr�b�hu tohoto rozhovoru pov�m.");

	Log_CreateTopic		(CH4_FindOrcShaman,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_RUNNING);
	B_LogEntry			(CH4_FindOrcShaman,"Xardas si m� cht�l znovu vyzkou�et. Abych si mohl vyslechnout druhou ��st Sp��ova p��b�hu, mus�m v rozvalin�ch chr�mu nav�t�vit vyho�t�n�ho sk�et�ho �amana. Nach�z� se bl�zko vrcholu kopce sm�rem na v�chod od Xardasovy v�e. Opravdu nem�m pon�t�, jak jej p�im�ju, aby po mn� nemetal ohniv� koule. N�co ale vymysl�m.");
	
		
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(ORC_2200_Shaman,	"CASTLE_06");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(StoneGolem,		"CASTLE_04");
	
	//-------- globale Variable setzen --------
	FindOrcShaman = LOG_RUNNING;
};
