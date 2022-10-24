
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
	description		= "Как дела?"; 
};

FUNC int  Tpl_1437_Templer_NERV_Condition()
{
	return TRUE;
};


FUNC void  Tpl_1437_Templer_NERV_Info()
{
	AI_Output (other, self,"Tpl_1437_Templer_NERV_Info_15_01"); //Как дела?
	AI_Output (self, other,"Tpl_1437_Templer_NERV_Info_13_02"); //Слушай, ты что, намерен всех здесь достать?
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
	description		= "У тебя все в порядке?"; 
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
	AI_Output (other, self,"Tpl_1437_Templer_LEAVE_Info_15_01"); //У тебя все в порядке?
	AI_Output (self, other,"Tpl_1437_Templer_LEAVE_Info_13_02"); //Я хочу остаться один, ясно? Иди, займись чем-нибудь!
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
	description		= "Но я не понимаю тебя!"; 
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
	AI_Output (other, self,"Tpl_1437_Templer_LEAVENOW_Info_15_01"); //Но я не понимаю тебя!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_02"); //Ну, хорошо. Я тебе объясню!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_03"); //Вали отсюда!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_04"); //Убирайся из этой шахты!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_05"); //Никогда больше ко мне не подходи!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_06"); //Сделай так, чтобы я тебя больше не видел!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_07"); //Пошел вон!
	AI_StopProcessInfos	( self );
};

