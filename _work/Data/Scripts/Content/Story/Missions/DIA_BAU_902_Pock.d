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
	description = "Lefty mě poslal. Přinesl jsem ti trochu vody.";
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
	AI_Output(other,self,"Info_Pock_Wasser_15_00"); //Poslal mě Lefty. Přinesl jsem trochu vody.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		AI_Output(self,other,"Info_Pock_Wasser_04_01"); //Díky, chlapče! To jsem potřeboval!
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Pock_Wasser_NOWATER_04_00"); //Tobě už ale nic nezbylo. Nevadí, hochu - řeknu ostatním.
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
	description	= "Zdar! Jsem tady nový.";
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
	AI_Output (other, self,"DIA_Pock_Hello_15_00"); //Zdar! Jsem tady nový.
	AI_Output (self, other,"DIA_Pock_Hello_04_01"); //Je pěkné vidět zase novou tvář.
	AI_Output (other, self,"DIA_Pock_Hello_15_02"); //Musíš tu být pěkně dlouho, viď?
	AI_Output (self, other,"DIA_Pock_Hello_04_03"); //Proklatě dlouho, hochu. Byl jsem jeden z prvních.
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
	description	= "Tedy toho musíš o tomhle místě hodně vědět.";
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
	AI_Output (other, self,"DIA_Pock_KnowMuch_15_00"); //To toho musíš o tomhle místě hodně vědět.
	AI_Output (self, other,"DIA_Pock_KnowMuch_04_01"); //Taky že ano. Většinu času jsem strávil venku sklízením rýže.
	AI_Output (self, other,"DIA_Pock_KnowMuch_04_02"); // Jenom díky tomu jsem se dožil takového stáří. Dostávám trochu rýže a mizernou kořalku. Není to moc, ale stačí to.
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
	description	= "Proč tady jsi?";
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
	AI_Output (other, self,"DIA_Pock_WhyJail_15_00"); //Proč tady jsi?
	AI_Output (self, other,"DIA_Pock_WhyJail_04_01"); //Daně, hochu, daně. Má chatrč byla prázdná jako můj žaludek a nemohl jsem platit.
	AI_Output (self, other,"DIA_Pock_WhyJail_04_02"); //A tak jednoho dne přišli vojáci a odvedli mě sem. Ale není to tu o nic horší než tam. Tady aspoň neumírám hlady.
	AI_Output (self, other,"DIA_Pock_WhyJail_04_03"); //Předtím jsem vždycky daně platil - celý život. Ale pro toho čubčího syna s korunou na hlavě to nebylo dost!
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
	description	= "Jinak jsi v pořádku?";
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
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_00"); //Jinak jsi v pořádku?
	AI_Output (self, other,"DIA_Pock_ForgotAll_04_01"); //Je pěkné vidět novou tvář.
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_02"); //Počkej ještě! My už jsme spolu mluvili.
	AI_Output (self, other,"DIA_Pock_ForgotAll_04_03"); //Ne! Ještě jsme neskončili. Ještě nikdy jsem tě tu neviděl.
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_04"); //Jistě...
};

