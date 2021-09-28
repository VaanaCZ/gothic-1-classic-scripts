//*****************************************************************************
//***		Initialisiert die Ork-Schamanen-Szene am Kastell				***
//*****************************************************************************
func void B_Story_FindOrcShaman()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_FindXardas,"Nareszcie spotka�em Xardasa Nekromant�! Nasza rozmowa okaza�a si� niezwykle interesuj�ca - Xardas wyra�a si� sceptycznie o szansach powodzenia przedsi�wzi�cia Nowego Obozu. Za to opowiedzia� mi pierwsz� cz�� historii zwi�zanej ze �ni�cym. Nie bardzo wiem, co mam powiedzie� Saturasowi...");

	Log_CreateTopic		(CH4_FindOrcShaman,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_RUNNING);
	B_LogEntry			(CH4_FindOrcShaman,"Xardas postanowi� jeszcze raz mnie wypr�bowa�. Aby pozna� drug� cz�� dziej�w �ni�cego, mam odnale�� wyp�dzonego szamana ork�w, ukrywaj�cego si� w ruinach zamku, tu� obok szczytu, na kt�rym wznosi si� wie�a Nekromanty. Nie wiem tylko, jak mog� sk�oni� pot�nego nieprzyjaciela do rozmowy. Mo�e wymy�l� co� po drodze.");
	
		
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(ORC_2200_Shaman,	"CASTLE_06");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(StoneGolem,		"CASTLE_04");
	
	//-------- globale Variable setzen --------
	FindOrcShaman = LOG_RUNNING;
};
