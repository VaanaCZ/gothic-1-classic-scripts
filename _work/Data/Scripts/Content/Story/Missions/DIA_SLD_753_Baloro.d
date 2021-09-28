//****************************************************
//	Typ der den SC an der Nase herum führt!
//****************************************************

//Variablen:
//--------------------------------------
var int SLD_753_Baloro_SC_choice;
var int SLD_753_Baloro_SC_wills_wissen;
var int SLD_753_Baloro_SC_besorgt_den_Kram;
//--------------------------------------





instance DIA_SLD_753_Baloro (C_INFO)
{
	npc				= SLD_753_Baloro;
	condition		= DIA_SLD_753_Baloro_Condition;
	information		= DIA_SLD_753_Baloro_Intro_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_SLD_753_Baloro_Condition()
{
	return 1;
};

func void DIA_SLD_753_Baloro_Intro_Info()
{
	AI_Output (self, other,"DIA_SLD_753_Baloro_Intro_08_01"); //Hej, ty! Co se dìje?
};

// ********************** Was meinst du? *****************

instance DIA_SLD_753_Baloro_Wasmeinstdu (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Wasmeinstdu_Condition;
	information	= DIA_SLD_753_Baloro_Wasmeinstdu_Info;
	important	= 0;	
	permanent	= 0;
	description = "Zdar!";
};                       

FUNC int DIA_SLD_753_Baloro_Wasmeinstdu_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_753_Baloro_Wasmeinstdu_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_01"); //Zdar!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_02"); //Vykraèuješ si tady, jako kdybys nìco hledal!
	AI_Output (other, self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_03"); //Opravdu? Hmm, možná máš pravdu. Proè?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_04"); //Výbornì! Zeptej se mì. Možná ti mùžu pomoci!


};

// ********************** Woran hast du dabei gedacht *****************

instance DIA_SLD_753_Baloro_Worumgehts (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Worumgehts_Condition;
	information	= DIA_SLD_753_Baloro_Worumgehts_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Co jsi mìl na mysli?";
};                       

FUNC int DIA_SLD_753_Baloro_Worumgehts_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Wasmeinstdu))	&& (SLD_753_Baloro_SC_choice == 0) )
	{
	return 1;
	};
	
};

FUNC VOID DIA_SLD_753_Baloro_Worumgehts_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_01"); //Co jsi mìl na mysli?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_01"); //Co potøebuješ?
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_02"); //Co takhle dobrý meè, lehkou zbroj nebo pøístup do dolu?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_02"); //Ó ne! To nic!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_03"); //Mùžu ti dát nìco, co udrží tvoje oèi na stopkách! Mùžu ti dát zbraò, která rozdrtí každého nepøítele!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_04"); //Musíš mi jen prokázat malou službièku. Pak bude tvoje! Co øíkáš?

	Info_ClearChoices	(DIA_SLD_753_Baloro_Worumgehts); // alte choices loeschen
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Musím to mít.",DIA_SLD_753_Baloro_Worumgehts_ja);
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Nevìøím mu ani slovo.",DIA_SLD_753_Baloro_Exit_Info);
	
};

FUNC VOID DIA_SLD_753_Baloro_Worumgehts_ja()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_05"); //Co pro tebe mám udìlat?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_03"); //Velmi jednoduché!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_04"); //Dej mi 5 jablek, 2 láhve rýžové pálenky, 5 láhví piva, 3 bochníky chleba, 2 kusy sýra, 2 hrozny vína a jsme domluveni!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_05"); //Vìø mi, nebudeš litovat! Jak jsem øekl: porazíš s ní jakéhokoliv nepøítele!
	
	Info_ClearChoices	(DIA_SLD_753_Baloro_Worumgehts); // alte choices loeschen
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Musím to mít.",DIA_SLD_753_Baloro_Worumgehts_jaklar);
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Ten chlápek mele nesmysly.",DIA_SLD_753_Baloro_Exit_Info);
};
	
FUNC VOID DIA_SLD_753_Baloro_Worumgehts_jaklar()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_06"); //Dobrá, uvidíme, co budu moci udìlat!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_06"); //Výbornì! Ale nepospíchej
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_07"); //A nezapomeò: 5 jablek, 2 láhve rýžové pálenky, 5 láhví piva, 3 bochníky chleba, 2 kusy sýra, 2 hrozny vína! Jasný?
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_07"); //Jasný!
	
	
//********	Auftragannahme	**************************
	


	SLD_753_Baloro_SC_besorgt_den_Kram = LOG_RUNNING ;
	
		
	Log_CreateTopic		(Baloros_Waffe,		LOG_MISSION);
	Log_SetTopicStatus	(Baloros_Waffe,		LOG_RUNNING);
	B_LogEntry			(Baloros_Waffe,		"Baloro mi slíbil výbornou zbraò, pokud mu pøinesu 5 jablek, 2 láhve rýžové pálenky, 5 lahví piva, 3 bochníky chleba, 2 kousky sýra a 2 trsy hroznù."); 

	AI_StopProcessInfos	( self );
};
	



// ********************** Ich hab´s noch nicht dabei *****************	


instance DIA_SLD_753_Baloro_habsnichtdabei (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_habsnichtdabei_Condition;
	information	= DIA_SLD_753_Baloro_habsnichtdabei_Info;
	important	= 0;	
	permanent	= 1;
	description = "Nemohl jsem sehnat, co jsi chtìl!";
};                       

FUNC int DIA_SLD_753_Baloro_habsnichtdabei_Condition()
{
	if 	(SLD_753_Baloro_SC_besorgt_den_Kram == LOG_RUNNING)   
	{
		return 1;
	};

};

FUNC VOID DIA_SLD_753_Baloro_habsnichtdabei_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_01"); //Nemohl jsem sehnat, co jsi chtìl! Jakže to bylo? Bylo to spousta rùzných vìcí!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_01"); //Dobøe! Zopakuju ti to pomalu. Chci, abys mi pøinesl...
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_02"); //5 jablek, 2 láhve rýžové pálenky, 5 láhví piva, 3 bochníky chleba, 2 kusy sýra, 2 hrozny vína! Pamatuješ si to už?
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_02"); //Jistì! Urèitì! Pospíším si!

	AI_StopProcessInfos	( self );	
};


// ********************** Ich hab´s  dabei *****************	

instance DIA_SLD_753_Baloro_habsdabei (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_habsdabei_Condition;
	information	= DIA_SLD_753_Baloro_habsdabei_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Mám pro tebe všechno, co jsi chtìl!";
};                       

FUNC int DIA_SLD_753_Baloro_habsdabei_Condition()
{
	if (	(SLD_753_Baloro_SC_besorgt_den_Kram == LOG_RUNNING)      
		&&   (Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Worumgehts))	
		&& (SLD_753_Baloro_SC_choice == 0) 
		&& (Npc_HasItems(other,ItFoApple)>=5)  
		&& (Npc_HasItems(other,ItFoBooze)>=2) 
		&& (Npc_HasItems(other,ItFoBeer)>=5) 
		&& (Npc_HasItems(other,ItFoLoaf)>=3) 
		&& (Npc_HasItems(other,ItFoCheese)>=2) 
		&& (Npc_HasItems(other,ItFo_wineberrys_01)>=2) )
	{
		return 1;
	};

};

FUNC VOID DIA_SLD_753_Baloro_habsdabei_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_01"); //Mám pro tebe všechno, co jsi chtìl! A teï udìláme ten obchod s tou zázraènou zbraní, dobøe?
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_01"); //Nejdøív mi ukaž ty vìci!
	
	CreateInvItems(other, ItFoApple, 14);
	
	B_GiveInvItems(other, self, ItFoApple, 19); //Nötig für die Ausschrift "19 Itmes abgegeben", wird sofort angeglichen.
	
	Npc_RemoveInvItems ( other,ItFoBooze,2);
	Npc_RemoveInvItems ( other,ItFoBeer,5);
	Npc_RemoveInvItems ( other,ItFoLoaf,3);
	Npc_RemoveInvItems ( other,ItFoCheese,2);
	Npc_RemoveInvItems ( other,ItFo_wineberrys_01,2);
	
	Npc_RemoveInvItems ( self,ItFoApple,14);
	CreateInvItems	(self,ItFoBooze,2);
	CreateInvItems	(self,ItFoBeer,5);
	CreateInvItems	(self,ItFoLoaf,3);
	CreateInvItems	(self,ItFoCheese,2);
	CreateInvItems	(self,ItFo_wineberrys_01,2);

	
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_02"); //Tady jsou.
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_02"); //Ano. Výbornì.
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_03"); //Dobøe, a teï mi dej tu vìcièku!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_03"); //Zapomeò na to!
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_04"); //Cože?
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_04"); //Opravdu sis myslel, že za to nìco dostaneš? Mám pocit, že jestli jsi tak tupý, žes tomu vìøil, tak si nezasloužíš nic jiného!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_05"); //Pøekvapuje mì, že jsi stále naživu! Když vìøíš všemu, co lidi øíkají, moc dlouho nepøežiješ!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_06"); //Ale nevadí! Teï máme my chlapi dost jídla na oslavu! Díky moc! Možná se ještì uvidíme. Hehehe!
	
	SLD_753_Baloro_SC_besorgt_den_Kram = LOG_SUCCESS ;
	B_GiveXP (300);
	B_LogEntry			(Baloros_Waffe,		"Mìl bych více pøemýšlet, než skoèím na takový špek! Nevadí, aspoò jsem dostal lekci!"); 

	Log_SetTopicStatus	(Baloros_Waffe,		LOG_SUCCESS);
	
	AI_StopProcessInfos	( self );	
};


// **********************	EXIT\ Spieler will Rechenschaft	*****************	

instance DIA_SLD_753_Baloro_letztes_Wort (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_letztes_Wort_Condition;
	information	= DIA_SLD_753_Baloro_letztes_Wort_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Hej, èlovìèe! Tohle mi nemùžeš udìlat!";
	
};                       

FUNC int DIA_SLD_753_Baloro_letztes_Wort_Condition()
	{
		if (SLD_753_Baloro_SC_besorgt_den_Kram == LOG_SUCCESS)
		{
		return 1;
		};	
	};


FUNC VOID DIA_SLD_753_Baloro_letztes_Wort_Info()

	 	{
			AI_Output (other, self,"DIA_SLD_753_Baloro_letztes_Wort_Info_15_01"); //Hej, èlovìèe! Tohle mi nemùžeš udìlat!
			AI_Output (self, other,"DIA_SLD_753_Baloro_letztes_Wort_Info_08_01"); //Co chceš víc? Odtáhni! Lez si na nervy nìkomu jinému, nebo tì rozmáznu! Jasný!
		
			SLD_753_Baloro_SC_wills_wissen = 1	;
			
			AI_StopProcessInfos	(self);	
		
		};



// **********************	EXIT\ Spieler will´s wissen	*****************	

instance DIA_SLD_753_Baloro_SC_wills_wissen (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_SC_wills_wissen_Condition;
	information	= DIA_SLD_753_Baloro_SC_wills_wissen_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Obávám se, že tì budu muset pøetáhnout holí!";
	
};                       

FUNC int DIA_SLD_753_Baloro_SC_wills_wissen_Condition()
	{
		if (SLD_753_Baloro_SC_wills_wissen == 1)
		{
	
		return 1;
		};	
	};


FUNC VOID DIA_SLD_753_Baloro_Attack()
{
//	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};

FUNC VOID DIA_SLD_753_Baloro_SC_wills_wissen_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_01"); //Obávám se, že tì budu muset pøetáhnout holí!
	AI_Output (self, other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_01"); //Tak jsme se zasmáli! A teï padej, èlovìèe!
	AI_Output (other, self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_02"); //Mám pocit, žes mi nerozumìl!
	AI_Output (self, other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_02"); //Dobrá! Øíkal sis o to! Já tì varoval!
	
	DIA_SLD_753_Baloro_Attack () ;
	
};




// **********************	EXIT	*****************	


instance DIA_SLD_753_Baloro_Exit (C_INFO)
{
	npc			= SLD_753_Baloro;
	nr			=999;
	condition	= DIA_SLD_753_Baloro_Exit_Condition;
	information	= DIA_SLD_753_Baloro_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description 	= "Musím jít dál.";
	
};                       

FUNC int DIA_SLD_753_Baloro_Exit_Condition()
	{
		if    ((SLD_753_Baloro_SC_wills_wissen == 0)	&&  (SLD_753_Baloro_SC_besorgt_den_Kram == 0)    )
		{
		return 1;
		};
	};


FUNC VOID DIA_SLD_753_Baloro_Exit_Info()
{		
		
				if ( (Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Wasmeinstdu))  &&   (SLD_753_Baloro_SC_choice == 0)	)  
					{
						AI_Output (other, self,"DIA_SLD_753_Baloro_Exit_Info_15_01"); //Ne, ne! Jdi pryè! Nezajímáš mì!
						AI_Output (self, other,"DIA_SLD_753_Baloro_Exit_Info_08_02"); //Dobrá! Jak chceš! Dostal si šanci!
						
						SLD_753_Baloro_SC_choice = 1 ;
					}
				else
					{
						AI_Output (other, self,"DIA_SLD_753_Baloro_Exit_Info_15_03"); //Je mi líto! Bohužel nemám èas si povídat!
						AI_Output (self, other,"DIA_SLD_753_Baloro_Exit_Info_08_04"); //Och, ty nemáš èas! Ještì se uvidíme!
					};
			
	
	AI_StopProcessInfos	( self );
};


// **********************	EXIT\ wie war das mit deinem Angebot	*****************	

instance DIA_SLD_753_Baloro_Angebotdochannehmen (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Angebotdochannehmen_Condition;
	information	= DIA_SLD_753_Baloro_Angebotdochannehmen_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Pøemýšlel jsem o tom! Chtìl bych tvoji nabídku pøijmout.";
	
};                       

FUNC int DIA_SLD_753_Baloro_Angebotdochannehmen_Condition()
	{
		if (SLD_753_Baloro_SC_choice == 1)
		{
		return 1;
		};	
	};


FUNC VOID DIA_SLD_753_Baloro_Angebotdochannehmen_Info()

	 	{
			AI_Output (other, self,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_15_01"); //Pøemýšlel jsem o tom! Chtìl bych tvoji nabídku pøijmout.
			AI_Output (self, other,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_08_01"); //To už je pozdì! Mìl jsi možnost!
		
			
			AI_StopProcessInfos	(self);	
		
		};

