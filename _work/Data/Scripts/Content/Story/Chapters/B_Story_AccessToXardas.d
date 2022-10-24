func void B_Story_AccessToXardas()
{
	//-------- Missionsgegenstдnde --------
	CreateInvItem	(hero, ItArRuneTeleport3);

	//-------- Tagebucheintrдge --------
	B_LogEntry		(CH4_FindXardas,	"Я нашел сердца всех трех големов и отдал их демону-охраннику. Взамен он дал мне Руну Телепортации. Посмотрим, куда она меня перенесет.");

	//-------- Erfahrung --------
	B_GiveXP		(XP_DeliveredGolemhearts);

	//-------- Tagesablдufe дndern --------
	
	//-------- globale Variable setzen --------
	FindGolemHearts = 4;
};