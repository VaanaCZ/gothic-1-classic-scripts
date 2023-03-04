// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Scatty_Exit (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 999;
	condition	= DIA_Scatty_Exit_Condition;
	information	= DIA_Scatty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Scatty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Was machst du hier 
// **************************************************

INSTANCE DIA_Scatty_WhatDoYouDo (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WhatDoYouDo_Condition;
	information	= DIA_Scatty_WhatDoYouDo_Info;
	permanent	= 0;
	description = "Quel est ton travail ici ?";
};                       

FUNC INT DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output (other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //Quel est ton travail ici ?
	AI_Output (self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //Je suis responsable de l'arène. J'organise les paris, loue des nouveaux combattants... Enfin, tout ça.
};

// **************************************************
// 					 Join OC
// **************************************************
	var int Scatty_ChargeKirgo;
	var int Scatty_ChargeKharim;
	var int Scatty_ChargeGorHanis;
// **************************************************

INSTANCE DIA_Scatty_JoinOC (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_JoinOC_Condition;
	information	= DIA_Scatty_JoinOC_Info;
	permanent	= 0;
	description = "Je veux rejoindre le Camp. Peux-tu m'aider ?";
};                       

FUNC INT DIA_Scatty_JoinOC_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Scatty_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Scatty_JoinOC_15_00"); //Je veux rejoindre le Camp. Peux-tu m'aider ?
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_01"); //Je pourrais le faire, si tu parviens à m'impressionner.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_02"); //Quelques combattants parmi les meilleurs des trois camps viennent ici pour se mesurer entre eux.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_03"); //Défi l'un d'eux au combat. Je t'observerai, et si tu es bon peut-être que j'en serais convaincu.
	
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kharim;	Kharim = Hlp_GetNpc(Sld_729_Kharim);		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC GorHanis;	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	
	B_LogEntry( CH1_JoinOC,"Scatty, le maître de l'arène, serait impressionné si je défis un des guerriers.");
};

// **************************************************
// 					 KIRGO SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KirgoSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KirgoSuccess_Condition;
	information	= DIA_Scatty_KirgoSuccess_Info;
	permanent	= 0;
	description = "J'ai combattu Kirgo !";
};                       

FUNC INT DIA_Scatty_KirgoSuccess_Condition()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			

	if ( (Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ( (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KirgoSuccess_Info()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);	
	
	AI_Output (other,self,"DIA_Scatty_KirgoSuccess_15_00"); //J'ai combattu Kirgo !
	if (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_01"); //Ouais, et tu as perdu !
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_02"); //Tu ne t'attendez sûrement pas à ce que je sois impressionné par ça...
		Scatty_ChargeKirgo = LOG_FAILED;
		
		B_LogEntry( CH1_JoinOC,"Le fait que Kirgo m'ait battu n'impressionne pas du tout Scatty.");
	}
	else if (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_03"); //Et tu l'as vaincu ! Ce n'est pas mal pour un novice comme toi ! J'avoue que je suis impressionné !
		Scatty_ChargeKirgo = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"Scatty a été impressionné par mon combat contre Kirgo.");
		B_GiveXP (XP_kirgovictory);
	};
};

// **************************************************
// 					 KHARIM SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KHARIMSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KHARIMSuccess_Condition;
	information	= DIA_Scatty_KHARIMSuccess_Info;
	permanent	= 0;
	description = "J'ai défié Kharim !";
};                       

FUNC INT DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);			

	if ( (Scatty_ChargeKHARIM == LOG_RUNNING) && (Kharim_Charged == TRUE) && ( (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KHARIMSuccess_Info()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);	
	
	AI_Output (other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //J'ai défié Kharim !
	if (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //Hé gamin,  il t'a flanqué un sacré coup !
		if (Npc_GetTrueGuild (hero) == GIL_NONE)
		{
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //Tu as toujours choisi le bon adversaire ! Je ne peux pas supporter ces bâtards du Nouveau camp.
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Il me semble que nous nous comprenons, toi et moi - tu es exactement le genre de gars dont nous avons besoin !
		};
		Scatty_ChargeKHARIM = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry( CH1_JoinOC,"J'ai été battu par Kharim ! Scatty a aimé mon courage, mais pas mon combat.");
		
	}
	else if (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //Et tu l'as mis par terre! Je dois admettre que ce n'était pas mal. Il a toujours été connu comme un des combattants les plus redoutables.
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //Je suis profondément impressionné !
		Scatty_ChargeKHARIM = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"J'ai défait Kharim ! Scatty a été impressionné.");
		B_GiveXP(XP_kharimvictory);
	};
};


// **************************************************
// 				 Warum andere Lager Kämpfer
// **************************************************

INSTANCE DIA_Scatty_OtherCamps (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_OtherCamps_Condition;
	information	= DIA_Scatty_OtherCamps_Info;
	permanent	= 0;
	description = "Pourquoi laissez vous les gens des autres camps combattre ici ?";
};                       

FUNC INT DIA_Scatty_OtherCamps_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_OtherCamps_Info()
{
	AI_Output (other,self,"DIA_Scatty_OtherCamps_15_00"); //J'ai pensé que le Vieux camp et le Nouveau camp n'avaient pas eu le dessus - pourquoi ont-ils laissé leurs gens combattre ici ?
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_01"); //C'est simple : Il y a des combats ici une fois par semaine, et les mineurs aiment toujours voir un des bandits du Nouveau camp aller à terre.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_02"); //Si l'un d'entre eux combat, il y a encore plus de paris - et ça c'est bon pour des affaires !
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_03"); //Personnellement, je ne supporte pas ces porcs du Nouveau camp - mais les affaires sont les affaires...
};

// **************************************************
// 					Will Wetten
// **************************************************

INSTANCE DIA_Scatty_WannaBet (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaBet_Condition;
	information	= DIA_Scatty_WannaBet_Info;
	permanent	= 1;
	description = "Je veux parier.";
};                       

FUNC INT DIA_Scatty_WannaBet_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_WannaBet_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaBet_15_00"); //Je veux parier.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_01"); //Mais, il n'y a plus de combat
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_02"); //Le prochain combat aura lieu dans deux jours. Il sera annoncé.
	
};

// **************************************************
// 					Will Kämpfen
// **************************************************

INSTANCE DIA_Scatty_WannaFight (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaFight_Condition;
	information	= DIA_Scatty_WannaFight_Info;
	permanent	= 1;
	description = "Je veux combattre dans arène !";
};                       

FUNC INT DIA_Scatty_WannaFight_Condition()
{
//	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
//	{
//		return 1;
//	};
};

FUNC VOID DIA_Scatty_WannaFight_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaFight_15_00"); //Je veux combattre dans arène !
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_01"); //Je ne peux pas te laisser combattre avant que tu n'ai choisi ton camp !
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_02"); //Personne ne veut voir un combattant solitaire !
};

// **************************************************
// 					TRAIN
// **************************************************

INSTANCE DIA_Scatty_TRAIN (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 10;
	condition	= DIA_Scatty_TRAIN_Condition;
	information	= DIA_Scatty_TRAIN_Info;
	permanent	= 1;
	description = "entraînes-tu les guerriers ?";
};                       

FUNC INT DIA_Scatty_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_TRAIN_Info()
{
	if( log_scattytrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
    B_LogEntry(GE_TeacherOC,"Scatty, le maître de l'arène, peut m'enseigner l'ARME A UNE MAIN.");
    log_scattytrain = TRUE;
    };
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_00"); //entraînes-tu les guerriers ?
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_01"); //Ouais, mais pas simplement pour s'amuser. Si tu veux que je t'entraîne, tu dois payer


	Info_ClearChoices	(DIA_Scatty_TRAIN );
	Info_AddChoice		(DIA_Scatty_TRAIN,DIALOG_BACK		,DIA_Scatty_TRAIN_BACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,150)	,DIA_Scatty_TRAIN_2h);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,50)	,DIA_Scatty_TRAIN_1h);
	};
};

func void DIA_Scatty_TRAIN_BACK()
{
	Info_ClearChoices	(DIA_Scatty_TRAIN );
};

func void DIA_Scatty_TRAIN_1h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Je veux améliorer mon maniement d'armes à une main.
	
	if (Npc_HasItems(other,itminugget) >= 50)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_01"); //C'est une bonne décision ! Mais avant de pouvoir améliorer ta technique, tu dois apprendre à tenir correctement une arme.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Les débutants prennent souvent à deux mains les armes à une main. Ne prends pas cette habitude maintenant, ça va te désavantager.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Tiens l'arme avec une seule main, lame vers le haut, et continue à la balancer.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Tu dois apprendre à synchroniser les balancements de ton arme avec tes propres mouvements. Cela rendra tes attaques plus promptent.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Si tu gardes à l'esprit ce que je t'ai appris, tes combats seront plus élégants et beaucoup plus rapides à l'avenir.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_06"); //Ah oui, encore une chose : Certains coups font plus de dégâts que d'autres ! En tant que débutant, tu n'auras pas beaucoup d'occasions de porter des coups critiques.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Mais plus tu progresses, meilleur tu deviens.
			B_GiveInvItems(other,self,itminugget,50);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Tu n'as pas assez de minerai !
	};
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Apprends-moi à être plus adroit avec des armes à une main.
	
	if (Npc_HasItems(other,itminugget) >= 150)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //D'accord, tu as les bases. Garder ton arme basse te permettra de mettre plus de force dans ton premier coup.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Sers-toi du balancement, tu te souviens ? D'accord, maintenant tu dois utiliser d'avantage ton corps. Quand tu as frappé deux fois, tourne autour. Cela déstabilisera ton adversaire et te mettra en excellente position.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Passe ta lame de droite à gauche encore une fois.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //Et de nouveau vers l'avant. N'oublie pas : c'est en s'entraînant qu'on atteint la perfection. Et ainsi, deviens un maître dans l'art du combat à une main.
			B_GiveInvItems(other,self,itminugget,150);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //Reviens quand tu auras suffisamment de minerai !
	};
};
