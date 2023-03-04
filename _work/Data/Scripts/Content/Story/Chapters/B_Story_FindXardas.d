//*****************************************************************************
//***			Diese Funktion tötet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheinträge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,"après les Magiciens du Feu assassinés, il ne reste qu'UNE personne pour pouvoir faire exploser l'amas de minerai. Saturas m'a dit que la création de la Barrière Magique a été dirigé par un 13eme magicien.");
	B_LogEntry			(CH4_FindXardas,"Ce 13eme magicien, appelé Xardas, vit reclus dans une tour au beau milieu de la terre des Orcs. J'ai accepté d'y aller et de demander de l'aide.");
	

	//-------- Missionsgegenstände --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};
