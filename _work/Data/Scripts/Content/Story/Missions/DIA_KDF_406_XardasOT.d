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
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //—лушай мен€ внимательно, у нас нет времени на лишние разговоры!
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //ј как ты...
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //—п€щий уже готов к пробуждению. я использовал всю свою силу, чтобы добратьс€ сюда.
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //я перевел пророчества орков и узнал, что дают п€ть сердец шаманов.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //ѕ€ть сердец п€ти побежденных тобой шаманов, помещенные в п€ть гробниц.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //»х несложно открыть, но эти сердца может уничтожить только один из старых клинков, который шаманы носили при себе.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //“ебе нужно будет пронзить эти сердца п€тью клинками. “олько так ты избавишь этот мир от —п€щего.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //я пон€л.
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //“оропись, € чувствую, что пробуждение демона уже близко, а безумный  ор √алом и его последователи уже здесь.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //¬се они собрались в «але —п€щего.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //— мен€ хватит! “еперь мен€ никто не сможет остановить!
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //—ила —п€щего растет, € больше не...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //„то с тобой?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //я... должен...

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,	"„то ж, кажетс€, € уже недалеко от места, где устроилс€ —п€щий.  сардас неожиданно по€вилс€ передо мной и дал мне несколько советов перед предсто€щей битвой. я должен проткнуть клинками п€ть сердец бессмертных орков-шаманов, которые заперты в саркофагах. “олько так € смогу победить —п€щего.  ажетс€, это не так уж сложно...");
	
	AI_StopProcessInfos	(self);
};		
