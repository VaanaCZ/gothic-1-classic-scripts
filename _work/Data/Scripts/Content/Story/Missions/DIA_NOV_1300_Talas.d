
// ************************ EXIT **************************

instance  Nov_1300_Talas_Exit (C_INFO)
{
	npc			=  Nov_1300_Talas;
	nr			=  999;
	condition	=  Nov_1300_Talas_Exit_Condition;
	information	=  Nov_1300_Talas_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Nov_1300_Talas_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Nov_1300_Talas_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_UR (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_UR_Condition;
	information		= Nov_1300_Talas_UR_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ty jsi Talas, ten co ho pøepadli."; 
};

FUNC int  Nov_1300_Talas_UR_Condition()
{
	if	Npc_KnowsInfo(hero, Info_CorKalom_BringBook)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Nov_1300_Talas_UR_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_UR_Info_15_01"); //Ty jsi Talas, ten co ho pøepadli.
	AI_Output			(self, other,"Nov_1300_Talas_UR_Info_02_02"); //Nech mì na pokoji, nechci o tom mluvit!
};  
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_HELP (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_HELP_Condition;
	information		= Nov_1300_Talas_HELP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Pomùžu ti pøinést zpátky ten almanach."; 
};

FUNC int  Nov_1300_Talas_HELP_Condition()
{
	if	Npc_KnowsInfo(hero, Nov_1300_Talas_UR)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return 1;
	};
};
FUNC void  Nov_1300_Talas_HELP_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_Info_15_01"); //Pomùžu ti pøinést zpátky ten almanach.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_02"); //Opravdu? Pøepadli mì goblini! A teï se po mnì chce, abych za nimi šel a pøinesl tu knihu zpátky!
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_03"); //Mám pro tebe návrh. Ukážu ti cestu k almanachu, abys ho mohl dostat nazpìt.

	Info_ClearChoices	(Nov_1300_Talas_HELP);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Souhlasím.",Nov_1300_Talas_HELP_OK);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Bude tì to stát 30 nugetù.",Nov_1300_Talas_HELP_BRING);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Dej mi 50 nugetù a já budu pøitom.",Nov_1300_Talas_HELP_MORE);
	
};  

func void Nov_1300_Talas_HELP_OK ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_OK_15_01"); //Souhlasím.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_OK_02_02"); //Dobøe, až budeš pøipraven, mùžeme vyrazit.
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_BRING ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_BRING_15_01"); //Bude tì to stát 30 nugetù.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_BRING_02_02"); //Dobøe, až budeš pøipraven, mùžeme vyrazit.
	CreateInvItems		(self,ItMiNugget,30);
	B_GiveInvItems      (self,hero,ItMiNugget,30);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_MORE ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_MORE_15_01"); //Dej mi 50 nugetù a já budu pøitom.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_MORE_02_02"); //Cože? To je krádež! Dobrá teda, øekni mi, až budeš pøipraven.
	CreateInvItems		(self,ItMiNugget,50);
	B_GiveInvItems      (self,hero,ItMiNugget,50);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};

// ***************************** INFOS ****************************************//
instance  Nov_1300_Talas_READY (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_READY_Condition;
	information		= Nov_1300_Talas_READY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jsem pøipraven, mùžeme vyrazit."; 
};

FUNC int  Nov_1300_Talas_READY_Condition()
{
	if	Npc_KnowsInfo(hero, Nov_1300_Talas_HELP)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_READY_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_READY_Info_15_01"); //Jsem pøipraven, mùžeme vyrazit.
	AI_Output			(self, other,"Nov_1300_Talas_READY_Info_02_02"); //Dobøe. Pojï za mnou.
	
	B_LogEntry		(CH2_Book,"Nabídl jsem Talasovi, že pro nìj získám zpìt rukopis. Chce mì dovést na místo, kde kniha je."); 
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"GOBBOCAVE");
	AI_StopProcessInfos	(self);
	
};  

// ***************************** AN DER BRÜCKE ****************************************//
instance  Nov_1300_Talas_BRIDGE (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BRIDGE_Condition;
	information		= Nov_1300_Talas_BRIDGE_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BRIDGE_Condition()
{
	if 	(Npc_KnowsInfo (hero, Nov_1300_Talas_READY ))
	&&	(Npc_GetDistToWP(self, "LOCATION_29_02")<1000)
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_BRIDGE_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_01"); //Tyhle proklaté malé bestie žijí v jeskyni pod mostem. Buï opatrný!
	AI_Output			(other, self,"Nov_1300_Talas_BRIDGE_Info_15_02"); //Ty nepùjdeš se mnou?
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_03"); //Poèkám tady a... budu... krýt naši únikovou cestu.

	B_LogEntry		(CH2_Book,"Stojíme pøed jeskyní goblinù. Ten zbabìlý novic vážnì chce, abych šel dovnitø sám.");
};

// ***************************** ZURÜCK INS LAGER ****************************************//
instance  Nov_1300_Talas_BACK (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BACK_Condition;
	information		= Nov_1300_Talas_BACK_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BACK_Condition()
{
	if 	(Npc_KnowsInfo (hero, Nov_1300_Talas_BRIDGE ))
	&&	(Npc_HasItems (hero,ItWrFokusbuch))
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_BACK_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BACK_Info_02_01"); //Máš ten almanach! Výbornì! Pojïme zpátky do tábora.

	B_LogEntry		(CH2_Book,"Našel jsem rukopis a spoleènì s Talasem jej odneseme do tábora v bažinách.");

	Npc_ExchangeRoutine	(self,"RETURNTOCAMP");
	AI_StopProcessInfos	(self);
};

// ***************************** Zurück im Lager ****************************************//
instance  Nov_1300_Talas_RETURNED (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_RETURNED_Condition;
	information		= Nov_1300_Talas_RETURNED_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_RETURNED_Condition()
{
	if	(Npc_KnowsInfo (hero, Nov_1300_Talas_BACK ))
	&&	Npc_HasItems (hero,ItWrFokusbuch)
	&&	(Npc_GetDistToWP  (self, "PSI_START")<1000)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Nov_1300_Talas_RETURNED_Info()
{
	AI_Output			(self, other,"Info_Talas_RETURNED_02_01"); //Jsme zpátky. Pøedej ten almanach Corovi Kalomovi radìji hned.
	AI_Output			(other, self,"Info_Talas_RETURNED_15_02"); //Dávej pozor, aby ses nevysílil.
	AI_Output			(self, other,"Info_Talas_RETURNED_02_03"); //Nemìj obavy, nevysílím! Nemusíš si se mnou dìlat starosti.

	B_LogEntry		(CH2_Book,"Už jsme zpìt v táboøe v bažinách. Talas je nejvìtší zbabìlec, jakého jsem kdy potkal. Pøedám Cor Kalomovi rukopis sám.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"BackInCamp");
	AI_StopProcessInfos	(self);
};


// ***************************** zum OGY ****************************************//
instance  Nov_1300_Talas_OGY (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_OGY_Condition;
	information		= Nov_1300_Talas_OGY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Poslal mì Cor Angar."; 
};

FUNC int  Nov_1300_Talas_OGY_Condition()
{
	if ( Npc_KnowsInfo ( hero, GUR_1202_CorAngar_WHERE ))
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_OGY_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_OGY_15_01"); //Poslal mì Cor Angar. Øekl, že mì máš dovést k skøetímu pohøebišti, abych tam našel Baala Lukora a jeho templáøe.
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_02"); //Tak jsem zase poslíèek. Proklatì!!! Nemìl jsem ten almanach nikdy ztratit...
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_03"); //Tak dobrá, pojï se mnou.
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"OGY");
};  

// ***************************** am OGY ****************************************//
instance  Nov_1300_Talas_BACKAGAIN (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BACKAGAIN_Condition;
	information		= Nov_1300_Talas_BACKAGAIN_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BACKAGAIN_Condition()
{
	if ( Npc_GetDistToWP(self,"OW_PATH_011")<1000 )
	{
		return 1;
	};
};

FUNC void  Nov_1300_Talas_BACKAGAIN_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_01"); //Pøes ten most tì nepøevedu, nechci spáchat sebevraždu.
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_02"); //Musíš být blázen, když tam jdeš. Ani Baal Lukor se svými templáøi se už nevrátil.
	AI_Output			(other, self,"Nov_1300_Talas_BACKAGAIN_Info_15_03"); //Uvidíme, co se pøihodí. Vra se do tábora, já pøijdu pozdìji.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"ReturnToCampAgain");
	
};

 
