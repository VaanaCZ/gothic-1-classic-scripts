func void B_Story_ShowedUrizielToXardas()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_EnterTemple,"Xardas byl dost p�ekvapen, �e se mi poda�ilo proniknout do podzemn�ho chr�mu. D�val se, jako by m� pova�oval za ikonu ze star�ho sk�et�ho proroctv�.");
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH5_Uriziel,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_RUNNING);
	B_LogEntry			(CH5_Uriziel,"Xardas rozpoznal v podivn�m me�i, kter� jsem na�el ve Sp��ov� chr�mu, URIZIEL. Tato prastar� �epel m�la kdysi z�ejm� nesm�rnou moc, ale v pr�b�hu �asu j� pozbyla. Pot�ebuji naj�t zp�sob, jak t�to zbrani vr�tit jej� n�kdej�� s�lu. ");
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_ShowUrizielToXardas);
};
