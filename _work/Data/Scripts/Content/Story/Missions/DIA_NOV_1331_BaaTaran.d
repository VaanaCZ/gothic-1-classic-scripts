// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalTaran_EXIT (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 999;
	condition	= DIA_BaalTaran_EXIT_Condition;
	information	= DIA_BaalTaran_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalTaran_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  DIA_BaalTaran_Greet (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Greet_Condition;
	information	= DIA_BaalTaran_Greet_Info;
	permanent	= 0;
	description = "Je suis nouveau ici. Qui es-tu ?";
};                       

FUNC int  DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //Je suis nouveau ici. Qui es-tu ?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Je suis Baal Taran de la Confrérie du Dormeur.
};

// **************************************************
//					Was ist Bruderschaft
// **************************************************

instance  DIA_BaalTaran_Bruderschaft (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Bruderschaft_Condition;
	information	= DIA_BaalTaran_Bruderschaft_Info;
	permanent	= 0;
	description = "Quelle est la Confrérie du Dormeur ?";
};                       

FUNC int  DIA_BaalTaran_Bruderschaft_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Bruderschaft_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //Quelle est la Confrérie du Dormeur ?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //Nous sommes une communauté de croyants dans une nouvelle foi.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //Notre camp est situé dans l'est, dans le marais. Je suis venu pour prêcher la parole du Dormeur aux étrangers comme toi.
};

// **************************************************
//					Wer ist der Schläfer
// **************************************************

instance  DIA_BaalTaran_Sleeper (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Sleeper_Condition;
	information	= DIA_BaalTaran_Sleeper_Info;
	permanent	= 0;
	description = "Qui est le Dormeur ?";
};                       

FUNC int  DIA_BaalTaran_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //Qui est le Dormeur ?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //Le Dormeur est notre rédempteur. Il s'est révélé il y a cinq ans grâce à Y'Bérion, notre maître.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //Depuis lors, nous avons tous renoncé aux trois dieux. Et tu devrais bien le faire aussi.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //Les dieux ont juste attendu et observé pendant que nous étions exilés dans cette prison. Mais le Dormeur nous mènera à la liberté.
};

// **************************************************
//					Lehre des Schläfers
// **************************************************

instance  DIA_BaalTaran_Lehre (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Lehre_Condition;
	information	= DIA_BaalTaran_Lehre_Info;
	permanent	= 0;
	description = "Parle-moi des enseignements du Dormeur.";
};                       

FUNC int  DIA_BaalTaran_Lehre_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Lehre_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Parle-moi des enseignements du Dormeur.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //Le Dormeur est un être puissant, peut-être bien plus puissant qu'Iinnos, dieu de la lumière.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //Il est avec nous par l'esprit. Mais sa puissance est encore limitée. Il a dormi pendant mille ans, mais maintenant l'instant de son réveil est proche.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //Il nous a choisis pour être des témoins de son réveil et pour répandre sa parole.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //Écoute, tout ceux qui rejoignent le Dormeur auront des âmes immortelles, mais ceux qui sont contre lui seront punis.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //Mais le Dormeur est compatissant et envoie la preuve de sa puissance à tous ceux qui doutent de lui.
};

// **************************************************
//						Freiheit
// **************************************************

instance  DIA_BaalTaran_Freiheit (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 4;
	condition	= DIA_BaalTaran_Freiheit_Condition;
	information	= DIA_BaalTaran_Freiheit_Info;
	permanent	= 0;
	description = "À quoi la voie de la liberté ressemblera-t-elle ?";
};                       

FUNC int  DIA_BaalTaran_Freiheit_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Freiheit_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //À quoi la voie de la liberté ressemblera-t-elle ?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //Nous préparons une grande invocation du Dormeur, au cours de laquelle tous les novices créeront ensemble le contact.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //Durant cette invocation, le Dormeur révèlera le chemin de la liberté.
};

// **************************************************
//						Beweis
// **************************************************

instance  DIA_BaalTaran_Beweis (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Beweis_Condition;
	information	= DIA_BaalTaran_Beweis_Info;
	permanent	= 0;
	description = "Comment ton dieu prouve-t-il sa force ?";
};                       

FUNC int  DIA_BaalTaran_Beweis_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Beweis_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //Comment ton dieu prouve-t-il sa force ?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //Il nous parle au travers des visions. Celui qui entend sa voix ne doute plus de sa puissance.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //Si tu utilises l'Herbe qui pousse dans le marais, tu te rapprocheras du Dormeur et tu seras capable de l'entendre. Certains arrivent même à voir des images.
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_03"); //Je vois.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance  DIA_BaalTaran_WayToST (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_WayToST_Condition;
	information	= DIA_BaalTaran_WayToST_Info;
	permanent	= 0;
	description = "Comment aller au le camp de la Confrérie ?";
};                       

FUNC int  DIA_BaalTaran_WayToST_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WayToST_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WayToST_15_00"); //Comment aller au le camp de la Confrérie ?
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //Je suis occupé. Mais Baal Parvez devrait être aussi quelque part dans ce camp.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //Il est près du marché, de l'autre côté du château. Je pense même qu'il est dans sa propre cabane.

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi,"Un novice appelé Baal Parvez peut me mener au Camp Marécageux de la Confrérie. Il est à la place du marché derrière le château du Vieux Camp .");
};


// **************************************************
//					Will in die BURG
// **************************************************

instance  DIA_BaalTaran_IntoCastle (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 10;
	condition	= DIA_BaalTaran_IntoCastle_Condition;
	information	= DIA_BaalTaran_IntoCastle_Info;
	permanent	= 1;
	description = "Je dois entrer dans le château. Peux-tu m'aider ?";
};                       

FUNC int  DIA_BaalTaran_IntoCastle_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_IntoCastle_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //Je dois entrer dans le château. Peux-tu m'aider ?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //J'ai bien peur de ne pas pouvoir, mon frère. Les seuls parmi nous qui peuvent entrer au château sont ceux qui fournissent de l'Herbe à Gomez.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //Nous récoltons l'Herbe de marais et nous en faisons un commerce de détail dans le Vieux camp, en échange de marchandises venues du monde extérieur.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //Si tu étais l'un des messagers à la solde de Cor Kalom,  tu pourrais entrer au château. Mais pour ça, tu dois être l'un de nous.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //Et puis que veux-tu faire au château ?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Je veux rencontrer quelqu'un là-bas.",DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"J'ai une lettre pour le Grand Magicien du Cercle du Feu.",DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Je veux rencontrer quelqu'un là-bas.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //Quoi ? Qui ? Et pourquoi tu n'attends pas juste le moment de sa sortie ?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Cela ne te regarde pas.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Il est un des magiciens.",DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //J'ai une lettre pour le Grand Magicien du Cercle du Feu.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Oh ? Et d'où tiens-tu cela ? Les Mages te l'ont donné avant qu'ils ne te jettent ci,  pas vrai ?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Tu es stupide de dire ça à quelqu'un. Mais ne t'inquiète pas - je ne le répéterais pas.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Mais rends-toi service, ne parle de ça à personne. Les gens d'ici égorgeraient n'importe qui pour une chose pareille !
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //La plupart des gens aimeraient bien toucher la récompense que tu as reçu pour un message du monde extérieur.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //Il est un des magiciens.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //Ah ! Et bien, ils ne quittent jamais le château. Tu dois vraiment entrer.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //Et puis qu'attends-tu d'eux ?Des runes ? Des potions ?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Cela ne te regarde pas.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"C'est ça.",DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //Cela ne te regarde pas.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Très bien, l'ami Je voulais juste t'aider...
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //C'est ça.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //Je l'aurai parié ! Qu'est-ce qu'un type comme toi veut faire encore avec les Mages.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //Je peux te donner quelques bons conseils : Oublie les Mages. Ils prennent de loin trop de minerai pour leur marchandise.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Les runes et les potions sont bien meilleur marché dans notre camp.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle);
};
