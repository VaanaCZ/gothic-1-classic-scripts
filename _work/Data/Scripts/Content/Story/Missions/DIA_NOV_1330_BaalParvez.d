// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalParvez_EXIT (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 999;
	condition	= DIA_BaalParvez_EXIT_Condition;
	information	= DIA_BaalParvez_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalParvez_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalParvez_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  DIA_BaalParvez_Greet (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_Greet_Condition;
	information	= DIA_BaalParvez_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Greet_Info()
{
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_00"); //Le Dormeur soit avec toi, étranger !
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_01"); //Je suis ici pour te conduire sur le bon chemin.
};

// **************************************************
//					Rechter Weg
// **************************************************

instance  DIA_BaalParvez_RightWay (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_RightWay_Condition;
	information	= DIA_BaalParvez_RightWay_Info;
	permanent	= 0;
	description = "Et lequel est le bon chemin ?";
};                       

FUNC int  DIA_BaalParvez_RightWay_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_RightWay_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_RightWay_15_00"); //Et lequel est le bon chemin ?
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_01"); //Le chemin du Dormeur. Lui seul a le pouvoir de nous libérer.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_02"); //Les Sages préparent une grande invocation dans notre camp - ils veulent entrer en contact avec le Dormeur.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_03"); //Jusqu'ici il nous a seulement parlé dans les visions - mais maintenant il est temps de le contacter.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_04"); //Pour cela, nous aurons besoin d'autant de défenseurs que possible. En focalisant notre puissance spirituelle, nous ferons en sorte qu'il nous comprenne.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_05"); //Notre camp est assez loin dans le marais -mais  je peux t'y emmener, si tu le désires.
};

// **************************************************
//					Vorteile für mich
// **************************************************

instance  DIA_BaalParvez_MyAdvantage (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_MyAdvantage_Condition;
	information	= DIA_BaalParvez_MyAdvantage_Info;
	permanent	= 0;
	description = "Quel serait l'avantage de me joindre à vous ?";
};                       

FUNC int  DIA_BaalParvez_MyAdvantage_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_MyAdvantage_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_MyAdvantage_15_00"); //Quel serait l'avantage de me joindre à vous ?
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_01"); //Peut-être es-tu l'une des personnes choisies qui reçoivent du Dormeur le don de la magie.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_02"); //Ou tu pourrais recevoir les plus grands honneurs et devenir un templier. Seuls les meilleurs combattants d'entre nous peuvent obtenir ce rang.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_03"); //Si le Dormeur est avec toi, tu peux même combiner les deux - les meilleurs templiers reçoivent aussi le don de la magie.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_04"); //Tu vois, notre Confrérie t'offre beaucoup de possibilités.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_05"); //Tu devrais pendre tout ça en compte avant de décider de rejoindre n'importe quel autre camp !
};

// **************************************************
//					Schläfer
// **************************************************

instance  DIA_BaalParvez_Sleeper (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_Sleeper_Condition;
	information	= DIA_BaalParvez_Sleeper_Info;
	permanent	= 0;
	description = "Qui est le Dormeur ?";
};                       

FUNC int  DIA_BaalParvez_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_00"); //Qui est le Dormeur ?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_01"); //Le Dormeur nous parle à travers des rêves et des visions.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_02"); //Il a guidé nos pas depuis son premier contact avec Y'Bérion, il y a cinq ans.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_03"); //Tous les disciples de la Confrérie ont renoncé aux trois dieux. Nous prions seulement le Dormeur pour notre salut.
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_04"); //Pour nous sauver de quoi?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_05"); //De cet endroit pourri, évidement ! Le Dormeur nous montrera la voie de la liberté !
};

// **************************************************
//			Was hat Schläfer zu euch gesagt?
// **************************************************

instance  DIA_BaalParvez_SleeperSaid (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_SleeperSaid_Condition;
	information	= DIA_BaalParvez_SleeperSaid_Info;
	permanent	= 0;
	description = "Que vous a dit le Dormeur  ?";
};                       

FUNC int  DIA_BaalParvez_SleeperSaid_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_SleeperSaid_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_SleeperSaid_15_00"); //Que vous a dit le Dormeur  ?
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_01"); //Il nous a conduit au marais, aux vieilles ruines du temple. C'est là où nous avons établi notre camp.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_02"); //Il nous a donné l'indépendance - aucun de nous n'a besoin d'aller travailler dans les mines.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_03"); //Il nous a montré les effets de l'Herbe. Nous la vendons aux autres camps, et en échange nous obtenons tout ce dont nous avons besoin.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_04"); //Et il a donné à certains d'entre nous le don de la magie. Une vieille et puissante magie différente de celle que les magiciens du royaume utilise.
};

// **************************************************
//		Erzähl mir von der MAgie des Schläfers
// **************************************************

instance  DIA_BaalParvez_PSIMagic (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_PSIMagic_Condition;
	information	= DIA_BaalParvez_PSIMagic_Info;
	permanent	= 0;
	description = "Parle-moi de la magie du Dormeur.";
};                       

FUNC int  DIA_BaalParvez_PSIMagic_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_SleeperSaid))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_PSIMagic_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_PSIMagic_15_00"); //Parle-moi de la magie du Dormeur.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_01"); //Ce don te permet de contrôler les choses avec la puissance de l'esprit.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_02"); //Seuls les Sages de notre Confrérie ont été initiés aux secrets de cette magie.
};

// **************************************************
//					GotoNewcamp
// **************************************************
	var int BaalParvez_GotoPSI_Day;
// **************************************************

instance  DIA_BaalParvez_GotoPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 800;
	condition	= DIA_BaalParvez_GotoPSI_Condition;
	information	= DIA_BaalParvez_GotoPSI_Info;
	permanent	= 1;
	description = "Mène-moi à ton camp. Je veux le voir !";
};                       

FUNC int  DIA_BaalParvez_GotoPSI_Condition()
{
	if	(Npc_RefuseTalk(self)==FALSE)
	&&	(Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	&&	(Npc_GetDistToWP(self,"PATH_OC_PSI_18")>5000)
	&&	!Npc_KnowsInfo(hero, DIA_BaalParvez_AtPSI)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_GotoPSI_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_GotoPSI_15_00"); //Mène-moi à ton camp. Je veux le voir !
	if (Psi_Walk == 0)
	{
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
		};
		B_LogEntry				(CH1_JoinPsi,"Baal Parvez est un missionnaire de la Confrérie. Il reste dans le Vieux Camp pour chercher de nouveaux partisans pour le Dormeur ! Il a promis de m'accompagner dans le Camp Marécageux, la maison de la Confrérie.");
		Psi_Walk	= 1;
	};
	AI_Output (self, other,"DIA_BaalParvez_GotoPSI_10_01"); //Très bien ! Je vais y aller. Suis-moi !
	
	BaalParvez_GotoPSI_Day = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_SetRefuseTalk (self, 300);
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************************
//				AM PSICAMP ANGEKOMMEN
// **************************************************

instance DIA_BaalParvez_AtPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_AtPSI_Condition;
	information	= DIA_BaalParvez_AtPSI_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_AtPSI_Condition()
{
	if 	( Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_OC_PSI_18") ) 
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_AtPSI_Info()
{
	if (BaalParvez_GotoPSI_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_10_00"); //Nous y voici. Plus bas se trouve le camp de la Confrérie.
	}
	else
	{
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //Tu as pris ton temps, mon frère ! tu peux voir le camp un peu plus bas.
	};
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_01"); //Passe par la porte et parle à mes frères. Je suis sûr que tu n'es pas venu ici pour rien.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_02"); //Demande à voir Cor Kalom. Il est responsable des novices et des précepteurs.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_03"); //Je retournerai au Vieux camp - il reste beaucoup d'infidèles à conduire sur la bonne voie.
	AI_Output 	(other, self,"DIA_BaalParvez_AtPSI_15_04"); //Bonne chance.

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	B_LogEntry	(CH1_JoinPsi,"Le Camp Marécageux est devant moi. Mon compagnon m'a avisé de parler à Cor Kalom . Il est le chef des novices et professeurs.");
	B_GiveXP	(XP_ArrivedAtPsiCamp);

	var C_NPC Kalom; Kalom = Hlp_GetNpc(Gur_1201_CorKalom);
	Kalom.aivar[AIV_FINDABLE]=TRUE;
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};


