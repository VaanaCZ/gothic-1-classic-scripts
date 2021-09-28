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
	AI_Output			(other, self,"Info_Exit_Info_15_001"); //Luego te veo.
	AI_Output			(self, other,"Info_Exit_Info_07_02"); //¡Vale, claro!
	
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
	description		= "¿Qué tal?"; 
};

FUNC int  VLK_584_Snipes_DEAL_Condition()
{
	return 1;
};


FUNC void  VLK_584_Snipes_DEAL_Info()
{
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_Info_15_01");//¿Cómo van las cosas?
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_02"); //Tengo una proposición que hacerte.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_03"); //¡Te daré 10 pepitas si consigues que Aaron deje en paz el cofre!
	Snipes_Deal = LOG_RUNNING;

	Log_CreateTopic		(CH2_SnipesDeal,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_SnipesDeal,	LOG_RUNNING);
	B_LogEntry		(CH2_SnipesDeal,"¡El cavador Snipes me ha ofrecido 10 pepitas de mineral para alejar al guardia Aaron de su cofre!");
};
// ***************** Infos *****************************  
instance  VLK_584_Snipes_DEAL_RUN (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_RUN_Condition;
	information		= VLK_584_Snipes_DEAL_RUN_Info;
	important		= 0;
	permanent		= 0;
	description		= "¡Me debes 10 pepitas!"; 
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
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_RUN_Info_15_01"); //¡Me debes 10 pepitas!
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_02"); //Toma, te has ganado las 10.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_03"); //Oh, una cosa más: también tengo la llave de su cofre. ¡Te las dejo en nada más que 30 pepitas!
	CreateInvItems		(self,ItMinugget,10);
	B_GiveInvItems      (self, other, ItMinugget,10);
	CreateInvItem 		(self,ItKe_OM_02);

	B_GiveXP			(XP_LureAaronAway);
	
	B_LogEntry		(CH2_SnipesDeal,"Snipes me ha ofrecido la llave del cofre de Aaron por otras 30 pepitas."); 
};  
// ***************** Infos *****************************
instance  VLK_584_Snipes_DEAL_2 (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_2_Condition;
	information		= VLK_584_Snipes_DEAL_2_Info;
	important		= 0;
	permanent		= 1;
	description		= "(Comprar llave)"; 
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
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_01");//Dame la llave.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_02");//Has hecho una buena adquisición.
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_03");//Me pregunto qué sacas tú de ello.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_04");//Siempre me alegra meterles una por alto a los guardias. Y si hubieran encontrado los contenidos del cofre en mi posesión, sería hombre muerto.
		
		B_GiveInvItems 	(hero, self, ItMiNugget,30);
		B_GiveInvItems 	(self, hero, ItKe_OM_02, 1);
		VLK_584_Snipes_DEAL_2.permanent = 0;
	
		B_LogEntry		(CH2_SnipesDeal,"¡Le he comprado a Snipes la llave del cofre! Me pregunto qué hará Aaron cuando se lo cuente."); 
	}
	else
	{
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_05"); //¡Dije 30 pepitas! ¡Dame las pepitas y yo te daré la llave!
	};
};  
