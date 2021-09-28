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
	AI_Output (self, other,"Info_Jackal_Hello_07_00"); //¡! Nov· tv·¯.
	AI_Output (other, self,"Info_Jackal_Hello_15_01"); //Co chceö?
	AI_Output (self, other,"Info_Jackal_Hello_07_02"); //Chci ti nabÌdnout pomoc. Jsi tady nov˝ a nov·Ëci se vûdycky dostanou do problÈm˘... Spoustu by sis jich mohl uöet¯it poskytnutÌm malÈ dotace.
	AI_Output (self, other,"Info_Jackal_Hello_07_03"); //Jen 10 nuget˘, ËlovÏËe! Snad toho tolik neû·d·m.
	
	Info_ClearChoices	(Info_Jackal_Hello);
	Info_AddChoice		(Info_Jackal_Hello,"A co kdyû nezaplatÌm?",Info_Jackal_Hello_WhatIf);
	Info_AddChoice		(Info_Jackal_Hello,"A co za to?",Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice		(Info_Jackal_Hello,"Tady je 10 nuget˘. A jestli budu mÌt potÌûe, tak mi pom˘ûeö.",Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output (other, self,"Info_Jackal_Hello_Pay_15_00"); //Tady je 10 nuget˘. A jestli budu mÌt potÌûe, tak mi pom˘ûeö.
	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_01"); //Pokud budu nablÌzku, m˘ûeö se mnou poËÌtat. Najdeö mÏ mezi trûiötÏm a jiûnÌ br·nou.
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_02"); //OstatnÌ oblasti pat¯Ì Fletcherovi a Bloodwynovi.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_NoOre_07_00"); //Hej, d·vej pozor na to, z koho si zkouöÌö utahovat! Vraù se, aû budeö mÌt ty nugety!
	};

	Info_ClearChoices	(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //A co za to?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //Pokud budeö na mÈm ˙zemÌ, budeö pod mojÌ ochranou.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //Pokud se dostaneö do problÈm˘ s chlapy z NovÈho t·bora, nebo ti bude hr·t na nervy nÏkdo z tÏch sekt·¯sk˝ch bl·zn˘, m˘ûeö se mnou poËÌtat.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //Kdybys mÏl potÌûe s nÏkter˝m z kop·Ë˘, pom˘ûeme tomu, kdo zaplatÌ - jednoduch˝ jak facka.
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //A co kdyû zaplatÌme oba?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Pak si sedneme na zadek a budeme se na to dÌvat. To se ale nest·v· moc Ëasto.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatIf_15_00"); //A co kdyû nezaplatÌm?
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_01"); //Poslyö, ËlovÏËe, nedÏlej si problÈmy! Jsi tady nov˝ - tak se rozhlÈdni kolem. Dej dohromady trochu rudy a aû budeö moci zaplatit, zaplaù.
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_02"); //M˘ûeö zaplatit kdykoliv - dokud ale nep¯ispÏjeö na moje v˝daje, nepoËÌtej s mojÌ pomocÌ. Jsem si jist˝, ûe tomu rozumÌö.
	Info_AddChoice		(Info_Jackal_Hello,"JeötÏ se uvidÌme.",Info_Jackal_Hello_Later);
};

func void Info_Jackal_Hello_Later()
{
	AI_Output (other, self,"Info_Jackal_Hello_Later_15_00"); //JeötÏ se uvidÌme.
	AI_Output (self, other,"Info_Jackal_Hello_Later_07_01"); //Tak na sebe d·vej pozor.
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
	description = "P¯em˝ölel jsem o tÏch penÏzÌch za ochranu - tady je tv˝ch 10 nuget˘.";
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
		AI_Output (other, self,"Info_Jackal_Schutz_15_00"); //P¯em˝ölel jsem o tÏch penÏzÌch za ochranu - tady je tv˝ch 10 nuget˘.
		AI_Output (self, other,"Info_Jackal_Schutz_07_01"); //Rozhodl ses spr·vnÏ, hochu. Od teÔka tÏ budu chr·nit!
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_07_02"); //NevidÌm tÏch 10 nuget˘, p¯Ìteli. Vraù se, aû je budeö mÌt.
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
	AI_Output (self, other,"Info_Jackal_PermPaid_07_01"); //Se mnou m˘ûeö kdykoliv poËÌtat, mladej!
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
	AI_Output (self, other,"GRD_201_Jackal_WELCOME_Info_07_01"); //Vypracoval jsi se velmi rychle! Dobr· pr·ce, chlape!
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
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_01"); //Hej, podÌvej se na to! To je ten zr·dce, kter˝ p¯eöel z t·bora do t·bora!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_02"); //NemÏl by ses st˝kat s takov˝mi ztroskotanci, nezapomeÚ, ûe jsi po¯·d jednÌm z n·s!
		}
		else
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_03"); //Hej, podÌvej se na to! To je ten chlapÌk z NovÈho t·bora, ten, co n·s dostal do potÌûÌ!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_04"); //Kdybys pobral vÌce zdravÈho rozumu, mohl bys teÔ b˝t na naöÌ stranÏ - na stranÏ vÌtÏz˘!
		};
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_05"); //PodÌvej se na to. To je ten chlapÌk z t·bora u baûin.
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_06"); //Byls mezi tÏmi bl·zny tak dlouho, ûe ti z nich zmÏkl mozek!
	};
	
	if 	Jackal_ProtectionPaid
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_07"); //TeÔ uû ti nepom˘ûou ani penÌze za ochranu, kterÈ jsi mi zaplatil.
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_08"); //MÏl jsi mi zaplatit tehdy, kdyû na to byl jeötÏ Ëas.
	};
			
	AI_Output			(other, self,"Info_Jackal_PAYDAY_15_09"); //Zaöli jste p¯Ìliö daleko! To byl pitom˝ n·pad, za˙toËit na d˘l!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_10"); //Vypad·, ûe to funguje. A ty to nezmÏnÌö, vÏ¯ mi!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_11"); //HEJ CHLAPI, DOSTA“TE HO!!!
	
	AI_StopProcessInfos	(self);
	
	B_Story_JackalFight	();
};

