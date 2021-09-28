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
	AI_Output (other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00"); //Je�t� se uvid�me.
	if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //Dej na sebe pozor, chlap�e.
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //Tady v t�bo�e se ni��m neznepokojuj. Dohl�dneme na tebe.
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
	AI_Output (other, self,"Info_Bloodwyn_Hello_15_01"); //To mluv� se mnou?
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_02"); //Varuju t�! Lidi jako ty se tady dostanou do probl�m� razdva!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_03"); //A v�t�ina chlap�, se kter�mi se tu setk�, jsou bastardi!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_04"); //Mysl� si, �e si s tebou m��ou d�lat, co je napadne. Ale my jim to nedovol�me.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_05"); //Gomez chce, aby byl v t�bo�e klid, a tak ho my, str�e, zaji��ujeme. Je to ale pr�ce, kter� nen� nijak lacin�.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_06"); //To je d�vod, pro� ti ��k�m o p�r nuget�. Ber to jako jak�si projev p��telstv�. Ty pom��e� n�m, my pom��eme tob�. Kdy� se dostane� do mal�ru, my t� z n�j vyt�hneme.

	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Pro� ne? Kolik nuget� m� na mysli?",Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice		(Info_Bloodwyn_Hello,"Chce�, abych zaplatil pen�ze za ochranu? Postar�m se o sebe s�m!",Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice		(Info_Bloodwyn_Hello,"To m� b�t pohr��ka?",Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
	AI_Output (other, self,"Info_Bloodwyn_ForgetIt_15_00"); //Mysl�, �e ti m�m zaplatit za ochranu? Ne, d�ky, postar�m se o sebe s�m!
	AI_Output (self, other,"Info_Bloodwyn_ForgetIt_08_01"); //D�lej, jak mysl�, hochu. Brzy bude� litovat, �e jsi tuhle p��telskou nab�dku odm�tl!
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
	AI_Output (other, self,"Info_Bloodwyn_SollDrohungSein_15_00"); //To m� b�t pohr��ka?
	AI_Output (self, other,"Info_Bloodwyn_SollDrohungSein_08_01"); //Naopak! P��telsk� nab�dka!
};

func void Info_Bloodwyn_Hello_HowMuch()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //Pro� ne? Kolik nuget� m� na mysli?
	AI_Output (self, other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //Ne moc. 10 nuget�, v�c nepot�ebuju.
	
	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Nem�m 10 nuget�.",Info_Bloodwyn_Hello_NotNow);
	if (Npc_HasItems(other,itminugget)>=10)
	{
		Info_AddChoice	(Info_Bloodwyn_Hello,"Tady je tvoje ruda. Jeden �i dva p��tel� se v�dycky m��ou hodit.",Info_Bloodwyn_Hello_OkTakeIt);
	};
};
// -------------------------------------------------------
func void Info_Bloodwyn_Hello_OkTakeIt()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //Tady jsou. P��tele nebo dva m��u v�dycky pot�ebovat.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //Vypad� to, �e jsi rozumn� mlad�k. Od te�ka t� budeme ochra�ovat.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //T�m jsem ale ne�ekl, �e si tu m��e� d�lat, co se ti zl�b�, jasn�?
	
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
	AI_Output (other, self,"Info_Bloodwyn_Hello_NotNow_15_00"); //Nem�m 10 nuget�.
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_01"); //Pak dej, co m� - to bude sta�it. Zbytek mi m��e� d�t, a� se uvid�me p��t�.
	AI_GotoNpc (self,other);
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_02"); //Je�t� se uvid�me...
		
	if (Npc_HasItems(other, itminugget) > 0)
	{
		if (Npc_HasItems(other, itminugget) > 9)
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //Pod�vej se na to. Vypad� snad jako n�kdo, kdo nem��e zaplatit 10 nuget�, co?
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //Vezmu si v�echno, co m�. To mi pom��e zapomenout, �es mi lhal.
		}
		else
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //Vezmu si tak� mal� d�rek. Dobr� v�le se po��t�. D�ky za ty nugety, hochu!
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //Od te�ka budu na tebe d�vat pozor po celou dobu, co bude� v t�bo�e.
		};
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //Hm, opravdu nic nem�. Dobr�, tak �ekn�me, �e p��t�...
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
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_00"); //�, dob�e, �e t� vid�m, p��teli!
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_01"); //Co tv�j denn� p��sp�vek? Dlu�� 10 nuget�, v�ak v�.
		
		Info_ClearChoices	(Info_Bloodwyn_PayDay );
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Tady jsou. 10 nuget� nen� mezi p��teli mnoho.",Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Nezaplat�m - u� jste ze m� vyt�hli dost.",Info_Bloodwyn_PayDay_PayNoMore);
	}
	else if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_00"); //Hej, ty!
		AI_Output (other, self,"Info_Bloodwyn_PayDay_Den_15_01"); //No, co?
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_02"); //M� novou p��le�itost dok�zat, �e jsi opravdov� p��tel.
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_03"); //Jen 10 nuget� a m��e� dovnit� - co ty na to?
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //Tady jsou. 10 nuget� nen� mezi p��teli mnoho.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //Moje slova!
	
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //Nezaplat�m - u� jste ze m� vyt�hli dost.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //Zklamal jsem se v tob�! Tak�e u� nejsme p��tel�. Uvid�, �e jsi ud�lal chybu a okradl s�m sebe!
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //Nem�j obavy, postar�m se o sebe docela dob�e s�m.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //Dobr�, uvid�me...
	
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
	description = "Rozmyslel jsem se. P�ece jen ti t�ch 10 nuget� d�m.";
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
	AI_Output (other, self,"Info_Bloodwyn_Doch_15_00"); //Rozmyslel jsem se. P�ece jen ti t�ch 10 nuget� d�m.
	if (Npc_HasItems(other, itminugget)>=10)
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_01"); //Kone�n�! Vid�, �e se UM͊ dob�e rozhodnout!
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_02"); //A od te�ka mi bude� platit denn� p��sp�vek, jasn�?
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude (self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_NoOre_08_00"); //Tak p�ij�, a� bude� m�t.
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
	description = "Jesse m� poslal, abych za n�j zaplatil 10 nuget�.";
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
	AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_00"); //Jesse m� poslal, abych za n�j zaplatil 10 nuget�.
	if  (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_01"); //M�l bys rad�ji zaplatit SV�CH 10 nuget�.
	};
	AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_02"); //O Jesse se nestarej. Je to ztroskotanec a stejn� tu u� dlouho nez�stane.
	if (Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_03"); //Ne - plat�m za n�j. Tak vem si t�ch 10 nuget� a nech ho na pokoji!
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_04"); //Dobr�, �lov��e, kdy� teda mysl�.
		Jesse_PayForMe = LOG_SUCCESS;
	}
	else
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_05"); //Och! Vypad� to, �e u sebe tolik nem�m.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_06"); //To je znamen�, p��teli! Je�t� se rozmysli! Platit za toho pobudu je vyhazov�n� pen�z!
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
	AI_Output (self, other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //Jsi jedn�m z n�s. Dobr� pr�ce. Str�e pot�ebuj� mu�e jako jsi ty!
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
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_01"); //Mezi n�mi je zr�dce! PCH�! A my jsme t� nazvali str�cem!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_02"); //Vypad� to, jako bysme p�ehl�dli jednoho z t�ch vzbou�en�ch m�g� Ohn�!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_03"); //To St�n n�s zradil!
		};			

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_04"); //Po�kej. O �em jsi to mluvil, Bloodwyne?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_05"); //Tak ty jsi ve spol�en� s Nov�m t�borem, jo?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_06"); //Ne, po�kej, po��d jsem...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_07"); //Asi sis myslel, �e ti to bude proch�zet v��n�.
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_08"); //P�esta� s t�m nesmyslem...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_09"); //Zr�dce jako ty mus� zem��t.
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_10"); //SMRT ZR�DCI!!!

		if	Npc_KnowsInfo(hero, Info_Fletcher_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Fletcher, kter� te� st�e�� hlavn� br�nu, se zachoval stejn� jako Bloodwyn u zadn� br�ny. Nev�m sice jak, ale mus� to n�jak souviset s m�m hled�n�m ohniska pro Nov� t�bor.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Bloodwyn, kter� se skupinou voj�k� st�e�� zadn� br�nu Star�ho t�bora, m� nazval zr�dcem a odpadl�kem. Ani m� nevyslechl a za�to�il na m�!");
			B_LogEntry			(CH4_BannedFromOC,"Vypad� to, �e jsem vyho�t�n ze Star�ho t�bora.");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_11"); //Tak ty ses odv�il opustit Nov� t�bor? To byl hodn� stupidn� n�pad!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_12"); //Och, tak ty ses odv�il opustit t�bor u ba�in? To byl hodn� stupidn� n�pad!
		};

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_13"); //Co? Co m� na mysli?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_14"); //Nesly�el jsi o napaden� va�eho dolu?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_15"); //Co...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_16"); //Je n�m l�to, ale nem��eme t� nechat pou�t�t si takhle hubu na �pac�r!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_17"); //Hej, nechci ��dn� probl�my...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_18"); //Na to's m�l myslet d��v!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_19"); //Posly�, u� toho m�m dost...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_20"); //I j�! ZABIJTE HO!
	};
	
	Npc_ExchangeRoutine	(self,				"FMTaken2");	// Verst�rkung vor das Hinterem Tor (Anf�hrer)
	B_ExchangeRoutine	(GRD_232_Gardist,	"FMTaken2");	// Verst�rkung vor das Hinterem Tor
	B_ExchangeRoutine	(GRD_229_Gardist,	"FMTaken2");	// Verst�rkung vor das Hinterem Tor (Fernk�mpfer)
	B_ExchangeRoutine	(GRD_216_Torwache,	"FMTaken2");	// regul�re Wache am Hinteren Tor
	B_ExchangeRoutine	(GRD_217_Torwache,	"FMTaken2");	// regul�re Wache am Hinteren Tor

	B_SetPermAttitude	(GRD_233_Bloodwyn,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_232_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_229_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_216_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_217_Torwache,	ATT_HOSTILE);

	
	if	!Npc_KnowsInfo(hero, Info_Fletcher_DIE)
	{
		B_LogEntry		(CH4_Firemages,"Br�ny Star�ho t�bora jsou nyn� uzav�eny a hl�d�ny str�emi. Napadaj� ka�d�ho, kdo se p�ibl�� k t�boru.");
	};
	
	AI_StopProcessInfos	(self);
};

