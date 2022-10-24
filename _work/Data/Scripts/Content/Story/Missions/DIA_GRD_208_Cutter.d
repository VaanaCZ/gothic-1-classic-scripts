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
	description = "Да, какой большой замок.";
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
	AI_Output (other, self,"DIA_Cutter_Hello_15_00"); //Да, какой большой замок.
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //Раньше я тебя здесь не видел. Кто ты?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //Я здесь недавно. Хочу немного осмотреть это место.
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
	description = "Ты можешь рассказать мне что-нибудь о замке?";
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
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //Ты можешь рассказать мне что-нибудь о замке?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //После великого восстания он был занят Гомезом и его людьми. Теперь никто другой не смеет приближаться к нему.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //Я еще тогда понял, что лучше всего будет присоединиться к Гомезу.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //Еще в те времена, когда все мы сидели в подземельях и работали на шахте, он был самым влиятельным среди заключенных.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //Так под замком есть подземелья?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //Да, но сейчас они пусты. Со времен восстания туда никто не спускался.
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
	description = "Как живется здесь стражникам?";
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
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //Как живется здесь стражникам?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //Спокойно живется. Наш лагерь сильнейший в колонии. С нами лучше не ссориться.
	AI_Output (other, self,"DIA_Cutter_PERM_15_02"); //Я уже понял.
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
	AI_Output (self, other,"GRD_208_Cutter_WELCOME_Info_08_01"); //Ты принял правильное решение. Думаю, тебе понравится быть стражником.
	AI_StopProcessInfos	(self);
};
