func void B_Story_FoundUrShak()
{
	//-------- Missionsgegenst�nde --------
	

	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_FindOrcShaman,"He salvado al cham�n orco llamado Ur-Shak de las garras de su propia gente. Se ha mostrado tan agradecido que me ha contado la parte que faltaba de la historia del Durmiente. Ahora puedo volver junto a Xardas para completar mi b�squeda.");

	Log_CreateTopic		(CH4_UluMulu,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_UluMulu,		LOG_RUNNING);
	B_LogEntry			(CH4_UluMulu,"Ur-Shak, el cham�n desterrado, me ha dicho cu�l es el �nico modo de entrar en el templo subterr�neo del Durmiente que hay bajo el pueblo orco sin tener que luchar con sus habitantes. Necesito el ULU-MULU, una especie de estandarte sagrado respetado como s�mbolo por todos los orcos. Un amigo de Ur-Shak retenido en la mina de los humanos puede hacerme uno de esos estandartes."); 

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcShaman);

	//-------- Tagesabl�ufe �ndern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
