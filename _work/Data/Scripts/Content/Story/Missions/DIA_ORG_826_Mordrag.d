// **************************************************
VAR INT MordragKO_PlayerChoseOreBarons;
VAR INT MordragKO_PlayerChoseThorus;
VAR INT MordragKO_HauAb;
var int MordragKO_StayAtNC;
// **************************************************

// **************************************************
//						 EXIT 
// **************************************************

instance  Org_826_Mordrag_Exit (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 999;
	condition	= Org_826_Mordrag_Exit_Condition;
	information	= Org_826_Mordrag_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_826_Mordrag_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  Org_826_Mordrag_Greet (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 1;
	condition	= Org_826_Mordrag_Greet_Condition;
	information	= Org_826_Mordrag_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Greet_Info()
{
	AI_Output (self, other,"Org_826_Mordrag_Greet_11_00"); //Hé, le nouveau ! Je m'appelle Mordrag. Tu devrais te rappeler de ce nom - tu peux m'acheter n'importe quel genre de marchandises bon marché !
};

// **************************************************
//					Handeln
// **************************************************
var int Mordrag_Traded;
// **************************************************

instance  Org_826_Mordrag_Trade (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 800;
	condition	= Org_826_Mordrag_Trade_Condition;
	information	= Org_826_Mordrag_Trade_Info;
	permanent	= 1;
	description = "Montre moi tes marchandises.";
	trade		= 1;
};                       

func int  Org_826_Mordrag_Trade_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Trade_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Trade_15_00"); //Montre moi tes marchandises.
	AI_Output (self, other,"Org_826_Mordrag_Trade_11_01"); //Choisis quelque chose...
	if	(Mordrag_Traded==0)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"Le brigand Mordrag vends des marchandises volées au marché.");
		Mordrag_Traded=1;
	};
};

// **************************************************
//					KURIER FÜR MAGIER
// **************************************************

instance  Org_826_Mordrag_Courier (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Courier_Condition;
	information	= Org_826_Mordrag_Courier_Info;
	permanent	= 1;
	description = "Est-ce que tu es vraiment le messager des magiciens ?";
};                       

FUNC int  Org_826_Mordrag_Courier_Condition()
{
	if	Thorus_MordragMageMessenger 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Courier_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_00"); //Est-ce que tu es vraiment le messager des magiciens ?
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_01"); //Quoi si je suis ?
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_02"); //J'aimerai avoir une chance de parler aux magiciens. Je dois entrer dans le château.
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_03"); //Les courriers des magiciens portent des sceaux qui leur permettent l'entrée au château. Si tu étais l'un de nous, tu pourrais obtenir un tel sceau...
};

// **************************************************
//					DU HAST EIN PROBLEM
// **************************************************

instance  Org_826_Mordrag_Problem (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Problem_Condition;
	information	= Org_826_Mordrag_Problem_Info;
	permanent	= 0;
	description = "Tu as un problème.";
};                       

FUNC int  Org_826_Mordrag_Problem_Condition()
{
	if Thorus_MordragKo == LOG_RUNNING 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Problem_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_00"); //Tu as un problème.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_01"); //Vraiment ? Qu'est-ce que c'est ?
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_02"); //Il y a les gens ici qui veulent se débarrasser de toi.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_03"); //Vraiment ? Alors tu peux leur dire qu'ils devraient m'envoyer quelqu'un pour me le dire en face.
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_04"); //Comment es-tu si sûr que je ne suis pas celui qui va le faire ?
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_05"); //Parce que je pense que tu es plus futé que ça, mon garçon. Tu te rendras bientôt compte qu'il y a de meilleures opportunités que de travailler pour Gomez.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_06"); //Nous avons aussi besoin de personnes compétentes dans le Nouveau camp, et personne ne te dit quoi faire.
};

// **************************************************
//					  NCInfo
// **************************************************

instance  Org_826_Mordrag_NCInfo(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_NCInfo_Condition;
	information	= Org_826_Mordrag_NCInfo_Info;
	permanent	= 0;
	description = "Dit-moi en plus sur le Nouveau Camp .";
};                       

FUNC int  Org_826_Mordrag_NCInfo_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_NCInfo_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_00"); //Dit-moi en plus sur le Nouveau Camp .
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_01"); //C'est le camp où tu as la plus de liberté de toute la colonie. Nous n'avons ici aucun Baron du minerai ou de Sage qui nous dirige.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_02"); //Nous avons notre propre mine. Mais le minerai qui est produit ici n'est pas donné à ce foutu roi !
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_03"); //Alors à quoi sert-il ?
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_04"); //Nos magiciens travaillent sur un projet pour le faire éclater ici. Tout le minerai est rassemblé pour ça.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_05"); //Tandis que Gomez et sa bande se tournent les pouces, nous travaillons pour la liberté - et ça continue.
};

// **************************************************
//					JoinNewcamp
// **************************************************

instance  Org_826_Mordrag_JoinNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_JoinNewcamp_Condition;
	information	= Org_826_Mordrag_JoinNewcamp_Info;
	permanent	= 0;
	description = "Et si je veux rejoindre le Nouveau Camp...";//könntest du mir dabei helfen... ZU LANG
};                       

FUNC int  Org_826_Mordrag_JoinNewcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_JoinNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_JoinNewcamp_15_00"); //Et si je voulais rejoindre le Nouveau camp... pourrais-tu m'aider ?
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_01"); //Si tu es sérieux nous pouvons y aller maintenant ! Je peux t'amener à Lares. C'est le chef de notre bande.
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_02"); //Mais si tu préfères te battre avec moi en dehors du camp... Et bien, allons-y !
};


instance  Org_826_Mordrag_GotoNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_GotoNewcamp_Condition;
	information	= Org_826_Mordrag_GotoNewcamp_Info;
	permanent	= 0;
	description = "Allez, au Nouveau Camp !";
};                       

FUNC int  Org_826_Mordrag_GotoNewcamp_Condition()
{
	if (Npc_KnowsInfo(hero,Org_826_Mordrag_JoinNewcamp))
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoNewcamp_15_00"); //Allez, au Nouveau Camp !
	AI_Output (self, other,"Org_826_Mordrag_GotoNewcamp_11_01"); //D'accord ! Suis moi.
	
	Mordrag_GotoNC_Day = Wld_GetDay();
	
	AI_StopProcessInfos	(self);

	Npc_SetPermAttitude(self,ATT_FRIENDLY);	// damit hat der Spieler einen Freischlag. Nach dem zweiten wehrt sich Mordrag!
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Mordrag a consenti à me montrer le chemin du Nouveau Camp. J'espère que ce n'est pas un piège !");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_ExchangeRoutine		(self,"GUIDE");
};

// **************************************************
//				AM NEWCMAP ANGEKOMMEN
// **************************************************

instance  Org_826_Mordrag_AtNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_AtNewcamp_Condition;
	information	= Org_826_Mordrag_AtNewcamp_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_AtNewcamp_Condition()
{
	if 	( Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_07_21") ) 
	{
		self.flags	= 0;
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_AtNewcamp_Info()
{
	if (Mordrag_GotoNC_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_00"); //Bien, nous y sommes.
	}
	else
	{
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //J'ai pensé que tu n'arriverais jamais ! Ça ne fait rien - nous sommes là !
	};
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_01"); //En traversant la porte, tu atteindras le Nouveau camp. Entretiens-toi avec Lares. Il t'aidera. Donne-lui ceci. C'est un anneau précieux.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_02"); //C'est ton billet pour voir Lares. Tu as besoin d'une bonne raison pour être autorisé à le rencontrer.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_03"); //Bien, en y réfléchissant, je pense que je resterai ici pendant un moment. J'ai suffisamment gagné ma vie jusqu'à présent, et ça commence à chauffer dans le Vieux camp.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_04"); //Si tu veux, viens me voir à la taverne - c'est la cabane dehors sur le lac. Fais attention !
	AI_Output (other, self,"Org_826_Mordrag_AtNewcamp_15_05"); //Je suis là.
	
	CreateInvItems  (self, MordragsRing, 1);
	B_GiveInvItems	(self, other, MordragsRing, 1);

	B_GiveXP		(XP_ArrivedWithMordrag);	
	B_LogEntry		(CH1_JoinNC,"Maintenant nous sommes devant la porte du Nouveau Camp. Mordrag m'a donné un anneau que je suis supposé donner à Lares, le chef des brigands, si je veux vraiment rejoindre le Nouveau Camp. Mordrag veut rester dans la taverne  du lac un petit moment.");
	var C_NPC lares; lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar [AIV_FINDABLE]=TRUE;
	
	MordragKO_StayAtNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************
//					AUFS MAUL
// **************************************************

instance  Org_826_Mordrag_Fight (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Fight_Condition;
	information	= Org_826_Mordrag_Fight_Info;
	permanent	= 0;
	description = "Le camp n'est pas assez grand pour tout les deux !";
};                       

FUNC int  Org_826_Mordrag_Fight_Condition()
{
	if ( (Thorus_MordragKo == LOG_RUNNING) && (!Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp)) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Fight_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Fight_15_00"); //Il n'y a pas assez de place dans ce camp pour tous les deux !
	AI_Output (self, other,"Org_826_Mordrag_Fight_11_01"); //Pardon ?
	
	Info_ClearChoices(Org_826_Mordrag_Fight);
	Info_AddChoice   (Org_826_Mordrag_Fight,"File juste de ce camp !",Info_Mordrag_Fight_GetAway);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Il n'y a pas de place ici pour les gens qui volent le minerai du Baron !",Info_Mordrag_Fight_OreBarons);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Thorus m'a envoyé. Il veut se débarrasser de toi une fois pour toutes.",Info_Mordrag_Fight_Thorus);
};

FUNC VOID Info_Mordrag_Fight_GetAway()
{
	AI_Output (other, self,"Info_Mordrag_Fight_GetAway_15_00"); //Décampe de ce camp !
	AI_Output (self, other,"Info_Mordrag_Fight_GetAway_11_01"); //De biens grands mots venus d'une si petite personne...
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_OreBarons()
{
	AI_Output (other, self,"Info_Mordrag_Fight_OreBarons_15_00"); //Il n'y a pas de place ici pour ceux qui volent le minerai des Barons !
	AI_Output (self, other,"Info_Mordrag_Fight_OreBarons_11_01"); //Ah, c'est ça que tu veux dire ! Pourquoi tu ne l'as pas dit tout de suite...
	
	MordragKO_PlayerChoseOreBarons = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_Thorus()
{
	AI_Output (other, self,"Info_Mordrag_Fight_Thorus_15_00"); //Thorus m'a envoyé. Il veut se débarrasser de toi une fois pour toutes.
	AI_Output (self, other,"Info_Mordrag_Fight_Thorus_11_01"); //Vraiment ? Thorus ? C'est tout ce que je voulais savoir...
	
	MordragKO_PlayerChoseThorus = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

// **************************************************
//					HauAb
// **************************************************

instance  Org_826_Mordrag_HauAb(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_HauAb_Condition;
	information	= Org_826_Mordrag_HauAb_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_HauAb_Condition()
{
	VAR C_NPC Mordrag;
	Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	
	if (Mordrag.aivar[AIV_WASDEFEATEDBYSC] >= 1)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_HauAb_Info()
{
	AI_Output (other, self,"Org_826_HauAb_GotoNewcamp_15_00"); //Sort d'ici...
	
	AI_StopProcessInfos	(self);
	
	MordragKO_HauAb = TRUE;
	
	B_LogEntry    (CH1_MordragKO,"J'ai frappé Mordrag et lui ai dit que je ne voulais jamais le voir dans le Vieux Camp.");

	Npc_ExchangeRoutine	(self, "Start");
};
		
// **************************************************
//					GotoKalom
// **************************************************

instance  Org_826_Mordrag_GotoKalom(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalom_Condition;
	information	= Org_826_Mordrag_GotoKalom_Info;
	permanent	= 0;
	description = "Lares a un message pour toi.";
};                       

FUNC int  Org_826_Mordrag_GotoKalom_Condition()
{
	if 	(Npc_GetTrueGuild(other)!=GIL_ORG)
	&&	(Lares_InformMordrag == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalom_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_00"); //Lares a un message pour toi.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_01"); //Parle moi de ça.
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_02"); //Il veut savoir ce qu'il se trame dans le camp de la Secte et il veut que tu le découvres.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_03"); //J'ai le sentiment que ce problème va se résoudre...

	B_LogEntry	(CH1_JoinNC,"J'ai dit à Mordrag ce que Lares m'a demandé de dire. Il a marmonné quelque chose comme quoi il ferai mieux de s'occuper d'eux-mêmes. Aucune idée de ce que cela signifie !");
};

// **************************************************
//					GotoKalom - NOW
// **************************************************
	var int Mordrag_GotoKalom;
// **************************************************

instance  Org_826_Mordrag_GotoKalomNOW(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalomNOW_Condition;
	information	= Org_826_Mordrag_GotoKalomNOW_Info;
	permanent	= 0;
	description = "Lares m'a dit de t'aider dans cette affaire de secte.";
};                       

FUNC int  Org_826_Mordrag_GotoKalomNOW_Condition()
{
	if 	(Npc_GetTrueGuild(other)==GIL_ORG)
	&&	Npc_KnowsInfo(hero,ORG_801_Lares_GotoKalom)
	{
		return TRUE;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalomNOW_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_00"); //Lares m'a dit de t'aider dans cette affaire de secte.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //Tu vois... Je savais que je ne devais pas moi-même prendre soin de lui.
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //Est-ce que veux-tu que je règle personnellement toute l'affaire ?
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //Je suis sûr que tu le feras. Écoute : c'est important de découvrir la vérité au sujet de cette histoire d'invocation.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //Je sais que ces farfelus de la secte préparent une grande invocation. Personnellement, je ne crois pas au Dormeur - mais une chose est sûre :
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //Les Sages possèdent et contrôlent une magie puissante. Par conséquent il vaut mieux savoir qu'est-ce qui se passe. Tu me suis jusque là ?

	B_LogEntry			(CH1_GotoPsiCamp,"Mordrag m'a intelligemment refilé la responsabilité d'espionner le Camp Marécageux. Les Sages semblent préparer une grande invocation, mais je dois obtenir plus de détails.");
	B_GiveXP			(XP_AssistMordrag);	
	
	Lares_InformMordrag = LOG_SUCCESS;
	Mordrag_GotoKalom = LOG_RUNNING;
	
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Peux-tu me donner plus d'instructions concrètes ?",Org_826_Mordrag_GotoKalomNOW_Precise);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Je verrai ce que je peux faire.",Org_826_Mordrag_GotoKalomNOW_DoIt);

};

func void Org_826_Mordrag_GotoKalomNOW_Precise()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //Peux-tu me donner plus d'instructions concrètes ?
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //Parle avec Lester. J'ai commercé par le passé dans le camp de la Secte, alors il m'a aidé en retour. Il est avec les gens biens.
	B_LogEntry(CH1_GotoPsiCamp,"On veux que je parle à un novice appelé Lester dans le camp de la Confrérie. Il semble être digne de confiance et il a aidé Mordrag auparavant.");
};

func void Org_826_Mordrag_GotoKalomNOW_DoIt()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //Je verrai ce que je peux faire.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //Dès que tu connaîtras leurs plans, reviens et fais-moi un rapport.
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	AI_StopProcessInfos	(self);
};

// **************************************************
//					RUNNING
// **************************************************

instance  Org_826_Mordrag_RUNNING (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_RUNNING_Condition;
	information	= Org_826_Mordrag_RUNNING_Info;
	permanent	= 1;
	description = "Au sujet de cette affaire de secte...";
};                       

FUNC int  Org_826_Mordrag_RUNNING_Condition()
{
	if (Mordrag_GotoKalom == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_RUNNING_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_RUNNING_15_00"); //Au sujet de cette affaire de secte...
	AI_Output			(self, other,"Org_826_Mordrag_RUNNING_11_01"); //Quoi??

	if	(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_04"); //La grande invocation a eu lieu.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_09"); //Non ! Tu penses participer à leur folie ?
		}
		else
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_06"); //Ils ont l'intention de se renforcer et d'entrer en contact avec le Dormeur au moyen d'un potion qu'ils produisent à partir d'oeufs des Chenilles de mine.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_07"); //Quel cri perçant ! Comment ces malades peuvent croire vraiment tout cela, est-ce possible ?
		};
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_10"); //Je suis curieux du résultat.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_11"); //Moi aussi. Fais-moi savoir quand les Sages auront fini de devenir complètement idiots.

		Mordrag_GotoKalom = LOG_SUCCESS;
		B_GiveXP			(XP_ReportToMordrag);
		Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_SUCCESS);
		B_LogEntry			(CH1_GotoPsiCamp,"Mordrag a éclaté de rire quand je lui ai parlé des oeufs de Chenilles des mines. Il ne semble pas être très intéressé par l'espionnage sur les Sages désormais, cependant, je considérerai l'affaire close !");
	}
	else
	{
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_02"); //Je n'ai rien découvert encore.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_03"); //Débrouille-toi avec ça...
	};

/*	
	//SN: Werde nicht gebraucht, da sie nicht zur Kapitel 2-6-Story passen!!!
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_08"); //Ich hab' die Eier bei mir.
		
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_05"); //(sarkastisch) Hab' ich auch gemerkt. Diese verdammten Sektenspinner haben Gomez die alte Mine gekostet. Wird nicht mehr lange dauern, dann stehen seine Gardisten bei UNS vor der Tür, um sich ihr Erz abzuholen...
*/
};
	
	













	




	
