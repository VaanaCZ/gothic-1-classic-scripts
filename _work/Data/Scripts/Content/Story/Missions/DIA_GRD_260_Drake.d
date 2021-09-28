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
	AI_Output			(other,	self,"Info_Exit_Info_15_01"); //Увидимся.
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
	description		= "Чего следует остерегаться в шахтах?";
};

FUNC INT  Grd_260_Drake_Gefahr_Condition()
{
		return (Npc_KnowsInfo (hero,Grd_260_Drake_Mine));
};

func VOID  Grd_260_Drake_Gefahr_Info()
{

	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_01");//Чего следует остерегаться в шахтах?
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//В основном, ползунов - это опасные твари.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//Из-за них нам даже пришлось оставить несколько пещер. К тому же, они сожрали нескольких рудокопов.
	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//Расскажи мне о ползунах.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//Ох, у меня так пересохло во рту...
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//Неси пиво, и я расскажу тебе о ползунах.


};
/**************** CRAWLER, MEHR	GEFAHREN INFOS *********************/

INSTANCE  Grd_260_Drake_Crawler_Okay (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Crawler_Okay_Condition;
	information		= Grd_260_Drake_Crawler_Okay_Info;
	important		= 0;
	permanent		= 0;
	description		= "(отдать пиво)";
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
		AI_Output			(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");//Вот, выпей за мое здоровье!

		B_GiveInvItems		(hero, self, ItFoBeer, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,ItFobeer);

		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//Спасибо. Ну, ползуны живут большими стаями, в основном, в боковых пещерах.
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//Они еще ни разу не нападали на нас здесь, в главной шахте. Если увидишь одного из них, беги!
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//Или прижмись к стене - так у тебя будет шанс спастись!

		//Grd_260_Drake_Crawler_Okay.permanent = 0;
	}
	else
	{
		AI_Output			(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//Ты что, шутишь? Я же сказал: неси пиво, потом поговорим!
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
	description		= "Что ты можешь сказать о шахте?";
};

FUNC int  Grd_260_Drake_Mine_Condition()
{
	return 1;
};
func void Grd_260_Drake_Mine_Info ()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Info_15_01");//Что ты можешь сказать о шахте?
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_02");//Ну, сейчас мы с тобой находимся в главной шахте. Вниз уходит целая система платформ.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_03");//Руду добывают повсюду, но следует остерегаться ползунов - их здесь тоже хватает.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_04");//Внизу у нас находится плавильня. Часть руды мы переплавляем здесь же для собственных нужд.


};
// ***************** MEHR MINE *****************************
instance  Grd_260_Drake_Mine_Mehr (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Mehr_Condition;
	information		= Grd_260_Drake_Mine_Mehr_Info;
	important		= 0;
	permanent		= 0;
	description		= "Расскажи мне еще что-нибудь о шахте.";
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
	AI_Output			(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//Расскажи мне об этом поподробнее!
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//Если хочешь узнать больше, отправляйся к Вайперу. Он плавильщик.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//Или поговори с Яном. Он здесь главный. Он заправляет всем в шахте.
	
};

// ***************** IAN *****************************
instance  Grd_260_Drake_Ian	(C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Ian_Condition;
	information		= Grd_260_Drake_Ian_Info;
	important		= 0;
	permanent		= 0;
	description		= "Где я могу найти Яна?";
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
	AI_Output			(other,self,"Grd_260_Drake_Ian_Info_15_01");//Где я могу найти Яна?
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_02");//Ты найдешь его в центре главной шахты, рядом со складом.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_03");//Да, и вот еще что. Ты ведь знаком с Торусом, так? Забудь о нем!
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_04");//Здесь командует только один человек, и это - Ян. Он у нас главный.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_05");//Если поссоришься с ним, поссоришься со всеми нами, усек?
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
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //Эй, ловко же ты расправился с ползунами! Ты заслуживаешь того, чтобы стать стражником!
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //Отправляйся в Старый Лагерь и поговори об этом с Торусом!

	Log_CreateTopic (GE_BecomeGuard,LOG_NOTE);
	B_LogEntry (GE_BecomeGuard,"Как только я принесу яйца, надо бы поговорить с Торусом. Возможно, он позволит мне присоединиться к стражам.");
};

