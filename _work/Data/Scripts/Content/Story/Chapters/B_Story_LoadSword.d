// Der Spieler wird von Xardas losgeschickt, um URIZIEL aufzuladen.
func void B_Story_LoadSword ()
{
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH5_Uriziel,"Xardas przygotowa� ju� magiczn� formu��. Teraz potrzebuj� pot�nego �r�d�a energii magicznej i maga, kt�ry zechce mi pom�c. Na szcz�cie w kolonii znajduje si� osiedle, kt�remu wy�wiadczy�em nieocenione us�ugi i dysponuj�ce wystarczaj�co pot�nym �r�d�em.");

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

