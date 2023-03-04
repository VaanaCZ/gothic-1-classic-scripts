// Der Spieler wird von Xardas losgeschickt, um URIZIEL aufzuladen.
func void B_Story_LoadSword ()
{
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH5_Uriziel,"Xardas a crée une formule magique. Maintenant j'ai besoin d'une grande source de puissance magique et d'un magicien samaritain pour m'aider dans la procédure. Par chance, il existe une communauté avec une telle source d'énergie dans la colonie, et ils ont un service à me rendre ...");

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

