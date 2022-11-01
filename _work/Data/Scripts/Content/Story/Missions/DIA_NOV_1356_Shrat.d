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
	description	= "Co tady děláš?";
};                       

FUNC int  DIA_Shrat_WhyHere_Condition()
{
	return 1;
};

FUNC VOID  DIA_Shrat_WhyHere_Info()
{
	AI_Output (other, self,"DIA_Shrat_WhyHere_15_00"); //Co tady děláš?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_01"); //Dovolil jsem ti na mě mluvit?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_02"); //Jen žertuju! Ti zatracení cvoci mi lezou na nervy, proto jsem tady!
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_03"); //Nemluv na mě!' - 'Modli se ke Spáčovi za odpuštění!' - 'Tvůj úkol je nesmírně důležitý!'
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_04"); //Nejde to pustit z hlavy - není divu, že se z toho všichni tady pominuli.
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_05"); //Jsem Shrat, novic první třídy - a tím také navždy zůstanu!
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
	description	= "Chci se přidat k Bratrstvu - můžeš mi pomoci?";
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
	AI_Output (other, self,"DIA_Shrat_JoinPSI_15_00"); //Chci se přidat k Bratrstvu - můžeš mi pomoci?
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_01"); //Chceš se k nám přidat? Já už vážně přemýšlím o tom, jak se odsud dostat.
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_02"); //Mohli bychom se potulovat po kolonii. Ulehčit pár mamlasům o jejich peníze, nasbírat nějakou rudu - co myslíš?
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
	description	= "Můžeme se toulat společně! Pojď se mnou!";
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
	AI_Output (other, self,"DIA_Shrat_ComeWithMe_15_00"); //Můžeme se toulat společně! Pojď se mnou!
	AI_Output (self, other,"DIA_Shrat_ComeWithMe_02_01"); //Tohle rád slyším! Pojďme!

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
	description	= "Naše cesty se rozcházejí - půjdu si po svých.";
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
	AI_Output (other, self,"DIA_Shrat_LeaveMe_15_00"); //Naše cesty se rozcházejí - půjdu si po svých.
	AI_Output (self, other,"DIA_Shrat_LeaveMe_02_01"); //Dobře. Já se vrátím do svého úkrytu v bažinách. Dávej na sebe pozor!

	Npc_ExchangeRoutine (self, "START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};
