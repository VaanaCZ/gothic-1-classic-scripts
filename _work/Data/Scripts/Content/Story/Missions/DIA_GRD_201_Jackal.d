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
	AI_Output (self, other,"Info_Jackal_Hello_07_02"); //Chc� ci zaoferowa� pomoc. Jeste� tu nowy, a nowi zawsze pakuj� si� w k�opoty... Mo�esz sobie zaoszcz�dzi� nieprzyjemno�ci ofiaruj�c mi... drobny datek.
	AI_Output (self, other,"Info_Jackal_Hello_07_03"); //Marne 10 bry�ek rudy. To� to grosze...
	
	Info_ClearChoices	(Info_Jackal_Hello);
	Info_AddChoice		(Info_Jackal_Hello,"A je�li nie zap�ac�?",Info_Jackal_Hello_WhatIf);
	Info_AddChoice		(Info_Jackal_Hello,"A co b�d� z tego mia�?",Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice		(Info_Jackal_Hello,"Masz tu 10 bry�ek. Ale pomo�esz mi, w razie potrzeby?",Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output (other, self,"Info_Jackal_Hello_Pay_15_00"); //Masz tu 10 bry�ek. Ale pomo�esz mi, w razie potrzeby?
	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_01"); //Je�li tylko b�d� w pobli�u, mo�esz na mnie liczy�. Znajdziesz mnie pomi�dzy targowiskiem a po�udniow� bram�.
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_02"); //Reszt� obozu obstawiaj� Fletcher i Bloodwyn.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_NoOre_07_00"); //Hej, masz mnie za idiot�?! Wr��, jak b�dziesz mia� do�� rudy!
	};

	Info_ClearChoices	(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //A co b�d� z tego mia�?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //Dopilnuj�, �eby nic z�ego ci si� nie przydarzy�o na moim terenie.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //Jak go�cie z Nowego Obozu nadepn� ci na odcisk albo wkurzy ci� jaki� �wir z Sekty, mo�esz na mnie liczy�.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //Je�li we�miesz si� za �by z jakim� Kopaczem, pomo�emy temu z was, kt�ry zap�aci� podatek - proste, nie?
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //A je�li oka�e si�, �e obydwaj zap�acili�my?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Wtedy b�dziemy spokojnie patrze�, jak si� zarzynacie. Ale to si� nie zdarza zbyt cz�sto.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatIf_15_00"); //A je�li nie zap�ac�?
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_01"); //Cz�owieku, nie nara�aj si� na niepotrzebny stres! Jeste� tu nowy - rozejrzyj si� dooko�a. Zbierz troch� rudy, a jak b�dziesz mia� ju� do�� - zap�a�. Tak jest bezpieczniej.
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_02"); //Mo�esz to zrobi� teraz, albo p�niej. Tylko nie licz na moj� pomoc, dop�ki nie dostan� rudy. Mam nadziej�, �e si� rozumiemy?
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
	description = "Przemy�la�em sobie to, co powiedzia�e�. Oto 10 bry�ek rudy.";
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
		AI_Output (other, self,"Info_Jackal_Schutz_15_00"); //Przemy�la�em sobie to, co powiedzia�e�. Oto 10 bry�ek rudy.
		AI_Output (self, other,"Info_Jackal_Schutz_07_01"); //M�dra decyzja, kolego. Od tej pory mo�esz liczy� na moj� pomoc.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_07_02"); //Nie widz� u ciebie �adnych 10 bry�ek. Wr��, jak b�dziesz mia� ca�� kwot�.
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
	AI_Output (self, other,"Info_Jackal_PermPaid_07_01"); //Mo�esz na mnie liczy�, ch�opcze!
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
	AI_Output (self, other,"GRD_201_Jackal_WELCOME_Info_07_01"); //Widz�, �e szybko pniesz si� do g�ry. Dobra robota, stary!
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
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_01"); //Patrzcie pa�stwo. To� to nasz arcy-zdrajca!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_02"); //Gdyby� nie zadawa� si� z tymi fajt�apami, m�g�by� nadal by� jednym z nas!
		}
		else
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_03"); //Hej, patrzcie! To ten facet z Nowego Obozu, przez kt�rego mamy tyle k�opot�w.
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_04"); //Gdyby� wykaza� wtedy cho� odrobin� rozs�dku, m�g�by� teraz by� po stronie zwyci�zc�w... po NASZEJ stronie!
		};
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_05"); //Patrzcie no! To ten go�� z obozu na bagnie.
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_06"); //Za d�ugo zadawa�e� si� z tymi �wirami z Sekty. Zd��yli ci zrobi� wod� z m�zgu.
	};
	
	if 	Jackal_ProtectionPaid
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_07"); //Teraz nie uratuj� ci� nawet pieni�dze, kt�re zap�aci�e� mi za ochron�!
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_08"); //Trzeba mi by�o zap�aci� kiedy mia�e� okazj�.
	};
			
	AI_Output			(other, self,"Info_Jackal_PAYDAY_15_09"); //Posun�li�cie si� za daleko. Atak na kopalni� by� powa�nym b��dem.
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_10"); //Ale wygl�da na to, �e si� uda�o. A tobie ju� nic do tego!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_11"); //DALEJ, CH�OPCY! WYKO�CZMY GO!!!
	
	AI_StopProcessInfos	(self);
	
	B_Story_JackalFight	();
};

