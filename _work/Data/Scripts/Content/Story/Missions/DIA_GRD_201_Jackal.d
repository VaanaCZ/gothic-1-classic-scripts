// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Jackal_EXIT (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 999;
	condition	= Info_Jackal_EXIT_Condition;
	information	= Info_Jackal_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Jackal_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Jackal_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
	var int Jackal_ProtectionPaid;
	var int Jackal_PayDay;
// ************************************************************

INSTANCE Info_Jackal_Hello (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Hello_Condition;
	information	= Info_Jackal_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_Hello_Condition()
{	
	if (Kapitel <= 2)
	{
		return 1;
	};
};
FUNC VOID Info_Jackal_Hello_Info()
{	
	AI_Output (self, other,"Info_Jackal_Hello_07_00"); //Ach! Nowa twarz!
	AI_Output (other, self,"Info_Jackal_Hello_15_01"); //Czego chcesz?
	AI_Output (self, other,"Info_Jackal_Hello_07_02"); //Chcę ci zaoferować pomoc. Jesteś tu nowy, a nowi zawsze pakują się w kłopoty... Możesz sobie zaoszczędzić nieprzyjemności ofiarując mi... drobny datek.
	AI_Output (self, other,"Info_Jackal_Hello_07_03"); //Marne 10 bryłek rudy. Toż to grosze...
	
	Info_ClearChoices	(Info_Jackal_Hello);
	Info_AddChoice		(Info_Jackal_Hello,"A jeśli nie zapłacę?",Info_Jackal_Hello_WhatIf);
	Info_AddChoice		(Info_Jackal_Hello,"A co będę z tego miał?",Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice		(Info_Jackal_Hello,"Masz tu 10 bryłek. Ale pomożesz mi, w razie potrzeby?",Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output (other, self,"Info_Jackal_Hello_Pay_15_00"); //Masz tu 10 bryłek. Ale pomożesz mi, w razie potrzeby?
	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_01"); //Jeśli tylko będę w pobliżu, możesz na mnie liczyć. Znajdziesz mnie pomiędzy targowiskiem a południową bramą.
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_02"); //Resztę obozu obstawiają Fletcher i Bloodwyn.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_NoOre_07_00"); //Hej, masz mnie za idiotę?! Wróć, jak będziesz miał dość rudy!
	};

	Info_ClearChoices	(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //A co będę z tego miał?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //Dopilnuję, żeby nic złego ci się nie przydarzyło na moim terenie.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //Jak goście z Nowego Obozu nadepną ci na odcisk albo wkurzy cię jakiś świr z Sekty, możesz na mnie liczyć.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //Jeśli weźmiesz się za łby z jakimś Kopaczem, pomożemy temu z was, który zapłacił podatek - proste, nie?
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //A jeśli okaże się, że obydwaj zapłaciliśmy?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Wtedy będziemy spokojnie patrzeć, jak się zarzynacie. Ale to się nie zdarza zbyt często.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatIf_15_00"); //A jeśli nie zapłacę?
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_01"); //Człowieku, nie narażaj się na niepotrzebny stres! Jesteś tu nowy - rozejrzyj się dookoła. Zbierz trochę rudy, a jak będziesz miał już dość - zapłać. Tak jest bezpieczniej.
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_02"); //Możesz to zrobić teraz, albo później. Tylko nie licz na moją pomoc, dopóki nie dostanę rudy. Mam nadzieję, że się rozumiemy?
	Info_AddChoice		(Info_Jackal_Hello,"Do zobaczenia.",Info_Jackal_Hello_Later);
};

func void Info_Jackal_Hello_Later()
{
	AI_Output (other, self,"Info_Jackal_Hello_Later_15_00"); //Do zobaczenia.
	AI_Output (self, other,"Info_Jackal_Hello_Later_07_01"); //Miej oczy szeroko otwarte.
	Jackal_ProtectionPaid = FALSE;
	Npc_SetPermAttitude(self,ATT_NEUTRAL);
	Jackal_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Jackal_Hello);
};

// ************************************************************
// 					DOCH Schutzgeld
// ************************************************************

// Bei JACKAL reicht es, wenn man EINMAL zahlt

INSTANCE Info_Jackal_Schutz (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Schutz_Condition;
	information	= Info_Jackal_Schutz_Info;
	permanent	= 0;
	description = "Przemyślałem sobie to, co powiedziałeś. Oto 10 bryłek rudy.";
};                       

FUNC INT Info_Jackal_Schutz_Condition()
{
	if ( (Npc_KnowsInfo(hero,Info_Jackal_Hello)) && (Jackal_ProtectionPaid == FALSE) )
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_Schutz_Info()
{	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (other, self,"Info_Jackal_Schutz_15_00"); //Przemyślałem sobie to, co powiedziałeś. Oto 10 bryłek rudy.
		AI_Output (self, other,"Info_Jackal_Schutz_07_01"); //Mądra decyzja, kolego. Od tej pory możesz liczyć na moją pomoc.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_07_02"); //Nie widzę u ciebie żadnych 10 bryłek. Wróć, jak będziesz miał całą kwotę.
	};
};


// ************************************************************
// 					Perm - wenn gezahlt
// ************************************************************

INSTANCE Info_Jackal_PermPaid (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_PermPaid_Condition;
	information	= Info_Jackal_PermPaid_Info;
	permanent	= 1;
	description = "No i, jak leci?";
};                       

FUNC INT Info_Jackal_PermPaid_Condition()
{
	if (Jackal_ProtectionPaid == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_PermPaid_Info()
{	
	AI_Output (other, self,"Info_Jackal_PermPaid_15_00"); //No i, jak leci?
	AI_Output (self, other,"Info_Jackal_PermPaid_07_01"); //Możesz na mnie liczyć, chłopcze!
};

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_201_Jackal_WELCOME (C_INFO)
{
	npc				= GRD_201_Jackal;
	condition		= GRD_201_Jackal_WELCOME_Condition;
	information		= GRD_201_Jackal_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_201_Jackal_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_201_Jackal_WELCOME_Info()
{
	AI_Output (self, other,"GRD_201_Jackal_WELCOME_Info_07_01"); //Widzę, że szybko pniesz się do góry. Dobra robota, stary!
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info	PAYDAY
//---------------------------------------------------------------------
INSTANCE Info_Jackal_PAYDAY (C_INFO)
{
	npc			= GRD_201_Jackal;
	condition	= Info_Jackal_PAYDAY_Condition;
	information	= Info_Jackal_PAYDAY_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_PAYDAY_Condition()
{
	if (FMTaken)
	{
		return TRUE;
	};
};

FUNC VOID Info_Jackal_PAYDAY_Info()
{	
	if	C_NpcBelongsToNewCamp(hero)
	{
		if 	(oldHeroGuild == GIL_GRD)
		||	(oldHeroGuild == GIL_KDF)
		||	(oldHeroGuild == GIL_STT)
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_01"); //Patrzcie państwo. Toż to nasz arcy-zdrajca!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_02"); //Gdybyś nie zadawał się z tymi fajtłapami, mógłbyś nadal być jednym z nas!
		}
		else
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_03"); //Hej, patrzcie! To ten facet z Nowego Obozu, przez którego mamy tyle kłopotów.
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_04"); //Gdybyś wykazał wtedy choć odrobinę rozsądku, mógłbyś teraz być po stronie zwycięzców... po NASZEJ stronie!
		};
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_05"); //Patrzcie no! To ten gość z obozu na bagnie.
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_06"); //Za długo zadawałeś się z tymi świrami z Sekty. Zdążyli ci zrobić wodę z mózgu.
	};
	
	if 	Jackal_ProtectionPaid
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_07"); //Teraz nie uratują cię nawet pieniądze, które zapłaciłeś mi za ochronę!
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_08"); //Trzeba mi było zapłacić kiedy miałeś okazję.
	};
			
	AI_Output			(other, self,"Info_Jackal_PAYDAY_15_09"); //Posunęliście się za daleko. Atak na kopalnię był poważnym błędem.
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_10"); //Ale wygląda na to, że się udało. A tobie już nic do tego!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_11"); //DALEJ, CHŁOPCY! WYKOŃCZMY GO!!!
	
	AI_StopProcessInfos	(self);
	
	B_Story_JackalFight	();
};

