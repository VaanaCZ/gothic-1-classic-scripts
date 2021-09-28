// **************************************
//					EXIT 
// **************************************

instance DIA_Raven_Exit (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 999;
	condition	= DIA_Raven_Exit_Condition;
	information	= DIA_Raven_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Raven_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Erstes Mal rein
// **************************************

instance DIA_Raven_FirstIn (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_FirstIn_Condition;
	information	= DIA_Raven_FirstIn_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Raven_FirstIn_Condition()
{
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	if (wache218.aivar[AIV_PASSGATE]==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_FirstIn_Info()
{
	AI_Output (self, other,"DIA_Raven_FirstIn_10_00"); //Cosa posso fare per te?
};

// **************************************
//			Wer bist du?
// **************************************

instance DIA_Raven_Who (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Who_Condition;
	information	= DIA_Raven_Who_Info;
	permanent	= 0;
	description	= "Chi sei?";
};                       

FUNC int DIA_Raven_Who_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Who_Info()
{
	AI_Output (other, self,"DIA_Raven_Who_15_00"); //Chi sei?
	AI_Output (self, other,"DIA_Raven_Who_10_01"); //Sono Raven, il braccio destro di Gomez. Chiunque voglia incontrarlo, deve prima passare da ME.
};

// **************************************
//			Krautbote
// **************************************

instance DIA_Raven_Krautbote (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Krautbote_Condition;
	information	= DIA_Raven_Krautbote_Info;
	permanent	= 0;
	description	= "Cor Kalom mi ha inviato per consegnare un po' d'erba a Gomez.";
};                       

FUNC int DIA_Raven_Krautbote_Condition()
{
	if	(KALOM_KRAUTBOTE == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID DIA_Raven_Krautbote_Info()
{
	AI_Output			(other, self,"DIA_Raven_Krautbote_15_00"); //Cor Kalom mi ha inviato per consegnare un po' d'erba a Gomez.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_01"); //Gomez non tratta coi fattorini, è Bartholo che devi incontrare.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_02"); //Lo troverai nella sala a destra, dietro l'entrata, oppure nella cucina della torre grande.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_03"); //Ovviamente di notte dorme: se fossi in te, non lo disturberei.

	B_LogEntry			(CH1_KrautBote,"La fornitura d'erba per Gomez deve essere consegnata a Bartholo, nella casa dei baroni delle miniere.");
};

// **************************************
//		Gomez sehen (Stt-Aufnahme)
// **************************************

instance DIA_Raven_Aufnahme (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Aufnahme_Condition;
	information	= DIA_Raven_Aufnahme_Info;
	permanent	= 0;
	description	= "Voglio vedere Gomez. Thorus dice che sono pronto a diventare un'Ombra.";
};                       

FUNC int DIA_Raven_Aufnahme_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	&& (Npc_GetTrueGuild(other) == GIL_NONE))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Raven_Aufnahme_15_00"); //Voglio vedere Gomez. Thorus dice che sono pronto a diventare un'Ombra.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_01"); //Siamo sempre in cerca di uomini valorosi. Sembri molto sicuro di te, potresti andare bene.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_02"); //Ti scorterò da Gomez. Seguimi e non toccare nulla!
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self, "GUIDE");
};

// **************************************
//		In Halle angekommen
// **************************************

instance DIA_Raven_There (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_There_Condition;
	information	= DIA_Raven_There_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int DIA_Raven_There_Condition()
{
	if 	( Npc_KnowsInfo(hero,DIA_Raven_Aufnahme) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT") ) 
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_There_Info()
{
	AI_Output (self, other,"DIA_Raven_There_10_01"); //Gomez è laggiù. Se non gli mostrerai il dovuto rispetto, mi occuperò personalmente d'insegnarti le buone maniere. Capito?
	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine(self, "START");
};


// **************************************
//				PERM
// **************************************

instance DIA_Raven_PERM (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_PERM_Condition;
	information	= DIA_Raven_PERM_Info;
	permanent	= 1;
	description	= "Come va il commercio di metallo?";
};                       

FUNC int DIA_Raven_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_PERM_Info()
{
	AI_Output (other, self,"DIA_Raven_PERM_15_00"); //Come va il commercio di metallo?
	AI_Output (self, other,"DIA_Raven_PERM_10_01"); //La vecchia miniera sta andando bene. L'ultimo carico di rifornimenti dal mondo esterno è stato abbondante.
};

// **************************************
//			Bin dabei
// **************************************

instance DIA_Raven_BinDabei (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_BinDabei_Condition;
	information	= DIA_Raven_BinDabei_Info;
	permanent	= 0;
	description	= "Gomez dice che sono stato accettato.";
};                       

FUNC int DIA_Raven_BinDabei_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gomez_Dabei))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_BinDabei_Info()
{
	CreateInvItem		(hero, STT_ARMOR_M);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	AI_Output			(other, self,"DIA_Raven_BinDabei_15_00"); //Gomez dice che sono stato accettato.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_01"); //Ottimo! In questo caso, puoi subito provare il tuo valore in missione.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_02"); //Non dovresti avere difficoltà, se le tue conoscenze sono buone come affermi.

	AI_EquipBestArmor	(hero); 
};

// *********************************************
// 				Sekten-Auftrag
// *********************************************
	var int Raven_SpySect;
// *********************************************

INSTANCE DIA_Raven_SpySect (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpySect_Condition;
	information	= DIA_Raven_SpySect_Info;
	permanent	= 0;
	description	= "Cosa devo fare?";
};

FUNC INT DIA_Raven_SpySect_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_BinDabei))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpySect_Info()
{
	AI_Output (other, self,"DIA_Raven_SpySect_15_00"); //Cosa devo fare?
	AI_Output (self, other,"DIA_Raven_SpySect_10_01"); //Noi commerciamo molto con la Fratellanza. Questo, ovviamente, non vuol dire che ci fidiamo di loro.
	AI_Output (self, other,"DIA_Raven_SpySect_10_02"); //Vai alla palude.
	AI_Output (self, other,"DIA_Raven_SpySect_10_03"); //Quando avrai raggiunto il campo, tieni le orecchie ben aperte. Qualsiasi notizia riuscirai a raccogliere, potrebbe essere molto importante per noi.
	AI_Output (self, other,"DIA_Raven_SpySect_10_04"); //Più riuscirai a scoprire, meglio sarà. Dovrai usare molto tatto, non so se mi spiego.
	AI_Output (other, self,"DIA_Raven_SpySect_15_05"); //Tranquillo, non voglio farli arrabbiare.
	AI_Output (self, other,"DIA_Raven_SpySect_10_06"); //Ero certo che avresti capito.
	
	Raven_SpySect = LOG_RUNNING;
	
	Log_CreateTopic	(CH1_GoToPsi,	LOG_MISSION);
	Log_SetTopicStatus (CH1_GoToPsi,	LOG_RUNNING);
	B_LogEntry (CH1_GoToPsi,"Raven mi ha inviato dalla Fratellanza, per conto di Campo Vecchio. Devo fare un giro e tenere occhi e orecchie ben aperti. Forse riuscirò a ottenere delle informazioni utili per i baroni delle miniere.");
};

// *********************************************
// 				Ausrüstung
// *********************************************

INSTANCE DIA_Raven_Equipment (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Equipment_Condition;
	information	= DIA_Raven_Equipment_Info;
	permanent	= 0;
	description	= "Dove posso trovare un equipaggiamento migliore?";
};

FUNC INT DIA_Raven_Equipment_Condition()
{
	if (Raven_SpySect==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Equipment_Info()
{
	AI_Output	(other, self,"DIA_Raven_Equipment_15_00"); //Dove posso trovare un equipaggiamento migliore?
	AI_Output	(self, other,"DIA_Raven_Equipment_10_01"); //Vai da Diego, ti darà un'armatura. Ti aiuterà a non farti uccidere e servirà anche per identificarti.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_02"); //Ti permetterà l'accesso a tutti i luoghi in cui devi andare.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_03"); //Se hai bisogno di armi, vai a parlare con Skip. Lo troverai nel grande capanno in fondo, a sinistra del cortile del castello.

	Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"All'entrata del castello, Diego ha delle ARMATURE migliori per le ombre di Gomez.");
	if	!Npc_KnowsInfo(hero, DIA_Skip_First)
	{
		B_LogEntry	(GE_TraderOC,"Skip, la guardia che si trova presso il cortile posteriore, vende ARMI. Ma solo agli uomini di Gomez.");
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// *********************************************
// 				Spy Zwischenbericht
// *********************************************

INSTANCE DIA_Raven_SpyBericht (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpyBericht_Condition;
	information	= DIA_Raven_SpyBericht_Info;
	permanent	= 1;
	description	= "Pensavo di fare rapporto.";
};

FUNC INT DIA_Raven_SpyBericht_Condition()
{
	if ( Raven_SpySect==LOG_RUNNING )
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpyBericht_Info()
{
	AI_Output (other, self,"DIA_Raven_SpyBericht_15_00"); //Pensavo di fare rapporto.
	AI_Output (self, other,"DIA_Raven_SpyBericht_10_01"); //Bene. Mi piace essere sempre aggiornato.
	if (Npc_HasItems (other, itat_Crawlerqueen)>=1)
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output (other, self,"Org_826_Mordrag_RUNNING_15_04"); //La grande evocazione ha avuto luogo.
			AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Hai fatto un buon lavoro.
			Raven_SpySect=LOG_SUCCESS;
			B_GiveXP (XP_ReportToRaven);
			Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
			B_LogEntry (CH1_GoToPsi,"Raven mi ha raggirato! Non è proprio il tipo di comportamento che mi sarei aspettato da lui! D'ora in poi, deciderò da solo cosa fare!");
		}
		else
		{
			AI_Output (other, self,"DIA_Raven_SpyBericht_15_02"); //Ora vogliono un uovo di regina dei pidocchi delle miniere, per creare una pozione che li metta in contatto col Dormiente. Ho le uova con me.
			if (CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_03"); //Molto interessante. Mi chiedo se funzionerà. Porta le uova al tempio.
			}
			else
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Hai fatto un buon lavoro.
				Raven_SpySect=LOG_SUCCESS;
				B_GiveXP (XP_ReportToRaven);
				Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
				B_LogEntry (CH1_GoToPsi,"Raven mi ha raggirato! Non è proprio il tipo di comportamento che mi sarei aspettato da lui! D'ora in poi, deciderò da solo cosa fare!");
			};
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Raven_SpyBericht_15_05"); //Ancora non ho idea di cosa abbiano in mente.
		AI_Output (self, other,"DIA_Raven_SpyBericht_10_06"); //Allora perché mi hai disturbato?
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////


