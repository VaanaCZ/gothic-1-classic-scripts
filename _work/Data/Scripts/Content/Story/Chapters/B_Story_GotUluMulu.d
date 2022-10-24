func void B_Story_GotUluMulu()
{
	//-------- Missionsgegenstдnde --------
	CreateInvItem		(hero, UluMulu);
	
	//-------- Tagebucheintrдge --------
	B_LogEntry			(CH4_UluMulu,	"У меня все получилось. Я принес Тарроку то, что он просил, и он сделал мне Улу-Мулу. Надеюсь, орки действительно уважают традиции и не трогают тех, кто носит этот знак.");
	Log_SetTopicStatus	(CH4_UluMulu,	LOG_SUCCESS);
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_GotUluMulu);

	//-------- globale Variable setzen --------
	FreemineOrc_LookingUlumulu = LOG_SUCCESS;
};