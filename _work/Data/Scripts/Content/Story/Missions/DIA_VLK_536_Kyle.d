// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Kyle_Exit (C_INFO)
{
	npc			= Vlk_536_Kyle;
	nr			= 999;
	condition	= DIA_Kyle_Exit_Condition;
	information	= DIA_Kyle_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kyle_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kyle_Exit_Info()
{
	Npc_SetRefuseTalk(self,120);	//wegen AUTO-Ansprechen
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Kyle_HutRage (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_HutRage_Condition;
	information		= DIA_Kyle_HutRage_Info;
	permanent		= 1;
	important		= 1;
};

FUNC INT DIA_Kyle_HutRage_Condition()
{	
	if ( (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Kyle_HutRage_Info()
{
	AI_Output (self, other,"DIA_Kyle_HutRage_10_00"); //Сколько раз я говорил вам, ублюдкам, не проходить через мой дом?!
};

// **************************************************
// 				Was ist dein Problem?
// **************************************************

INSTANCE DIA_Kyle_Problem (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_Problem_Condition;
	information		= DIA_Kyle_Problem_Info;
	permanent		= 1;
	description		= "Эй, в чем проблема?";
};

FUNC INT DIA_Kyle_Problem_Condition()
{	
	return 1;	
};

FUNC VOID DIA_Kyle_Problem_Info()
{
	AI_Output (other, self,"DIA_Kyle_Problem_15_00"); //Эй, в чем проблема?
	AI_Output (self, other,"DIA_Kyle_Problem_10_01"); //Оставь меня в покое, парень! Для МЕНЯ вы все - проблема.
	AI_Output (self, other,"DIA_Kyle_Problem_10_02"); //Как они все пялились, когда я строил свой дом!
	AI_Output (self, other,"DIA_Kyle_Problem_10_03"); //`Не строй дом так близко к котловану`, - говорили они.
	AI_Output (self, other,"DIA_Kyle_Problem_10_04"); //Но ни один из этих ублюдков не сказал мне, что будет, если я все-таки построю его здесь.
	AI_Output (self, other,"DIA_Kyle_Problem_10_05"); //Когда я вернулся из шахты несколько дней назад, у меня появилась вторая дверь.
	AI_Output (self, other,"DIA_Kyle_Problem_10_06"); //Эти свиньи! Я их ненавижу! Ты даже представить себе не можешь, как я их ненавижу!
	AI_Output (self, other,"DIA_Kyle_Problem_10_07"); //Теперь все проходят через мой дом. Каждый идиот.
};

	
	
	
	
	


















