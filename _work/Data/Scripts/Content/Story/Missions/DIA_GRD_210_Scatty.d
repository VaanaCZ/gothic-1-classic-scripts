// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Scatty_Exit (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 999;
	condition	= DIA_Scatty_Exit_Condition;
	information	= DIA_Scatty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Scatty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Was machst du hier 
// **************************************************

INSTANCE DIA_Scatty_WhatDoYouDo (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WhatDoYouDo_Condition;
	information	= DIA_Scatty_WhatDoYouDo_Info;
	permanent	= 0;
	description = "Cosa stai facendo?";
};                       

FUNC INT DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output (other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //Qual è il tuo compito?
	AI_Output (self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //Sono responsabile dell'arena. Organizzo le scommesse, ingaggio i nuovi combattenti...
};

// **************************************************
// 					 Join OC
// **************************************************
	var int Scatty_ChargeKirgo;
	var int Scatty_ChargeKharim;
	var int Scatty_ChargeGorHanis;
// **************************************************

INSTANCE DIA_Scatty_JoinOC (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_JoinOC_Condition;
	information	= DIA_Scatty_JoinOC_Info;
	permanent	= 0;
	description = "Voglio unirmi al campo. Puoi aiutarmi?";
};                       

FUNC INT DIA_Scatty_JoinOC_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Scatty_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Scatty_JoinOC_15_00"); //Voglio unirmi al campo. Puoi aiutarmi?
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_01"); //Potrei, se tu riuscissi a farmi una buona impressione.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_02"); //Alcuni fra i migliori combattenti di tutti e tre i campi vengono qui per sfidarsi.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_03"); //Sfidane uno. Io guarderò e, se sarai in gamba, forse ci penserò su.
	
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kharim;	Kharim = Hlp_GetNpc(Sld_729_Kharim);		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC GorHanis;	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	
	B_LogEntry( CH1_JoinOC,"Scatty, il gestore dell'arena, rimarrà molto colpito se sfiderò uno dei suoi combattenti.");
};

// **************************************************
// 					 KIRGO SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KirgoSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KirgoSuccess_Condition;
	information	= DIA_Scatty_KirgoSuccess_Info;
	permanent	= 0;
	description = "Ho combattuto contro Kirgo!";
};                       

FUNC INT DIA_Scatty_KirgoSuccess_Condition()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			

	if ( (Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ( (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KirgoSuccess_Info()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);	
	
	AI_Output (other,self,"DIA_Scatty_KirgoSuccess_15_00"); //Ho combattuto contro Kirgo!
	if (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_01"); //E hai perso!
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_02"); //Ovviamente non crederai di avermi impressionato...
		Scatty_ChargeKirgo = LOG_FAILED;
		
		B_LogEntry( CH1_JoinOC,"Scatty non è rimasto molto colpito dalla mia sconfitta contro Kirgo.");
	}
	else if (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_03"); //E l'hai sconfitto! Non male, per un principiante!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"Scatty è rimasto colpito dal mio combattimento con Kirgo.");
		B_GiveXP (XP_kirgovictory);
	};
};

// **************************************************
// 					 KHARIM SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KHARIMSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KHARIMSuccess_Condition;
	information	= DIA_Scatty_KHARIMSuccess_Info;
	permanent	= 0;
	description = "Ho combattuto contro Kharim!";
};                       

FUNC INT DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);			

	if ( (Scatty_ChargeKHARIM == LOG_RUNNING) && (Kharim_Charged == TRUE) && ( (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KHARIMSuccess_Info()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);	
	
	AI_Output (other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //Ho combattuto contro Kharim!
	if (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //E come ti ha ridotto male!
		if (Npc_GetTrueGuild (hero) == GIL_NONE)
		{
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //Hai scelto l'avversario giusto! Non sopporto quei bastardi di Campo Nuovo.
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Sei esattamente il tipo di uomo che cercavamo!
		};
		Scatty_ChargeKHARIM = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry( CH1_JoinOC,"Sono stato battuto da Kharim! Scatty ha apprezzato il mio coraggio, ma non la tecnica.");
		
	}
	else if (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //E l'hai sconfitto! Devo ammetterlo: te la sei cavata bene! È sempre stato uno dei combattenti più forti.
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //Sono davvero colpito!
		Scatty_ChargeKHARIM = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"Ho battuto Kharim! Scatty è rimasto molto colpito.");
		B_GiveXP(XP_kharimvictory);
	};
};


// **************************************************
// 				 Warum andere Lager Kämpfer
// **************************************************

INSTANCE DIA_Scatty_OtherCamps (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_OtherCamps_Condition;
	information	= DIA_Scatty_OtherCamps_Info;
	permanent	= 0;
	description = "Perché permetti alla gente di altri campi di combattere qui?";
};                       

FUNC INT DIA_Scatty_OtherCamps_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_OtherCamps_Info()
{
	AI_Output (other,self,"DIA_Scatty_OtherCamps_15_00"); //Pensavo che Campo Vecchio e Campo Nuovo non fossero in gamba. Perché permetti alla loro gente di combattere qui?
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_01"); //È semplice: si combatte una volta alla settimana, ai minatori piace vedere un ladro di Campo Nuovo che viene fatto a pezzi.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_02"); //Se uno di loro combatte, le scommesse aumentano, e questo è ottimo per il mio lavoro!
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_03"); //Personalmente, detesto quei porci di Campo Nuovo. Ma il lavoro è lavoro...
};

// **************************************************
// 					Will Wetten
// **************************************************

INSTANCE DIA_Scatty_WannaBet (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaBet_Condition;
	information	= DIA_Scatty_WannaBet_Info;
	permanent	= 1;
	description = "Voglio scommettere.";
};                       

FUNC INT DIA_Scatty_WannaBet_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_WannaBet_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaBet_15_00"); //Voglio scommettere.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_01"); //Ma non ci sono combattimenti.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_02"); //Il prossimo avrà luogo fra un paio di giorni. Farò un annuncio pubblico.
	
};

// **************************************************
// 					Will Kämpfen
// **************************************************

INSTANCE DIA_Scatty_WannaFight (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaFight_Condition;
	information	= DIA_Scatty_WannaFight_Info;
	permanent	= 1;
	description = "Voglio combattere nell'arena!";
};                       

FUNC INT DIA_Scatty_WannaFight_Condition()
{
//	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
//	{
//		return 1;
//	};
};

FUNC VOID DIA_Scatty_WannaFight_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaFight_15_00"); //Voglio combattere nell'arena!
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_01"); //Non posso permetterlo, finché non ti sarai unito a uno dei campi.
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_02"); //A nessuno interessa un combattente indipendente!
};

// **************************************************
// 					TRAIN
// **************************************************

INSTANCE DIA_Scatty_TRAIN (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 10;
	condition	= DIA_Scatty_TRAIN_Condition;
	information	= DIA_Scatty_TRAIN_Info;
	permanent	= 1;
	description = "Tu addestri i combattenti?";
};                       

FUNC INT DIA_Scatty_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_TRAIN_Info()
{
	if( log_scattytrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
    B_LogEntry(GE_TeacherOC,"Scatty, il gestore dell'arena, può insegnarmi a combattere con le ARMI A UNA MANO.");
    log_scattytrain = TRUE;
    };
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_00"); //Tu addestri i combattenti?
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_01"); //Sì, ma non per divertimento. Se desideri che ti addestri, devi pagare.


	Info_ClearChoices	(DIA_Scatty_TRAIN );
	Info_AddChoice		(DIA_Scatty_TRAIN,DIALOG_BACK		,DIA_Scatty_TRAIN_BACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,150)	,DIA_Scatty_TRAIN_2h);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,50)	,DIA_Scatty_TRAIN_1h);
	};
};

func void DIA_Scatty_TRAIN_BACK()
{
	Info_ClearChoices	(DIA_Scatty_TRAIN );
};

func void DIA_Scatty_TRAIN_1h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Voglio migliorare la mia abilità con le armi a una sola mano.
	
	if (Npc_HasItems(other,itminugget) >= 50)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_01"); //Ottima decisione! Prima di migliorare la tecnica, devi imparare a tenere l'arma.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Spesso i principianti tendono a tenere queste armi con entrambe le mani. Non prendere quest'abitudine, non ti aiuterà.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Afferra l'arma con una mano, con la lama rivolta verso l'alto, e falla oscillare.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Devi imparare a coordinare il movimento dell'arma con quello del corpo, per colpire più velocemente.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Tieni a mente ciò che ti ho insegnato e i tuoi combattimenti saranno più veloci ed eleganti.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_06"); //Ah, già! Ancora una cosa: alcuni colpi causano più danni di altri! Come principiante, non hai molte possibilità di sferrare un colpo mortale.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Comunque, man mano che progredirai, ti sarà più facile.
			B_GiveInvItems(other,self,itminugget,50);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Non hai abbastanza metallo!
	};
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Insegnami a maneggiare meglio le armi a una mano.
	
	if (Npc_HasItems(other,itminugget) >= 150)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //Bene. Le basi le conosci già. Tenendo bassa l'arma, il tuo primo colpo sarà più potente.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Ricordi? Sfrutta l'oscillazione! Bene, ora devi usare di più il corpo. Quando hai colpito due volte, gira su te stesso. Ciò confonderà l'avversario e ti metterà in una posizione privilegiata.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //A questo punto, porta nuovamente la lama da destra a sinistra.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //E di nuovo davanti. Non dimenticare: l'esercizio rende perfetti. Quindi continua a fare pratica con le armi a una mano.
			B_GiveInvItems(other,self,itminugget,150);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //Torna quando avrai abbastanza metallo!
	};
};
