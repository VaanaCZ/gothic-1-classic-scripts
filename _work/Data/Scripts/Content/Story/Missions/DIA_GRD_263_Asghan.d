
// ************************ EXIT **************************

instance  Grd_263_Asghan_Exit (C_INFO)
{
	npc			=	Grd_263_Asghan;
	nr			=	999;
	condition	=	Grd_263_Asghan_Exit_Condition;
	information	=	Grd_263_Asghan_Exit_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Grd_263_Asghan_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_263_Asghan_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************** Infos *****************************

instance  Grd_263_Asghan_NEST (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_NEST_Condition;
	information		= Grd_263_Asghan_NEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Il doit y avoir un nid de Chenilles des mines quelque part."; 
};

FUNC int  Grd_263_Asghan_NEST_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING) 
	{
		return 1;
	};

};
FUNC void  Grd_263_Asghan_NEST_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_01"); //Il doit y avoir un nid de Chenilles des mines quelque part.
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_02"); //Toute cette foutue montagne n'est juste qu'un vaste nid de Chenilles !
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_03"); //Pourquoi as-tu fermé cette galerie ?
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_04"); //Peu importe combien de Chenilles nous avons tuées, il en est sorti de plus en plus.
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_05"); //Ce genre de bruit provient d'un nid très proche. Laisse-moi ouvrir la porte !
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_06"); //Non ! Cette porte ne doit pas être ouverte sans la permission de Ian ! On ne fera rien avant.
	
	B_LogEntry		(CH2_MCEggs,"Asghan, le chef de la mine des gardes, n'a pas ouvert la grille. Il veut la permission de Ian.");

};
/*------------------------------------------------------------------------
							ERLAUBNIS VON IAN GEHOLT							
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_OPEN (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_Condition;
	information		= Grd_263_Asghan_OPEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hé Asghan, tu peux ouvrir la grille maintenant !"; 
};

FUNC int  Grd_263_Asghan_OPEN_Condition()
{
	if Npc_KnowsInfo  ( hero, Grd_263_Asghan_NEST)
	&& Npc_KnowsInfo  ( hero, STT_301_IAN_GEAR_SUC)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_OPEN_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_01"); //Hé Asghan, tu peux ouvrir la grille maintenant !
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_02"); //Je te le répète: seulement si Ian...
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_03"); //Asghan... Tout va s'arranger maintenant... avec les amitiés de Ian.
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_04"); //Bon, si Ian est responsable de ça... mais seulement à une condition !
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_05"); //Quelle condition ?
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_06"); //Donne-moi seulement deux ou trois templiers pour m'aider, je ne veux pas me retrouver tout seul ici quand les Chenilles sortiront de la galerie !
	
	B_LogEntry		(CH2_MCEggs,"Bien que Ian m'ait donné la permission, Asghan n'ouvrira pas jusqu'à ce que j'ai réuni quelques templiers comme renfort devant la grille.");

	AI_StopProcessInfos	( self );
};  

  
// ***************** Infos *****************************
instance  Grd_263_Asghan_OPEN_NOW (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_NOW_Condition;
	information		= Grd_263_Asghan_OPEN_NOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Tout est prêt. La grille peut s'ouvrir maintenant !"; 
};

FUNC int  Grd_263_Asghan_OPEN_NOW_Condition()
{	
	if 		(Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST )) && (Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST))
	||		(Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST)) && (Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC ))
	||		(Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC)) && (Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST ))   
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_OPEN_NOW_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //Tout est prêt. La grille peut s'ouvrir maintenant !
	AI_Output			(self, other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //Alors c'est entendu, ouvre la galerie maintenant. Et que le spectacle commence.
	
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Npc_ExchangeRoutine	(self,"opengate");
	
	B_GiveXP			(XP_OpenAsghansGate);
	B_LogEntry			(CH2_MCEggs,"J'ai réuni suffisamment de templiers devant la grille d'Asghan. Qu'est-ce qu'il nous attend dans pénombre derrière ?");
		
	AI_StopProcessInfos	(self);
};    

// ***************** Nest gefunden *****************************
instance  Grd_263_Asghan_LAIRFOUND (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_LAIRFOUND_Condition;
	information		= Grd_263_Asghan_LAIRFOUND_Info;
	important		= 0;
	permanent		= 0;
	description		= "Les Chenilles des mines ne devraient plus être une menace !"; 
};

FUNC int  Grd_263_Asghan_LAIRFOUND_Condition()
{	
	if	(Npc_HasItems(hero, ItAt_Crawlerqueen)>=3)   
	&&  (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_LAIRFOUND_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //Les Chenilles des mines ne devraient plus être une menace !
	AI_Output			(self, other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //Voilà de bonnes nouvelles. J'enverrai un messager à Thorus !

	AI_StopProcessInfos	(self);
};    

/*------------------------------------------------------------------------
						MCQ Hatz läuft noch nicht 						
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_SMALLTALK (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_SMALLTALK_Condition;
	information		= Grd_263_Asghan_SMALLTALK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Comment ça va ?"; 
};

FUNC int  Grd_263_Asghan_SMALLTALK_Condition()
{	
	if (CorKalom_BringMCQBalls != LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_SMALLTALK_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_01"); //Hé, comment vas-tu ?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Bon…aussi longtemps que personne n'a pas l'idée d'ouvrir cette porte, je n'ai pas besoin de blesser quelqu'un.
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //Qu'est-ce que cette porte a de si particulier ?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //Chenilles de mine. De grandes et vilaines Chenilles de mine. Beaucoup, beaucoup, beaucoup de ces sales bêtes.
};  



































