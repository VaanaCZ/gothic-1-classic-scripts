//*****************************************************************************
//***			Der Spieler hat den Freund von Ur-Shak gefunden				***
//*****************************************************************************
func void B_Story_FoundOrcSlave()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_UluMulu,"Me he reunido con el amigo de Ur-Shak en uno de los túneles inferiores de la Mina Libre. Se llama Tarrok. Está envenenado, y necesita urgentemente una botella de una medicina orca especial que perdió al fugarse. Se encuentra en alguna parte de los túneles inferiores de la mina. Tengo que encontrarla o morirá.");

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcSlave);
	
	//-------- globale Variable setzen --------
	FreemineOrc_SuchePotion = LOG_RUNNING;
};
