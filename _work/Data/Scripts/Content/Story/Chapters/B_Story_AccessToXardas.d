func void B_Story_AccessToXardas()
{
	//-------- Missionsgegenstдnde --------
	CreateInvItem	(hero, ItArRuneTeleport3);

	//-------- Tagebucheintrдge --------
	B_LogEntry		(CH4_FindXardas,"Я передал все три сердца големов демону-охраннику. В обмен получил магическую руну портала. Надо проверить, куда она меня приведет.");

	//-------- Erfahrung --------
	B_GiveXP		(XP_DeliveredGolemhearts);

	//-------- Tagesablдufe дndern --------
	
	//-------- globale Variable setzen --------
	FindGolemHearts = 4;
};
