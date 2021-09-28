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
	description	= "Что ты здесь делаешь?";
};                       

FUNC int  DIA_Shrat_WhyHere_Condition()
{
	return 1;
};

FUNC VOID  DIA_Shrat_WhyHere_Info()
{
	AI_Output (other, self,"DIA_Shrat_WhyHere_15_00"); //Что ты здесь делаешь?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_01"); //Разве я позволил тебе обратиться ко мне?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_02"); //Шучу! Я здесь, потому что эти недоумки действуют мне на нервы!
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_03"); //Не смей обращаться ко мне: 'Моли Спящего о прощении! Это задание необычайной важности!'
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_04"); //Когда вокруг тебя столько психов, этого достаточно, чтобы свести человека с ума.
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_05"); //Я Шрет, ученик первого ранга, им же и останусь!
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
	description	= "Я хочу вступить в Братство. Ты можешь мне помочь?";
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
	AI_Output (other, self,"DIA_Shrat_JoinPSI_15_00"); //Я хочу вступить в Братство. Ты можешь мне помочь?
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_01"); //Ты действительно присоединишься к этим типам? А я только и думаю о том, как убраться отсюда.
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_02"); //Мы могли бы вместе странствовать по колонии. Облегчим кошельки парочки толстосумов, поднакопим руды, что скажешь?
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
	description	= "Что ж, пойдем вместе. Идем!";
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
	AI_Output (other, self,"DIA_Shrat_ComeWithMe_15_00"); //Что ж, пойдем вместе. Идем!
	AI_Output (self, other,"DIA_Shrat_ComeWithMe_02_01"); //То, что я хотел услышать! Вперед!

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
	description	= "Здесь мы должны разделиться. Дальше я пойду один.";
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
	AI_Output (other, self,"DIA_Shrat_LeaveMe_15_00"); //Здесь мы должны разделиться. Дальше я пойду один.
	AI_Output (self, other,"DIA_Shrat_LeaveMe_02_01"); //Ладно. А я вернусь в свое укрытие на болотах. Береги себя!

	Npc_ExchangeRoutine (self, "START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};
