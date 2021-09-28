//*****************************************************************************
//***		Initialisiert die Ork-Schamanen-Szene am Kastell				***
//*****************************************************************************
func void B_Story_FindOrcShaman()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_FindXardas,"Por fin me he encontrado con Xardas, pero la reuni�n ha sido muy distinta de lo que esperaba. No estaba interesado en absoluto en el mont�culo de mineral, pero me ha contado la primera parte de la historia del Durmiente. No s� qu� contarle a Saturas acerca del rumbo de la conversaci�n.");

	Log_CreateTopic		(CH4_FindOrcShaman,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_RUNNING);
	B_LogEntry			(CH4_FindOrcShaman,"Xardas quiere volver a ponerme a prueba. Para o�r la segunda parte de la historia del Durmiente, debo visitar al cham�n orco desterrado en las ruinas de un castillo. �ste se encuentra junto a un pico monta�oso situado al este de la torre de Xardas. No s� muy bien c�mo evitar que me lance bolas de fuego, pero ya pensar� en algo.");
	
		
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(ORC_2200_Shaman,	"CASTLE_06");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(StoneGolem,		"CASTLE_04");
	
	//-------- globale Variable setzen --------
	FindOrcShaman = LOG_RUNNING;
};
