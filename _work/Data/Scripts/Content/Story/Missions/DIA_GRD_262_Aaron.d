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
	description = "Co tady d�l�?";
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
	AI_Output			(other, self,"GRD_262_Aaron_CHEST_Info_15_01"); //Co tady d�l�?
	AI_Output			(self, other,"GRD_262_Aaron_CHEST_Info_09_02"); //D�v�m pozor na kop��e, jako je Snipes, abych se ujistil, �e maj� ruce daleko od m� truhly.
};

//***************** BLUFF *****************************
instance  GRD_262_Aaron_BLUFF (C_INFO)
{
	npc				= GRD_262_Aaron;
	condition		= GRD_262_Aaron_BLUFF_Condition;
	information		= GRD_262_Aaron_BLUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= "(odl�kej Aarona)"; 
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
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Poslal m� Ian. M�l bys za n�m ihned zaj�t!",GRD_262_Aaron_BLUFF_IAN);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Sly�el jsem, �e v dole jsou banditi. Cht�j� rudu!",GRD_262_Aaron_BLUFF_BANDIT);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Kop��i na�li masivn� magick� nuget!",GRD_262_Aaron_BLUFF_ORE);
};

FUNC void   GRD_262_Aaron_BLUFF_ORE ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_ORE_15_01");//Kop��i na�li masivn� magick� nuget!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_ORE_09_02");//No a?
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_ORE_15_03");//Mus� na to dohl�dnout!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_ORE_09_04");//Na to zapome�!
};  
FUNC VOID GRD_262_Aaron_BLUFF_BANDIT ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_BANDIT_15_01"); //Sly�el jsem, �e v dole jsou banditi. Cht�j� rudu!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_BANDIT_09_02"); //Mysl�, �e jsem takov� hlup�k? N��eho takov�ho by se nikdy neodv�ili!
};
func void  GRD_262_Aaron_BLUFF_IAN()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_IAN_15_01"); //Poslal m� Ian. M�l bys za n�m ihned zaj�t!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_IAN_09_02"); //Co chce?
	
	Info_ClearChoices	(GRD_262_Aaron_BLUFF);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Netu��m.",GRD_262_Aaron_BLUFF_UGLY);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Zabije t�.",GRD_262_Aaron_BLUFF_BAD);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Chce ti d�t odm�nu.",GRD_262_Aaron_BLUFF_GOOD);
};  
func void GRD_262_Aaron_BLUFF_GOOD ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_GOOD_15_01"); //Chce ti d�t odm�nu za dobrou pr�ci.
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_GOOD_09_02"); //Opravdu? M�l bys rad�ji j�t.
	Npc_SetTempAttitude (self, ATT_ANGRY);
	AI_StopProcessInfos	(self);
};
func void 	GRD_262_Aaron_BLUFF_BAD ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_BAD_15_01"); //Zabije t�, proto�e jsi stra�n� l�nej!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_BAD_09_02"); //To nen� ��dn� novinka. Zmiz!
	AI_StopProcessInfos	(self);
};
func void GRD_262_Aaron_BLUFF_UGLY()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_UGLY_15_01"); //Nev�m. To ti �ekne s�m Ian. Mysl�, �e by mi n�co takov�ho �ekl?
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_UGLY_09_02"); //Pak teda za n�m p�jdu!

	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine	(self,	"trick");
	
	Aaron_lock = LOG_RUNNING;
	Snipes_Deal = LOG_SUCCESS;
	GRD_262_Aaron_BLUFF.permanent = 0;
	
	B_LogEntry		(CH2_SnipesDeal,"Odl�kal jsem Aarona pry� od truhlice pod z�minkou, �e ho chce vid�t Ian. Douf�m, �e to vezme jako vtip.");
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
	AI_Output			(self, other,"Info_Aaron_PISSED_09_01"); //HEJ, TY!!! Jestli se ze m� je�t� pokus� ud�lat hlup�ka, pak si ��k� o po��dnej v�prask, jasn�?
	AI_RemoveWeapon		(self);

	Npc_ExchangeRoutine	(self,	"start");
	Aaron_lock = LOG_SUCCESS;
	
	B_LogEntry		(CH2_SnipesDeal,"Znovu jsem potkal Aarona, kter� to v�ak NEVZAL jako dobr� vtip."); 
};

// ***************** Schl�ssel verkaufen *****************************
instance  GRD_262_Aaron_SELL (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_SELL_Condition;
	information	=  GRD_262_Aaron_SELL_Info;
	important	= 0;	
	permanent	= 0;
	description = "Hej, neztratil jsi kl��?";
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
	AI_Output			(other, self,"Info_Aaron_SELL_15_01"); //Hej, nepostr�d� kl�� od truhly?
	AI_Output			(self, other,"Info_Aaron_SELL_09_02"); //Jist�. Akor�t netu��m, jak ani pro� v� o tom kl��i.
	AI_Output			(self, other,"Info_Aaron_SELL_09_03"); //D�m ti 20 nuget�, jestli mi ho p�inese� zp�tky.

	B_LogEntry		(CH2_SnipesDeal,"Aaron mi nab�dl 20 nuget�, kdy� mu d�m kl�� od jeho truhlice!"); 
};

// ***************** Schl�ssel verkaufen 2*****************************
instance  GRD_262_Aaron_SELLNOW (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_SELLNOW_Condition;
	information	=  GRD_262_Aaron_SELLNOW_Info;
	important	= 0;	
	permanent	= 0;
	description = "(prodej kl��)";
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
	AI_Output			(other, self,"Info_Aaron_SELLNOW_15_01"); //Tady je tv�j kl��.
	AI_Output			(self, other,"Info_Aaron_SELLNOW_09_02"); //Ano, to je on. Dobr�, tady je t�ch 20 nuget�, jak jsme se dohodli.
	AI_Output			(self, other,"Info_Aaron_SELLNOW_09_03"); //M�l bys ale p��t� d�vat lep�� pozor. Od te� na tebe budu dohl�et.
	
	CreateInvItems 		(self,ItMinugget,20);
	B_GiveInvItems      (self,other,ItMinugget,20);
	B_GiveInvItems      (hero, self, ItKe_OM_02, 1);

	B_GiveXP			(XP_SellKeyToAaron);

	B_LogEntry		(CH2_SnipesDeal,"Prodal jsem Aaronovi jeho vlastn� kl��. Celkem vzato, nakonec jsem na tom vyd�lal!"); 
	Log_SetTopicStatus	(CH2_SnipesDeal,	LOG_SUCCESS);
};


