func void B_Story_AccessToXardas()
{
	//-------- Missionsgegenst�nde --------
	CreateInvItem	(hero, ItArRuneTeleport3);

	//-------- Tagebucheintr�ge --------
	B_LogEntry		(CH4_FindXardas,	"� ����� ������ ���� ���� ������� � ����� �� ������-���������. ������ �� ��� ��� ���� ������������. ���������, ���� ��� ���� ���������.");

	//-------- Erfahrung --------
	B_GiveXP		(XP_DeliveredGolemhearts);

	//-------- Tagesabl�ufe �ndern --------
	
	//-------- globale Variable setzen --------
	FindGolemHearts = 4;
};