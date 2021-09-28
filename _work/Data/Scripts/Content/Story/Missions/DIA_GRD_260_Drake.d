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
	AI_Output			(other,	self,"Info_Exit_Info_15_01"); //Ci vediamo.
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
	description		= "A cosa devo stare attento, nella miniera?";
};

FUNC INT  Grd_260_Drake_Gefahr_Condition()
{
		return (Npc_KnowsInfo (hero,Grd_260_Drake_Mine));
};

func VOID  Grd_260_Drake_Gefahr_Info()
{

	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_01");//A cosa devo stare attento, nella miniera?
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//Soprattutto ai pidocchi di miniera. Sono animali pericolosi.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//Abbiamo dovuto abbandonare alcune cave, a causa loro. Hanno anche divorato alcuni minatori.
	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//Parlami dei pidocchi di miniera.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//Ho la gola talmente secca...
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//Portami una birra e ti dirò qualcosa sui pidocchi di miniera.


};
/**************** CRAWLER, MEHR	GEFAHREN INFOS *********************/

INSTANCE  Grd_260_Drake_Crawler_Okay (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Crawler_Okay_Condition;
	information		= Grd_260_Drake_Crawler_Okay_Info;
	important		= 0;
	permanent		= 0;
	description		= "(dai la birra)";
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
		AI_Output			(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");//Tieni, bevi alla mia salute!

		B_GiveInvItems		(hero, self, ItFoBeer, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,ItFobeer);

		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//Grazie. Allora: i pidocchi di miniera vivono in branchi numerosi, soprattutto nelle cave laterali.
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//Finora, non ci hanno mai attaccati qui nel condotto principale. Se ne incontri uno, corri!
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//Oppure mettiti con la schiena contro la parete. In questo modo potresti avere una possibilità di farcela.

		//Grd_260_Drake_Crawler_Okay.permanent = 0;
	}
	else
	{
		AI_Output			(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//Mi prendi in giro? Torna quando avrai un po' di birra!
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
	description		= "Puoi dirmi qualcosa sulla miniera?";
};

FUNC int  Grd_260_Drake_Mine_Condition()
{
	return 1;
};
func void Grd_260_Drake_Mine_Info ()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Info_15_01");//Puoi dirmi qualcosa sulla miniera?
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_02");//Allora... Noi ci troviamo nel condotto principale. Puoi raggiungere il fondo attraverso un sistema di passerelle.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_03");//Ovunque si estrae il metallo. Stai attento: è pieno di pidocchi di miniera!
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_04");//In fondo c'è la fucina, dove fondiamo direttamente parte del metallo che estraiamo.


};
// ***************** MEHR MINE *****************************
instance  Grd_260_Drake_Mine_Mehr (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Mehr_Condition;
	information		= Grd_260_Drake_Mine_Mehr_Info;
	important		= 0;
	permanent		= 0;
	description		= "Parlami ancora della miniera!";
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
	AI_Output			(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//Parlamene ancora!
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//Se vuoi saperne di più, vai da Viper. È lui il fonditore.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//Oppure vai da Ian. Lui è il capo e organizza tutto ciò che ha a che fare con la miniera.
	
};

// ***************** IAN *****************************
instance  Grd_260_Drake_Ian	(C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Ian_Condition;
	information		= Grd_260_Drake_Ian_Info;
	important		= 0;
	permanent		= 0;
	description		= "Dove si trova Ian?";
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
	AI_Output			(other,self,"Grd_260_Drake_Ian_Info_15_01");//Dove si trova Ian?
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_02");//Nel centro del condotto principale, vicino al magazzino.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_03");//Ah, un'ultima cosa: conosci Thorus, vero? Beh, dimenticalo!
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_04");//Qui comanda una sola persona ed è Ian. È lui il capo.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_05");//Se ti metti nei guai con lui, sei nei guai con tutti noi. Chiaro?
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
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //Ehi! Hai fatto un buon lavoro con i pidocchi di miniera! Ora meriti di entrare a far parte delle guardie!
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //Vai a Campo Vecchio e parlane con Thorus!

	Log_CreateTopic (GE_BecomeGuard,LOG_NOTE);
	B_LogEntry (GE_BecomeGuard,"Non appena avrò riportato le uova, dovrò parlare con Thorus. Forse mi permetterà di unirmi alle guardie.");
};

