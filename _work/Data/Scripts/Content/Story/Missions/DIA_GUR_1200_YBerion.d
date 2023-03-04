// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Yberion_EXIT(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 999;
	condition	= Info_Yberion_EXIT_Condition;
	information	= Info_Yberion_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Yberion_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Yberion_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//############################### KAPITEL 1 ###############################


INSTANCE DIA_YBerion_Wache(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= DIA_YBerion_Wache_Condition;
	information	= DIA_YBerion_Wache_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_YBerion_Wache_Condition()
{
	if (Kapitel == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_YBerion_Wache_Info()
{	
	AI_Output			(self,	other,"DIA_YBerion_Wache_12_00"); //Qu'est-ce que tu fais ici ? Qui t'a laissé entrer ? GARDES !
	B_IntruderAlert		(self,	other);
	AI_StopProcessInfos	(self);
};

//############################### Kennen? ###############################

INSTANCE DIA_YBerion_Kennen(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= DIA_YBerion_Kennen_Condition;
	information	= DIA_YBerion_Kennen_Info;
	permanent	= 0;
	description = "Salutation, Maître Y'Bérion.";
};                       

FUNC INT DIA_YBerion_Kennen_Condition()
{
	if (Kapitel == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_YBerion_Kennen_Info()
{	
	AI_Output (other, self,"DIA_YBerion_Kennen_15_00"); //Salutation, Maître Y'Bérion.
	AI_Output (self, other,"DIA_YBerion_Kennen_12_01"); //Ah ! Je te reconnais !
	AI_Output (other, self,"DIA_YBerion_Kennen_15_02"); //Impossible. On ne s'est jamais rencontré.
	AI_Output (self, other,"DIA_YBerion_Kennen_12_03"); //Mais pourtant... Bon - que veux-tu ?
};


//############################### KAPITEL 2 ###############################

// ------------------------------ BringFocus ---------------------------
INSTANCE Info_YBerion_BringFocus (C_INFO)
{
	npc			= GUR_1200_Yberion;
	condition	= Info_YBerion_BringFocus_Condition;
	information	= Info_YBerion_BringFocus_Info;
	permanent	= 1;
	description = "J'ai entendu que tu cherches quelque chose.";
};


FUNC INT Info_YBerion_BringFocus_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_YBerion_Kennen)	)
	&&	(Npc_GetTrueGuild(hero) != GIL_NONE		)
	&& 	(YBerion_BringFocus		!= LOG_RUNNING	)
	&& 	(YBerion_BringFocus		!= LOG_SUCCESS	)
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_BringFocus_Info()
{
	AI_Output (other, self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01"); //J'ai entendu que tu cherches quelque chose.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02"); //Exact. Nous avons besoin de pierres focales magique.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03"); //Nous avons envoyé le novice Nyras pour rassembler les pierres focales. Mais il n'est pas encore de retour.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04"); //Tu pourrais me renseigner sur ce qui est arrivé?
	
	Info_ClearChoices	(Info_YBerion_BringFocus);
	Info_AddChoice		(Info_YBerion_BringFocus,DIALOG_BACK							,	Info_YBerion_BringFocus_BACK);
	Info_AddChoice		(Info_YBerion_BringFocus,"J'irai chercher la pierre focale !",	Info_YBerion_BringFocus_OK);
	Info_AddChoice		(Info_YBerion_BringFocus,"Où dois-je commencé à chercher ?",	Info_YBerion_BringFocus_WO);
	Info_AddChoice		(Info_YBerion_BringFocus,"Pourquoi la pierre est si importante ?",	Info_YBerion_BringFocus_FOKUS);
};

func void Info_YBerion_BringFocus_BACK ()
{
	Info_ClearChoices	(Info_YBerion_BringFocus);
};

func void Info_YBerion_BringFocus_OK ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01"); //J'irai chercher la pierre focale !
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02"); //Prends cette carte. L'emplacement de la pierre y est indiqué.

	B_Story_BringFirstFocus();

	B_LogEntry		(CH2_Focus,"Y'Bérion a envoyé le disciple Nyras récolter la pierre focale magique, mais il n'ait pas encore revenu. Le Sage m'a donné une carte avec le chemin vers la pierre focale.");
};

func void Info_YBerion_BringFocus_WO ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01"); //Où dois-je commencé à chercher ?
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02"); //Quitte le camp, tourne à droite et va jusqu'à la grande falaise. Continue au-delà de la forêt jusqu'à ce que tu puisses voir la mer. C'est là que se trouve la pierre focale.
};

func void Info_YBerion_BringFocus_FOKUS ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01"); //Pourquoi la pierre est si importante ?
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02"); //C'est un objet magique qui peut concentrer nos pouvoirs spirituels.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03"); //C'est l'une des cinq pierres focales employées par les Mages pour élever la Barrière.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04"); //J'ai eu une  vision qui m'a fait comprendre que nous devions utiliser la puissance de la pierre.
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05"); //Voilà une vision tout à fait intéressante.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06"); //Ma vision était un signe du Dormeur. Nous pouvons l'atteindre avec la pierre focale !
};

// ------------------------------ RUNNING ----------------------------------
INSTANCE Info_YBerion_BringFocus_RUNNING (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_BringFocus_RUNNING_Condition;
	information	= Info_YBerion_BringFocus_RUNNING_Info;
	permanent	= 0;
	description	= "Je n'ai pas encore trouvé la pierre focale.";
};                       

FUNC INT Info_YBerion_BringFocus_RUNNING_Condition()
{
	if  ( YBerion_BringFocus == LOG_RUNNING ) && ( !Npc_HasItems ( hero, Focus_1 ))
	{
		return TRUE;
	};
};

FUNC VOID Info_YBerion_BringFocus_RUNNING_Info()
{	
	AI_Output (other, self,"Info_YBerion_BringFocus_RUNNING_15_01"); //Je n'ai pas encore trouvé la pierre focale.
	AI_Output (self, other,"Info_YBerion_BringFocus_RUNNING_12_02"); //Alors allons-y. Le Dormeur nous guidera.
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_YBerion_BringFocus_Success (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_BringFocus_Success_Condition;
	information	= Info_YBerion_BringFocus_Success_Info;
	permanent	= 0;
	description	= "J'ai trouvé la pierre focale.";
};                       

FUNC INT Info_YBerion_BringFocus_Success_Condition()
{
	if  ( YBerion_BringFocus == LOG_RUNNING ) && ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_BringFocus_Success_Info()
{	
	AI_Output			(other, self,"Info_YBerion_BringFocus_Success_15_01"); //J'ai trouvé la pierre focale.
	AI_Output			(self, other,"Info_YBerion_BringFocus_Success_12_02"); //Excellent. Tu nous as fait une grande faveur.
	AI_Output			(self, other,"Info_YBerion_BringFocus_Success_12_03"); //Maintenant rends la pierre à Cor Kalom. Il saura ce qu'il faut faire.
	if	(Kalom_TalkedTo == FALSE)
	{
		AI_Output		(other, self,"Info_YBerion_BringFocus_Success_15_04"); //Ou puis-je trouver ce Cor Kalom?
		AI_Output		(self, other,"Info_YBerion_BringFocus_Success_12_05"); //Il passe la majeure partie de son temps au laboratoire d'alchimie qui se trouve dans la partie supérieure des passerelles.
		AI_Output		(self, other,"Info_YBerion_BringFocus_Success_12_06"); //Parle à Lester à l'entrée du camp... il guide souvent les nouveaux venus au voisinage du camp.
		B_LogEntry		(CH2_Focus,"Y'Bérion m'a dit d'amener la pierre à un autre Sage appelé Cor Kalom. Ce Cor Kalom passe toute la journée dans la laboratoire d'alchimie."); 
	}
	else
	{
		B_LogEntry		(CH2_Focus,"Y'Bérion m'a dit d'amener la pierre à Cor Kalom. Quel plaisir de rencontrer à nouveau cette charmante personne.");
	};

	Tpl_1406_Templer.aivar[AIV_PASSGATE] = TRUE;		//Türwache vor dem Labor

	YBerion_BringFocus = LOG_SUCCESS;
	B_GiveXP			(XP_BringFocusToYBerion);
};

// ------------------------------ NYRAS ----------------------------------
INSTANCE Info_YBerion_NYRAS (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_NYRAS_Condition;
	information	= Info_YBerion_NYRAS_Info;
	permanent	= 0;
	description	= "Le disciple Nyras est devenu fou !";
};                       

FUNC INT Info_YBerion_NYRAS_Condition()
{
	if  ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_NYRAS_Info()
{	
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_01"); //Le disciple Nyras est devenu fou !
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_02"); //Il a dit que le Dormeur lui avait parlé et l'avait choisi pour être son seul serviteur !
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_03"); //Alors il m'a attaqué et a essayé de me tuer !
	AI_Output			(self, other,"Info_YBerion_NYRAS_12_04"); //Le pouvoir du Dormeur est si grand que les âmes non préparées sont au désespoir.
	AI_Output			(self, other,"Info_YBerion_NYRAS_12_05"); //Nous seuls, les Sages, avons acquis tout au long de nos années de méditation suffisamment de pouvoir spirituel pour soutenir la voix du Dormeur tout-puissant !
};

// ------------------------------ BELOHNUNG ----------------------------------
instance  GUR_1200_Yberion_EARN (C_INFO)
{
	npc				= GUR_1200_Yberion;
	condition		= GUR_1200_Yberion_EARN_Condition;
	information		= GUR_1200_Yberion_EARN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Et si nous parlions d'une espèce de récompense ?"; 
};

FUNC int  GUR_1200_Yberion_EARN_Condition()
{	
	if ( YBerion_BringFocus == LOG_SUCCESS) && ( Npc_GetTrueGuild (hero)!= GIL_NOV ) && ( C_IsChapter(2) )
	{
		return 1;
	};

};
FUNC void  GUR_1200_Yberion_EARN_Info()
{
	AI_Output				(other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //Et si nous parlions d'une espèce de récompense ?
	AI_Output				(self, other,"GUR_1200_Yberion_EARN_Info_12_02"); //Puisque tu n'es pas un membre de notre Confrérie, je te récompenserai.
	AI_Output				(self, other,"GUR_1200_Yberion_EARN_Info_12_03"); //Prends cette amulette en signe de ma gratitude.
	CreateInvItem	    (self, Schutzamulett_Feuer);
	B_GiveInvItems	    (self, hero, Schutzamulett_Feuer, 1);
};  



//############################### KAPITEL 3 ###############################
//SPIELER HAT DIE HEILKRÄUTER ZU COR ANGAR GEBRACHT
//YBERION WACHT AUF UND STIRBT
/*
instance GUR_1200_Yberion_LASTWORDS (C_INFO)
{
	npc				= GUR_1200_Yberion;
	condition		= GUR_1200_Yberion_LASTWORDS_Condition;
	information		= GUR_1200_Yberion_LASTWORDS_Info;
	important		= 1;
	permanent		= 0;

};

FUNC int GUR_1200_Yberion_LASTWORDS_Condition()
{	
	if ( Npc_KnowsInfo (hero,Info_CorAngar_FindHerb_Success))
	{
		return 1;
	};

};
FUNC void  GUR_1200_Yberion_LASTWORDS_Info()
{
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_01"); //Das Ende...der Schläfer...ich sah...IHN!
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_02"); //Wer...?...du bist es, gut. Hör mir zu....
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_03"); //Du darfst den Schläfer nicht wecken,... die Wassermagier, ...
	AI_Output (other, self,"GUR_1200_Yberion_LASTWORDS_Info_15_04"); //Was ist mit den Wassermagiern?
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_05"); //Du musst zu den Wassermagiern gehen. Sie werden es schaffen, hier rauszukommen.
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_06"); //Der Schläfer...Ich sah ihn. Er ist ein ...ein ....Dämon!
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_07"); //Wenn du die Barriere noch immer vernichten willst,... geh zum Neuen Lager. Berichte ihnen vom Fokus. Sag ihnen...
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_08"); //...sag ihnen das wir herausgefunden haben, wie sich die Foki aufladen lassen, sie sollen...sollen die Barriere vernichten......ihr müsst ....
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_09"); //...das Böse....darf nicht erwachen .... 
	
	
	
};  
// ------------------------------  ----------------------------------
*/
