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
	AI_Output (self, other,"Info_TPL_1455_GorBoba_08_01"); //Odejd� st�d, nie jeste� tu mile widziany.
};


instance Info_TPL_1455_GorBoba1 (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba1_Condition;
	information		= Info_TPL_1455_GorBoba1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "A co, spr�bujesz mnie powstrzyma�?";	
};

FUNC int Info_TPL_1455_GorBoba1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1455_GorBoba )) {
		return 1;
	};	
};

func void Info_TPL_1455_GorBoba1_Info()
{
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_01"); //A co, spr�bujesz mnie powstrzyma�?
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_02"); //TAK! Powstrzymam ci�. Nie przeszkodzisz mistrzowi Kalomowi w przebudzeniu �ni�cego.
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_03"); //Nie pr�buj mnie atakowa�. Arcykap�an przekaza� cz�� swojej mocy Mistrzowi Kalomowi i nam. Jeste�my nie�miertelni!
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_04"); //Ja ci poka�� t� wasz� nie�miertelno��!
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_05"); //Przygotuj si� na spotkanie ze stw�rc�!

	AI_StopProcessInfos	( self );
	
	Log_CreateTopic        ( "Orktempel", LOG_NOTE );
	B_LogEntry            ( "Orktempel","GorBoba pr�bowa� mnie powstrzyma�. M�wi� mi, �e Kalom i jego poplecznicy otrzymali od arcykap�ana dar odporno�ci na zwyk�� bro�."); 

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );	
};
