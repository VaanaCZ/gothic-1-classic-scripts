//*****************************************************************************
//***			Diese Funktion t�tet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheintr�ge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,"��� ���� ���� ���� �����. ����� ������. ������� ��������� ���, ��� � �������� ������� ����������� ���������� �����. ������ ����, ���������, ����� ������ �������� ����.");
	B_LogEntry			(CH4_FindXardas,"����������� ���, ��������� ��� ������ �������, ����� ��������� ����� ������� ������� ������. � ���������� ����� ����, ����� ������� � ������.");
	

	//-------- Missionsgegenst�nde --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};
