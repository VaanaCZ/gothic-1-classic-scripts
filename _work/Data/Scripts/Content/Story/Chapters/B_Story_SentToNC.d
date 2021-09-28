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
	//-------- Cor-Angar zur�ck zum �bungsplatz schicken --------
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

	//-------- Tagebucheintr�ge --------
	Log_CreateTopic		(CH3_EscapePlanNC,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_EscapePlanNC,	LOG_RUNNING);
	B_LogEntry			(CH3_EscapePlanNC,"Y'Berion nie �yje, niech jego dusza spoczywa w spokoju! W swych ostatnich s�owach duchowy przyw�dca Bractwa ca�� nadziej� na ocalenie kolonii pok�ada� w magach z Kr�gu Wody.");
	B_LogEntry			(CH3_EscapePlanNC,"Podj��em decyzj�. Udam si� do Nowego Obozu, by wesprze� Mag�w Wody. Cor Angar da� mi klucze do skrzyni w laboratorium Cor Kaloma. Tam ma si� znajdowa� znaleziony przeze mnie kamie� ogniskuj�cy wraz ze staro�ytnym almanachem. Cor Angar uwa�a, �e przy ich pomocy magowie z Nowego Obozu maj� szans� osi�gn�� sw�j cel.");

	//-------- Missionitem --------
	CreateInvItem		(self,			ItArRuneTeleport5);
	B_GiveInvItems		(self,	hero,	ItArRuneTeleport5,	1);

	//-------- globale Missionsvariable --------
	CorAngar_SendToNC = TRUE;
};
