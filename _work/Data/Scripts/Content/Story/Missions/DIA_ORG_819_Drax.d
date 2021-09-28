
// **************************************************
//						 EXIT 
// **************************************************

instance  Org_819_Drax_Exit (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 999;
	condition	= Org_819_Drax_Exit_Condition;
	information	= Org_819_Drax_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_819_Drax_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					 Ihr jagt hier...
// **************************************************

instance  Org_819_Drax_HuntHere (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_HuntHere_Condition;
	information	= Org_819_Drax_HuntHere_Info;
	permanent	= 0;
	description = "Sei a caccia, vero?";
};                       

FUNC int  Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_HuntHere_Info()
{
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_00"); //Sei a caccia, vero?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_01"); //Così sembra... Cosa vuoi?
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_02"); //Hai qualche consiglio sulla caccia?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_03"); //Posso insegnarti alcune cose, ma tutto ha un prezzo.
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_04"); //E sarebbe?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_05"); //Per cominciare, un bel sorso di birra. Poi si vedrà.
};

// **************************************************
//				Scavenger jagen + Bier
// **************************************************
	var int drax_bierbekommen;
	var int drax_Lehrer_frei;
// **************************************************

instance  Org_819_Drax_Scavenger (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Scavenger_Condition;
	information	= Org_819_Drax_Scavenger_Info;
	permanent	= 1;
	description = "Ecco: bevi la birra e parlami della caccia.";
};                       

FUNC int  Org_819_Drax_Scavenger_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_819_Drax_HuntHere) && (drax_bierbekommen==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Scavenger_Info()
{
	if (Npc_HasItems(other,itfobeer)>0)
	{
		B_GiveInvItems	(other, self, itfobeer,1);
	
		AI_Output	(other, self,"Org_819_Drax_Scavenger_15_00"); //Ecco: bevi la birra e parlami della caccia.
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem	(self,	ItFobeer);
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_01"); //I saprofagi (così chiamiamo i grossi uccelli) devono essere attaccati uno dopo l'altro. Non è difficile separarne uno dallo stormo.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_02"); //Se ti avvicini troppo li irriti e, dopo un po', ti puntano addosso. In quel caso, farai meglio ad attenderli con l'arma in pugno.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_03"); //Se riesci a colpire per primo, devi continuare ad attaccare. In questo modo, potrai sconfiggere la creature senza subire danni.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_04"); //Se è LEI a colpire TE per prima... Beh, non permetterglielo!
		drax_bierbekommen = TRUE;
	}
	else
	{
		AI_Output (other, self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //Non ho birra.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //Allora vai a prenderla. Questo è il miglior consiglio che posso darti gratis. Già che ci sei, porta anche un po' di metallo!
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //Posso darti delle informazioni sugli animali, ma ti costeranno!
	};	
	drax_Lehrer_frei = TRUE;
	
	Log_CreateTopic	(GE_TeacherOW, LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Drax il ladro si è offerto d'insegnarmi a sventrare gli animali, se posso permettermi i suoi prezzi. Lo troverò che caccia, sulla strada che collega la piazza del mercato a Campo Vecchio.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_819_Drax_Creatures (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Creatures_Condition;
	information	= Org_819_Drax_Creatures_Info;
	permanent	= 1;
	description = "Cos'altro puoi dirmi sulla caccia?";
};                       

FUNC int  Org_819_Drax_Creatures_Condition()
{
	if ( Drax_Lehrer_frei == TRUE )
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Creatures_Info()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_15_00"); //Cos'altro puoi dirmi sulla caccia?
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_06_01"); //Molto. Ma ti costerà più di una birra.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_02"); //Se sai come fare, puoi prendere denti, mascelle e pelle delle creature. Non è facile, ma sono oggetti di valore.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_03"); //Qualsiasi mercante te li pagherà molto bene.
		
		Info_ClearChoices(Org_819_Drax_Creatures);
		Info_AddChoice   (Org_819_Drax_Creatures, DIALOG_BACK 													,Org_819_Drax_Creatures_BACK);
		Info_AddChoice   (Org_819_Drax_Creatures,"I tuoi consigli sono molto cari.",Org_819_Drax_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_819_Drax_Creatures,"Rimuovi i denti (costo: 1 punto abilità e 50 pezzi di metallo)",Org_819_Drax_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Rimuovi la pelliccia (costo: 1 punto abilità e 100 pezzi di metallo)",Org_819_Drax_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Rimuovi gli artigli (costo: 1 punto abilità e 50 pezzi di metallo)",Org_819_Drax_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Scuoia i serpenti (costo: 1 punto abilità e 100 pezzi di metallo)",Org_819_Drax_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //Ti ho detto tutto ciò che so.
	};
};

func void Org_819_Drax_Creatures_BACK()
{
	Info_ClearChoices(Org_819_Drax_Creatures);
};

func void Org_819_Drax_Creatures_PrettyMuch()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //I tuoi consigli sono molto cari.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //Può essere, ma ti permetteranno di guadagnare parecchio metallo.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //Tutti gli animali che ucciderai senza sezionarli, andranno in decomposizione.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //Quindi non dimenticare di scuoiarli e venderne la pelliccia a caro prezzo.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //Se fossi in te, cercherei d'imparare a farlo il prima possibile.
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Zahn_15_00"); //Come faccio a prendere i denti?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Impara: estrarre i denti", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_01"); //La cosa più importante è stare attenti che non si scheggino. Punta il coltello al centro del dente ed estrailo con cura.
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_02"); //Puoi prendere i denti a lupi, mostri d'ombra e laceratori.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Come rimuovere i denti di lupi, cani orco, laceratori, sbranatori, segugi, mostri d'ombra.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //Dovrai fare molta esperienza, altrimenti i miei insegnamenti non serviranno a nulla.
			PrintScreen	("Punti abilità insufficienti!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //Prima voglio vedere il metallo. Come ho già detto: tutto ha un prezzo.
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Fell_15_00"); //Come faccio a scuoiare le creature?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self, itminugget,100);
			
			PrintScreen	("Impara: scuoiare", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_01"); //Ricorda sempre di partire da dietro. Una volta che avrai fatto pratica, ti sarà facile. Le pelli vengono pagate molto!
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_02"); //Le pelli di lupo e dei mostri d'ombra sono usate per produrre vestiti. Esaminando l'animale ucciso, capirai se puoi utilizzare la sua pelle. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Come rimuovere la pelliccia di lupi, cani orco, mostri d'ombra e troll.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //Dovrai fare molta esperienza, altrimenti i miei insegnamenti non serviranno a nulla.
			PrintScreen	("Punti abilità insufficienti!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //Prima voglio vedere il metallo. Come ho già detto: tutto ha un prezzo.
	};
};

func void Org_819_Drax_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Impara: rimuovere le zanne", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_819_Drax_Creatures_Kralle_15_00"); //Mostrami come estrarre le mascelle!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_01"); //È molto semplice, se sai come fare. Spingi la mascella in avanti - mai indietro - e NON tirarla verso l'esterno!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_02"); //Puoi prelevarle soprattutto dalle lucertole. D'ora in poi, saprai quali animali possono fornirti mascelle.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Come rimuovere le zanne di lucertole, laceratori, imboscatori, sbranatori, squartatori.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //Dovrai fare molta esperienza, altrimenti i miei insegnamenti non serviranno a nulla.
			PrintScreen	("Punti abilità insufficienti!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //Prima voglio vedere il metallo. Come ho già detto: tutto ha un prezzo.
	};
};

func void Org_819_Drax_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Impara: scuoiare lucertole", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_819_Drax_Creatures_Haut_15_00"); //A cosa devo stare attento, quando scuoio i rettili?
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_01"); //Gli unici rettili utili a questo scopo sono gli imboscatori e gli squali di palude.
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_02"); //Incidi la pelle sui lati e verrà via da sola. D'ora in poi, dovresti essere in grado di scuoiare i rettili.
				
			Knows_GetHide = TRUE;
			
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Come scuoiare lucertole e squali di palude.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //Dovrai fare molta esperienza, altrimenti i miei insegnamenti non serviranno a nulla.
			PrintScreen	("Punti abilità insufficienti!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //Prima voglio vedere il metallo. Come ho già detto: tutto ha un prezzo.
	};
};
