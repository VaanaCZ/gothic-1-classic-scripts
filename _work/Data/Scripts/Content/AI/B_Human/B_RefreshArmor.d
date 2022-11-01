//////////////////////////////////////////////////////////////////////////
//	B_RefreshArmor
//	==============
//	Wird einmal pro Spieltag um 0 Uhr vom Code aufgerufen!
//	Wurde frьher genutzt, um NSCs die ihrer Rьstung beraubt wurden, wieder
//	eine passende Rьstung dazuzuschummeln. Da der Spieler nun den NSCs
//	nicht mehr die Rьstung abnehmen kann, ist diese Funktion leer.
//
//	WICHTIG: Kцnnte aber zum Respawnen von irgendwelchen anderen Dingen
//	benutzt werden!
//////////////////////////////////////////////////////////////////////////
func void B_RefreshArmor()
{
	PrintDebugNpc( PD_ZS_FRAME, "B_RefreshArmor" );
};