// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Aidan_Exit (C_INFO)
{
	npc			= ORG_859_Aidan;
	nr			= 999;
	condition	= DIA_Aidan_Exit_Condition;
	information	= DIA_Aidan_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Aidan_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Aidan_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ****************************************
// 				Hallo
// ****************************************

instance DIA_Aidan_Hello (C_INFO)
{
	npc				= Org_859_Aidan;
	nr				= 1;
	condition		= DIA_Aidan_Hello_Condition;
	information		= DIA_Aidan_Hello_Info;
	permanent		= 0;
	description		= "Cosa stai facendo?";
};

FUNC int  DIA_Aidan_Hello_Condition()
{	
	return 1;
};

func void  DIA_Aidan_Hello_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Cosa stai facendo?
	AI_Output (self, other,"DIA_Aidan_Hello_13_01"); //Sono un cacciatore. Mi guadagno da vivere vendendo pelli e denti.
	AI_Output (other, self,"DIA_Aidan_Hello_15_02"); //Frutta abbastanza?
	AI_Output (self, other,"DIA_Aidan_Hello_13_03"); //Sì, se conosci il modo giusto di tagliare gli animali.

	Log_CreateTopic	(GE_TeacherOW,	LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Aidan, un cacciatore che vive sulla strada fra Campo Vecchio e Campo Nuovo, può insegnarmi a sventrare gli animali.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_859_Aidan_Creatures (C_INFO)
{
	npc			= Org_859_Aidan;
	nr			= 1;
	condition	= Org_859_Aidan_Creatures_Condition;
	information	= Org_859_Aidan_Creatures_Info;
	permanent	= 1;
	description = "Voglio imparare a scuoiare gli animali.";
};                       

FUNC int  Org_859_Aidan_Creatures_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Aidan_Hello))
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_859_Aidan_Creatures_Info()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_15_00"); //Voglio imparare a tagliare gli animali.
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_13_01"); //Cosa vuoi sapere?
		
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice   (Org_859_Aidan_Creatures, DIALOG_BACK 											,Org_859_Aidan_Creatures_BACK);

		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_859_Aidan_Creatures,"Rimuovi i denti (costo: 1 punto abilità e 50 pezzi di metallo)",Org_859_Aidan_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Rimuovi la pelliccia (costo: 1 punto abilità e 100 pezzi di metallo)",Org_859_Aidan_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Rimuovi gli artigli (costo: 1 punto abilità e 50 pezzi di metallo)",Org_859_Aidan_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Scuoia i serpenti (costo: 1 punto abilità e 100 pezzi di metallo)",Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //Ti ho insegnato tutto ciò che so.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Zahn_15_00"); //Come faccio a prendere i denti?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Impara: estrarre i denti", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_01"); //La cosa più importante è stare attenti che non si scheggino. Punta il coltello al centro del dente ed estrailo con cura.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_02"); //Puoi prendere i denti a lupi, mostri d'ombra e laceratori.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Come rimuovere i denti di lupi, cani orco, laceratori, sbranatori, segugi, mostri d'ombra.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Dovrai fare molta esperienza, altrimenti i miei insegnamenti non serviranno a nulla.
			PrintScreen	("Punti abilità insufficienti!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Prima voglio vedere il metallo. Come ho già detto: tutto ha un prezzo.
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Fell_15_00"); //Come faccio a scuoiare le creature?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Impara: scuoiare", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_01"); //Ricorda sempre di partire da dietro. Una volta che avrai fatto pratica, ti sarà facile. Le pelli vengono pagate molto!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_02"); //Le pelli di lupo e dei mostri d'ombra sono usate per produrre vestiti. Esaminando l'animale ucciso, capirai se puoi utilizzare la sua pelle. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Come rimuovere la pelliccia di lupi, cani orco, mostri d'ombra e troll.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Dovrai fare molta esperienza, altrimenti i miei insegnamenti non serviranno a nulla.
			PrintScreen	("Punti abilità insufficienti!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Prima voglio vedere il metallo. Come ho già detto: tutto ha un prezzo.
	};
};

func void Org_859_Aidan_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Impara. rimuovere le zanne", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_859_Aidan_Creatures_Kralle_15_00"); //Mostrami come estrarre le mascelle!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_01"); //È molto semplice, se sai come fare. Spingi la mascella in avanti - mai indietro - e NON tirarla verso l'esterno!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Puoi prelevarle soprattutto dalle lucertole. D'ora in poi, saprai quali animali possono fornirti mascelle.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Come rimuovere le zanne di lucertole, laceratori, imboscatori, sbranatori, squartatori.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Dovrai fare molta esperienza, altrimenti i miei insegnamenti non serviranno a nulla.
			PrintScreen	("Punti abilità insufficienti!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Prima voglio vedere il metallo. Come ho già detto: tutto ha un prezzo.
	};
};

func void Org_859_Aidan_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Impara: scuoiare lucertole", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_859_Aidan_Creatures_Haut_15_00"); //A cosa devo stare attento, quando scuoio i rettili?
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_01"); //Gli unici rettili utili a questo scopo sono gli imboscatori e gli squali di palude.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_02"); //Incidi la pelle sui lati e verrà via da sola. D'ora in poi, dovresti essere in grado di scuoiare i rettili.
				
			Knows_GetHide = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Come scuoiare lucertole e squali di palude.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Dovrai fare molta esperienza, altrimenti i miei insegnamenti non serviranno a nulla.
			PrintScreen	("Punti abilità insufficienti!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Prima voglio vedere il metallo. Come ho già detto: tutto ha un prezzo.
	};
};
