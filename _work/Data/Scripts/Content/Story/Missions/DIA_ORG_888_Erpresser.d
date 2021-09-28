
// *********************** ERPRESSER ***********************

INSTANCE Info_Erpresser (C_INFO)
{
	npc			= Org_888_Erpresser;
	nr			= 1;
	condition	= Info_Erpresser_Condition;
	information	= Info_Erpresser_Info;
	permanent	= 1;
	important	= 1;
};                       

FUNC INT Info_Erpresser_Condition()
{
	if ((Npc_GetAttitude(self,other)!=ATT_FRIENDLY) 
	&& 	(self.aivar[AIV_HAS_ERPRESSED]==FALSE) 
	&& 	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)	)
	{
		return 1;
	};
};

FUNC VOID Info_Erpresser_Info()
{
	AI_Output (self, other,"Info_Erpresser_Info_13_01"); //Hej, ch³opcze! Jeœli chcesz wejœæ do œrodka, bêdziesz musia³ zap³aciæ 10 bry³ek, kapujesz?
	
	Info_ClearChoices( Info_Erpresser );
	Info_AddChoice	 ( Info_Erpresser,"To dlaczego nie przyjdziesz tutaj i ich sobie nie weŸmiesz!", Info_Erpresser_Choice_AufsMaul );
	Info_AddChoice	 ( Info_Erpresser,"Trzy bry³ki? To niewiele. Proszê bardzo...", Info_Erpresser_Choice_Zahlen );
};

FUNC VOID Info_Erpresser_Choice_AufsMaul()
{
	AI_Output (other, self,"Info_Erpresser_Choice_AufsMaul_15_01"); //To dlaczego nie przyjdziesz tutaj i ich sobie nie weŸmiesz!
	AI_Output (self, other,"Info_Erpresser_Choice_AufsMaul_13_02"); //Dziêki, stary. W³aœnie zaczyna³em siê nudziæ.
	
	self.aivar[AIV_HAS_ERPRESSED] = 2;
	
	AI_StopProcessInfos	(self);	
	
	Npc_SetTarget(self,other);
	AI_StartState (self, ZS_Attack, 1,"");
};

FUNC VOID Info_Erpresser_Choice_Zahlen()
{
	if (Npc_HasItems (other,ITMINUGGET) >= 3)
	{
		AI_Output (other, self,"Info_Erpresser_Choice_Zahlen_15_01"); //Proszê, oto 10 bry³ek.
		AI_Output (self, other,"Info_Erpresser_Choice_Zahlen_13_02"); //Jaka szkoda.
	
		self.aivar[AIV_HAS_ERPRESSED] = 1;
	}
	else // SC hat keine 3 Erz
	{
		AI_Output (other, self,"Info_Erpresser_Choice_Zahlen_15_03"); //Ummm... Nie mam przy sobie 10 bry³ek.
		AI_Output (self, other,"Info_Erpresser_Choice_Zahlen_13_04"); //Wielka szkoda...
	
		self.aivar[AIV_HAS_ERPRESSED] = 2;
	
		Npc_SetTarget(self,other);
		AI_StartState (self, ZS_Attack, 1,"");
	};
	
	AI_StopProcessInfos	(self);
};

// ****************** für HAS_ERPRESSED == 1 (gezahlt) *********************

INSTANCE Info_BereitsErpresst (C_INFO)
{
	npc			= Org_888_Erpresser;
	nr			= 1;
	condition	= Info_BereitsErpresst_Condition;
	information	= Info_BereitsErpresst_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_BereitsErpresst_Condition()
{
	if ( (self.aivar[AIV_HAS_ERPRESSED]==1) && (Npc_IsInState(self,ZS_Talk)) )
	{
		return 1;
	};
};

FUNC VOID Info_BereitsErpresst_Info()
{
	AI_Output (self, other,"Info_BereitsErpresst_Info_13_02"); //Zap³aci³eœ - mo¿esz przejœæ. W³aŸ, zanim siê rozmyœlê.
};

// ****************** für HAS_ERPRESSED == 2 (Aufs Maul) *********************

INSTANCE Info_BereitsAufsMaul (C_INFO)
{
	npc			= Org_888_Erpresser;
	nr			= 1;
	condition	= Info_BereitsAufsMaul_Condition;
	information	= Info_BereitsAufsMaul_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT Info_BereitsAufsMaul_Condition()
{
	if ((self.aivar[AIV_HAS_ERPRESSED]==2)
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE) 
	&&  (Npc_IsInState(self,ZS_Talk)) )
	{
		return 1;
	};
};

FUNC VOID Info_BereitsAufsMaul_Info()
{
	AI_Output (self, other,"Info_BereitsAufsMaul_Info_13_02"); //Spadaj zanim zetrê ten g³upi uœmiech z twojej gêby!
};

// ************************ EXIT **************************

INSTANCE Info_Exit (C_INFO)
{
	npc			= Org_888_Erpresser;
	nr			= 999;
	condition	= Info_Exit_Condition;
	information	= Info_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Exit_Condition()
{
	return 1;
};

FUNC VOID Info_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
