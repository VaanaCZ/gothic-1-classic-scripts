func void B_Story_FoundUrShak()
{
	//-------- Missionsgegenstände --------
	

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindOrcShaman,"Zachránil jsem skøetího šamana Ur-Shaka pøed jeho vlastními lidmi. Byl mi tak vdìèný, že mi dopovìdìl zbytek Spáèova pøíbìhu. Nyní se mùžu vrátit ke Xardasovi a dokonèit svùj úkol.");

	Log_CreateTopic		(CH4_UluMulu,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_UluMulu,		LOG_RUNNING);
	B_LogEntry			(CH4_UluMulu,"Ur-Shak, vyhoštìný šaman, mi øekl, jak se dostanu do Spáèova podzemního chrámu pod skøetím mìstem, aniž bych musel bojovat se všemi skøety. Musím mít ULU-MULU, odznak, který všichni skøeti respektují. Jeden Ur-Shakùv pøítel, který je vìznìn v dole lidí, mi takový odznak mùže zhotovit."); 

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcShaman);

	//-------- Tagesabläufe ändern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
