func void B_Story_AccessToXardas()
{
	//-------- Missionsgegenst�nde --------
	CreateInvItem	(hero, ItArRuneTeleport3);

	//-------- Tagebucheintr�ge --------
	B_LogEntry		(CH4_FindXardas,"P�edal jsem str�ci d�mon� ji� t�i srdce golem�. V�m�nou jsem dostal magickou runu teleportace. Uvid�me, kdy p�ijde vhod.");

	//-------- Erfahrung --------
	B_GiveXP		(XP_DeliveredGolemhearts);

	//-------- Tagesabl�ufe �ndern --------
	
	//-------- globale Variable setzen --------
	FindGolemHearts = 4;
};
