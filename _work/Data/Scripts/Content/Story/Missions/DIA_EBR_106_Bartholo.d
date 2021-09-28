// **************************************
//					EXIT 
// **************************************

instance DIA_Bartholo_Exit (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 999;
	condition	= DIA_Bartholo_Exit_Condition;
	information	= DIA_Bartholo_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Bartholo_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Bartholo_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					HAllo
// ************************************************************

INSTANCE Info_Bartholo_HAllo (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_HAllo_Condition;
	information	= Info_Bartholo_HAllo_Info;
	permanent	= 0;
	description = "Chi sei?";
};                       

FUNC INT Info_Bartholo_HAllo_Condition()
{	
	return 1;
};

FUNC VOID Info_Bartholo_HAllo_Info()
{
	AI_Output (other, self,"Info_Bartholo_HAllo_15_00"); //Chi sei?
	AI_Output (self, other,"Info_Bartholo_HAllo_12_01"); //Il mio nome è Bartholo e faccio in modo che i baroni delle miniere ricevano i loro rifornimenti.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_02"); //Mi occupo di tutto: dalle scorte d'erba al cibo e forniture per le donne.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_03"); //Inoltre, è compito mio assicurarmi che questi cuochi idioti facciano bene il proprio lavoro.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_04"); //Dovrebbero ringraziarmi. Gomez non ammette un solo errore. Gli ultimi due cuochi li ha dati in pasto agli imboscatori del fiume.
};

// ************************************************************
// 					PERM TRADE
// ************************************************************

INSTANCE Info_Bartholo_PERM (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_PERM_Condition;
	information	= Info_Bartholo_PERM_Info;
	permanent	= 0;
	description = "Voglio fare un affare con te.";
	Trade		= 1;
};                       

FUNC INT Info_Bartholo_PERM_Condition()
{	
//SN: Problematisch, da Bartholo auch einen wichtigen Schlüssel hat!
//	if (Npc_KnowsInfo(hero, Info_Bartholo_Hallo))
//	{
//		return 1;
//	};
};

FUNC VOID Info_Bartholo_PERM_Info()
{
	AI_Output (other, self,"Info_Bartholo_PERM_15_00"); //Voglio fare un affare con te.
	AI_Output (self, other,"Info_Bartholo_PERM_12_01"); //Ho molto da offrirti, se possiedi metallo sufficiente.
};


// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

INSTANCE Info_Bartholo_Krautbote (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_Krautbote_Condition;
	information	= Info_Bartholo_Krautbote_Info;
	permanent	= 1;
	description = "Qui ho un po' d'erba per Gomez, da parte di Cor Kalom.";
};                       

FUNC INT Info_Bartholo_Krautbote_Condition()
{	
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Bartholo_Krautbote_Info()
{
	AI_Output				(other, self,"Info_Bartholo_Krautbote_15_00"); //Qui ho un po' d'erba per Gomez, da parte di Cor Kalom.
	AI_Output				(self, other,"Info_Bartholo_Krautbote_12_01"); //Mostramela!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_02"); //Hmmmmmmm...
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_03"); //Finalmente! Gomez era impaziente. Buon per te che sei arrivato oggi!
		AI_Output			(other, self,"Info_Bartholo_Krautbote_15_04"); //Quando me la paghi?
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_05"); //Calma, calma... Ecco, prendi i 500 pezzi di metallo pattuiti.
		
		B_GiveInvItems  	(other,self,itmijoint_3,30);
		CreateInvItems  	(self,itminugget, 500);
		B_GiveInvItems		(self,other, itminugget, 500);

		Kalom_DeliveredWeed	= TRUE;
		B_LogEntry			(CH1_KrautBote,"Bartholo mi ha consegnato 500 pezzi di metallo, per la consegna dell'erba.");
		B_GiveXP			(XP_WeedShipmentDelivered);

		Info_Bartholo_Krautbote.permanent = 0;
	}
	else
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_NoKraut_12_00"); //Non hai abbastanza erba, per essere un fattorino! Spero per te che tu non abbia rivenduto parte della merce! Torna quando avrai la quantità giusta.
	};
};

// **************************************************************************
// 				Wartet auf den SC
// **************************************************************************

instance  DIA_EBR_106_Bartholo_Wait4SC (C_INFO)
{
	npc				= EBR_106_Bartholo;
	condition		= DIA_EBR_106_Bartholo_Wait4SC_Condition;
	information		= DIA_EBR_106_Bartholo_Wait4SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_EBR_106_Bartholo_Wait4SC_Condition()
{	
	if	ExploreSunkenTower
	{
		return TRUE;
	};
};
FUNC void  DIA_EBR_106_Bartholo_Wait4SC_Info()
{
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	AI_Output			(self, other,"Info_Bartholo_12_01");	//Sapevo che qualcuno avrebbe tentato di raggiungerci attraverso il pentacolo!
	AI_Output			(self, other,"Info_Bartholo_12_02");	//A differenza di quel fabbro traditore di Stone, non abbiamo più bisogno di te!
	AI_Output			(other, self,"Info_Bartholo_15_03");	//Dove si trova Stone?
	AI_Output			(self, other,"Info_Bartholo_12_04");	//Dietro le sbarre! Tu, invece, fra un minuto ti ritroverai sottoterra!
	AI_Output			(self, other,"Info_Bartholo_12_05");	//Fatelo a fette, ragazzi!

	AI_StopProcessInfos	(self);
	
	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(self, GIL_EBR);	
};
