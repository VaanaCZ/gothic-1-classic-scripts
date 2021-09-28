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
	AI_Output (self, other,"DIA_SLD_753_Baloro_Intro_08_01"); //Hej, ty! Co siê dzieje?
};

// ********************** Was meinst du? *****************

instance DIA_SLD_753_Baloro_Wasmeinstdu (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Wasmeinstdu_Condition;
	information	= DIA_SLD_753_Baloro_Wasmeinstdu_Info;
	important	= 0;	
	permanent	= 0;
	description = "Czeœæ!";
};                       

FUNC int DIA_SLD_753_Baloro_Wasmeinstdu_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_753_Baloro_Wasmeinstdu_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_01"); //Czeœæ!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_02"); //Krêcisz siê tutaj, jakbyœ czegoœ szuka³!
	AI_Output (other, self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_03"); //Czy¿by? Mmh, mo¿e masz racjê. A dlaczego?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_04"); //Œwietnie! Zapytaj MNIE! Mo¿e mogê ci jakoœ pomóc!


};

// ********************** Woran hast du dabei gedacht *****************

instance DIA_SLD_753_Baloro_Worumgehts (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Worumgehts_Condition;
	information	= DIA_SLD_753_Baloro_Worumgehts_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Co masz na myœli?";
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
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_01"); //Co masz na myœli?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_01"); //A czego potrzebujesz?
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_02"); //Na pocz¹tek wystarczy dobry miecz, gruby pancerz i wstêp do kopalni.
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_02"); //Phi! To ma³e piwo!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_03"); //Mam tu coœ takiego, ¿e oczy ci wyjd¹ na wierzch. Mogê ci daæ broñ, któr¹ pokonasz ka¿dego wroga!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_04"); //W zamian, wystarczy, ¿e wyœwiadczysz mi drobn¹ przys³ugê. To wszystko! Co ty na to?

	Info_ClearChoices	(DIA_SLD_753_Baloro_Worumgehts); // alte choices loeschen
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Muszê to mieæ.",DIA_SLD_753_Baloro_Worumgehts_ja);
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Nie wierzê mu ani trochê.",DIA_SLD_753_Baloro_Exit_Info);
	
};

FUNC VOID DIA_SLD_753_Baloro_Worumgehts_ja()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_05"); //Co mia³bym dla ciebie zrobiæ?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_03"); //To proste!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_04"); //Przynieœ mi 5 jab³ek, 2 butelki ry¿ówki, 5 butelek piwa, 3 bochenki chleba, 2 kawa³ki sera i 2 kiœcie winogron. 
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_05"); //Mo¿esz mi wierzyæ: nie po¿a³ujesz! Jak ju¿ mówi³em - t¹ broni¹ pokonasz ka¿dego wroga!
	
	Info_ClearChoices	(DIA_SLD_753_Baloro_Worumgehts); // alte choices loeschen
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Muszê to mieæ.",DIA_SLD_753_Baloro_Worumgehts_jaklar);
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Goœæ próbuje zrobiæ mnie w konia.",DIA_SLD_753_Baloro_Exit_Info);
};
	
FUNC VOID DIA_SLD_753_Baloro_Worumgehts_jaklar()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_06"); //Dobrze! Zobaczê co siê da zrobiæ!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_06"); //To œwietnie! Tylko siê pospiesz.
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_07"); //Tylko nie zapomnij: 5 jab³ek, 2 butelki ry¿ówki, 5 butelek piwa, 3 bochenki chleba, 2 kawa³ki sera i 2 kiœcie winogron! Jasne?
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_07"); //Jak s³oñce.
	
	
//********	Auftragannahme	**************************
	


	SLD_753_Baloro_SC_besorgt_den_Kram = LOG_RUNNING ;
	
		
	Log_CreateTopic		(Baloros_Waffe,		LOG_MISSION);
	Log_SetTopicStatus	(Baloros_Waffe,		LOG_RUNNING);
	B_LogEntry			(Baloros_Waffe,		"Baloro obieca³ mi sprzedaæ niezwykle potê¿n¹ broñ, jeœli przyniosê mu 5 jab³ek, 2 butelki ry¿ówki, 5 butelek piwa, 3 bochenki chleba, 2 kawa³ki sera i 2 kiœcie winogron."); 

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
	description = "Nie uda³o mi siê jeszcze zebraæ wszystkich potrzebnych ci rzeczy.";
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
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_01"); //Nie uda³o mi siê jeszcze zebraæ wszystkich potrzebnych ci rzeczy. Móg³byœ mi przypomnieæ, co to mia³o byæ?
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_01"); //Jasne. S³uchaj uwa¿nie. Chcê, ¿ebyœ mi przyniós³...
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_02"); //5 jab³ek, 2 butelki ry¿ówki, 5 butelek piwa, 3 bochenki chleba, 2 kawa³ki sera i 2 kiœcie winogron! Zapamiêtasz tym razem?
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_02"); //Oczywiœcie! Nied³ugo wrócê!

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
	description 	= "Mam ju¿ wszystko!";
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
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_01"); //Mam ju¿ wszystko! teraz porozmawiajmy o tej niesamowitej broni, tak?
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_01"); //Najpierw poka¿ mi, co dla mnie masz.
	
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

	
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_02"); //Proszê bardzo!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_02"); //Nooo... W porz¹dku!
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_03"); //A teraz broñ!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_03"); //Zapomnij o tym!
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_04"); //Co?!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_04"); //Naprawdê myœla³eœ, ¿e dostaniesz coœ w zamian? Jeœli rzeczywiœcie jesteœ taki g³upi, to a¿ ci wspó³czujê!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_05"); //Dziwiê siê, ¿e prze¿y³eœ tak d³ugo! Jeœli bêdziesz wierzy³ we wszystko co ci powiedz¹ tutejsi ludzie, nie poci¹gniesz d³ugo!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_06"); //A zreszt¹ - niewa¿ne! Teraz mamy doœæ jedzenia na ma³¹ ucztê. Wielkie dziêki! Mo¿e siê jeszcze spotkamy! He he he!
	
	SLD_753_Baloro_SC_besorgt_den_Kram = LOG_SUCCESS ;
	B_GiveXP (300);
	B_LogEntry			(Baloros_Waffe,		"By³em g³upcem, ¿e zaufa³em temu ³garzowi! Có¿, dosta³em nauczkê..."); 

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
	description 	= "Hej! Nie dam siê robiæ w konia!";
	
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
			AI_Output (other, self,"DIA_SLD_753_Baloro_letztes_Wort_Info_15_01"); //Hej! Nie dam siê robiæ w konia!
			AI_Output (self, other,"DIA_SLD_753_Baloro_letztes_Wort_Info_08_01"); //Czego znowu chcesz! Uciekaj st¹d! Powkurzaj sobie kogoœ innego, co? No ju¿ - spadaj!
		
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
	description 	= "Widzê, ¿e bêdê ci musia³ daæ nauczkê.";
	
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
	AI_Output (other, self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_01"); //Widzê, ¿e bêdê ci musia³ daæ nauczkê.
	AI_Output (self, other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_01"); //No ju¿ - poœmialiœmy siê trochê, a teraz spadaj st¹d! Sio!
	AI_Output (other, self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_02"); //Chyba mnie nie zrozumia³eœ!
	AI_Output (self, other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_02"); //No dobra! Sam siê o to prosi³eœ! Ostrzega³em ciê!
	
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
	description 	= "Muszê ju¿ iœæ.";
	
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
						AI_Output (other, self,"DIA_SLD_753_Baloro_Exit_Info_15_01"); //Nie, nie! Niewa¿ne! Nie jestem zainteresowany!
						AI_Output (self, other,"DIA_SLD_753_Baloro_Exit_Info_08_02"); //Có¿, jak sobie ¿yczysz! Marnujesz niepowtarzaln¹ okazjê!
						
						SLD_753_Baloro_SC_choice = 1 ;
					}
				else
					{
						AI_Output (other, self,"DIA_SLD_753_Baloro_Exit_Info_15_03"); //Przykro mi, ale nie mam czasu na pogawêdki!
						AI_Output (self, other,"DIA_SLD_753_Baloro_Exit_Info_08_04"); //Och, jesteœ zajêty! Porozmawiamy innym razem!
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
	description 	= "Zmieni³em zdanie. Porozmawiajmy jeszcze raz o twojej propozycji.";
	
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
			AI_Output (other, self,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_15_01"); //Zmieni³em zdanie. Porozmawiajmy jeszcze raz o twojej propozycji.
			AI_Output (self, other,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_08_01"); //Teraz jest ju¿ za póŸno. Mia³eœ swoj¹ szansê!
		
			
			AI_StopProcessInfos	(self);	
		
		};

