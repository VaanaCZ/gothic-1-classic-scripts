//#####################################################################
//##
//##							KAPITEL 3
//##							=========
//##	Saturas beauftragt den Spieler die vier restlichen Foki
//##	zu finden und zu ihm zu bringen.
//##
//#####################################################################
func void B_Story_BringFoci()
{
	//-------- Ausrьstung fьr Spieler --------
	CreateInvItems		(self,			ItWrFocimap,	2);		// 2, damit die Bildschirmausgabe stimmt!
	B_GiveInvItems		(self,	hero,	ItWrFocimap,	2);	
	Npc_RemoveInvItem	(hero,			ItWrFocimap);
	
	CreateInvItem		(hero,	ItArScrollTeleport2);

	//-------- Gorn platzieren --------
	var C_NPC	gorn;
	gorn = Hlp_GetNpc	(PC_FIGHTER);
	Npc_ExchangeRoutine	(gorn, "RuinWait");
	AI_ContinueRoutine	(gorn);
	
	//-------- Lester platzieren --------
	var C_NPC	lester;
	lester = Hlp_GetNpc	(PC_PSIONIC);
	Npc_ExchangeRoutine	(lester, "FORTRESSWAIT");
	AI_ContinueRoutine	(lester);
	
	//-------- Lebt der Golem noch? ----
	var C_NPC Lestermonster;
	lestermonster = Hlp_GetNpc (Bridgegolem);
	if (Npc_IsDead (Lestermonster))
	{
		Wld_InsertNpc		(Bridgegolem,"PATH_TO_PLATEAU04_BRIDGE2");
	};

	//-------- Milten platzieren --------
	var C_NPC	milten;
	milten = Hlp_GetNpc	(PC_MAGE);
	Npc_ExchangeRoutine	(milten, "SHWait");
	AI_ContinueRoutine	(milten);
	
	//-------- Diego platzieren --------
	var C_NPC	diego;
	diego = Hlp_GetNpc	(PC_THIEF);
	Npc_ExchangeRoutine	(diego, "TROLLWAIT");
	AI_ContinueRoutine	(diego);
	
	//-------- Lebt der Troll noch? ----
	var c_Npc DiegoMonster;
	Diegomonster = Hlp_GetNpc	(Troll);
	if (Npc_IsDead (Diegomonster))
	{
		Wld_InsertNpc		(Troll,"LOCATION_12_14");
	};

	//-------- Wachen zur Ebene der Wassermagier freischalten --------
	var C_NPC sld723;		sld723 = Hlp_GetNpc	(SLD_723_Soeldner);		sld723.aivar[AIV_PASSGATE] = TRUE;
	var C_NPC sld732;		sld732 = Hlp_GetNpc	(SLD_732_Soeldner);		sld732.aivar[AIV_PASSGATE] = TRUE;

	//-------- Tagebucheintrдge --------
	B_LogEntry			(CH3_EscapePlanNC,"Я предложил Сатурасу помощь в окончании реализации плана побега. Следующей моей задачей станет розыск оставшихся четырех юниторов.");
	Log_SetTopicStatus	(CH3_EscapePlanNC,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH3_BringFoci,		LOG_MISSION);
	Log_SetTopicStatus	(CH3_BringFoci,		LOG_RUNNING);
	B_LogEntry			(CH3_BringFoci,"После того как я передал в руки Сатураса юнитор и альманах из Болотного Лагеря, он попросил меня найти оставшиеся четыре камня, которые пока не попали в руки магов воды.");
	B_LogEntry			(CH3_BringFoci,"Сатурас дал мне старую карту, на которой отмечено, где находились юниторы, а также магический свиток для телепортации, который перенесет меня обратно к магам воды.");
	B_LogEntry			(CH3_BringFoci,"Риордан, один из магов воды, изготовил для меня несколько эликсиров. Я могу забрать их в его лаборатории на верхнем уровне Нового Лагеря.");

	//-------- Mission auf RUNNING setzen --------
	Saturas_BringFoci = 1;
};
