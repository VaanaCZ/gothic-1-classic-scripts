//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################
instance  Info_Xardas_OT (C_INFO)
{
	npc				= Kdf_406_OTXardas;
	condition		= Info_Xardas_OT_Condition;
	information		= Info_Xardas_OT_Info;
	important		= 1;
	permanent		= 0; 
};

FUNC int  Info_Xardas_OT_Condition()
{	
	if (Npc_GetDistToWP(self, "TPL_331") < 1000)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OT_Info()
{
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //Слушай меня внимательно, у нас нет времени на лишние разговоры!
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //А как ты...
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //Спящий уже готов к пробуждению. Я использовал всю свою силу, чтобы добраться сюда.
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //Я перевел пророчества орков и узнал, что дают пять сердец шаманов.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //Пять сердец пяти побежденных тобой шаманов, помещенные в пять гробниц.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //Их несложно открыть, но эти сердца может уничтожить только один из старых клинков, который шаманы носили при себе.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //Тебе нужно будет пронзить эти сердца пятью клинками. Только так ты избавишь этот мир от Спящего.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //Я понял.
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //Торопись, я чувствую, что пробуждение демона уже близко, а безумный Кор Галом и его последователи уже здесь.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //Все они собрались в Зале Спящего.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //С меня хватит! Теперь меня никто не сможет остановить!
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //Сила Спящего растет, я больше не...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //Что с тобой?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //Я... должен...

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,	"Что ж, кажется, я уже недалеко от места, где устроился Спящий. Ксардас неожиданно появился передо мной и дал мне несколько советов перед предстоящей битвой. Я должен проткнуть клинками пять сердец бессмертных орков-шаманов, которые заперты в саркофагах. Только так я смогу победить Спящего. Кажется, это не так уж сложно...");
	
	AI_StopProcessInfos	(self);
};		
