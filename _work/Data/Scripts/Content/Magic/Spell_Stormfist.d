//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es kцnnen keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgefьhrt, es kцnnen weitere Invest kommen, zB.bei Heal nach jedem Pцppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nдchsten Level

func int Spell_Logic_Stormfist	(var int manaInvested)
{
	PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Stormfist");
	
	if 	(manaInvested ==(SPL_SENDCAST_STORMFIST*3)/10)
	||	(manaInvested ==(SPL_SENDCAST_STORMFIST*5)/10)
	||	(manaInvested ==(SPL_SENDCAST_STORMFIST*8)/10)
	{	return SPL_NEXTLEVEL;		};
	
	if (manaInvested >= SPL_SENDCAST_STORMFIST) 
	{	return SPL_SENDCAST;		};

return SPL_RECEIVEINVEST;	
};