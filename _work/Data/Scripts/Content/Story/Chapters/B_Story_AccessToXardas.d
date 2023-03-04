func void B_Story_AccessToXardas()
{
	//-------- Missionsgegenstände --------
	CreateInvItem	(hero, ItArRuneTeleport3);

	//-------- Tagebucheinträge --------
	B_LogEntry		(CH4_FindXardas,"J'ai apporté les trois coeurs de golem au garde démon. En échange j'ai reçu la rune magique de téléportation. Voyons voir où elle mène.");

	//-------- Erfahrung --------
	B_GiveXP		(XP_DeliveredGolemhearts);

	//-------- Tagesabläufe ändern --------
	
	//-------- globale Variable setzen --------
	FindGolemHearts = 4;
};
