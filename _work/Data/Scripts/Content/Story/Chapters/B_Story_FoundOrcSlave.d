//*****************************************************************************
//***			Der Spieler hat den Freund von Ur-Shak gefunden				***
//*****************************************************************************
func void B_Story_FoundOrcSlave()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_UluMulu,"Znalazłem przyjaciela Ur-Shaka w jednym z dolnych korytarzy Wolnej Kopalni. Nazywa się Tarrok. Jeśli szybko nie dostarczę mu jego lekarstwa, umrze w wyniku zatrucia. Orkowe lekarstwo ma się znajdować na którymś z niższych poziomów. Muszę się spieszyć!");

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcSlave);
	
	//-------- globale Variable setzen --------
	FreemineOrc_SuchePotion = LOG_RUNNING;
};
