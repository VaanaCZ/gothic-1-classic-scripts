// Der Spieler wird von Xardas losgeschickt, um URIZIEL aufzuladen.
func void B_Story_LoadSword ()
{
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH5_Uriziel,"Xardas przygotował już magiczną formułę. Teraz potrzebuję potężnego źródła energii magicznej i maga, który zechce mi pomóc. Na szczęście w kolonii znajduje się osiedle, któremu wyświadczyłem nieocenione usługi i dysponujące wystarczająco potężnym źródłem.");

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

