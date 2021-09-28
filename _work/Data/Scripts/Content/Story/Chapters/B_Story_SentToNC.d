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
	B_LogEntry			(CH3_EscapePlanNC,"Y�Berion, duchovn� v�dce Bratrstva, je mrtev! Snad jeho du�e odpo��v� v pokoji. Podle jeho posledn�ch slov vkl�d� ve�ker� nad�je na vysvobozen� do rukou m�g� Kruhu vody.");
	B_LogEntry			(CH3_EscapePlanNC,"Ud�lal jsem pevn� rozhodnut�. P�jdu do Nov�ho t�bora, abych m�g�m Vody pomohl prov�st pl�n �niku. Cor Angar mi p�edal kl��e od truhlice, kter� je v Cor Kalomov� alchymistick� d�ln�. M�l by v n� b�t ohniskov� k�men a rukopis, kter� jsem z�skal p�i m�m posledn�m �kolu. Cor Angar je p�esv�d�en, �e m�gov� z Nov�ho t�bora budou tyto dva artefakty pot�ebovat pro dokon�en� sv�ho pl�nu.");

	//-------- Missionitem --------
	CreateInvItem		(self,			ItArRuneTeleport5);
	B_GiveInvItems		(self,	hero,	ItArRuneTeleport5,	1);

	//-------- globale Missionsvariable --------
	CorAngar_SendToNC = TRUE;
};
