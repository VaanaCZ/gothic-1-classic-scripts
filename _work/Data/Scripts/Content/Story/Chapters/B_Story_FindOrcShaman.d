//*****************************************************************************
//***		Initialisiert die Ork-Schamanen-Szene am Kastell				***
//*****************************************************************************
func void B_Story_FindOrcShaman()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindXardas,"Nareszcie spotka³em Xardasa Nekromantê! Nasza rozmowa okaza³a siê niezwykle interesuj¹ca - Xardas wyra¿a siê sceptycznie o szansach powodzenia przedsiêwziêcia Nowego Obozu. Za to opowiedzia³ mi pierwsz¹ czêœæ historii zwi¹zanej ze Œni¹cym. Nie bardzo wiem, co mam powiedzieæ Saturasowi...");

	Log_CreateTopic		(CH4_FindOrcShaman,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_RUNNING);
	B_LogEntry			(CH4_FindOrcShaman,"Xardas postanowi³ jeszcze raz mnie wypróbowaæ. Aby poznaæ drug¹ czêœæ dziejów Œni¹cego, mam odnaleŸæ wypêdzonego szamana orków, ukrywaj¹cego siê w ruinach zamku, tu¿ obok szczytu, na którym wznosi siê wie¿a Nekromanty. Nie wiem tylko, jak mogê sk³oniæ potê¿nego nieprzyjaciela do rozmowy. Mo¿e wymyœlê coœ po drodze.");
	
		
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(ORC_2200_Shaman,	"CASTLE_06");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(StoneGolem,		"CASTLE_04");
	
	//-------- globale Variable setzen --------
	FindOrcShaman = LOG_RUNNING;
};
