func void B_Story_AccessToXardas()
{
	//-------- Missionsgegenst�nde --------
	CreateInvItem	(hero, ItArRuneTeleport3);

	//-------- Tagebucheintr�ge --------
	B_LogEntry		(CH4_FindXardas,"Le he entregado los tres corazones de g�lem al guardia demonio. A cambio, he recibido la runa m�gica de teletransporte. Veamos a d�nde me lleva.");

	//-------- Erfahrung --------
	B_GiveXP		(XP_DeliveredGolemhearts);

	//-------- Tagesabl�ufe �ndern --------
	
	//-------- globale Variable setzen --------
	FindGolemHearts = 4;
};
