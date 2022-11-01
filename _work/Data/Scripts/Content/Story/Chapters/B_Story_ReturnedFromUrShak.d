func void B_Story_ReturnedFromUrShak()
{
	//-------- Missionsgegenstände --------
	

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindOrcShaman,"Zdá se, že Xardas je nadšený z toho, co jsem se dozvěděl od Ur-Shaka. Má další cesta povede do Svobodného dolu, kde najdu Ur-Shakova přítele.");
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_SUCCESS);

	Log_CreateTopic		(CH4_EnterTemple,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_RUNNING);
	B_LogEntry			(CH4_EnterTemple,"Nyní začínám rozumět Xardasovu záměru. Požádal jsem ho o pomoc při rozbití magické Bariéry a on mi vzápětí ukázal způsob, který nemá nic společného s rudnou haldou mágů Vody. Namísto toho po mně požaduje, abych našel cestu do podzemního Spáčova chrámu."); 

	//-------- Erfahrung --------
	B_GiveXP		(XP_ReturnedFromUrShak);

	//-------- Tagesabläufe ändern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
