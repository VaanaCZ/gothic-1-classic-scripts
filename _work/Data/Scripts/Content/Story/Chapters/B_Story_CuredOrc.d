func void B_Story_CuredOrc()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_UluMulu,"Desde que recuperé la medicina especial para el esclavo orco Tarrok, éste ha sido de mucha ayuda.");

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
