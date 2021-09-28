//#####################################################################
//##
//##							KAPITEL 3
//##							=========
//##	Der Spieler wurde von Cor Angar zu den Wassermagiern ins
//##	Neue Lager geschickt.
//##
//#####################################################################

func void B_Story_SentToNC()
{
	//-------- Cor-Angar zurück zum Übungsplatz schicken --------
	var C_NPC	angar;
	angar = Hlp_GetNpc	(Gur_1202_CorAngar);
	Npc_ExchangeRoutine	(angar, "start");

	//-------- Y-Berion --------
	var C_NPC	yberion;
	yberion = Hlp_GetNpc(Gur_1200_YBerion);
	Npc_ExchangeRoutine	(yberion, "dead");

	//-------- Gorn platzieren --------
	var C_NPC	gorn;
	gorn = Hlp_GetNpc	(PC_FIGHTER);
	PrintDebugNpc		(PD_MISSION,	gorn.name);
	Npc_ExchangeRoutine	(gorn, "NCWAIT");
	AI_ContinueRoutine	(gorn);

	//-------- Tagebucheinträge --------
	Log_CreateTopic		(CH3_EscapePlanNC,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_EscapePlanNC,	LOG_RUNNING);
	B_LogEntry			(CH3_EscapePlanNC,"Y'Berion, el líder espiritual de la Hermandad, ¡está muerto! Que su alma descanse en paz. En sus última palabras, puso todas sus esperanzas de huida en manos de los Magos del Círculo del Agua.");
	B_LogEntry			(CH3_EscapePlanNC,"Me he decidido. Iré al Campamento Nuevo a apoyar el plan de fuga de los Magos de los Magos del Agua. Cor Angar me ha entregado las llaves del cofre que hay en el laboratorio de alquimia de Cor Kalom. Se supone que el foco de piedra y el almanaque de mis búsquedas previas están en el interior de ese cofre. Cor Angar cree que los magos del Campamento Nuevo necesitarán estos dos artefactos para llevar a cabo su plan.");

	//-------- Missionitem --------
	CreateInvItem		(self,			ItArRuneTeleport5);
	B_GiveInvItems		(self,	hero,	ItArRuneTeleport5,	1);

	//-------- globale Missionsvariable --------
	CorAngar_SendToNC = TRUE;
};
