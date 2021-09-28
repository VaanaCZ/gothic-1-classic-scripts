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
	B_LogEntry			(CH3_EscapePlanNC,"Y'Berion, la guida spirituale della Fratellanza, è morto! Che la sua anima possa riposare in pace. Nelle sue ultime parole, ha riposto tutte le speranze di fuga nei maghi del Circolo dell'Acqua.");
	B_LogEntry			(CH3_EscapePlanNC,"Ho cambiato idea. Tornerò a Campo Nuovo e aiuterò i Maghi dell'Acqua nel loro piano di fuga. Cor Angar mi ha dato le chiave di uno scrigno, che si trova nel laboratorio alchemico di Cor Kalom. Lì dovrebbero trovarsi la pietra focalizzatrice e l'almanacco, che avevo recuperato nella missione precedente. Cor Angar ritiene che i maghi di Campo Nuovo abbiano bisogno di questi due manufatti per portare a termine il piano.");

	//-------- Missionitem --------
	CreateInvItem		(self,			ItArRuneTeleport5);
	B_GiveInvItems		(self,	hero,	ItArRuneTeleport5,	1);

	//-------- globale Missionsvariable --------
	CorAngar_SendToNC = TRUE;
};
