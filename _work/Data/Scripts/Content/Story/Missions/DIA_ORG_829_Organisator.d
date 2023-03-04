// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_ORG_829_EXIT (C_INFO)
{
	npc			= ORG_829_Organisator;
	nr			= 999;
	condition	= Info_ORG_829_EXIT_Condition;
	information	= Info_ORG_829_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_ORG_829_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_ORG_829_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_ORG_829_Hello (C_INFO)
{
	npc			= ORG_829_Organisator;
	nr			= 1;
	condition	= Info_ORG_829_Hello_Condition;
	information	= Info_ORG_829_Hello_Info;
	permanent	= 0;
	description	= "Comment vont les choses ?";
};                       

FUNC INT Info_ORG_829_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_ORG_829_Hello_Info()
{	
	AI_Output (other, self,"Info_ORG_829_Hello_15_00"); //Comment vont les choses ?
	AI_Output (self, other,"Info_ORG_829_Hello_06_01"); //Pas trop mauvais, mais je n'ai rien à fumer.
};

// ************************************************************
// 						Offer Joint
// ************************************************************
	var int Org_829_GotJoint;
// ************************************************************

INSTANCE Info_ORG_829_OfferJoint (C_INFO)
{
	npc			= ORG_829_Organisator;
	nr			= 1;
	condition	= Info_ORG_829_OfferJoint_Condition;
	information	= Info_ORG_829_OfferJoint_Info;
	permanent	= 0;
	description	= "J'ai de l'Herbe - en veux-tu ?";
};                       

FUNC INT Info_ORG_829_OfferJoint_Condition()
{
	if (Npc_KnowsInfo(hero, Info_ORG_829_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_ORG_829_OfferJoint_Info()
{	
	AI_Output (other, self,"Info_ORG_829_OfferJoint_15_00"); //J'ai de l'Herbe - en veux-tu ?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems (other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems (other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems (other,self,ItMiJoint_3,1);	 };
		
		AI_Output (self, other,"Info_ORG_829_OfferJoint_06_01"); //Sûr ! Es-tu l'un des revendeurs du camp de la Secte ou quoi ?
		
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output (self, other,"Info_ORG_829_OfferJoint_No_Joint_06_00"); //Hé, l'ami ! ne me cherche pas, ok ? Je n'aime pas ça !
	};
};

// ************************************************************
// 							Special Info
// ************************************************************

INSTANCE Info_ORG_829_SpecialInfo (C_INFO)
{
	npc			= ORG_829_Organisator;
	nr			= 1;
	condition	= Info_ORG_829_SpecialInfo_Condition;
	information	= Info_ORG_829_SpecialInfo_Info;
	permanent	= 0;
	description	= "Je viens d'arriver - peux-tu me donner quelques conseils ?";
};                       

FUNC INT Info_ORG_829_SpecialInfo_Condition()
{
	if (Org_829_GotJoint == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_ORG_829_SpecialInfo_Info()
{	
	AI_Output (other, self,"Info_ORG_829_SpecialInfo_15_00"); //Je viens d'arriver - peux-tu me donner quelques conseils ?
	AI_Output (self, other,"Info_ORG_829_SpecialInfo_06_01"); //Sûr ! Quand tu atteins le camp, parle à Gorn. C'est l'un des mercenaires des Mages, mais c'est un gars est bien. Il nous connaît.
	AI_Output (other, self,"Info_ORG_829_SpecialInfo_15_02"); //Qui veux-tu dire par 'nous '?
	AI_Output (self, other,"Info_ORG_829_SpecialInfo_06_03"); //"Et bien, un hors-la-loi, naturellement. Un des ""mets-le-minerai-des-Barons-dans-le-cul"" bandits."
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE Info_ORG_829_PERM (C_INFO)
{
	npc			= ORG_829_Organisator;
	nr			= 1;
	condition	= Info_ORG_829_PERM_Condition;
	information	= Info_ORG_829_PERM_Info;
	permanent	= 1;
	description	= "Sais-tu à quoi je dois m'attendre dans le Camp ?";
};                       

FUNC INT Info_ORG_829_PERM_Condition()
{
	if (Org_829_GotJoint == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_ORG_829_PERM_Info()
{	
	AI_Output (other, self,"Info_ORG_829_PERM_15_00"); //Sais-tu à quoi je dois m'attendre dans le Camp ?
	AI_Output (self, other,"Info_ORG_829_PERM_06_01"); //Entre et découvre.
};
