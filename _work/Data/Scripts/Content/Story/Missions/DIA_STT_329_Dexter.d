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
// 					Erste Begrüssung
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
	AI_Output (self,other,"DIA_Dexter_IAmNew_10_00"); //Hej, ty! Obchoduju s drogou z bažiny a lektvary ze Sektovního tábora. Chceš něco?
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
	description	= "Co je to droga z bažiny?";
};                       

FUNC INT DIA_Dexter_Kraut_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Kraut_Info()
{
	AI_Output (other,self,"DIA_Dexter_Kraut_15_00"); //Co je to droga z bažiny?
	AI_Output (self,other,"DIA_Dexter_Kraut_10_01"); //Jsi tady nový, viď? Můžeš ji kouřit. Pro většinu z nás je to velmi uvolňující.
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
	description	= "Ukaž mi svoje zboží.";
	Trade		= 1;
};                       

FUNC INT DIA_Dexter_Trade_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Trade_Info()
{
	AI_Output (other,self,"DIA_Dexter_Trade_15_00"); //Ukaž mi svoje zboží.
	AI_Output (self,other,"DIA_Dexter_Trade_10_01"); //Mám tu nejlepší zboží...
	
	if	(Dexter_Traded == FALSE)
	{
		Log_CreateTopic(GE_TraderOC, LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Dexter, jeden ze Stínů, obchoduje s drogou z bažin a LEKTVARY ze Sektářského tábora.");
	
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
	description	= "Chci se přidat k táboru - chci se stát Stínem.";
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
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_00"); //Chci se přidat k táboru - chci se stát Stínem.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_01"); //Och? Hledáš příležitost ukázat svoji cenu?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_02"); //Dobře - můžeš mi prokázat laskavost. Když to provedeš dobře, přimluvím se za tebe u Diega.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_03"); //Co to je?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_04"); //V Sektovním táboře je muž jménem Kalom. Vezmu to zkrátka - je to jeden z Guru té sekty.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_05"); //Kalom je alchymista. Má recept na účinný hojivý lektvar.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_06"); //Chtěl bych od něj ten recept koupit, abych si ho mohl připravovat sám.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_07"); //Nikdo se ale ke Kalomovi nedostane.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_08"); //A co mám v té věci udělat já?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_09"); //Ti sektářští blázni hledají v současnosti nové lidi. Jsi tady nový. Předstírej, že se chceš nechat přijmout...
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_10"); //Kalom je jedním z Guru, což znamená, že zkouší nové uchazeče. Jestli se s ním dostaneš do styku, pokus se dostat ten recept.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_11"); //Jestli za to zaplatíš nebo ne, je mi jedno.

	Info_ClearChoices(DIA_Dexter_JoinOC);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Dobře - uvidím, jestli tu věc budu moci dostat.",DIA_Dexter_JoinOC_Ok);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Vypadá to na obtížný úkol - kolik mi to vynese?",DIA_Dexter_JoinOC_HowMuch);
};

func void DIA_Dexter_JoinOC_Ok()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Ok_15_00"); //Dobře - uvidím, jestli tu věc budu moci dostat.
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, jeden ze Stínů od tržiště, mi řekl, abych se vydal ke guru Kalomovi do Sektářského tábora a získal od něj recept.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter říkal, že se mám vydávat za přívržence Sektářského tábora, abych se dostal dovnitř.");
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

func void DIA_Dexter_JoinOC_HowMuch()	
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_HowMuch_15_00"); //Vypadá to na obtížný úkol - kolik mi to vynese?
	AI_Output (self,other,"DIA_Dexter_JoinOC_HowMuch_10_01"); //Nějaké body ve chvíli, když se mě Diego zeptá, jestli máš pro nás cenu. A hádej, na čem bude záviset moje odpověď.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Možná budu muset za ten recept zaplatit - dej mi 50 nugetů jako zálohu.",DIA_Dexter_JoinOC_Advance);
};

func void DIA_Dexter_JoinOC_Advance()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Advance_15_00"); //Možná budu muset za ten recept zaplatit - dej mi 50 nugetů jako zálohu.
	AI_Output (self,other,"DIA_Dexter_JoinOC_Advance_10_01"); //Zapomeň na to!
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Žádná ruda, žádný recept!",DIA_Dexter_JoinOC_Threat);
};

func void DIA_Dexter_JoinOC_Threat()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Threat_15_00"); //Žádná ruda, žádný recept!
	AI_Output (self,other,"DIA_Dexter_JoinOC_Threat_10_01"); //Dobrá! O rudě se můžeme začít bavit, až budeš mít ten recept.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Ne! Chci to vidět teď a pak si můžeš ten recept nechat.",DIA_Dexter_JoinOC_OreNowOrElse);
};

func void DIA_Dexter_JoinOC_OreNowOrElse()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00"); //Ne! Chci to vidět teď a pak si můžeš ten recept nechat.
	AI_Output (self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01"); //Je tady spousta jiných nováčků.Myslím, že bych ten úkol mohl dát někomu z nich...
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Dobře! Zapomeňme na celou tu věc.",DIA_Dexter_JoinOC_ForgetIt);
};

func void DIA_Dexter_JoinOC_ForgetIt()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00"); //Dobře! Zapomeňme na celou tu věc.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01"); //Ne tak rychle! Chtěl jsem jen vědět, jak daleko bys zašel... 50 nugetů je pro nováčka docela dost, nemyslíš?
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02"); //To zní líp.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03"); //Dobře, dobře, mám tady 50 nugetů rudy uložených stranou. Ale nepokoušej se mě podvést, mladej!
	
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, jeden ze Stínů od tržiště, mi řekl, abych se vydal ke guru Kalomovi do Sektářského tábora a získal od něj recept.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter říkal, že se mám vydávat za přívržence Sektářského tábora, abych se dostal dovnitř.");
	
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
	description	= "Kde je Sektovní tábor?";
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
	AI_Output (other,self,"DIA_Dexter_WhereST_15_00"); //Kde je Sektovní tábor?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_01"); //Vyjdeš z tábora jižním východem, pak se dáš na východ. Měl by sis vzít mapu.
	
	if (Npc_HasItems(self,ItWrWorldmap) >0)														//Björn
		{																						//Björn
			AI_Output (self,other,"DIA_Dexter_WhereST_10_02"); //Mám tady 50 nugetů...
		};																						//Björn
	
	AI_Output (other,self,"DIA_Dexter_WhereST_15_02"); //Jižní východ je ta zhroucená věž, ne?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_03"); //Přesně tak.
	
	if	!Dexter_PsiCamp
	{
		B_LogEntry    (CH1_KalomsRecipe,"Sektářský tábor leží na východ od Starého tábora.");
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
	description	= "Mám ten recept, co jsi chtěl!";
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
	AI_Output (other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00"); //Mám ten recept, co jsi chtěl!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01"); //Výborně! Ukaž mi ho!
	
	B_UseFakeScroll();
	
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02"); //Dobře! Teď si budu moci připravovat lektvar sám.
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03"); //Jsi dobrý chlap! Řeknu to Diegovi!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //Tady - vezmi si - za svoji snahu...
	
	CreateInvItems (other,itminugget,50);
	
	B_GiveInvItems (other, self, KalomsRecipe, 1);
	
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Na Dextera to udělalo dojem. Jsem si jistý, že se za mě u Diega přimluví.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Na Dextera to udělalo dojem. Nic z toho však nebudu mít - už se nikdy nebudu moci stát Stínem.");
	};
	B_GiveXP (XP_DexterKalom);
};

