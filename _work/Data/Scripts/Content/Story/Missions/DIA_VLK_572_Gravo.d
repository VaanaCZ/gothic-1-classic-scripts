// **************************************************
//						 EXIT 
// **************************************************

instance DIA_Gravo_Exit (C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 999;
	condition		= DIA_Gravo_Exit_Condition;
	information		= DIA_Gravo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT DIA_Gravo_Exit_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hallo
// **************************************************

instance DIA_Gravo_Hallo(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_Hallo_Condition;
	information		= DIA_Gravo_Hallo_Info;
	permanent		= 0;
	description 	= "Come va?";
};                       

FUNC INT DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gravo_Hallo_15_00"); //Come va?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_01"); //Da quando ho smesso di lavorare in miniera, non posso lamentarmi.
	AI_Output (other, self,"DIA_Gravo_Hallo_15_02"); //E da dove prendi il metallo?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_03"); //Aiuto la gente che ha problemi.
	AI_Output (self, other,"DIA_Gravo_Hallo_04_04"); //Se ti metti nei guai con una persona importante, posso aiutarti a sistemare le cose.
};

// **************************************************
//						HelpHow
// **************************************************

instance DIA_Gravo_HelpHow(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_HelpHow_Condition;
	information		= DIA_Gravo_HelpHow_Info;
	permanent		= 0;
	description 	= "Se mi trovassi nei guai, TU potresti aiutarmi? E come?";
};                       

FUNC INT DIA_Gravo_HelpHow_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_HelpHow_Info()
{
	AI_Output (other, self,"DIA_Gravo_HelpHow_15_00"); //Se mi trovassi nei guai, TU potresti aiutarmi? E come?
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_01"); //Facciamo finta che ti trovi nei guai con Thorus. Faresti meglio a evitare una situazione del genere, ma non si sa mai.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_02"); //Thorus è molto ostinato. Se lo fai incazzare anche una sola volta, non ti rivolge più la parola. Questo non è bene.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_03"); //Dato che sei un novellino, dipendi da lui. Allora vieni da me. Conosco un sacco di gente di cui Thorus si fida.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_04"); //Loro metteranno una buona parola per te e Thorus tornerà a essere tuo amico. Ovviamente, i ragazzi vogliono del metallo in cambio. Il tuo metallo.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_05"); //Io faccio in modo che il tuo metallo arrivi alle persone giuste...

	B_LogEntry(GE_TraderOC,"Gravo il minatore offre un particolare tipo di servizio: se mi metto nei guai con la gente importante del campo, posso pagarlo affinché sistemi le cose.");
};

// **************************************************
//						HelpAngryNow
// **************************************************

//---------------------------------------------------
func void B_Gravo_HelpAttitude(var C_NPC prob)
{
	if (Npc_GetPermAttitude(prob, other)==ATT_ANGRY)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //Esatto, sei sulla sua lista nera.
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //Conosco qualcuno che può parlargli. Dammi 10 pezzi di metallo e il problema sarà risolto.
		if (Npc_HasItems(other,itminugget)>=100)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Vediamo quanto metallo hai... Ah! Dovrebbe bastare. Puoi considerare sistemata la questione.
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //E non parlarne a nessuno. Comportati come se nulla fosse accaduto.
			B_GiveInvItems (hero, self, itminugget, 100);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //I don't have that much.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Then I can't do anything for you - I'm sorry, boy.
		};
		
	}
	else if (Npc_GetPermAttitude(prob, other)==ATT_HOSTILE)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //Questo lo chiami un problema? È molto peggio, amico! Credo che lui voglia farti a pezzettini!
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //Non riuscirò a convincere qualcuno a calmarlo per meno di 500 pezzi di metallo.
		if (Npc_HasItems(other,itminugget)>=500)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Vediamo cosa hai qui... Sei ricco, ragazzo. Prenderò i 500 pezzi e sistemerò la faccenda.
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //E ricorda. Non dovrà mai sapere che sono stato io a mettere a posto le cose, quindi non parlarne con nessuno. Capito?
			B_GiveInvItems (hero, self, itminugget, 500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Non ho tanto metallo.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Allora non posso fare nulla per te. Mi dispiace, ragazzo.
		};
	}
	else
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_NoProb_04_00"); //Per quel che ne so, non ce l'ha con te. Non preoccuparti, ragazzo.
	};
};

//---------------------------------------------------

instance DIA_Gravo_HelpAngryNow(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_HelpAngryNow_Condition;
	information		= DIA_Gravo_HelpAngryNow_Info;
	permanent		= 1;
	description 	= "Puoi aiutarmi? Credo di avere un problema.";
};                       

FUNC INT DIA_Gravo_HelpAngryNow_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_HelpHow))
	{
		return 1;
	};
};

func VOID DIA_Gravo_HelpAngryNow_Info()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_15_00"); //Puoi aiutarmi? Credo di avere un problema.
	AI_Output (self, other,"DIA_Gravo_HelpAngryNow_04_01"); //Lo penso anch'io. Ti avverto: il mio aiuto ti costerà fra i 100 e i 500 pezzi di metallo.
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, DIALOG_BACK			,DIA_Gravo_HelpAngryNow_BACK);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Aiutami con Diego.",DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Aiutami con Thorus.",DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Aiutami con Gomez.",DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Diego_15_00"); //Aiutami con Diego.
	var C_NPC diego; diego = Hlp_GetNpc (PC_Thief);
	B_Gravo_HelpAttitude(diego);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Thorus_15_00"); //Aiutami con Thorus.
	var C_NPC thorus; thorus = Hlp_GetNpc (Grd_200_Thorus);
	B_Gravo_HelpAttitude(thorus);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Gomez_15_00"); //Aiutami con Gomez.
	var C_NPC gomez; gomez = Hlp_GetNpc (Ebr_100_Gomez);
	B_Gravo_HelpAttitude(gomez);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

// **************************************************
//						Influence
// **************************************************

instance DIA_Gravo_Influence(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 2;
	condition		= DIA_Gravo_Influence_Condition;
	information		= DIA_Gravo_Influence_Info;
	permanent		= 1;
	description 	= "Puoi dirmi chi sono le persone importanti?";
};                       

FUNC INT DIA_Gravo_Influence_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_Influence_Info()
{
	AI_Output (other, self,"DIA_Gravo_Influence_15_00"); //Puoi dirmi quali sono le Ombre importanti?
	AI_Output (self, other,"DIA_Gravo_Influence_04_01"); //Vuoi fare colpo sulla gente giusta, vero?
	AI_Output (self, other,"DIA_Gravo_Influence_04_02"); //Diego è l'Ombra più potente. I suoi aiutanti sono Fingers, Whistler e Sly.
	AI_Output (self, other,"DIA_Gravo_Influence_04_03"); //Dexter e Fisk vendono la propria merce alla piazza del mercato. Hanno molti clienti, anche fra le guardie, e questo li rende molto influenti.
	AI_Output (self, other,"DIA_Gravo_Influence_04_04"); //Poi c'è Scatty. Gestisce l'arena e decide chi far combattere. Molta gente gli deve del metallo, quindi anche lui è importante.
	
	Log_CreateTopic (GE_TraderOC, LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Dexter e Fisk commerciano in molti tipi di merce, alla piazza del mercato.");

	
};











