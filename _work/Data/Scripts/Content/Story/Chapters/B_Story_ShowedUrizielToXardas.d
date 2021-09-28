func void B_Story_ShowedUrizielToXardas()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_EnterTemple,"Xardas se ha mostrado muy sorprendido de que haya logrado entrar en el templo subterr�neo. Seg�n parece, piensa que soy el icono de una antigua profec�a orca.");
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH5_Uriziel,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_RUNNING);
	B_LogEntry			(CH5_Uriziel,"Xardas ha identificado la extra�a espada que he encontrado en el templo del Durmiente como URIZIEL. Se supone que la antigua hoja tuvo inmensos poderes, pero con el transcurso de los a�os ha perdido su energ�a m�gica. Necesito encontrar una manera de devolver al arma sus viejos poderes.");
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_ShowUrizielToXardas);
};
