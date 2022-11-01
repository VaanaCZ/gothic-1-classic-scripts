//*****************************************************************************
//***			Macht den Spieler zum Freund des Ork-Schamanen				***
//*****************************************************************************
func void B_Story_FriendOfUrShak()
{
	//-------- Missionsgegenstдnde --------
	CreateInvItem	(hero, ItMi_OrcTalisman);
	
	//-------- NSCs --------
	var C_NPC urshak;
	urshak = Hlp_GetNpc(ORC_2200_Shaman);
	urshak.name = "Ур-Шак";
	
	//-------- globale Variable setzen --------
	FriendOfUrShak = TRUE;
};