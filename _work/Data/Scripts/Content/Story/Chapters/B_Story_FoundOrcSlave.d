//*****************************************************************************
//***			Der Spieler hat den Freund von Ur-Shak gefunden				***
//*****************************************************************************
func void B_Story_FoundOrcSlave()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_UluMulu,"Me he reunido con el amigo de Ur-Shak en uno de los t�neles inferiores de la Mina Libre. Se llama Tarrok. Est� envenenado, y necesita urgentemente una botella de una medicina orca especial que perdi� al fugarse. Se encuentra en alguna parte de los t�neles inferiores de la mina. Tengo que encontrarla o morir�.");

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcSlave);
	
	//-------- globale Variable setzen --------
	FreemineOrc_SuchePotion = LOG_RUNNING;
};
