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
	description	= "Come va?";
};                       

FUNC INT Info_ORG_829_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_ORG_829_Hello_Info()
{	
	AI_Output (other, self,"Info_ORG_829_Hello_15_00"); //Come vanno le cose?
	AI_Output (self, other,"Info_ORG_829_Hello_06_01"); //Non male, ma non ho nulla da fumare.
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
	description	= "Ho dell'erba di palude. Ne vuoi un po'?";
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
	AI_Output (other, self,"Info_ORG_829_OfferJoint_15_00"); //Ho dell'erba di palude. Ne vuoi un po'?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems (other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems (other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems (other,self,ItMiJoint_3,1);	 };
		
		AI_Output (self, other,"Info_ORG_829_OfferJoint_06_01"); //Certo! Sei uno dei venditori della Setta?
		
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output (self, other,"Info_ORG_829_OfferJoint_No_Joint_06_00"); //Ehi, amico! Non vantarti, d'accordo?
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
	description	= "Sono appena arrivato. Puoi darmi qualche consiglio?";
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
	AI_Output (other, self,"Info_ORG_829_SpecialInfo_15_00"); //Sono appena arrivato. Puoi darmi qualche consiglio?
	AI_Output (self, other,"Info_ORG_829_SpecialInfo_06_01"); //Certo! Una volta nel campo, vai da Gorn. È uno dei mercenari dei maghi, ma è un tipo a posto. Una volta era uno di noi.
	AI_Output (other, self,"Info_ORG_829_SpecialInfo_15_02"); //Cosa intendi con 'noi'?
	AI_Output (self, other,"Info_ORG_829_SpecialInfo_06_03"); //Un fuorilegge, ovviamente. Derubava i baroni delle miniere!
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
	description	= "Cosa devo aspettarmi nel campo?";
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
	AI_Output (other, self,"Info_ORG_829_PERM_15_00"); //Cosa devo aspettarmi nel campo?
	AI_Output (self, other,"Info_ORG_829_PERM_06_01"); //Lo scoprirai da solo.
};
