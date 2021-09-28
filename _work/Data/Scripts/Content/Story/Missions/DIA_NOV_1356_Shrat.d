// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Shrat_Exit (C_INFO)
{
	npc			=  Nov_1356_Shrat;
	nr			=  999;
	condition	=  DIA_Shrat_Exit_Condition;
	information	=  DIA_Shrat_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Shrat_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Shrat_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance  DIA_Shrat_WhyHere (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_WhyHere_Condition;
	information	= DIA_Shrat_WhyHere_Info;
	permanent	= 0;
	description	= "Cosa stai facendo?";
};                       

FUNC int  DIA_Shrat_WhyHere_Condition()
{
	return 1;
};

FUNC VOID  DIA_Shrat_WhyHere_Info()
{
	AI_Output (other, self,"DIA_Shrat_WhyHere_15_00"); //Cosa stai facendo?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_01"); //TI ho forse accordato il permesso di rivolgermi la parola?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_02"); //Scherzavo! Quei maledetti pazzi mi stanno facendo ammattire, ecco perché sono qui!
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_03"); //Non rivolgermi la parola!', 'Prega il Dormiente, affinché ti perdoni!', 'La tua missione è di eccezionale importanza!'
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_04"); //Basta e avanza per fare impazzire chiunque! Non mi meraviglia che qui siano tutti matti.
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_05"); //Sono Shrat, novizio di primo livello... per sempre!
};

// **************************************************
//				Hilfe bei Join PSI ??
// **************************************************

instance DIA_Shrat_JoinPSI (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_JoinPSI_Condition;
	information	= DIA_Shrat_JoinPSI_Info;
	permanent	= 0;
	description	= "Voglio unirmi alla Fratellanza. Puoi aiutarmi?";
};                       

FUNC int DIA_Shrat_JoinPSI_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Shrat_WhyHere))
	{
		return 1;
	};
};

FUNC void DIA_Shrat_JoinPSI_Info()
{
	AI_Output (other, self,"DIA_Shrat_JoinPSI_15_00"); //Voglio unirmi alla Fratellanza. Puoi aiutarmi?
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_01"); //Vuoi venire a vivere in questo posto? Io non penso ad altro che al modo di andarmene!
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_02"); //Potremmo girare per la colonia, alleggerendo qualche babbeo e accumulando metallo. Cosa ne dici?
};

// **************************************************
//					Komm mit
// **************************************************

instance DIA_Shrat_ComeWithMe (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_ComeWithMe_Condition;
	information	= DIA_Shrat_ComeWithMe_Info;
	permanent	= 1;
	description	= "Andiamo! Vieni con me!";
};                       

FUNC int DIA_Shrat_ComeWithMe_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Shrat_JoinPSI) && (self.aivar[AIV_PARTYMEMBER]==FALSE) )
	{
		return 1;
	};
};

FUNC void DIA_Shrat_ComeWithMe_Info()
{
	AI_Output (other, self,"DIA_Shrat_ComeWithMe_15_00"); //Andiamo! Vieni con me!
	AI_Output (self, other,"DIA_Shrat_ComeWithMe_02_01"); //Ecco cosa volevo sentire! Andiamo!

	Npc_ExchangeRoutine (self, "FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

// **************************************************
//					Verlassen
// **************************************************

instance DIA_Shrat_LeaveMe (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 700;
	condition	= DIA_Shrat_LeaveMe_Condition;
	information	= DIA_Shrat_LeaveMe_Info;
	permanent	= 1;
	description	= "Le nostre strade si separano qui: continuerò da solo.";
};                       

FUNC int DIA_Shrat_LeaveMe_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER]==TRUE)
	{
		return 1;
	};
};

FUNC void DIA_Shrat_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Shrat_LeaveMe_15_00"); //Le nostre strade si separano qui: continuerò da solo.
	AI_Output (self, other,"DIA_Shrat_LeaveMe_02_01"); //Va bene. Tornerò al mio nascondiglio nella palude. Abbi cura di te!

	Npc_ExchangeRoutine (self, "START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};
