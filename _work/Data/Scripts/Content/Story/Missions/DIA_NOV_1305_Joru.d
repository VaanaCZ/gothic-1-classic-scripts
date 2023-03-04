// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Joru_Exit (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 999;
	condition	= DIA_Joru_Exit_Condition;
	information	= DIA_Joru_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Joru_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Joru_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Was machst du?
// **************************************************

instance  DIA_Joru_Greet (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_Greet_Condition;
	information	= DIA_Joru_Greet_Info;
	permanent	= 0;
	description = "Que fais-tu ici ?";
};                       

FUNC int  DIA_Joru_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_Joru_Greet_Info()
{
	AI_Output (other, self,"DIA_Joru_Greet_15_00"); //Que fais-tu ici ?
	AI_Output (self, other,"DIA_Joru_Greet_07_01"); //J'enseigne la parole du Dormeur aux novices.
	AI_Output (self, other,"DIA_Joru_Greet_07_02"); //Je suis moi-même encore un novice, mais bientôt je serai un Baal - un des Sages.
	AI_Output (self, other,"DIA_Joru_Greet_07_03"); //J'ai même parlé à Y'Bérion. Il a été choisi. Il m'a dit que si je travaille dur, je peux bientôt devenir un maître.
	AI_Output (self, other,"DIA_Joru_Greet_07_04"); //Mais je remets toujours cela à plus tard. Il n'y a pas d'urgence - comprends-tu ? Je pourrais toujours devenir un maître le moment voulu.
	AI_Output (self, other,"DIA_Joru_Greet_07_05"); //En ce moment, je suis tout à fait satisfait de mes occupations courantes.
};

// **************************************************
//					Tester
// **************************************************

instance  DIA_Joru_Tester (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_Tester_Condition;
	information	= DIA_Joru_Tester_Info;
	permanent	= 0;
	description = "Quelle est ta mission ?";
};                       

FUNC int  DIA_Joru_Tester_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_Tester_Info()
{
	AI_Output (other, self,"DIA_Joru_Tester_15_00"); //Quelle est ta mission ?
	AI_Output (self, other,"DIA_Joru_Tester_07_01"); //J'examine avec mes collègues les nouvelles substances élaborées par Cor Kalom dans son laboratoire d'alchimie.
	AI_Output (self, other,"DIA_Joru_Tester_07_02"); //Son assistant nous donne quelque chose de nouveau tous les deux jours. Et nous l'examinons.
	AI_Output (self, other,"DIA_Joru_Tester_07_03"); //Cette Herbe ouvre ton esprit. Si tu prends la bonne dose, tu peux entrer en contact avec le Dormeur.
};

// **************************************************
//				Schonmal Kontakt?
// **************************************************

instance  DIA_Joru_SleeperContact (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_SleeperContact_Condition;
	information	= DIA_Joru_SleeperContact_Info;
	permanent	= 0;
	description = "As-tu jamais été en contact avec le Dormeur ?";
};                       

FUNC int  DIA_Joru_SleeperContact_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Tester))
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_SleeperContact_Info()
{
	AI_Output (other, self,"DIA_Joru_SleeperContact_15_00"); //As-tu jamais été en contact avec le Dormeur ?
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_01"); //Non. Pas encore. Mais c'est parce que nous n'avons jamais assez de marchandise.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_02"); //Kalom veut toujours entendre parler de cet effet de l'Herbe, mais j'ai l'impression que mon avis ne l'intéresse pas vraiment.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_03"); //Si je trouve la marchandise stimulante, il la passe directement aux Sages...
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_04"); //Mais bientôt je serai un Sage moi-même, alors je pourrais bien explorer mes limites et écouter la voix du Dormeur.
};


// **************************************************
//					JOIN PSI
// **************************************************
	var int Joru_BringJoints;
// **************************************************

instance  DIA_Joru_JoinPsi (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_JoinPsi_Condition;
	information	= DIA_Joru_JoinPsi_Info;
	permanent	= 0;
	description = "Je voudrais rejoindre ta camp - peux-tu m'aider ?";
};                       

FUNC int  DIA_Joru_JoinPsi_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_JoinPsi_Info()
{
	AI_Output (other, self,"DIA_Joru_JoinPsi_15_00"); //Je voudrais rejoindre ta camp - peux-tu m'aider ?
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_01"); //Tu veux nous rejoindre ? C'est bon ! Un moment... oui, je pense que je peux t'aider.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_02"); //Je ne suis pas encore un Sage, mais j'ai une certaine influence dans la Confrérie.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_03"); //Tu dois me rendre un service. As-tu déjà vu Fortuno ?
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
	Info_AddChoice		(DIA_Joru_JoinPsi,"Non.",DIA_Joru_JoinPsi_Nein);
	Info_AddChoice		(DIA_Joru_JoinPsi,"Oui.",DIA_Joru_JoinPsi_Ja);
};

func void DIA_Joru_JoinPsi_Ja()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Ja_07_00"); //Alors tu prends ta ration quotidienne ? Si tu me la donnes alors nous ferons affaire.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Ja_15_01"); //J'y réfléchirai.
	Joru_BringJoints = LOG_RUNNING; 
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

func void DIA_Joru_JoinPsi_Nein()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Nein_07_00"); //Alors en route,  rencontre-le et ramasse ta ration quotidienne. Si tu me laisses toute l'Herbe qu'il te donne, nous ferons affaire.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Nein_15_01"); //J'y réfléchirai.
	Joru_BringJoints = LOG_RUNNING; 

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Joru voudrai avoir ma ration quotidienne d'Herbe que j'obtiens de Fortuno.");
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

// **************************************************
//					SUCCESS
// **************************************************

instance  DIA_Joru_JointsRunning (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_JointsRunning_Condition;
	information	= DIA_Joru_JointsRunning_Info;
	permanent	= 1;
	description = "J'ai de l'Herbe sur moi. tu peux l'avoir.";
};                       

FUNC int  DIA_Joru_JointsRunning_Condition()
{
	if (Joru_BringJoints == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_JointsRunning_Info()
{
	AI_Output				(other, self,"DIA_Joru_JointsRunning_15_00"); //J'ai de l'Herbe sur moi. tu peux l'avoir.
		
	if (Npc_HasItems(other,itmijoint_2)>=3)
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_01"); //Bon ! Tu dois avoir remarqué qu'aucun des Sages ne veut te parler.
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_02"); //tu peux changer cela en les impressionnant. Je peux te dire comment faire.
		
		B_GiveInvItems		(other, self, itmijoint_2, 3);
		
		Joru_BringJoints = 	LOG_SUCCESS; 
		B_GiveXP			(XP_WeedForJoru);
	}
	else
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00"); //Nous avions convenu de trois Noires Nordique et rien d'autre ! Donne-moi l'Herbe, ensuite seulement nous pourrons faire affaire !
	}; 
};

// **************************************************
//			Wie kann ich Gurus beeindrucken?
// **************************************************
	var int Joru_Tips;
// **************************************************

instance  DIA_Joru_ImpressGurus (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_ImpressGurus_Condition;
	information	= DIA_Joru_ImpressGurus_Info;
	permanent	= 1;
	description = "Comment puis-je impressionner les Sages ?";
};                       

FUNC int  DIA_Joru_ImpressGurus_Condition()
{
	if (Joru_BringJoints == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_ImpressGurus_Info()
{
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_00"); //Comment puis-je impressionner les Sages ?
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_01"); //Baal Cadar instruit les novices dans la magie du Dormeur.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_02"); //Si tu veux attirer son attention, utilise la magie.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_03"); //Mais n'utilise pas le Poing du Vent par exemple ! Endort un de ses assistants ou quelque chose comme ça.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_04"); //Baal Namib est là-bas à la porte principale. C'est l'un des types les plus importants. Je pense que Lester devrait pouvoir t'aider avec lui. Parle-lui dès que son maître sera parti.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_05"); //Les autres Sages sont fondamentalement des gens bien - essaye juste de te rendre utile.
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_06"); //Merci du conseil.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_07"); //Hé, les affaires sont les affaires.
	
	if ( Joru_JoinPsi == FALSE)
	{
		B_LogEntry	(CH1_JoinPsi,"Pour impressionner Baal Cadar je dois jeter un sortilège de torpeur sur un de ses auditeurs.");
		B_LogEntry	(CH1_JoinPsi,"Je demanderai au novice Lester comment impressionner Baal Namib à la porte principale. Je dois m'assurer qu'aucun Sage n'est à côté, quoique !");
		Joru_JoinPsi = TRUE;
	};
	
	Joru_Tips = TRUE;
};

// **************************************************
//					Woher Magie?
// **************************************************

instance  DIA_Joru_GetMagic (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_GetMagic_Condition;
	information	= DIA_Joru_GetMagic_Info;
	permanent	= 1;
	description = "Comment arriverai-je à la magie du Dormeur ?";
};                       

FUNC int  DIA_Joru_GetMagic_Condition()
{
	if (Joru_Tips == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_GetMagic_Info()
{
	if (Joru_Tips_Mage == FALSE)
	{
		Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
		B_LogEntry		(GE_TraderPSI,"Baal Cadar vend des RUNES et des PARCHEMINS.");
		Joru_Tips_Mage	=TRUE;
	};
	AI_Output (other, self,"DIA_Joru_GetMagic_15_00"); //Comment arriverai-je à la magie du Dormeur ?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_01"); //Baal Cadar vend des runes et des parchemins. Cela ne te sert à rien s'il ne te parle pas, pas vrai ?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_02"); //Peut-être un autre Sage pourrait t'aider.
};







/*
Sit_1_PSI_Joru_SmokingTeacher

Joru: Du bist neu hier. Hast Du schon unser Kraut genossen?
Das solltest du unbedingt tun. Weißt du, es ist ziemlich gut. Es öffnet deinen Geist für die Worte des Schläfers.
Komm, komm zu uns und lasse deinen Geist frei. Mach dich bereit für eine Reise.
Eine spirituelle Reise. Lerne die Macht des Geistes zu nutzen. Lerne sie zu kontrollieren.
Komm zu uns in die Gemeinschaft der Erwachten und gleichzeitig Erwecker. Teile mit uns deine Kraft, wie wir unsere Kraft mit dir teilen.
Mach dich frei von Suche und beginne zu finden. Entdecke die Wahrheit. Das alles kannst du erreichen, wenn du zu uns kommst.

*/ 


	










