func void B_Story_AccessToXardas()
{
	//-------- Missionsgegenstände --------
	CreateInvItem	(hero, ItArRuneTeleport3);

	//-------- Tagebucheinträge --------
	B_LogEntry		(CH4_FindXardas,"Ho portato tutti e tre i cuori dei golem al demone di guardia. In cambio, ho ricevuto la runa magica di teletrasporto. Vediamo dove mi porta.");

	//-------- Erfahrung --------
	B_GiveXP		(XP_DeliveredGolemhearts);

	//-------- Tagesabläufe ändern --------
	
	//-------- globale Variable setzen --------
	FindGolemHearts = 4;
};
