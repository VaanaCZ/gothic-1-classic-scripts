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
	AI_Output (self, other,"Info_TPL_1455_GorBoba_08_01"); //Ztra� se, nikdo t� tady nechce.
};


instance Info_TPL_1455_GorBoba1 (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba1_Condition;
	information		= Info_TPL_1455_GorBoba1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "A TY m� chce� zastavit?";	
};

FUNC int Info_TPL_1455_GorBoba1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1455_GorBoba )) {
		return 1;
	};	
};

func void Info_TPL_1455_GorBoba1_Info()
{
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_01"); //A TY m� chce� zastavit?
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_02"); //ANO! Zastav�m t� - nebude� ru�it mistra Kaloma p�i probouzen� Sp��e.
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_03"); //Nepokou�ej se m� napadnout, nejvy��� kn�z p�enesl ��st sv�ch sil na mistra Kaloma a na n�s. Jsme te� nesmrteln�.
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_04"); //Uk�u ti, jak jsi nesmrteln�!
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_05"); //P�iprav se na setk�n� se Stvo�itelem!

	AI_StopProcessInfos	( self );
	
	Log_CreateTopic        ( "Orktempel", LOG_NOTE );
	B_LogEntry            ( "Orktempel","Zastavil m� GorBoba a sna�il se odradit od cesty. ��kal, �e Kalom a jeho stoupenci byli vysok�m kn�zem obda�eni silou, kter� je �in� nezraniteln�mi b�n�mi lidsk�mi zbran�mi. "); 

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );	
};
