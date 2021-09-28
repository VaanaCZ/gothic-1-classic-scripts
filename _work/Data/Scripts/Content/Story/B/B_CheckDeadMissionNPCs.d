func void B_CheckDeadMissionNPCs ()
//Diese Funktion checkt im ZS_Dead, ob eine Mission durch den Tot eines NSCs obsolet geworden ist.
{
	if (Hlp_GetInstanceID(Org_844_Lefty) ==  Hlp_GetInstanceID(self))
	{
		if (Lefty_Mission == LOG_RUNNING)
		{
			B_LogEntry	(CH1_CarryWater,	"Ahora que Lefty está muerto, el asunto del agua ha terminado. Nunca me había gustado ese tipo.");
			Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
			LeftyDead = TRUE;
		};
	};
};


			