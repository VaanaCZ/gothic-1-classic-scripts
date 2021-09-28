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
	description = "¿Qué estás haciendo aquí?";
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
	AI_Output			(other, self,"GRD_262_Aaron_CHEST_Info_15_01"); //¿Qué estás haciendo aquí?
	AI_Output			(self, other,"GRD_262_Aaron_CHEST_Info_09_02"); //Vigilo a los cavadores como Snipes para asegurar que mantengan las manos alejadas de mi cofre.
};

//***************** BLUFF *****************************
instance  GRD_262_Aaron_BLUFF (C_INFO)
{
	npc				= GRD_262_Aaron;
	condition		= GRD_262_Aaron_BLUFF_Condition;
	information		= GRD_262_Aaron_BLUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= "(Alejar a Aaron)"; 
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
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Me manda Ian. ¡Debes ir a verle enseguida!",GRD_262_Aaron_BLUFF_IAN);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"He oído que hay hampones en la mina.",GRD_262_Aaron_BLUFF_BANDIT);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"¡Los cavadores han encontrado una pepita de mineral enorme!",GRD_262_Aaron_BLUFF_ORE);
};

FUNC void   GRD_262_Aaron_BLUFF_ORE ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_ORE_15_01");//¡Los cavadores han encontrado una pepita de mineral enorme!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_ORE_09_02");//¿Y qué?
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_ORE_15_03");//¡Tienes que echarle un vistazo!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_ORE_09_04");//Olvídalo.
};  
FUNC VOID GRD_262_Aaron_BLUFF_BANDIT ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_BANDIT_15_01"); //He oído que hay hampones en la mina. ¡Quieren el mineral!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_BANDIT_09_02"); //¿Crees que soy estúpido? ¡No se atreverían a hacer algo así!
};
func void  GRD_262_Aaron_BLUFF_IAN()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_IAN_15_01"); //Me manda Ian. ¡Debes ir a verle enseguida!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_IAN_09_02"); //¿Qué quiere?
	
	Info_ClearChoices	(GRD_262_Aaron_BLUFF);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Ni idea.",GRD_262_Aaron_BLUFF_UGLY);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Te matará.",GRD_262_Aaron_BLUFF_BAD);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Quiere recompensarte.",GRD_262_Aaron_BLUFF_GOOD);
};  
func void GRD_262_Aaron_BLUFF_GOOD ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_GOOD_15_01"); //Quiere recompensarte por tu buen trabajo.
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_GOOD_09_02"); //¿Ah, sí? Creo que será mejor que te vayas.
	Npc_SetTempAttitude (self, ATT_ANGRY);
	AI_StopProcessInfos	(self);
};
func void 	GRD_262_Aaron_BLUFF_BAD ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_BAD_15_01"); //Te va a matar porque eres un gandul.
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_BAD_09_02"); //Bueno, eso no es ninguna novedad. ¡Lárgate!
	AI_StopProcessInfos	(self);
};
func void GRD_262_Aaron_BLUFF_UGLY()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_UGLY_15_01"); //Ni idea. ¡Te lo dirá Ian en persona! ¿Crees que me diría algo así?
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_UGLY_09_02"); //¡Entonces iré a verle!

	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine	(self,	"trick");
	
	Aaron_lock = LOG_RUNNING;
	Snipes_Deal = LOG_SUCCESS;
	GRD_262_Aaron_BLUFF.permanent = 0;
	
	B_LogEntry		(CH2_SnipesDeal,"He alejado a Aaron del cofre con la excusa de que Ian quería verle. Espero que se lo tome con buen humor.");
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
	AI_Output			(self, other,"Info_Aaron_PISSED_09_01"); //¡¡¡OYE, TÚ!!! Si vuelves a intentar ponerme en ridículo, te la vas a cargar. ¿Te enteras?
	AI_RemoveWeapon		(self);

	Npc_ExchangeRoutine	(self,	"start");
	Aaron_lock = LOG_SUCCESS;
	
	B_LogEntry		(CH2_SnipesDeal,"He vuelto a encontrarme con Aaron; ciertamente, NO se lo ha tomado muy bien."); 
};

// ***************** Schlüssel verkaufen *****************************
instance  GRD_262_Aaron_SELL (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_SELL_Condition;
	information	=  GRD_262_Aaron_SELL_Info;
	important	= 0;	
	permanent	= 0;
	description = "Oye, ¿no echas en falta tu llave?";
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
	AI_Output			(other, self,"Info_Aaron_SELL_15_01"); //Oye, ¿no echas en falta la llave de tu cofre?
	AI_Output			(self, other,"Info_Aaron_SELL_09_02"); //Efectivamente. No quiero ni pensar cómo es que sabes de la existencia de la llave.
	AI_Output			(self, other,"Info_Aaron_SELL_09_03"); //Pero te daré 20 pepitas si la recuperas.

	B_LogEntry		(CH2_SnipesDeal,"¡Aaron me ha ofrecido 20 pepitas para conseguirle las llaves de su cofre!"); 
};

// ***************** Schlüssel verkaufen 2*****************************
instance  GRD_262_Aaron_SELLNOW (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_SELLNOW_Condition;
	information	=  GRD_262_Aaron_SELLNOW_Info;
	important	= 0;	
	permanent	= 0;
	description = "(Vender la llave)";
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
	AI_Output			(other, self,"Info_Aaron_SELLNOW_15_01"); //Aquí tienes tu llave.
	AI_Output			(self, other,"Info_Aaron_SELLNOW_09_02"); //Sí, es ésa. Bueno, aquí tienes tus 20 pepitas, como acordamos.
	AI_Output			(self, other,"Info_Aaron_SELLNOW_09_03"); //Pero será mejor que tengas cuidado en el futuro. ¡A partir de ahora te estaré vigilando!
	
	CreateInvItems 		(self,ItMinugget,20);
	B_GiveInvItems      (self,other,ItMinugget,20);
	B_GiveInvItems      (hero, self, ItKe_OM_02, 1);

	B_GiveXP			(XP_SellKeyToAaron);

	B_LogEntry		(CH2_SnipesDeal,"Le he vendido a Aaron su propia llave. En general, ¡he sacado un buen provecho de esto!"); 
	Log_SetTopicStatus	(CH2_SnipesDeal,	LOG_SUCCESS);
};


