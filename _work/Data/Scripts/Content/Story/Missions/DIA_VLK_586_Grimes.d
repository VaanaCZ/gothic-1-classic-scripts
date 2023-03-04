// ************************ EXIT **************************

instance VLK_586_Grimes_Exit (C_INFO)
{
	npc			= VLK_586_Grimes;
	nr			= 999;
	condition	= VLK_586_Grimes_Exit_Condition;
	information	= VLK_586_Grimes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_586_Grimes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_586_Grimes_Exit_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_Exit_Info_15_01"); //Bonne chance.
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //Toi aussi, garçon, toi aussi.
	
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  VLK_586_Grimes_STORY (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_STORY_Condition;
	information		= VLK_586_Grimes_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "As-tu été ici longtemps ?"; 
};

FUNC int  VLK_586_Grimes_STORY_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_FIRST) )  
	{
		return 1;
	};

};


FUNC void  VLK_586_Grimes_STORY_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_STORY_Info_15_01"); //As-tu été ici longtemps ?
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //Je suis ici depuis 10 ans. Crois-moi, j'ai beaucoup souffert et beaucoup appris.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //J'ai rencontré beaucoup de dangers mais je suis toujours en vie.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //Dans le passé, quand nous avons travaillé dans la vieille mine, celle qui est maintenant abandonnée et dont les poutres de soutien se sont effondrées...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //Mais ce sont de vieilles histoires...
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Tu as dû entendre beaucoup de plans d'évasion."; 
};

FUNC int  VLK_586_Grimes_KNOW_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_STORY) )  
	{
		return 1;
	};

};
FUNC void  VLK_586_Grimes_KNOW_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //Tu as dû entendre beaucoup de plans d'évasion.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //Écoute, garçon : je sais que tu veux sortir d'ici - mais oublie.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //Il vaut mieux oublier l'évasion. J'ai vu les visages de ceux qui ont essayé de sortir à travers la Barrière.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //Ne fait pas la même erreur, la Barrière arrêtera tout le monde.
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //Je ne veux pas me retrancher à la mine pendant dix ans de ma vie !
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //Non. Mais peut-être que tu feras parti des gros durs, qui sait.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //Tu pourras travailler de ton mieux, mais peu importe jusqu'où tu arriveras tu ne t'arrêtera finalement qu'à la Barrière.
};

instance VLK_586_Grimes_FIRST (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_FIRST_Condition;
	information		= VLK_586_Grimes_FIRST_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_586_Grimes_FIRST_Condition()
{
	return 1;
};

func void  VLK_586_Grimes_FIRST_Info()
{
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //Un nouveau visage. Es-tu un mineur, garçon ?
};  
