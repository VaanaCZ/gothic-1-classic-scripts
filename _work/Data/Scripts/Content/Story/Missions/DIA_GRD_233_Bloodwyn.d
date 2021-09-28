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
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //Trzymaj siê, kolego.
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //W Obozie nie musisz siê niczego obawiaæ. Bêdziemy mieli na ciebie oko.
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
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_02"); //Ostrzegam ciê! Tacy jak ty ³atwo mog¹ napytaæ sobie biedy!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_03"); //W koñcu wiêkszoœæ z tutejszych ludzi to straszne zbiry!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_04"); //Wydaje siê im, ¿e mog¹ tu robiæ, co im siê ¿ywnie podoba. No, ale my im na to nie pozwalamy.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_05"); //Gomezowi zale¿y na spokoju w Obozie, a do nas - Stra¿ników - nale¿y dbanie o porz¹dek. Oczywiœcie jest to bardzo wyczerpuj¹ce... i KOSZTOWNE zajêcie.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_06"); //Dlatego w³aœnie chcê ciê prosiæ o drobne wsparcie finansowe... Na znak przyjaŸni. Ty pomo¿esz nam, a my pomo¿emy tobie. Jeœli bêdziesz mia³ k³opoty - mo¿esz na nas liczyæ.

	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Czemu by nie? Ile mam ci zap³aciæ?",Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice		(Info_Bloodwyn_Hello,"To znaczy, ¿e mam ci zap³aciæ za ochronê? Dziêki, ale nie!",Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice		(Info_Bloodwyn_Hello,"Grozisz mi?",Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
	AI_Output (other, self,"Info_Bloodwyn_ForgetIt_15_00"); //To znaczy, ¿e mam ci zap³aciæ za ochronê? Dziêki, ale nie! Sam sobie dam radê!
	AI_Output (self, other,"Info_Bloodwyn_ForgetIt_08_01"); //Jak sobie chcesz, ch³opcze. Ale wkrótce po¿a³ujesz, ¿e odrzuci³eœ tê przyjacielsk¹ propozycjê!
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
	AI_Output (other, self,"Info_Bloodwyn_SollDrohungSein_15_00"); //Grozisz mi?
	AI_Output (self, other,"Info_Bloodwyn_SollDrohungSein_08_01"); //Wrêcz przeciwnie! Oferujê ci pomoc!
};

func void Info_Bloodwyn_Hello_HowMuch()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //Czemu by nie? Ile mam ci zap³aciæ?
	AI_Output (self, other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //Niewiele. 10 bry³ek rudy, to wszystko.
	
	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Nie mam tyle przy sobie.",Info_Bloodwyn_Hello_NotNow);
	if (Npc_HasItems(other,itminugget)>=10)
	{
		Info_AddChoice	(Info_Bloodwyn_Hello,"Proszê, oto ruda. Przyjació³ nigdy nie za wielu.",Info_Bloodwyn_Hello_OkTakeIt);
	};
};
// -------------------------------------------------------
func void Info_Bloodwyn_Hello_OkTakeIt()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //Proszê, oto ruda. Przyjació³ nigdy nie za wielu.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //Widzê, ¿e m¹dry z ciebie goœæ. Od tej pory bêdziemy ciê mieli na oku.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //Ale to nie znaczy, ¿e mo¿esz tu robiæ, co ci siê ¿ywnie podoba, jasne?
	
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
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_01"); //Trudno. Wezmê co masz. Resztê dop³acisz przy nastêpnym spotkaniu.
	AI_GotoNpc (self,other);
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_02"); //Zobaczmy...
		
	if (Npc_HasItems(other, itminugget) > 0)
	{
		if (Npc_HasItems(other, itminugget) > 9)
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //No patrzcie pañstwo! Ktoœ tu nie umie liczyæ do 10, co?
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //Wezmê wszystko co masz. To mi pomo¿e zapomnieæ, ¿e próbowa³eœ mnie wykiwaæ.
		}
		else
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //O, przyjmujê równie¿ mniejsze datki. W koñcu liczy siê pamiêæ! Dziêki za rudê, ch³opcze!
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //Od tej pory bêdê mia³ na ciebie oko. W Obozie nic ci ju¿ nie grozi.
		};
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //Hmmm, naprawdê jesteœ sp³ukany, co? Trudno. Mo¿e innym razem...
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
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_00"); //Mi³o ciê widzieæ, przyjacielu!
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_01"); //No i jak tam z twoim wsparciem finansowym? Wci¹¿ zalegasz z 10 bry³kami rudy!
		
		Info_ClearChoices	(Info_Bloodwyn_PayDay );
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Proszê. Czym jest 10 bry³ek rudy wobec prawdziwej przyjaŸni.",Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Nie bêdê ci wiêcej p³aci³. Doœæ ju¿ ode mnie dosta³eœ!",Info_Bloodwyn_PayDay_PayNoMore);
	}
	else if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_00"); //Hej, ty!
		AI_Output (other, self,"Info_Bloodwyn_PayDay_Den_15_01"); //Czego znowu?
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_02"); //Pora udowodniæ, ¿e jesteœ prawdziwym przyjacielem.
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_03"); //Marne 10 bry³ek rudy, i wszystko bêdzie w porz¹dku. Co ty na to?
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //Proszê. Czym jest 10 bry³ek rudy wobec prawdziwej przyjaŸni.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //Czytasz w moich myœlach!
	
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //Nie bêdê ci wiêcej p³aci³. Doœæ ju¿ ode mnie dosta³eœ!
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //Zawiod³em siê na tobie! Taki z ciebie przyjaciel? Dobrze, jak sobie chcesz! Od tej pory sam dbaj o siebie. Ja umywam rêce.
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //Bez obawy. Jakoœ sobie poradzê bez twojej pomocy.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //To siê dopiero oka¿e...
	
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
	description = "Zmieni³em zdanie. Postanowi³em jednak zap³aciæ ci te 10 bry³ek rudy.";
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
	AI_Output (other, self,"Info_Bloodwyn_Doch_15_00"); //Zmieni³em zdanie. Postanowi³em jednak zap³aciæ ci te 10 bry³ek rudy.
	if (Npc_HasItems(other, itminugget)>=10)
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_01"); //Trzeba tak by³o od razu! M¹dry z ciebie goœæ.
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_02"); //Ale od tej pory bêdziesz p³aci³ swoj¹ dzienn¹ sk³adkê, co?
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude (self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_NoOre_08_00"); //To wróæ, jak bêdziesz mia³ trochê rudy.
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
	description = "Jesse przys³a³ mnie, ¿ebym zap³aci³ jego 10 bry³ek.";
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
	AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_00"); //Jesse przysy³a mnie, ¿ebym zap³aci³ jego 10 bry³ek.
	if  (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_01"); //Powinieneœ raczej zap³aciæ SWOJE 10 bry³ek.
	};
	AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_02"); //Zapomnij o tym facecie: Jesse i tak d³ugo nie poci¹gnie.
	if (Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_03"); //Nie - zap³acê za niego. Masz tu jego 10 bry³ek i zostaw go w spokoju.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_04"); //Dobra, jak sobie chcesz.
		Jesse_PayForMe = LOG_SUCCESS;
	}
	else
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_05"); //Hmmm... W³aœnie sobie przypomnia³em, ¿e nie mam teraz tyle rudy.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_06"); //To znak, cz³owieku! Przemyœl to sobie. P³ac¹c za tego goœcia wyrzucasz rudê w b³oto!
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
	AI_Output (self, other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //Teraz jesteœ jednym z nas! Dobra robota! Stra¿y przyda siê ktoœ taki jak ty!
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
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_01"); //No proszê, to¿ to nasz zdrajca! A my ciê uwa¿aliœmy za jednego z nas.
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_02"); //Widzê, ¿e przeoczyliœmy jednego z Magów Ognia!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_03"); //To ten Cieñ, który nas zdradzi³!
		};			

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_04"); //Zaraz! O czym ty mówisz, Bloodwyn?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_05"); //Spikn¹³eœ siê z Nowym Obozem, tak?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_06"); //Nie, czekaj! Ja dalej...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_07"); //Co, myœla³eœ, ¿e damy siê tak ³atwo wykiwaæ, hê?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_08"); //Przestañ gadaæ od rzeczy...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_09"); //Zdrajcy tacy jak ty zas³uguj¹ tylko na œmieræ.
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_10"); //GIÑ!!!

		if	Npc_KnowsInfo(hero, Info_Fletcher_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Fletcher, który pilnuje teraz g³ównej bramy, zareagowa³ podobnie jak Bloodwyn. Mam wra¿enie, ¿e ma to coœ wspólnego z moimi poszukiwaniami kamienia ogniskuj¹cego dla Nowego Obozu.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Bloodwyn, który pilnuje teraz po³udniowej bramy Starego Obozu, nazwa³ mnie zdrajc¹. Nie chcia³ mnie nawet wys³uchaæ - od razu rzuci³ siê do ataku!");
			B_LogEntry			(CH4_BannedFromOC,"Wygl¹da na to, ¿e zosta³em wygnany ze Starego Obozu!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_11"); //Postanowi³eœ zobaczyæ, jak wygl¹da œwiat na zewn¹trz Nowego Obozu, co? To by³ b³¹d!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_12"); //No proszê, znudzi³ ci siê twój nowy dom na bagnach? Pope³ni³eœ b³¹d przychodz¹c tutaj.
		};

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_13"); //Co? O co ci chodzi?!
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_14"); //Nie s³ysza³eœ o ataku na wasz¹ kopalniê?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_15"); //Chwileczkê...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_16"); //Przykro mi, ale nie mo¿emy pozwoliæ, ¿ebyœ o tym komuœ powiedzia³!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_17"); //Hej, nie chcê ¿adnych k³opotów...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_18"); //Trzeba by³o o tym pomyœleæ trochê wczeœniej!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_19"); //S³uchaj, mam tego serdecznie doœæ...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_20"); //Ja te¿! ZABIÆ GO!!!
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
		B_LogEntry		(CH4_Firemages,"Bramy do Starego Obozu zosta³y zamkniête i pozostaj¹ pilnie strze¿one. Stra¿nicy atakuj¹ ka¿dego, kto podejdzie w pobli¿e obozu.");
	};
	
	AI_StopProcessInfos	(self);
};

