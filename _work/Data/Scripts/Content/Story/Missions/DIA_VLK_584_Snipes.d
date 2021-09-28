// ************************ EXIT **************************

instance  VLK_584_Snipes_Exit (C_INFO)
{
	npc			=  VLK_584_Snipes;
	nr			=  999;
	condition	=  VLK_584_Snipes_Exit_Condition;
	information	=  VLK_584_Snipes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_584_Snipes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_584_Snipes_Exit_Info()
{
	AI_Output			(other, self,"Info_Exit_Info_15_001"); //Ještì se uvidíme!
	AI_Output			(self, other,"Info_Exit_Info_07_02"); //Ano, jistì!
	
	AI_StopProcessInfos	( self );
};

// ***************** Infos *****************************
instance  VLK_584_Snipes_DEAL (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_Condition;
	information		= VLK_584_Snipes_DEAL_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak to jde?"; 
};

FUNC int  VLK_584_Snipes_DEAL_Condition()
{
	return 1;
};


FUNC void  VLK_584_Snipes_DEAL_Info()
{
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_Info_15_01");//Jak to jde?
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_02"); //Mìl bych nabídku.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_03"); //Když zaøídíš, aby Aaron odešel od truhly, dám ti 10 nugetù.
	Snipes_Deal = LOG_RUNNING;

	Log_CreateTopic		(CH2_SnipesDeal,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_SnipesDeal,	LOG_RUNNING);
	B_LogEntry		(CH2_SnipesDeal,"Kopáè Snipes mi nabídl 10 magických nugetù za to, že odlákám strážce Aarona od jeho truhlice!");
};
// ***************** Infos *****************************  
instance  VLK_584_Snipes_DEAL_RUN (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_RUN_Condition;
	information		= VLK_584_Snipes_DEAL_RUN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Dlužíš mi 10 nugetù!"; 
};

FUNC int  VLK_584_Snipes_DEAL_RUN_Condition()
{
	if (Snipes_deal == LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC void  VLK_584_Snipes_DEAL_RUN_Info()
{
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_RUN_Info_15_01"); //Dlužíš mi 10 nugetù!
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_02"); //Tady, tìch 10 nugetù sis opravdu vydìlal.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_03"); //Och, a ještì nìco: mám taky klíè od jeho truhly, Pro tebe... jen 30 nugetù.
	CreateInvItems		(self,ItMinugget,10);
	B_GiveInvItems      (self, other, ItMinugget,10);
	CreateInvItem 		(self,ItKe_OM_02);

	B_GiveXP			(XP_LureAaronAway);
	
	B_LogEntry		(CH2_SnipesDeal,"Za dalších 30 nugetù mi nabídl klíè od Aaronovy truhlice."); 
};  
// ***************** Infos *****************************
instance  VLK_584_Snipes_DEAL_2 (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_2_Condition;
	information		= VLK_584_Snipes_DEAL_2_Info;
	important		= 0;
	permanent		= 1;
	description		= "(kup klíè)"; 
};

FUNC int  VLK_584_Snipes_DEAL_2_Condition()
{
	if ( Npc_KnowsInfo (hero, VLK_584_Snipes_DEAL_RUN) )
	&& (Npc_HasItems   (self,ItKe_OM_02))
	{
	return 1;
	};
};


FUNC void  VLK_584_Snipes_DEAL_2_Info()
{
	
	if ( Npc_HasItems (hero, ItMinugget)  >= 30 ) 
	{
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_01");//Dej mi ten klíè.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_02");//Udìlal jsi dobrý obchod!
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_03");//Zajímalo by mì, co z toho máš ty.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_04");//Vždycky mì tìší, když mùžu setøít nìkoho ze strážcù. A jestli najdou obsah té truhly u mì, jsem mrtvej muž.
		
		B_GiveInvItems 	(hero, self, ItMiNugget,30);
		B_GiveInvItems 	(self, hero, ItKe_OM_02, 1);
		VLK_584_Snipes_DEAL_2.permanent = 0;
	
		B_LogEntry		(CH2_SnipesDeal,"Koupil jsem od Snipese klíè od té truhlice! Jsem zvìdav, co Aaron øekne na to, až mu o tom povím?"); 
	}
	else
	{
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_05"); //Øekl jsem 30 nugetù! Dej mi rudu a já ti dám klíè!
	};
};  
