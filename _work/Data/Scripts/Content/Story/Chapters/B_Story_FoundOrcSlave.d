//*****************************************************************************
//***			Der Spieler hat den Freund von Ur-Shak gefunden				***
//*****************************************************************************
func void B_Story_FoundOrcSlave()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_UluMulu,"J'ai rencontré l'ami de Ur-Shak dans une des galeries inférieures de la mine Libre. Il s'appelle Tarrok. Il est empoisonné, et a rapidement besoin d'une bouteille spéciale de médecine Orc qu'il a perdu dans sa fuite. Elle est quelque part dans les galeries inférieures de la mine. Je dois la trouver ou il est mort.");

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcSlave);
	
	//-------- globale Variable setzen --------
	FreemineOrc_SuchePotion = LOG_RUNNING;
};
