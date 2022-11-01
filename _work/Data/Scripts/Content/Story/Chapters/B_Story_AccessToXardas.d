func void B_Story_AccessToXardas()
{
	//-------- Missionsgegenstände --------
	CreateInvItem	(hero, ItArRuneTeleport3);

	//-------- Tagebucheinträge --------
	B_LogEntry		(CH4_FindXardas,"Przekazałem trzy serca golemów demonowi, który w zamian podarował mi magiczną runę teleportacji. Ciekawe, dokąd mnie przeniesie?");

	//-------- Erfahrung --------
	B_GiveXP		(XP_DeliveredGolemhearts);

	//-------- Tagesabläufe ändern --------
	
	//-------- globale Variable setzen --------
	FindGolemHearts = 4;
};
