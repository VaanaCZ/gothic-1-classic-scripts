func void B_Story_ReturnedFromUrShak()
{
	//-------- Missionsgegenstände --------
	

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindOrcShaman,"Zdá se, že Xardas je nadšený z toho, co jsem se dozvìdìl od Ur-Shaka. Má další cesta povede do Svobodného dolu, kde najdu Ur-Shakova pøítele.");
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_SUCCESS);

	Log_CreateTopic		(CH4_EnterTemple,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_RUNNING);
	B_LogEntry			(CH4_EnterTemple,"Nyní zaèínám rozumìt Xardasovu zámìru. Požádal jsem ho o pomoc pøi rozbití magické Bariéry a on mi vzápìtí ukázal zpùsob, který nemá nic spoleèného s rudnou haldou mágù Vody. Namísto toho po mnì požaduje, abych našel cestu do podzemního Spáèova chrámu."); 

	//-------- Erfahrung --------
	B_GiveXP		(XP_ReturnedFromUrShak);

	//-------- Tagesabläufe ändern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
