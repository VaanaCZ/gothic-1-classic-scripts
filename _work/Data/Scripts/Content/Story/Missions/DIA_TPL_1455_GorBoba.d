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
	AI_Output (self, other,"Info_TPL_1455_GorBoba_08_01"); //Ztrať se, nikdo tě tady nechce.
};


instance Info_TPL_1455_GorBoba1 (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba1_Condition;
	information		= Info_TPL_1455_GorBoba1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "A TY mě chceš zastavit?";	
};

FUNC int Info_TPL_1455_GorBoba1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1455_GorBoba )) {
		return 1;
	};	
};

func void Info_TPL_1455_GorBoba1_Info()
{
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_01"); //A TY mě chceš zastavit?
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_02"); //ANO! Zastavím tě - nebudeš rušit mistra Kaloma při probouzení Spáče.
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_03"); //Nepokoušej se mě napadnout, nejvyšší kněz přenesl část svých sil na mistra Kaloma a na nás. Jsme teď nesmrtelní.
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_04"); //Ukážu ti, jak jsi nesmrtelný!
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_05"); //Připrav se na setkání se Stvořitelem!

	AI_StopProcessInfos	( self );
	
	Log_CreateTopic        ( "Orktempel", LOG_NOTE );
	B_LogEntry            ( "Orktempel","Zastavil mě GorBoba a snažil se odradit od cesty. Říkal, že Kalom a jeho stoupenci byli vysokým knězem obdařeni silou, která je činí nezranitelnými běžnými lidskými zbraněmi. "); 

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );	
};
