//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es k�nnen keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgef�hrt, es k�nnen weitere Invest kommen, zB.bei Heal nach jedem P�ppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den n�chsten Level

func int Spell_Logic_Trf_Bloodfly(var int manaInvested)
{
	PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Transform");

	if (manaInvested >= SPL_SENDCAST_TRF_BLOODFLY) 
	{
		Npc_SetActiveSpellInfo	(self,	Bloodfly);
		Npc_SendPassivePerc		(self,	PERC_ASSESSFIGHTER,	self, other);
		return SPL_SENDCAST;
	};

	return SPL_NEXTLEVEL;
};