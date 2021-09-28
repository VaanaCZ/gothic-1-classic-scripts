// Der Spieler wird von Xardas losgeschickt, um URIZIEL aufzuladen.
func void B_Story_LoadSword ()
{
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH5_Uriziel,"Xardas ha creato la formula. Ora ho bisogno di una potente fonte magica d'energia e di un mago che mi aiuti nell'operazione di trasferimento. Casualmente, nella colonia c'� una comunit� che possiede tale fonte e che � in debito con me...");

	//-------- Erfahrung --------
	B_GiveXP			(XP_ReturnedFromSunkenTower);

	//-------- magische Formel, um URIZIEL zu laden --------
	CreateInvItem		(hero,	Scroll4Milten);
	
	//-------- TA f�r Milten, dass er auf SC wartet --------
	VAR C_NPC Milten; Milten = Hlp_GetNpc(PC_Mage);
	Npc_ExchangeRoutine (Milten, "LSWait"); 						

	//-------- globale Variable --------
	LoadSword = TRUE;
};

