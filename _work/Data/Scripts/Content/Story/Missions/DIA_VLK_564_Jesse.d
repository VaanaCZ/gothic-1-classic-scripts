// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Jesse_Exit (C_INFO)
{
	npc			= Vlk_564_Jesse;
	nr			= 999;
	condition	= DIA_Jesse_Exit_Condition;
	information	= DIA_Jesse_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jesse_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Jesse_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Hi
// **************************************************

INSTANCE DIA_Jesse_Hallo (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Hallo_Condition;
	information		= DIA_Jesse_Hallo_Info;
	permanent		= 0;
	description		= "Comment vont les choses ?";
};

FUNC INT DIA_Jesse_Hallo_Condition()
{	
	if (!Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jesse_Hallo_15_00"); //Comment vont les choses ?
	AI_Output (self, other,"DIA_Jesse_Hallo_03_01"); //Nouveau ici, n'est-ce pas ? Il est préférable pour toi de ne pas avoir d'ennuis avec les gardes.
	AI_Output (self, other,"DIA_Jesse_Hallo_03_02"); //Quand ils veulent l'argent pour ta protection, vaut mieux les payer, autrement tu auras la moitié du camp contre toi.
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

INSTANCE DIA_Jesse_Warn (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Warn_Condition;
	information		= DIA_Jesse_Warn_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Jesse_Warn_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Herek_Bully)) && (Herek_ProtectionBully==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Warn_Info()
{
	AI_Output (self, other,"DIA_Jesse_Warn_03_00"); //Hé, toi ! J'ai appris que tu n'as pas voulu payer ta protection à Bloodwyn ?
	AI_Output (other, self,"DIA_Jesse_Warn_15_01"); //Qu'est-ce que tu veux ?
	AI_Output (self, other,"DIA_Jesse_Warn_03_02"); //Attention ! Bloodwyn a payé quelques personnes qui vont te faire la peau.
	AI_Output (self, other,"DIA_Jesse_Warn_03_03"); //J'ai vu comment il a parlé aux gens comme Herek là-bas, et Dieu sait qui il a engagé aussi !
	AI_Output (other, self,"DIA_Jesse_Warn_15_04"); //Ton avertissement au sujet de Herek arrive un peu en tard.
	AI_Output (self, other,"DIA_Jesse_Warn_03_05"); //Il doit avoir parlé aussi à d'autres gens, c'est tout ce que je sais. Alors fait attention.
};

// **************************************************
// 				MISSION Pay 4 Me
// **************************************************
	
// ************************************************************

INSTANCE DIA_Jesse_Mission (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Mission_Condition;
	information		= DIA_Jesse_Mission_Info;
	permanent		= 0;
	description		= "Pourquoi m'as-tu raconté l'histoire au sujet de Bloodwyn ?";
};

FUNC INT DIA_Jesse_Mission_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Jesse_Mission))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Mission_Info()
{
	AI_Output (other, self,"DIA_Jesse_Mission_15_00"); //Pourquoi m'as-tu raconté l'histoire au sujet de Bloodwyn ?
	AI_Output (self, other,"DIA_Jesse_Mission_03_01"); //Parce que des services peuvent être retournés. Et ne me regarde pas comme quelqu'un qui ne comprend pas.
	AI_Output (self, other,"DIA_Jesse_Mission_03_02"); //Et parce que je t'ai rendu un service, je t'ai donné l'occasion de m'en rendre un en échange.
	
	Info_ClearChoices	(DIA_Jesse_Mission );
	Info_AddChoice		(DIA_Jesse_Mission,"N'y pense pas ! Je ne te dois rien !",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice		(DIA_Jesse_Mission,"Qu'as-tu en tête exactement ?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output (other, self,"DIA_Jesse_Mission_ForgetIt_15_00"); //Je ne te dois rien !
	AI_Output (self, other,"DIA_Jesse_Mission_ForgetIt_03_01"); //Ah ! Fous le camp alors !
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
	AI_StopProcessInfos	(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output (other, self,"DIA_Jesse_Mission_What_15_00"); //Qu'as-tu en tête exactement ?
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_01"); //Je n'ai plus aucun minerai, et Bloodwyn m'a déjà tondu.
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_02"); //Maintenant que je t'ai aidé, pourrais-tu lui donner les 10 minerais que je le lui dois, hein ? Et dis-lui que c'est de ma part.
	Npc_SetTrueGuild(self,GIL_NONE); //KEIN Schutzgeld
	
	Info_AddChoice		(DIA_Jesse_Mission,"Moi, payer pour toi ? N'y pense pas !",DIA_Jesse_Mission_NO);
	Info_AddChoice		(DIA_Jesse_Mission,"Je verrai ce que je peux faire.",DIA_Jesse_Mission_YES);
};
//-------------------------------
func void DIA_Jesse_Mission_YES()
{
	AI_Output (other, self,"DIA_Jesse_Mission_YES_15_00"); //Je verrai ce que je peux faire.
	AI_Output (self, other,"DIA_Jesse_Mission_YES_03_01"); //Merci, l'ami ! Tu m'as sauvé ! Dis-moi quand les choses seront arrangées, veux-tu ?
	Jesse_PayForMe = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Jesse_Mission );
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output (other, self,"DIA_Jesse_Mission_NO_15_00"); //Moi, payer pour toi ? N'y pense pas !
	AI_Output (self, other,"DIA_Jesse_Mission_NO_03_01"); //Apparemment j'avais tort à ton sujet. Ne compte plus sur moi à l'avenir.
	//MUSS SO - Mike
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
};


// **************************************************
// 					RUNNING / SUCCESS
// **************************************************

INSTANCE DIA_Jesse_MisSuccess (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_MisSuccess_Condition;
	information		= DIA_Jesse_MisSuccess_Info;
	permanent		= 0;
	description		= "J'ai payé Bloodwyn !";
};

FUNC INT DIA_Jesse_MisSuccess_Condition()
{	
	if (Jesse_PayForMe == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_MisSuccess_Info()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_15_00"); //J'ai payé Bloodwyn !
	AI_Output (self, other,"DIA_Jesse_MisSuccess_03_01"); //Ouais ? Magnifique ! Alors nous sommes quittes maintenant.
	Npc_SetTrueGuild(self,GIL_VLK); //Schutzgeld GEZAHLT
	
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
	Info_AddChoice		(DIA_Jesse_MisSuccess,"Quooooi ? J'ai dépensé 10 minerais pour un indice que je connaissais ?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice		(DIA_Jesse_MisSuccess,"Ouais. Tu me grattes le dos, j'te gratte le tien.",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //Quooooi ? J'ai dépensé 10 minerais pour un indice que je connaissais ?
	AI_Output (self, other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Apparemment.
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Ok_15_00"); //Ouais. Tu me grattes le dos, j'te gratte le tien.
};

//a) <Herek tot>
//b) Herek wird versuchen, 


/* */
