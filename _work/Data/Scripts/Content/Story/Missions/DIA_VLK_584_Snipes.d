// ************************ EXIT **************************

instance  VLK_584_Snipes_Exit (C_INFO)
{
	npc			=  VLK_584_Snipes;
	nr			=  999;
	condition	=  VLK_584_Snipes_Exit_Condition;
	information	=  VLK_584_Snipes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_584_Snipes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_584_Snipes_Exit_Info()
{
	AI_Output			(other, self,"Info_Exit_Info_15_001"); //On se voit plus tard.
	AI_Output			(self, other,"Info_Exit_Info_07_02"); //Oui, bien sûr !
	
	AI_StopProcessInfos	( self );
};

// ***************** Infos *****************************
instance  VLK_584_Snipes_DEAL (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_Condition;
	information		= VLK_584_Snipes_DEAL_Info;
	important		= 0;
	permanent		= 0;
	description		= "Comment vont les choses ?"; 
};

FUNC int  VLK_584_Snipes_DEAL_Condition()
{
	return 1;
};


FUNC void  VLK_584_Snipes_DEAL_Info()
{
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_Info_15_01");//Comment vont les choses ?
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_02"); //J'ai une offre à te faire.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_03"); //Si tu éloignes Aaron du coffre, je te donnerais 10 minerais !
	Snipes_Deal = LOG_RUNNING;

	Log_CreateTopic		(CH2_SnipesDeal,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_SnipesDeal,	LOG_RUNNING);
	B_LogEntry		(CH2_SnipesDeal,"Snipes le mineur m'a offert 10 pépites de minerai pour corrompre le garde Aaron afin qu'il s'absente de son coffre !");
};
// ***************** Infos *****************************  
instance  VLK_584_Snipes_DEAL_RUN (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_RUN_Condition;
	information		= VLK_584_Snipes_DEAL_RUN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Tu me dois 10 minerais !"; 
};

FUNC int  VLK_584_Snipes_DEAL_RUN_Condition()
{
	if (Snipes_deal == LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC void  VLK_584_Snipes_DEAL_RUN_Info()
{
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_RUN_Info_15_01"); //Tu me dois 10 minerais !
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_02"); //Voila, tu as déjà gagné 10 minerais.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_03"); //Oh, une dernière chose : J'ai la clé de ce coffre. Pour toi... seulement 30 minerais !
	CreateInvItems		(self,ItMinugget,10);
	B_GiveInvItems      (self, other, ItMinugget,10);
	CreateInvItem 		(self,ItKe_OM_02);

	B_GiveXP			(XP_LureAaronAway);
	
	B_LogEntry		(CH2_SnipesDeal,"Pour 30 autres pépites de minerai, Snipes m'a offert la clé du coffre d'Aaron."); 
};  
// ***************** Infos *****************************
instance  VLK_584_Snipes_DEAL_2 (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_2_Condition;
	information		= VLK_584_Snipes_DEAL_2_Info;
	important		= 0;
	permanent		= 1;
	description		= "(Acheter la clé)"; 
};

FUNC int  VLK_584_Snipes_DEAL_2_Condition()
{
	if ( Npc_KnowsInfo (hero, VLK_584_Snipes_DEAL_RUN) )
	&& (Npc_HasItems   (self,ItKe_OM_02))
	{
	return 1;
	};
};


FUNC void  VLK_584_Snipes_DEAL_2_Info()
{
	
	if ( Npc_HasItems (hero, ItMinugget)  >= 30 ) 
	{
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_01");//Donne moi la clé.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_02");//Tu fais de bonnes affaires ici.
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_03");//Je me demande juste ce que tu fais ici.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_04");//Je suis toujours content de pouvoir arnaquer les gardes. Mais s'ils découvrent le contenu du coffre, je suis un homme mort.
		
		B_GiveInvItems 	(hero, self, ItMiNugget,30);
		B_GiveInvItems 	(self, hero, ItKe_OM_02, 1);
		VLK_584_Snipes_DEAL_2.permanent = 0;
	
		B_LogEntry		(CH2_SnipesDeal,"J'ai acheté la clé du coffre de Snipes ! Je me demande ce que va faire Aaron quand je lui parlerai de cela ?"); 
	}
	else
	{
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_05"); //J'ai dit 30 minerais ! Donne moi le minerai et je te donnerai la clé !
	};
};  
