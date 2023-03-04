//****************************************************
//	Typ der den SC an der Nase herum führt!
//****************************************************

//Variablen:
//--------------------------------------
var int SLD_753_Baloro_SC_choice;
var int SLD_753_Baloro_SC_wills_wissen;
var int SLD_753_Baloro_SC_besorgt_den_Kram;
//--------------------------------------





instance DIA_SLD_753_Baloro (C_INFO)
{
	npc				= SLD_753_Baloro;
	condition		= DIA_SLD_753_Baloro_Condition;
	information		= DIA_SLD_753_Baloro_Intro_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_SLD_753_Baloro_Condition()
{
	return 1;
};

func void DIA_SLD_753_Baloro_Intro_Info()
{
	AI_Output (self, other,"DIA_SLD_753_Baloro_Intro_08_01"); //Hé, toi ! Qu'est-ce que tu fais ?
};

// ********************** Was meinst du? *****************

instance DIA_SLD_753_Baloro_Wasmeinstdu (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Wasmeinstdu_Condition;
	information	= DIA_SLD_753_Baloro_Wasmeinstdu_Info;
	important	= 0;	
	permanent	= 0;
	description = "Salut !";
};                       

FUNC int DIA_SLD_753_Baloro_Wasmeinstdu_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_753_Baloro_Wasmeinstdu_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_01"); //Salut !
	AI_Output (self, other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_02"); //Tu marches comme si tu cherchais quelque chose !
	AI_Output (other, self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_03"); //Vraiment ? Mmh, peut-être as-tu raison. Pourquoi ?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_04"); //Magnifique ! Interroge-moi ! Je pourrais peut-être t'aider !


};

// ********************** Woran hast du dabei gedacht *****************

instance DIA_SLD_753_Baloro_Worumgehts (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Worumgehts_Condition;
	information	= DIA_SLD_753_Baloro_Worumgehts_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Qu'as-tu entendu ?";
};                       

FUNC int DIA_SLD_753_Baloro_Worumgehts_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Wasmeinstdu))	&& (SLD_753_Baloro_SC_choice == 0) )
	{
	return 1;
	};
	
};

FUNC VOID DIA_SLD_753_Baloro_Worumgehts_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_01"); //Qu'as-tu entendu ?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_01"); //De quoi as-tu besoin ?
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_02"); //Que dis-tu d'une bonne épée, d'une armure solide ou d'un accès à la mine ?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_02"); //Non ! Ce n'est rien !
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_03"); //Je peux te donner quelque chose qui te fera sortir les yeux des orbites ! Une arme avec laquelle tu pourras battre n'importe qui !
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_04"); //Tu dois seulement me faire une petite faveur. Alors elle sera à toi ! Qu'en dis-tu ?

	Info_ClearChoices	(DIA_SLD_753_Baloro_Worumgehts); // alte choices loeschen
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Je dois l'avoir.",DIA_SLD_753_Baloro_Worumgehts_ja);
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Je ne crois pas un seul mot de ce qu'il a dit.",DIA_SLD_753_Baloro_Exit_Info);
	
};

FUNC VOID DIA_SLD_753_Baloro_Worumgehts_ja()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_05"); //Qu'est-ce que je devrai faire pour ça ?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_03"); //Très simple !
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_04"); //Trouve-moi 5 pommes, 2 bouteilles d'alcool de riz, 5 bouteilles de bière, 3 miches de pain, 2 morceaux de fromage et 2 grappes de raisins, et nous ferons affaire !
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_05"); //Crois-moi, tu ne dois pas être désolé. J'ai dit seulement : Tu vaincras vraiment n'importe quel ennemi avec ça !
	
	Info_ClearChoices	(DIA_SLD_753_Baloro_Worumgehts); // alte choices loeschen
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Je dois l'avoir.",DIA_SLD_753_Baloro_Worumgehts_jaklar);
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Le gars le prend mal.",DIA_SLD_753_Baloro_Exit_Info);
};
	
FUNC VOID DIA_SLD_753_Baloro_Worumgehts_jaklar()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_06"); //Ok ! Je verrai ce que je peux faire alors !
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_06"); //Très bon ! Mais dépêche-toi !
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_07"); //ne pas oublier : 5 pommes, 2 bouteilles d'alcool de riz, 5 bouteilles de bière, 3 miches de pain, 2 morceaux de fromage et 2 grappes de raisins ! Ok ?
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_07"); //Bien sûr !
	
	
//********	Auftragannahme	**************************
	


	SLD_753_Baloro_SC_besorgt_den_Kram = LOG_RUNNING ;
	
		
	Log_CreateTopic		(Baloros_Waffe,		LOG_MISSION);
	Log_SetTopicStatus	(Baloros_Waffe,		LOG_RUNNING);
	B_LogEntry			(Baloros_Waffe,		"Baloro a promis de me vendre une arme superbe, si je lui apporte 5 Pommes, 2 bouteilles d'alcool de riz, 5 bouteilles de bière, 3 pains, 2 morceaux de fromage et 2 grappes de raisins."); 

	AI_StopProcessInfos	( self );
};
	



// ********************** Ich hab´s noch nicht dabei *****************	


instance DIA_SLD_753_Baloro_habsnichtdabei (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_habsnichtdabei_Condition;
	information	= DIA_SLD_753_Baloro_habsnichtdabei_Info;
	important	= 0;	
	permanent	= 1;
	description = "Je n'ai pas encore pu obtenir tes trucs !";
};                       

FUNC int DIA_SLD_753_Baloro_habsnichtdabei_Condition()
{
	if 	(SLD_753_Baloro_SC_besorgt_den_Kram == LOG_RUNNING)   
	{
		return 1;
	};

};

FUNC VOID DIA_SLD_753_Baloro_habsnichtdabei_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_01"); //Je n'ai pas pu encore trouver ta marchandise ! C'était quoi déjà ? Il y avait tant de choses différentes !
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_01"); //D'accord ! Je vais le répéter lentement. Bien, je veux que tu me rapportes...
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_02"); //5 pommes, 2 bouteilles d'alcool de riz, 5 bouteilles de bière, 3 miches de pain, 2 morceaux de fromage et 2 grappes de raisins ! Tu as bien noté cette fois ?
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_02"); //Bien ! Sûr ! Je vais faire vite !

	AI_StopProcessInfos	( self );	
};


// ********************** Ich hab´s  dabei *****************	

instance DIA_SLD_753_Baloro_habsdabei (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_habsdabei_Condition;
	information	= DIA_SLD_753_Baloro_habsdabei_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "J'ai tous les trucs sur moi !";
};                       

FUNC int DIA_SLD_753_Baloro_habsdabei_Condition()
{
	if (	(SLD_753_Baloro_SC_besorgt_den_Kram == LOG_RUNNING)      
		&&   (Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Worumgehts))	
		&& (SLD_753_Baloro_SC_choice == 0) 
		&& (Npc_HasItems(other,ItFoApple)>=5)  
		&& (Npc_HasItems(other,ItFoBooze)>=2) 
		&& (Npc_HasItems(other,ItFoBeer)>=5) 
		&& (Npc_HasItems(other,ItFoLoaf)>=3) 
		&& (Npc_HasItems(other,ItFoCheese)>=2) 
		&& (Npc_HasItems(other,ItFo_wineberrys_01)>=2) )
	{
		return 1;
	};

};

FUNC VOID DIA_SLD_753_Baloro_habsdabei_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_01"); //J'ai toute la marchandise sur moi ! Maintenant on peut échanger contre cette arme superbe, pas vrai ?
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_01"); //Montre-moi la marchandise d'abord !
	
	CreateInvItems(other, ItFoApple, 14);
	
	B_GiveInvItems(other, self, ItFoApple, 19); //Nötig für die Ausschrift "19 Itmes abgegeben", wird sofort angeglichen.
	
	Npc_RemoveInvItems ( other,ItFoBooze,2);
	Npc_RemoveInvItems ( other,ItFoBeer,5);
	Npc_RemoveInvItems ( other,ItFoLoaf,3);
	Npc_RemoveInvItems ( other,ItFoCheese,2);
	Npc_RemoveInvItems ( other,ItFo_wineberrys_01,2);
	
	Npc_RemoveInvItems ( self,ItFoApple,14);
	CreateInvItems	(self,ItFoBooze,2);
	CreateInvItems	(self,ItFoBeer,5);
	CreateInvItems	(self,ItFoLoaf,3);
	CreateInvItems	(self,ItFoCheese,2);
	CreateInvItems	(self,ItFo_wineberrys_01,2);

	
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_02"); //Voici !
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_02"); //Ouais, magnifique !
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_03"); //Bien, donne-moi l'arme maintenant ! !
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_03"); //N'y pense pas !
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_04"); //Quoi??
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_04"); //Tu as vraiment pensé que tu pourrais l'échanger contre quelque chose ? Je pense que si tu es assez stupide pour croire ça, tu ne la mérites pas ! !
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_05"); //Je suis stupéfait de voir que tu es encore vivant ! Si tu crois tout ce disent les gens, tu ne survivras pas longtemps ici !
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_06"); //Mais ça n'a pas d'importance ! Maintenant nous avons suffisamment de nourriture pour une soirée ! Merci beaucoup ! Au plaisir de te revoir. Hi hi hi !
	
	SLD_753_Baloro_SC_besorgt_den_Kram = LOG_SUCCESS ;
	B_GiveXP (300);
	B_LogEntry			(Baloros_Waffe,		"J'aurai dû mieux connaître cette ordure avant de lui faire confiance ! Néanmoins, j'ai appris une leçon !"); 

	Log_SetTopicStatus	(Baloros_Waffe,		LOG_SUCCESS);
	
	AI_StopProcessInfos	( self );	
};


// **********************	EXIT\ Spieler will Rechenschaft	*****************	

instance DIA_SLD_753_Baloro_letztes_Wort (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_letztes_Wort_Condition;
	information	= DIA_SLD_753_Baloro_letztes_Wort_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Hé mec ! Tu ne peux pas me faire ça !";
	
};                       

FUNC int DIA_SLD_753_Baloro_letztes_Wort_Condition()
	{
		if (SLD_753_Baloro_SC_besorgt_den_Kram == LOG_SUCCESS)
		{
		return 1;
		};	
	};


FUNC VOID DIA_SLD_753_Baloro_letztes_Wort_Info()

	 	{
			AI_Output (other, self,"DIA_SLD_753_Baloro_letztes_Wort_Info_15_01"); //Hé mec ! Tu ne peux pas me faire ça !
			AI_Output (self, other,"DIA_SLD_753_Baloro_letztes_Wort_Info_08_01"); //Qu'est-ce que tu veux encore ! Fous le camp ! Va énerver quelqu'un d'autre, ou tu vas en prendre une ! Compris ?
		
			SLD_753_Baloro_SC_wills_wissen = 1	;
			
			AI_StopProcessInfos	(self);	
		
		};



// **********************	EXIT\ Spieler will´s wissen	*****************	

instance DIA_SLD_753_Baloro_SC_wills_wissen (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_SC_wills_wissen_Condition;
	information	= DIA_SLD_753_Baloro_SC_wills_wissen_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "J'ai peur de devoir te donner de grands coups dans la tronche !";
	
};                       

FUNC int DIA_SLD_753_Baloro_SC_wills_wissen_Condition()
	{
		if (SLD_753_Baloro_SC_wills_wissen == 1)
		{
	
		return 1;
		};	
	};


FUNC VOID DIA_SLD_753_Baloro_Attack()
{
//	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};

FUNC VOID DIA_SLD_753_Baloro_SC_wills_wissen_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_01"); //J'ai peur de devoir te donner de grands coups dans la tronche !
	AI_Output (self, other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_01"); //Nous nous sommes suffisamment amusé ! Fous le camp maintenant, l'ami !
	AI_Output (other, self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_02"); //Je crois que tu ne m'as pas compris !
	AI_Output (self, other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_02"); //D'accord ! Tu lui as demandé ! Tu as été averti !
	
	DIA_SLD_753_Baloro_Attack () ;
	
};




// **********************	EXIT	*****************	


instance DIA_SLD_753_Baloro_Exit (C_INFO)
{
	npc			= SLD_753_Baloro;
	nr			=999;
	condition	= DIA_SLD_753_Baloro_Exit_Condition;
	information	= DIA_SLD_753_Baloro_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description 	= "Je dois continuer.";
	
};                       

FUNC int DIA_SLD_753_Baloro_Exit_Condition()
	{
		if    ((SLD_753_Baloro_SC_wills_wissen == 0)	&&  (SLD_753_Baloro_SC_besorgt_den_Kram == 0)    )
		{
		return 1;
		};
	};


FUNC VOID DIA_SLD_753_Baloro_Exit_Info()
{		
		
				if ( (Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Wasmeinstdu))  &&   (SLD_753_Baloro_SC_choice == 0)	)  
					{
						AI_Output (other, self,"DIA_SLD_753_Baloro_Exit_Info_15_01"); //Non, non ! Va-t-en ! Je ne suis pas intéressé !
						AI_Output (self, other,"DIA_SLD_753_Baloro_Exit_Info_08_02"); //Bon, comme tu veux ! Tu as eu ta chance !
						
						SLD_753_Baloro_SC_choice = 1 ;
					}
				else
					{
						AI_Output (other, self,"DIA_SLD_753_Baloro_Exit_Info_15_03"); //Je suis désolé ! Malheureusement je n'ai pas le temps de bavarder !
						AI_Output (self, other,"DIA_SLD_753_Baloro_Exit_Info_08_04"); //Ah, tu es occupé ! Je te verrai plus tard !
					};
			
	
	AI_StopProcessInfos	( self );
};


// **********************	EXIT\ wie war das mit deinem Angebot	*****************	

instance DIA_SLD_753_Baloro_Angebotdochannehmen (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Angebotdochannehmen_Condition;
	information	= DIA_SLD_753_Baloro_Angebotdochannehmen_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "J'y ai pensé. Je voudrais revenir à ton offre maintenant.";
	
};                       

FUNC int DIA_SLD_753_Baloro_Angebotdochannehmen_Condition()
	{
		if (SLD_753_Baloro_SC_choice == 1)
		{
		return 1;
		};	
	};


FUNC VOID DIA_SLD_753_Baloro_Angebotdochannehmen_Info()

	 	{
			AI_Output (other, self,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_15_01"); //J'ai pensé ça. J'ai eu envie de revenir pour ton offre.
			AI_Output (self, other,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_08_01"); //Il est trop tard maintenant ! Tu as eu ta chance !
		
			
			AI_StopProcessInfos	(self);	
		
		};

