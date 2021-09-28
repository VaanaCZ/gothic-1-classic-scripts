// **************
// Kapitelwechsel
// **************

FUNC VOID B_Kapitelwechsel (VAR INT neues_Kapitel)
{
	Kapitel = neues_Kapitel;

	//***************************************************************************
	//	KAPITEL 1
	//***************************************************************************
	if		(neues_Kapitel == 1)
	{
		PrintDebugNpc	(PD_MISSION, "---=== ГЛАВА ПЕРВАЯ ===---");
		B_Give_SkipChapter2Weapons ();
		
		introducechapter ("Глава 1","Мир обреченных","chapter1.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 1","Welcome to the colony","chapter1.tga","levelup.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 2
	//***************************************************************************
	else if	(neues_Kapitel == 2)
	{
		PrintDebugNpc	(PD_MISSION, "---=== ГЛАВА ВТОРАЯ ===---");

		//-------- Hдndler auffьllen --------
		B_Give_FiskChapter2Weapons ();
		B_Give_DarrionChapter2Weapons ();
		B_Give_SharkyChapter2Weapons ();
		B_Give_BaalCadarChapter2Runes ();
		B_Give_TorrezChapter2Runes ();
		B_Give_CronosChapter2Runes ();
		B_GiveRiordianChapter2Potions ();
		B_Give_CavalornChapter2Weapons();
		B_Give_WolfChapter2Weapons();
		B_Give_SkipChapter2Weapons ();
	
		//-------- Oberwelt-Monster nochmal "nachfьllen" --------	
		B_Story_RespawnOW();
		
		//-------- InExtremo vorbereiten --------
		B_InsertInExtremo();
		
		introducechapter ("Глава 2","Логово ползунов","chapter2.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 2","The Minecrawler's nest","chapter2.tga","levelup.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 3
	//***************************************************************************
	else if (neues_Kapitel == 3)
	{
		PrintDebugNpc	(PD_MISSION, "---=== ГЛАВА ТРЕТЬЯ ===---");

		//-------- InExtremo wegrдumen --------
		B_InExtremoStopMusic();	
		B_KillInExtremo();

		//-------- Kapitel 2 Missionen nochmal auf Success setzen --------	
		YBerion_BringFocus 		= LOG_SUCCESS;
		CorKalom_BringMCQBalls 	= LOG_SUCCESS;
		CorKalom_BringBook 		= LOG_SUCCESS;

		//-------- Oberwelt-Monster nochmal "nachfьllen" --------	
		//B_Story_RespawnOW();
		
		//-------- Waffenhдndler auffrischen --------
		B_Give_FiskChapter3Weapons ();
		B_Give_DarrionChapter3Weapons ();
		B_Give_SharkyChapter3Weapons ();
		B_Give_BaalCadarChapter3Runes ();
		B_Give_TorrezChapter3Runes ();
		B_Give_TorrezChapter3Runes ();
		B_Give_CronosChapter3Runes ();
		B_GiveRiordianChapter3Potions ();
		B_Give_CavalornChapter3Weapons();
		B_Give_WolfChapter3Weapons ();
		B_Give_SkipChapter3Weapons ();
		//-------- Video abspielen --------
		PlayVideo		("GREATPRAYER.BIK");

		//-------- Y'Berion ins Koma fallen lassen --------
		var C_NPC YBerion;
		YBerion = Hlp_GetNpc(Gur_1200_YBerion);
		YBerion.flags = 0;					// IMMORTAL-Flag lцschen
		Npc_ChangeAttribute	(YBerion, ATR_HITPOINTS, -YBerion.attribute[ATR_HITPOINTS_MAX]+1);
		YBerion.flags = NPC_FLAG_IMMORTAL;	// IMMORTAL-Flag wieder setzen
		Npc_ExchangeRoutine (YBerion,	"DRAINED");
		AI_ContinueRoutine	(YBerion);
		
		//---GROSSE BESCHWЦRUNG TRIGGER NPCS ----------------------- M.F.
		//---HIER WERDEN DIE IN DEN TRIGGERINFOS GESETZTEN WAHRNEHMUNGEN WIEDER DEFAULT GESETZT--- M.F.
		var C_NPC Templer;		Templer	 	 = Hlp_GetNpc	(TPL_1431_Templer);
		Templer.senses =		hero.senses; 
		
		var C_NPC Templer_1;	Templer_1	 	 = Hlp_GetNpc	(TPL_1430_Templer);
		Templer_1.senses =		hero.senses;
		
		var C_NPC Novize;		Novize	     = Hlp_GetNpc	(NOV_1319_Novize);
		Novize.senses =			hero.senses;
		
		var C_NPC Novize_1;		Novize_1	 	 = Hlp_GetNpc	(NOV_1319_Novize);
		Novize_1.senses =		hero.senses;
		
		introducechapter ("Глава 3","Артефакты древней силы","chapter3.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 3","Artifacts of ancient power","chapter3.tga","levelup.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 4
	//***************************************************************************
	else if (neues_Kapitel == 4)
	{
		PrintDebugNpc	(PD_MISSION, "---=== ГЛАВА ЧЕТВЕРТАЯ ===---");

		 
		B_ExchangeRoutine (GRD_205_Scorpio,"BANNISHED");
		B_ChangeGuild    (GRD_205_Scorpio,GIL_NONE);  
		B_SetPermAttitude	(GRD_205_Scorpio,	ATT_NEUTRAL);
		
		
		B_ChangeGuild    (STT_336_Cavalorn,GIL_NONE);

		//-------- Waffenhдndler auffrischen --------
		B_Give_ScorpioChapter4Weapons ();
		B_Give_DarrionChapter4Weapons ();
		B_Give_SharkyChapter4Weapons ();
		B_Give_BaalCadarChapter4Runes ();
		B_Give_XardasChapter4Runes ();
		B_Give_CronosChapter4Runes ();
		B_GiveRiordianChapter4Potions ();
		B_Give_CavalornChapter4Weapons();
		B_Give_WolfChapter4Weapons();	
		//-------- globale Variablen --------
		Saturas_BringFoci = 5;

		//-------- Missionsgegenstдnde --------
		CreateInvItem		(hero,	ItArRuneTeleport2);

		//-------- Tagebucheintrдge --------
		Log_CreateTopic		(CH4_Firemages,	LOG_MISSION);
		Log_SetTopicStatus	(CH4_Firemages,	LOG_RUNNING);
		B_LogEntry			(CH4_Firemages,"Сатурас, глава магов Круга Воды, попросил меня о последней услуге. Чтобы взорвать рудную гору, ему потребуется помощь магов Огня из Старого лагеря. Я не знаю, удастся ли мне убедить их помочь Сатурасу, ведь им не выгодно разрушать Барьер. Так они потеряют всю свою власть. Но я постараюсь что-нибудь придумать.");

		//-------- Szene am Damm --------
		B_ExchangeRoutine	(SLD_700_LEE,"DAMNPAST"); 
		B_ExchangeRoutine	(BAU_935_HOMER,"DAMNPAST"); 
		
		//-------- Spielergilde дndern --------
		oldHeroGuild = Npc_GetTrueGuild(hero);
		if	C_NpcBelongsToOldCamp(hero)
		{
			Npc_SetTrueGuild(hero,	GIL_NONE);		// "AusgestoЯener" aus dem Alten Lager
			hero.guild = GIL_NONE;
		};
		
		//-------- AL-Tore schlieЯen --------
		B_ExchangeRoutine	(GRD_228_Gardist, "FMTaken");	//Hinteres Tor
		B_ExchangeRoutine	(GRD_230_Gardist, "FMTaken");	//Haupttor
		B_ExchangeRoutine	(GRD_280_Gardist, "FMTaken");	//Inneres Tor
			
		//-------- Windenwachen verwundbar machen --------
		B_ClearImmortal		(Grd_228_Gardist);				//Hinteres Tor     
		B_ClearImmortal		(Grd_230_Gardist);              //Haupttor    
		B_ClearImmortal		(Grd_280_Gardist);              //Inneres Tor 

		//-------- Feuermagier tцten --------
		B_KillNpc			(Kdf_400_Rodriguez);	
		B_KillNpc			(Kdf_401_Damarok);	
		B_KillNpc			(Kdf_402_Corristo);	
		B_KillNpc			(Kdf_403_Drago);	
		B_KillNpc			(Kdf_405_Torrez);

		//-------- Gдste im Alten Lager tцten --------
		B_KillNpc			(Nov_1330_BaalParvez);
		B_KillNpc			(Nov_1331_BaalTaran);
		B_KillNpc			(Tpl_1422_GorHanis);
		B_KillNpc			(Sld_729_Kharim);

		//-------- TAs von Diego und Milten дndern --------
		B_ExchangeRoutine	(PC_Thief,	"OCWait");
		B_ExchangeRoutine	(PC_Mage,	"OCWait");
		B_ChangeGuild		(PC_Thief,	GIL_KDF);		// "AusgestoЯener" aus dem Alten Lager
		B_SetPermAttitude	(PC_Thief,	ATT_FRIENDLY);
		B_SetPermAttitude	(PC_Mage,	ATT_FRIENDLY);
		
		//-------- permanente Attitьden дndern --------
		Wld_ExchangeGuildAttitudes	("GIL_ATTITUDES_FMTAKEN");
		B_InitMonsterAttitudes		();

		//-------- Kampfgruppe vor Haupttor --------
		B_ExchangeRoutine	(GRD_255_Fletcher,	"FMTaken");	// Verstдrkung vor das Haupttor (Anfьhrer)
		B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken");	// Verstдrkung vor das Haupttor
		B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken");	// Verstдrkung vor das Haupttor
		B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken");	// Verstдrkung vor das Haupttor (Fernkдmpfer)
		B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken");	// regulдre Wache am Haupttor
		B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken");	// regulдre Wache am Haupttor

		//-------- Kampfgruppe vor Hinterem Tor --------
		B_ExchangeRoutine	(GRD_233_Bloodwyn,	"FMTaken");	// Verstдrkung vor das Hinterem Tor (Anfьhrer)
		B_ExchangeRoutine	(GRD_232_Gardist,	"FMTaken");	// Verstдrkung vor das Hinterem Tor
		B_ExchangeRoutine	(GRD_229_Gardist,	"FMTaken");	// Verstдrkung vor das Hinterem Tor (Fernkдmpfer)
		B_ExchangeRoutine	(GRD_216_Torwache,	"FMTaken");	// regulдre Wache am Hinteren Tor
		B_ExchangeRoutine	(GRD_217_Torwache,	"FMTaken");	// regulдre Wache am Hinteren Tor
		
		//------------ Die Templer gehen nicht mehr zur Alten Mine ---------------------
		
		B_ExchangeRoutine	(TPL_1439_GorNaDrak,	"FMTaken");
		B_ExchangeRoutine	(TPL_1440_Templer,	"FMTaken");
		
		//--------------- Kapitel 4 wird angezeigt -------------------------------
		
		introducechapter ("Глава 4","Ксардас","chapter4.tga","levelup.wav", 6000); 
		//introducechapter ("Chapter 4","Ксардас","chapter4.tga","levelup.wav", 6000); 
	}
	
	//***************************************************************************
	//	KAPITEL 5
	//***************************************************************************
	else if (neues_Kapitel == 5)
	{
		PrintDebugNpc	(PD_MISSION, "---=== ГЛАВА ПЯТАЯ ===---");

		//-------- Hдndler auffьllen --------
		B_Give_ScorpioChapter5Weapons ();
		B_Give_DarrionChapter5Weapons ();
		B_Give_SharkyChapter5Weapons ();
		B_Give_XardasChapter5Runes ();
		B_Give_CavalornChapter5Weapons();
		B_Give_WolfChapter5Weapons();
		B_Give_CronosChapter5Runes ();
		B_GiveRiordianChapter5Potions ();
		
		B_Give_ScorpioChapter6Weapons ();
		B_Give_DarrionChapter6Weapons ();
		B_Give_SharkyChapter6Weapons ();
		B_Give_XardasChapter6Runes ();
		B_GiveRiordianChapter6Potions ();
		B_Give_CavalornChapter6Weapons ();
		B_Give_WolfChapter6Weapons();		

		//-------- Tagebucheintrдge --------
		B_LogEntry		(CH4_EnterTemple,	"Горн сомневается, что Улу-Мулу поможет мне пройти в город орков. Так или иначе, скоро я узнаю насколько он прав!");

		//-------- Oberwelt-Monster nochmal "nachfьllen" --------	
		B_Story_RespawnOW();
		
		introducechapter ("Глава 5","Хранители порталов","chapter5.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 5","The custodians of the portal","chapter5.tga","levelup.wav", 6000);
	}
	
	//***************************************************************************
	//	KAPITEL 6
	//***************************************************************************
	else if (neues_Kapitel == 6)
	{
		PrintDebugNpc	(PD_MISSION, "---=== ГЛАВА ШЕСТАЯ ===---");

		//-------- Hдndler auffьllen --------
		B_Give_XardasChapter6Runes ();

		//-------- URIZIEL aufladen --------
		PlayVideo		("OREHEAP.BIK");	// Schwert aufladen
		CreateInvItem 	(hero, Mythrilklinge02);	
		
		introducechapter ("Глава 6","Храм Спящего","chapter6.tga","levelup.wav", 6000);
		//introducechapter ("Chapter 6","The sleeper's halls","chapter6.tga","levelup.wav", 6000);
	};
};

func int C_IsChapter(var int chapter)
{
	if (Kapitel == chapter)
	{
		return TRUE;
	};
};
