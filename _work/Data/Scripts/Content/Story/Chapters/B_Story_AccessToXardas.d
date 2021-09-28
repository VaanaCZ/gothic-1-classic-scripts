func void B_Story_AccessToXardas()
{
	//-------- Missionsgegenstände --------
	CreateInvItem	(hero, ItArRuneTeleport3);

	//-------- Tagebucheinträge --------
	B_LogEntry		(CH4_FindXardas,"Le he entregado los tres corazones de gólem al guardia demonio. A cambio, he recibido la runa mágica de teletransporte. Veamos a dónde me lleva.");

	//-------- Erfahrung --------
	B_GiveXP		(XP_DeliveredGolemhearts);

	//-------- Tagesabläufe ändern --------
	
	//-------- globale Variable setzen --------
	FindGolemHearts = 4;
};
