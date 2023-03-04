// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalIsidro_EXIT(C_INFO)
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 999;
	condition	= DIA_BaalIsidro_EXIT_Condition;
	information	= DIA_BaalIsidro_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalIsidro_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalIsidro_Hello(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Hello_Condition;
	information	= DIA_BaalIsidro_Hello_Info;
	permanent	= 0;
	description = "Tu ne sembles pas être très heureux.";
};                       

FUNC INT DIA_BaalIsidro_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_Hello_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_00"); //Tu ne sembles pas être très heureux.
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_01"); //Je ne le suis pas !
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_02"); //Je dois me débarrasser d'un tas entière d'Herbe.
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_03"); //tu es ici juste pour vendre des marchandises du Camp de la Secte ?
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_04"); //Oui. Mais je ne veux pas d'ennuis.
};

// ************************************************************
// 					 	TRADE
// ************************************************************

INSTANCE DIA_BaalIsidro_TRADE(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 800;
	condition	= DIA_BaalIsidro_TRADE_Condition;
	information	= DIA_BaalIsidro_TRADE_Info;
	permanent	= 1;
	description = "Montre moi ce que tu as.";
	trade 		= 1;
};                       

FUNC INT DIA_BaalIsidro_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_TRADE_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_TRADE_15_00"); //Montre moi ce que tu as.
	AI_Output (self, other,"DIA_BaalIsidro_TRADE_03_01"); //Ici...
};

// ************************************************************
// 					 Ich verkaufe für dich
// ************************************************************

INSTANCE DIA_BaalIsidro_GimmeKraut(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_GimmeKraut_Condition;
	information	= DIA_BaalIsidro_GimmeKraut_Info;
	permanent	= 0;
	description = "Je peux te vendre l'Herbe - pour une modique somme, bien sûr.";
};                       

FUNC INT DIA_BaalIsidro_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_GimmeKraut_Info()
{	
	AI_Output			(other, self,"DIA_BaalIsidro_GimmeKraut_15_00"); //Je peux te vendre l'Herbe - pour une modique somme, bien sûr.
	AI_Output			(self, other,"DIA_BaalIsidro_GimmeKraut_03_01"); //N'y pense pas - je ne suis pas aussi ivre que les autres. Tu n'as qu'à partir avec lui.

	Log_CreateTopic		(CH1_DealerJob, LOG_MISSION);
    Log_SetTopicStatus	(CH1_DealerJob, LOG_RUNNING);
    B_LogEntry			(CH1_DealerJob,"Le novice Baal Isidro rode autour de la taverne  du lac complètement saoul. Il doit vendre sa part de tiges d'Herbe, mais il ne se débrouille pas bien. Peut-être que je peux le convaincre de me laisser essayer, mais comment dois-je faire ?"); 
};

// ************************************************************
// 					Baal Kagan hat gepetzt
// ************************************************************

INSTANCE DIA_BaalIsidro_Problem(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Problem_Condition;
	information	= DIA_BaalIsidro_Problem_Info;
	permanent	= 0;
	description = "Tu as un problème. Baal Kagan t'assurera d'être remplacé.";
};                       

FUNC INT DIA_BaalIsidro_Problem_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_Problem_Info()
{	
	AI_Output			(other, self,"DIA_BaalIsidro_Problem_15_00"); //Voilà ce que je vais te dire - tu as un problème. Baal Kagan s'assurera que tu seras remplacé.
	AI_Output			(self, other,"DIA_BaalIsidro_Problem_03_01"); //Quoi ? Le Dormeur ait pitié de moi ! Je dois me débarrasser de la marchandise...
	
	if (BaalIsidro_GotDrink == FALSE)
	{
	    B_LogEntry		(CH1_DealerJob,"Baal Isidro a été évidemment vexé quand je lui ai parlé du plan de substitution. Mais ce n'était toujours pas assez pour lui.");
	}
	else
	{
	    B_LogEntry		(CH1_DealerJob,"Les plans de Baal Kagan afin de remplacer l'alcoolique Baal Isidro l'a achevé. Je pense qu'il acceptera mon offre maintenant !");
	};	
};

// ************************************************************
// 					 Trink noch einen
// ************************************************************
	var int BaalIsidro_GotDrink;
// ************************************************************

INSTANCE DIA_BaalIsidro_Drink(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Drink_Condition;
	information	= DIA_BaalIsidro_Drink_Info;
	permanent	= 1;
	description = "Aller - je t'offre une autre boisson.";
};                       

FUNC INT DIA_BaalIsidro_Drink_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_BaalIsidro_GimmeKraut) && (BaalIsidro_GotDrink == FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_Drink_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Drink_15_00"); //Aller - je t'offre une autre boisson.
	
	if ( (Npc_HasItems(other,ItFoBooze)>0) || (Npc_HasItems(other,ItFoBeer)>0) || (Npc_HasItems(other,ItFoWine)>0) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_Drink_03_01"); //Merci, l'ami. Je boirai à ta santé !

		if 		(Npc_HasItems(other,ItFoBooze))
		{
			B_GiveInvItems	(other,self,ItFoBooze,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoBooze);		
		}
		else if (Npc_HasItems(other,ItFoBeer))
		{
			B_GiveInvItems	(other,self,ItFoBeer,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoBeer);		
		}
		else if (Npc_HasItems(other,ItFoWine))
		{
			B_GiveInvItems	(other,self,ItFoWine,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoWine);		
		};
		
		BaalIsidro_GotDrink = TRUE;

		if	Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem)
		{
		    B_LogEntry	(CH1_DealerJob,"La dernière petite gorgée de mon offre généreuse a noyé la dernière particule de résistance de Baal Isidro. Je pense qu'il acceptera mon offre maintenant.");
		}
		else
		{
		    B_LogEntry	(CH1_DealerJob,"Baal Isidro a heureusement accepté la boisson mais il ne veut toujours pas me laisser vendre l'Herbe.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_NO_Drink_03_00"); // Quoi? Où ?
	};
};

// ************************************************************
// 					 Übrleg's dir!
// ************************************************************
	var int BaalIsidro_DealerJob;
// ************************************************************

INSTANCE DIA_BaalIsidro_ThinkAgain(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_ThinkAgain_Condition;
	information	= DIA_BaalIsidro_ThinkAgain_Info;
	permanent	= 1;
	description = "Pense-y, donne-moi l'Herbe et nous partagerons le bénéfice.";
};                       

FUNC INT DIA_BaalIsidro_ThinkAgain_Condition()
{
	if	( Npc_KnowsInfo(hero, DIA_BaalIsidro_GimmeKraut) && ((BaalIsidro_DealerJob!=LOG_RUNNING)&&(BaalIsidro_DealerJob!=LOG_SUCCESS)) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_ThinkAgain_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_00"); //Pense-y, donne-moi l'Herbe et nous partagerons le bénéfice.
	
	if ( (BaalIsidro_GotDrink == TRUE) && Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_01"); //Hé l'ami, je dois me débarrasser de la marchandise. Tu n'essayerais pas de me faire passer pour un imbécile, non ?
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_02"); //Je te donne ma parole.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_03"); //Bon, voici la marchandise... Tu devrais en obtenir au moins 400 minerais. Cela ferait 200 pour chacun de nous. J'attendrai ici. Reviens dès que tu auras le minerai.
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_04"); //Sais-tu qui en prendra le plus ici ?
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_05"); //Si je savais que je serais allé moi-même.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_06"); //Je me sens bien mieux maintenant que je me suis débarrassé de la marchandise.
		
		BaalIsidro_DealerJob = LOG_RUNNING;
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro m'a donné les tiges d'Herbe. Si je les vends il me donnera la moitié du bénéfice, qui serait 200 minerai.");	
	
		//Itemübergabe
		CreateInvItems		(self,			itmijoint_1, 40);
		B_GiveInvItems  	(self, other,	itmijoint_1, 50);//Notwendig zur Textausgabe "50 Items übergeben", wird sofort ausgeglichen
		Npc_RemoveInvItems	(self,			itmijoint_2, 20);
		Npc_RemoveInvItems	(self,			itmijoint_3, 20);
		Npc_RemoveInvItems	(other,			itmijoint_1, 40);
		CreateInvItems		(other,			itmijoint_2, 20);
		CreateInvItems		(other,			itmijoint_3, 20);
					
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00"); //Non, l'ami. Je commande...
	};
};

// ************************************************************
// 					RUNNING / SUCCESS
// ************************************************************

INSTANCE DIA_BaalIsidro_RUNNING(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_RUNNING_Condition;
	information	= DIA_BaalIsidro_RUNNING_Info;
	permanent	= 0;
	description = "J'ai vendu l'Herbe. Voici tes 200 minerais.";
};                       

FUNC INT DIA_BaalIsidro_RUNNING_Condition()
{
	if (BaalIsidro_DealerJob == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_RUNNING_Info()
{	
	AI_Output				(other, self,"DIA_BaalIsidro_RUNNING_15_00"); //J'ai vendu l'Herbe.
	AI_Output				(self, other,"DIA_BaalIsidro_RUNNING_03_01"); //Et mes 200 minerais ?
	
	if (Npc_HasItems(other,itminugget)>=200)
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_15_02"); //Voici.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_03"); //Bon... Maintenant je ne me soucie plus guère de Baal Kagan.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_04"); //C'était une bonne idée de faire des affaires avec toi.

		B_GiveInvItems		(hero, self, ItMiNugget, 200);
		BaalIsidro_DealerJob = LOG_SUCCESS;
		
		Log_SetTopicStatus	(CH1_DealerJob, LOG_SUCCESS);
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro a été soulagé d'obtenir ses 200 minerai.");	
	    B_GiveXP			(XP_BaalIsidroPayShare);
	}
	else
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_NoOre_15_05"); //Je ne l'ai pas sur moi.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_NoOre_03_06"); //Trouve le alors !
		AI_StopProcessInfos	(self);
	};
};

