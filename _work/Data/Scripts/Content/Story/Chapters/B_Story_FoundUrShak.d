func void B_Story_FoundUrShak()
{
	//-------- Missionsgegenstände --------
	

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindOrcShaman,"Uratowa³em szamana Ur-Shaka przed jego w³asnym ludem. Z wdziêcznoœci opowiedzia³ mi resztê dziejów Œni¹cego. Teraz mogê wróciæ do Xardasa, by wype³niæ wreszcie moje zadanie.");

	Log_CreateTopic		(CH4_UluMulu,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_UluMulu,		LOG_RUNNING);
	B_LogEntry			(CH4_UluMulu,"Szaman-wygnaniec - Ur-Shak, zdradzi³ mi, ¿e jedyny sposób na w miarê bezpieczne przedarcie siê do podziemnej œwi¹tyni Œni¹cego. Muszê zdobyæ ULU-MULU - œwiêty amulet przyjaŸni, respektowany przez wszystkich orków. Przyjaciel Ur-Shaka z Wolnej Kopalni mo¿e sporz¹dziæ dla mnie ULU-MULU."); 

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcShaman);

	//-------- Tagesabläufe ändern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
