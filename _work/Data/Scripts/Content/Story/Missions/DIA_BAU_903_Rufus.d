// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Rufus_EXIT (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 999;
	condition	= DIA_Rufus_EXIT_Condition;
	information	= DIA_Rufus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Rufus_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Rufus_Wasser(C_INFO) // E1
{
	npc			= Bau_903_Rufus;
	nr			= 800;
	condition	= Info_Rufus_Wasser_Condition;
	information	= Info_Rufus_Wasser_Info;
	permanent	= 1;
	description = "Lefty m'envoie. Je t'apporte de l'eau.";
};                       

FUNC INT Info_Rufus_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Rufus_Wasser_Info()
{
	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Lefty m'envoie. Je t'apporte de l'eau.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Merci, mec. Ma bouche ressemble à un désert !
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //De l'eau ! Hé, mec ! Y'en a plus ! Ne me dit pas encore que tout le monde en a eu sauf moi ?
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Rufus_Hello (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Hello_Condition;
	information	= DIA_Rufus_Hello_Info;
	permanent	= 0;
	description	= "Salut ! Je suis nouveau ici. Je veux juste savoir ce qui se passe par ici.";
};                       

FUNC INT DIA_Rufus_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_Hello_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Hello_15_00"); //Salut ! Je suis nouveau ici. Je veux juste savoir ce qui se passe par ici.
	AI_Output (self, other,"DIA_Rufus_Hello_02_01"); //Demande à quelqu'un d'autre. Je ne fais rien d'autre que de travailler dans les champs, je ne sais rien.
	AI_Output (self, other,"DIA_Rufus_Hello_02_02"); //J'ai eu la bonté de dire au Seigneur du riz de faire son sale boulot !
};

// ************************************************************
// 						Warum arbeitest du
// ************************************************************

INSTANCE DIA_Rufus_Why (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Why_Condition;
	information	= DIA_Rufus_Why_Info;
	permanent	= 0;
	description	= "Si tu n'aimes pas ça, pourquoi travailles-tu ici ?";
};                       

FUNC INT DIA_Rufus_Why_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Why_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Why_15_00"); //Si tu n'aimes pas ça, pourquoi travailles-tu ici ?
	AI_Output (self, other,"DIA_Rufus_Why_02_01"); //C'est arrivé le premier jour. Lefty, un des bandits qui travaille pour le Seigneur du riz, est venu vers moi et m'a demandé de lui donner un coup de main dans les rizières.
	AI_Output (self, other,"DIA_Rufus_Why_02_02"); //J'ai dit bien sûr. J'étais nouveau ici et j'ai voulu me rendre utile.
	AI_Output (self, other,"DIA_Rufus_Why_02_03"); //Le jour suivant, alors que je me reposais un peu, le type est venu me tourner autour
	AI_Output (self, other,"DIA_Rufus_Why_02_04"); //Il m'a demandé: tu ne veux pas laisser tes compagnons faire tout le travail, n'est-ce pas?
	AI_Output (self, other,"DIA_Rufus_Why_02_05"); //Je lui ai dit que j'étais épuisé par le travail de la veille, que j'avais besoin de repos, et tout ça. Mais il n'a jamais écouté.
	AI_Output (self, other,"DIA_Rufus_Why_02_06"); //Il m'a saisi par le col et m'a traîné de nouveau dans les champs.
	AI_Output (self, other,"DIA_Rufus_Why_02_07"); //À partir de ce jour, il est resté devant ma porte tous les jours  - jusqu'à ce que je retourne chez moi. Je ne voulais pas d'ennui avec ces gens.
	AI_Output (self, other,"DIA_Rufus_Why_02_08"); //Ce sont de vrais coupe-gorge, tu ferais bien de ne pas t'approcher.
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// ************************************************************
// 						Wer ist Ricelord?
// ************************************************************

INSTANCE DIA_Rufus_Ricelord (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 2;
	condition	= DIA_Rufus_Ricelord_Condition;
	information	= DIA_Rufus_Ricelord_Info;
	permanent	= 1;
	description	= "Qui est le Seigneur du Riz ?";
};                       

FUNC INT DIA_Rufus_Ricelord_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Ricelord_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Ricelord_15_00"); //Qui est le Seigneur du Riz ?
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_01"); //Il était dans les premiers ici. Il a aidé à trouver le camp et à démarrer les rizières.
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_02"); //Maintenant il ne fait que traîner à l'entrepôt, l'estomac tendu, le gros porc !
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};


















	
