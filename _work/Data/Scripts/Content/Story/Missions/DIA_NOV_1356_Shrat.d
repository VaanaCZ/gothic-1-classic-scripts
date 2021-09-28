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
	description	= "Co tu robisz?";
};                       

FUNC int  DIA_Shrat_WhyHere_Condition()
{
	return 1;
};

FUNC VOID  DIA_Shrat_WhyHere_Info()
{
	AI_Output (other, self,"DIA_Shrat_WhyHere_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_01"); //Czy pozwoli³em ci siê do mnie odezwaæ?!
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_02"); //Tylko ¿artujê! Te cholerne œwiry zaczynaj¹ mnie ju¿ denerwowaæ, dlatego tu jestem!
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_03"); //"Nie odzywaj siê do mnie!" - "Módl siê o ³askê Œni¹cego!" - "Twoje zadanie jest szczególnie wa¿ne!"
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_04"); //Przy tych ludziach mo¿na w mig zwariowaæ. Nic dziwnego, ¿e mieszkaj¹ tam sami wariaci.
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_05"); //Jestem Shrat, Nowicjusz pierwszego stopnia. I bêdê nim ju¿ do koñca ¿ycia!
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
	description	= "Chcia³bym do³¹czyæ do Bractwa. Mo¿esz mi pomóc?";
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
	AI_Output (other, self,"DIA_Shrat_JoinPSI_15_00"); //Chcia³bym do³¹czyæ do Bractwa. Mo¿esz mi pomóc?
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_01"); //Chcesz tu zamieszkaæ? A ja zastanawiam siê w³aœnie jak st¹d uciec!
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_02"); //Moglibyœmy przemierzyæ ca³¹ koloniê, odci¹¿yæ kilku frajerów z ich gotówki, zebraæ trochê rudy - co ty na to?
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
	description	= "Jasne! Trzymajmy siê razem! ChodŸ ze mn¹!";
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
	AI_Output (other, self,"DIA_Shrat_ComeWithMe_15_00"); //Jasne! Trzymajmy siê razem! ChodŸ ze mn¹!
	AI_Output (self, other,"DIA_Shrat_ComeWithMe_02_01"); //To w³aœnie chcia³em us³yszeæ! ChodŸmy!

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
	description	= "Tutaj nasze drogi siê rozchodz¹. Dalej pójdê sam.";
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
	AI_Output (other, self,"DIA_Shrat_LeaveMe_15_00"); //Tutaj nasze drogi siê rozchodz¹. Dalej pójdê sam.
	AI_Output (self, other,"DIA_Shrat_LeaveMe_02_01"); //Dobra. Ja wracam do mojej kryjówki na bagnach. Uwa¿aj na siebie!

	Npc_ExchangeRoutine (self, "START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};
