//*****************************************************************************
//***		Initialisiert die Ork-Schamanen-Szene am Kastell				***
//*****************************************************************************
func void B_Story_FindOrcShaman()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindXardas,"Nareszcie spotkałem Xardasa Nekromantę! Nasza rozmowa okazała się niezwykle interesująca - Xardas wyraża się sceptycznie o szansach powodzenia przedsięwzięcia Nowego Obozu. Za to opowiedział mi pierwszą część historii związanej ze Śniącym. Nie bardzo wiem, co mam powiedzieć Saturasowi...");

	Log_CreateTopic		(CH4_FindOrcShaman,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_RUNNING);
	B_LogEntry			(CH4_FindOrcShaman,"Xardas postanowił jeszcze raz mnie wypróbować. Aby poznać drugą część dziejów Śniącego, mam odnaleźć wypędzonego szamana orków, ukrywającego się w ruinach zamku, tuż obok szczytu, na którym wznosi się wieża Nekromanty. Nie wiem tylko, jak mogę skłonić potężnego nieprzyjaciela do rozmowy. Może wymyślę coś po drodze.");
	
		
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(ORC_2200_Shaman,	"CASTLE_06");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(StoneGolem,		"CASTLE_04");
	
	//-------- globale Variable setzen --------
	FindOrcShaman = LOG_RUNNING;
};
