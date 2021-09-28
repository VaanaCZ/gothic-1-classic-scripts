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
	AI_Output (self, other,"Info_TPL_1455_GorBoba_08_01"); //Ztra se, nikdo tì tady nechce.
};


instance Info_TPL_1455_GorBoba1 (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba1_Condition;
	information		= Info_TPL_1455_GorBoba1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "A TY mì chceš zastavit?";	
};

FUNC int Info_TPL_1455_GorBoba1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1455_GorBoba )) {
		return 1;
	};	
};

func void Info_TPL_1455_GorBoba1_Info()
{
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_01"); //A TY mì chceš zastavit?
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_02"); //ANO! Zastavím tì - nebudeš rušit mistra Kaloma pøi probouzení Spáèe.
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_03"); //Nepokoušej se mì napadnout, nejvyšší knìz pøenesl èást svıch sil na mistra Kaloma a na nás. Jsme teï nesmrtelní.
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_04"); //Ukáu ti, jak jsi nesmrtelnı!
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_05"); //Pøiprav se na setkání se Stvoøitelem!

	AI_StopProcessInfos	( self );
	
	Log_CreateTopic        ( "Orktempel", LOG_NOTE );
	B_LogEntry            ( "Orktempel","Zastavil mì GorBoba a snail se odradit od cesty. Øíkal, e Kalom a jeho stoupenci byli vysokım knìzem obdaøeni silou, která je èiní nezranitelnımi bìnımi lidskımi zbranìmi. "); 

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );	
};
