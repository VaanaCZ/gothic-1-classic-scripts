//*********************************************
//					 EXIT
//*********************************************
instance DIA_Milten_EXIT (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 999;
	condition	= DIA_Milten_EXIT_Condition;
	information	= DIA_Milten_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Milten_EXIT_Condition()
{
	return 1;
};

func VOID DIA_Milten_EXIT_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_00"); //Ruszamy w drog�.
	}
	else
	{
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_01"); //Do zobaczenia.
	};
	AI_StopProcessInfos	(self);
};

//*********************************************
//					First
//*********************************************

instance DIA_Milten_First (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_First_Condition;
	information	= DIA_Milten_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Milten_First_Condition()
{
	if ( (CorKalom_BringMCQBalls != LOG_SUCCESS) && (!Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE)) )
	&& (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};
};

func VOID DIA_Milten_First_Info()
{
	AI_Output (self, other,"DIA_Milten_First_02_00"); //Nie wolno ci przekroczy� progu tego domu bez pozwolenia Mistrza Corristo.
};

//*********************************************
//					 hallo
//*********************************************

instance DIA_Milten_Hello (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_Hello_Condition;
	information	= DIA_Milten_Hello_Info;
	permanent	= 0;
	description = "Szukam Arcymistrza Kr�gu Ognia.";
};                       

FUNC INT DIA_Milten_Hello_Condition()
{
	if (Saturas_BringFoci == FALSE) && (!Npc_KnowsInfo(hero,DIA_Milten_GotoCorristo))
	{
		return 1;
	};
};

func VOID DIA_Milten_Hello_Info()
{
	AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Szukam Arcymistrza Kr�gu Ognia.
	AI_Output (self, other,"DIA_Milten_Hello_02_01"); //Chodzi ci o Corristo? Czego od niego chcesz?
};

//*********************************************
//					GotoCorristo
//*********************************************
	
instance DIA_Milten_GotoCorristo (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_GotoCorristo_Condition;
	information	= DIA_Milten_GotoCorristo_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Milten_GotoCorristo_Condition()
{
	if  ( (CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE) )
	&&  (Npc_GetTrueGuild (hero) == GIL_STT) 
	{
		return 1;
	};
};

func VOID DIA_Milten_GotoCorristo_Info()
{
	if ( (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) || (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) )
	{
		//***kopierte AI_outputs, falls SC Brief noch hat***
		AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Szukam Arcymistrza Kr�gu Ognia.
		AI_Output (self, other,"DIA_Milten_Hello_02_01"); //Chodzi ci o Corristo? Czego od niego chcesz?
		AI_Output (other, self,"DIA_Milten_Letter_15_00"); //Mam list dla Arcymistrza.
		//AI_Output (self, other,"DIA_Milten_Letter_02_01"); //Bist du ein Bote aus der Au�enwelt?
		//AI_Output (other, self,"DIA_Milten_Letter_15_02"); //Ja. Ein Magier gab mir den Brief, kurz bevor sie mich in die Kolonie geworfen haben.
		AI_Output (self, other,"DIA_Milten_Letter_02_03"); //Poka� to pismo.
		AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Oto i ono.
		B_GiveXP(XP_XardasLetter);
		if		Npc_HasItems(other,ItWr_Fire_Letter_01)
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
		}
		else if	Npc_HasItems(other,ItWr_Fire_Letter_02) 
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
		};
		AI_Output (other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //Chyba nale�y mi si� jaka� nagroda?
		AI_Output (self,hero,"Info_Milten_SHSEAL_02_05"); //To ju� nie b�dzie potrzebne.
		//***kopierte AI_outputs ENDE***
	};
	
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_01"); //S�yszeli�my o twoich dokonaniach w Starej Kopalni. Nasi g�rnicy nie musz� si� ju� obawia� atak�w ze strony pe�zaczy.
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_02"); //Wie�ci o tobie dotar�y nawet do Corristo. Mistrz �yczy sobie z tob� rozmawia�. Id� do niego natychmiast.
};

//*********************************************
//				 Got Brief
//*********************************************
	var int milten_HasLetter;
//*********************************************

instance DIA_Milten_Letter (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_Letter_Condition;
	information	= DIA_Milten_Letter_Info;
	permanent	= 0;
	description = "Mam list dla Arcymistrza.";
};                       

FUNC INT DIA_Milten_Letter_Condition()
{
	if	( (Npc_KnowsInfo(hero, DIA_Milten_Hello)) && ( (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) || (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) ) )
	&&	(Kapitel < 4) && (Saturas_BringFoci == FALSE)
	{
		return 1;
	};
};

func VOID DIA_Milten_Letter_Info()
{
	AI_Output			(other, self,"DIA_Milten_Letter_15_00"); //Mam list dla Arcymistrza.
	AI_Output			(self, other,"DIA_Milten_Letter_02_01"); //Jeste� pos�a�cem z zewn�trznego �wiata?
	AI_Output			(other, self,"DIA_Milten_Letter_15_02"); //Tak. Jaki� mag da� mi to pismo zanim zrzucono mnie na d�.
	AI_Output			(self, other,"DIA_Milten_Letter_02_03"); //Poka� to pismo.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Najpierw chc� dosta� moj� nagrod�.",DIA_Milten_Letter_NO);
	Info_AddChoice		(DIA_Milten_Letter,"Oto i ono.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_Give()
{
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Oto i ono.
	B_UseFakeScroll();
	
	B_GiveXP(XP_XardasLetter);
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_03"); //Ale� ten list zaadresowano do Xardasa!
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_04"); //Co w tym takiego niezwyk�ego?
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_05"); //Xardas ju� od dawna nie jest s�ug� Innosa. Opu�ci� nas wiele lat temu i zwr�ci� si� w stron� czarnej magii.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_06"); //Mieszka w wie�y, w samym �rodku terytorium Ork�w. Chyba ca�kowicie po�wi�ci� si� swoim badaniom.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_07"); //Xardas pr�buje na w�asn� r�k� dowiedzie� si� co posz�o nie tak przy tworzeniu Bariery.
	
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_08"); //Zaczekaj tu na mnie. Nied�ugo wr�c�.
	AI_StopProcessInfos	(self);
	AI_GotoWP (self, "OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self, "OCC_CHAPEL_ENTRANCE");

	if		Npc_HasItems(other,ItWr_Fire_Letter_01)
	{ 
		B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
	}
	else if	Npc_HasItems(other,ItWr_Fire_Letter_02) 
	{ 
		B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
	};
	milten_HasLetter = TRUE;
	Npc_SetRefuseTalk(self,10);
};

func void DIA_Milten_Letter_NO()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_15_00"); //Najpierw chc� dosta� moj� nagrod�.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_01"); //Corristo ka�e Torrezowi wyda� ci nagrod�, jak tylko obejrzy ten list.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_02"); //Jestem s�ug� Innosa - nigdy nie k�ami�. A teraz daj mi ten list.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Wola�bym odda� ten list Torrezowi.",DIA_Milten_Letter_NO_AGAIN);
	Info_AddChoice		(DIA_Milten_Letter,"Oto i ono.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_NO_AGAIN()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_00"); //Wola�bym odda� ten list Torrezowi.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_01"); //Nie dasz si� przekona�, co?
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_02"); //Nie. Najpierw chc� zobaczy� moj� nagrod�.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_03"); //C�. Je�li tego sobie �yczysz. Zaczekaj tutaj.

	Info_ClearChoices	(DIA_Milten_Letter);
	AI_StopProcessInfos	(self);

	AI_GotoWP (self, "OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self, "OCC_CHAPEL_ENTRANCE");
	milten_HasLetter = FALSE;
	Npc_SetRefuseTalk(self,10);
};

//*********************************************
//				 Got Brief
//*********************************************

instance DIA_Milten_ComesBack (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_ComesBack_Condition;
	information	= DIA_Milten_ComesBack_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Milten_ComesBack_Condition()
{
	if ( (Npc_KnowsInfo(hero, DIA_Milten_Letter)) && (Npc_RefuseTalk(self) == FALSE) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_ComesBack_Info()
{
	if (milten_HasLetter==FALSE)
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_00"); //Corristo nie by� zachwycony brakiem szacunku, jaki okaza�e� s�ugom Innosa.
		AI_Output (self, other,"DIA_Milten_ComesBack_02_01"); //Ale powiedzia�, �e mo�esz i�� do Torreza i odebra� zwyczajow� nagrod� pos�a�c�w.
	}
	else
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_02"); //Corristo jest niezwykle uradowany. Powiedzia�, �e mo�esz i�� do Torreza i wybra� sobie nagrod�.
	};
};

//*********************************************
//			Wo finde ich Torrez?
//*********************************************
	
instance DIA_Milten_WoTorrez (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_WoTorrez_Condition;
	information	= DIA_Milten_WoTorrez_Info;
	permanent	= 0;
	description	= "Gdzie znajd� tego Torreza?";
};                       

FUNC INT DIA_Milten_WoTorrez_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Milten_ComesBack) && (Saturas_BringFoci == FALSE) )
	{
		return 1;
	};
};

func VOID DIA_Milten_WoTorrez_Info()
{
	AI_Output (other, self,"DIA_Milten_WoTorrez_15_00"); //Gdzie znajd� tego Torreza?
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_01"); //W ci�gu dnia znajdziesz go pewnie przed �wi�tyni�.
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_02"); //Noc sp�dza w �rodku, jak my wszyscy, ale tylko magom wolno wchodzi� do �wi�tyni, wi�c mo�esz z nim porozmawia� jedynie za dnia.
};

//*********************************************
//				Noch ein Brief
//*********************************************
	
instance DIA_Milten_NochEinBrief (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 2;
	condition	= DIA_Milten_NochEinBrief_Condition;
	information	= DIA_Milten_NochEinBrief_Info;
	permanent	= 0;
	description = "Przynosz� list od Mag�w Wody.";
};                       

FUNC INT DIA_Milten_NochEinBrief_Condition()
{
	if ( (Cronos_Messenger == LOG_RUNNING) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_NochEinBrief_Info()
{
	AI_Output (other, self,"DIA_Milten_NochEinBrief_15_00"); //Przynosz� list od Mag�w Wody.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_01"); //Ach, to �wietnie! Zanios� go Corristo.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_02"); //Magowie Wody z pewno�ci� sowicie wynagrodz� ci� po powrocie do Nowego Obozu.
	
	Cronos_Messenger = LOG_SUCCESS;
	B_GiveInvItems (other,self,Cronos_Brief,1);
};

//*********************************************
//					PERM
//*********************************************
	
instance DIA_Milten_PERM (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_PERM_Condition;
	information	= DIA_Milten_PERM_Info;
	permanent	= 0;
	description = "Opowiedz mi co� o Magach Ognia.";
};                       

FUNC INT DIA_Milten_PERM_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Milten_ComesBack) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_PERM_Info()
{
	AI_Output (other, self,"DIA_Milten_PERM_15_00"); //Opowiedz mi co� o Magach Ognia.
	AI_Output (self, other,"DIA_Milten_PERM_02_01"); //Kr�g Mag�w Ognia czerpie sw� moc z �aski Innosa. B�g �wiat�a, prawdy i sprawiedliwo�ci roztacza nad nami swoj� opiek�.
	AI_Output (self, other,"DIA_Milten_PERM_02_02"); //Magowie s� jego wybra�cami i pozosta�ych ludzi traktuj� w spos�b nale�ny wybra�com.
	AI_Output (self, other,"DIA_Milten_PERM_02_03"); //Przyj�cie do Kr�gu to najwa�niejszy moment w moim �yciu. Opiek� nade mn� roztoczy� sam Corristo, kt�ry twierdzi, �e wnios�em do naszej spo�eczno�ci powiew �wie�o�ci.
	AI_Output (self, other,"DIA_Milten_PERM_02_04"); //Od tej chwili ca�y m�j czas po�wi�cam na ci�g�e doskonalenie umiej�tno�ci magicznych. Mam nadziej�, �e pewnego dnia zostan� przyj�ty do wy�szego Kr�gu.
};

//*********************************************
//					WannaMage
//*********************************************
	
instance DIA_Milten_WannaMage (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 2;
	condition	= DIA_Milten_WannaMage_Condition;
	information	= DIA_Milten_WannaMage_Info;
	permanent	= 1;
	description = "Chcia�bym zosta� uczniem maga, tak jak ty.";
};                       

FUNC INT DIA_Milten_WannaMage_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Milten_PERM) && (CorKalom_BringMCQBalls != LOG_SUCCESS) )
	{
		return 1;
	};
};

func VOID DIA_Milten_WannaMage_Info()
{
	AI_Output (other, self,"DIA_Milten_WannaMage_15_00"); //Chcia�bym zosta� uczniem maga, tak jak ty.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_01"); //Corristo wybra� mnie, bo odda�em szczeg�lne us�ugi pot�nym Magnatom.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_02"); //Je�li naprawd� chcesz zosta� jego uczniem, musisz wykaza� si� czym� niezwyk�ym.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_03"); //No i oczywi�cie musisz najpierw zosta� przyj�ty do Starego Obozu. Corristo niech�tnie patrzy na ludzi z innych osiedli.
};





		
	







//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info SHWAIT
//***************************************************************************
instance Info_Milten_SHWAIT (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHWAIT_Condition;
	information	= Info_Milten_SHWAIT_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHWAIT_Condition()
{
	if ( Npc_GetDistToWP ( hero, "OW_PATH_274")<1000)
	{
		return 1;
	};	
};

func void Info_Milten_SHWAIT_Info()
{
	AI_GotoNpc		(self,hero);
	
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_01"); //Witaj! M�j przyjaciel Lester, z obozu na bagnie powiadomi� mnie o twoich niezwyk�ych czynach!
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_02"); //Jestem pod wra�eniem. Sta�e� si� bardzo pot�ny.
	AI_Output		(hero,self,"Info_Milten_SHWAIT_15_03"); //Robi� co mog�.
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_04"); //Ach, zawsze skromny, co?
};

//***************************************************************************
//	Info SHGORN
//***************************************************************************
instance Info_Milten_SHGORN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHGORN_Condition;
	information	= Info_Milten_SHGORN_Info;
	important	= 0;
	permanent	= 0;
	description	= "Spotka�em Gorna.";
};

FUNC int Info_Milten_SHGORN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT) && Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHGORN_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_01"); //Spotka�em Gorna.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_02"); //Naprawd�? Gdzie?
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_03"); //W ruinach klasztoru, nad morzem. Bawili�my si� w poszukiwaczy skarb�w.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_04"); //Zapewne nie omieszka mi o tym opowiedzie� podczas naszego nast�pnego spotkania.
};

//***************************************************************************
//	Info SHLESTER
//***************************************************************************
instance Info_Milten_SHLESTER (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHLESTER_Condition;
	information	= Info_Milten_SHLESTER_Info;
	important	= 0;
	permanent	= 0;
	description	= "Lester i ja rozejrzeli�my si� troch� po fortecy w g�rach.";
};

FUNC int Info_Milten_SHLESTER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT) && Npc_KnowsInfo(hero, PC_Psionic_FINISH))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHLESTER_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_01"); //Lester i ja rozejrzeli�my si� troch� po fortecy w g�rach.
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_02"); //Tak, s�ysza�em. Wygl�da na to, �e mo�na ci zaufa�.
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_03"); //Gdzie wasza czw�rka zwyk�a si� spotyka�?
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_04"); //Ach, tu i tam. Spotykamy si� w najr�niejszych miejscach.
};

//***************************************************************************
//	Info SHYOU
//***************************************************************************
instance Info_Milten_SHYOU (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHYOU_Condition;
	information	= Info_Milten_SHYOU_Info;
	important	= 0;
	permanent	= 0;
	description	= "Co tu robisz?";
};

FUNC int Info_Milten_SHYOU_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT))
	{
		return 1;
	};	
};

func void Info_Milten_SHYOU_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_01"); //Co tu robisz?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_02"); //Niedaleko st�d le�y staro�ytny kamienny kr�g. W jego centrum znajduje si� wej�cie do podziemnej komory.
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_03"); //Jaki� rodzaj grobowca?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_04"); //Tak, co� w tym rodzaju.
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_05"); //W tym grobowcu znajduje si� przedmiot, kt�ry chcia�bym zdoby�.
};

//***************************************************************************
//	Info SHME
//***************************************************************************
instance Info_Milten_SHME (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHME_Condition;
	information	= Info_Milten_SHME_Info;
	important	= 0;
	permanent	= 0;
	description	= "Szukam kamienia ogniskuj�cego.";
};

FUNC int Info_Milten_SHME_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_SHWAIT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	{
		return 1;
	};	
};

func void Info_Milten_SHME_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHME_15_01"); //Szukam kamienia ogniskuj�cego. Powinien gdzie� tam by�.
	AI_Output		(self,hero,"Info_Milten_SHME_02_02"); //Wygl�da na to, �e obydwaj szukamy czego� w tym samym miejscu.
};

//***************************************************************************
//	Info SHPROBLEM
//***************************************************************************
instance Info_Milten_SHPROBLEM (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHPROBLEM_Condition;
	information	= Info_Milten_SHPROBLEM_Info;
	important	= 0;
	permanent	= 0;
	description	= "Dlaczego nie zejdziesz do grobowca i nie zabierzesz tego, czego szukasz?";
};

FUNC int Info_Milten_SHPROBLEM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHYOU))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_01"); //Dlaczego nie zejdziesz do grobowca i nie zabierzesz tego, czego szukasz?
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_02"); //Och, to d�uga historia. Musia�bym zanudza� ci� opowie�ci� o bardzo dawnych czasach.
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_03"); //�mia�o, nigdzie mi si� nie spieszy.
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_04"); //No dobrze! Po utworzeniu magicznej Bariery, kt�ra sta�a si� naszym wsp�lnym wi�zieniem...
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_05"); //... Jeden z mag�w zamkn�� pod ziemi� pot�ny artefakt.
};

//***************************************************************************
//	Info SHFOCUS
//***************************************************************************
instance Info_Milten_SHFOCUS (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHFOCUS_Condition;
	information	= Info_Milten_SHFOCUS_Info;
	important	= 0;
	permanent	= 0;
	description	= "Czy�by� m�wi� o jednym z pi�ciu kamieni ogniskuj�cych?";
};

FUNC int Info_Milten_SHFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHFOCUS_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_01"); //Czy�by� m�wi� o jednym z pi�ciu kamieni ogniskuj�cych?
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_02"); //Dok�adnie! A wi�c znasz ju� histori� pi�ciu kamieni?
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_03"); //Tylko mi nie m�w, �e ty te� szukasz tego kamienia!
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_04"); //Nie. Nie interesuje mnie kamie� ogniskuj�cy. Szukam pewnego talizmanu Ork�w.
};

//***************************************************************************
//	Info SHSEAL
//***************************************************************************
instance Info_Milten_SHSEAL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSEAL_Condition;
	information	= Info_Milten_SHSEAL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Artefakt jest w jaki� spos�b chroniony?";
};

FUNC int Info_Milten_SHSEAL_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSEAL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_01"); //Artefakt jest w jaki� spos�b chroniony?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_02"); //Tak. Strze�e go pot�ne zakl�cie. Pierwszy rabu�, kt�ry spr�buje go zabra�...
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_03"); //... b�dzie przekl�ty i zostanie skazany na wieczn� egzystencj� jako O�ywieniec. Od tej pory po wsze czasy sam stanie si� stra�nikiem kamienia, kt�ry pr�bowa� ukra��.
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_04"); //Czy istnieje jaki� spos�b na unikni�cie kl�twy?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_05"); //To ju� nie b�dzie potrzebne.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_06"); //Kilka lat temu jeden z Magnat�w poluj�cy dla rozrywki na Ork�w okaza� si� na tyle bezmy�lny, �e zszed� do grobowca.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_07"); //Teraz ON jest stra�nikiem spoczywaj�cych pod ziemi� skarb�w.
};

//***************************************************************************
//	Info SHTALISMAN
//***************************************************************************
instance Info_Milten_SHTALISMAN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHTALISMAN_Condition;
	information	= Info_Milten_SHTALISMAN_Info;
	important	= 0;
	permanent	= 0;
	description	= "A co z twoim talizmanem?";
};

FUNC int Info_Milten_SHTALISMAN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHFOCUS))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHTALISMAN_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHTALISMAN_15_01"); //A co z twoim talizmanem?
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_02"); //Jestem przekonany, �e jego poprzedni w�a�ciciel wykorzystywa� go do ochrony przed rozw�cieczonymi Orkami.
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_03"); //Je�li mam racj�, ten talizman mo�e si� okaza� niezwykle przydatny.
};

//***************************************************************************
//	Info SHOFFER
//***************************************************************************
instance Info_Milten_SHOFFER (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHOFFER_Condition;
	information	= Info_Milten_SHOFFER_Info;
	important	= 0;
	permanent	= 0;
	description	= "Zatem powinni�my wsp�lnie przeszuka� ten grobowiec!";
};

FUNC int Info_Milten_SHOFFER_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHSEAL)
	&&		Npc_KnowsInfo(hero, Info_Milten_SHTALISMAN)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHOFFER_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_01"); //Zatem powinni�my wsp�lnie przeszuka� ten grobowiec! Ty znajdziesz sw�j talizman, a ja - m�j kamie� ogniskuj�cy!
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_02"); //W porz�dku, ale jest pewien ma�y problem...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_03"); //Problem?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_04"); //Tak. Stra�nik podziemnej krypty...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_05"); //A nie mo�na go po prostu posieka� na drobne kawa�eczki?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_06"); //To nie b�dzie takie proste. Ten o�ywieniec zdaje si� by� niezwykle odporny na dzia�anie zwyk�ego or�a.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_07"); //Niech zgadn�: pewnie masz ju� jaki� plan, jak go pokona�, tak?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_08"); //Umm... No c�... MAM pewien plan, ale nie jestem w stanie sam go wykona�.
};

//***************************************************************************
//	Info SHOFFER2
//***************************************************************************
instance Info_Milten_SHOFFER2 (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHOFFER2_Condition;
	information	= Info_Milten_SHOFFER2_Info;
	important	= 0;
	permanent	= 0;
	description	= "Zamieniam si� w s�uch!";
};

FUNC int Info_Milten_SHOFFER2_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHOFFER)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHOFFER2_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_01"); //Zamieniam si� w s�uch!
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_02"); //Mam przy sobie magiczny zw�j z niezwykle pot�nym zakl�ciem.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_03"); //To zakl�cie natychmiast niszczy wszystkich o�ywie�c�w znajduj�cych si� w okolicy.
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_04"); //Zatem dostanie si� do grobowca powinno by� dziecinnie proste, prawda?
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_05"); //Hmmm... Nie zupe�nie! Obawiam si�, �e nasz przekl�ty stra�nik nie jest ju� sam.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_06"); //Wygl�da na to, �e rabusie, kt�rzy przyszli po nim mieli r�wnie ma�o szcz�cia co on sam.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_07"); //Pewnego razu zszed�em na d� i ma�o brakowa�o, a postrada�bym �ycie. Jeden cz�owiek nie sprosta wszystkim przeciwnikom.
};

//***************************************************************************
//	Info SHACCEPT
//***************************************************************************
instance Info_Milten_SHACCEPT (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHACCEPT_Condition;
	information	= Info_Milten_SHACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description	= "Daj mi ten magiczny zw�j i razem zajmiemy si� tymi o�ywie�cami!";
};

FUNC int Info_Milten_SHACCEPT_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHOFFER2)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHACCEPT_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_01"); //Daj mi ten magiczny zw�j i razem zajmiemy si� tymi o�ywie�cami!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_02"); //Ha! Mia�em nadziej�, �e to powiesz.
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_03"); //Niestety, mam tylko jeden zw�j. Wykorzystaj go przeciw Stra�nikowi.
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_04"); //Pozosta�e o�ywie�ce mo�na zabi� zwyk�ym or�em.
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_05"); //Rozumiem. No dobrze, kt�r�dy do tego kamiennego kr�gu?
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_06"); //Chod� za mn�!

	Log_CreateTopic		(CH3_Stonehenge,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_RUNNING);
	B_LogEntry		(CH3_Stonehenge,"W pobli�u kamiennego kr�gu spotka�em Miltena, jednego z mag�w Ognia. Od niego dowiedzia�em si�, �e kamie�, kt�rego szukam, spoczywa w podziemnej krypcie pod kr�giem.");
	B_LogEntry		(CH3_Stonehenge,"Milten da� mi magiczny zw�j, przy u�yciu kt�rego pokonam o�ywie�ca strzeg�cego krypty. Na szcz�cie na d� zejdziemy razem.");
	
	CreateInvItem		(self,	ItArScrollDestroyUndead);
	B_GiveInvItems  (self, hero, ItArScrollDestroyUndead, 1);

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine	(self, "SHGuide");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHARRIVED
//***************************************************************************
instance Info_Milten_SHARRIVED (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHARRIVED_Condition;
	information	= Info_Milten_SHARRIVED_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHARRIVED_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHACCEPT) && (Npc_GetDistToWP(hero, "OW_PATH_3_STONES")<500) )
	{
		return TRUE;
	};	
};

func void Info_Milten_SHARRIVED_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHARRIVED_02_01"); //No i jeste�my. Ten tunel prowadzi wprost do grobowca. 
	AI_Output			(hero,self,"Info_Milten_SHARRIVED_15_02"); //Zatem ruszajmy. Pora z�o�y� wizyt� stra�nikom.

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine	(self,	"SHFollow");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHHEAL
//***************************************************************************
instance Info_Milten_SHHEAL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHHEAL_Condition;
	information	= Info_Milten_SHHEAL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Jestem ranny. Mo�esz mi pom�c?";
};

FUNC int Info_Milten_SHHEAL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)
	&&		(hero.attribute[ATR_HITPOINTS] < ((hero.attribute[ATR_HITPOINTS_MAX]*7)/10))
	&&		(Npc_HasItems(hero,ItFo_Potion_Health_02) == 0)								)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHHEAL_Info()
{
	AI_Output				(hero,self,"Info_Milten_SHHEAL_15_01"); //Jestem ranny. Mo�esz mi pom�c?

	if (	(Npc_HasItems(self,ItFo_Potion_Health_02) >  0)		)
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_02"); //We� ten nap�j uzdrawiaj�cy.
		B_GiveInvItems	    (self, hero,	ItFo_Potion_Health_02,	1);
	}
	else
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_03"); //Nie mam ju� �adnych magicznych wywar�w.
	};	

	AI_StopProcessInfos		(self);
};

//***************************************************************************
//	Info SHRUNNING
//***************************************************************************
instance Info_Milten_SHRUNNING (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHRUNNING_Condition;
	information	= Info_Milten_SHRUNNING_Info;
	important	= 0;
	permanent	= 1;
	description	= "Stra�nik wci�� �yje!";
};

FUNC int Info_Milten_SHRUNNING_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,Info_Milten_SHACCEPT)
	&&	(keeperFound && !Npc_IsDead(other))							// W�chter noch nicht besiegt...
	{
		return TRUE;
	};	
};

func void Info_Milten_SHRUNNING_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHRUNNING_15_01"); 	//Stra�nik wci�� �yje!
	AI_Output			(self,hero,"Info_Milten_SHRUNNING_02_02"); 	//Wi�c zniszcz go przy u�yciu magicznego zwoju!
};

//***************************************************************************
//	Info SHSCROLL
//***************************************************************************
instance Info_Milten_SHSCROLL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSCROLL_Condition;
	information	= Info_Milten_SHSCROLL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Wykorzysta�em zw�j!";
};

FUNC int Info_Milten_SHSCROLL_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);
	if (	(keeperFound && !Npc_IsDead(other))							// W�chter noch nicht besiegt...
	&&		Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		(Npc_HasItems(hero, ItArScrollDestroyUndead)==0)	
	&&		(Npc_HasItems(hero, ItArRuneDestroyUndead)==0)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSCROLL_15_01"); //Wykorzysta�em zw�j, ale niestety nie na Stra�niku!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_02"); //Jeste�my zgubieni! Chyba, �e znajdziesz jaki� inny spos�b, �eby go pokona�!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_03"); //Mo�e w kt�rym� z oboz�w uda ci si� kupi� nast�pny zw�j albo magiczn� run�.
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_04"); //Zaczekam na ciebie w miejscu, w kt�rym si� spotkali�my.

  	self.aivar[AIV_PARTYMEMBER] =	FALSE;

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"SHWait");
};

//***************************************************************************
//	Info SHNEWSCROLL
//***************************************************************************
instance Info_Milten_SHNEWSCROLL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHNEWSCROLL_Condition;
	information	= Info_Milten_SHNEWSCROLL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Mam nowy zw�j z zakl�ciem '�mier� O�ywie�com'!";
};

FUNC int Info_Milten_SHNEWSCROLL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHSCROLL)
	&&		!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)	
	&&		((Npc_HasItems(hero, ItArScrollDestroyUndead)>0) ||	(Npc_HasItems(hero, ItArRuneDestroyUndead)>0))	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHNEWSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHNEWSCROLL_15_01"); //Mam nowy zw�j z zakl�ciem "�mier� O�ywie�com!"
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_02"); //To wspaniale! Mo�emy z�o�y� Stra�nikowi kolejn� wizyt�!
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_03"); //Id� przodem. P�jd� za tob�.

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"SHFollow");
};

//***************************************************************************
//	Info SHLEAVE
//***************************************************************************
instance Info_Milten_SHLEAVE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHLEAVE_Condition;
	information	= Info_Milten_SHLEAVE_Info;
	important	= 1;
	permanent	= 1;
};

FUNC int Info_Milten_SHLEAVE_Condition()
{
	if	 Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)		
	&&	(Npc_GetDistToWP(hero, "OW_PATH_3_STONES")>10000)
  	&&	(self.aivar[AIV_PARTYMEMBER] ==	TRUE)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHLEAVE_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_01"); 	//Czy�by� straci� zainteresowanie tym grobowcem?
	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_02"); 	//Jakby� zmieni� zdanie, znajdziesz mnie w miejscu naszego pierwszego spotkania.

  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine	(self,	"SHWait");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHCONTINUE
//***************************************************************************
instance Info_Milten_SHCONTINUE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHCONTINUE_Condition;
	information	= Info_Milten_SHCONTINUE_Info;
	important	= 0;
	permanent	= 1;
	description = "To jak? Schodzimy znowu do krypty?";
};

FUNC int Info_Milten_SHCONTINUE_Condition()
{
	if	(self.aivar[AIV_PARTYMEMBER] == FALSE)
	&&	Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)
	&&	(Npc_GetDistToWP(hero, "OW_PATH_3_STONES")<9000)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHCONTINUE_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(hero,self,"Info_Milten_SHCONTINUE_15_01"); //To jak? Schodzimy znowu do krypty?
	AI_Output			(self,hero,"Info_Milten_SHCONTINUE_02_02"); //Jestem got�w. Id� przodem. P�jd� za tob�.

  	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"SHFollow");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHSUCCESS
//***************************************************************************
instance Info_Milten_SHSUCCESS (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSUCCESS_Condition;
	information	= Info_Milten_SHSUCCESS_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHSUCCESS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHACCEPT) && Npc_HasItems(hero, ItMi_OrcTalisman))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSUCCESS_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_01"); //Dobrze. Widz�, �e znalaz�e� talizman.
	AI_Output			(hero,self,"Info_Milten_SHSUCCESS_15_02"); //Prosz�, we� go. Taka by�a umowa.
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_03"); //Dzi�kuj�, przyjacielu. Nigdy nie zapominam o ludziach, kt�rzy mi pomogli.
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_04"); //Wr�c� teraz do Starego Obozu. Mo�e tam si� jeszcze kiedy� spotkamy.
	
	B_GiveInvItems	(hero,self,	ItMi_OrcTalisman, 1);
	
	B_LogEntry		(CH3_Stonehenge,"Wsp�lnymi si�ami uda�o si� nam pokona� stra�nika kamiennego kr�gu. Milten zabra� swoj� cz�� zdobyczy i wr�ci� do Starego Obozu.");
	B_LogEntry		(CH3_Stonehenge,"Saturas ucieszy si�, �e odnalaz�em ten kamie� ogniskuj�cy!");
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine	(self, "ReturnToOC");
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info OCWARN
//***************************************************************************
instance Info_Milten_OCWARN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCWARN_Condition;
	information	= Info_Milten_OCWARN_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

func void Info_Milten_OCWARN_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_OCWARN_02_01"); //Oni... nie �yj�... Wszyscy zgin�li... Nie mog�em im pom�c... By�em za daleko... Ja...

	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_02"); //Spokojnie, Miltenie. Spotka�em ju� Diego po drugiej stronie Obozu.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_03"); //Zatem wiesz ju�, co si� sta�o. Co ci powiedzia� Diego?
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_04"); //Powiedzia�, �e je�li spotkam Gorna i Lestera, mam im powiedzie�, �e spotkanie odb�dzie si� tam gdzie zwykle.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_05"); //Powodzenia i uwa�aj na siebie!
		B_LogEntry		(CH4_Firemages,"Milten, podobnie jak Diego, ukrywa� si� w pobli�u Starego Obozu. Teraz Mag Ognia uprzedza przyjaci� o niebezpiecze�stwie czyhaj�cym na nich w �rodku.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_06"); //Uspok�j si�, Miltenie. Co si� sta�o?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_07"); //Wymordowali Mag�w Ognia! Wszystkich... opr�cz mnie. Ale nawet ja otar�em si� o �mier�.
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_08"); //Lepiej opowiedz mi wszystko po kolei, od samego pocz�tku.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_09"); //Ju� dobrze, uspok�j si�, przyjacielu.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_10"); //Wszystko zacz�o si� od zawalenia Starej Kopalni?
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_11"); //Zawalenia Starej Kopalni?!?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_12"); //Tak. To dzia�o si� tak szybko. Nikt nie zdo�a� si� wydosta�.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_13"); //Stra�nicy zablokowali wej�cie do kopalni.
	};
};

//***************************************************************************
//	Info OCMINE
//***************************************************************************
instance Info_Milten_OCMINE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCMINE_Condition;
	information	= Info_Milten_OCMINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Jak do tego dosz�o?";
};

FUNC int Info_Milten_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCMINE_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_01"); //Jak do tego dosz�o?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_02"); //Nie mam poj�cia. Kilku Kopaczy stoj�cych przy wej�ciu m�wi�o co� o pot�nym wstrz�sie i wielkiej chmurze py�u z tunelu.
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_03"); //By�e� tam, kiedy to si� sta�o?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_04"); //Tak. St�d wiem o zawaleniu si� kopalni.
};

//***************************************************************************
//	Info OCKDW
//***************************************************************************
instance Info_Milten_OCKDW (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCKDW_Condition;
	information	= Info_Milten_OCKDW_Info;
	important	= 0;
	permanent	= 0;
	description = "M�wi�e� co� o Magach Ognia?";
};

FUNC int Info_Milten_OCKDW_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCKDW_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCKDW_15_01"); //M�wi�e� co� o Magach Ognia?
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_02"); //Wiem tylko, �e wszyscy zostali zabici przez Magnat�w tu� po zawaleniu si� Starej Kopalni.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_03"); //Kiedy wr�ci�em z naszej wyprawy pod kamienny kr�g, stra�nicy przy bramie rzucili si� na mnie bez ostrze�enia.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_04"); //Krzyczeli "zdrajca" i "spiskowiec". Ledwie uszed�em z �yciem.
};

//***************************************************************************
//	Info OCWHY
//***************************************************************************
instance Info_Milten_OCWHY (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCWHY_Condition;
	information	= Info_Milten_OCWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Dlaczego Magnaci mieliby wymordowa� Mag�w? To bez sensu!";
};

FUNC int Info_Milten_OCWHY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCKDW))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCWHY_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCWHY_15_01"); //Dlaczego Magnaci mieliby wymordowa� Mag�w? To bez sensu!
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_02"); //Wiem, ale nie mia�em czasu, �eby zapyta� stra�nik�w. Zaatakowali mnie natychmiast.
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_03"); //Mo�e Diego b�dzie wiedzia� wi�cej. By� w Obozie, kiedy rozegra�a si� ta tragedia.
};

//***************************************************************************
//	Info OCYOU
//***************************************************************************
instance Info_Milten_OCYOU (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCYOU_Condition;
	information	= Info_Milten_OCYOU_Info;
	important	= 0;
	permanent	= 0;
	description = "Powiniene� si� ukry�. Najlepiej daleko st�d.";
};

FUNC int Info_Milten_OCYOU_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCKDW))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCYOU_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCYOU_15_01"); //Powiniene� si� ukry�. Najlepiej daleko st�d.
	AI_Output			(self,hero,"Info_Milten_OCYOU_02_02"); //Nie. Diego kaza� mi pilnowa� drugiego wej�cia do Obozu. Mamy ostrzega� naszych przyjaci� przed niebezpiecze�stwem.

	if (!Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{	
		AI_Output		(self,hero,"Info_Milten_OCYOU_02_03"); //Prosz�, porozmawiaj z Diego!
	}
	else
	{
		B_LogEntry		(CH4_Firemages,"Po tym jak Diego opowiedzia� mi o tych niewiarygodnych wydarzeniach, przed g��wn� bram� Starego Obozu wpad�em na Miltena. Mam nadziej�, �e nie wpadn� w �apy Stra�nik�w!");
	};
};

//***************************************************************************
//	Info OCDIEGO
//***************************************************************************
instance Info_Milten_OCDIEGO (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCDIEGO_Condition;
	information	= Info_Milten_OCDIEGO_Info;
	important	= 0;
	permanent	= 0;
	description = "Gdzie znajd� Diego?";
};

FUNC int Info_Milten_OCDIEGO_Condition()
{
	if Npc_KnowsInfo(hero, Info_Milten_OCWHY)
	&& Npc_KnowsInfo(hero, Info_Milten_OCYOU)
	&& !Npc_KnowsInfo(hero, Info_Diego_OCSTORY)
	{
		return TRUE;
	};	
};

func void Info_Milten_OCDIEGO_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCDIEGO_15_01"); //Gdzie znajd� Diego?
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_02"); //Ukrywa si� po drugiej stronie Obozu, w pobli�u tylnej bramy.
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_03"); //Musisz z nim koniecznie porozmawia�!

	B_LogEntry			(CH4_Firemages,"Przed g��wn� bram� Starego Obozu spotka�em Miltena, kt�ry opowiedzia� mi o zawaleniu si� Starej Kopalni i wymordowaniu wszystkich Mag�w Ognia.");
	B_LogEntry			(CH4_Firemages,"Diego ukrywa si� po przeciwnej stronie obozu. Mam z nim porozmawia� - pono� wie nieco wi�cej o tych straszliwych wydarzeniach.");
};










//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_LOADSWORD_Condition;
	information	= Info_Milten_LOADSWORD_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_LOADSWORD_Condition()
{
	if (LoadSword)
	{
		return TRUE;
	};	
};

func void Info_Milten_LOADSWORD_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LOADSWORD_02_01"); //Witaj, przyjacielu! Dawno si� nie widzieli�my.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_02"); //Cze��, Milten! Wiele si� wydarzy�o od naszego ostatniego spotkania.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_03"); //Ch�tnie bym ci wszystko opowiedzia�, ale chwilowo nie mam czasu. Bardzo si� spiesz�.
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD1 (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LOADSWORD1_Condition;
	information		= Info_Milten_LOADSWORD1_Info;
	important		= 0;
	permanent		= 0;
	description		= "Potrzebuj� twojej pomocy!"; 
};

FUNC int Info_Milten_LOADSWORD1_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD)
	{
		return 1;
	};	
};

func void Info_Milten_LOADSWORD1_Info()
{
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_01"); //Potrzebuj� twojej pomocy!
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_02"); //Co si� sta�o? Jak mog� ci pom�c?
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_03"); //Chod�my w jakie� ustronne miejsce, gdzie b�dziemy mogli spokojnie porozmawia�.
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_04"); //Dobrze. Chod� za mn�.

	Npc_ExchangeRoutine	(self,	"LSAway");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info LSAWAY
//---------------------------------------------------------------------
instance Info_Milten_LSAWAY (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSAWAY_Condition;
	information		= Info_Milten_LSAWAY_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSAWAY_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD1)
	&&	(Npc_GetDistToWP(hero, "NC_KDW04_IN") < 500)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSAWAY_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_01"); //A teraz m�w - co si� sta�o?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_02"); //Musz� wykorzysta� magiczn� energi� kopca rudy, a wola�bym nie pyta� Mag�w Wody o pozwolenie.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_03"); //�artujesz sobie ze mnie!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_04"); //To nie pora na �arty. M�wi� powa�nie.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_05"); //Spotka�em Xardasa, Nekromant�!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_06"); //Wype�niam jego polecenia!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_07"); //XARDAS?! Zaczynasz mnie przera�a�!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_08"); //Nikt z nim nie rozmawia� odk�d opu�ci� Stary Ob�z.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_09"); //Ja rozmawia�em!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_10"); //Do czego potrzebna ci jest energia kopca rudy?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_11"); //Musz� j� skumulowa� w tym oto mieczu.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_12"); //C� za niesamowita bro�!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_13"); //Nazywa si� URIZIEL!
};


//---------------------------------------------------------------------
//	Info LOADSWORD4
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD4 (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LOADSWORD4_Condition;
	information		= Info_Milten_LOADSWORD4_Info;
	important		= 0;
	permanent		= 0;
	description		= "Xardas da� mi magiczne zakl�cie!"; 
};

FUNC int Info_Milten_LOADSWORD4_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSAWAY)
	{
		return 1;
	};	
};

func void Info_Milten_LOADSWORD4_Info()
{
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_01"); //Xardas da� mi magiczne zakl�cie, kt�re pozwoli mi przenie�� energi�!
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_02"); //B�dziesz musia� je odczyta�, podczas gdy ja dotkn� rudy mieczem!
	B_UseFakeScroll		();
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_03"); //Hmmm... M�wisz, �e trzeba je tylko odczyta�?
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_04"); //Ale Saturas i jego magowie nie puszcz� nam tego p�azem!
};







//---------------------------------------------------------------------
//	Info LSRISK
//---------------------------------------------------------------------
instance Info_Milten_LSRISK (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSRISK_Condition;
	information		= Info_Milten_LSRISK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Musimy zaryzykowa�!"; 
};

FUNC int Info_Milten_LSRISK_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD4)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSRISK_Info()
{
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_01"); //Musimy zaryzykowa�!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_02"); //To bardzo, BARDZO wa�ne!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_03"); //Wa�ne dla WSZYSTKICH mieszka�c�w kolonii...
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_04"); //Nic nie rozumiem.
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_05"); //Dzi�ki temu wydostaniemy si� na wolno��! Musisz mi zaufa�!
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_06"); //Dobrze! Po tym wszystkim, co dla nas zrobi�e�, ufam ci bezgranicznie.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_07"); //No i wygl�da na to, �e nawet Xardas darzy ci� zaufaniem.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_08"); //Spotkamy si� przy kopcu rudy. Tylko nikomu ani s�owa!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_09"); //Dobrze, zatem spotkamy si� przy kopcu! Do zobaczenia!
	
	B_LogEntry			(CH5_Uriziel,"Uda�o mi si� przekona� Miltena do pomocy w ponownym na�adowaniu Uriziela magi�. Spotkamy si� u st�p kopca rudy.");
	Npc_ExchangeRoutine	(self,	"LSOreHeap");
	B_ExchangeRoutine	(Sld_726_Soeldner,	"loadsword");

	AI_StopProcessInfos	(self);
};


//---------------------------------------------------------------------
//	Info LSOREHEAP
//---------------------------------------------------------------------
instance Info_Milten_LSOREHEAP (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSOREHEAP_Condition;
	information		= Info_Milten_LSOREHEAP_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSOREHEAP_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSRISK )
	&&	(Npc_GetDistToWP(hero, "NC_PATH41") < 500)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSOREHEAP_Info()
{
	//AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LSOREHEAP_02_01"); //Masz miecz i zakl�cie?
};
	
//***************************************************************************
//	Info LSNOW
//***************************************************************************
instance Info_Milten_LSNOW (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSNOW_Condition;
	information		= Info_Milten_LSNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Prosz�, oto ono!"; 
};

FUNC int Info_Milten_LSNOW_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSOREHEAP)
	&&	Npc_HasItems (hero, Mythrilklinge01)
	&&	Npc_HasItems (hero, Scroll4Milten)
	&&	(Npc_GetDistToWP(hero, "NC_PATH41") < 1000)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSNOW_Info()
{
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_01"); //Prosz�, oto ono!
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_02"); //Jeste� got�w?
	AI_Output			(self, hero,"Info_Milten_LSNOW_02_03"); //Nie, ale nie mamy wielkiego wyboru. Teraz albo nigdy!
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_04"); //Zatem do dzie�a!

	B_GiveInvItems 	(hero, self, Scroll4Milten, 1);	
	B_GiveInvItems 	(hero, self, Mythrilklinge01, 1);	

	StartChaptersSix = TRUE;

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info CHAPTERSIX
//---------------------------------------------------------------------
instance Info_Milten_CHAPTERSIX (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_CHAPTERSIX_Condition;
	information		= Info_Milten_CHAPTERSIX_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_CHAPTERSIX_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSNOW)
	&&	StartChaptersSix
	{
		return TRUE;
	};	
};

func void Info_Milten_CHAPTERSIX_Info()
{
	AI_StopProcessInfos	(self);
	B_Kapitelwechsel	(6);
};
	
//---------------------------------------------------------------------
//	Info LSDONE
//---------------------------------------------------------------------
instance Info_Milten_LSDONE (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSDONE_Condition;
	information		= Info_Milten_LSDONE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSDONE_Condition()
{
	if	(Kapitel == 6)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSDONE_Info()
{
	//AI_GotoNpc				(self, hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_01"); //Gotowe!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_02"); //Niesamowite! Ten szary kryszta� rozb�ysn�� pi�knym b��kitem!

	AI_EquipBestMeleeWeapon	(hero);
	AI_ReadyMeleeWeapon		(hero);
	AI_PlayAni				(hero, "T_1HSINSPECT");
	AI_RemoveWeapon			(hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_03"); //To dobry znak! Wygl�da na to, �e ca�a energia z kopca zosta�a przeniesiona na miecz!
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_04"); //Ale nasze dzia�ania zwr�ci�y uwag� stra�nik�w!
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_05"); //Teleportuj si� st�d, natychmiast!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_06"); //A co z tob�?
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_07"); //O mnie si� nie martw! Co� wymy�l�! Uciekaj st�d! Ju�!

	B_Story_UrizielLoaded	();
	
	AI_StopProcessInfos	(self);
};




//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################
