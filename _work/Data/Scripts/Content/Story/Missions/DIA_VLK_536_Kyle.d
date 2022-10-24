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
	AI_Output (self, other,"DIA_Kyle_HutRage_10_00"); //Сколько можно повторять: мой дом не проходной двор!
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
	description		= "У тебя какие-то проблемы?";
};

FUNC INT DIA_Kyle_Problem_Condition()
{	
	return 1;	
};

FUNC VOID DIA_Kyle_Problem_Info()
{
	AI_Output (other, self,"DIA_Kyle_Problem_15_00"); //У тебя какие-то проблемы?
	AI_Output (self, other,"DIA_Kyle_Problem_10_01"); //Оставь меня в покое! Здесь вы все для меня одна большая проблема!
	AI_Output (self, other,"DIA_Kyle_Problem_10_02"); //Все началось с того, когда я решил построить свой дом.
	AI_Output (self, other,"DIA_Kyle_Problem_10_03"); //Все советовали мне не строить его близко к обрыву.
	AI_Output (self, other,"DIA_Kyle_Problem_10_04"); //Но никто не сказал почему. И я все же построил его именно на краю обрыва.
	AI_Output (self, other,"DIA_Kyle_Problem_10_05"); //А когда я через несколько дней пришел из шахты, у меня появилась вторая дверь.
	AI_Output (self, other,"DIA_Kyle_Problem_10_06"); //Предатели! Я их ненавижу! Ты даже представить себе не можешь, как я их ненавижу!
	AI_Output (self, other,"DIA_Kyle_Problem_10_07"); //А теперь все эти идиоты ходят через мой дом. 
};

	
	
	
	
	


















