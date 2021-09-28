func void B_Story_CuredOrc()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_UluMulu,"Když jsem pøinesl skøetímu otrokovi Tarrokovi jeho lék, ukázal se mi být velmi prospìšným.");

	//-------- Erfahrung --------
	B_GiveXP			(XP_CuredOrcSlave);

	//-------- Tarroks Fokusnamen ändern --------
	var C_NPC tarrok;
	tarrok = Hlp_GetNpc(FreemineOrc);
	tarrok.name =	"Tarrok";
	
	//-------- globale Variable setzen --------
	FreemineOrc_SuchePotion 	= LOG_SUCCESS;
	FreemineOrc_LookingUlumulu 	= LOG_RUNNING;
	Knows_GetUluMulu 			= TRUE;
};
