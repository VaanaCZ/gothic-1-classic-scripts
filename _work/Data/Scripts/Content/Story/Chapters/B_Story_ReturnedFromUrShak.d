func void B_Story_ReturnedFromUrShak()
{
	//-------- Missionsgegenstände --------
	

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindOrcShaman,"Xardas parecía contento por lo que he averiguado por medio de Ur-Shak. Mi camino me conducirá ahora al interior de la Mina Libre para encontrar al amigo de Ur-Shak.");
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_SUCCESS);

	Log_CreateTopic		(CH4_EnterTemple,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_RUNNING);
	B_LogEntry			(CH4_EnterTemple,"Empiezo a comprender el objetivo de Xardas. Le he pedido ayuda en la destrucción de la Barrera Mágica y me ha mostrado una manera, pero ésta no tiene nada que ver con el montículo de mineral de los Magos del Agua. Me ha pedido que, en su lugar, encuentre una forma de entrar en el templo subterráneo del Durmiente."); 

	//-------- Erfahrung --------
	B_GiveXP		(XP_ReturnedFromUrShak);

	//-------- Tagesabläufe ändern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
