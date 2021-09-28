// Der Spieler wird von Xardas losgeschickt, um URIZIEL aufzuladen.
func void B_Story_LoadSword ()
{
	//-------- Tagebucheintrдge --------
	B_LogEntry			(CH5_Uriziel,"Ксардас создал магическую формулу. Теперь мне нужен по-настоящему большой источник магической энергии и маг, который будет мне помогать. К счастью, в колонии есть некая общность, обладающая такой энергией, и эта общность в долгу передо мной…");

	//-------- Erfahrung --------
	B_GiveXP			(XP_ReturnedFromSunkenTower);

	//-------- magische Formel, um URIZIEL zu laden --------
	CreateInvItem		(hero,	Scroll4Milten);
	
	//-------- TA fьr Milten, dass er auf SC wartet --------
	VAR C_NPC Milten; Milten = Hlp_GetNpc(PC_Mage);
	Npc_ExchangeRoutine (Milten, "LSWait"); 						

	//-------- globale Variable --------
	LoadSword = TRUE;
};

