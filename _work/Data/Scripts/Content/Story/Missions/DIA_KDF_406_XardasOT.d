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
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //Nie mamy wiele czasu, więc słuchaj uważnie.
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //Jak się tu...
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //Śniący jest już blisko. Wykorzystałem całą swoją moc, żeby się tu dostać.
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //Przetłumaczyłem starożytne przepowiednie Orków i odkryłem o co chodzi z pięcioma sercami.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //Pięć serc należących do kapłanów, których pokonałeś, złożono w pięciu kapliczkach.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //Kapliczki można otworzyć, ale tylko starożytne sztylety kapłanów są w stanie je zniszczyć.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //Musisz przebić serca kapłanów pięcioma sztyletami. Tylko w ten sposób uda ci się wygnać Śniącego z tego świata.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //Rozumiem!
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //Spiesz się. Przebudzenie demona odbędzie się już wkrótce. Szalony Cor Kalom i jego poplecznicy są już tutaj.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //Zebrali się w krypcie Śniącego.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //Przelałem już zbyt dużo krwi! Nie pozwolę, by ktoś mnie teraz powstrzymał.
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //Śniący staje się potężniejszy z każdą minutą, nie mogę...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //Co się z tobą dzieje?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //Ja... muszę...

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,"Zbliża się ostateczne rozstrzygnięcie. Jestem już bardzo blisko leża Śniącego. Xardas pojawił się niespodziewanie, udzielając mi rad przez zbliżającą się walką. Muszę przebić serca pięciu orkowych kapłanów pięcioma mieczami, które mam ze sobą. To jedyny sposób na pokonanie Śniącego. Brzmi podejrzanie łatwo...");
	
	AI_StopProcessInfos	(self);
};		
