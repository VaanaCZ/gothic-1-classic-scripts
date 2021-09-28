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
	AI_Output (self, other,"Info_Jackal_Hello_07_00"); //�! Nov� tv��.
	AI_Output (other, self,"Info_Jackal_Hello_15_01"); //Co chce�?
	AI_Output (self, other,"Info_Jackal_Hello_07_02"); //Chci ti nab�dnout pomoc. Jsi tady nov� a nov��ci se v�dycky dostanou do probl�m�... Spoustu by sis jich mohl u�et�it poskytnut�m mal� dotace.
	AI_Output (self, other,"Info_Jackal_Hello_07_03"); //Jen 10 nuget�, �lov��e! Snad toho tolik ne��d�m.
	
	Info_ClearChoices	(Info_Jackal_Hello);
	Info_AddChoice		(Info_Jackal_Hello,"A co kdy� nezaplat�m?",Info_Jackal_Hello_WhatIf);
	Info_AddChoice		(Info_Jackal_Hello,"A co za to?",Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice		(Info_Jackal_Hello,"Tady je 10 nuget�. A jestli budu m�t pot�e, tak mi pom��e�.",Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output (other, self,"Info_Jackal_Hello_Pay_15_00"); //Tady je 10 nuget�. A jestli budu m�t pot�e, tak mi pom��e�.
	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_01"); //Pokud budu nabl�zku, m��e� se mnou po��tat. Najde� m� mezi tr�i�t�m a ji�n� br�nou.
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_02"); //Ostatn� oblasti pat�� Fletcherovi a Bloodwynovi.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_NoOre_07_00"); //Hej, d�vej pozor na to, z koho si zkou�� utahovat! Vra� se, a� bude� m�t ty nugety!
	};

	Info_ClearChoices	(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //A co za to?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //Pokud bude� na m�m �zem�, bude� pod moj� ochranou.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //Pokud se dostane� do probl�m� s chlapy z Nov�ho t�bora, nebo ti bude hr�t na nervy n�kdo z t�ch sekt��sk�ch bl�zn�, m��e� se mnou po��tat.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //Kdybys m�l pot�e s n�kter�m z kop���, pom��eme tomu, kdo zaplat� - jednoduch� jak facka.
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //A co kdy� zaplat�me oba?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Pak si sedneme na zadek a budeme se na to d�vat. To se ale nest�v� moc �asto.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatIf_15_00"); //A co kdy� nezaplat�m?
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_01"); //Posly�, �lov��e, ned�lej si probl�my! Jsi tady nov� - tak se rozhl�dni kolem. Dej dohromady trochu rudy a a� bude� moci zaplatit, zapla�.
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_02"); //M��e� zaplatit kdykoliv - dokud ale nep�isp�je� na moje v�daje, nepo��tej s moj� pomoc�. Jsem si jist�, �e tomu rozum�.
	Info_AddChoice		(Info_Jackal_Hello,"Je�t� se uvid�me.",Info_Jackal_Hello_Later);
};

func void Info_Jackal_Hello_Later()
{
	AI_Output (other, self,"Info_Jackal_Hello_Later_15_00"); //Je�t� se uvid�me.
	AI_Output (self, other,"Info_Jackal_Hello_Later_07_01"); //Tak na sebe d�vej pozor.
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
	description = "P�em��lel jsem o t�ch pen�z�ch za ochranu - tady je tv�ch 10 nuget�.";
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
		AI_Output (other, self,"Info_Jackal_Schutz_15_00"); //P�em��lel jsem o t�ch pen�z�ch za ochranu - tady je tv�ch 10 nuget�.
		AI_Output (self, other,"Info_Jackal_Schutz_07_01"); //Rozhodl ses spr�vn�, hochu. Od te�ka t� budu chr�nit!
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_07_02"); //Nevid�m t�ch 10 nuget�, p��teli. Vra� se, a� je bude� m�t.
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
	AI_Output (self, other,"Info_Jackal_PermPaid_07_01"); //Se mnou m��e� kdykoliv po��tat, mladej!
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
	AI_Output (self, other,"GRD_201_Jackal_WELCOME_Info_07_01"); //Vypracoval jsi se velmi rychle! Dobr� pr�ce, chlape!
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
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_01"); //Hej, pod�vej se na to! To je ten zr�dce, kter� p�e�el z t�bora do t�bora!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_02"); //Nem�l by ses st�kat s takov�mi ztroskotanci, nezapome�, �e jsi po��d jedn�m z n�s!
		}
		else
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_03"); //Hej, pod�vej se na to! To je ten chlap�k z Nov�ho t�bora, ten, co n�s dostal do pot��!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_04"); //Kdybys pobral v�ce zdrav�ho rozumu, mohl bys te� b�t na na�� stran� - na stran� v�t�z�!
		};
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_05"); //Pod�vej se na to. To je ten chlap�k z t�bora u ba�in.
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_06"); //Byls mezi t�mi bl�zny tak dlouho, �e ti z nich zm�kl mozek!
	};
	
	if 	Jackal_ProtectionPaid
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_07"); //Te� u� ti nepom��ou ani pen�ze za ochranu, kter� jsi mi zaplatil.
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_08"); //M�l jsi mi zaplatit tehdy, kdy� na to byl je�t� �as.
	};
			
	AI_Output			(other, self,"Info_Jackal_PAYDAY_15_09"); //Za�li jste p��li� daleko! To byl pitom� n�pad, za�to�it na d�l!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_10"); //Vypad�, �e to funguje. A ty to nezm�n�, v�� mi!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_11"); //HEJ CHLAPI, DOSTA�TE HO!!!
	
	AI_StopProcessInfos	(self);
	
	B_Story_JackalFight	();
};

