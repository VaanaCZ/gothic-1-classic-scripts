func void B_Story_AccessToXardas()
{
	//-------- Missionsgegenstände --------
	CreateInvItem	(hero, ItArRuneTeleport3);

	//-------- Tagebucheinträge --------
	B_LogEntry		(CH4_FindXardas,"Pøedal jsem strážci démonù již tøi srdce golemù. Výmìnou jsem dostal magickou runu teleportace. Uvidíme, kdy pøijde vhod.");

	//-------- Erfahrung --------
	B_GiveXP		(XP_DeliveredGolemhearts);

	//-------- Tagesabläufe ändern --------
	
	//-------- globale Variable setzen --------
	FindGolemHearts = 4;
};
