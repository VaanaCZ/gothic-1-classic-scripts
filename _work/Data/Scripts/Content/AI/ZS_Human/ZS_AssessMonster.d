//////////////////////////////////////////////////////////////////////////
//	ZS_AssessMonster
//	================
//	Dieser Zustand wird durch
//
//	- B_AssessEnemy			-> NSC entdeckt feindliches Monster
//	- B_AssessFighter		-> NSC entdeckt Monster im Kampfmodus (trifft auf alle zu!)
//	- B_AssessFightSound	-> NSC hцrt Monster kдmpfen
//	- B_AssessWarn			-> NSC wird vor Monster gewarnt (VORSICHT: Noch nicht ьberarbeitet!)
//	- B_ObserveIntruder		-> NSC wird von Monster ьberrascht
//
//	gestartet. Folgende Bedingungen werden ebenfalls vorausgesetzt:
//
//	- Das Monster ist aggressiv und wьrde den NSC angreifen!
//	- Das Monster befindet sich innerhalb von 'HAI_DIST_ASSESS_MONSTER'
//
//	Es passiert folgendes:
//	1. 	Wenn NSC eine Wache ist, greift er sofort an
//	1. 	Wenn NSC einer Boss-Gilde angehцrt, greift er sofort an
//	2.	Wenn NSC einer Arbeiter-Gilde angehцrt, vergleicht er die Stдrke
//		des Monsters mit seiner eigenen
//		->	NSC stдrker: Waffe ziehen und abwarten bis das Monster auf
//			Attack-Range 'HAI_DIST_ATTACK_MONSTER' heran ist, dann
//			angreifen. 
//		->	Monster stдrker: NSC flieht sofort!
//////////////////////////////////////////////////////////////////////////
func void ZS_AssessMonster	()
{
	PrintDebugNpc			(PD_ZS_FRAME, "ZS_AssessMonster" );
	C_ZSInit				();

	Npc_PercEnable  		(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic		);		
	Npc_PercEnable  		(self, 	PERC_ASSESSTALK			,	B_RefuseTalk		);		
	Npc_PercEnable  		(self, 	PERC_ASSESSSURPRISE		,	ZS_AssessSurprise	);
	Npc_SetPercTime			(self, 	0.5);
	PrintGlobals			(PD_ZS_CHECK);
	
	
	
	//######## Ist NSC eine WACHE oder BOSS ? ########
	if ( C_NpcIsGuard(self) || C_NpcIsGuardArcher(self) || C_NpcIsBoss(self) )
	{
		PrintDebugNpc	(PD_ZS_CHECK, "...NSC ist WACHE(NK/FK) oder BOSS!" );
		
		B_FullStop		(self);
		B_SayOverlay	(self,	NULL,	"$DieMonster");
		
		
		Npc_SetTarget	(self,	other);
		AI_StartState	(self,	ZS_Attack, 0, "");
		return;
	}	

	//######## ...NSC ist ein ARBEITER ? ########
	else
	{
		PrintDebugNpc		(PD_ZS_CHECK, 	" ...NSC ist wede WACHE noch BOSS!");
		
		if (C_AmIStronger	(self,	other))
		{
			PrintDebugNpc	(PD_ZS_CHECK, 	" ...aber trotzdem stдrker als das Monster!");
			B_FullStop		(self);
			B_DrawWeapon	(self,	other);	// also schon mal in Kampfbereitschaft
			return;							// ...und Distanz zum Monster checken (ab in die Loop!)
		}
		else
		{
			PrintDebugNpc	(PD_ZS_CHECK, 	" ...und noch dazu schwдcher als das Monster!");
			B_FullStop		(self);
			B_WhirlAround	(self,	other);
			Npc_SetTarget	(self,	other);
			B_SayOverlay	(self,	NULL,	"$ShitWhatAMonster");
			
			Npc_GetTarget	( self);
			AI_StartState	(self,	ZS_Flee,	0, "");
		};	
	};
};

func int ZS_AssessMonster_Loop ()
{
	PrintDebugNpc			(PD_ZS_LOOP,	"ZS_AssessMonster_Loop");

	var int distance;		distance = Npc_GetDistToNpc(self, other);
	
	//-------- Auswahl/Wechsel der richtigen Waffe --------
	if (Npc_GetStateTime	(self) > 1)
	{
		PrintDebugNpc		(PD_ZS_CHECK, "...1 Sekunden in der Loop -> Waffencheck!");
		B_SmartTurnToNpc	(self,	other);
		B_SelectWeapon		(self,	other);
		Npc_SetStateTime	(self, 	0);
	};
	
	//-------- Fernkampfwaffe bereit ? --------
	if (Npc_IsInFightMode(self, FMODE_FAR) || Npc_IsInFightMode(self, FMODE_MAGIC))
	{
		Npc_SetTarget	(self,	other);
		AI_StartState	(self,	ZS_Attack, 0, "");		//...dann auch aus der Beobachtungsdistanz angreifen
	};

	//-------- Monster zu nahe dran ? --------
	if (distance < HAI_DIST_ATTACK_MONSTER)
	{
		PrintDebugNpc		(PD_ZS_CHECK, "...Monster ist jetzt zu nahe herangekommen!");
		Npc_SetTarget		(self,	other);
		B_SayOverlay		(self,	NULL,	"$DieMonster");
		AI_StartState		(self,	ZS_Attack, 0, "");
	}
	
	//-------- Monster wieder weit genug weg ? --------
	else if (distance > HAI_DIST_ABORT_ASSESS_MONSTER )	
	{
		PrintDebugNpc		(PD_ZS_CHECK, "...Monster ist wieder weit genug weg!");
		return				LOOP_END;
	}
	
	//-------- Monster kampfunfдhig ? --------
	else if (C_NpcIsDown(other))	
	{
		PrintDebugNpc		(PD_ZS_CHECK, "...Monster kampfunfдhig!");
		return				LOOP_END;
	}
	
	//-------- Schleife fortsetzen --------
	else
	{
		return				LOOP_CONTINUE;
	};
};

func void ZS_AssessMonster_End ()
{
	PrintDebugNpc			(PD_ZS_FRAME, "ZS_AssessMonster_End" );

	B_RemoveWeapon			(self);
	AI_ContinueRoutine		(self);
};
