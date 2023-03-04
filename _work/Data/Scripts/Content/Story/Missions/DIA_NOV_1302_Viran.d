// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Viran_Exit (C_INFO)
{
	npc			=  Nov_1302_Viran;
	nr			=  999;
	condition	=  DIA_Viran_Exit_Condition;
	information	=  DIA_Viran_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Viran_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was macht ihr hier?
// **************************************************

instance  DIA_Viran_What (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_What_Condition;
	information	= DIA_Viran_What_Info;
	permanent	= 0;
	description	= "Que fais-tu ici ?";
};                       

FUNC int  DIA_Viran_What_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_What_Info()
{
	AI_Output (other, self,"DIA_Viran_What_15_00"); //Que fais-tu ici ?
	AI_Output (self, other,"DIA_Viran_What_07_01"); //Nous avons cueilli de l'Herbe des marais pour être préparée par nos frères, comme ça elle est prête à être fumée plus tard.
	AI_Output (self, other,"DIA_Viran_What_07_02"); //C'est vraiment dangereux de la cueillir dans le marais, mais ce truc ne pousse qu'ici. C'est vraiment une bonne chose.
	AI_Output (other, self,"DIA_Viran_What_15_03"); //Pourquoi?
	AI_Output (self, other,"DIA_Viran_What_07_04"); //Comme ça les deux autres camps ne peuvent pas en avoir. Nous sommes les seuls dans la colonie qui pouvons cueillir de l'Herbe du marais.
	AI_Output (self, other,"DIA_Viran_What_07_05"); //Nous pouvons en faire le commerce avec les deux autres camps - et c'est NOUS qui en fixons le prix.
};

// **************************************************
//				Kraut abholen
// **************************************************

instance  DIA_Viran_FetchWeed (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_FetchWeed_Condition;
	information	= DIA_Viran_FetchWeed_Info;
	permanent	= 0;
	description	= "Baal Orun m'a envoyé. Je dois prendre la moisson de Kalom.";
};                       

FUNC int  DIA_Viran_FetchWeed_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_FetchWeed_Info()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_15_00"); //Baal Orun m'a envoyé. Je dois prendre la moisson de Kalom.
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_01"); //Tu penses que c'est facile, c'est ça ?
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_02"); //"N'importe qui pourrait arriver comme ça:  'Baal Orun m'a envoyé' ; - et hop - toutes les Herbes seraient parties."
	
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Va le voir et demande-lui si tu ne me crois pas !",DIA_Viran_FetchWeed_GotoHim);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Mais Baal Orun m'a vraiment envoyé !",DIA_Viran_FetchWeed_Really);
};
	
func void DIA_Viran_FetchWeed_Really()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_Really_15_00"); //Mais Baal Orun m'a vraiment envoyé !
	AI_Output (self, other,"DIA_Viran_FetchWeed_Really_07_01"); //D'accord
};

func void DIA_Viran_FetchWeed_GotoHim()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_GotoHim_15_00"); //Va le voir et demande-lui si tu ne me crois pas !
	AI_Output (self, other,"DIA_Viran_FetchWeed_GotoHim_07_01"); //J'ai une meilleure idée. tu peux prouver ta fidélité en faisant un petit travail pour nous !
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
};

// **************************************************
//				MISSION Bloodflies
// **************************************************
	var int Viran_Bloodflies;
// **************************************************

instance  DIA_Viran_Bloodflies (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Bloodflies_Condition;
	information	= DIA_Viran_Bloodflies_Info;
	permanent	= 0;
	description	= "Et que veux-tu que je fasse ?";
};                       

FUNC int  DIA_Viran_Bloodflies_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Viran_FetchWeed))
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Bloodflies_Info()
{
	AI_Output (other, self,"DIA_Viran_Bloodflies_15_00"); //Et que veux-tu que je fasse ?
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_01"); //Trois fois rien. Travailler dans le marais, c'est un peu risqué, car il y a ces fichus mouches de sang.
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_02"); //Le travail serait beaucoup plus facile sans elles ! Tu me suis ?
	Viran_Bloodflies = LOG_RUNNING;

	B_LogEntry			(CH1_DeliverWeed,"Viran m'a seulement donné l'Herbe après avoir tué tous les volants sanglants dans un rayon de 20 mètres.");
};
	
// **************************************************
//				Running / Success
// **************************************************
	var int Viran_BotenDay;
// **************************************************

instance  DIA_Viran_Running (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Running_Condition;
	information	= DIA_Viran_Running_Info;
	permanent	= 1;
	description	= "Je ne vois pas de Mouche de Sang.";
};                       

FUNC int  DIA_Viran_Running_Condition()
{
	if (Viran_Bloodflies == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Running_Info()
{
	AI_Output (other, self,"DIA_Viran_Running_15_00"); //Je ne vois pas de Mouche de Sang.
	Npc_PerceiveAll(self);
	if ( Wld_DetectNpc(self,bloodfly,ZS_MM_Rtn_Wusel,-1) && (Npc_GetDistToNpc(self, other)<2000) ) //other = nearest Bloodfly (Instance/ZS/Guild)
	//wenn keine Bloodfly in 40m, dann other noch unverändert (= hero)
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_00"); //Mais il y a encore plus de bestioles à moins de vingt pas !
		AI_Output (self, hero,"DIA_Viran_Running_07_01"); //Tu ne pourras pas t'en tirer aussi facilement !
	}
	else
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_02"); //Plus aucune bestioles. Tu as bien travaillé !
		AI_Output (self, hero,"DIA_Viran_Running_07_03"); //Quelqu'un qui travaille comme ça est soit de notre côté, soit complètement idiot !
		AI_Output (self, hero,"DIA_Viran_Running_07_04"); //Un idiot serait trop stupide pour me rouler, pas vrai ?
		AI_Output (self, hero,"DIA_Viran_Running_07_05"); //Voilà, prends la moisson et apporte-la à Cor Kalom.
		AI_Output (self, hero,"DIA_Viran_Running_07_06"); //S'il se plaint et dit qu'il n'y en a pas assez, dis-lui de ramener ses fesses ici, pour qu'il ai une idée de ce que nous coûte ce travail si dur.
		
		B_GiveInvItems  (self, hero, ItMi_Plants_Swampherb_01, 50);

		if	Npc_KnowsInfo(hero, DIA_Balor_FetchWeed)
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran m'a donné la deuxième moitié de la moisson d'Herbe aujourd'hui . Voyons si Cor Kalom est satisfait de la quantité.");
		}
		else
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran m'a donné la moisson d'Herbe aujourd'hui . Ca n'a pas l'air terrible. Peut-être il y a-t'il un deuxième groupe de ramasseurs.");
		};
		B_GiveXP		(XP_WeedFromViran);
				
		Viran_Bloodflies = LOG_SUCCESS;
		Viran_BotenDay = Wld_GetDay();
	};
	AI_StopProcessInfos (self);
};

// **************************************************
//					PERMANENT
// **************************************************

instance  DIA_Viran_Perm (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Perm_Condition;
	information	= DIA_Viran_Perm_Info;
	permanent	= 1;
	description	= "Comment va la cueillette ?";
};                       

FUNC int  DIA_Viran_Perm_Condition()
{
	if (Viran_Bloodflies == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Perm_Info()
{
	AI_Output (other, self,"DIA_Viran_Perm_15_00"); //Comment va la cueillette ?
	AI_Output (self, other,"DIA_Viran_Perm_07_01"); //Ouais, ouais, prends le juste pour me faire rire. Je suis sûr que tu a de meilleurs travaux chez les Sages.
	AI_Output (self, other,"DIA_Viran_Perm_07_02"); //"Et bien, au moins je n'ai pas besoin de faire ce sale travail moi-même. ""L'infanterie"" le fait - hé, hé."
};

// **************************************************
//					Verarschen
// **************************************************

instance  DIA_Viran_RipOff (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 5;
	condition	= DIA_Viran_RipOff_Condition;
	information	= DIA_Viran_RipOff_Info;
	permanent	= 0;
	description	= "Je dois prendre toutes l'Herbe de Cor Kalom de nouveau.";
};                       

FUNC int  DIA_Viran_RipOff_Condition()
{
	if ( (Viran_BotenDay<=(Wld_GetDay()-2)) && (Viran_Bloodflies == LOG_SUCCESS) ) //Dann hat der SC auch das erste Kraut bekommen
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_RipOff_Info()
{
	AI_Output (other, self,"DIA_Viran_RipOff_15_00"); //Je dois prendre toutes l'Herbe de Cor Kalom de nouveau.
	AI_Output (self, other,"DIA_Viran_RipOff_07_01"); //Encore ?
	AI_Output (other, self,"DIA_Viran_RipOff_15_02"); //Maintenant tu ne vas quand même pas me demander de te débarrasser des Requins des marais, hein ? Je n'ai pas vraiment beaucoup de temps.
	AI_Output (self, other,"DIA_Viran_RipOff_07_03"); //Bon, bon ! Voilà, prend cette foutue Herbe !
	CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
	B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
};








