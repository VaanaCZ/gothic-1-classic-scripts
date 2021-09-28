// Der Spieler wird von Xardas losgeschickt, um URIZIEL aufzuladen.
func void B_Story_LoadSword ()
{
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH5_Uriziel,"Xardas ha creado la fórmula mágica. Ahora necesito una fuente de energía mágica muy grande y un mago servicial que me ayude en el proceso. Por suerte, hay una comunidad con tal fuente de energía en la colonia, y está muy endeudada conmigo...");

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

