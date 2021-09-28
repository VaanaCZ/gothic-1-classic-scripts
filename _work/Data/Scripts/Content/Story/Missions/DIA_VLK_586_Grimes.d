// ************************ EXIT **************************

instance VLK_586_Grimes_Exit (C_INFO)
{
	npc			= VLK_586_Grimes;
	nr			= 999;
	condition	= VLK_586_Grimes_Exit_Condition;
	information	= VLK_586_Grimes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_586_Grimes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_586_Grimes_Exit_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_Exit_Info_15_01"); //Желаю удачи!
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //Тебе тоже, мой мальчик, тебе тоже.
	
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  VLK_586_Grimes_STORY (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_STORY_Condition;
	information		= VLK_586_Grimes_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ты здесь давно?"; 
};

FUNC int  VLK_586_Grimes_STORY_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_FIRST) )  
	{
		return 1;
	};

};


FUNC void  VLK_586_Grimes_STORY_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_STORY_Info_15_01"); //Ты здесь давно?
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //Я здесь уже почти 10 лет. Поверь мне, за эти годы я много понял и многому научился. 
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //На мою долю выпали тяжкие испытания, но, как видишь, я уцелел.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //Давным-давно мы работали на заброшенной шахте... Теперь она опять пустует. Балки наверняка уже обрушились...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //Но это всего лишь стариковская болтовня...
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ты уже наверняка слышал россказни о разных планах побега."; 
};

FUNC int  VLK_586_Grimes_KNOW_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_STORY) )  
	{
		return 1;
	};

};
FUNC void  VLK_586_Grimes_KNOW_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //Ты уже наверняка слышал россказни о разных планах побега.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //Я знаю, что тебе не терпится сбежать отсюда. Но позволь я дам тебе один совет: не думай об этом.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //Лучше оставить все мысли о побеге. Я видел тех, кто пытался пройти через Барьер...
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //Поверь мне, он остановит любого. Не повторяй их ошибки.
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //Я не собираюсь до конца своих дней ковыряться в шахте!
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //Тебя никто и не заставляет. Возможно, ты станешь здесь большим человеком, как знать.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //Ты можешь многого добиться... Но это не важно: Барьер все равно остановит тебя.
};

instance VLK_586_Grimes_FIRST (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_FIRST_Condition;
	information		= VLK_586_Grimes_FIRST_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_586_Grimes_FIRST_Condition()
{
	return 1;
};

func void  VLK_586_Grimes_FIRST_Info()
{
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //О! Новенький! Пробовал когда-нибудь добывать руду, парень?
};  
