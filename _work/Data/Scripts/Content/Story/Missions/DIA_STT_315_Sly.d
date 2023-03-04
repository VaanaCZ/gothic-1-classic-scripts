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
	AI_Output		(self, other,"DIA_STT_315_Sly_10_01"); //Nouveau,  n'est-ce pas ? Je ne connais pas ton visage.
	AI_Output		(self, other,"DIA_STT_315_Sly_10_02"); //Je m'appelle Sly. J'ai du travail à offrir pour un nouveau venu.
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
	description		= "Tu as un travail pour moi ? Qu'est-ce que c'est ?";
};

FUNC INT DIA_STT_315_LostNek_Condition()
{	
	return 1;		
};

func VOID DIA_STT_315_LostNek_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_15_00"); //Tu as un travail pour moi ? Qu'est-ce que c'est ?
	AI_Output (self, other,"DIA_STT_315_LostNek_10_01"); //Une de nos gardes a disparu ! Il s'appelle Nek. Il a peut-être fait un saut au Nouveau camp.
	AI_Output (self, other,"DIA_STT_315_LostNek_10_02"); //Tu es nouveau ici et tu circuleras beaucoup. A présent ouvre l'oeil.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_03"); //Si tu le trouves, je parlerai en ta faveur dans le camp.
	};
	Info_ClearChoices	(DIA_STT_315_LostNek);
	Info_AddChoice		(DIA_STT_315_LostNek,"Je vais voir si je peux le trouver.",DIA_STT_315_LostNek_DoIt);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_STT_315_LostNek,"Et qu'est-ce que le fait de parler en ma faveur m'apportera ?",DIA_STT_315_LostNek_Why);
	};
};

func void DIA_STT_315_LostNek_Why()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_Why_15_00"); //Et qu'est-ce que le fait de parler en ma faveur m'apportera ?
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_01"); //Si tu veux rejoindre le camp, tu as besoin de personnes pour parler en ta faveur.
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_02"); //Si je parle en ta faveur à Diego, ça pourrait t'être d'un grand secours.
};

func void DIA_STT_315_LostNek_DoIt()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_00"); //Je vais voir si je peux le trouver.
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_01"); //Si tu rencontres Fletcher, interroge-le au sujet de Nek. Il a pris son secteur puisque Nek a disparu.
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_02"); //Où le trouverai-je ?
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_03"); //Son secteur est la zone de l'arène.
	Sly_LostNek = LOG_RUNNING;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Sly, l'Ombre, a promis de parler à Diego pour moi si je trouve Nek. Le garde a peut-être rejoint le Nouveau Camp. Je devrais questionner Fletcher dans le quartier de l'arène à propos de Nek.");
	}
	else
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Sly, l'Ombre, m'a demandé de trouver le garde disparu Nek. Le garde a peut-être rejoint le Nouveau Camp. Je devrais questionner Fletcher dans le quartier de l'arène à propos de Nek.");
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
	description		= "J'ai trouvé Nek.";
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
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_15_00"); //J'ai trouvé Nek.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_10_01"); //Bien ! As-tu une preuve de ça ?
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Non - J'ai bien peur que non.",DIA_STT_315_LostNekSuccess_NoProof);
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"J'ai trouvé cette amulette sur lui - la voilà.",DIA_STT_315_LostNekSuccess_Proof);
};

func void DIA_STT_315_LostNekSuccess_Proof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //J'ai trouvé cette amulette sur lui - la voilà.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //C'est la bonne amulette. Tu es intelligent.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //Tu aurais pu avoir l'idée de garder l'amulette pour toi, mais tu as pris la bonne décision.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& hero.guild == GIL_NONE
	{
		AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //Si Diego m'interroge à ton sujet, je voterai en ta faveur.
	};
	Sly_LostNek = LOG_SUCCESS;
	
	B_GiveInvItems (other, self, Neks_Amulett, 1);
	
	Log_SetTopicStatus		(CH1_LostNek, LOG_SUCCESS);
	B_LogEntry				(CH1_LostNek,"J'ai donné l'amulette de Nek à Sly. Il a été impressionné par mon honnêteté.");
	
	B_GiveXP (XP_Slysearchfornek);		
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC, LOG_RUNNING);
		B_LogEntry			(CH1_JoinOC,"J'ai donné l'amulette de Nek à Sly. Il parlera en ma faveur à Diego.");
	}
	else
	{	
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus  (CH1_JoinOC, LOG_FAILED);
		B_LogEntry			(CH1_JoinOC,"J'ai donné l'amulette de Nek à Sly. Cela ne changera rien - le Vieux Camp ne me laissera pas le rejoindre de toute façon.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};


func void DIA_STT_315_LostNekSuccess_NoProof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //Non - J'ai bien peur que non.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //Oh ? tu ne me caches rien, n'est-ce pas ? Nek a eu un amulette sur lui.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //Je n'aime pas les gens qui gardent les choses qui m'appartiennent. Si tu trouves l'amulette, rapporte-la moi !
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //Je penserai à toi quand j'aurai l'amulette dans la main.
	
	B_LogEntry( CH1_LostNek,"Sly veut avoir l'amulette de Nek.");
	
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
	description		= "Comment va ?";
	
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
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_00"); //Comment va ?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //Bon ! Avec moi tu n'as plus besoin de te faire du souci pour Diego !
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //Tu me grattes le dos, je gratte le tien, hein ?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //C'est comme ça
};


	
	
	




		
		
