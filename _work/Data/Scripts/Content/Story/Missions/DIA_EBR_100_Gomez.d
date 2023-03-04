// **************************************
//					EXIT 
// **************************************

instance DIA_Gomez_Exit (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 999;
	condition	= DIA_Gomez_Exit_Condition;
	information	= DIA_Gomez_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Gomez_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Gomez_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//		Nicht mit Raven geredet
// **************************************

instance DIA_Gomez_Fault (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_Fault_Condition;
	information	= DIA_Gomez_Fault_Info;
	permanent	= 0;
	description	= "Je venais offrir mes services.";
};                       

FUNC int DIA_Gomez_Fault_Condition()
{
	if (!Npc_KnowsInfo(hero,DIA_Raven_There))
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_Fault_Info()
{
	AI_Output (other, self,"DIA_Gomez_Fault_15_00"); //Je venais offrir mes services.
	AI_Output (self, other,"DIA_Gomez_Fault_11_01"); //Tu viens ici en pensant que tu puisses m'interesser ? GARDES !
	
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};

// **************************************
//				Hallo
// **************************************
	var int gomez_kontakte;
// **************************************
	

instance DIA_Gomez_Hello (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_Hello_Condition;
	information	= DIA_Gomez_Hello_Info;
	permanent	= 1;
	description	= "Je suis venu pour offrir mes services.";
};                       

FUNC int DIA_Gomez_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_There) && (gomez_kontakte<4) )
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_Hello_Info()
{
	AI_Output (other, self,"DIA_Gomez_Hello_15_00"); //Je suis venu pour offrir mes services.
	AI_Output (self, other,"DIA_Gomez_Hello_11_01"); //Qui te dit que je suis intéressé par tes services ?
	
	Info_ClearChoices	(DIA_Gomez_Hello);																			
	Info_AddChoice		(DIA_Gomez_Hello,"J'espère ne pas avoir à t'arracher la tête pour montrer ce dont je suis capable.",DIA_Gomez_Hello_KopfAb);
	Info_AddChoice		(DIA_Gomez_Hello,"Il n'y a seulement que des idiots par ici.",DIA_Gomez_Hello_Spinner);
	Info_AddChoice		(DIA_Gomez_Hello,"Je me suis pas mal baladé et j'ai des contacts dans tous les camps.",DIA_Gomez_Hello_Kontakte);
	Info_AddChoice		(DIA_Gomez_Hello,"J'ai accompli l'épreuvedu destin.",DIA_Gomez_Hello_ThorusSays);
	
};

func void DIA_Gomez_Hello_ThorusSays()
{
	AI_Output (other, self,"DIA_Gomez_Hello_ThorusSays_15_00"); //J'ai réussi l'épreuve de la foi et Thorus me dit qu'il m'estime
	AI_Output (self, other,"DIA_Gomez_Hello_ThorusSays_11_01"); //Tu ne serais pas arrivé vivant ici autrement. J'espère que tu peux faire mieux.
};

func void DIA_Gomez_Hello_Kontakte()
{
	gomez_kontakte = 0;
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_15_00"); //J'ai beaucoup voyagé autour de la colonie et j'ai des contacts dans tous les camps.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_11_01"); //Maintenant ça pourrait s'avérer utile. Avec qui es-tu en contact ?
	Info_ClearChoices	(DIA_Gomez_Hello);
	Info_AddChoice		(DIA_Gomez_Hello,"C'était les plus importants.",DIA_Gomez_Hello_Kontakte_ThatsAll);
	Info_AddChoice		(DIA_Gomez_Hello,"Un couple de receleur dans le Nouveau Camp.",DIA_Gomez_Hello_Kontakte_NLHehler);
	Info_AddChoice		(DIA_Gomez_Hello,"Lares.",DIA_Gomez_Hello_Kontakte_Lares);
	//Info_AddChoice		(DIA_Gomez_Hello,"Zu Lee."	,DIA_Gomez_Hello_Kontakte_Lee);
	Info_AddChoice		(DIA_Gomez_Hello,"Quelques Sages dans le camp de la Confrérie.",DIA_Gomez_Hello_Kontakte_Baals);
	Info_AddChoice		(DIA_Gomez_Hello,"Cor Kalom.",DIA_Gomez_Hello_Kontakte_Kalom);
	
	if (gomez_kontakte < 3)
	{
	Info_AddChoice		(DIA_Gomez_Hello,"Y'Bérion.",DIA_Gomez_Hello_Kontakte_YBerion);
	};
};

func void DIA_Gomez_Hello_Spinner()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Spinner_15_00"); //Il y a seulement des imbéciles aux alentours, pour surveiller les nouveaux venus et les obliger à faire le travail à leur place au lieu de les laisser travailler pour eux-mêmes.
	AI_Output (self, other,"DIA_Gomez_Hello_Spinner_11_01"); //C'est peut-être vrai, à quelques exceptions près. Cependant, ce n'est pas une raison pour louer un autre imbécile.
};

func void DIA_Gomez_Hello_KopfAb()
{
	AI_Output (other, self,"DIA_Gomez_Hello_KopfAb_15_00"); //J'espère ne pas être obligé de te couper la tête pour montrer que je sais me servir d'une arme!
	AI_Output (self, other,"DIA_Gomez_Hello_KopfAb_11_01"); //Il y a une petite frontière entre le courage et la stupidité.
	
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_ATTACK,1,"");
};

//----------------KONTAKTE--------------------


func void DIA_Gomez_Hello_Kontakte_YBerion()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_YBerion_15_00"); //Y'Bérion.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_01"); //Y'Bérion ne perd pas son temps avec des types comme toi
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_02"); //Tes mensonges me montrent que tu me considères comme un idiot
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_03"); //Je suis déçu de voir que tu penses que je suis STUPIDE
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_04"); //Je déteste être déçu
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};

func void DIA_Gomez_Hello_Kontakte_Kalom()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Kalom_15_00"); //Cor Kalom.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Kalom_11_01"); //Et?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_Baals()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Baals_15_00"); //Quelques Sages dans le camp de la Confrérie.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Baals_11_01"); //Et?
	gomez_kontakte = gomez_kontakte + 1;
};

/*
func void DIA_Gomez_Hello_Kontakte_Lee()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Lee_15_00"); //Zu Lee.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Lee_11_01"); //Lee ist also ein guter Freund von dir, ja?
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Lee_11_02"); //Dann sieht die Sache natürlich ANDERS AUS (zornig am ENDE)

	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};
*/
func void DIA_Gomez_Hello_Kontakte_Lares()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Lares_15_00"); //Lares.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Lares_11_01"); //Et?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_NLHehler()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_NLHehler_15_00"); //Un couple des barrières dans le Nouveau camp.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_NLHehler_11_01"); //Et?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_ThatsAll()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_ThatsAll_15_00"); //C'était les plus importants.
	if (gomez_kontakte >= 4)	
	{
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_01"); //Pas mal… pour un novice....
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_02"); //Tu auras ta chance.
		Info_ClearChoices	(DIA_Gomez_Hello);
	}
	else
	{
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_INSUFF_11_00"); //Tu t'attendais à ce que CELA m'impressionne ? Nous avons des mineurs avec de meilleures relations !
		Info_ClearChoices	(DIA_Gomez_Hello);
	};
};

// **************************************
//				Bin ich dabei
// **************************************

instance DIA_Gomez_Dabei (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_Dabei_Condition;
	information	= DIA_Gomez_Dabei_Info;
	permanent	= 0;
	description	= "Ca signifie que j'en suis ?";
};                       

FUNC int DIA_Gomez_Dabei_Condition()
{
	if	(gomez_kontakte >= 3)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_Dabei_Info()
{
	AI_Output (other, self,"DIA_Gomez_Dabei_15_00"); //Ca signifie que j'en suis ?
	AI_Output (self, other,"DIA_Gomez_Dabei_11_01"); //Tu l'avais parié. Tu es l'un des leurs maintenant, gamin.
	AI_Output (self, other,"DIA_Gomez_Dabei_11_02"); //Raven te comblera.
	
	Npc_SetTrueGuild (hero,GIL_STT );
	hero.guild = GIL_STT;
	B_GiveXP (XP_BecomeShadow);
	B_LogEntry			(CH1_JoinOC,"Depuis aujourd'hui, je travaille pour Gomez et le Vieux Camp. Raven me dira tout le reste !");
	Log_SetTopicStatus	(CH1_JoinOC,	LOG_SUCCESS);

	// Canceln der anderen Aufnahmen
	Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
	B_LogEntry			(CH1_JoinNC,"Du fait que j'appartiens maintenant au clan Gomez, je ne peux pas être admis dans le gang de Lares !");
	
	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
	B_LogEntry			(CH1_JoinPsi,"A partir de maintenant le Vieux Camp est ma nouvelle maison. La Confrérie du Dormeur devra se passer de moi.");
	
	AI_StopProcessInfos	(self);
};

// **************************************
//				Nur so (PERM)
// **************************************

instance DIA_Gomez_NurSo (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_NurSo_Condition;
	information	= DIA_Gomez_NurSo_Info;
	permanent	= 1;
	description	= "Je pensais juste devoir le rapporter.";
};                       

FUNC int DIA_Gomez_NurSo_Condition()
{
	if (Raven_SpySect==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_NurSo_Info()
{
	AI_Output (other, self,"DIA_Gomez_NurSo_15_00"); //Je pensais juste devoir le rapporter.
	AI_Output (self, other,"DIA_Gomez_NurSo_11_00"); //Alors va voir Raven. Et ne me parle plus à moins d'être informé !
};


////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////////////////   	Kapitel 5        ///////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////


// ***********************************************
// 				Wartet auf den SC
// ***********************************************

instance  DIA_EBR_100_Gomez_Wait4SC (C_INFO)
{
	npc				= EBR_100_Gomez;
	condition		= DIA_EBR_100_Gomez_Wait4SC_Condition;
	information		= DIA_EBR_100_Gomez_Wait4SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_EBR_100_Gomez_Wait4SC_Condition()
{	
	if	ExploreSunkenTower
	{
		return TRUE;
	};
};
FUNC void  DIA_EBR_100_Gomez_Wait4SC_Info()
{
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_01"); //Comment es-tu venu ici ?
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_02"); //Attends! Es-tu l'un de ceux qui a combattu nos hommes dans la mine Libre?
	AI_Output (other, self,"DIA_EBR_100_Gomez_Wait4SC_15_03"); //Vos hommes n'avaient pas le droit de l'envahir. J'ai juste contré leur attaque de mégalomanes !
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_04"); //En me parlant, Gomez, c'est se montrer courageux. Mais c'était stupide de te conduire de cette façon ici.
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_05"); //Je ferai attention de ne plus jamais être sur ton chemin
	
	AI_StopProcessInfos	( self );

	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	( self, GIL_EBR );	
};
