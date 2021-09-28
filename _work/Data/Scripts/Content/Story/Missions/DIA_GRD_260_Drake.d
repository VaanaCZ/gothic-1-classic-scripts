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
	description		= "Na co powinienem uwa¿aæ w kopalni?";
};

FUNC INT  Grd_260_Drake_Gefahr_Condition()
{
		return (Npc_KnowsInfo (hero,Grd_260_Drake_Mine));
};

func VOID  Grd_260_Drake_Gefahr_Info()
{

	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_01");//Na co powinienem uwa¿aæ w kopalni?
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//Przede wszystkim na pe³zacze. GroŸne bestie.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//To przez nie musieliœmy zrezygnowaæ z wydobycia w paru jaskiniach. Niestety, po¿ar³y nam ju¿ spor¹ grupê Kopaczy.
	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//Opowiedz mi o pe³zaczach.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//Wiesz, zasch³o mi w ustach...
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//Przynieœ mi piwo, to ci opowiem o pe³zaczach.


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
		AI_Output			(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");//Proszê, wypij moje zdrowie!

		B_GiveInvItems		(hero, self, ItFoBeer, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,ItFobeer);

		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//Dziêki. A co do pe³zaczy - ¿yj¹ w du¿ych stadach, g³ównie w bocznych jaskiniach.
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//Jeszcze nigdy nie widziano ich tutaj, w g³ównym szybie. Gdybyœ spotka³ kiedyœ pe³zacza, wiej ile si³ w nogach!
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//Albo stañ plecami do œciany. W ten sposób bêdziesz mia³ jak¹œ szansê!

		//Grd_260_Drake_Crawler_Okay.permanent = 0;
	}
	else
	{
		AI_Output			(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//¯artujesz sobie ze mnie? Wróæ, jak bêdziesz mia³ dla mnie piwo.
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
	description		= "Mo¿esz mi opowiedzieæ o tej kopalni?";
};

FUNC int  Grd_260_Drake_Mine_Condition()
{
	return 1;
};
func void Grd_260_Drake_Mine_Info ()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Info_15_01");//Mo¿esz mi opowiedzieæ o tej kopalni?
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_02");//Stoimy teraz w g³ównym szybie. Na dó³ mo¿na zejœæ po rusztowaniach.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_03");//Wszêdzie dooko³a Kopacze wydobywaj¹ rudê. Musisz bardzo uwa¿aæ na pe³zacze. One te¿ s¹ wszêdzie dooko³a!
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_04");//Na samym dole, czêœæ wydobytej rudy przeznaczona do wykorzystania tutaj jest od razu przetapiana. 


};
// ***************** MEHR MINE *****************************
instance  Grd_260_Drake_Mine_Mehr (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Mehr_Condition;
	information		= Grd_260_Drake_Mine_Mehr_Info;
	important		= 0;
	permanent		= 0;
	description		= "Opowiedz mi o tym coœ wiêcej!";
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
	AI_Output			(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//Opowiedz mi o tym coœ wiêcej!
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//Jeœli chcesz wiedzieæ wiêcej, pogadaj z Wê¿em. On zajmuje siê wytopem.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//Albo zapytaj Iana. On tu rz¹dzi. Odpowiada za organizacjê pracy w ca³ej kopalni.
	
};

// ***************** IAN *****************************
instance  Grd_260_Drake_Ian	(C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Ian_Condition;
	information		= Grd_260_Drake_Ian_Info;
	important		= 0;
	permanent		= 0;
	description		= "Gdzie mogê znaleŸæ Iana?";
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
	AI_Output			(other,self,"Grd_260_Drake_Ian_Info_15_01");//Gdzie mogê znaleŸæ Iana?
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_02");//Poszukaj go na œrodku g³ównego szybu, obok sk³adowiska.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_03");//Ach, i jeszcze coœ: znasz Thorusa, prawda? Zapomnij o nim!
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_04");//W kopalni rz¹dzi tylko jedna osoba i jest ni¹ Ian. To nasz szef.
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
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //Hej, nieŸle sobie poradzi³eœ z tymi pe³zaczami! Zas³u¿y³eœ sobie na przyjêcie w poczet Stra¿ników.
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //IdŸ do Starego Obozu i porozmawiaj z Thorusem!

	Log_CreateTopic (GE_BecomeGuard,LOG_NOTE);
	B_LogEntry (GE_BecomeGuard,"Jak tylko dostarczê te jaja powinienem porozmawiaæ z Thorusem. Mo¿e pozwoli mi do³¹czyæ do Stra¿y.");
};

