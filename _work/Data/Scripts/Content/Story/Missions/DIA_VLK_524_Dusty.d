// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dusty_Exit (C_INFO)
{
	npc			= Vlk_524_Dusty;
	nr			= 999;
	condition	= DIA_Dusty_Exit_Condition;
	information	= DIA_Dusty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dusty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dusty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Was machst du?
// **************************************************

INSTANCE DIA_Dusty_Hello (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_Hello_Condition;
	information		= DIA_Dusty_Hello_Info;
	permanent		= 0;
	description		= "Hé ! Je suis nouveau ici - comment vont les choses ?";
};

FUNC INT DIA_Dusty_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Dusty_Hello_Info()
{
	AI_Output (other, self,"DIA_Dusty_Hello_15_00"); //Hé ! Je suis nouveau ici - comment vont les choses ?
	AI_Output (self, other,"DIA_Dusty_Hello_03_01"); //Va-t-en ! J'ai traîné mes fesses loin des mines les deux dernières semaines. Et pour quoi ?
	AI_Output (self, other,"DIA_Dusty_Hello_03_02"); //Quelques morceaux de minerai, c'est tout ce que j'ai trouvé. J'ai dû dépenser la plus grande partie pour manger.
	AI_Output (self, other,"DIA_Dusty_Hello_03_03"); //J'ai parlé à Baal Parvez en bas. Il m'a dit des choses intéressantes au sujet du camp de la Secte.
	AI_Output (self, other,"DIA_Dusty_Hello_03_04"); //Je pense que je ferais mieux d'aller là-bas au lieu de trimer loin de Gomez.
};

// **************************************************
// 				Warum gehst du nicht?
// **************************************************

INSTANCE DIA_Dusty_WhyNotLeave (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_WhyNotLeave_Condition;
	information		= DIA_Dusty_WhyNotLeave_Info;
	permanent		= 0;
	description		= "Tu n'aimes pas cet endroit ? Pourquoi ne pars-tu pas ?";
};

FUNC INT DIA_Dusty_WhyNotLeave_Condition()
{	
	if	 Npc_KnowsInfo(hero,DIA_Dusty_Hello)
	&&	!Npc_KnowsInfo(hero,DIA_Dusty_MetMelvin)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_WhyNotLeave_Info()
{
	AI_Output (other, self,"DIA_Dusty_WhyNotLeave_15_00"); //Tu n'aimes pas cet endroit ? Pourquoi ne pars-tu pas ?
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_01"); //Parce que je ne suis pas tout à fait sûr de ce qui va se passer là-bas. J'avais un ami ici - il s'appelait Melvin. Il est parti en direction du camp de la Secte il y a une semaine.
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_02"); //Mais depuis, plus de nouvelles. Et aussi longtemps que je ne recevrai pas de message, je resterai ici !

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Dusty, un mineur du Vieux Camp , n'est plus satisfait de la vie ici. Il pense à joindre la Confrérie dans le marais.");
};

// **************************************************
// 				Mit Melvin geredet
// **************************************************

INSTANCE DIA_Dusty_MetMelvin (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_MetMelvin_Condition;
	information		= DIA_Dusty_MetMelvin_Info;
	permanent		= 0;
	description		= "J'étais dans le camp de la Secte et j'ai rencontré Melvin.";
};

FUNC INT DIA_Dusty_MetMelvin_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Melvin_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_MetMelvin_Info()
{
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_00"); //J'étais dans le camp de la Secte et j'ai rencontré Melvin.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_01"); //Et ? Qu'a-t-il dit ?
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_02"); //Apparemment il préfère ça que d'être harcelé par les gardes.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_03"); //Hé l'ami ! Il s'amuse tout seul ? Je dois aller là-bas. Mais je ne sortirai jamais du camp.
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_04"); //Vraiment ? Pourquoi pas ?
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_05"); //Les gardes ont découvert que je voulais partir, je pense que j'ai trop parlé.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_06"); //J'ai besoin d'au moins 10 minerais pour soudoyer les gardes.
};

// **************************************************
// 				Ich gebe dir 100 Erz
// **************************************************

INSTANCE DIA_Dusty_Offer100Ore (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_Offer100Ore_Condition;
	information		= DIA_Dusty_Offer100Ore_Info;
	permanent		= 0;
	description		= "Si je te donne 100 minerais pour les gardes ?";
};

FUNC INT DIA_Dusty_Offer100Ore_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_Dusty_MetMelvin))
	&&	(BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_Offer100Ore_Info()
{
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_00"); //Si je te donne 100 minerais pour les gardes ?
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_01"); //Tu ferais ça ? Pourquoi ?
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_02"); //Bien, laisse-moi te dire que tu n'es pas le seul qui préférerais traîner dans le camp de la Secte.
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_03"); //Tu veux venir avec moi ?
};

// **************************************************
// 				Ich gehe mit dir
// **************************************************

INSTANCE DIA_Dusty_IWouldGo (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_IWouldGo_Condition;
	information		= DIA_Dusty_IWouldGo_Info;
	permanent		= 0;
	description		= "J'irai avec toi au camp de la Secte.";
};

FUNC INT DIA_Dusty_IWouldGo_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Dusty_Offer100Ore))
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_IWouldGo_Info()
{
	AI_Output	(other, self,"DIA_Dusty_IWouldGo_15_00"); //J'irai avec toi au camp de la Secte.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_01"); //Génial, l'ami ! Je suis prêt. Nous pouvons y aller quand tu voudras.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_02"); //Mais n'oublie pas - nous avons besoin de 100 minerais pour les gardes.

	B_LogEntry	(CH1_RecruitDusty,"J'ai réussi à convaincre Dusty le mineur à rejoindre la Confrérie dans le Camp Marécageux. Mais je devrai suborner les gardes avec quelques minerais. Il serai mieux que je le mène directement à Baal Tondral.");
	B_GiveXP	(XP_DustyJoined);
};

// **************************************************
// 				Lass uns gehen
// **************************************************
var int Dusty_LetsGo;
// **************************************************

INSTANCE DIA_Dusty_LetsGo (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_LetsGo_Condition;
	information		= DIA_Dusty_LetsGo_Info;
	permanent		= 1;
	description		= "Je suis prêt - allons-y !";
};

FUNC INT DIA_Dusty_LetsGo_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_Dusty_IWouldGo))
	&&	(Npc_GetDistToWP(hero, "OCR_MAINGATE_INSIDE") > 1500)
	&&	(Npc_GetDistToWP(hero, "OCR_NORTHGATE_RAMP_ATOP") > 1500)
	&&	(BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_LetsGo_Info()
{
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_00"); //Je suis prêt - allons-y !
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_01"); //D'accord - passons par la porte sud - la porte nord n'est pas utilisable, il est impossible d'y soudoyer les gardes.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_02"); //Et peut-être devrais-tu t'occuper du minerai - je ne suis pas très bon pour ce genre de chose.
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_03"); //D'accord - allons-y !

	if	!Dusty_LetsGo
	{
		B_LogEntry(CH1_RecruitDusty,"Dusty m'a averti de ne pas utiliser la porte principale au nord. Il semble être plus facile de suborner les gardes à la porte au sud.");
		Dusty_LetsGo = TRUE;
	};
	
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"FOLLOW");
	
	AI_StopProcessInfos	(self);
	
};

