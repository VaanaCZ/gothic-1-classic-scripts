// ************************************************************
// 			  				   EXIT 
// ************************************************************
	var int Pock_ForgetAll;
// ************************************************************

INSTANCE DIA_Pock_EXIT (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 999;
	condition	= DIA_Pock_EXIT_Condition;
	information	= DIA_Pock_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Pock_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Pock_EXIT_Info()
{	
	Pock_ForgetAll = TRUE;
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Pock_Wasser(C_INFO) // E1
{
	npc			= Bau_902_Pock;
	nr			= 800;
	condition	= Info_Pock_Wasser_Condition;
	information	= Info_Pock_Wasser_Info;
	permanent	= 1;
	description = "Lefty m'envoie. Je t'apporte de l'eau.";
};                       

FUNC INT Info_Pock_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Pock_Wasser_Info()
{
	AI_Output(other,self,"Info_Pock_Wasser_15_00"); //Lefty m'envoie. Je t'apporte de l'eau.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		AI_Output(self,other,"Info_Pock_Wasser_04_01"); //Merci, mon garçon ! J'en avais besoin !
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Pock_Wasser_NOWATER_04_00"); //Mais tu n'es pas parti. Ça ne fait rien, mon garçon. Je demanderai aux autres.
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Pock_Hello (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_Hello_Condition;
	information	= DIA_Pock_Hello_Info;
	permanent	= 0;
	description	= "Salut ! Je suis nouveau ici.";
};                       

FUNC INT DIA_Pock_Hello_Condition()
{
	if (Pock_ForgetAll == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_Hello_Info()
{	
	AI_Output (other, self,"DIA_Pock_Hello_15_00"); //Salut ! Je suis nouveau ici.
	AI_Output (self, other,"DIA_Pock_Hello_04_01"); //C'est bon de voir un visage reposé.
	AI_Output (other, self,"DIA_Pock_Hello_15_02"); //Hou... tu dois être ici depuis longtemps, non?
	AI_Output (self, other,"DIA_Pock_Hello_04_03"); //Sacrée droite, mon garçon. J'étais dans les premiers.
};

// ************************************************************
// 						Weißt ne Menge
// ************************************************************

INSTANCE DIA_Pock_KnowMuch (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_KnowMuch_Condition;
	information	= DIA_Pock_KnowMuch_Info;
	permanent	= 0;
	description	= "Dans ce cas tu dois savoir beaucoup de chose sur cet endroit ?";
};                       

FUNC INT DIA_Pock_KnowMuch_Condition()
{
	if ( (Pock_ForgetAll==FALSE) && Npc_KnowsInfo(hero,DIA_Pock_Hello) )
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_KnowMuch_Info()
{	
	AI_Output (other, self,"DIA_Pock_KnowMuch_15_00"); //Dans ce cas tu dois savoir beaucoup de chose sur cet endroit ?
	AI_Output (self, other,"DIA_Pock_KnowMuch_04_01"); //C'est comme ça. Je passe une grande partie de mon temps dehors à ramasser du riz.
	AI_Output (self, other,"DIA_Pock_KnowMuch_04_02"); //C'est ce qui m'use autant. Nous avons du riz et de l'alcool de riz. Pas beaucoup, mais on s'en contente.
};

// ************************************************************
// 							Warum hier?
// ************************************************************

INSTANCE DIA_Pock_WhyJail (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 2;
	condition	= DIA_Pock_WhyJail_Condition;
	information	= DIA_Pock_WhyJail_Info;
	permanent	= 0;
	description	= "Pourquoi es-tu ici ?";
};                       

FUNC INT DIA_Pock_WhyJail_Condition()
{
	if ( (Pock_ForgetAll==FALSE) && Npc_KnowsInfo(hero,DIA_Pock_Hello) )
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_WhyJail_Info()
{	
	AI_Output (other, self,"DIA_Pock_WhyJail_15_00"); //Pourquoi es-tu ici ?
	AI_Output (self, other,"DIA_Pock_WhyJail_04_01"); //Les impôts, mon garçon, les impôts. Mon entrepôt était aussi vide que mon estomac, et je ne pouvais pas payer.
	AI_Output (self, other,"DIA_Pock_WhyJail_04_02"); //Évidement, un jour les soldats m'ont enfermé ici. Mais c'est aussi bien qu'au dehors. Au moins ici je ne mourrais pas de faim.
	AI_Output (self, other,"DIA_Pock_WhyJail_04_03"); //J'avais toujours payé mes impôts avant - toute ma vie. Mais ce n'était pas assez bon pour ce fils de chienne qui porte la couronne !
};

// ************************************************************
// 						PERM (Forget)
// ************************************************************

INSTANCE DIA_Pock_ForgotAll (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_ForgotAll_Condition;
	information	= DIA_Pock_ForgotAll_Info;
	permanent	= 1;
	description	= "Tout va bien ?";
};                       

FUNC INT DIA_Pock_ForgotAll_Condition()
{
	if (Pock_ForgetAll == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_ForgotAll_Info()
{	
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_00"); //Tout va bien ?
	AI_Output (self, other,"DIA_Pock_ForgotAll_04_01"); //C'est bon de voir un nouveau visage
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_02"); //Attends! On parlera plus tard.
	AI_Output (self, other,"DIA_Pock_ForgotAll_04_03"); //Non ! Non, c'est impossible. Je ne t'ai jamais vu de ma vie.
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_04"); //Bien sûr...
};

