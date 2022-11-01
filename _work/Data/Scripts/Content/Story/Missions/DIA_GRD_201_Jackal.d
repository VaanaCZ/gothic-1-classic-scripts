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
	AI_Output (self, other,"Info_Jackal_Hello_07_00"); //Á! Nová tvář.
	AI_Output (other, self,"Info_Jackal_Hello_15_01"); //Co chceš?
	AI_Output (self, other,"Info_Jackal_Hello_07_02"); //Chci ti nabídnout pomoc. Jsi tady nový a nováčci se vždycky dostanou do problémů... Spoustu by sis jich mohl ušetřit poskytnutím malé dotace.
	AI_Output (self, other,"Info_Jackal_Hello_07_03"); //Jen 10 nugetů, člověče! Snad toho tolik nežádám.
	
	Info_ClearChoices	(Info_Jackal_Hello);
	Info_AddChoice		(Info_Jackal_Hello,"A co když nezaplatím?",Info_Jackal_Hello_WhatIf);
	Info_AddChoice		(Info_Jackal_Hello,"A co za to?",Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice		(Info_Jackal_Hello,"Tady je 10 nugetů. A jestli budu mít potíže, tak mi pomůžeš.",Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output (other, self,"Info_Jackal_Hello_Pay_15_00"); //Tady je 10 nugetů. A jestli budu mít potíže, tak mi pomůžeš.
	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_01"); //Pokud budu nablízku, můžeš se mnou počítat. Najdeš mě mezi tržištěm a jižní bránou.
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_02"); //Ostatní oblasti patří Fletcherovi a Bloodwynovi.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_NoOre_07_00"); //Hej, dávej pozor na to, z koho si zkoušíš utahovat! Vrať se, až budeš mít ty nugety!
	};

	Info_ClearChoices	(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //A co za to?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //Pokud budeš na mém území, budeš pod mojí ochranou.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //Pokud se dostaneš do problémů s chlapy z Nového tábora, nebo ti bude hrát na nervy někdo z těch sektářských bláznů, můžeš se mnou počítat.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //Kdybys měl potíže s některým z kopáčů, pomůžeme tomu, kdo zaplatí - jednoduchý jak facka.
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //A co když zaplatíme oba?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Pak si sedneme na zadek a budeme se na to dívat. To se ale nestává moc často.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatIf_15_00"); //A co když nezaplatím?
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_01"); //Poslyš, člověče, nedělej si problémy! Jsi tady nový - tak se rozhlédni kolem. Dej dohromady trochu rudy a až budeš moci zaplatit, zaplať.
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_02"); //Můžeš zaplatit kdykoliv - dokud ale nepřispěješ na moje výdaje, nepočítej s mojí pomocí. Jsem si jistý, že tomu rozumíš.
	Info_AddChoice		(Info_Jackal_Hello,"Ještě se uvidíme.",Info_Jackal_Hello_Later);
};

func void Info_Jackal_Hello_Later()
{
	AI_Output (other, self,"Info_Jackal_Hello_Later_15_00"); //Ještě se uvidíme.
	AI_Output (self, other,"Info_Jackal_Hello_Later_07_01"); //Tak na sebe dávej pozor.
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
	description = "Přemýšlel jsem o těch penězích za ochranu - tady je tvých 10 nugetů.";
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
		AI_Output (other, self,"Info_Jackal_Schutz_15_00"); //Přemýšlel jsem o těch penězích za ochranu - tady je tvých 10 nugetů.
		AI_Output (self, other,"Info_Jackal_Schutz_07_01"); //Rozhodl ses správně, hochu. Od teďka tě budu chránit!
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_07_02"); //Nevidím těch 10 nugetů, příteli. Vrať se, až je budeš mít.
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
	description = "Jak to jde?";
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
	AI_Output (other, self,"Info_Jackal_PermPaid_15_00"); //Tak jak to jde?
	AI_Output (self, other,"Info_Jackal_PermPaid_07_01"); //Se mnou můžeš kdykoliv počítat, mladej!
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
	AI_Output (self, other,"GRD_201_Jackal_WELCOME_Info_07_01"); //Vypracoval jsi se velmi rychle! Dobrá práce, chlape!
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
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_01"); //Hej, podívej se na to! To je ten zrádce, který přešel z tábora do tábora!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_02"); //Neměl by ses stýkat s takovými ztroskotanci, nezapomeň, že jsi pořád jedním z nás!
		}
		else
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_03"); //Hej, podívej se na to! To je ten chlapík z Nového tábora, ten, co nás dostal do potíží!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_04"); //Kdybys pobral více zdravého rozumu, mohl bys teď být na naší straně - na straně vítězů!
		};
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_05"); //Podívej se na to. To je ten chlapík z tábora u bažin.
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_06"); //Byls mezi těmi blázny tak dlouho, že ti z nich změkl mozek!
	};
	
	if 	Jackal_ProtectionPaid
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_07"); //Teď už ti nepomůžou ani peníze za ochranu, které jsi mi zaplatil.
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_08"); //Měl jsi mi zaplatit tehdy, když na to byl ještě čas.
	};
			
	AI_Output			(other, self,"Info_Jackal_PAYDAY_15_09"); //Zašli jste příliš daleko! To byl pitomý nápad, zaútočit na důl!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_10"); //Vypadá, že to funguje. A ty to nezměníš, věř mi!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_11"); //HEJ CHLAPI, DOSTAŇTE HO!!!
	
	AI_StopProcessInfos	(self);
	
	B_Story_JackalFight	();
};

