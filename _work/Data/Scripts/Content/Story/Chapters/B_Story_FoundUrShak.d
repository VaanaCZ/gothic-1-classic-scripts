func void B_Story_FoundUrShak()
{
	//-------- Missionsgegenstände --------
	

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindOrcShaman,"Ho salvato l'orco sciamano Ur-Shak dalla sua stessa gente. Era talmente grato, che mi ha raccontato la seconda parte della storia del Dormiente. Ora posso tornare da Xardas e completare la mia missione.");

	Log_CreateTopic		(CH4_UluMulu,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_UluMulu,		LOG_RUNNING);
	B_LogEntry			(CH4_UluMulu,"Ur-Shak, l'orco sciamano esiliato, mi ha rivelato l'unico sistema per entrare nel tempio sotterraneo del Dormiente, senza dover combattere contro tutti gli orchi. Ho bisogno di un ULU-MULU, una specie di stendardo sacro, rispettato da tutti gli orchi. Un amico di Ur-Shak, tenuto prigioniero nella miniera degli umani, può crearmene uno."); 

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcShaman);

	//-------- Tagesabläufe ändern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
