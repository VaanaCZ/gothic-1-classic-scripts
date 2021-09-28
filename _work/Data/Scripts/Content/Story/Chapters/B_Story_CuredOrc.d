func void B_Story_CuredOrc()
{
	//-------- Missionsgegenstдnde --------
	
	//-------- Tagebucheintrдge --------
	B_LogEntry			(CH4_UluMulu,"С той поры как я вылечил орочьего раба Таррока, он оказывает мне неоценимую помощь.");

	//-------- Erfahrung --------
	B_GiveXP			(XP_CuredOrcSlave);

	//-------- Tarroks Fokusnamen дndern --------
	var C_NPC tarrok;
	tarrok = Hlp_GetNpc(FreemineOrc);
	tarrok.name =	"Tarrok";
	
	//-------- globale Variable setzen --------
	FreemineOrc_SuchePotion 	= LOG_SUCCESS;
	FreemineOrc_LookingUlumulu 	= LOG_RUNNING;
	Knows_GetUluMulu 			= TRUE;
};
