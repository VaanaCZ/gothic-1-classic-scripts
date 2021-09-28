// ************************ EXIT **************************

INSTANCE DIA_SLD_709_Cord_Exit (C_INFO)
{
	npc			= SLD_709_Cord;
	nr			= 999;
	condition	= DIA_SLD_709_Cord_Exit_Condition;
	information	= DIA_SLD_709_Cord_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_709_Cord_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_709_Cord_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

/*------------------------------------------------------------------------
						TRAIN ANGEBOT								
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAINOFFER (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAINOFFER_Condition;
	information		= SLD_709_Cord_TRAINOFFER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Voglio migliorare la mia abilità con le armi a una sola mano."; 
};

FUNC int  SLD_709_Cord_TRAINOFFER_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_1H) < 2)
	{
		return TRUE;
	};

};
FUNC void  SLD_709_Cord_TRAINOFFER_Info()
{
	AI_Output (other, self,"SLD_709_Cord_TRAINOFFER_Info_15_01"); //Voglio migliorare la mia abilità con le armi a una sola mano.
	AI_Output (self, other,"SLD_709_Cord_TRAINOFFER_Info_14_02"); //Ovviamente, ti costerà qualcosa. Voglio 30 pezzi di metallo.

	Log_CreateTopic	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,"Cord il mercenario può insegnarmi a combattere con le ARMI A UNA MANO. Durante il giorno, posso trovarlo sull'altopiano roccioso vicino al fiume.");
};  
/*------------------------------------------------------------------------
						EINHANDKAMPF	DIE ERSTE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAIN (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAIN_Condition;
	information		= SLD_709_Cord_TRAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,30); 
};

FUNC int  SLD_709_Cord_TRAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,SLD_709_Cord_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_1H) == 0)
	{
		return TRUE;
	};
};
FUNC void  SLD_709_Cord_TRAIN_Info()
{
	AI_Output (other, self,"SLD_709_Cord_TRAIN_Info_15_00"); //Voglio migliorare la mia abilità con le armi a una sola mano.

	if (Npc_HasItems (hero,ItMiNugget) >= 30)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1)
		{
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_01"); //Ottima decisione! Prima di migliorare la tecnica, devi imparare a tenere l'arma.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_02"); //Spesso i principianti tendono a tenere queste armi con entrambe le mani. Non prendere quest'abitudine, non ti aiuterà.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_03"); //Afferra l'arma con una mano, con la lama rivolta verso l'alto, e falla oscillare.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_04"); //Devi imparare a coordinare il movimento dell'arma con quello del corpo, per colpire più velocemente.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_05"); //Tieni a mente ciò che ti ho insegnato e i tuoi combattimenti saranno più veloci ed eleganti.
			B_PracticeCombat	("NC_WATERFALL_TOP01");
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_06"); //Ah, già! Ancora una cosa: alcuni colpi causano più danni di altri! Come principiante, non hai molte possibilità di sferrare un colpo mortale.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_07"); //Comunque, man mano che progredirai, ti sarà più facile.
			B_GiveInvItems (hero, self,ItMiNugget,30);
			SLD_709_Cord_TRAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Non hai abbastanza metallo.
	};
};  
/*------------------------------------------------------------------------
						EINHANDKAMPF	DIE ZWEITE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAINAGAIN (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAINAGAIN_Condition;
	information		= SLD_709_Cord_TRAINAGAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,50); 
};

FUNC int  SLD_709_Cord_TRAINAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,SLD_709_Cord_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_1H) < 2)
	{
		return TRUE;
	};

};
FUNC void  SLD_709_Cord_TRAINAGAIN_Info()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Insegnami a maneggiare meglio le armi a una mano.

	if (Npc_HasItems (hero,ItMiNugget) >= 50)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2)
		{
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_02"); //Bene. Le basi le conosci già. Tenendo bassa l'arma, il tuo primo colpo sarà più potente.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_03"); //Ricordi? Sfrutta l'oscillazione! Bene, ora devi usare di più il corpo. Quando hai colpito due volte, gira su te stesso. Ciò confonderà l'avversario e ti metterà in una posizione privilegiata.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_04"); //A questo punto, porta nuovamente la lama da destra a sinistra.
			B_PracticeCombat("NC_WATERFALL_TOP01");
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_05"); //E di nuovo davanti. Non dimenticare: l'esercizio rende perfetti. Quindi continua a fare pratica con le armi a una mano.
			B_GiveInvItems	(hero, self, ItMiNugget, 50);
			SLD_709_Cord_TRAINAGAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Non hai abbastanza metallo.
	};
}; 
