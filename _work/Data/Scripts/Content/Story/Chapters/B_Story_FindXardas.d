//*****************************************************************************
//***			Diese Funktion t�tet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheintr�ge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,"Despu�s de que los Magos del Fuego hayan sido asesinados, s�lo queda UNO que pueda ayudarme con la explosi�n del mont�culo de mineral. Saturas me dijo que la creaci�n de la Barrera M�gica fue liderada por un decimotercer mago.");
	B_LogEntry			(CH4_FindXardas,"Este decimotercer mago, llamado Xardas, lleva una vida solitaria en una torre situada justo en el centro de la tierra de los orcos. He aceptado ir all� y pedir ayuda.");
	

	//-------- Missionsgegenst�nde --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};
