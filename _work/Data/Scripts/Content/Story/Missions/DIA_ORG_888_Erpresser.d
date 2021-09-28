
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
	AI_Output (self, other,"Info_Erpresser_Info_13_01"); //Ehi, ragazzo! Se vuoi passare devi pagare 10 pezzi di metallo. Capito?
	
	Info_ClearChoices( Info_Erpresser );
	Info_AddChoice	 ( Info_Erpresser,"Perché non vieni a prenderti il tuo metallo?", Info_Erpresser_Choice_AufsMaul );
	Info_AddChoice	 ( Info_Erpresser,"Tre pezzi di metallo? Non è molto...", Info_Erpresser_Choice_Zahlen );
};

FUNC VOID Info_Erpresser_Choice_AufsMaul()
{
	AI_Output (other, self,"Info_Erpresser_Choice_AufsMaul_15_01"); //Perché non vieni a prenderti il tuo metallo?
	AI_Output (self, other,"Info_Erpresser_Choice_AufsMaul_13_02"); //Grazie, amico! La giornata è stata proficua.
	
	self.aivar[AIV_HAS_ERPRESSED] = 2;
	
	AI_StopProcessInfos	(self);	
	
	Npc_SetTarget(self,other);
	AI_StartState (self, ZS_Attack, 1,"");
};

FUNC VOID Info_Erpresser_Choice_Zahlen()
{
	if (Npc_HasItems (other,ITMINUGGET) >= 3)
	{
		AI_Output (other, self,"Info_Erpresser_Choice_Zahlen_15_01"); //Ecco i 10 pezzi.
		AI_Output (self, other,"Info_Erpresser_Choice_Zahlen_13_02"); //Una miseria.
	
		self.aivar[AIV_HAS_ERPRESSED] = 1;
	}
	else // SC hat keine 3 Erz
	{
		AI_Output (other, self,"Info_Erpresser_Choice_Zahlen_15_03"); //Uhm... Non ho 10 pezzi di metallo in questo momento...
		AI_Output (self, other,"Info_Erpresser_Choice_Zahlen_13_04"); //Che peccato...
	
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
	AI_Output (self, other,"Info_BereitsErpresst_Info_13_02"); //Hai pagato, quindi puoi passare. Fai in fretta, prima che cambi idea.
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
	AI_Output (self, other,"Info_BereitsAufsMaul_Info_13_02"); //Sparisci, prima che cancelli quell'espressione da idiota dal tuo muso!
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
