// infos 
instance Info_TPL_1455_GorBoba (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba_Condition;
	information		= Info_TPL_1455_GorBoba_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_TPL_1455_GorBoba_Condition()
{
	return TRUE;
};

func void Info_TPL_1455_GorBoba_Info()
{
	AI_Output (self, other,"Info_TPL_1455_GorBoba_08_01"); //Тебя здесь никто не ждет. Проваливай!
};


instance Info_TPL_1455_GorBoba1 (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba1_Condition;
	information		= Info_TPL_1455_GorBoba1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Уж не собираешься ли ТЫ остановить меня?";	
};

FUNC int Info_TPL_1455_GorBoba1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1455_GorBoba )) {
		return 1;
	};	
};

func void Info_TPL_1455_GorBoba1_Info()
{
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_01"); //Уж не собираешься ли ТЫ остановить меня?
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_02"); //ДА! Я остановлю тебя, и ты не сможешь помешать господину Галому готовиться к пробуждению Спящего.
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_03"); //Не пытайся убить меня. Сам Верховный Жрец передал нам часть своей силы. Теперь мы бессмертны.
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_04"); //Это мы сейчас и проверим!
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_05"); //Готовься к встрече с Создателем!

	AI_StopProcessInfos	( self );
	
	Log_CreateTopic        ( "Orktempel", LOG_NOTE );
	B_LogEntry            ( "Orktempel","Гор Боба хотел остановить меня. Он сказал мне, что Галом и его последователи были благословлены силами верховного жреца, и теперь простое оружие не может причинить им вреда."); 

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );	
};
