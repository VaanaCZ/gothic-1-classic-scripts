//******************************************
//					EXIT	
//******************************************

instance  DIA_Cutter_Exit (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 999;
	condition	= DIA_Cutter_Exit_Condition;
	information	= DIA_Cutter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Cutter_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Cutter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//******************************************
//					Hallo	
//******************************************

instance  DIA_Cutter_Hello (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Hello_Condition;
	information	= DIA_Cutter_Hello_Info;
	permanent	= 0;
	description = "Какой большой замок.";
};                       

FUNC int  DIA_Cutter_Hello_Condition()
{	
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};
FUNC VOID  DIA_Cutter_Hello_Info()
{
	AI_Output (other, self,"DIA_Cutter_Hello_15_00"); //Какой большой замок.
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //Кажется, раньше я тебя не видел. Ты кто?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //Я новенький. Просто хотел немного осмотреться.
};

//******************************************
//					Burg	
//******************************************

instance  DIA_Cutter_Burg (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Burg_Condition;
	information	= DIA_Cutter_Burg_Info;
	permanent	= 10;
	description = "Ты можешь рассказать мне о замке?";
};                       

FUNC int  DIA_Cutter_Burg_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Hello))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_Burg_Info()
{
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //Ты можешь рассказать мне о замке?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //После Восстания его занял Гомез со своей шайкой.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //Сейчас лучше быть на их стороне - это я знаю точно.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //Даже когда мы сидели в подземельях и горбатились в шахтах, большинство каторжников подчинялось его приказам.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //Значит, под замком есть подземелья?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //Да, но сейчас они пустуют. Туда даже никто не спускался после Восстания.
};

//******************************************
//					PERM	
//******************************************

instance  DIA_Cutter_PERM (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_PERM_Condition;
	information	= DIA_Cutter_PERM_Info;
	permanent	= 1;
	description = "Каково это - быть стражником?";
};                       

FUNC int  DIA_Cutter_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Burg))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_PERM_Info()
{
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //Каково это - быть стражником?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //Довольно тихое местечко. Мы живем в самом большом и сильном Лагере колонии. Никто не смеет напасть на нас.
	AI_Output (other, self,"DIA_Cutter_PERM_15_02"); //Понятно.
	AI_StopProcessInfos	(self);
};

	














/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_208_Cutter_WELCOME (C_INFO)
{
	npc				= GRD_208_Cutter;
	condition		= GRD_208_Cutter_WELCOME_Condition;
	information		= GRD_208_Cutter_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_208_Cutter_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_208_Cutter_WELCOME_Info()
{
	AI_Output (self, other,"GRD_208_Cutter_WELCOME_Info_08_01"); //Ты сделал правильный выбор. Тебе понравится быть стражником!
	AI_StopProcessInfos	(self);
};
