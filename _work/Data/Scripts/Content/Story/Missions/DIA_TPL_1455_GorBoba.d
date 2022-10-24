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
	AI_Output (self, other,"Info_TPL_1455_GorBoba_08_01"); //Проваливай! Тебе здесь не место!
};


instance Info_TPL_1455_GorBoba1 (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba1_Condition;
	information		= Info_TPL_1455_GorBoba1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "А ты хочешь меня остановить?";	
};

FUNC int Info_TPL_1455_GorBoba1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1455_GorBoba )) {
		return 1;
	};	
};

func void Info_TPL_1455_GorBoba1_Info()
{
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_01"); //А ты хочешь меня остановить?
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_02"); //Да! Я остановлю тебя, чтобы ты не смог отвлечь моего Учителя Галома. Он готовится к пробуждению Спящего.
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_03"); //Не пытайся нападать на меня. Верховный жрец передал Галому и нам часть своей силы. Мы стали бессмертными.
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_04"); //Сейчас я тебе покажу, насколько ты бессмертен!
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_05"); //Приготовься к встрече с Создателем!

	AI_StopProcessInfos	( self );
	
	Log_CreateTopic        ( "Храм орков", LOG_NOTE );
	B_LogEntry            ( "Храм орков", "Гор Боба сказал мне, что он охраняет территорию, и что дальше лучше не ходить. Кор Галом и его последователи получили силу от шаманов, и теперь их нельзя убить человеческим оружием." ); 

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );	
};
