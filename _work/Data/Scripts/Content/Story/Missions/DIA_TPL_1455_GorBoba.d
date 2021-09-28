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
	AI_Output (self, other,"Info_TPL_1455_GorBoba_08_01"); //OdejdŸ st¹d, nie jesteœ tu mile widziany.
};


instance Info_TPL_1455_GorBoba1 (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba1_Condition;
	information		= Info_TPL_1455_GorBoba1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "A co, spróbujesz mnie powstrzymaæ?";	
};

FUNC int Info_TPL_1455_GorBoba1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1455_GorBoba )) {
		return 1;
	};	
};

func void Info_TPL_1455_GorBoba1_Info()
{
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_01"); //A co, spróbujesz mnie powstrzymaæ?
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_02"); //TAK! Powstrzymam ciê. Nie przeszkodzisz mistrzowi Kalomowi w przebudzeniu Œni¹cego.
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_03"); //Nie próbuj mnie atakowaæ. Arcykap³an przekaza³ czêœæ swojej mocy Mistrzowi Kalomowi i nam. Jesteœmy nieœmiertelni!
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_04"); //Ja ci poka¿ê tê wasz¹ nieœmiertelnoœæ!
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_05"); //Przygotuj siê na spotkanie ze stwórc¹!

	AI_StopProcessInfos	( self );
	
	Log_CreateTopic        ( "Orktempel", LOG_NOTE );
	B_LogEntry            ( "Orktempel","GorBoba próbowa³ mnie powstrzymaæ. Mówi³ mi, ¿e Kalom i jego poplecznicy otrzymali od arcykap³ana dar odpornoœci na zwyk³¹ broñ."); 

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );	
};
