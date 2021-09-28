// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_315_Sly_Exit (C_INFO)
{
	npc			= STT_315_Sly;
	nr 			= 999;
	condition	= DIA_STT_315_Sly_Exit_Condition;
	information	= DIA_STT_315_Sly_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_315_Sly_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_315_Sly_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begrüssung 
// **************************************************

instance DIA_STT_315_Sly (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_Condition;
	information		= DIA_STT_315_Sly_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_STT_315_Sly_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_Info()
{
	AI_SetWalkmode	(self, NPC_WALK);
	AI_GotoNpc		(self, other);
	AI_Output		(self, other,"DIA_STT_315_Sly_10_01"); //Sei nuovo, vero? Non conosco il tuo viso.
	AI_Output		(self, other,"DIA_STT_315_Sly_10_02"); //Io sono Sly. Ho un lavoro per un nuovo arrivato.
};

// **************************************************
// 					Erste Begrüssung 
// **************************************************
	var int Sly_LostNek;
// **************************************************

INSTANCE DIA_STT_315_LostNek (C_INFO)
{
	npc				= STT_315_Sly;
	nr 				= 1;
	condition		= DIA_STT_315_LostNek_Condition;
	information		= DIA_STT_315_LostNek_Info;
	permanent		= 0;
	description		= "Hai un lavoro per me? Di che si tratta?";
};

FUNC INT DIA_STT_315_LostNek_Condition()
{	
	return 1;		
};

func VOID DIA_STT_315_LostNek_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_15_00"); //Hai un lavoro per me? Di che si tratta?
	AI_Output (self, other,"DIA_STT_315_LostNek_10_01"); //Una delle guardie è sparita! Si chiama Nek. Deve essere passata a Campo Nuovo.
	AI_Output (self, other,"DIA_STT_315_LostNek_10_02"); //Siccome sei nuovo, andrai parecchio in giro, Tieni gli occhi aperti.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_03"); //Se lo troverai, parlerò bene di te.
	};
	Info_ClearChoices	(DIA_STT_315_LostNek);
	Info_AddChoice		(DIA_STT_315_LostNek,"Vedrò se riesco a trovarlo.",DIA_STT_315_LostNek_DoIt);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_STT_315_LostNek,"Che ci faccio con le tue parole?",DIA_STT_315_LostNek_Why);
	};
};

func void DIA_STT_315_LostNek_Why()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_Why_15_00"); //Che ci faccio con le tue parole?
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_01"); //Se vuoi entrare a far parte del campo, è fondamentale che la gente parli bene di te.
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_02"); //Se parlerò di te con Diego, ti tornerà molto utile.
};

func void DIA_STT_315_LostNek_DoIt()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_00"); //Vedrò se riesco a trovarlo.
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_01"); //Se incontri Fletcher, chiedigli di Nek. È lui che si occupa del suo distretto, da quando è sparito.
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_02"); //Dove si trova?
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_03"); //Il suo distretto è quello dell'arena.
	Sly_LostNek = LOG_RUNNING;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Sly l'Ombra ha promesso di parlare bene di me con Diego, se riuscirò a rintracciare Nek. Pare che la guardia sia passata a Campo Nuovo. Farò bene a chiedere informazioni a Fletcher, nel distretto dell'arena.");
	}
	else
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Sly l'Ombra mi ha chiesto di rintracciare Nek. Pare che la guardia sia passata a Campo Nuovo. Farò bene a chiedere informazioni a Fletcher, nel distretto dell'arena.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNek );
	AI_StopProcessInfos	(self);
};

// **************************************************
// 						SUCCESS
// **************************************************

INSTANCE DIA_STT_315_LostNekSuccess (C_INFO)
{
	npc				= STT_315_Sly;
	nr 				= 1;
	condition		= DIA_STT_315_LostNekSuccess_Condition;
	information		= DIA_STT_315_LostNekSuccess_Info;
	permanent		= 1;
	description		= "Ho trovato Nek.";
};

FUNC INT DIA_STT_315_LostNekSuccess_Condition()
{	
	if ( (Sly_LostNek == LOG_RUNNING) && (Npc_HasItems(other,Neks_Amulett) > 0) )
	{
		return 1;
	};
};

func VOID DIA_STT_315_LostNekSuccess_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_15_00"); //Ho trovato Nek.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_10_01"); //Ottimo! Hai qualche prova?
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"No. Temo di no.",DIA_STT_315_LostNekSuccess_NoProof);
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Aveva addosso questo amuleto. Eccolo.",DIA_STT_315_LostNekSuccess_Proof);
};

func void DIA_STT_315_LostNekSuccess_Proof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //Aveva addosso questo amuleto. Eccolo.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //In effetti, era proprio questo che cercavo. Sei un tipo in gamba!
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //Probabilmente sei stato tentato di tenertelo, ma hai preso la decisione giusta.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& hero.guild == GIL_NONE
	{
		AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //Se Diego mi chiede di te, voterò a tuo favore.
	};
	Sly_LostNek = LOG_SUCCESS;
	
	B_GiveInvItems (other, self, Neks_Amulett, 1);
	
	Log_SetTopicStatus		(CH1_LostNek, LOG_SUCCESS);
	B_LogEntry				(CH1_LostNek,"Ho consegnato a Sly l'amuleto di Nek. È rimasto impressionato dalla mia onestà.");
	
	B_GiveXP (XP_Slysearchfornek);		
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC, LOG_RUNNING);
		B_LogEntry			(CH1_JoinOC,"Ho consegnato a Sly l'amuleto di Nek. Parlerà bene di me con Diego.");
	}
	else
	{	
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus  (CH1_JoinOC, LOG_FAILED);
		B_LogEntry			(CH1_JoinOC,"Ho consegnato a Sly l'amuleto di Nek. Peccato che non ne ricaverò nulla: non posso più entrare a far parte di Campo Vecchio.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};


func void DIA_STT_315_LostNekSuccess_NoProof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //No. Temo di no.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //Oh? Non mi nascondi nulla, vero? Nek aveva un amuleto con sé.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //Non mi piace la gente che si tiene ciò che mi appartiene. Se trovi l'amuleto, riportamelo!
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //Penserò a te, quando terrò in mano l'amuleto.
	
	B_LogEntry( CH1_LostNek,"Sly vuole l'amuleto di Nek.");
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************

instance DIA_STT_315_Sly_AfterSuccess (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_AfterSuccess_Condition;
	information		= DIA_STT_315_Sly_AfterSuccess_Info;
	permanent		= 1;
	description		= "Come va?";
	
};

FUNC int DIA_STT_315_Sly_AfterSuccess_Condition()
{
	if ( (Kapitel == 1) && (Sly_LostNek == LOG_SUCCESS) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_AfterSuccess_Info()
{
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_00"); //Come va?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //Bene! Non devi più preoccuparti di ciò che dirò a Diego!
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //Tu fai un favore a me, io faccio un favore a te. Giusto?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //Così vanno le cose.
};


	
	
	




		
		
