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
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_00"); //Ruszamy w drogę.
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
	AI_Output (self, other,"DIA_Milten_First_02_00"); //Nie wolno ci przekroczyć progu tego domu bez pozwolenia Mistrza Corristo.
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
	description = "Szukam Arcymistrza Kręgu Ognia.";
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
	AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Szukam Arcymistrza Kręgu Ognia.
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
		AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Szukam Arcymistrza Kręgu Ognia.
		AI_Output (self, other,"DIA_Milten_Hello_02_01"); //Chodzi ci o Corristo? Czego od niego chcesz?
		AI_Output (other, self,"DIA_Milten_Letter_15_00"); //Mam list dla Arcymistrza.
		//AI_Output (self, other,"DIA_Milten_Letter_02_01"); //Bist du ein Bote aus der Außenwelt?
		//AI_Output (other, self,"DIA_Milten_Letter_15_02"); //Ja. Ein Magier gab mir den Brief, kurz bevor sie mich in die Kolonie geworfen haben.
		AI_Output (self, other,"DIA_Milten_Letter_02_03"); //Pokaż to pismo.
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
		AI_Output (other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //Chyba należy mi się jakaś nagroda?
		AI_Output (self,hero,"Info_Milten_SHSEAL_02_05"); //To już nie będzie potrzebne.
		//***kopierte AI_outputs ENDE***
	};
	
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_01"); //Słyszeliśmy o twoich dokonaniach w Starej Kopalni. Nasi górnicy nie muszą się już obawiać ataków ze strony pełzaczy.
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_02"); //Wieści o tobie dotarły nawet do Corristo. Mistrz życzy sobie z tobą rozmawiać. Idź do niego natychmiast.
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
	AI_Output			(self, other,"DIA_Milten_Letter_02_01"); //Jesteś posłańcem z zewnętrznego świata?
	AI_Output			(other, self,"DIA_Milten_Letter_15_02"); //Tak. Jakiś mag dał mi to pismo zanim zrzucono mnie na dół.
	AI_Output			(self, other,"DIA_Milten_Letter_02_03"); //Pokaż to pismo.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Najpierw chcę dostać moją nagrodę.",DIA_Milten_Letter_NO);
	Info_AddChoice		(DIA_Milten_Letter,"Oto i ono.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_Give()
{
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Oto i ono.
	B_UseFakeScroll();
	
	B_GiveXP(XP_XardasLetter);
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_03"); //Ależ ten list zaadresowano do Xardasa!
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_04"); //Co w tym takiego niezwykłego?
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_05"); //Xardas już od dawna nie jest sługą Innosa. Opuścił nas wiele lat temu i zwrócił się w stronę czarnej magii.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_06"); //Mieszka w wieży, w samym środku terytorium Orków. Chyba całkowicie poświęcił się swoim badaniom.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_07"); //Xardas próbuje na własną rękę dowiedzieć się co poszło nie tak przy tworzeniu Bariery.
	
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_08"); //Zaczekaj tu na mnie. Niedługo wrócę.
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
	AI_Output (other, self,"DIA_Milten_Letter_NO_15_00"); //Najpierw chcę dostać moją nagrodę.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_01"); //Corristo każe Torrezowi wydać ci nagrodę, jak tylko obejrzy ten list.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_02"); //Jestem sługą Innosa - nigdy nie kłamię. A teraz daj mi ten list.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Wolałbym oddać ten list Torrezowi.",DIA_Milten_Letter_NO_AGAIN);
	Info_AddChoice		(DIA_Milten_Letter,"Oto i ono.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_NO_AGAIN()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_00"); //Wolałbym oddać ten list Torrezowi.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_01"); //Nie dasz się przekonać, co?
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_02"); //Nie. Najpierw chcę zobaczyć moją nagrodę.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_03"); //Cóż. Jeśli tego sobie życzysz. Zaczekaj tutaj.

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
		AI_Output (self, other,"DIA_Milten_ComesBack_02_00"); //Corristo nie był zachwycony brakiem szacunku, jaki okazałeś sługom Innosa.
		AI_Output (self, other,"DIA_Milten_ComesBack_02_01"); //Ale powiedział, że możesz iść do Torreza i odebrać zwyczajową nagrodę posłańców.
	}
	else
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_02"); //Corristo jest niezwykle uradowany. Powiedział, że możesz iść do Torreza i wybrać sobie nagrodę.
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
	description	= "Gdzie znajdę tego Torreza?";
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
	AI_Output (other, self,"DIA_Milten_WoTorrez_15_00"); //Gdzie znajdę tego Torreza?
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_01"); //W ciągu dnia znajdziesz go pewnie przed świątynią.
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_02"); //Noc spędza w środku, jak my wszyscy, ale tylko magom wolno wchodzić do świątyni, więc możesz z nim porozmawiać jedynie za dnia.
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
	description = "Przynoszę list od Magów Wody.";
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
	AI_Output (other, self,"DIA_Milten_NochEinBrief_15_00"); //Przynoszę list od Magów Wody.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_01"); //Ach, to świetnie! Zaniosę go Corristo.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_02"); //Magowie Wody z pewnością sowicie wynagrodzą cię po powrocie do Nowego Obozu.
	
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
	description = "Opowiedz mi coś o Magach Ognia.";
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
	AI_Output (other, self,"DIA_Milten_PERM_15_00"); //Opowiedz mi coś o Magach Ognia.
	AI_Output (self, other,"DIA_Milten_PERM_02_01"); //Krąg Magów Ognia czerpie swą moc z łaski Innosa. Bóg światła, prawdy i sprawiedliwości roztacza nad nami swoją opiekę.
	AI_Output (self, other,"DIA_Milten_PERM_02_02"); //Magowie są jego wybrańcami i pozostałych ludzi traktują w sposób należny wybrańcom.
	AI_Output (self, other,"DIA_Milten_PERM_02_03"); //Przyjęcie do Kręgu to najważniejszy moment w moim życiu. Opiekę nade mną roztoczył sam Corristo, który twierdzi, że wniosłem do naszej społeczności powiew świeżości.
	AI_Output (self, other,"DIA_Milten_PERM_02_04"); //Od tej chwili cały mój czas poświęcam na ciągłe doskonalenie umiejętności magicznych. Mam nadzieję, że pewnego dnia zostanę przyjęty do wyższego Kręgu.
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
	description = "Chciałbym zostać uczniem maga, tak jak ty.";
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
	AI_Output (other, self,"DIA_Milten_WannaMage_15_00"); //Chciałbym zostać uczniem maga, tak jak ty.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_01"); //Corristo wybrał mnie, bo oddałem szczególne usługi potężnym Magnatom.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_02"); //Jeśli naprawdę chcesz zostać jego uczniem, musisz wykazać się czymś niezwykłym.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_03"); //No i oczywiście musisz najpierw zostać przyjęty do Starego Obozu. Corristo niechętnie patrzy na ludzi z innych osiedli.
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
	
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_01"); //Witaj! Mój przyjaciel Lester, z obozu na bagnie powiadomił mnie o twoich niezwykłych czynach!
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_02"); //Jestem pod wrażeniem. Stałeś się bardzo potężny.
	AI_Output		(hero,self,"Info_Milten_SHWAIT_15_03"); //Robię co mogę.
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
	description	= "Spotkałem Gorna.";
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
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_01"); //Spotkałem Gorna.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_02"); //Naprawdę? Gdzie?
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_03"); //W ruinach klasztoru, nad morzem. Bawiliśmy się w poszukiwaczy skarbów.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_04"); //Zapewne nie omieszka mi o tym opowiedzieć podczas naszego następnego spotkania.
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
	description	= "Lester i ja rozejrzeliśmy się trochę po fortecy w górach.";
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
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_01"); //Lester i ja rozejrzeliśmy się trochę po fortecy w górach.
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_02"); //Tak, słyszałem. Wygląda na to, że można ci zaufać.
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_03"); //Gdzie wasza czwórka zwykła się spotykać?
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_04"); //Ach, tu i tam. Spotykamy się w najróżniejszych miejscach.
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
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_02"); //Niedaleko stąd leży starożytny kamienny krąg. W jego centrum znajduje się wejście do podziemnej komory.
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_03"); //Jakiś rodzaj grobowca?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_04"); //Tak, coś w tym rodzaju.
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_05"); //W tym grobowcu znajduje się przedmiot, który chciałbym zdobyć.
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
	description	= "Szukam kamienia ogniskującego.";
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
	AI_Output		(hero,self,"Info_Milten_SHME_15_01"); //Szukam kamienia ogniskującego. Powinien gdzieś tam być.
	AI_Output		(self,hero,"Info_Milten_SHME_02_02"); //Wygląda na to, że obydwaj szukamy czegoś w tym samym miejscu.
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
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_02"); //Och, to długa historia. Musiałbym zanudzać cię opowieścią o bardzo dawnych czasach.
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_03"); //Śmiało, nigdzie mi się nie spieszy.
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_04"); //No dobrze! Po utworzeniu magicznej Bariery, która stała się naszym wspólnym więzieniem...
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_05"); //... Jeden z magów zamknął pod ziemią potężny artefakt.
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
	description	= "Czyżbyś mówił o jednym z pięciu kamieni ogniskujących?";
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
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_01"); //Czyżbyś mówił o jednym z pięciu kamieni ogniskujących?
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_02"); //Dokładnie! A więc znasz już historię pięciu kamieni?
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_03"); //Tylko mi nie mów, że ty też szukasz tego kamienia!
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_04"); //Nie. Nie interesuje mnie kamień ogniskujący. Szukam pewnego talizmanu Orków.
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
	description	= "Artefakt jest w jakiś sposób chroniony?";
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
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_01"); //Artefakt jest w jakiś sposób chroniony?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_02"); //Tak. Strzeże go potężne zaklęcie. Pierwszy rabuś, który spróbuje go zabrać...
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_03"); //... będzie przeklęty i zostanie skazany na wieczną egzystencję jako Ożywieniec. Od tej pory po wsze czasy sam stanie się strażnikiem kamienia, który próbował ukraść.
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_04"); //Czy istnieje jakiś sposób na uniknięcie klątwy?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_05"); //To już nie będzie potrzebne.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_06"); //Kilka lat temu jeden z Magnatów polujący dla rozrywki na Orków okazał się na tyle bezmyślny, że zszedł do grobowca.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_07"); //Teraz ON jest strażnikiem spoczywających pod ziemią skarbów.
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
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_02"); //Jestem przekonany, że jego poprzedni właściciel wykorzystywał go do ochrony przed rozwścieczonymi Orkami.
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_03"); //Jeśli mam rację, ten talizman może się okazać niezwykle przydatny.
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
	description	= "Zatem powinniśmy wspólnie przeszukać ten grobowiec!";
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
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_01"); //Zatem powinniśmy wspólnie przeszukać ten grobowiec! Ty znajdziesz swój talizman, a ja - mój kamień ogniskujący!
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_02"); //W porządku, ale jest pewien mały problem...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_03"); //Problem?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_04"); //Tak. Strażnik podziemnej krypty...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_05"); //A nie można go po prostu posiekać na drobne kawałeczki?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_06"); //To nie będzie takie proste. Ten ożywieniec zdaje się być niezwykle odporny na działanie zwykłego oręża.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_07"); //Niech zgadnę: pewnie masz już jakiś plan, jak go pokonać, tak?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_08"); //Umm... No cóż... MAM pewien plan, ale nie jestem w stanie sam go wykonać.
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
	description	= "Zamieniam się w słuch!";
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
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_01"); //Zamieniam się w słuch!
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_02"); //Mam przy sobie magiczny zwój z niezwykle potężnym zaklęciem.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_03"); //To zaklęcie natychmiast niszczy wszystkich ożywieńców znajdujących się w okolicy.
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_04"); //Zatem dostanie się do grobowca powinno być dziecinnie proste, prawda?
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_05"); //Hmmm... Nie zupełnie! Obawiam się, że nasz przeklęty strażnik nie jest już sam.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_06"); //Wygląda na to, że rabusie, którzy przyszli po nim mieli równie mało szczęścia co on sam.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_07"); //Pewnego razu zszedłem na dół i mało brakowało, a postradałbym życie. Jeden człowiek nie sprosta wszystkim przeciwnikom.
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
	description	= "Daj mi ten magiczny zwój i razem zajmiemy się tymi ożywieńcami!";
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
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_01"); //Daj mi ten magiczny zwój i razem zajmiemy się tymi ożywieńcami!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_02"); //Ha! Miałem nadzieję, że to powiesz.
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_03"); //Niestety, mam tylko jeden zwój. Wykorzystaj go przeciw Strażnikowi.
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_04"); //Pozostałe ożywieńce można zabić zwykłym orężem.
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_05"); //Rozumiem. No dobrze, którędy do tego kamiennego kręgu?
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_06"); //Chodź za mną!

	Log_CreateTopic		(CH3_Stonehenge,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_RUNNING);
	B_LogEntry		(CH3_Stonehenge,"W pobliżu kamiennego kręgu spotkałem Miltena, jednego z magów Ognia. Od niego dowiedziałem się, że kamień, którego szukam, spoczywa w podziemnej krypcie pod kręgiem.");
	B_LogEntry		(CH3_Stonehenge,"Milten dał mi magiczny zwój, przy użyciu którego pokonam ożywieńca strzegącego krypty. Na szczęście na dół zejdziemy razem.");
	
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

	AI_Output			(self,hero,"Info_Milten_SHARRIVED_02_01"); //No i jesteśmy. Ten tunel prowadzi wprost do grobowca. 
	AI_Output			(hero,self,"Info_Milten_SHARRIVED_15_02"); //Zatem ruszajmy. Pora złożyć wizytę strażnikom.

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
	description	= "Jestem ranny. Możesz mi pomóc?";
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
	AI_Output				(hero,self,"Info_Milten_SHHEAL_15_01"); //Jestem ranny. Możesz mi pomóc?

	if (	(Npc_HasItems(self,ItFo_Potion_Health_02) >  0)		)
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_02"); //Weź ten napój uzdrawiający.
		B_GiveInvItems	    (self, hero,	ItFo_Potion_Health_02,	1);
	}
	else
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_03"); //Nie mam już żadnych magicznych wywarów.
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
	description	= "Strażnik wciąż żyje!";
};

FUNC int Info_Milten_SHRUNNING_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,Info_Milten_SHACCEPT)
	&&	(keeperFound && !Npc_IsDead(other))							// Wächter noch nicht besiegt...
	{
		return TRUE;
	};	
};

func void Info_Milten_SHRUNNING_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHRUNNING_15_01"); 	//Strażnik wciąż żyje!
	AI_Output			(self,hero,"Info_Milten_SHRUNNING_02_02"); 	//Więc zniszcz go przy użyciu magicznego zwoju!
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
	description	= "Wykorzystałem zwój!";
};

FUNC int Info_Milten_SHSCROLL_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);
	if (	(keeperFound && !Npc_IsDead(other))							// Wächter noch nicht besiegt...
	&&		Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		(Npc_HasItems(hero, ItArScrollDestroyUndead)==0)	
	&&		(Npc_HasItems(hero, ItArRuneDestroyUndead)==0)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSCROLL_15_01"); //Wykorzystałem zwój, ale niestety nie na Strażniku!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_02"); //Jesteśmy zgubieni! Chyba, że znajdziesz jakiś inny sposób, żeby go pokonać!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_03"); //Może w którymś z obozów uda ci się kupić następny zwój albo magiczną runę.
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_04"); //Zaczekam na ciebie w miejscu, w którym się spotkaliśmy.

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
	description	= "Mam nowy zwój z zaklęciem 'Śmierć Ożywieńcom'!";
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
	AI_Output			(hero,self,"Info_Milten_SHNEWSCROLL_15_01"); //Mam nowy zwój z zaklęciem "Śmierć Ożywieńcom!"
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_02"); //To wspaniale! Możemy złożyć Strażnikowi kolejną wizytę!
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_03"); //Idź przodem. Pójdę za tobą.

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

	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_01"); 	//Czyżbyś stracił zainteresowanie tym grobowcem?
	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_02"); 	//Jakbyś zmienił zdanie, znajdziesz mnie w miejscu naszego pierwszego spotkania.

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
	AI_Output			(self,hero,"Info_Milten_SHCONTINUE_02_02"); //Jestem gotów. Idź przodem. Pójdę za tobą.

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

	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_01"); //Dobrze. Widzę, że znalazłeś talizman.
	AI_Output			(hero,self,"Info_Milten_SHSUCCESS_15_02"); //Proszę, weź go. Taka była umowa.
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_03"); //Dziękuję, przyjacielu. Nigdy nie zapominam o ludziach, którzy mi pomogli.
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_04"); //Wrócę teraz do Starego Obozu. Może tam się jeszcze kiedyś spotkamy.
	
	B_GiveInvItems	(hero,self,	ItMi_OrcTalisman, 1);
	
	B_LogEntry		(CH3_Stonehenge,"Wspólnymi siłami udało się nam pokonać strażnika kamiennego kręgu. Milten zabrał swoją część zdobyczy i wrócił do Starego Obozu.");
	B_LogEntry		(CH3_Stonehenge,"Saturas ucieszy się, że odnalazłem ten kamień ogniskujący!");
	
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

	AI_Output			(self,hero,"Info_Milten_OCWARN_02_01"); //Oni... nie żyją... Wszyscy zginęli... Nie mogłem im pomóc... Byłem za daleko... Ja...

	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_02"); //Spokojnie, Miltenie. Spotkałem już Diego po drugiej stronie Obozu.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_03"); //Zatem wiesz już, co się stało. Co ci powiedział Diego?
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_04"); //Powiedział, że jeśli spotkam Gorna i Lestera, mam im powiedzieć, że spotkanie odbędzie się tam gdzie zwykle.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_05"); //Powodzenia i uważaj na siebie!
		B_LogEntry		(CH4_Firemages,"Milten, podobnie jak Diego, ukrywał się w pobliżu Starego Obozu. Teraz Mag Ognia uprzedza przyjaciół o niebezpieczeństwie czyhającym na nich w środku.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_06"); //Uspokój się, Miltenie. Co się stało?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_07"); //Wymordowali Magów Ognia! Wszystkich... oprócz mnie. Ale nawet ja otarłem się o śmierć.
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_08"); //Lepiej opowiedz mi wszystko po kolei, od samego początku.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_09"); //Już dobrze, uspokój się, przyjacielu.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_10"); //Wszystko zaczęło się od zawalenia Starej Kopalni?
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_11"); //Zawalenia Starej Kopalni?!?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_12"); //Tak. To działo się tak szybko. Nikt nie zdołał się wydostać.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_13"); //Strażnicy zablokowali wejście do kopalni.
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
	description = "Jak do tego doszło?";
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
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_01"); //Jak do tego doszło?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_02"); //Nie mam pojęcia. Kilku Kopaczy stojących przy wejściu mówiło coś o potężnym wstrząsie i wielkiej chmurze pyłu z tunelu.
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_03"); //Byłeś tam, kiedy to się stało?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_04"); //Tak. Stąd wiem o zawaleniu się kopalni.
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
	description = "Mówiłeś coś o Magach Ognia?";
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
	AI_Output			(hero,self,"Info_Milten_OCKDW_15_01"); //Mówiłeś coś o Magach Ognia?
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_02"); //Wiem tylko, że wszyscy zostali zabici przez Magnatów tuż po zawaleniu się Starej Kopalni.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_03"); //Kiedy wróciłem z naszej wyprawy pod kamienny krąg, strażnicy przy bramie rzucili się na mnie bez ostrzeżenia.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_04"); //Krzyczeli "zdrajca" i "spiskowiec". Ledwie uszedłem z życiem.
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
	description = "Dlaczego Magnaci mieliby wymordować Magów? To bez sensu!";
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
	AI_Output			(hero,self,"Info_Milten_OCWHY_15_01"); //Dlaczego Magnaci mieliby wymordować Magów? To bez sensu!
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_02"); //Wiem, ale nie miałem czasu, żeby zapytać strażników. Zaatakowali mnie natychmiast.
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_03"); //Może Diego będzie wiedział więcej. Był w Obozie, kiedy rozegrała się ta tragedia.
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
	description = "Powinieneś się ukryć. Najlepiej daleko stąd.";
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
	AI_Output			(hero,self,"Info_Milten_OCYOU_15_01"); //Powinieneś się ukryć. Najlepiej daleko stąd.
	AI_Output			(self,hero,"Info_Milten_OCYOU_02_02"); //Nie. Diego kazał mi pilnować drugiego wejścia do Obozu. Mamy ostrzegać naszych przyjaciół przed niebezpieczeństwem.

	if (!Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{	
		AI_Output		(self,hero,"Info_Milten_OCYOU_02_03"); //Proszę, porozmawiaj z Diego!
	}
	else
	{
		B_LogEntry		(CH4_Firemages,"Po tym jak Diego opowiedział mi o tych niewiarygodnych wydarzeniach, przed główną bramą Starego Obozu wpadłem na Miltena. Mam nadzieję, że nie wpadną w łapy Strażników!");
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
	description = "Gdzie znajdę Diego?";
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
	AI_Output			(hero,self,"Info_Milten_OCDIEGO_15_01"); //Gdzie znajdę Diego?
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_02"); //Ukrywa się po drugiej stronie Obozu, w pobliżu tylnej bramy.
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_03"); //Musisz z nim koniecznie porozmawiać!

	B_LogEntry			(CH4_Firemages,"Przed główną bramą Starego Obozu spotkałem Miltena, który opowiedział mi o zawaleniu się Starej Kopalni i wymordowaniu wszystkich Magów Ognia.");
	B_LogEntry			(CH4_Firemages,"Diego ukrywa się po przeciwnej stronie obozu. Mam z nim porozmawiać - ponoć wie nieco więcej o tych straszliwych wydarzeniach.");
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

	AI_Output			(self, hero,"Info_Milten_LOADSWORD_02_01"); //Witaj, przyjacielu! Dawno się nie widzieliśmy.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_02"); //Cześć, Milten! Wiele się wydarzyło od naszego ostatniego spotkania.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_03"); //Chętnie bym ci wszystko opowiedział, ale chwilowo nie mam czasu. Bardzo się spieszę.
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
	description		= "Potrzebuję twojej pomocy!"; 
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
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_01"); //Potrzebuję twojej pomocy!
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_02"); //Co się stało? Jak mogę ci pomóc?
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_03"); //Chodźmy w jakieś ustronne miejsce, gdzie będziemy mogli spokojnie porozmawiać.
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_04"); //Dobrze. Chodź za mną.

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

	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_01"); //A teraz mów - co się stało?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_02"); //Muszę wykorzystać magiczną energię kopca rudy, a wolałbym nie pytać Magów Wody o pozwolenie.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_03"); //Żartujesz sobie ze mnie!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_04"); //To nie pora na żarty. Mówię poważnie.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_05"); //Spotkałem Xardasa, Nekromantę!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_06"); //Wypełniam jego polecenia!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_07"); //XARDAS?! Zaczynasz mnie przerażać!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_08"); //Nikt z nim nie rozmawiał odkąd opuścił Stary Obóz.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_09"); //Ja rozmawiałem!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_10"); //Do czego potrzebna ci jest energia kopca rudy?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_11"); //Muszę ją skumulować w tym oto mieczu.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_12"); //Cóż za niesamowita broń!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_13"); //Nazywa się URIZIEL!
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
	description		= "Xardas dał mi magiczne zaklęcie!"; 
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
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_01"); //Xardas dał mi magiczne zaklęcie, które pozwoli mi przenieść energię!
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_02"); //Będziesz musiał je odczytać, podczas gdy ja dotknę rudy mieczem!
	B_UseFakeScroll		();
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_03"); //Hmmm... Mówisz, że trzeba je tylko odczytać?
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_04"); //Ale Saturas i jego magowie nie puszczą nam tego płazem!
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
	description		= "Musimy zaryzykować!"; 
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
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_01"); //Musimy zaryzykować!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_02"); //To bardzo, BARDZO ważne!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_03"); //Ważne dla WSZYSTKICH mieszkańców kolonii...
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_04"); //Nic nie rozumiem.
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_05"); //Dzięki temu wydostaniemy się na wolność! Musisz mi zaufać!
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_06"); //Dobrze! Po tym wszystkim, co dla nas zrobiłeś, ufam ci bezgranicznie.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_07"); //No i wygląda na to, że nawet Xardas darzy cię zaufaniem.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_08"); //Spotkamy się przy kopcu rudy. Tylko nikomu ani słowa!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_09"); //Dobrze, zatem spotkamy się przy kopcu! Do zobaczenia!
	
	B_LogEntry			(CH5_Uriziel,"Udało mi się przekonać Miltena do pomocy w ponownym naładowaniu Uriziela magią. Spotkamy się u stóp kopca rudy.");
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

	AI_Output			(self, hero,"Info_Milten_LSOREHEAP_02_01"); //Masz miecz i zaklęcie?
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
	description		= "Proszę, oto ono!"; 
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
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_01"); //Proszę, oto ono!
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_02"); //Jesteś gotów?
	AI_Output			(self, hero,"Info_Milten_LSNOW_02_03"); //Nie, ale nie mamy wielkiego wyboru. Teraz albo nigdy!
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_04"); //Zatem do dzieła!

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
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_02"); //Niesamowite! Ten szary kryształ rozbłysnął pięknym błękitem!

	AI_EquipBestMeleeWeapon	(hero);
	AI_ReadyMeleeWeapon		(hero);
	AI_PlayAni				(hero, "T_1HSINSPECT");
	AI_RemoveWeapon			(hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_03"); //To dobry znak! Wygląda na to, że cała energia z kopca została przeniesiona na miecz!
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_04"); //Ale nasze działania zwróciły uwagę strażników!
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_05"); //Teleportuj się stąd, natychmiast!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_06"); //A co z tobą?
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_07"); //O mnie się nie martw! Coś wymyślę! Uciekaj stąd! Już!

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
