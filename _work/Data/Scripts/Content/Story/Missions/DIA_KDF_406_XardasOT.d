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
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //Nie mamy wiele czasu, wiêc s³uchaj uwa¿nie.
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //Jak siê tu...
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //Œni¹cy jest ju¿ blisko. Wykorzysta³em ca³¹ swoj¹ moc, ¿eby siê tu dostaæ.
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //Przet³umaczy³em staro¿ytne przepowiednie Orków i odkry³em o co chodzi z piêcioma sercami.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //Piêæ serc nale¿¹cych do kap³anów, których pokona³eœ, z³o¿ono w piêciu kapliczkach.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //Kapliczki mo¿na otworzyæ, ale tylko staro¿ytne sztylety kap³anów s¹ w stanie je zniszczyæ.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //Musisz przebiæ serca kap³anów piêcioma sztyletami. Tylko w ten sposób uda ci siê wygnaæ Œni¹cego z tego œwiata.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //Rozumiem!
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //Spiesz siê. Przebudzenie demona odbêdzie siê ju¿ wkrótce. Szalony Cor Kalom i jego poplecznicy s¹ ju¿ tutaj.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //Zebrali siê w krypcie Œni¹cego.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //Przela³em ju¿ zbyt du¿o krwi! Nie pozwolê, by ktoœ mnie teraz powstrzyma³.
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //Œni¹cy staje siê potê¿niejszy z ka¿d¹ minut¹, nie mogê...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //Co siê z tob¹ dzieje?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //Ja... muszê...

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,"Zbli¿a siê ostateczne rozstrzygniêcie. Jestem ju¿ bardzo blisko le¿a Œni¹cego. Xardas pojawi³ siê niespodziewanie, udzielaj¹c mi rad przez zbli¿aj¹c¹ siê walk¹. Muszê przebiæ serca piêciu orkowych kap³anów piêcioma mieczami, które mam ze sob¹. To jedyny sposób na pokonanie Œni¹cego. Brzmi podejrzanie ³atwo...");
	
	AI_StopProcessInfos	(self);
};		
