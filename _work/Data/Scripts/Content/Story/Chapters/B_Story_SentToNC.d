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
	B_LogEntry			(CH3_EscapePlanNC,"Y'Berion nie ¿yje, niech jego dusza spoczywa w spokoju! W swych ostatnich s³owach duchowy przywódca Bractwa ca³¹ nadziejê na ocalenie kolonii pok³ada³ w magach z Krêgu Wody.");
	B_LogEntry			(CH3_EscapePlanNC,"Podj¹³em decyzjê. Udam siê do Nowego Obozu, by wesprzeæ Magów Wody. Cor Angar da³ mi klucze do skrzyni w laboratorium Cor Kaloma. Tam ma siê znajdowaæ znaleziony przeze mnie kamieñ ogniskuj¹cy wraz ze staro¿ytnym almanachem. Cor Angar uwa¿a, ¿e przy ich pomocy magowie z Nowego Obozu maj¹ szansê osi¹gn¹æ swój cel.");

	//-------- Missionitem --------
	CreateInvItem		(self,			ItArRuneTeleport5);
	B_GiveInvItems		(self,	hero,	ItArRuneTeleport5,	1);

	//-------- globale Missionsvariable --------
	CorAngar_SendToNC = TRUE;
};
