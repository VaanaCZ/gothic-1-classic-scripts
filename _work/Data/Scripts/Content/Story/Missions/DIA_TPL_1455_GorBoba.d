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
	AI_Output (self, other,"Info_TPL_1455_GorBoba_08_01"); //Odejdź stąd, nie jesteś tu mile widziany.
};


instance Info_TPL_1455_GorBoba1 (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba1_Condition;
	information		= Info_TPL_1455_GorBoba1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "A co, spróbujesz mnie powstrzymać?";	
};

FUNC int Info_TPL_1455_GorBoba1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1455_GorBoba )) {
		return 1;
	};	
};

func void Info_TPL_1455_GorBoba1_Info()
{
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_01"); //A co, spróbujesz mnie powstrzymać?
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_02"); //TAK! Powstrzymam cię. Nie przeszkodzisz mistrzowi Kalomowi w przebudzeniu Śniącego.
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_03"); //Nie próbuj mnie atakować. Arcykapłan przekazał część swojej mocy Mistrzowi Kalomowi i nam. Jesteśmy nieśmiertelni!
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_04"); //Ja ci pokażę tę waszą nieśmiertelność!
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_05"); //Przygotuj się na spotkanie ze stwórcą!

	AI_StopProcessInfos	( self );
	
	Log_CreateTopic        ( "Orktempel", LOG_NOTE );
	B_LogEntry            ( "Orktempel","GorBoba próbował mnie powstrzymać. Mówił mi, że Kalom i jego poplecznicy otrzymali od arcykapłana dar odporności na zwykłą broń."); 

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );	
};
