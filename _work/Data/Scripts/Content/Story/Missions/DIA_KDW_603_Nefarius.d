// **************************** 
//				EXIT 
// ****************************

instance  Info_Nefarius_EXIT (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	999;
	condition	=	Info_Nefarius_EXIT_Condition;
	information	=	Info_Nefarius_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Nefarius_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************** 
//			Hallo 
// ****************************

instance  Info_Nefarius_Hallo (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_Hallo_Condition;
	information	=	Info_Nefarius_Hallo_Info;
	permanent	=	0;
	description =	"Qui es-tu ?";
};                       

FUNC int  Info_Nefarius_Hallo_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_Hallo_Info()
{
	AI_Output (other, self,"Info_Nefarius_Hallo_15_00"); //Qui es-tu ?
	AI_Output (self, other,"Info_Nefarius_Hallo_04_01"); //Je suis Nefarius. Magicien du Cercle de l'Eau.
};

// **************************** 
//			Wo Saturas
// ****************************

instance  Info_Nefarius_WoSaturas (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	2;
	condition	=	Info_Nefarius_WoSaturas_Condition;
	information	=	Info_Nefarius_WoSaturas_Info;
	permanent	=	0;
	description =	"Où puis-je trouver Saturas ?";
};                       

FUNC int  Info_Nefarius_WoSaturas_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_WoSaturas_Info()
{
	AI_Output (other, self,"Info_Nefarius_WoSaturas_15_00"); //Où puis-je trouver Saturas ?
	AI_Output (self, other,"Info_Nefarius_WoSaturas_04_01"); //Passe par la grande porte ronde. Tu le trouveras là.
};

// **************************** 
//			WannaMage
// ****************************

instance  Info_Nefarius_WannaMage (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_WannaMage_Condition;
	information	=	Info_Nefarius_WannaMage_Info;
	permanent	=	0;
	description =	"Je voudrais devenir un Magicien du Cercle de l'Eau !";
};                       

FUNC int  Info_Nefarius_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Hallo))
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_WannaMage_Info()
{
	AI_Output (other, self,"Info_Nefarius_WannaMage_15_00"); //Je voudrais devenir un Magicien du Cercle de l'Eau !
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_01"); //Pas si vite, mon garçon !
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_02"); //Avant que nous laissions un jeune homme nous rejoindre, il doit avoir fait quelque chose d'important.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_03"); //Et il doit nous avoir servis pendant un certain temps.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_04"); //Si tu es vraiment sérieux, tu devrais rejoindre nos mercenaires. Là tu peux nous servir.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_05"); //Et peut-être qu'un jour on t'accordera une chance de faire quelque chose d'important.
};

// **************************** 
//			NowReady
// ****************************

instance  Info_Nefarius_NowReady (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_NowReady_Condition;
	information	=	Info_Nefarius_NowReady_Info;
	permanent	=	1;
	description =	"Suis-je prêt pour le Cercle de l'Eau ?";
};                       

FUNC int  Info_Nefarius_NowReady_Condition()
{
	if	( !FMTaken && Npc_KnowsInfo(hero, Info_Nefarius_WannaMage) && (Npc_GetTrueGuild(hero)!=GIL_KDW) )
	{
		return 1;
	};	
};

FUNC VOID  Info_Nefarius_NowReady_Info()
{
	AI_Output (other, self,"Info_Nefarius_NowReady_15_00"); //Suis-je prêt pour le Cercle de l'Eau ?
	
	if (Npc_GetTrueGuild (hero) != GIL_SLD) 
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_01"); //Devient un de nos mercenaires, alors nous verrons...
	}
	else
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_02"); //Je vois, tu fais partie de nos mercenaires. Très bien, très bien...
		AI_Output (self, other,"Info_Nefarius_NowReady_04_03"); //Le temps fera le reste...
	};
};

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
///////////////		Kapitel 4				//////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

// **************************** 
//			OCNews
// ****************************

instance  Info_Nefarius_OCNews (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_OCNews_Condition;
	information	=	Info_Nefarius_OCNews_Info;
	permanent	=	0;
	important	= 	1;
};                       

FUNC int  Info_Nefarius_OCNews_Condition()
{
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID  Info_Nefarius_OCNews_Info()
{
	AI_Output (self, other,"Info_Nefarius_OCNews_04_00"); //A t'on des nouvelles de nos amis du Vieux camp ?
	AI_Output (other, self,"Info_Nefarius_OCNews_15_01"); //Gomez a fait tué tous les Magiciens du Feu !
	AI_Output (self, other,"Info_Nefarius_OCNews_04_02"); //Non ! L'imbécile ! J'ai averti Corristo - on ne devait jamais lui faire confiance ! Tu dois le dire à Saturas !
	if (Npc_GetTrueGuild(hero)==GIL_SLD)
	{
		AI_Output (self, other,"Info_Nefarius_OCNews_04_03"); //Attends !
		AI_Output (self, other,"Info_Nefarius_OCNews_04_04"); //Tu as bravé de grands dangers en notre nom.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_05"); //Je pense que tu es maintenant prêt à revêtir la Robe longue d'un magicien de l'eau.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_06"); //Mais parle maintenant à Saturas ! Vite !
	};
	AI_StopProcessInfos	(self);
};
