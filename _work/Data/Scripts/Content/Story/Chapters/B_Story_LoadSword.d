// Der Spieler wird von Xardas losgeschickt, um URIZIEL aufzuladen.
func void B_Story_LoadSword ()
{
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH5_Uriziel,"Xardas dokon�il kouzelnou formuli. Nyn� pot�ebuji opravdu siln� zdroj magick� energie a ochotn�ho m�ga, kter� by mi pomohl prov�st proceduru. Shodou okolnost� je v kolonii komunita, kter� takov�m zdrojem energie disponuje a kter� mi je hluboce zav�z�na...");

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

