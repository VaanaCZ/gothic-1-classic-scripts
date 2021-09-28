//*****************************************************************************
//***		Initialisiert die Ork-Schamanen-Szene am Kastell				***
//*****************************************************************************
func void B_Story_FindOrcShaman()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindXardas,"Por fin me he encontrado con Xardas, pero la reunión ha sido muy distinta de lo que esperaba. No estaba interesado en absoluto en el montículo de mineral, pero me ha contado la primera parte de la historia del Durmiente. No sé qué contarle a Saturas acerca del rumbo de la conversación.");

	Log_CreateTopic		(CH4_FindOrcShaman,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_RUNNING);
	B_LogEntry			(CH4_FindOrcShaman,"Xardas quiere volver a ponerme a prueba. Para oír la segunda parte de la historia del Durmiente, debo visitar al chamán orco desterrado en las ruinas de un castillo. Éste se encuentra junto a un pico montañoso situado al este de la torre de Xardas. No sé muy bien cómo evitar que me lance bolas de fuego, pero ya pensaré en algo.");
	
		
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(ORC_2200_Shaman,	"CASTLE_06");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(StoneGolem,		"CASTLE_04");
	
	//-------- globale Variable setzen --------
	FindOrcShaman = LOG_RUNNING;
};
