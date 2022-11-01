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
	description	= "Co słychać?";
};                       

FUNC INT Info_ORG_829_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_ORG_829_Hello_Info()
{	
	AI_Output (other, self,"Info_ORG_829_Hello_15_00"); //Co słychać?
	AI_Output (self, other,"Info_ORG_829_Hello_06_01"); //Nie najgorzej, ale nie mam już nic do palenia.
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
	description	= "Mam przy sobie trochę ziela - chcesz?";
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
	AI_Output (other, self,"Info_ORG_829_OfferJoint_15_00"); //Mam przy sobie trochę ziela - chcesz?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems (other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems (other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems (other,self,ItMiJoint_3,1);	 };
		
		AI_Output (self, other,"Info_ORG_829_OfferJoint_06_01"); //Jasne! A ty co - handlarz z obozu sekty, czy jak?
		
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output (self, other,"Info_ORG_829_OfferJoint_No_Joint_06_00"); //Hej, koleś! Nie próbuj mnie wykiwać! Bardzo tego nie lubię!
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
	description	= "Jestem tu nowy. Masz może dla mnie jakieś wskazówki?";
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
	AI_Output (other, self,"Info_ORG_829_SpecialInfo_15_00"); //Jestem tu nowy. Masz może dla mnie jakieś wskazówki?
	AI_Output (self, other,"Info_ORG_829_SpecialInfo_06_01"); //Jasne! Po dotarciu do Obozu idź do Gorna. Wprawdzie to jeden z najemników w służbie Magów, ale jest w porządku. Kiedyś był jednym z nas.
	AI_Output (other, self,"Info_ORG_829_SpecialInfo_15_02"); //Co masz na myśli mówiąc "jednym z nas"?
	AI_Output (self, other,"Info_ORG_829_SpecialInfo_06_03"); //No, Szkodnikiem, rzecz jasna. Postrachem Magnatów, ot co!
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
	description	= "Czego mogę się spodziewać w Obozie?";
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
	AI_Output (other, self,"Info_ORG_829_PERM_15_00"); //Czego mogę się spodziewać w Obozie?
	AI_Output (self, other,"Info_ORG_829_PERM_06_01"); //Najlepiej idź i sam się przekonaj.
};
