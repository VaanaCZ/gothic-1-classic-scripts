//*****************************************************************************
//***			Der Spieler hat den Freund von Ur-Shak gefunden				***
//*****************************************************************************
func void B_Story_FoundOrcSlave()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_UluMulu,"Ve spodní štole Svobodného dolu jsem se setkal s jedním pøítelem Ur-Shaka. Jmenoval se Tarrok. Je otráven a okamžitì potøebuje lahvièku speciálního skøetího léku, kterou ztratil pøi útìku. Je nìkde ve spodních štolách dolu. Musím ji najít, jinak zemøe.");

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcSlave);
	
	//-------- globale Variable setzen --------
	FreemineOrc_SuchePotion = LOG_RUNNING;
};
