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
	AI_Output			(other,	self,"Info_Exit_Info_15_01"); //Je�t� se uvid�me.
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
	description		= "Na co si mus�m d�t v dole pozor?";
};

FUNC INT  Grd_260_Drake_Gefahr_Condition()
{
		return (Npc_KnowsInfo (hero,Grd_260_Drake_Mine));
};

func VOID  Grd_260_Drake_Gefahr_Info()
{

	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_01");//Na co si mus�m d�t v dole pozor?
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//Hlavn� na d�ln� �ervy. Nebezpe�n� bestie.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//Museli jsme se kv�li nim vzd�t dvou jeskyn�. Se�rali u� p�r kop���.
	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//Vypr�v�j mi o t�ch �ervech.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//Och, kdy� j� m�m tak sucho na jazyku...
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//P�ines mi pivo a j� ti za to pov�m n�co o t�ch �ervech.


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
		AI_Output			(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");//Tady, napij se na moje zdrav�!

		B_GiveInvItems		(hero, self, ItFoBeer, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,ItFobeer);

		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//D�ky. Tak dob�e. �ervi �ijou ve velk�ch skupin�ch, v�t�inou v postrann�ch jeskyn�ch.
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//V hlavn� �acht� na n�s je�t� nikdy neza�to�ili. Kdybys ale n�jak�ho vid�l, ute�!
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//Nebo se postav z�dy ke st�n�. Jedin� tak m� �anci!

		//Grd_260_Drake_Crawler_Okay.permanent = 0;
	}
	else
	{
		AI_Output			(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//D�l� si ze m� bl�zny? Vra� se, a� bude� m�t n�jak� pivo.
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
	description		= "M��e� mi ��ci n�co o tom dole?";
};

FUNC int  Grd_260_Drake_Mine_Condition()
{
	return 1;
};
func void Grd_260_Drake_Mine_Info ()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Info_15_01");//M��e� mi ��ci n�co o tom dole?
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_02");//Dobr�, ta ��st, v kter� pr�v� jsme, je v sou�asnosti hlavn� �achta. Po syst�mu �zk�ch m�stk� se dostane� a� na dno.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_03");//Magick� ruda se kope v�ude. Mus� b�t ale opatrn�, je tady spousta d�ln�ch �erv�.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_04");//P��mo na dn� je tav�rna. Tady tav�me ��st rudy pro m�stn� pou�it�.


};
// ***************** MEHR MINE *****************************
instance  Grd_260_Drake_Mine_Mehr (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Mehr_Condition;
	information		= Grd_260_Drake_Mine_Mehr_Info;
	important		= 0;
	permanent		= 0;
	description		= "�ekni mi v�c o tom dolu!";
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
	AI_Output			(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//�ekni mi o tom je�t� v�c!
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//Kdy� chce� v�d�t v�c, zajdi za Viperem. To je tavi�.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//Nebo �ekni Ianovi. To je ��f. Organizuje pr�ci v cel�m dole.
	
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
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_02");//Je p��mo uprost�ed hlavn� �achty, za skladi�t�m.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_03");//Jo, a je�t� n�co - zn� Thoruse, �e jo? Pus't ho z hlavy!
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_04");//Jedin�, kdo tady m� co ��ci, je Ian. On je tu ��f.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_05");//Pokud s n�m bude� m�t t�kosti, bude� je m�t s n�ma se v�ema! Rozum�?
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
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //Hej, s t�mi �ervy jsi odvedl skv�lou pr�ci! T�m jsi si zaslou�il jmenov�n� ke str��m.
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //B� do Star�ho t�bora a �ekni to Thorusovi!

	Log_CreateTopic (GE_BecomeGuard,LOG_NOTE);
	B_LogEntry (GE_BecomeGuard,"Jakmile p�inesu ta vaj��ka, mus�m si promluvit s Thorusem. Mo�n� m� p�ijme ke str��m.");
};

