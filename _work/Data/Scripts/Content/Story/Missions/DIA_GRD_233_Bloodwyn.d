// ******************************************************************
// Zur Info: Bloodwyn: 244, 243; Bloodwyn: 229, 242; Fletcher: 241, 240

// ************************************************************
// 			  				   EXIT_Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_EXIT_Schutzgeld (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 999;
	condition	= Info_Bloodwyn_EXIT_Schutzgeld_Condition;
	information	= Info_Bloodwyn_EXIT_Schutzgeld_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Bloodwyn_EXIT_Schutzgeld_Condition()
{
	return 1;
};

FUNC VOID Info_Bloodwyn_EXIT_Schutzgeld_Info()
{	
	AI_Output (other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00"); //Do zobaczenia.
	if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //Trzymaj się, kolego.
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //W Obozie nie musisz się niczego obawiać. Będziemy mieli na ciebie oko.
	};
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
INSTANCE Info_Bloodwyn_Hello (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Hello_Condition;
	information	= Info_Bloodwyn_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Bloodwyn_Hello_Condition()
{	
	if (Kapitel <= 2) 
	{
		return 1;
	};
};
FUNC VOID Info_Bloodwyn_Hello_Info()
{	
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_00"); //Hej, ty!
	AI_Output (other, self,"Info_Bloodwyn_Hello_15_01"); //Mówisz do mnie?
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_02"); //Ostrzegam cię! Tacy jak ty łatwo mogą napytać sobie biedy!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_03"); //W końcu większość z tutejszych ludzi to straszne zbiry!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_04"); //Wydaje się im, że mogą tu robić, co im się żywnie podoba. No, ale my im na to nie pozwalamy.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_05"); //Gomezowi zależy na spokoju w Obozie, a do nas - Strażników - należy dbanie o porządek. Oczywiście jest to bardzo wyczerpujące... i KOSZTOWNE zajęcie.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_06"); //Dlatego właśnie chcę cię prosić o drobne wsparcie finansowe... Na znak przyjaźni. Ty pomożesz nam, a my pomożemy tobie. Jeśli będziesz miał kłopoty - możesz na nas liczyć.

	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Czemu by nie? Ile mam ci zapłacić?",Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice		(Info_Bloodwyn_Hello,"To znaczy, że mam ci zapłacić za ochronę? Dzięki, ale nie!",Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice		(Info_Bloodwyn_Hello,"Grozisz mi?",Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
	AI_Output (other, self,"Info_Bloodwyn_ForgetIt_15_00"); //To znaczy, że mam ci zapłacić za ochronę? Dzięki, ale nie! Sam sobie dam radę!
	AI_Output (self, other,"Info_Bloodwyn_ForgetIt_08_01"); //Jak sobie chcesz, chłopcze. Ale wkrótce pożałujesz, że odrzuciłeś tę przyjacielską propozycję!
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
	AI_Output (other, self,"Info_Bloodwyn_SollDrohungSein_15_00"); //Grozisz mi?
	AI_Output (self, other,"Info_Bloodwyn_SollDrohungSein_08_01"); //Wręcz przeciwnie! Oferuję ci pomoc!
};

func void Info_Bloodwyn_Hello_HowMuch()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //Czemu by nie? Ile mam ci zapłacić?
	AI_Output (self, other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //Niewiele. 10 bryłek rudy, to wszystko.
	
	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Nie mam tyle przy sobie.",Info_Bloodwyn_Hello_NotNow);
	if (Npc_HasItems(other,itminugget)>=10)
	{
		Info_AddChoice	(Info_Bloodwyn_Hello,"Proszę, oto ruda. Przyjaciół nigdy nie za wielu.",Info_Bloodwyn_Hello_OkTakeIt);
	};
};
// -------------------------------------------------------
func void Info_Bloodwyn_Hello_OkTakeIt()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //Proszę, oto ruda. Przyjaciół nigdy nie za wielu.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //Widzę, że mądry z ciebie gość. Od tej pory będziemy cię mieli na oku.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //Ale to nie znaczy, że możesz tu robić, co ci się żywnie podoba, jasne?
	
	B_GiveInvItems 	    (other, self, itminugget, 10);
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_NotNow()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_NotNow_15_00"); //Nie mam tyle przy sobie.
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_01"); //Trudno. Wezmę co masz. Resztę dopłacisz przy następnym spotkaniu.
	AI_GotoNpc (self,other);
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_02"); //Zobaczmy...
		
	if (Npc_HasItems(other, itminugget) > 0)
	{
		if (Npc_HasItems(other, itminugget) > 9)
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //No patrzcie państwo! Ktoś tu nie umie liczyć do 10, co?
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //Wezmę wszystko co masz. To mi pomoże zapomnieć, że próbowałeś mnie wykiwać.
		}
		else
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //O, przyjmuję również mniejsze datki. W końcu liczy się pamięć! Dzięki za rudę, chłopcze!
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //Od tej pory będę miał na ciebie oko. W Obozie nic ci już nie grozi.
		};
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //Hmmm, naprawdę jesteś spłukany, co? Trudno. Może innym razem...
	};
	
	B_GiveInvItems		(other, self, itminugget, Npc_HasItems(other, itminugget) );//Alle Nuggets entfernen
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

// ************************************************************
// 						Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_PayDay (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_PayDay_Condition;
	information	= Info_Bloodwyn_PayDay_Info;
	permanent	= 1;		
	important   = 1;				//*** NUR, WENN SC AUCH 10 ERZ HAT! ***
};                       

FUNC INT Info_Bloodwyn_PayDay_Condition()
{
	if ( (Kapitel <= 2) && (Bloodwyn_PayDay <= Wld_GetDay()-1) && (Npc_HasItems(other, itminugget)>=10) )
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayDay_Info()
{	
	if (Bloodwyn_ProtectionPaid == TRUE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_00"); //Miło cię widzieć, przyjacielu!
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_01"); //No i jak tam z twoim wsparciem finansowym? Wciąż zalegasz z 10 bryłkami rudy!
		
		Info_ClearChoices	(Info_Bloodwyn_PayDay );
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Proszę. Czym jest 10 bryłek rudy wobec prawdziwej przyjaźni.",Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Nie będę ci więcej płacił. Dość już ode mnie dostałeś!",Info_Bloodwyn_PayDay_PayNoMore);
	}
	else if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_00"); //Hej, ty!
		AI_Output (other, self,"Info_Bloodwyn_PayDay_Den_15_01"); //Czego znowu?
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_02"); //Pora udowodnić, że jesteś prawdziwym przyjacielem.
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_03"); //Marne 10 bryłek rudy, i wszystko będzie w porządku. Co ty na to?
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //Proszę. Czym jest 10 bryłek rudy wobec prawdziwej przyjaźni.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //Czytasz w moich myślach!
	
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //Nie będę ci więcej płacił. Dość już ode mnie dostałeś!
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //Zawiodłem się na tobie! Taki z ciebie przyjaciel? Dobrze, jak sobie chcesz! Od tej pory sam dbaj o siebie. Ja umywam ręce.
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //Bez obawy. Jakoś sobie poradzę bez twojej pomocy.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //To się dopiero okaże...
	
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Npc_SetPermAttitude (self,ATT_ANGRY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

// ************************************************************
// 						DOCH zahlen
// ************************************************************

INSTANCE Info_Bloodwyn_Doch (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Doch_Condition;
	information	= Info_Bloodwyn_Doch_Info;
	permanent	= 1;
	description = "Zmieniłem zdanie. Postanowiłem jednak zapłacić ci te 10 bryłek rudy.";
};                       

FUNC INT Info_Bloodwyn_Doch_Condition()
{
	if (Bloodwyn_ProtectionPaid == FALSE)
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_Doch_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_Doch_15_00"); //Zmieniłem zdanie. Postanowiłem jednak zapłacić ci te 10 bryłek rudy.
	if (Npc_HasItems(other, itminugget)>=10)
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_01"); //Trzeba tak było od razu! Mądry z ciebie gość.
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_02"); //Ale od tej pory będziesz płacił swoją dzienną składkę, co?
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude (self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_NoOre_08_00"); //To wróć, jak będziesz miał trochę rudy.
		AI_StopProcessInfos	(self);
	};
};


	

INSTANCE Info_Bloodwyn_PayForJesse (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 5;
	condition	= Info_Bloodwyn_PayForJesse_Condition;
	information	= Info_Bloodwyn_PayForJesse_Info;
	permanent	= 1;
	description = "Jesse przysłał mnie, żebym zapłacił jego 10 bryłek.";
};                       

FUNC INT Info_Bloodwyn_PayForJesse_Condition()
{
	if (Jesse_PayForMe == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayForJesse_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_00"); //Jesse przysyła mnie, żebym zapłacił jego 10 bryłek.
	if  (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_01"); //Powinieneś raczej zapłacić SWOJE 10 bryłek.
	};
	AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_02"); //Zapomnij o tym facecie: Jesse i tak długo nie pociągnie.
	if (Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_03"); //Nie - zapłacę za niego. Masz tu jego 10 bryłek i zostaw go w spokoju.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_04"); //Dobra, jak sobie chcesz.
		Jesse_PayForMe = LOG_SUCCESS;
	}
	else
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_05"); //Hmmm... Właśnie sobie przypomniałem, że nie mam teraz tyle rudy.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_06"); //To znak, człowieku! Przemyśl to sobie. Płacąc za tego gościa wyrzucasz rudę w błoto!
	};
};
/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_233_Bloodwyn_WELCOME (C_INFO)
{
	npc				= GRD_233_Bloodwyn;
	condition		= GRD_233_Bloodwyn_WELCOME_Condition;
	information		= GRD_233_Bloodwyn_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_233_Bloodwyn_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_233_Bloodwyn_WELCOME_Info()
{
	AI_Output (self, other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //Teraz jesteś jednym z nas! Dobra robota! Straży przyda się ktoś taki jak ty!
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Bloodwyn_DIE (C_INFO)
{
	npc			= Grd_233_Bloodwyn;
	condition	= Info_Bloodwyn_DIE_Condition;
	information	= Info_Bloodwyn_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Bloodwyn_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Bloodwyn_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_01"); //No proszę, toż to nasz zdrajca! A my cię uważaliśmy za jednego z nas.
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_02"); //Widzę, że przeoczyliśmy jednego z Magów Ognia!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_03"); //To ten Cień, który nas zdradził!
		};			

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_04"); //Zaraz! O czym ty mówisz, Bloodwyn?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_05"); //Spiknąłeś się z Nowym Obozem, tak?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_06"); //Nie, czekaj! Ja dalej...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_07"); //Co, myślałeś, że damy się tak łatwo wykiwać, hę?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_08"); //Przestań gadać od rzeczy...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_09"); //Zdrajcy tacy jak ty zasługują tylko na śmierć.
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_10"); //GIŃ!!!

		if	Npc_KnowsInfo(hero, Info_Fletcher_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Fletcher, który pilnuje teraz głównej bramy, zareagował podobnie jak Bloodwyn. Mam wrażenie, że ma to coś wspólnego z moimi poszukiwaniami kamienia ogniskującego dla Nowego Obozu.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Bloodwyn, który pilnuje teraz południowej bramy Starego Obozu, nazwał mnie zdrajcą. Nie chciał mnie nawet wysłuchać - od razu rzucił się do ataku!");
			B_LogEntry			(CH4_BannedFromOC,"Wygląda na to, że zostałem wygnany ze Starego Obozu!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_11"); //Postanowiłeś zobaczyć, jak wygląda świat na zewnątrz Nowego Obozu, co? To był błąd!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_12"); //No proszę, znudził ci się twój nowy dom na bagnach? Popełniłeś błąd przychodząc tutaj.
		};

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_13"); //Co? O co ci chodzi?!
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_14"); //Nie słyszałeś o ataku na waszą kopalnię?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_15"); //Chwileczkę...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_16"); //Przykro mi, ale nie możemy pozwolić, żebyś o tym komuś powiedział!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_17"); //Hej, nie chcę żadnych kłopotów...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_18"); //Trzeba było o tym pomyśleć trochę wcześniej!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_19"); //Słuchaj, mam tego serdecznie dość...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_20"); //Ja też! ZABIĆ GO!!!
	};
	
	Npc_ExchangeRoutine	(self,				"FMTaken2");	// Verstärkung vor das Hinterem Tor (Anführer)
	B_ExchangeRoutine	(GRD_232_Gardist,	"FMTaken2");	// Verstärkung vor das Hinterem Tor
	B_ExchangeRoutine	(GRD_229_Gardist,	"FMTaken2");	// Verstärkung vor das Hinterem Tor (Fernkämpfer)
	B_ExchangeRoutine	(GRD_216_Torwache,	"FMTaken2");	// reguläre Wache am Hinteren Tor
	B_ExchangeRoutine	(GRD_217_Torwache,	"FMTaken2");	// reguläre Wache am Hinteren Tor

	B_SetPermAttitude	(GRD_233_Bloodwyn,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_232_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_229_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_216_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_217_Torwache,	ATT_HOSTILE);

	
	if	!Npc_KnowsInfo(hero, Info_Fletcher_DIE)
	{
		B_LogEntry		(CH4_Firemages,"Bramy do Starego Obozu zostały zamknięte i pozostają pilnie strzeżone. Strażnicy atakują każdego, kto podejdzie w pobliże obozu.");
	};
	
	AI_StopProcessInfos	(self);
};

