func void B_Story_FoundUrShak()
{
	//-------- Missionsgegenst�nde --------
	

	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_FindOrcShaman,	"� ���� ����-������ �� ����� ��-��� �� ��� ���������. �� ��� �� ��������� ��� ��� ������� � ������. ������ � ���� ��������� � �������� � �������� ��� ��� �������.");

	Log_CreateTopic		(CH4_UluMulu,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_UluMulu,		LOG_RUNNING);
	B_LogEntry			(CH4_UluMulu,		"��-���, ��������� �����, ������ ��� ������������ ������ ������ ����� ����� ����� � ����� ������� ���, ����� ��� �� ���� �� ������. ��� ����� ���-����, ��������� �������, ������� ������ ������ ������ � �����. ���� ��-����, ������� ��� ������ ������ � ��������� � �����, ����� ������� ��� ����� ����."); 

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcShaman);

	//-------- Tagesabl�ufe �ndern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};