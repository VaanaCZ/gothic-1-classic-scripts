//*****************************************************************************
//***			Diese Funktion tötet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheinträge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,"Después de que los Magos del Fuego hayan sido asesinados, sólo queda UNO que pueda ayudarme con la explosión del montículo de mineral. Saturas me dijo que la creación de la Barrera Mágica fue liderada por un decimotercer mago.");
	B_LogEntry			(CH4_FindXardas,"Este decimotercer mago, llamado Xardas, lleva una vida solitaria en una torre situada justo en el centro de la tierra de los orcos. He aceptado ir allí y pedir ayuda.");
	

	//-------- Missionsgegenstände --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};
