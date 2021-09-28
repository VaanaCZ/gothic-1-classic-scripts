// Der Spieler wird von Xardas losgeschickt, um URIZIEL aufzuladen.
func void B_Story_LoadSword ()
{
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH5_Uriziel,"Xardas przygotowa³ ju¿ magiczn¹ formu³ê. Teraz potrzebujê potê¿nego Ÿród³a energii magicznej i maga, który zechce mi pomóc. Na szczêœcie w kolonii znajduje siê osiedle, któremu wyœwiadczy³em nieocenione us³ugi i dysponuj¹ce wystarczaj¹co potê¿nym Ÿród³em.");

	//-------- Erfahrung --------
	B_GiveXP			(XP_ReturnedFromSunkenTower);

	//-------- magische Formel, um URIZIEL zu laden --------
	CreateInvItem		(hero,	Scroll4Milten);
	
	//-------- TA für Milten, dass er auf SC wartet --------
	VAR C_NPC Milten; Milten = Hlp_GetNpc(PC_Mage);
	Npc_ExchangeRoutine (Milten, "LSWait"); 						

	//-------- globale Variable --------
	LoadSword = TRUE;
};

