// ************************	EXIT **************************

instance  Grd_260_Drake_Exit (C_INFO) //E1
{
	npc			=  Grd_260_Drake;
	nr			=  999;
	condition	=  Grd_260_Drake_Exit_Condition;
	information	=  Grd_260_Drake_Exit_Info;
	important	=  0;
	permanent	=  1;
	description	= DIALOG_ENDE;
};

FUNC int  Grd_260_Drake_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_260_Drake_Exit_Info()
{
	AI_Output			(other,	self,"Info_Exit_Info_15_01"); //До встречи!
	AI_StopProcessInfos	( self );
};
/**************** GEFAHREN *********************/

INSTANCE  Grd_260_Drake_Gefahr (C_INFO)	//E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Gefahr_Condition;
	information		= Grd_260_Drake_Gefahr_Info;
	important		= 0;
	permanent		= 0;
	description		= "Расскажи мне, чего здесь следует остерегаться.";
};

FUNC INT  Grd_260_Drake_Gefahr_Condition()
{
		return (Npc_KnowsInfo (hero,Grd_260_Drake_Mine));
};

func VOID  Grd_260_Drake_Gefahr_Info()
{

	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_01");//Расскажи мне, чего здесь следует остерегаться.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//Главную опасность представляют ползуны. 
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//Из-за них мы вынуждены были оставить несколько забоев. Они даже съели нескольких рудокопов.
	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//Расскажи мне о ползунах.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//У меня в горле совсем пересохло...
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//Если ты принесешь мне пиво, я расскажу тебе о них.


};
/**************** CRAWLER, MEHR	GEFAHREN INFOS *********************/

INSTANCE  Grd_260_Drake_Crawler_Okay (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Crawler_Okay_Condition;
	information		= Grd_260_Drake_Crawler_Okay_Info;
	important		= 0;
	permanent		= 0;
	description		= "(предложить пиво)";
};

FUNC INT  Grd_260_Drake_Crawler_Okay_Condition()
{
	if (Npc_KnowsInfo (hero,Grd_260_Drake_Gefahr))
	{
			return 1;
	};
};
FUNC void Grd_260_Drake_Crawler_Okay_Info()
{
	if	( Npc_HasItems (hero,ItFobeer) )
	{
		AI_Output			(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");//Вот, выпей это за мое здоровье!

		B_GiveInvItems		(hero, self, ItFoBeer, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,ItFobeer);

		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//Спасибо. Ползуны живут большими стаями в старых заброшенных забоях.
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//В основном стволе они еще ни на кого не нападали. Если ты наткнешься на ползуна, беги от него как можно скорее!
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//Или стань спиной к стене. Тогда, может быть, тебе удастся спастись.

		//Grd_260_Drake_Crawler_Okay.permanent = 0;
	}
	else
	{
		AI_Output			(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//Ты шутишь, да? Приходи, когда у тебя будет пиво.
   		Grd_260_Drake_Crawler_Okay.permanent = 1;
   };
};
// ***************** DIE MINE *****************************

instance  Grd_260_Drake_Mine (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Condition;
	information		= Grd_260_Drake_Mine_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ты можешь рассказать мне что-нибудь о шахте?";
};

FUNC int  Grd_260_Drake_Mine_Condition()
{
	return 1;
};
func void Grd_260_Drake_Mine_Info ()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Info_15_01");//Ты можешь рассказать мне что-нибудь о шахте?
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_02");//Мы находимся в главном стволе. Вниз можно спуститься с помощью системы переходов.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_03");//Рудокопы работают везде. Но будь осторожен, здесь очень много ползунов.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_04");//На нижнем горизонте стоит плавильня. Мы сами плавим небольшую часть добываемой руды.


};
// ***************** MEHR MINE *****************************
instance  Grd_260_Drake_Mine_Mehr (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Mehr_Condition;
	information		= Grd_260_Drake_Mine_Mehr_Info;
	important		= 0;
	permanent		= 0;
	description		= "Расскажи об этом что-нибудь еще.";
};

FUNC int  Grd_260_Drake_Mine_Mehr_Condition()
{
	if ( Npc_KnowsInfo (hero, Grd_260_Drake_Mine) )
	{
		return 1;
	};
};
func void  Grd_260_Drake_Mine_Mehr_Info	()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//Расскажи об этом что-нибудь еще.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//Я думаю, Вайпер сможет рассказать тебе больше. Спроси его. Он наш плавильщик.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//Или поговори с Яном. Он управляет всеми делами шахты. 
	
};

// ***************** IAN *****************************
instance  Grd_260_Drake_Ian	(C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Ian_Condition;
	information		= Grd_260_Drake_Ian_Info;
	important		= 0;
	permanent		= 0;
	description		= "Где мне найти Яна?";
};

FUNC int  Grd_260_Drake_Ian_Condition()
{
	if !(Npc_KnowsInfo (hero,STT_301_IAN_HI)) && ( Npc_KnowsInfo (hero,	Grd_260_Drake_Mine_Mehr))
	{
		return TRUE;
	};

};
FUNC void  Grd_260_Drake_Ian_Info()
{
	AI_Output			(other,self,"Grd_260_Drake_Ian_Info_15_01");//Где мне найти Яна?
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_02");//Он находится в центре главного ствола, возле склада.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_03");//Да, ты знаешь Торуса? Забудь здесь о нем!
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_04");//В шахте командует только один человек, и это Ян. Он у нас главный.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_05");//Если ты поссорился с ним, считай, что ты поссорился со всеми в шахте, понял?
};	 

/*------------------------------------------------------------------------
//						GARDEAUFNAHME								//
------------------------------------------------------------------------*/
instance Grd_260_Drake_GARDEAUFNAHME (C_INFO)
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_GARDEAUFNAHME_Condition;
	information		= Grd_260_Drake_GARDEAUFNAHME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_260_Drake_GARDEAUFNAHME_Condition()
{	
	if (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) 
	&& ( Npc_GetTrueGuild  (hero) == GIL_STT)
	&& (! Npc_KnowsInfo   (hero,Grd_264_Gardist_GARDEAUFNAHME))
	{
		return TRUE;
	};
};
func void  Grd_260_Drake_GARDEAUFNAHME_Info()
{
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //Эй! Ты отлично расправился с ползунами! Думаю, теперь ты заслуживаешь должности стражника.
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //Иди в Старый лагерь и поговори с Торусом!

	Log_CreateTopic (GE_BecomeGuard,LOG_NOTE);
	B_LogEntry (GE_BecomeGuard,"Когда я принесу яйца, я должен буду поговорить с Торусом. Может быть, он примет меня в стражники.");
};

