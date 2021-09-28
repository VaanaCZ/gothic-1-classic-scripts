// *******************************
// 				EXIT
// *******************************

instance  DIA_GorNaRan_Exit (C_INFO)
{
	npc			=  TPL_1405_GorNaRan;
	nr			=  999;
	condition	=  DIA_GorNaRan_Exit_Condition;
	information	=  DIA_GorNaRan_Exit_Info;
	permanent	=  1;
	description = "ЗАКОНЧИТЬ";
};                       

FUNC int  DIA_GorNaRan_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_GorNaRan_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// *******************************
// 				Wache
// *******************************

instance  DIA_GorNaRan_Wache (C_INFO)
{
	npc			=  TPL_1405_GorNaRan;
	nr			=  1;
	condition	=  DIA_GorNaRan_Wache_Condition;
	information	=  DIA_GorNaRan_Wache_Info;
	permanent	=  1;
	description = "Чем ты занимаешься?";
};                       

FUNC int  DIA_GorNaRan_Wache_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_GorNaRan_Wache_Info()
{
	AI_Output (other, self,"DIA_GorNaRan_Wache_15_00"); //Чем ты занимаешься?
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_01"); //Я слежу за тем, чтобы болотожоры не подобрались к Лагерю.
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_02"); //На твоем месте я бы держался подальше от этих тварей. Против них у тебя нет ни единого шанса.
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_03"); //Знаешь, мне нельзя отвлекаться.
	AI_StopProcessInfos	( self );
};









instance Info_TPL_1405_GorNaRan (C_INFO)
{
	npc			= TPL_1405_GorNaRan;
	condition	= Info_TPL_1405_GorNaRan_Condition;
	information	= Info_TPL_1405_GorNaRan_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_TPL_1405_GorNaRan_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};	
};

FUNC VOID Info_TPL_1405_GorNaRan_Info()
{
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_01"); //Куда это ты собрался? Никому не дозволено ходить здесь! 
};


// ****************** ANGRIFF  *********************

INSTANCE Info_TPL_1405_GorNaRan2 (C_INFO)
{
	npc			= TPL_1405_GorNaRan;
	nr			= 1;
	condition	= Info_TPL_1405_GorNaRan2_Condition;
	information	= Info_TPL_1405_GorNaRan2_Info;
	permanent	= 1;
	description = "Что здесь происходит?";
};                       

FUNC INT Info_TPL_1405_GorNaRan2_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1405_GorNaRan )) {
		return 1;
	};
};

FUNC VOID Info_TPL_1405_GorNaRan2_Info()
{
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_02"); //Что здесь происходит?
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03"); //Он еще спрашивает меня, что происходит! Пади ниц и молись Спящему, ибо пробудился он, дабы стереть с лица земли всех неверных!
};


// ****************** ANGRIFF  *********************

INSTANCE Info_TPL_1405_GorNaRan3 (C_INFO)
{
	npc			= TPL_1405_GorNaRan;
	nr			= 1;
	condition	= Info_TPL_1405_GorNaRan3_Condition;
	information	= Info_TPL_1405_GorNaRan3_Info;
	permanent	= 1;
	description = "Я просто хотел посмотреть.";
};                       

FUNC INT Info_TPL_1405_GorNaRan3_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1405_GorNaRan )) {
		return 1;
	};
};

FUNC VOID Info_TPL_1405_GorNaRan3_Info()
{	
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_04"); //Я просто хотел посмотреть.
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_05"); //Ты жалкий червь! Тебе и таким, как ты, нечего делать здесь в момент пробуждения Спящего! И я позабочусь об этом!
	
	AI_StopProcessInfos	( self );
	
	Npc_SetTarget 	( self, hero );
	AI_StartState 		( self, ZS_Attack, 1 ,"" );
};



INSTANCE Info_TPL_1405_GorNaRan4 (C_INFO)
{
	npc			= TPL_1405_GorNaRan;
	nr			= 1;
	condition	= Info_TPL_1405_GorNaRan4_Condition;
	information	= Info_TPL_1405_GorNaRan4_Info;
	permanent	= 0;
	description = "Тебе не остановить меня!";
};                       

FUNC INT Info_TPL_1405_GorNaRan4_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1405_GorNaRan )) {
		return 1;
	};
};

FUNC VOID Info_TPL_1405_GorNaRan4_Info()
{	
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_06"); //Тебе не остановить меня!
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_07"); //Это все слова, парень! За Спящего!

	AI_StopProcessInfos	( self );

	Npc_SetTarget 	( self, hero );
	AI_StartState 	( self, ZS_Attack, 1 ,"" );
};
