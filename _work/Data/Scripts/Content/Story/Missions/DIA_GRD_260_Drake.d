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
	AI_Output			(other,	self,"Info_Exit_Info_15_01"); //Ještì se uvidíme.
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
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//Hlavnì na dùlní èervy. Nebezpeèné bestie.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//Museli jsme se kvùli nim vzdát dvou jeskyní. Sežrali už pár kopáèù.
	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//Vyprávìj mi o tìch èervech.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//Och, když já mám tak sucho na jazyku...
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//Pøines mi pivo a já ti za to povím nìco o tìch èervech.


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

		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//Díky. Tak dobøe. Èervi žijou ve velkých skupinách, vìtšinou v postranních jeskyních.
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//V hlavní šachtì na nás ještì nikdy nezaútoèili. Kdybys ale nìjakého vidìl, uteè!
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//Nebo se postav zády ke stìnì. Jedinì tak máš šanci!

		//Grd_260_Drake_Crawler_Okay.permanent = 0;
	}
	else
	{
		AI_Output			(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//Dìláš si ze mì blázny? Vra se, až budeš mít nìjaké pivo.
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
	description		= "Mùžeš mi øíci nìco o tom dole?";
};

FUNC int  Grd_260_Drake_Mine_Condition()
{
	return 1;
};
func void Grd_260_Drake_Mine_Info ()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Info_15_01");//Mùžeš mi øíci nìco o tom dole?
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_02");//Dobrá, ta èást, v které právì jsme, je v souèasnosti hlavní šachta. Po systému úzkých mùstkù se dostaneš až na dno.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_03");//Magická ruda se kope všude. Musíš být ale opatrný, je tady spousta dùlních èervù.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_04");//Pøímo na dnì je tavírna. Tady tavíme èást rudy pro místní použití.


};
// ***************** MEHR MINE *****************************
instance  Grd_260_Drake_Mine_Mehr (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Mehr_Condition;
	information		= Grd_260_Drake_Mine_Mehr_Info;
	important		= 0;
	permanent		= 0;
	description		= "Øekni mi víc o tom dolu!";
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
	AI_Output			(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//Øekni mi o tom ještì víc!
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//Když chceš vìdìt víc, zajdi za Viperem. To je taviè.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//Nebo øekni Ianovi. To je šéf. Organizuje práci v celém dole.
	
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
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_02");//Je pøímo uprostøed hlavní šachty, za skladištìm.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_03");//Jo, a ještì nìco - znáš Thoruse, že jo? Pus't ho z hlavy!
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_04");//Jediný, kdo tady má co øíci, je Ian. On je tu šéf.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_05");//Pokud s ním budeš mít tìžkosti, budeš je mít s náma se všema! Rozumíš?
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
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //Hej, s tìmi èervy jsi odvedl skvìlou práci! Tím jsi si zasloužil jmenování ke strážím.
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //Bìž do Starého tábora a øekni to Thorusovi!

	Log_CreateTopic (GE_BecomeGuard,LOG_NOTE);
	B_LogEntry (GE_BecomeGuard,"Jakmile pøinesu ta vajíèka, musím si promluvit s Thorusem. Možná mì pøijme ke strážím.");
};

