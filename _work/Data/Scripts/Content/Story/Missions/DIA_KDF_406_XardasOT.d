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
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //Nie mamy wiele czasu, wi�c s�uchaj uwa�nie.
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //Jak si� tu...
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //�ni�cy jest ju� blisko. Wykorzysta�em ca�� swoj� moc, �eby si� tu dosta�.
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //Przet�umaczy�em staro�ytne przepowiednie Ork�w i odkry�em o co chodzi z pi�cioma sercami.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //Pi�� serc nale��cych do kap�an�w, kt�rych pokona�e�, z�o�ono w pi�ciu kapliczkach.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //Kapliczki mo�na otworzy�, ale tylko staro�ytne sztylety kap�an�w s� w stanie je zniszczy�.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //Musisz przebi� serca kap�an�w pi�cioma sztyletami. Tylko w ten spos�b uda ci si� wygna� �ni�cego z tego �wiata.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //Rozumiem!
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //Spiesz si�. Przebudzenie demona odb�dzie si� ju� wkr�tce. Szalony Cor Kalom i jego poplecznicy s� ju� tutaj.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //Zebrali si� w krypcie �ni�cego.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //Przela�em ju� zbyt du�o krwi! Nie pozwol�, by kto� mnie teraz powstrzyma�.
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //�ni�cy staje si� pot�niejszy z ka�d� minut�, nie mog�...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //Co si� z tob� dzieje?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //Ja... musz�...

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,"Zbli�a si� ostateczne rozstrzygni�cie. Jestem ju� bardzo blisko le�a �ni�cego. Xardas pojawi� si� niespodziewanie, udzielaj�c mi rad przez zbli�aj�c� si� walk�. Musz� przebi� serca pi�ciu orkowych kap�an�w pi�cioma mieczami, kt�re mam ze sob�. To jedyny spos�b na pokonanie �ni�cego. Brzmi podejrzanie �atwo...");
	
	AI_StopProcessInfos	(self);
};		
