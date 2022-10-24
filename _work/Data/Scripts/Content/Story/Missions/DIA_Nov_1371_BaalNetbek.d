/*------------------------------------------------------------------------
//							EXIT									//
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_Exit (C_INFO)
{
	npc			=  Nov_1371_BaalNetbek;
	nr			=  999;
	condition	=  Nov_1371_BaalNetbek_Exit_Condition;
	information	=  Nov_1371_BaalNetbek_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};                       

FUNC int  Nov_1371_BaalNetbek_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Nov_1371_BaalNetbek_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
							GДRTNER								
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_CRAZY (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= Nov_1371_BaalNetbek_CRAZY_Condition;
	information		= Nov_1371_BaalNetbek_CRAZY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Кто ты?"; 
};

FUNC int  Nov_1371_BaalNetbek_CRAZY_Condition()
{
	return TRUE;
};


FUNC void  Nov_1371_BaalNetbek_CRAZY_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_01"); //Кто ты?
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_02"); //Я Гуру этого Болотного лагеря. Мои слуги зовут меня Идол Нетбек.
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_03"); //Здесь же никого нет! О ком ты?
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_04"); //Ты можешь и сам их увидеть. Деревья! Они ходят вокруг, танцуют для меня... 
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_05"); //... понятно, ну, я, пожалуй, пойду...
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_06"); //Подожди, ты можешь помочь мне превратить это болото в большой цветущий сад!
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_07"); //Ладно, ты начни без меня, а я... я приду потом, как-нибудь.
	AI_TurnAway (hero,self);
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_08"); //Надеюсь, он никуда меня не заведет...
	AI_StopProcessInfos	( self );
};  
/*------------------------------------------------------------------------
							AGAIN							
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_AGAIN (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= Nov_1371_BaalNetbek_AGAIN_Condition;
	information		= Nov_1371_BaalNetbek_AGAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Эй, как дела?"; 
};

FUNC int  Nov_1371_BaalNetbek_AGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,Nov_1371_BaalNetbek_CRAZY))
	{
		return TRUE;
	};

};
FUNC void  Nov_1371_BaalNetbek_AGAIN_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_AGAIN_Info_15_01"); //Эй, как дела?
	AI_Output (self, other,"Nov_1371_BaalNetbek_AGAIN_Info_03_02"); //Смотри, не обижай мои деревья! 
};  
