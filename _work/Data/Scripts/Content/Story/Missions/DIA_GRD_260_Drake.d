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
	AI_Output			(other,	self,"Info_Exit_Info_15_01"); //Do zobaczenia!
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
	description		= "Na co powinienem uważać w kopalni?";
};

FUNC INT  Grd_260_Drake_Gefahr_Condition()
{
		return (Npc_KnowsInfo (hero,Grd_260_Drake_Mine));
};

func VOID  Grd_260_Drake_Gefahr_Info()
{

	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_01");//Na co powinienem uważać w kopalni?
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//Przede wszystkim na pełzacze. Groźne bestie.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//To przez nie musieliśmy zrezygnować z wydobycia w paru jaskiniach. Niestety, pożarły nam już sporą grupę Kopaczy.
	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//Opowiedz mi o pełzaczach.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//Wiesz, zaschło mi w ustach...
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//Przynieś mi piwo, to ci opowiem o pełzaczach.


};
/**************** CRAWLER, MEHR	GEFAHREN INFOS *********************/

INSTANCE  Grd_260_Drake_Crawler_Okay (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Crawler_Okay_Condition;
	information		= Grd_260_Drake_Crawler_Okay_Info;
	important		= 0;
	permanent		= 0;
	description		= "(daj piwo)";
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
		AI_Output			(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");//Proszę, wypij moje zdrowie!

		B_GiveInvItems		(hero, self, ItFoBeer, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,ItFobeer);

		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//Dzięki. A co do pełzaczy - żyją w dużych stadach, głównie w bocznych jaskiniach.
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//Jeszcze nigdy nie widziano ich tutaj, w głównym szybie. Gdybyś spotkał kiedyś pełzacza, wiej ile sił w nogach!
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//Albo stań plecami do ściany. W ten sposób będziesz miał jakąś szansę!

		//Grd_260_Drake_Crawler_Okay.permanent = 0;
	}
	else
	{
		AI_Output			(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//Żartujesz sobie ze mnie? Wróć, jak będziesz miał dla mnie piwo.
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
	description		= "Możesz mi opowiedzieć o tej kopalni?";
};

FUNC int  Grd_260_Drake_Mine_Condition()
{
	return 1;
};
func void Grd_260_Drake_Mine_Info ()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Info_15_01");//Możesz mi opowiedzieć o tej kopalni?
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_02");//Stoimy teraz w głównym szybie. Na dół można zejść po rusztowaniach.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_03");//Wszędzie dookoła Kopacze wydobywają rudę. Musisz bardzo uważać na pełzacze. One też są wszędzie dookoła!
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_04");//Na samym dole, część wydobytej rudy przeznaczona do wykorzystania tutaj jest od razu przetapiana. 


};
// ***************** MEHR MINE *****************************
instance  Grd_260_Drake_Mine_Mehr (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Mehr_Condition;
	information		= Grd_260_Drake_Mine_Mehr_Info;
	important		= 0;
	permanent		= 0;
	description		= "Opowiedz mi o tym coś więcej!";
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
	AI_Output			(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//Opowiedz mi o tym coś więcej!
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//Jeśli chcesz wiedzieć więcej, pogadaj z Wężem. On zajmuje się wytopem.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//Albo zapytaj Iana. On tu rządzi. Odpowiada za organizację pracy w całej kopalni.
	
};

// ***************** IAN *****************************
instance  Grd_260_Drake_Ian	(C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Ian_Condition;
	information		= Grd_260_Drake_Ian_Info;
	important		= 0;
	permanent		= 0;
	description		= "Gdzie mogę znaleźć Iana?";
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
	AI_Output			(other,self,"Grd_260_Drake_Ian_Info_15_01");//Gdzie mogę znaleźć Iana?
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_02");//Poszukaj go na środku głównego szybu, obok składowiska.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_03");//Ach, i jeszcze coś: znasz Thorusa, prawda? Zapomnij o nim!
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_04");//W kopalni rządzi tylko jedna osoba i jest nią Ian. To nasz szef.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_05");//Jak podpadniesz jemu - podpadniesz nam wszystkim. Zrozumiano?
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
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //Hej, nieźle sobie poradziłeś z tymi pełzaczami! Zasłużyłeś sobie na przyjęcie w poczet Strażników.
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //Idź do Starego Obozu i porozmawiaj z Thorusem!

	Log_CreateTopic (GE_BecomeGuard,LOG_NOTE);
	B_LogEntry (GE_BecomeGuard,"Jak tylko dostarczę te jaja powinienem porozmawiać z Thorusem. Może pozwoli mi dołączyć do Straży.");
};

