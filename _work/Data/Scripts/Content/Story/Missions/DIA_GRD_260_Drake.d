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
	description		= "Na co powinienem uwa�a� w kopalni?";
};

FUNC INT  Grd_260_Drake_Gefahr_Condition()
{
		return (Npc_KnowsInfo (hero,Grd_260_Drake_Mine));
};

func VOID  Grd_260_Drake_Gefahr_Info()
{

	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_01");//Na co powinienem uwa�a� w kopalni?
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//Przede wszystkim na pe�zacze. Gro�ne bestie.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//To przez nie musieli�my zrezygnowa� z wydobycia w paru jaskiniach. Niestety, po�ar�y nam ju� spor� grup� Kopaczy.
	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//Opowiedz mi o pe�zaczach.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//Wiesz, zasch�o mi w ustach...
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//Przynie� mi piwo, to ci opowiem o pe�zaczach.


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
		AI_Output			(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");//Prosz�, wypij moje zdrowie!

		B_GiveInvItems		(hero, self, ItFoBeer, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,ItFobeer);

		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//Dzi�ki. A co do pe�zaczy - �yj� w du�ych stadach, g��wnie w bocznych jaskiniach.
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//Jeszcze nigdy nie widziano ich tutaj, w g��wnym szybie. Gdyby� spotka� kiedy� pe�zacza, wiej ile si� w nogach!
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//Albo sta� plecami do �ciany. W ten spos�b b�dziesz mia� jak�� szans�!

		//Grd_260_Drake_Crawler_Okay.permanent = 0;
	}
	else
	{
		AI_Output			(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//�artujesz sobie ze mnie? Wr��, jak b�dziesz mia� dla mnie piwo.
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
	description		= "Mo�esz mi opowiedzie� o tej kopalni?";
};

FUNC int  Grd_260_Drake_Mine_Condition()
{
	return 1;
};
func void Grd_260_Drake_Mine_Info ()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Info_15_01");//Mo�esz mi opowiedzie� o tej kopalni?
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_02");//Stoimy teraz w g��wnym szybie. Na d� mo�na zej�� po rusztowaniach.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_03");//Wsz�dzie dooko�a Kopacze wydobywaj� rud�. Musisz bardzo uwa�a� na pe�zacze. One te� s� wsz�dzie dooko�a!
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_04");//Na samym dole, cz�� wydobytej rudy przeznaczona do wykorzystania tutaj jest od razu przetapiana. 


};
// ***************** MEHR MINE *****************************
instance  Grd_260_Drake_Mine_Mehr (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Mehr_Condition;
	information		= Grd_260_Drake_Mine_Mehr_Info;
	important		= 0;
	permanent		= 0;
	description		= "Opowiedz mi o tym co� wi�cej!";
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
	AI_Output			(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//Opowiedz mi o tym co� wi�cej!
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//Je�li chcesz wiedzie� wi�cej, pogadaj z W�em. On zajmuje si� wytopem.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//Albo zapytaj Iana. On tu rz�dzi. Odpowiada za organizacj� pracy w ca�ej kopalni.
	
};

// ***************** IAN *****************************
instance  Grd_260_Drake_Ian	(C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Ian_Condition;
	information		= Grd_260_Drake_Ian_Info;
	important		= 0;
	permanent		= 0;
	description		= "Gdzie mog� znale�� Iana?";
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
	AI_Output			(other,self,"Grd_260_Drake_Ian_Info_15_01");//Gdzie mog� znale�� Iana?
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_02");//Poszukaj go na �rodku g��wnego szybu, obok sk�adowiska.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_03");//Ach, i jeszcze co�: znasz Thorusa, prawda? Zapomnij o nim!
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_04");//W kopalni rz�dzi tylko jedna osoba i jest ni� Ian. To nasz szef.
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
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //Hej, nie�le sobie poradzi�e� z tymi pe�zaczami! Zas�u�y�e� sobie na przyj�cie w poczet Stra�nik�w.
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //Id� do Starego Obozu i porozmawiaj z Thorusem!

	Log_CreateTopic (GE_BecomeGuard,LOG_NOTE);
	B_LogEntry (GE_BecomeGuard,"Jak tylko dostarcz� te jaja powinienem porozmawia� z Thorusem. Mo�e pozwoli mi do��czy� do Stra�y.");
};

