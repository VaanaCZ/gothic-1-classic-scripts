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
	B_LogEntry			(CH3_EscapePlanNC,"Y´Berion, duchovní vůdce Bratrstva, je mrtev! Snad jeho duše odpočívá v pokoji. Podle jeho posledních slov vkládá veškeré naděje na vysvobození do rukou mágů Kruhu vody.");
	B_LogEntry			(CH3_EscapePlanNC,"Udělal jsem pevné rozhodnutí. Půjdu do Nového tábora, abych mágům Vody pomohl provést plán úniku. Cor Angar mi předal klíče od truhlice, která je v Cor Kalomově alchymistické dílně. Měl by v ní být ohniskový kámen a rukopis, které jsem získal při mém posledním úkolu. Cor Angar je přesvědčen, že mágové z Nového tábora budou tyto dva artefakty potřebovat pro dokončení svého plánu.");

	//-------- Missionitem --------
	CreateInvItem		(self,			ItArRuneTeleport5);
	B_GiveInvItems		(self,	hero,	ItArRuneTeleport5,	1);

	//-------- globale Missionsvariable --------
	CorAngar_SendToNC = TRUE;
};
