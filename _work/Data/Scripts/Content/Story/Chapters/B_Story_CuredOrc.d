func void B_Story_CuredOrc()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_UluMulu,	"� ����� ����-���� ������� �������� �����, � �� ������, ��� ������ ��� ������.");

	//-------- Erfahrung --------
	B_GiveXP			(XP_CuredOrcSlave);

	//-------- Tarroks Fokusnamen �ndern --------
	var C_NPC tarrok;
	tarrok = Hlp_GetNpc(FreemineOrc);
	tarrok.name =	"������";
	
	//-------- globale Variable setzen --------
	FreemineOrc_SuchePotion 	= LOG_SUCCESS;
	FreemineOrc_LookingUlumulu 	= LOG_RUNNING;
	Knows_GetUluMulu 			= TRUE;
};