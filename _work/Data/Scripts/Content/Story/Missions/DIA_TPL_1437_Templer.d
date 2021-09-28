
// ************************ EXIT **************************

instance  Tpl_1437_Templer_Exit (C_INFO)
{
	npc			=  Tpl_1437_Templer;
	nr			=  999;
	condition	=  Tpl_1437_Templer_Exit_Condition;
	information	=  Tpl_1437_Templer_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1437_Templer_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Tpl_1437_Templer_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** BESSER NICHT ANSPRECHEN ****************************************//

instance  Tpl_1437_Templer_NERV (C_INFO)
{
	npc				= Tpl_1437_Templer;
	condition		= Tpl_1437_Templer_NERV_Condition;
	information		= Tpl_1437_Templer_NERV_Info;
	important		= 0;
	permanent		= 1;
	description		= "Как жизнь?"; 
};

FUNC int  Tpl_1437_Templer_NERV_Condition()
{
	return TRUE;
};


FUNC void  Tpl_1437_Templer_NERV_Info()
{
	AI_Output (other, self,"Tpl_1437_Templer_NERV_Info_15_01"); //Как жизнь?
	AI_Output (self, other,"Tpl_1437_Templer_NERV_Info_13_02"); //Послушай, ты собрался доставать здесь всех или только меня?
	AI_StopProcessInfos	( self );
};  
// ERNEUTES ANSPRECHEN ------------------------------------
instance  Tpl_1437_Templer_LEAVE (C_INFO)
{
	npc				= Tpl_1437_Templer;
	condition		= Tpl_1437_Templer_LEAVE_Condition;
	information		= Tpl_1437_Templer_LEAVE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Все в порядке?"; 
};

FUNC int  Tpl_1437_Templer_LEAVE_Condition()
{	
	if Npc_KnowsInfo (hero, Tpl_1437_Templer_NERV)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1437_Templer_LEAVE_Info()
{
	AI_Output (other, self,"Tpl_1437_Templer_LEAVE_Info_15_01"); //Все в порядке?
	AI_Output (self, other,"Tpl_1437_Templer_LEAVE_Info_13_02"); //Минуту покоя, ладно? Исчезни и поговори с кем-нибудь еще - с кем угодно, только не со мной!
	AI_StopProcessInfos	( self );
};
// ERNEUTES ANSPRECHEN ------------------------------------
instance  Tpl_1437_Templer_LEAVENOW (C_INFO)
{
	npc				= Tpl_1437_Templer;
	condition		= Tpl_1437_Templer_LEAVENOW_Condition;
	information		= Tpl_1437_Templer_LEAVENOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Нет, я просто тебя не понимаю!"; 
};

FUNC int  Tpl_1437_Templer_LEAVENOW_Condition()
{	
	if Npc_KnowsInfo (hero, Tpl_1437_Templer_LEAVE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1437_Templer_LEAVENOW_Info()
{
	AI_Output (other, self,"Tpl_1437_Templer_LEAVENOW_Info_15_01"); //Нет, я просто тебя не понимаю!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_02"); //Ладно, я попробую тебе объяснить!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_03"); //Катись отсюда!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_04"); //Проваливай из этой шахты!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_05"); //Больше НИКОГДА не подходи ко мне!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_06"); //Исчезни! Оставь меня в покое!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_07"); //ПРОВАЛИВАЙ!
	AI_StopProcessInfos	( self );
};

