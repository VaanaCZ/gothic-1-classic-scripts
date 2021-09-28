//*****************************************************************************
//***			Der Spieler hat den Freund von Ur-Shak gefunden				***
//*****************************************************************************
func void B_Story_FoundOrcSlave()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_UluMulu,"Ho incontrato l'amico di Ur-Shak, in uno dei tunnel più profondi della miniera libera. Si chiama Tarrok ed è stato avvelenato: ha bisogno urgente di un fiasco contenente una speciale medicina degli orchi che ha perso durante la fuga. Devo trovarla o morirà.");

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcSlave);
	
	//-------- globale Variable setzen --------
	FreemineOrc_SuchePotion = LOG_RUNNING;
};
