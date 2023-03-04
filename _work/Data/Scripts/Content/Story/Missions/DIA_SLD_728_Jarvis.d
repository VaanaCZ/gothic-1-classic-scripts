// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Jarvis_EXIT (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_EXIT_08_00"); //Gare derrière toi !
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						First
// ************************************************************

INSTANCE DIA_Jarvis_First (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_First_Condition;
	information	= DIA_Jarvis_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Jarvis_First_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_First_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_First_08_00"); //As-tu l'intention de passer par cette porte ?
	AI_Output (other, self,"DIA_Jarvis_First_15_01"); //As-tu l'intention de m'arrêter ?
	AI_Output (self, other,"DIA_Jarvis_First_08_02"); //Non, mais tu devrais savoir ce qui t'attend. Ce n'est pas comme dans le Vieux camp et ça ne deviendra pas comme avec la secte de farfelus !
	AI_Output (other, self,"DIA_Jarvis_First_15_03"); //Et qu'est-ce que j'attends ici ?
	AI_Output (self, other,"DIA_Jarvis_First_08_04"); //Il n'y a de gardes ou de templiers pour s'occuper de toi. C'est tous pour un, la seule chose qui  compte pour nous les mercenaires.
};

// ************************************************************
// 						Söldner
// ************************************************************

INSTANCE DIA_Jarvis_SldInfo (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_SldInfo_Condition;
	information	= DIA_Jarvis_SldInfo_Info;
	permanent	= 0;
	description	= "Que font les mercenaires ?";
};                       

FUNC INT DIA_Jarvis_SldInfo_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_SldInfo_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_SldInfo_15_00"); //Que font les mercenaires ?
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_01"); //Nous - nous sommes les mercenaires des Mages de l'eau.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_02"); //Notre but est de nous libérer d'ici. Nous travaillons dur pour ça et ne prenons pas les choses à la légère comme ceux du Vieux camp, qui prennent du bon temps en se reposant sur le dos des mineurs.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_03"); //Et nous sommes tous derrière Lee. C'est un grand homme. C'est le seul qui peut contrôler ce fichu camp.
};

// ************************************************************
// 						Magier
// ************************************************************

INSTANCE DIA_Jarvis_Magier (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Magier_Condition;
	information	= DIA_Jarvis_Magier_Info;
	permanent	= 0;
	description	= "Que font les Mages ?";
};                       

FUNC INT DIA_Jarvis_Magier_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_SldInfo))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Magier_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Magier_15_00"); //Que font les Mages ?
	AI_Output (self, other,"DIA_Jarvis_Magier_08_01"); //Ils étudient les caractéristiques magiques du minerai que nos gratteurs extraient de la mine.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_02"); //D'après ce que je sais, ils veulent faire exploser le tas de minerai pour nous libérer de la Barrière.
	AI_Output (other, self,"DIA_Jarvis_Magier_15_03"); //ça me semble dangereux.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_04"); //Ils ont dit que nous ne devrions pas nous inquiéter.
};

// ************************************************************
// 						Erzhaufen
// ************************************************************

INSTANCE DIA_Jarvis_Erzhaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Erzhaufen_Condition;
	information	= DIA_Jarvis_Erzhaufen_Info;
	permanent	= 0;
	description	= "Vous avez un tas de minerai massif ici ?";
};                       

FUNC INT DIA_Jarvis_Erzhaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Erzhaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Erzhaufen_15_00"); //Vous avez un tas de minerai massif ici ?
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_01"); //Tu peux le dire. Nous pourrions acheter la Reine avec ça.
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_02"); //Mais notre but n'est pas de faire commerce de minerai avec ce vieux pet. Nous voulons sortir d'ICI !
};

// ************************************************************
// 						Wo Haufen
// ************************************************************

INSTANCE DIA_Jarvis_WoHaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_WoHaufen_Condition;
	information	= DIA_Jarvis_WoHaufen_Info;
	permanent	= 0;
	description	= "Où est le tas de minerai ?";
};                       

FUNC INT DIA_Jarvis_WoHaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Erzhaufen))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_WoHaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_00"); //Où est le tas de minerai ?
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_01"); //Tu veux voir un vrai tas de minerai, n'est-ce pas ? Il y a un trou au milieu de la caverne, ils poussent tout là dedans.
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_02"); //Mais impossible de s'en approcher, je peux te le dire. Les Mages et nos gens montent la garde jour et nuit devant le minerai.
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_03"); //J'étais simplement curieux.
};

// ************************************************************
// 						Rest
// ************************************************************

INSTANCE DIA_Jarvis_Rest (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_Rest_Condition;
	information	= DIA_Jarvis_Rest_Info;
	permanent	= 0;
	description	= "Et en ce qui concerne le reste des gens ?";
};                       

FUNC INT DIA_Jarvis_Rest_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Rest_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Rest_15_00"); //Et en ce qui concerne le reste des gens ?
	AI_Output (self, other,"DIA_Jarvis_Rest_08_01"); //Tous des escrocs. Ils ne se soucient guère du camp. J'ai eu raison d'avoir les paysans pour garder la porte principale.
};

// ************************************************************
// 						PERM
// ************************************************************

INSTANCE DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 10;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= 1;
	description	= "Comment les choses vont-elles à l'heure actuelle ?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_PERM_15_00"); //Comment les choses vont-elles à l'heure actuelle ?
	AI_Output (self, other,"DIA_Jarvis_PERM_08_01"); //Les gratteurs collectent toujours. Une fois qu'ils auront assez de minerai, nous ferons exploser le tas.
};

/*------------------------------------------------------------------------
//							SÖLDNERAUFNAHME									//
------------------------------------------------------------------------*/
instance Sld_728_Jarvis_AUFNAHMESOLDIER (C_INFO)
{
	npc				= Sld_728_Jarvis;
	condition		= Sld_728_Jarvis_AUFNAHMESOLDIER_Condition;
	information		= Sld_728_Jarvis_AUFNAHMESOLDIER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Sld_728_Jarvis_AUFNAHMESOLDIER_Condition()
{	
	if ( Npc_GetTrueGuild  (hero) == GIL_ORG) 
	&& ( (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS) )
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  Sld_728_Jarvis_AUFNAHMESOLDIER_Info()
{
	AI_GotoNpc (hero,self); 
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Hé, j'ai entendu que tu avais fait passer un sale quart d'heure aux Chenilles dans la mine.
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Lee devrait être tout à fait disposé de t'accepter en tant que mercenaire. Va lui parler.

	self.flags = 0;		// Immortal-Flag löschen

	Log_CreateTopic (GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry (GE_BecomeMercenary,"Je dois parler à Lee. Peut-être qu'il me laissera rejoindre les mercenaires.");
};






	


