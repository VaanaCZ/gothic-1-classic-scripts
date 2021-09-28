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
	AI_Output (self, other,"Info_Jackal_Hello_07_02"); //Chcê ci zaoferowaæ pomoc. Jesteœ tu nowy, a nowi zawsze pakuj¹ siê w k³opoty... Mo¿esz sobie zaoszczêdziæ nieprzyjemnoœci ofiaruj¹c mi... drobny datek.
	AI_Output (self, other,"Info_Jackal_Hello_07_03"); //Marne 10 bry³ek rudy. To¿ to grosze...
	
	Info_ClearChoices	(Info_Jackal_Hello);
	Info_AddChoice		(Info_Jackal_Hello,"A jeœli nie zap³acê?",Info_Jackal_Hello_WhatIf);
	Info_AddChoice		(Info_Jackal_Hello,"A co bêdê z tego mia³?",Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice		(Info_Jackal_Hello,"Masz tu 10 bry³ek. Ale pomo¿esz mi, w razie potrzeby?",Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output (other, self,"Info_Jackal_Hello_Pay_15_00"); //Masz tu 10 bry³ek. Ale pomo¿esz mi, w razie potrzeby?
	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_01"); //Jeœli tylko bêdê w pobli¿u, mo¿esz na mnie liczyæ. Znajdziesz mnie pomiêdzy targowiskiem a po³udniow¹ bram¹.
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_02"); //Resztê obozu obstawiaj¹ Fletcher i Bloodwyn.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_NoOre_07_00"); //Hej, masz mnie za idiotê?! Wróæ, jak bêdziesz mia³ doœæ rudy!
	};

	Info_ClearChoices	(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //A co bêdê z tego mia³?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //Dopilnujê, ¿eby nic z³ego ci siê nie przydarzy³o na moim terenie.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //Jak goœcie z Nowego Obozu nadepn¹ ci na odcisk albo wkurzy ciê jakiœ œwir z Sekty, mo¿esz na mnie liczyæ.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //Jeœli weŸmiesz siê za ³by z jakimœ Kopaczem, pomo¿emy temu z was, który zap³aci³ podatek - proste, nie?
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //A jeœli oka¿e siê, ¿e obydwaj zap³aciliœmy?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Wtedy bêdziemy spokojnie patrzeæ, jak siê zarzynacie. Ale to siê nie zdarza zbyt czêsto.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatIf_15_00"); //A jeœli nie zap³acê?
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_01"); //Cz³owieku, nie nara¿aj siê na niepotrzebny stres! Jesteœ tu nowy - rozejrzyj siê dooko³a. Zbierz trochê rudy, a jak bêdziesz mia³ ju¿ doœæ - zap³aæ. Tak jest bezpieczniej.
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_02"); //Mo¿esz to zrobiæ teraz, albo póŸniej. Tylko nie licz na moj¹ pomoc, dopóki nie dostanê rudy. Mam nadziejê, ¿e siê rozumiemy?
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
	description = "Przemyœla³em sobie to, co powiedzia³eœ. Oto 10 bry³ek rudy.";
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
		AI_Output (other, self,"Info_Jackal_Schutz_15_00"); //Przemyœla³em sobie to, co powiedzia³eœ. Oto 10 bry³ek rudy.
		AI_Output (self, other,"Info_Jackal_Schutz_07_01"); //M¹dra decyzja, kolego. Od tej pory mo¿esz liczyæ na moj¹ pomoc.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_07_02"); //Nie widzê u ciebie ¿adnych 10 bry³ek. Wróæ, jak bêdziesz mia³ ca³¹ kwotê.
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
	AI_Output (self, other,"Info_Jackal_PermPaid_07_01"); //Mo¿esz na mnie liczyæ, ch³opcze!
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
	AI_Output (self, other,"GRD_201_Jackal_WELCOME_Info_07_01"); //Widzê, ¿e szybko pniesz siê do góry. Dobra robota, stary!
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
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_01"); //Patrzcie pañstwo. To¿ to nasz arcy-zdrajca!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_02"); //Gdybyœ nie zadawa³ siê z tymi fajt³apami, móg³byœ nadal byæ jednym z nas!
		}
		else
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_03"); //Hej, patrzcie! To ten facet z Nowego Obozu, przez którego mamy tyle k³opotów.
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_04"); //Gdybyœ wykaza³ wtedy choæ odrobinê rozs¹dku, móg³byœ teraz byæ po stronie zwyciêzców... po NASZEJ stronie!
		};
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_05"); //Patrzcie no! To ten goœæ z obozu na bagnie.
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_06"); //Za d³ugo zadawa³eœ siê z tymi œwirami z Sekty. Zd¹¿yli ci zrobiæ wodê z mózgu.
	};
	
	if 	Jackal_ProtectionPaid
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_07"); //Teraz nie uratuj¹ ciê nawet pieni¹dze, które zap³aci³eœ mi za ochronê!
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_08"); //Trzeba mi by³o zap³aciæ kiedy mia³eœ okazjê.
	};
			
	AI_Output			(other, self,"Info_Jackal_PAYDAY_15_09"); //Posunêliœcie siê za daleko. Atak na kopalniê by³ powa¿nym b³êdem.
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_10"); //Ale wygl¹da na to, ¿e siê uda³o. A tobie ju¿ nic do tego!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_11"); //DALEJ, CH£OPCY! WYKOÑCZMY GO!!!
	
	AI_StopProcessInfos	(self);
	
	B_Story_JackalFight	();
};

