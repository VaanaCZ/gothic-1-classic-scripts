func void B_Story_ShowedUrizielToXardas()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_EnterTemple,	"�������� ����� ������� ��, ��� � ���� ������� � ��������� ����. ������ �� ������� ���� ������ �� ������-�� �������� �������� �����������.");
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH5_Uriziel,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_RUNNING);
	B_LogEntry			(CH5_Uriziel,	"������� ����� �������� ���, ������� � ����� � ����� �������. �� ������ ��� �������. ��� ������� ������ �����-�� �������� ����������� �����. �� �� �������� ��� �������� ��. � ������ ����� ������ ������������ ���.");
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_ShowUrizielToXardas);
};