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
	description	= "Co tady d�l�?";
};                       

FUNC int  DIA_Shrat_WhyHere_Condition()
{
	return 1;
};

FUNC VOID  DIA_Shrat_WhyHere_Info()
{
	AI_Output (other, self,"DIA_Shrat_WhyHere_15_00"); //Co tady d�l�?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_01"); //Dovolil jsem ti na m� mluvit?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_02"); //Jen �ertuju! Ti zatracen� cvoci mi lezou na nervy, proto jsem tady!
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_03"); //Nemluv na m�!' - 'Modli se ke Sp��ovi za odpu�t�n�!' - 'Tv�j �kol je nesm�rn� d�le�it�!'
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_04"); //Nejde to pustit z hlavy - nen� divu, �e se z toho v�ichni tady pominuli.
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_05"); //Jsem Shrat, novic prvn� t��dy - a t�m tak� nav�dy z�stanu!
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
	description	= "Chci se p�idat k Bratrstvu - m��e� mi pomoci?";
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
	AI_Output (other, self,"DIA_Shrat_JoinPSI_15_00"); //Chci se p�idat k Bratrstvu - m��e� mi pomoci?
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_01"); //Chce� se k n�m p�idat? J� u� v�n� p�em��l�m o tom, jak se odsud dostat.
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_02"); //Mohli bychom se potulovat po kolonii. Uleh�it p�r mamlas�m o jejich pen�ze, nasb�rat n�jakou rudu - co mysl�?
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
	description	= "M��eme se toulat spole�n�! Poj� se mnou!";
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
	AI_Output (other, self,"DIA_Shrat_ComeWithMe_15_00"); //M��eme se toulat spole�n�! Poj� se mnou!
	AI_Output (self, other,"DIA_Shrat_ComeWithMe_02_01"); //Tohle r�d sly��m! Poj�me!

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
	description	= "Na�e cesty se rozch�zej� - p�jdu si po sv�ch.";
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
	AI_Output (other, self,"DIA_Shrat_LeaveMe_15_00"); //Na�e cesty se rozch�zej� - p�jdu si po sv�ch.
	AI_Output (self, other,"DIA_Shrat_LeaveMe_02_01"); //Dob�e. J� se vr�t�m do sv�ho �krytu v ba�in�ch. D�vej na sebe pozor!

	Npc_ExchangeRoutine (self, "START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};
