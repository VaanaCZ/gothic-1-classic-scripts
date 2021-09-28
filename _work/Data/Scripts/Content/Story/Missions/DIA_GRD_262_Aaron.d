// ************************ EXIT **************************

instance  GRD_262_Aaron_Exit (C_INFO)
{
	npc			=  GRD_262_Aaron;
	nr			=  999;
	condition	=  GRD_262_Aaron_Exit_Condition;
	information	=  GRD_262_Aaron_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  GRD_262_Aaron_Exit_Condition()
{
	return 1;
};

FUNC VOID  GRD_262_Aaron_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//************************ EXIT **************************
instance  GRD_262_Aaron_CHEST (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_CHEST_Condition;
	information	=  GRD_262_Aaron_CHEST_Info;
	important	= 0;	
	permanent	= 1;
	description = "Co tady dìláš?";
};                       

FUNC int  GRD_262_Aaron_CHEST_Condition()
{	
	if ( Npc_GetDistToWp (self,"OM_CAVE1_34") <400 )
	&& (!Npc_KnowsInfo   (hero,GRD_262_Aaron_BLUFF))
	{
		return 1;
	};
};
FUNC VOID  GRD_262_Aaron_CHEST_Info()
{
	AI_Output			(other, self,"GRD_262_Aaron_CHEST_Info_15_01"); //Co tady dìláš?
	AI_Output			(self, other,"GRD_262_Aaron_CHEST_Info_09_02"); //Dávám pozor na kopáèe, jako je Snipes, abych se ujistil, že mají ruce daleko od mé truhly.
};

//***************** BLUFF *****************************
instance  GRD_262_Aaron_BLUFF (C_INFO)
{
	npc				= GRD_262_Aaron;
	condition		= GRD_262_Aaron_BLUFF_Condition;
	information		= GRD_262_Aaron_BLUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= "(odlákej Aarona)"; 
};

FUNC int  GRD_262_Aaron_BLUFF_Condition()
{	
	if	Npc_KnowsInfo (hero,VLK_584_Snipes_DEAL)
	&&	(Aaron_lock != LOG_RUNNING)
	&&	(Aaron_lock != LOG_SUCCESS)
	{
		return 1;
	};

};
FUNC void  GRD_262_Aaron_BLUFF_Info()
{
	Info_ClearChoices	(GRD_262_Aaron_BLUFF);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,DIALOG_BACK												,GRD_262_Aaron_BLUFF_BACK);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Poslal mì Ian. Mìl bys za ním ihned zajít!",GRD_262_Aaron_BLUFF_IAN);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Slyšel jsem, že v dole jsou banditi. Chtìjí rudu!",GRD_262_Aaron_BLUFF_BANDIT);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Kopáèi našli masivní magický nuget!",GRD_262_Aaron_BLUFF_ORE);
};

FUNC void   GRD_262_Aaron_BLUFF_ORE ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_ORE_15_01");//Kopáèi našli masivní magický nuget!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_ORE_09_02");//No a?
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_ORE_15_03");//Musíš na to dohlédnout!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_ORE_09_04");//Na to zapomeò!
};  
FUNC VOID GRD_262_Aaron_BLUFF_BANDIT ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_BANDIT_15_01"); //Slyšel jsem, že v dole jsou banditi. Chtìjí rudu!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_BANDIT_09_02"); //Myslíš, že jsem takový hlupák? Nìèeho takového by se nikdy neodvážili!
};
func void  GRD_262_Aaron_BLUFF_IAN()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_IAN_15_01"); //Poslal mì Ian. Mìl bys za ním ihned zajít!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_IAN_09_02"); //Co chce?
	
	Info_ClearChoices	(GRD_262_Aaron_BLUFF);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Netuším.",GRD_262_Aaron_BLUFF_UGLY);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Zabije tì.",GRD_262_Aaron_BLUFF_BAD);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Chce ti dát odmìnu.",GRD_262_Aaron_BLUFF_GOOD);
};  
func void GRD_262_Aaron_BLUFF_GOOD ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_GOOD_15_01"); //Chce ti dát odmìnu za dobrou práci.
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_GOOD_09_02"); //Opravdu? Mìl bys radìji jít.
	Npc_SetTempAttitude (self, ATT_ANGRY);
	AI_StopProcessInfos	(self);
};
func void 	GRD_262_Aaron_BLUFF_BAD ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_BAD_15_01"); //Zabije tì, protože jsi strašnì línej!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_BAD_09_02"); //To není žádná novinka. Zmiz!
	AI_StopProcessInfos	(self);
};
func void GRD_262_Aaron_BLUFF_UGLY()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_UGLY_15_01"); //Nevím. To ti øekne sám Ian. Myslíš, že by mi nìco takového øekl?
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_UGLY_09_02"); //Pak teda za ním pùjdu!

	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine	(self,	"trick");
	
	Aaron_lock = LOG_RUNNING;
	Snipes_Deal = LOG_SUCCESS;
	GRD_262_Aaron_BLUFF.permanent = 0;
	
	B_LogEntry		(CH2_SnipesDeal,"Odlákal jsem Aarona pryè od truhlice pod záminkou, že ho chce vidìt Ian. Doufám, že to vezme jako vtip.");
};

func void GRD_262_Aaron_BLUFF_BACK()
{
	Info_ClearChoices	(GRD_262_Aaron_BLUFF);
};

// ***************** Aaron ist angepisst *****************************
instance  GRD_262_Aaron_PISSED (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_PISSED_Condition;
	information	=  GRD_262_Aaron_PISSED_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC int  GRD_262_Aaron_PISSED_Condition()
{
	if	(Aaron_lock == LOG_RUNNING)
	&&	(Npc_GetDistToWP(hero, "OM_CAVE1_47") < 1000)
	{
		return TRUE;
	};
};
FUNC VOID  GRD_262_Aaron_PISSED_Info()
{
	AI_DrawWeapon		(self);
	AI_Output			(self, other,"Info_Aaron_PISSED_09_01"); //HEJ, TY!!! Jestli se ze mì ještì pokusíš udìlat hlupáka, pak si øíkáš o poøádnej výprask, jasný?
	AI_RemoveWeapon		(self);

	Npc_ExchangeRoutine	(self,	"start");
	Aaron_lock = LOG_SUCCESS;
	
	B_LogEntry		(CH2_SnipesDeal,"Znovu jsem potkal Aarona, který to však NEVZAL jako dobrý vtip."); 
};

// ***************** Schlüssel verkaufen *****************************
instance  GRD_262_Aaron_SELL (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_SELL_Condition;
	information	=  GRD_262_Aaron_SELL_Info;
	important	= 0;	
	permanent	= 0;
	description = "Hej, neztratil jsi klíè?";
};                       

FUNC int  GRD_262_Aaron_SELL_Condition()
{
	if ( Npc_KnowsInfo (hero,VLK_584_Snipes_DEAL_RUN )) 
	{
		return 1;
	};
};

FUNC VOID  GRD_262_Aaron_SELL_Info()
{
	AI_Output			(other, self,"Info_Aaron_SELL_15_01"); //Hej, nepostrádáš klíè od truhly?
	AI_Output			(self, other,"Info_Aaron_SELL_09_02"); //Jistì. Akorát netuším, jak ani proè víš o tom klíèi.
	AI_Output			(self, other,"Info_Aaron_SELL_09_03"); //Dám ti 20 nugetù, jestli mi ho pøineseš zpátky.

	B_LogEntry		(CH2_SnipesDeal,"Aaron mi nabídl 20 nugetù, když mu dám klíè od jeho truhlice!"); 
};

// ***************** Schlüssel verkaufen 2*****************************
instance  GRD_262_Aaron_SELLNOW (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_SELLNOW_Condition;
	information	=  GRD_262_Aaron_SELLNOW_Info;
	important	= 0;	
	permanent	= 0;
	description = "(prodej klíè)";
};                       

FUNC int  GRD_262_Aaron_SELLNOW_Condition()
{
	if ( Npc_KnowsInfo (hero,GRD_262_Aaron_SELL) ) && ( Npc_HasItems ( hero,ItKe_OM_02))
	{
		return 1;
	};
};
FUNC VOID  GRD_262_Aaron_SELLNOW_Info()
{
	AI_Output			(other, self,"Info_Aaron_SELLNOW_15_01"); //Tady je tvùj klíè.
	AI_Output			(self, other,"Info_Aaron_SELLNOW_09_02"); //Ano, to je on. Dobrá, tady je tìch 20 nugetù, jak jsme se dohodli.
	AI_Output			(self, other,"Info_Aaron_SELLNOW_09_03"); //Mìl bys ale pøíštì dávat lepší pozor. Od teï na tebe budu dohlížet.
	
	CreateInvItems 		(self,ItMinugget,20);
	B_GiveInvItems      (self,other,ItMinugget,20);
	B_GiveInvItems      (hero, self, ItKe_OM_02, 1);

	B_GiveXP			(XP_SellKeyToAaron);

	B_LogEntry		(CH2_SnipesDeal,"Prodal jsem Aaronovi jeho vlastní klíè. Celkem vzato, nakonec jsem na tom vydìlal!"); 
	Log_SetTopicStatus	(CH2_SnipesDeal,	LOG_SUCCESS);
};


