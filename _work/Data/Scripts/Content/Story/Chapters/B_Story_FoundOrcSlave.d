//*****************************************************************************
//***			Der Spieler hat den Freund von Ur-Shak gefunden				***
//*****************************************************************************
func void B_Story_FoundOrcSlave()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_UluMulu,"Znalaz³em przyjaciela Ur-Shaka w jednym z dolnych korytarzy Wolnej Kopalni. Nazywa siê Tarrok. Jeœli szybko nie dostarczê mu jego lekarstwa, umrze w wyniku zatrucia. Orkowe lekarstwo ma siê znajdowaæ na którymœ z ni¿szych poziomów. Muszê siê spieszyæ!");

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcSlave);
	
	//-------- globale Variable setzen --------
	FreemineOrc_SuchePotion = LOG_RUNNING;
};
