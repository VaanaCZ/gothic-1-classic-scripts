//*****************************************************************************
//***			Der Spieler hat den Freund von Ur-Shak gefunden				***
//*****************************************************************************
func void B_Story_FoundOrcSlave()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_UluMulu,"Ve spodn� �tole Svobodn�ho dolu jsem se setkal s jedn�m p��telem Ur-Shaka. Jmenoval se Tarrok. Je otr�ven a okam�it� pot�ebuje lahvi�ku speci�ln�ho sk�et�ho l�ku, kterou ztratil p�i �t�ku. Je n�kde ve spodn�ch �tol�ch dolu. Mus�m ji naj�t, jinak zem�e.");

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcSlave);
	
	//-------- globale Variable setzen --------
	FreemineOrc_SuchePotion = LOG_RUNNING;
};
