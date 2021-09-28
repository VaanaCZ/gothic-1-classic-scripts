
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
	description		= "Ty jsi Talas, ten co ho p�epadli."; 
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
	AI_Output			(other, self,"Nov_1300_Talas_UR_Info_15_01"); //Ty jsi Talas, ten co ho p�epadli.
	AI_Output			(self, other,"Nov_1300_Talas_UR_Info_02_02"); //Nech m� na pokoji, nechci o tom mluvit!
};  
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_HELP (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_HELP_Condition;
	information		= Nov_1300_Talas_HELP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Pom��u ti p�in�st zp�tky ten almanach."; 
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
	AI_Output			(other, self,"Nov_1300_Talas_HELP_Info_15_01"); //Pom��u ti p�in�st zp�tky ten almanach.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_02"); //Opravdu? P�epadli m� goblini! A te� se po mn� chce, abych za nimi �el a p�inesl tu knihu zp�tky!
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_03"); //M�m pro tebe n�vrh. Uk�u ti cestu k almanachu, abys ho mohl dostat nazp�t.

	Info_ClearChoices	(Nov_1300_Talas_HELP);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Souhlas�m.",Nov_1300_Talas_HELP_OK);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Bude t� to st�t 30 nuget�.",Nov_1300_Talas_HELP_BRING);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Dej mi 50 nuget� a j� budu p�itom.",Nov_1300_Talas_HELP_MORE);
	
};  

func void Nov_1300_Talas_HELP_OK ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_OK_15_01"); //Souhlas�m.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_OK_02_02"); //Dob�e, a� bude� p�ipraven, m��eme vyrazit.
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_BRING ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_BRING_15_01"); //Bude t� to st�t 30 nuget�.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_BRING_02_02"); //Dob�e, a� bude� p�ipraven, m��eme vyrazit.
	CreateInvItems		(self,ItMiNugget,30);
	B_GiveInvItems      (self,hero,ItMiNugget,30);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_MORE ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_MORE_15_01"); //Dej mi 50 nuget� a j� budu p�itom.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_MORE_02_02"); //Co�e? To je kr�de�! Dobr� teda, �ekni mi, a� bude� p�ipraven.
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
	description		= "Jsem p�ipraven, m��eme vyrazit."; 
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
	AI_Output			(other, self,"Nov_1300_Talas_READY_Info_15_01"); //Jsem p�ipraven, m��eme vyrazit.
	AI_Output			(self, other,"Nov_1300_Talas_READY_Info_02_02"); //Dob�e. Poj� za mnou.
	
	B_LogEntry		(CH2_Book,"Nab�dl jsem Talasovi, �e pro n�j z�sk�m zp�t rukopis. Chce m� dov�st na m�sto, kde kniha je."); 
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"GOBBOCAVE");
	AI_StopProcessInfos	(self);
	
};  

// ***************************** AN DER BR�CKE ****************************************//
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
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_01"); //Tyhle proklat� mal� bestie �ij� v jeskyni pod mostem. Bu� opatrn�!
	AI_Output			(other, self,"Nov_1300_Talas_BRIDGE_Info_15_02"); //Ty nep�jde� se mnou?
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_03"); //Po�k�m tady a... budu... kr�t na�i �nikovou cestu.

	B_LogEntry		(CH2_Book,"Stoj�me p�ed jeskyn� goblin�. Ten zbab�l� novic v�n� chce, abych �el dovnit� s�m.");
};

// ***************************** ZUR�CK INS LAGER ****************************************//
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
	AI_Output			(self, other,"Nov_1300_Talas_BACK_Info_02_01"); //M� ten almanach! V�born�! Poj�me zp�tky do t�bora.

	B_LogEntry		(CH2_Book,"Na�el jsem rukopis a spole�n� s Talasem jej odneseme do t�bora v ba�in�ch.");

	Npc_ExchangeRoutine	(self,"RETURNTOCAMP");
	AI_StopProcessInfos	(self);
};

// ***************************** Zur�ck im Lager ****************************************//
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
	AI_Output			(self, other,"Info_Talas_RETURNED_02_01"); //Jsme zp�tky. P�edej ten almanach Corovi Kalomovi rad�ji hned.
	AI_Output			(other, self,"Info_Talas_RETURNED_15_02"); //D�vej pozor, aby ses nevys�lil.
	AI_Output			(self, other,"Info_Talas_RETURNED_02_03"); //Nem�j obavy, nevys�l�m! Nemus� si se mnou d�lat starosti.

	B_LogEntry		(CH2_Book,"U� jsme zp�t v t�bo�e v ba�in�ch. Talas je nejv�t�� zbab�lec, jak�ho jsem kdy potkal. P�ed�m Cor Kalomovi rukopis s�m.");

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
	description		= "Poslal m� Cor Angar."; 
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
	AI_Output			(other, self,"Nov_1300_Talas_OGY_15_01"); //Poslal m� Cor Angar. �ekl, �e m� m� dov�st k sk�et�mu poh�ebi�ti, abych tam na�el Baala Lukora a jeho templ��e.
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_02"); //Tak jsem zase posl��ek. Proklat�!!! Nem�l jsem ten almanach nikdy ztratit...
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_03"); //Tak dobr�, poj� se mnou.
	
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
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_01"); //P�es ten most t� nep�evedu, nechci sp�chat sebevra�du.
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_02"); //Mus� b�t bl�zen, kdy� tam jde�. Ani Baal Lukor se sv�mi templ��i se u� nevr�til.
	AI_Output			(other, self,"Nov_1300_Talas_BACKAGAIN_Info_15_03"); //Uvid�me, co se p�ihod�. Vra� se do t�bora, j� p�ijdu pozd�ji.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"ReturnToCampAgain");
	
};

 
