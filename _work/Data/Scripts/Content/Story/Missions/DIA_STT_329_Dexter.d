// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dexter_Exit (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 999;
	condition	= DIA_Dexter_Exit_Condition;
	information	= DIA_Dexter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dexter_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begr�ssung
// **************************************************

INSTANCE DIA_Dexter_First (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_First_Condition;
	information	= DIA_Dexter_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Dexter_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_First_Info()
{
	AI_Output (self,other,"DIA_Dexter_IAmNew_10_00"); //Hej, ty! Obchoduju s drogou z ba�iny a lektvary ze Sektovn�ho t�bora. Chce� n�co?
};

// **************************************************
// 					Kraut
// **************************************************

INSTANCE DIA_Dexter_Kraut (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_Kraut_Condition;
	information	= DIA_Dexter_Kraut_Info;
	permanent	= 0;
	description	= "Co je to droga z ba�iny?";
};                       

FUNC INT DIA_Dexter_Kraut_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Kraut_Info()
{
	AI_Output (other,self,"DIA_Dexter_Kraut_15_00"); //Co je to droga z ba�iny?
	AI_Output (self,other,"DIA_Dexter_Kraut_10_01"); //Jsi tady nov�, vi�? M��e� ji kou�it. Pro v�t�inu z n�s je to velmi uvol�uj�c�.
};

// **************************************************
// 					TRADE
// **************************************************

// **************************************************

INSTANCE DIA_Dexter_Trade (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_Trade_Condition;
	information	= DIA_Dexter_Trade_Info;
	permanent	= 1;
	description	= "Uka� mi svoje zbo��.";
	Trade		= 1;
};                       

FUNC INT DIA_Dexter_Trade_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Trade_Info()
{
	AI_Output (other,self,"DIA_Dexter_Trade_15_00"); //Uka� mi svoje zbo��.
	AI_Output (self,other,"DIA_Dexter_Trade_10_01"); //M�m tu nejlep�� zbo��...
	
	if	(Dexter_Traded == FALSE)
	{
		Log_CreateTopic(GE_TraderOC, LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Dexter, jeden ze St�n�, obchoduje s drogou z ba�in a LEKTVARY ze Sekt��sk�ho t�bora.");
	
		Dexter_Traded = TRUE;
	};
};

// **************************************************
// 					JOIN OC
// **************************************************
	var int Dexter_GetKalomsRecipe;
// **************************************************

INSTANCE DIA_Dexter_JoinOC (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_JoinOC_Condition;
	information	= DIA_Dexter_JoinOC_Info;
	permanent	= 0;
	description	= "Chci se p�idat k t�boru - chci se st�t St�nem.";
};                       

FUNC INT DIA_Dexter_JoinOC_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Dexter_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_00"); //Chci se p�idat k t�boru - chci se st�t St�nem.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_01"); //Och? Hled� p��le�itost uk�zat svoji cenu?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_02"); //Dob�e - m��e� mi prok�zat laskavost. Kdy� to provede� dob�e, p�imluv�m se za tebe u Diega.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_03"); //Co to je?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_04"); //V Sektovn�m t�bo�e je mu� jm�nem Kalom. Vezmu to zkr�tka - je to jeden z Guru t� sekty.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_05"); //Kalom je alchymista. M� recept na ��inn� hojiv� lektvar.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_06"); //Cht�l bych od n�j ten recept koupit, abych si ho mohl p�ipravovat s�m.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_07"); //Nikdo se ale ke Kalomovi nedostane.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_08"); //A co m�m v t� v�ci ud�lat j�?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_09"); //Ti sekt���t� bl�zni hledaj� v sou�asnosti nov� lidi. Jsi tady nov�. P�edst�rej, �e se chce� nechat p�ijmout...
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_10"); //Kalom je jedn�m z Guru, co� znamen�, �e zkou�� nov� uchaze�e. Jestli se s n�m dostane� do styku, pokus se dostat ten recept.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_11"); //Jestli za to zaplat� nebo ne, je mi jedno.

	Info_ClearChoices(DIA_Dexter_JoinOC);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Dob�e - uvid�m, jestli tu v�c budu moci dostat.",DIA_Dexter_JoinOC_Ok);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Vypad� to na obt�n� �kol - kolik mi to vynese?",DIA_Dexter_JoinOC_HowMuch);
};

func void DIA_Dexter_JoinOC_Ok()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Ok_15_00"); //Dob�e - uvid�m, jestli tu v�c budu moci dostat.
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, jeden ze St�n� od tr�i�t�, mi �ekl, abych se vydal ke guru Kalomovi do Sekt��sk�ho t�bora a z�skal od n�j recept.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter ��kal, �e se m�m vyd�vat za p��vr�ence Sekt��sk�ho t�bora, abych se dostal dovnit�.");
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

func void DIA_Dexter_JoinOC_HowMuch()	
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_HowMuch_15_00"); //Vypad� to na obt�n� �kol - kolik mi to vynese?
	AI_Output (self,other,"DIA_Dexter_JoinOC_HowMuch_10_01"); //N�jak� body ve chv�li, kdy� se m� Diego zept�, jestli m� pro n�s cenu. A h�dej, na �em bude z�viset moje odpov��.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Mo�n� budu muset za ten recept zaplatit - dej mi 50 nuget� jako z�lohu.",DIA_Dexter_JoinOC_Advance);
};

func void DIA_Dexter_JoinOC_Advance()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Advance_15_00"); //Mo�n� budu muset za ten recept zaplatit - dej mi 50 nuget� jako z�lohu.
	AI_Output (self,other,"DIA_Dexter_JoinOC_Advance_10_01"); //Zapome� na to!
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"��dn� ruda, ��dn� recept!",DIA_Dexter_JoinOC_Threat);
};

func void DIA_Dexter_JoinOC_Threat()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Threat_15_00"); //��dn� ruda, ��dn� recept!
	AI_Output (self,other,"DIA_Dexter_JoinOC_Threat_10_01"); //Dobr�! O rud� se m��eme za��t bavit, a� bude� m�t ten recept.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Ne! Chci to vid�t te� a pak si m��e� ten recept nechat.",DIA_Dexter_JoinOC_OreNowOrElse);
};

func void DIA_Dexter_JoinOC_OreNowOrElse()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00"); //Ne! Chci to vid�t te� a pak si m��e� ten recept nechat.
	AI_Output (self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01"); //Je tady spousta jin�ch nov��k�.Mysl�m, �e bych ten �kol mohl d�t n�komu z nich...
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Dob�e! Zapome�me na celou tu v�c.",DIA_Dexter_JoinOC_ForgetIt);
};

func void DIA_Dexter_JoinOC_ForgetIt()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00"); //Dob�e! Zapome�me na celou tu v�c.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01"); //Ne tak rychle! Cht�l jsem jen v�d�t, jak daleko bys za�el... 50 nuget� je pro nov��ka docela dost, nemysl�?
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02"); //To zn� l�p.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03"); //Dob�e, dob�e, m�m tady 50 nuget� rudy ulo�en�ch stranou. Ale nepokou�ej se m� podv�st, mladej!
	
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, jeden ze St�n� od tr�i�t�, mi �ekl, abych se vydal ke guru Kalomovi do Sekt��sk�ho t�bora a z�skal od n�j recept.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter ��kal, �e se m�m vyd�vat za p��vr�ence Sekt��sk�ho t�bora, abych se dostal dovnit�.");
	
	CreateInvItems(self, itminugget, 50);
	B_GiveInvItems(self, other, itminugget, 50);
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

// **************************************************
// 					Where ST
// **************************************************
var int Dexter_PsiCamp;
// **************************************************

INSTANCE DIA_Dexter_WhereST (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_WhereST_Condition;
	information	= DIA_Dexter_WhereST_Info;
	permanent	= 1;
	description	= "Kde je Sektovn� t�bor?";
};                       

FUNC INT DIA_Dexter_WhereST_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_WhereST_Info()
{
	AI_Output (other,self,"DIA_Dexter_WhereST_15_00"); //Kde je Sektovn� t�bor?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_01"); //Vyjde� z t�bora ji�n�m v�chodem, pak se d� na v�chod. M�l by sis vz�t mapu.
	
	if (Npc_HasItems(self,ItWrWorldmap) >0)														//Bj�rn
		{																						//Bj�rn
			AI_Output (self,other,"DIA_Dexter_WhereST_10_02"); //M�m tady 50 nuget�...
		};																						//Bj�rn
	
	AI_Output (other,self,"DIA_Dexter_WhereST_15_02"); //Ji�n� v�chod je ta zhroucen� v�, ne?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_03"); //P�esn� tak.
	
	if	!Dexter_PsiCamp
	{
		B_LogEntry    (CH1_KalomsRecipe,"Sekt��sk� t�bor le�� na v�chod od Star�ho t�bora.");
		Dexter_PsiCamp = TRUE;
	};
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Dexter_KalomsRecipeSuccess (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_KalomsRecipeSuccess_Condition;
	information	= DIA_Dexter_KalomsRecipeSuccess_Info;
	permanent	= 1;
	description	= "M�m ten recept, co jsi cht�l!";
};                       

FUNC INT DIA_Dexter_KalomsRecipeSuccess_Condition()
{
	if ( (Dexter_GetKalomsRecipe == LOG_RUNNING) && (Npc_HasItems (other, KalomsRecipe) > 0) )
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_KalomsRecipeSuccess_Info()
{
	AI_Output (other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00"); //M�m ten recept, co jsi cht�l!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01"); //V�born�! Uka� mi ho!
	
	B_UseFakeScroll();
	
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02"); //Dob�e! Te� si budu moci p�ipravovat lektvar s�m.
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03"); //Jsi dobr� chlap! �eknu to Diegovi!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //Tady - vezmi si - za svoji snahu...
	
	CreateInvItems (other,itminugget,50);
	
	B_GiveInvItems (other, self, KalomsRecipe, 1);
	
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Na Dextera to ud�lalo dojem. Jsem si jist�, �e se za m� u Diega p�imluv�.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Na Dextera to ud�lalo dojem. Nic z toho v�ak nebudu m�t - u� se nikdy nebudu moci st�t St�nem.");
	};
	B_GiveXP (XP_DexterKalom);
};

