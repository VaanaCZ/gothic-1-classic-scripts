func void B_Story_ReturnedFromUrShak()
{
	//-------- Missionsgegenst�nde --------
	

	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_FindOrcShaman,"Zd� se, �e Xardas je nad�en� z toho, co jsem se dozv�d�l od Ur-Shaka. M� dal�� cesta povede do Svobodn�ho dolu, kde najdu Ur-Shakova p��tele.");
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_SUCCESS);

	Log_CreateTopic		(CH4_EnterTemple,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_RUNNING);
	B_LogEntry			(CH4_EnterTemple,"Nyn� za��n�m rozum�t Xardasovu z�m�ru. Po��dal jsem ho o pomoc p�i rozbit� magick� Bari�ry a on mi vz�p�t� uk�zal zp�sob, kter� nem� nic spole�n�ho s rudnou haldou m�g� Vody. Nam�sto toho po mn� po�aduje, abych na�el cestu do podzemn�ho Sp��ova chr�mu."); 

	//-------- Erfahrung --------
	B_GiveXP		(XP_ReturnedFromUrShak);

	//-------- Tagesabl�ufe �ndern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
