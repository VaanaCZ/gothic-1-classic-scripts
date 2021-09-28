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
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //У нас не так много времени, так что слушай внимательно!
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //Как ты...
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //Спящий уже рядом. Мне стоило больших трудов добраться сюда.
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //Я перевел оркские пророчества и понял, что значат пять сердец.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //Пять сердец побежденных тобой жрецов лежат в пяти гробницах.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //Гробницы эти несложно открыть, но только древний клинок в руках жреца сможет уничтожить сердца.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //Ты должен будешь пронзить сердца пятью клинками. Только так можно изгнать Спящего из этого мира.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //Я понял!
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //Торопись, безумный Кор Галом со своими учениками уже здесь, и демон вскоре пробудится.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //Они собрались в в зале Спящего.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //Я пролил довольно крови. Теперь меня уже ничто не остановит!
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //Мощь Спящего растет, и я не...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //Что с тобой?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //Я... должен...

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,"Время настало. От места отдыха Спящего меня должно отделять теперь совсем немного. Ксардас появился неожиданно и дал несколько советов. Пять сердец орочьих шаманов находятся в святилищах. Мне надо проткнуть каждое отдельным мечом. Это единственный способ победить Спящего. Звучит довольно просто...");
	
	AI_StopProcessInfos	(self);
};		
