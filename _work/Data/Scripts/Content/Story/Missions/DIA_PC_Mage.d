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
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_00"); //Ruszamy w drogê.
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
	AI_Output (self, other,"DIA_Milten_First_02_00"); //Nie wolno ci przekroczyæ progu tego domu bez pozwolenia Mistrza Corristo.
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
	description = "Szukam Arcymistrza Krêgu Ognia.";
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
	AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Szukam Arcymistrza Krêgu Ognia.
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
		AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Szukam Arcymistrza Krêgu Ognia.
		AI_Output (self, other,"DIA_Milten_Hello_02_01"); //Chodzi ci o Corristo? Czego od niego chcesz?
		AI_Output (other, self,"DIA_Milten_Letter_15_00"); //Mam list dla Arcymistrza.
		//AI_Output (self, other,"DIA_Milten_Letter_02_01"); //Bist du ein Bote aus der Außenwelt?
		//AI_Output (other, self,"DIA_Milten_Letter_15_02"); //Ja. Ein Magier gab mir den Brief, kurz bevor sie mich in die Kolonie geworfen haben.
		AI_Output (self, other,"DIA_Milten_Letter_02_03"); //Poka¿ to pismo.
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
		AI_Output (other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //Chyba nale¿y mi siê jakaœ nagroda?
		AI_Output (self,hero,"Info_Milten_SHSEAL_02_05"); //To ju¿ nie bêdzie potrzebne.
		//***kopierte AI_outputs ENDE***
	};
	
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_01"); //S³yszeliœmy o twoich dokonaniach w Starej Kopalni. Nasi górnicy nie musz¹ siê ju¿ obawiaæ ataków ze strony pe³zaczy.
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_02"); //Wieœci o tobie dotar³y nawet do Corristo. Mistrz ¿yczy sobie z tob¹ rozmawiaæ. IdŸ do niego natychmiast.
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
	AI_Output			(self, other,"DIA_Milten_Letter_02_01"); //Jesteœ pos³añcem z zewnêtrznego œwiata?
	AI_Output			(other, self,"DIA_Milten_Letter_15_02"); //Tak. Jakiœ mag da³ mi to pismo zanim zrzucono mnie na dó³.
	AI_Output			(self, other,"DIA_Milten_Letter_02_03"); //Poka¿ to pismo.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Najpierw chcê dostaæ moj¹ nagrodê.",DIA_Milten_Letter_NO);
	Info_AddChoice		(DIA_Milten_Letter,"Oto i ono.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_Give()
{
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Oto i ono.
	B_UseFakeScroll();
	
	B_GiveXP(XP_XardasLetter);
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_03"); //Ale¿ ten list zaadresowano do Xardasa!
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_04"); //Co w tym takiego niezwyk³ego?
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_05"); //Xardas ju¿ od dawna nie jest s³ug¹ Innosa. Opuœci³ nas wiele lat temu i zwróci³ siê w stronê czarnej magii.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_06"); //Mieszka w wie¿y, w samym œrodku terytorium Orków. Chyba ca³kowicie poœwiêci³ siê swoim badaniom.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_07"); //Xardas próbuje na w³asn¹ rêkê dowiedzieæ siê co posz³o nie tak przy tworzeniu Bariery.
	
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_08"); //Zaczekaj tu na mnie. Nied³ugo wrócê.
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
	AI_Output (other, self,"DIA_Milten_Letter_NO_15_00"); //Najpierw chcê dostaæ moj¹ nagrodê.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_01"); //Corristo ka¿e Torrezowi wydaæ ci nagrodê, jak tylko obejrzy ten list.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_02"); //Jestem s³ug¹ Innosa - nigdy nie k³amiê. A teraz daj mi ten list.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Wola³bym oddaæ ten list Torrezowi.",DIA_Milten_Letter_NO_AGAIN);
	Info_AddChoice		(DIA_Milten_Letter,"Oto i ono.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_NO_AGAIN()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_00"); //Wola³bym oddaæ ten list Torrezowi.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_01"); //Nie dasz siê przekonaæ, co?
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_02"); //Nie. Najpierw chcê zobaczyæ moj¹ nagrodê.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_03"); //Có¿. Jeœli tego sobie ¿yczysz. Zaczekaj tutaj.

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
		AI_Output (self, other,"DIA_Milten_ComesBack_02_00"); //Corristo nie by³ zachwycony brakiem szacunku, jaki okaza³eœ s³ugom Innosa.
		AI_Output (self, other,"DIA_Milten_ComesBack_02_01"); //Ale powiedzia³, ¿e mo¿esz iœæ do Torreza i odebraæ zwyczajow¹ nagrodê pos³añców.
	}
	else
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_02"); //Corristo jest niezwykle uradowany. Powiedzia³, ¿e mo¿esz iœæ do Torreza i wybraæ sobie nagrodê.
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
	description	= "Gdzie znajdê tego Torreza?";
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
	AI_Output (other, self,"DIA_Milten_WoTorrez_15_00"); //Gdzie znajdê tego Torreza?
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_01"); //W ci¹gu dnia znajdziesz go pewnie przed œwi¹tyni¹.
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_02"); //Noc spêdza w œrodku, jak my wszyscy, ale tylko magom wolno wchodziæ do œwi¹tyni, wiêc mo¿esz z nim porozmawiaæ jedynie za dnia.
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
	description = "Przynoszê list od Magów Wody.";
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
	AI_Output (other, self,"DIA_Milten_NochEinBrief_15_00"); //Przynoszê list od Magów Wody.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_01"); //Ach, to œwietnie! Zaniosê go Corristo.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_02"); //Magowie Wody z pewnoœci¹ sowicie wynagrodz¹ ciê po powrocie do Nowego Obozu.
	
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
	description = "Opowiedz mi coœ o Magach Ognia.";
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
	AI_Output (other, self,"DIA_Milten_PERM_15_00"); //Opowiedz mi coœ o Magach Ognia.
	AI_Output (self, other,"DIA_Milten_PERM_02_01"); //Kr¹g Magów Ognia czerpie sw¹ moc z ³aski Innosa. Bóg œwiat³a, prawdy i sprawiedliwoœci roztacza nad nami swoj¹ opiekê.
	AI_Output (self, other,"DIA_Milten_PERM_02_02"); //Magowie s¹ jego wybrañcami i pozosta³ych ludzi traktuj¹ w sposób nale¿ny wybrañcom.
	AI_Output (self, other,"DIA_Milten_PERM_02_03"); //Przyjêcie do Krêgu to najwa¿niejszy moment w moim ¿yciu. Opiekê nade mn¹ roztoczy³ sam Corristo, który twierdzi, ¿e wnios³em do naszej spo³ecznoœci powiew œwie¿oœci.
	AI_Output (self, other,"DIA_Milten_PERM_02_04"); //Od tej chwili ca³y mój czas poœwiêcam na ci¹g³e doskonalenie umiejêtnoœci magicznych. Mam nadziejê, ¿e pewnego dnia zostanê przyjêty do wy¿szego Krêgu.
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
	description = "Chcia³bym zostaæ uczniem maga, tak jak ty.";
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
	AI_Output (other, self,"DIA_Milten_WannaMage_15_00"); //Chcia³bym zostaæ uczniem maga, tak jak ty.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_01"); //Corristo wybra³ mnie, bo odda³em szczególne us³ugi potê¿nym Magnatom.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_02"); //Jeœli naprawdê chcesz zostaæ jego uczniem, musisz wykazaæ siê czymœ niezwyk³ym.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_03"); //No i oczywiœcie musisz najpierw zostaæ przyjêty do Starego Obozu. Corristo niechêtnie patrzy na ludzi z innych osiedli.
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
	
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_01"); //Witaj! Mój przyjaciel Lester, z obozu na bagnie powiadomi³ mnie o twoich niezwyk³ych czynach!
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_02"); //Jestem pod wra¿eniem. Sta³eœ siê bardzo potê¿ny.
	AI_Output		(hero,self,"Info_Milten_SHWAIT_15_03"); //Robiê co mogê.
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
	description	= "Spotka³em Gorna.";
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
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_01"); //Spotka³em Gorna.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_02"); //Naprawdê? Gdzie?
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_03"); //W ruinach klasztoru, nad morzem. Bawiliœmy siê w poszukiwaczy skarbów.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_04"); //Zapewne nie omieszka mi o tym opowiedzieæ podczas naszego nastêpnego spotkania.
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
	description	= "Lester i ja rozejrzeliœmy siê trochê po fortecy w górach.";
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
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_01"); //Lester i ja rozejrzeliœmy siê trochê po fortecy w górach.
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_02"); //Tak, s³ysza³em. Wygl¹da na to, ¿e mo¿na ci zaufaæ.
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_03"); //Gdzie wasza czwórka zwyk³a siê spotykaæ?
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_04"); //Ach, tu i tam. Spotykamy siê w najró¿niejszych miejscach.
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
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_02"); //Niedaleko st¹d le¿y staro¿ytny kamienny kr¹g. W jego centrum znajduje siê wejœcie do podziemnej komory.
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_03"); //Jakiœ rodzaj grobowca?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_04"); //Tak, coœ w tym rodzaju.
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_05"); //W tym grobowcu znajduje siê przedmiot, który chcia³bym zdobyæ.
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
	description	= "Szukam kamienia ogniskuj¹cego.";
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
	AI_Output		(hero,self,"Info_Milten_SHME_15_01"); //Szukam kamienia ogniskuj¹cego. Powinien gdzieœ tam byæ.
	AI_Output		(self,hero,"Info_Milten_SHME_02_02"); //Wygl¹da na to, ¿e obydwaj szukamy czegoœ w tym samym miejscu.
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
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_02"); //Och, to d³uga historia. Musia³bym zanudzaæ ciê opowieœci¹ o bardzo dawnych czasach.
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_03"); //Œmia³o, nigdzie mi siê nie spieszy.
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_04"); //No dobrze! Po utworzeniu magicznej Bariery, która sta³a siê naszym wspólnym wiêzieniem...
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_05"); //... Jeden z magów zamkn¹³ pod ziemi¹ potê¿ny artefakt.
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
	description	= "Czy¿byœ mówi³ o jednym z piêciu kamieni ogniskuj¹cych?";
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
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_01"); //Czy¿byœ mówi³ o jednym z piêciu kamieni ogniskuj¹cych?
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_02"); //Dok³adnie! A wiêc znasz ju¿ historiê piêciu kamieni?
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_03"); //Tylko mi nie mów, ¿e ty te¿ szukasz tego kamienia!
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_04"); //Nie. Nie interesuje mnie kamieñ ogniskuj¹cy. Szukam pewnego talizmanu Orków.
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
	description	= "Artefakt jest w jakiœ sposób chroniony?";
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
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_01"); //Artefakt jest w jakiœ sposób chroniony?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_02"); //Tak. Strze¿e go potê¿ne zaklêcie. Pierwszy rabuœ, który spróbuje go zabraæ...
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_03"); //... bêdzie przeklêty i zostanie skazany na wieczn¹ egzystencjê jako O¿ywieniec. Od tej pory po wsze czasy sam stanie siê stra¿nikiem kamienia, który próbowa³ ukraœæ.
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_04"); //Czy istnieje jakiœ sposób na unikniêcie kl¹twy?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_05"); //To ju¿ nie bêdzie potrzebne.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_06"); //Kilka lat temu jeden z Magnatów poluj¹cy dla rozrywki na Orków okaza³ siê na tyle bezmyœlny, ¿e zszed³ do grobowca.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_07"); //Teraz ON jest stra¿nikiem spoczywaj¹cych pod ziemi¹ skarbów.
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
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_02"); //Jestem przekonany, ¿e jego poprzedni w³aœciciel wykorzystywa³ go do ochrony przed rozwœcieczonymi Orkami.
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_03"); //Jeœli mam racjê, ten talizman mo¿e siê okazaæ niezwykle przydatny.
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
	description	= "Zatem powinniœmy wspólnie przeszukaæ ten grobowiec!";
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
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_01"); //Zatem powinniœmy wspólnie przeszukaæ ten grobowiec! Ty znajdziesz swój talizman, a ja - mój kamieñ ogniskuj¹cy!
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_02"); //W porz¹dku, ale jest pewien ma³y problem...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_03"); //Problem?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_04"); //Tak. Stra¿nik podziemnej krypty...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_05"); //A nie mo¿na go po prostu posiekaæ na drobne kawa³eczki?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_06"); //To nie bêdzie takie proste. Ten o¿ywieniec zdaje siê byæ niezwykle odporny na dzia³anie zwyk³ego orê¿a.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_07"); //Niech zgadnê: pewnie masz ju¿ jakiœ plan, jak go pokonaæ, tak?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_08"); //Umm... No có¿... MAM pewien plan, ale nie jestem w stanie sam go wykonaæ.
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
	description	= "Zamieniam siê w s³uch!";
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
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_01"); //Zamieniam siê w s³uch!
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_02"); //Mam przy sobie magiczny zwój z niezwykle potê¿nym zaklêciem.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_03"); //To zaklêcie natychmiast niszczy wszystkich o¿ywieñców znajduj¹cych siê w okolicy.
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_04"); //Zatem dostanie siê do grobowca powinno byæ dziecinnie proste, prawda?
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_05"); //Hmmm... Nie zupe³nie! Obawiam siê, ¿e nasz przeklêty stra¿nik nie jest ju¿ sam.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_06"); //Wygl¹da na to, ¿e rabusie, którzy przyszli po nim mieli równie ma³o szczêœcia co on sam.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_07"); //Pewnego razu zszed³em na dó³ i ma³o brakowa³o, a postrada³bym ¿ycie. Jeden cz³owiek nie sprosta wszystkim przeciwnikom.
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
	description	= "Daj mi ten magiczny zwój i razem zajmiemy siê tymi o¿ywieñcami!";
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
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_01"); //Daj mi ten magiczny zwój i razem zajmiemy siê tymi o¿ywieñcami!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_02"); //Ha! Mia³em nadziejê, ¿e to powiesz.
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_03"); //Niestety, mam tylko jeden zwój. Wykorzystaj go przeciw Stra¿nikowi.
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_04"); //Pozosta³e o¿ywieñce mo¿na zabiæ zwyk³ym orê¿em.
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_05"); //Rozumiem. No dobrze, którêdy do tego kamiennego krêgu?
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_06"); //ChodŸ za mn¹!

	Log_CreateTopic		(CH3_Stonehenge,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_RUNNING);
	B_LogEntry		(CH3_Stonehenge,"W pobli¿u kamiennego krêgu spotka³em Miltena, jednego z magów Ognia. Od niego dowiedzia³em siê, ¿e kamieñ, którego szukam, spoczywa w podziemnej krypcie pod krêgiem.");
	B_LogEntry		(CH3_Stonehenge,"Milten da³ mi magiczny zwój, przy u¿yciu którego pokonam o¿ywieñca strzeg¹cego krypty. Na szczêœcie na dó³ zejdziemy razem.");
	
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

	AI_Output			(self,hero,"Info_Milten_SHARRIVED_02_01"); //No i jesteœmy. Ten tunel prowadzi wprost do grobowca. 
	AI_Output			(hero,self,"Info_Milten_SHARRIVED_15_02"); //Zatem ruszajmy. Pora z³o¿yæ wizytê stra¿nikom.

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
	description	= "Jestem ranny. Mo¿esz mi pomóc?";
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
	AI_Output				(hero,self,"Info_Milten_SHHEAL_15_01"); //Jestem ranny. Mo¿esz mi pomóc?

	if (	(Npc_HasItems(self,ItFo_Potion_Health_02) >  0)		)
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_02"); //WeŸ ten napój uzdrawiaj¹cy.
		B_GiveInvItems	    (self, hero,	ItFo_Potion_Health_02,	1);
	}
	else
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_03"); //Nie mam ju¿ ¿adnych magicznych wywarów.
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
	description	= "Stra¿nik wci¹¿ ¿yje!";
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
	AI_Output			(hero,self,"Info_Milten_SHRUNNING_15_01"); 	//Stra¿nik wci¹¿ ¿yje!
	AI_Output			(self,hero,"Info_Milten_SHRUNNING_02_02"); 	//Wiêc zniszcz go przy u¿yciu magicznego zwoju!
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
	description	= "Wykorzysta³em zwój!";
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
	AI_Output			(hero,self,"Info_Milten_SHSCROLL_15_01"); //Wykorzysta³em zwój, ale niestety nie na Stra¿niku!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_02"); //Jesteœmy zgubieni! Chyba, ¿e znajdziesz jakiœ inny sposób, ¿eby go pokonaæ!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_03"); //Mo¿e w którymœ z obozów uda ci siê kupiæ nastêpny zwój albo magiczn¹ runê.
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_04"); //Zaczekam na ciebie w miejscu, w którym siê spotkaliœmy.

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
	description	= "Mam nowy zwój z zaklêciem 'Œmieræ O¿ywieñcom'!";
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
	AI_Output			(hero,self,"Info_Milten_SHNEWSCROLL_15_01"); //Mam nowy zwój z zaklêciem "Œmieræ O¿ywieñcom!"
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_02"); //To wspaniale! Mo¿emy z³o¿yæ Stra¿nikowi kolejn¹ wizytê!
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_03"); //IdŸ przodem. Pójdê za tob¹.

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

	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_01"); 	//Czy¿byœ straci³ zainteresowanie tym grobowcem?
	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_02"); 	//Jakbyœ zmieni³ zdanie, znajdziesz mnie w miejscu naszego pierwszego spotkania.

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
	AI_Output			(self,hero,"Info_Milten_SHCONTINUE_02_02"); //Jestem gotów. IdŸ przodem. Pójdê za tob¹.

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

	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_01"); //Dobrze. Widzê, ¿e znalaz³eœ talizman.
	AI_Output			(hero,self,"Info_Milten_SHSUCCESS_15_02"); //Proszê, weŸ go. Taka by³a umowa.
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_03"); //Dziêkujê, przyjacielu. Nigdy nie zapominam o ludziach, którzy mi pomogli.
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_04"); //Wrócê teraz do Starego Obozu. Mo¿e tam siê jeszcze kiedyœ spotkamy.
	
	B_GiveInvItems	(hero,self,	ItMi_OrcTalisman, 1);
	
	B_LogEntry		(CH3_Stonehenge,"Wspólnymi si³ami uda³o siê nam pokonaæ stra¿nika kamiennego krêgu. Milten zabra³ swoj¹ czêœæ zdobyczy i wróci³ do Starego Obozu.");
	B_LogEntry		(CH3_Stonehenge,"Saturas ucieszy siê, ¿e odnalaz³em ten kamieñ ogniskuj¹cy!");
	
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

	AI_Output			(self,hero,"Info_Milten_OCWARN_02_01"); //Oni... nie ¿yj¹... Wszyscy zginêli... Nie mog³em im pomóc... By³em za daleko... Ja...

	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_02"); //Spokojnie, Miltenie. Spotka³em ju¿ Diego po drugiej stronie Obozu.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_03"); //Zatem wiesz ju¿, co siê sta³o. Co ci powiedzia³ Diego?
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_04"); //Powiedzia³, ¿e jeœli spotkam Gorna i Lestera, mam im powiedzieæ, ¿e spotkanie odbêdzie siê tam gdzie zwykle.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_05"); //Powodzenia i uwa¿aj na siebie!
		B_LogEntry		(CH4_Firemages,"Milten, podobnie jak Diego, ukrywa³ siê w pobli¿u Starego Obozu. Teraz Mag Ognia uprzedza przyjació³ o niebezpieczeñstwie czyhaj¹cym na nich w œrodku.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_06"); //Uspokój siê, Miltenie. Co siê sta³o?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_07"); //Wymordowali Magów Ognia! Wszystkich... oprócz mnie. Ale nawet ja otar³em siê o œmieræ.
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_08"); //Lepiej opowiedz mi wszystko po kolei, od samego pocz¹tku.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_09"); //Ju¿ dobrze, uspokój siê, przyjacielu.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_10"); //Wszystko zaczê³o siê od zawalenia Starej Kopalni?
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_11"); //Zawalenia Starej Kopalni?!?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_12"); //Tak. To dzia³o siê tak szybko. Nikt nie zdo³a³ siê wydostaæ.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_13"); //Stra¿nicy zablokowali wejœcie do kopalni.
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
	description = "Jak do tego dosz³o?";
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
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_01"); //Jak do tego dosz³o?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_02"); //Nie mam pojêcia. Kilku Kopaczy stoj¹cych przy wejœciu mówi³o coœ o potê¿nym wstrz¹sie i wielkiej chmurze py³u z tunelu.
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_03"); //By³eœ tam, kiedy to siê sta³o?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_04"); //Tak. St¹d wiem o zawaleniu siê kopalni.
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
	description = "Mówi³eœ coœ o Magach Ognia?";
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
	AI_Output			(hero,self,"Info_Milten_OCKDW_15_01"); //Mówi³eœ coœ o Magach Ognia?
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_02"); //Wiem tylko, ¿e wszyscy zostali zabici przez Magnatów tu¿ po zawaleniu siê Starej Kopalni.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_03"); //Kiedy wróci³em z naszej wyprawy pod kamienny kr¹g, stra¿nicy przy bramie rzucili siê na mnie bez ostrze¿enia.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_04"); //Krzyczeli "zdrajca" i "spiskowiec". Ledwie uszed³em z ¿yciem.
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
	description = "Dlaczego Magnaci mieliby wymordowaæ Magów? To bez sensu!";
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
	AI_Output			(hero,self,"Info_Milten_OCWHY_15_01"); //Dlaczego Magnaci mieliby wymordowaæ Magów? To bez sensu!
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_02"); //Wiem, ale nie mia³em czasu, ¿eby zapytaæ stra¿ników. Zaatakowali mnie natychmiast.
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_03"); //Mo¿e Diego bêdzie wiedzia³ wiêcej. By³ w Obozie, kiedy rozegra³a siê ta tragedia.
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
	description = "Powinieneœ siê ukryæ. Najlepiej daleko st¹d.";
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
	AI_Output			(hero,self,"Info_Milten_OCYOU_15_01"); //Powinieneœ siê ukryæ. Najlepiej daleko st¹d.
	AI_Output			(self,hero,"Info_Milten_OCYOU_02_02"); //Nie. Diego kaza³ mi pilnowaæ drugiego wejœcia do Obozu. Mamy ostrzegaæ naszych przyjació³ przed niebezpieczeñstwem.

	if (!Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{	
		AI_Output		(self,hero,"Info_Milten_OCYOU_02_03"); //Proszê, porozmawiaj z Diego!
	}
	else
	{
		B_LogEntry		(CH4_Firemages,"Po tym jak Diego opowiedzia³ mi o tych niewiarygodnych wydarzeniach, przed g³ówn¹ bram¹ Starego Obozu wpad³em na Miltena. Mam nadziejê, ¿e nie wpadn¹ w ³apy Stra¿ników!");
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
	description = "Gdzie znajdê Diego?";
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
	AI_Output			(hero,self,"Info_Milten_OCDIEGO_15_01"); //Gdzie znajdê Diego?
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_02"); //Ukrywa siê po drugiej stronie Obozu, w pobli¿u tylnej bramy.
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_03"); //Musisz z nim koniecznie porozmawiaæ!

	B_LogEntry			(CH4_Firemages,"Przed g³ówn¹ bram¹ Starego Obozu spotka³em Miltena, który opowiedzia³ mi o zawaleniu siê Starej Kopalni i wymordowaniu wszystkich Magów Ognia.");
	B_LogEntry			(CH4_Firemages,"Diego ukrywa siê po przeciwnej stronie obozu. Mam z nim porozmawiaæ - ponoæ wie nieco wiêcej o tych straszliwych wydarzeniach.");
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

	AI_Output			(self, hero,"Info_Milten_LOADSWORD_02_01"); //Witaj, przyjacielu! Dawno siê nie widzieliœmy.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_02"); //Czeœæ, Milten! Wiele siê wydarzy³o od naszego ostatniego spotkania.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_03"); //Chêtnie bym ci wszystko opowiedzia³, ale chwilowo nie mam czasu. Bardzo siê spieszê.
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
	description		= "Potrzebujê twojej pomocy!"; 
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
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_01"); //Potrzebujê twojej pomocy!
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_02"); //Co siê sta³o? Jak mogê ci pomóc?
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_03"); //ChodŸmy w jakieœ ustronne miejsce, gdzie bêdziemy mogli spokojnie porozmawiaæ.
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_04"); //Dobrze. ChodŸ za mn¹.

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

	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_01"); //A teraz mów - co siê sta³o?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_02"); //Muszê wykorzystaæ magiczn¹ energiê kopca rudy, a wola³bym nie pytaæ Magów Wody o pozwolenie.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_03"); //¯artujesz sobie ze mnie!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_04"); //To nie pora na ¿arty. Mówiê powa¿nie.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_05"); //Spotka³em Xardasa, Nekromantê!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_06"); //Wype³niam jego polecenia!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_07"); //XARDAS?! Zaczynasz mnie przera¿aæ!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_08"); //Nikt z nim nie rozmawia³ odk¹d opuœci³ Stary Obóz.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_09"); //Ja rozmawia³em!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_10"); //Do czego potrzebna ci jest energia kopca rudy?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_11"); //Muszê j¹ skumulowaæ w tym oto mieczu.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_12"); //Có¿ za niesamowita broñ!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_13"); //Nazywa siê URIZIEL!
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
	description		= "Xardas da³ mi magiczne zaklêcie!"; 
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
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_01"); //Xardas da³ mi magiczne zaklêcie, które pozwoli mi przenieœæ energiê!
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_02"); //Bêdziesz musia³ je odczytaæ, podczas gdy ja dotknê rudy mieczem!
	B_UseFakeScroll		();
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_03"); //Hmmm... Mówisz, ¿e trzeba je tylko odczytaæ?
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_04"); //Ale Saturas i jego magowie nie puszcz¹ nam tego p³azem!
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
	description		= "Musimy zaryzykowaæ!"; 
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
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_01"); //Musimy zaryzykowaæ!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_02"); //To bardzo, BARDZO wa¿ne!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_03"); //Wa¿ne dla WSZYSTKICH mieszkañców kolonii...
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_04"); //Nic nie rozumiem.
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_05"); //Dziêki temu wydostaniemy siê na wolnoœæ! Musisz mi zaufaæ!
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_06"); //Dobrze! Po tym wszystkim, co dla nas zrobi³eœ, ufam ci bezgranicznie.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_07"); //No i wygl¹da na to, ¿e nawet Xardas darzy ciê zaufaniem.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_08"); //Spotkamy siê przy kopcu rudy. Tylko nikomu ani s³owa!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_09"); //Dobrze, zatem spotkamy siê przy kopcu! Do zobaczenia!
	
	B_LogEntry			(CH5_Uriziel,"Uda³o mi siê przekonaæ Miltena do pomocy w ponownym na³adowaniu Uriziela magi¹. Spotkamy siê u stóp kopca rudy.");
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

	AI_Output			(self, hero,"Info_Milten_LSOREHEAP_02_01"); //Masz miecz i zaklêcie?
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
	description		= "Proszê, oto ono!"; 
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
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_01"); //Proszê, oto ono!
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_02"); //Jesteœ gotów?
	AI_Output			(self, hero,"Info_Milten_LSNOW_02_03"); //Nie, ale nie mamy wielkiego wyboru. Teraz albo nigdy!
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_04"); //Zatem do dzie³a!

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
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_02"); //Niesamowite! Ten szary kryszta³ rozb³ysn¹³ piêknym b³êkitem!

	AI_EquipBestMeleeWeapon	(hero);
	AI_ReadyMeleeWeapon		(hero);
	AI_PlayAni				(hero, "T_1HSINSPECT");
	AI_RemoveWeapon			(hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_03"); //To dobry znak! Wygl¹da na to, ¿e ca³a energia z kopca zosta³a przeniesiona na miecz!
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_04"); //Ale nasze dzia³ania zwróci³y uwagê stra¿ników!
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_05"); //Teleportuj siê st¹d, natychmiast!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_06"); //A co z tob¹?
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_07"); //O mnie siê nie martw! Coœ wymyœlê! Uciekaj st¹d! Ju¿!

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
