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
	description = "Lefty m� poslal. P�inesl jsem ti trochu vody.";
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
	AI_Output(other,self,"Info_Pock_Wasser_15_00"); //Poslal m� Lefty. P�inesl jsem trochu vody.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		AI_Output(self,other,"Info_Pock_Wasser_04_01"); //D�ky, chlap�e! To jsem pot�eboval!
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Pock_Wasser_NOWATER_04_00"); //Tob� u� ale nic nezbylo. Nevad�, hochu - �eknu ostatn�m.
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
	description	= "Zdar! Jsem tady nov�.";
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
	AI_Output (other, self,"DIA_Pock_Hello_15_00"); //Zdar! Jsem tady nov�.
	AI_Output (self, other,"DIA_Pock_Hello_04_01"); //Je p�kn� vid�t zase novou tv��.
	AI_Output (other, self,"DIA_Pock_Hello_15_02"); //Mus� tu b�t p�kn� dlouho, vi�?
	AI_Output (self, other,"DIA_Pock_Hello_04_03"); //Proklat� dlouho, hochu. Byl jsem jeden z prvn�ch.
};

// ************************************************************
// 						Wei�t ne Menge
// ************************************************************

INSTANCE DIA_Pock_KnowMuch (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_KnowMuch_Condition;
	information	= DIA_Pock_KnowMuch_Info;
	permanent	= 0;
	description	= "Tedy toho mus� o tomhle m�st� hodn� v�d�t.";
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
	AI_Output (other, self,"DIA_Pock_KnowMuch_15_00"); //To toho mus� o tomhle m�st� hodn� v�d�t.
	AI_Output (self, other,"DIA_Pock_KnowMuch_04_01"); //Taky �e ano. V�t�inu �asu jsem str�vil venku skl�zen�m r��e.
	AI_Output (self, other,"DIA_Pock_KnowMuch_04_02"); // Jenom d�ky tomu jsem se do�il takov�ho st���. Dost�v�m trochu r��e a mizernou ko�alku. Nen� to moc, ale sta�� to.
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
	description	= "Pro� tady jsi?";
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
	AI_Output (other, self,"DIA_Pock_WhyJail_15_00"); //Pro� tady jsi?
	AI_Output (self, other,"DIA_Pock_WhyJail_04_01"); //Dan�, hochu, dan�. M� chatr� byla pr�zdn� jako m�j �aludek a nemohl jsem platit.
	AI_Output (self, other,"DIA_Pock_WhyJail_04_02"); //A tak jednoho dne p�i�li voj�ci a odvedli m� sem. Ale nen� to tu o nic hor�� ne� tam. Tady aspo� neum�r�m hlady.
	AI_Output (self, other,"DIA_Pock_WhyJail_04_03"); //P�edt�m jsem v�dycky dan� platil - cel� �ivot. Ale pro toho �ub��ho syna s korunou na hlav� to nebylo dost!
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
	description	= "Jinak jsi v po��dku?";
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
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_00"); //Jinak jsi v po��dku?
	AI_Output (self, other,"DIA_Pock_ForgotAll_04_01"); //Je p�kn� vid�t novou tv��.
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_02"); //Po�kej je�t�! My u� jsme spolu mluvili.
	AI_Output (self, other,"DIA_Pock_ForgotAll_04_03"); //Ne! Je�t� jsme neskon�ili. Je�t� nikdy jsem t� tu nevid�l.
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_04"); //Jist�...
};

