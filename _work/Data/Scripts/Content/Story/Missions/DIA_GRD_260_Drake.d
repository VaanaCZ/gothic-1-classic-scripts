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
	AI_Output			(other,	self,"Info_Exit_Info_15_01"); //Ještě se uvidíme.
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
	description		= "Na co si musím dát v dole pozor?";
};

FUNC INT  Grd_260_Drake_Gefahr_Condition()
{
		return (Npc_KnowsInfo (hero,Grd_260_Drake_Mine));
};

func VOID  Grd_260_Drake_Gefahr_Info()
{

	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_01");//Na co si musím dát v dole pozor?
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//Hlavně na důlní červy. Nebezpečné bestie.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//Museli jsme se kvůli nim vzdát dvou jeskyní. Sežrali už pár kopáčů.
	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//Vyprávěj mi o těch červech.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//Och, když já mám tak sucho na jazyku...
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//Přines mi pivo a já ti za to povím něco o těch červech.


};
/**************** CRAWLER, MEHR	GEFAHREN INFOS *********************/

INSTANCE  Grd_260_Drake_Crawler_Okay (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Crawler_Okay_Condition;
	information		= Grd_260_Drake_Crawler_Okay_Info;
	important		= 0;
	permanent		= 0;
	description		= "(podej pivo)";
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
		AI_Output			(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");//Tady, napij se na moje zdraví!

		B_GiveInvItems		(hero, self, ItFoBeer, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,ItFobeer);

		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//Díky. Tak dobře. Červi žijou ve velkých skupinách, většinou v postranních jeskyních.
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//V hlavní šachtě na nás ještě nikdy nezaútočili. Kdybys ale nějakého viděl, uteč!
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//Nebo se postav zády ke stěně. Jedině tak máš šanci!

		//Grd_260_Drake_Crawler_Okay.permanent = 0;
	}
	else
	{
		AI_Output			(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//Děláš si ze mě blázny? Vrať se, až budeš mít nějaké pivo.
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
	description		= "Můžeš mi říci něco o tom dole?";
};

FUNC int  Grd_260_Drake_Mine_Condition()
{
	return 1;
};
func void Grd_260_Drake_Mine_Info ()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Info_15_01");//Můžeš mi říci něco o tom dole?
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_02");//Dobrá, ta část, v které právě jsme, je v současnosti hlavní šachta. Po systému úzkých můstků se dostaneš až na dno.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_03");//Magická ruda se kope všude. Musíš být ale opatrný, je tady spousta důlních červů.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_04");//Přímo na dně je tavírna. Tady tavíme část rudy pro místní použití.


};
// ***************** MEHR MINE *****************************
instance  Grd_260_Drake_Mine_Mehr (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Mehr_Condition;
	information		= Grd_260_Drake_Mine_Mehr_Info;
	important		= 0;
	permanent		= 0;
	description		= "Řekni mi víc o tom dolu!";
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
	AI_Output			(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//Řekni mi o tom ještě víc!
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//Když chceš vědět víc, zajdi za Viperem. To je tavič.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//Nebo řekni Ianovi. To je šéf. Organizuje práci v celém dole.
	
};

// ***************** IAN *****************************
instance  Grd_260_Drake_Ian	(C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Ian_Condition;
	information		= Grd_260_Drake_Ian_Info;
	important		= 0;
	permanent		= 0;
	description		= "Kde najdu Iana?";
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
	AI_Output			(other,self,"Grd_260_Drake_Ian_Info_15_01");//Kde najdu Iana?
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_02");//Je přímo uprostřed hlavní šachty, za skladištěm.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_03");//Jo, a ještě něco - znáš Thoruse, že jo? Pus't ho z hlavy!
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_04");//Jediný, kdo tady má co říci, je Ian. On je tu šéf.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_05");//Pokud s ním budeš mít těžkosti, budeš je mít s náma se všema! Rozumíš?
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
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //Hej, s těmi červy jsi odvedl skvělou práci! Tím jsi si zasloužil jmenování ke strážím.
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //Běž do Starého tábora a řekni to Thorusovi!

	Log_CreateTopic (GE_BecomeGuard,LOG_NOTE);
	B_LogEntry (GE_BecomeGuard,"Jakmile přinesu ta vajíčka, musím si promluvit s Thorusem. Možná mě přijme ke strážím.");
};

