func void B_Story_ReturnedFromUrShak()
{
	//-------- Missionsgegenst�nde --------
	

	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_FindOrcShaman,	"�������, �������� ����������� �������, ������������ ��-�����. ������ � ������ ����� � ��������� �����, ����� ����� ����� ��-����.");
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_SUCCESS);

	Log_CreateTopic		(CH4_EnterTemple,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_RUNNING);
	B_LogEntry			(CH4_EnterTemple,	"� �������, ��� ����� �������. � �������� ���, ����� �� ����� ��� ��������� ������. �� ��������� ��� ���� ������, ������� �������� ����� �� ������ � ������ �����. �� ���������� ����� ���� � ��������� ���� �������."); 

	//-------- Erfahrung --------
	B_GiveXP		(XP_ReturnedFromUrShak);

	//-------- Tagesabl�ufe �ndern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};