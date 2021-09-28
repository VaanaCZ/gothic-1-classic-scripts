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
	AI_Output (other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00"); //Ještì se uvidíme.
	if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //Dej na sebe pozor, chlapèe.
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //Tady v táboøe se nièím neznepokojuj. Dohlédneme na tebe.
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
	AI_Output (other, self,"Info_Bloodwyn_Hello_15_01"); //To mluvíš se mnou?
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_02"); //Varuju tì! Lidi jako ty se tady dostanou do problémù razdva!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_03"); //A vìtšina chlapù, se kterými se tu setkáš, jsou bastardi!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_04"); //Myslí si, že si s tebou mùžou dìlat, co je napadne. Ale my jim to nedovolíme.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_05"); //Gomez chce, aby byl v táboøe klid, a tak ho my, stráže, zajišujeme. Je to ale práce, která není nijak laciná.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_06"); //To je dùvod, proè ti øíkám o pár nugetù. Ber to jako jakýsi projev pøátelství. Ty pomùžeš nám, my pomùžeme tobì. Když se dostaneš do maléru, my tì z nìj vytáhneme.

	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Proè ne? Kolik nugetù máš na mysli?",Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice		(Info_Bloodwyn_Hello,"Chceš, abych zaplatil peníze za ochranu? Postarám se o sebe sám!",Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice		(Info_Bloodwyn_Hello,"To má být pohrùžka?",Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
	AI_Output (other, self,"Info_Bloodwyn_ForgetIt_15_00"); //Myslíš, že ti mám zaplatit za ochranu? Ne, díky, postarám se o sebe sám!
	AI_Output (self, other,"Info_Bloodwyn_ForgetIt_08_01"); //Dìlej, jak myslíš, hochu. Brzy budeš litovat, že jsi tuhle pøátelskou nabídku odmítl!
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
	AI_Output (other, self,"Info_Bloodwyn_SollDrohungSein_15_00"); //To má být pohrùžka?
	AI_Output (self, other,"Info_Bloodwyn_SollDrohungSein_08_01"); //Naopak! Pøátelská nabídka!
};

func void Info_Bloodwyn_Hello_HowMuch()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //Proè ne? Kolik nugetù máš na mysli?
	AI_Output (self, other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //Ne moc. 10 nugetù, víc nepotøebuju.
	
	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Nemám 10 nugetù.",Info_Bloodwyn_Hello_NotNow);
	if (Npc_HasItems(other,itminugget)>=10)
	{
		Info_AddChoice	(Info_Bloodwyn_Hello,"Tady je tvoje ruda. Jeden èi dva pøátelé se vždycky mùžou hodit.",Info_Bloodwyn_Hello_OkTakeIt);
	};
};
// -------------------------------------------------------
func void Info_Bloodwyn_Hello_OkTakeIt()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //Tady jsou. Pøítele nebo dva mùžu vždycky potøebovat.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //Vypadá to, že jsi rozumný mladík. Od teïka tì budeme ochraòovat.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //Tím jsem ale neøekl, že si tu mùžeš dìlat, co se ti zlíbí, jasný?
	
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
	AI_Output (other, self,"Info_Bloodwyn_Hello_NotNow_15_00"); //Nemám 10 nugetù.
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_01"); //Pak dej, co máš - to bude staèit. Zbytek mi mùžeš dát, až se uvidíme pøíštì.
	AI_GotoNpc (self,other);
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_02"); //Ještì se uvidíme...
		
	if (Npc_HasItems(other, itminugget) > 0)
	{
		if (Npc_HasItems(other, itminugget) > 9)
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //Podívej se na to. Vypadá snad jako nìkdo, kdo nemùže zaplatit 10 nugetù, co?
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //Vezmu si všechno, co máš. To mi pomùže zapomenout, žes mi lhal.
		}
		else
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //Vezmu si také malý dárek. Dobrá vùle se poèítá. Díky za ty nugety, hochu!
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //Od teïka budu na tebe dávat pozor po celou dobu, co budeš v táboøe.
		};
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //Hm, opravdu nic nemáš. Dobrá, tak øeknìme, že pøíštì...
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
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_00"); //Á, dobøe, že tì vidím, pøíteli!
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_01"); //Co tvùj denní pøíspìvek? Dlužíš 10 nugetù, však víš.
		
		Info_ClearChoices	(Info_Bloodwyn_PayDay );
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Tady jsou. 10 nugetù není mezi pøáteli mnoho.",Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Nezaplatím - už jste ze mì vytáhli dost.",Info_Bloodwyn_PayDay_PayNoMore);
	}
	else if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_00"); //Hej, ty!
		AI_Output (other, self,"Info_Bloodwyn_PayDay_Den_15_01"); //No, co?
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_02"); //Máš novou pøíležitost dokázat, že jsi opravdový pøítel.
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_03"); //Jen 10 nugetù a mùžeš dovnitø - co ty na to?
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //Tady jsou. 10 nugetù není mezi pøáteli mnoho.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //Moje slova!
	
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //Nezaplatím - už jste ze mì vytáhli dost.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //Zklamal jsem se v tobì! Takže už nejsme pøátelé. Uvidíš, že jsi udìlal chybu a okradl sám sebe!
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //Nemìj obavy, postarám se o sebe docela dobøe sám.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //Dobrá, uvidíme...
	
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
	description = "Rozmyslel jsem se. Pøece jen ti tìch 10 nugetù dám.";
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
	AI_Output (other, self,"Info_Bloodwyn_Doch_15_00"); //Rozmyslel jsem se. Pøece jen ti tìch 10 nugetù dám.
	if (Npc_HasItems(other, itminugget)>=10)
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_01"); //Koneènì! Vidíš, že se UMÍŠ dobøe rozhodnout!
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_02"); //A od teïka mi budeš platit denní pøíspìvek, jasný?
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude (self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_NoOre_08_00"); //Tak pøijï, až budeš mít.
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
	description = "Jesse mì poslal, abych za nìj zaplatil 10 nugetù.";
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
	AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_00"); //Jesse mì poslal, abych za nìj zaplatil 10 nugetù.
	if  (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_01"); //Mìl bys radìji zaplatit SVÝCH 10 nugetù.
	};
	AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_02"); //O Jesse se nestarej. Je to ztroskotanec a stejnì tu už dlouho nezùstane.
	if (Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_03"); //Ne - platím za nìj. Tak vem si tìch 10 nugetù a nech ho na pokoji!
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_04"); //Dobrá, èlovìèe, když teda myslíš.
		Jesse_PayForMe = LOG_SUCCESS;
	}
	else
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_05"); //Och! Vypadá to, že u sebe tolik nemám.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_06"); //To je znamení, pøíteli! Ještì se rozmysli! Platit za toho pobudu je vyhazování penìz!
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
	AI_Output (self, other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //Jsi jedním z nás. Dobrá práce. Stráže potøebují muže jako jsi ty!
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
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_01"); //Mezi námi je zrádce! PCHÁ! A my jsme tì nazvali strážcem!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_02"); //Vypadá to, jako bysme pøehlídli jednoho z tìch vzbouøených mágù Ohnì!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_03"); //To Stín nás zradil!
		};			

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_04"); //Poèkej. O èem jsi to mluvil, Bloodwyne?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_05"); //Tak ty jsi ve spolèení s Novým táborem, jo?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_06"); //Ne, poèkej, poøád jsem...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_07"); //Asi sis myslel, že ti to bude procházet vìènì.
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_08"); //Pøestaò s tím nesmyslem...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_09"); //Zrádce jako ty musí zemøít.
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_10"); //SMRT ZRÁDCI!!!

		if	Npc_KnowsInfo(hero, Info_Fletcher_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Fletcher, který teï støeží hlavní bránu, se zachoval stejnì jako Bloodwyn u zadní brány. Nevím sice jak, ale musí to nìjak souviset s mým hledáním ohniska pro Nový tábor.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Bloodwyn, který se skupinou vojákù støeží zadní bránu Starého tábora, mì nazval zrádcem a odpadlíkem. Ani mì nevyslechl a zaútoèil na mì!");
			B_LogEntry			(CH4_BannedFromOC,"Vypadá to, že jsem vyhoštìn ze Starého tábora.");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_11"); //Tak ty ses odvážil opustit Nový tábor? To byl hodnì stupidní nápad!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_12"); //Och, tak ty ses odvážil opustit tábor u bažin? To byl hodnì stupidní nápad!
		};

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_13"); //Co? Co máš na mysli?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_14"); //Neslyšel jsi o napadení vašeho dolu?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_15"); //Co...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_16"); //Je nám líto, ale nemùžeme tì nechat pouštìt si takhle hubu na špacír!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_17"); //Hej, nechci žádné problémy...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_18"); //Na to's mìl myslet døív!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_19"); //Poslyš, už toho mám dost...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_20"); //I já! ZABIJTE HO!
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
		B_LogEntry		(CH4_Firemages,"Brány Starého tábora jsou nyní uzavøeny a hlídány strážemi. Napadají každého, kdo se pøiblíží k táboru.");
	};
	
	AI_StopProcessInfos	(self);
};

