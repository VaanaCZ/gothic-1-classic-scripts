//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################

// ************************ EXIT **************************

instance DIA_GUR_1202_CorAngar_Exit (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 999;
	condition	= DIA_GUR_1202_CorAngar_Exit_Condition;
	information	= DIA_GUR_1202_CorAngar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_GUR_1202_CorAngar_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GUR_1202_CorAngar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************	
//		Später Trainer 
// ************************

instance DIA_CorAngar_LaterTrainer (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_LaterTrainer_Condition;
	information	= DIA_CorAngar_LaterTrainer_Info;
	permanent	= 0;
	description = "M'entraineras-tu ?";
};                       

FUNC int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

FUNC VOID DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //M'entraineras-tu ?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Tu veux devenir un grand guerrier, et maintenant tu es à la recherche de quelqu'un pour te former.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //Plausible. Mais je ne suis pas l'homme que tu recherches.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //Je consacre tout mon temps seulement à ceux qui font partie du Cercle Sacré des Templiers.
};

// ************************	
//		Wie Templer
// ************************

instance DIA_CorAngar_WieTempler (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_WieTempler_Condition;
	information	= DIA_CorAngar_WieTempler_Info;
	permanent	= 1;
	description = "Comment puis-je devenir un templier ?";
};                       

FUNC int DIA_CorAngar_WieTempler_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && (Npc_GetTrueGuild(other) != GIL_TPL) )
	{
		return 1;
	};
};

FUNC VOID DIA_CorAngar_WieTempler_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //Comment puis-je devenir un templier ?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //D'abord, tu dois servir de novice afin de montrer que tu crois vraiment au Dormeur.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //Ensuite reviens vers moi, et je t'apprendrais.
	AI_StopProcessInfos	( self );
};

/////////////////////////////////
/////////////////////////////////
//////// Kapitel 2 //////////////
/////////////////////////////////
/////////////////////////////////

//-------------------------------------------------------------------------
//							STÄRKE UND DEX STEIGERN
//-------------------------------------------------------------------------
INSTANCE GUR_1202_CorAngar_Teach(C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 10;
	condition	= GUR_1202_CorAngar_Teach_Condition;
	information	= GUR_1202_CorAngar_Teach_Info;
	permanent	= 1;
	description = "Peux-tu améliorer ma force et ma dextérité ?";
};                       

FUNC INT GUR_1202_CorAngar_Teach_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};
};

FUNC VOID GUR_1202_CorAngar_Teach_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //Peux-tu améliorer ma force et ma dextérité ?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Tout guerrier a besoin de force et d'adresse.
	
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_BACK()
{
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
};

func void GUR_1202_CorAngar_Teach_STR_1()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_STR_5()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_1()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_5()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

//--------------------------------------------------------------
// TEMPLER WERDEN
//--------------------------------------------------------------
instance  GUR_1202_CorAngar_WANNABETPL (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WANNABETPL_Condition;
	information		= GUR_1202_CorAngar_WANNABETPL_Info;
	important		= 0;
	permanent		= 1;
	description		= "Je veux devenir un templier !"; 
};

FUNC int  GUR_1202_CorAngar_WANNABETPL_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	&& (Npc_GetTrueGuild (hero) == GIL_NOV)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_WANNABETPL_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //Je veux devenir un templier !
	
	if	(hero.level < 10)
	{ 
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //Tu n'es pas encore prêt. Tu pourras nous rejoindre dès que tu auras recueilli plus d'expérience.
	    GUR_1202_CorAngar_WANNABETPL.permanent = 1;
    }
    else if	(hero.level >= 10)
    {
	    AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //Le temps est venu de nous rejoindre.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Rappelle-toi qu'un templier est non seulement un bon guerrier et un gardien du camp, mais que nous sommes aussi les gardes choisis par le Dormeur. Les gardiens de l'esprit.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //Nous devons nous servir de notre force physique et spirituelle. Seuls ceux dont le corps et l'esprit sont en harmonie peuvent être de vrais templiers.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //Je suis vraiment heureux que tu TE sois si bien débrouillé en si peu de temps. Maintenant te voilà prêt à nous rejoindre.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Rappelle-toi : un esprit concentré et un corps endurci peuvent faire face à n'importe quel danger.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //A présent va voir Gor Na Toth au camp de formation. Il te donnera une nouvelle armure.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero, GIL_TPL);
		hero.guild = GIL_TPL;

		Log_CreateTopic	(GE_BecomeTemplar,	LOG_NOTE);
		B_LogEntry		(GE_BecomeTemplar,"Aujourd'hui Cor Angar m'a nommé templier. Gor Na Toth me donnera ma nouvelle armure. Il est habituellement au terrain d'entraînement.");
		Log_CreateTopic	(GE_TeacherPSI,		LOG_NOTE);
		B_LogEntry		(GE_TeacherPSI,"Cor Angar enseigne la FORCE, la DEXTÉRITÉ et le combat à DEUX MAINS. Il ne m'enseignera ce dernier que si je maîtrise le combat à UNE MAIN. Il peut être trouvé habituellement au terrain entraînement des templiers au second niveau dans les arbres.");
	};

};

//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND1 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND1_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1,	LPCOST_TALENT_2H_1,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTrueGuild    (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND1_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01"); //Je vais t'apprendre à manier une épée à deux mains.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02"); //Combattre avec une arme à deux mains exige un bon niveau de force et de dextérité.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03"); //Pour se servir d'une arme à deux mains, tu dois non seulement maîtriser ton corps, mais aussi ton esprit.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04"); //tu peux acquérir la compétence seulement si tu maîtrises l'esprit et le corps.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05"); //La concentration, voilà la clef. Corps et esprit unis par la concentration.

		GUR_1202_CorAngar_ZWEIHAND1.permanent		= 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND2 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND2_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2,	LPCOST_TALENT_2H_2,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND2_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");		//Je veux me perfectionner dans les combats utilisant une arme à deux mains.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02"); //A présent, tu sais bouger avec une lame. Et maintenant je vais te montrer la maîtrise du combat.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03"); //Sers toi de ton esprit pour prévoir les mouvements de ton adversaire et anticiper son coup.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04"); //Connaître la façon de combattre de tes ennemis c'est la moitié de la victoire.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05"); //Sois vif, rapide, tes mouvements devront être à la fois déroutants et fluides, tes coups précis et violents.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06"); //Apprends-toi à ignorer la douleur. C'est de ta  férocité que dépendra finalement l'issue du combat.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07"); //Reste calme. Une seule condition pour en sortir vivant: entrer dans le combat avec calme et concentration.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08"); //Sers-toi de ta compétence avec sagesse. Et rappelle-toi ceci : chaque combat engagé, c'est ta vie qui est en jeu.

		GUR_1202_CorAngar_ZWEIHAND2.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  

  
  
  
  
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################
 
// **************************************************************************
// 				nach der großen Beschwörung
// **************************************************************************
instance  GUR_1202_CorAngar_SENDS (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_SENDS_Condition;
	information		= GUR_1202_CorAngar_SENDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "Que se passe t'il maintenant ?"; 
};

FUNC int  GUR_1202_CorAngar_SENDS_Condition()
{	
	if	(Kapitel == 3)
	&&	(CorAngar_GotoOGY == FALSE)
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_SENDS_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //Que se passe t'il maintenant ?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //La vision était très vague, elle nous a apporté plus d'interrogations que de réponses.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //Mais j'ai parfaitement vu un orc dans une grotte. D'ailleurs, il y a tout près d'ici un endroit abandonné depuis fort longtemps qui sert de culte aux coupe-gorge.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //C'est là que les orcs enterraient leurs morts, c'est ainsi que nous appelons ce réseau de grottes le cimetière orc.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //Le Sage Baal Lukor s'est rendu là bas avec quelques templiers. Peut-être va-t-on trouver là bas quelque chose qui nous aiderait à comprendre la vision.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //J'ai besoin de quelqu'un pour aller jeter un coup d'œil là bas et me rapporter ce qu'il a vu.
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //Pourquoi tu n'y vas pas toi-même ? Tu es le chef des templiers !
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //Ma mission est de protéger Y'Bérion L'Unique Clairvoyant. Je dois rester ici avec lui et le protéger.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //Tu as rendu un grand service au camp. J'ai plus confiance en toi qu'en n'importe qui ici.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //Je te demande de te rendre au cimetière orc et de me rapporter tout ce que les templiers ont découvert.
	
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Qu'aurais-je en échange ?",	GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Je continue mon chemin à partir de cet instant !",	GUR_1202_CorAngar_SENDS_KNOW);
};  
func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //Qu'aurais-je en échange ?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //Tu veux du minerai ? Finalement, je me suis peut-être trompé sur ton compte. Mais j'ai besoin de toi.  Voilà, 100 minerais pour toi. Mais c'est tout ce que tu auras!
	CreateInvItems		(self,ItMiNugget,100);
	B_GiveInvItems      (self, hero, ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //Je continue mon chemin à partir de cet instant !
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Avant de partir, prends cet anneau. Puisse-t-il te protéger pendant les combats !
	
	B_Story_GotoOrcGraveyard();

	CreateInvItem		(self, Schutzring_Geschosse1);
	B_GiveInvItems      (self, hero, Schutzring_Geschosse1, 1);
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
};
	
instance  GUR_1202_CorAngar_WHERE (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WHERE_Condition;
	information		= GUR_1202_CorAngar_WHERE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Où est le cimetière Orc ?"; 
};

FUNC int  GUR_1202_CorAngar_WHERE_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_SENDS) )
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_WHERE_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WHERE_Info_15_01"); //Où est le cimetière Orc ?
	AI_Output			(self, other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //Pas loin d'ici. Talas le novice connaît le chemin. Tu le trouveras dans la cour du temple. Il te servira de guide.

	B_LogEntry		(CH3_OrcGraveyard,"Le novice Talas me montrera le chemin vers le cimetière Orc. Il m'attend à la cour du temple.");
};  

// **************************************************************************
// 				nach dem Ork-Friedhof
// **************************************************************************
instance  GUR_1202_CorAngar_AFTER (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_AFTER_Condition;
	information		= GUR_1202_CorAngar_AFTER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Je suis allé au cimetière Orc."; 
};

FUNC int  GUR_1202_CorAngar_AFTER_Condition()
{
	  
	if   ( BaalLukor_BringParchment == 4 ) 
	{
		return	1;
	};
};

FUNC void  GUR_1202_CorAngar_AFTER_Info()
{
	
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //Je reviens du cimetière Orc. Je n'y ai rien trouvé. Aucun Dormeur, aucune trace, rien.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //Et au sujet de Baal Lukor et de ses templiers ?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //Ils sont tous morts.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //Morts? Mais de quoi… qu'est-il arrivé ?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //Tout le réseau de grottes grouille d'Orcs. Ils ont tué tous les templiers.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Seul Baal Lukor et moi-même avons survécu, mais Baal Lukor est devenu subitement fou.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //Il a crié que le Dormeur lui avait donner l'ordre de me tuer, et qu'il était décidé à le faire.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //Il est évident qu'il ne pouvait pas accepter de n'avoir rien trouvé..
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //Je ne pense pas que l'influence du Dormeur aille jusqu'à causer des actes aussi violents.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //Il ne peut pas... non… c'est... IMPENSABLE !
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //Le plus important c'est que dans sa folie Baal Lukor a échoué.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Y'Bérion reste notre seul espoir à présent.
	 

	B_GiveXP			(XP_ReportToCorAngar);
	B_Story_BackFromOrcGraveyard();
};  
	
// **************************************************************************
// 				MISSION: Find Herb
// **************************************************************************
INSTANCE Info_CorAngar_FindHerb (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Condition;
	information	= Info_CorAngar_FindHerb_Info;
	permanent	= 0;
	important 	= 0;
	description = "Comment va Y'Bérion ?";
};

func INT Info_CorAngar_FindHerb_Condition()
{
	  
	if   ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_AFTER) )
	{
		return	1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Info()
{
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //Comment va Y'Bérion ?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //Il ne peut pas se réveiller tout seul. Et il s'affaiblit de plus en plus. Je sais comment le réveiller, mais j'ai besoin de ton aide.
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //Que veux-tu que je fasse ?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //Apporte-moi des Herbes médicinales du marais. Cinq de la meilleure variété devrait suffire !
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //Vite, s'il te plait!
	AI_StopProcessInfos	(self);
	CorAngar_FindHerb = LOG_RUNNING;
	
	Log_CreateTopic		(CH3_FindHerbs,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_RUNNING);
	B_LogEntry		(CH3_FindHerbs,"Y'Bérion est toujours inconscient. Cor Angar m'a demandé de collecter cinq Herbes médicinales de la plus puissante espèce.");
};

// ---------------------------- FindHerb - WHERE ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_WHERE (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_WHERE_Condition;
	information	= Info_CorAngar_FindHerb_WHERE_Info;
	permanent	= 0;
	important	= 0; 
	description = "Où puis-je trouver ces plantes ?";
};                       

FUNC INT Info_CorAngar_FindHerb_WHERE_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_WHERE_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_WHERE_15_01"); //Où puis-je trouver ces plantes ?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Cherche-les dans le marais derrière le camp. Tu dois y pénétrer très profondément, en évitant de te faire avoir par les Requins des marais.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_03"); //Et maintenant ne perds pas de temps. Dépêche-toi !
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,"Les Herbes requises pour Y'Bérion poussent dans les profondeurs du marais derrière le camp de la Confrérie. Les dangereux requins des marais seront bien là aussi, j'imagine. Je devrais garder les yeux ouverts.");
};

// ---------------------------- FindHerb - LOOK ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_LOOK (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_LOOK_Condition;
	information	= Info_CorAngar_FindHerb_LOOK_Info;
	permanent	= 0;
	important	= 0; 
	description = "Comment reconnaîtrai-je ces Herbes ?";
};                       

FUNC INT Info_CorAngar_FindHerb_LOOK_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_LOOK_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_LOOK_15_01"); //Comment reconnaîtrai-je ces Herbes ?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_02"); //elles ressemblent à une étoile composée de huit feuilles vertes et de huit feuilles orange.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_03"); //En route maintenant.
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,"Les Herbes médicinales ressemblent à une étoile avec quatre feuilles vertes et quatre feuilles oranges.");
};



// ---------------------------- RUNNING ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_Running (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_Running_Condition;
	information	= Info_CorAngar_FindHerb_Running_Info;
	permanent	= 1;
	important	= 0; 
	description = "Je n'ai pas encore trouvé toutes les Herbes.";
};                       

FUNC INT Info_CorAngar_FindHerb_Running_Condition()
{
	if	(CorAngar_FindHerb==LOG_RUNNING)
	&&	(Npc_HasItems(other,ItFo_Plants_Herb_03)<5)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_WHERE)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_LOOK)
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Running_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Running_15_01");//Je n'ai pas encore trouvé toutes les Herbes.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_02");//Peut-être que Fortuno l'herboriste en a en stock.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_03");//Vite. Il m'en faut cinq. Y'Bérion n'a pas plus beaucoup de temps à vivre.
	AI_StopProcessInfos	(self);

	//-------- Fortuno die Kräuter "unterschieben" --------
	if	!Fortuno_HasYBerionHerbs
	{
		var C_NPC	fortuno;
		fortuno = Hlp_GetNpc(Nov_1357_Fortuno);
		CreateInvItems		(fortuno,	ItFo_Plants_Herb_03,	5);	

		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry		(CH3_FindHerbs,"Fortuno, le marchand d'Herbe de la Confrérie, peut avoir de telles Herbes.");
	};
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_CorAngar_FindHerb_Success (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Success_Condition;
	information	= Info_CorAngar_FindHerb_Success_Info;
	permanent	= 0;
	description	= "J'ai les Herbes médicinales pour Y'Bérion.";
};                       

FUNC INT Info_CorAngar_FindHerb_Success_Condition()
{
	if ( Npc_HasItems ( other, ItFo_Plants_Herb_03 ) >= 5 ) && ( CorAngar_FindHerb == LOG_RUNNING )
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_FindHerb_Success_Info()
{	
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_01"); //J'ai les Herbes médicinales pour Y'Bérion.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_02"); //Bien joué. Y'Bérion s'est réveillé un moment pendant que tu étais dehors.
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_03"); //Il a dit quelque chose ?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_04"); //Oui, il a dit que le Dormeur n'est pas ce qu'on pense de lui. Nous ne devons pas encore le réveiller.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_05"); //Tout ce que nous pouvons faire, c'est espérer qu'il n'est pas trop tard pour Y'Bérion.
	Yberion_dead = LOG_RUNNING;

	B_GiveInvItems	(other, self, ItFo_Plants_Herb_03, 5 );
	Npc_RemoveInvItems(self, ItFo_Plants_Herb_03, 5 );
	B_GiveXP  			(XP_FindHerbs);

	CorAngar_FindHerb = LOG_SUCCESS;
	
	B_LogEntry		(CH3_FindHerbs,"J'ai donné assez d'Herbes médicinales à Cor Angar. Maintenant nous ne pouvons plus qu'espérer qu'il ne soit pas trop tard.");
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_SUCCESS);

	//-------- Versuch YBerion zu heilen... --------
	var C_NPC YBerion; 	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	AI_Wait				(self,	1);
	AI_GotoNpc			(self,	YBerion);
	AI_TurnToNpc		(self,	YBerion);
	AI_PlayAni			(self,	"T_PLUNDER");
	AI_WaitTillEnd		(self,	YBerion);
	//YBerion.attribute[ATR_HITPOINTS] = 0;
	//AI_StartState		(YBerion,	ZS_Dead,	0,	"");

	//-------- ...scheitert. YBerion ist tot --------
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Y'BERION EST MORT. Notre chef spirituel nous a quittés !
	AI_TurnToNpc		(self, other);
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //Même ton aide immédiate n'a pas pu empêcher sa mort !
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //Et maintenant, Cor Angar?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //J'ai toujours fait confiance à Y'Bérion. Peu avant sa mort, il avait placé tous ses espoirs dans le plan d'évasion des Magiciens de l'Eau.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Alors nous devrions soutenir le plan des Magiciens de l'Eau.
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //Ils auront besoin de la pierre et de l'almanach deux choses qui sont toujours la propriété de Cor Kalom.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //Où est passé Cor Kalom ?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //Dans un accès de fureur, il s'est mis dans l'idée, lui et un groupe de templiers, de trouver son propre chemin vers le Dormeur. 
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Damnation, comment récupérer la pierre maintenant ?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //Je crois qu'il a laissé le livre ainsi que la pierre focale dans son laboratoire. Et voici la clef du coffre.

	CreateInvItem		(self,			ITKE_PSI_KALOM_01); 
	B_GiveInvItems		(self,	other,	ITKE_PSI_KALOM_01,	1);
};
 
// ------------------------------ TELEPORT ----------------------------------
INSTANCE Info_CorAngar_TELEPORT (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_TELEPORT_Condition;
	information	= Info_CorAngar_TELEPORT_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_CorAngar_TELEPORT_Condition()
{
	if	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success)
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_TELEPORT_Info()
{	
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); //Un instant !
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_02"); //Oui?
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); //Prends cette rune de magie en remerciement de tout ce que tu as fait.
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_04"); //Elle a le pouvoir de te téléporter rapidement et facilement à la cour de notre temple chaque fois que tu en auras besoin.
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); //Merci !

	//-------- Spieler wird losgeschickt --------
	B_Story_SentToNC	();
};
 
