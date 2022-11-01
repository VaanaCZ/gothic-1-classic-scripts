// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Huno_Exit (C_INFO)
{
	npc			= Vlk_538_Huno;
	nr			= 999;
	condition	= DIA_Huno_Exit_Condition;
	information	= DIA_Huno_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Huno_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//	Info YouKnowYourJob
// **************************************************
INSTANCE DIA_Huno_YouKnowYourJob (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_YouKnowYourJob_Condition;
	information		= DIA_Huno_YouKnowYourJob_Info;
	permanent		= 0;
	important		= 0;
	description		= "Zdá se, že své práci rozumíš.";
};

FUNC INT DIA_Huno_YouKnowYourJob_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output (other,self,"DIA_Huno_YouKnowYourJob_15_00"); //Zdá se, že své práci rozumíš.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Zatím si nikdo nestěžoval.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_02"); //Rozhodně to nebyl špatný nápad. Každý idiot tu potřebuje meč a to je věc, kterou dostane ode mě.
};


// **************************************************
//	Info HowLong
// **************************************************
INSTANCE DIA_Huno_HowLong (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowLong_Condition;
	information		= DIA_Huno_HowLong_Info;
	permanent		= 0;
	important		= 0;
	description		= "Jak dlouho ti trvá výroba jedné čepele?";
};

FUNC INT DIA_Huno_HowLong_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowLong_Info()
{
	AI_Output (other,self,"DIA_Huno_HowLong_15_00"); //Jak dlouho ti trvá výroba jedné čepele?
	AI_Output (self,other,"DIA_Huno_HowLong_09_01"); //Záleží na typu. Jednoruční meče dělám rychle jako hurikán.
	AI_Output (self,other,"DIA_Huno_HowLong_09_02"); //Samozřejmě v případě, kdy mě motivuje cena.
	AI_Output (self,other,"DIA_Huno_HowLong_09_03"); //Podivín jako Whistler obvykle musí čekat na svou hračku déle než ostatní lidi.
	AI_Output (other,self,"DIA_Huno_HowLong_15_04"); //Proč? Neplatí dost?
	AI_Output (self,other,"DIA_Huno_HowLong_09_05"); //Ne, naopak. Za poslední meč dal 150 nugetů.
	AI_Output (self,other,"DIA_Huno_HowLong_09_06"); //Ten chlapík má zálibu v ozdobách a lákadlech na holky, proto to není levné.
	AI_Output (self,other,"DIA_Huno_HowLong_09_07"); //Hele, nejsi trochu moc zvědavý, příteli?
};

// **************************************************
//	Info HowsYourBusiness
// **************************************************
INSTANCE DIA_Huno_HowsYourBusiness (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowsYourBusiness_Condition;
	information		= DIA_Huno_HowsYourBusiness_Info;
	permanent		= 1;
	important		= 0;
	description		= "Tak co, kováři, jak jdou obchody?";
};

FUNC INT DIA_Huno_HowsYourBusiness_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Tak co, kováři, jak jdou obchody?
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_01"); //Proč to chceš vědět?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_02"); //Měl bych pro tebe zakázku.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_03"); //Opravdu? A jakou?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_04"); //Budu o tom přemýšlet.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_05"); //Přijď, až budeš něco opravdu potřebovat a přestaň mi lézt na nervy.
};

// **************************************************
//	Info LEARNSMITH
// **************************************************
var int	Huno_LearnSmith;
// **************************************************

INSTANCE DIA_Huno_LEARNSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_LEARNSMITH_Condition;
	information		= DIA_Huno_LEARNSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "Chtěl bych tu zkusit pracovat.";
};

FUNC INT DIA_Huno_LEARNSMITH_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_LEARNSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_00"); //Chtěl bych tu zkusit pracovat.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_01"); //Och, ale nemysli si, že tě nechám dělat výstřední čepele!
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_02"); //Co musím dělat?
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_03"); //Dobře, vezmi ocel a vlož ji do výhně.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_04"); //Potom musíš do ruda rozžhavenou ocel položit na kovadlinu.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_05"); //Když budeš hotový, vložíš horkou ocel do támhletoho kbelíku s vodou, aby se ochladila.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_06"); //Vychladlá čepel se musí nakonec nabrousit na brusu.
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_07"); //Aha.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_08"); //Budeš k tomu samozřejmě potřebovat nějaké věci, které ti můžu prodat.

	Huno_LearnSmith = TRUE;
};

// **************************************************
//	Info BUYSMITH
// **************************************************
INSTANCE DIA_Huno_BUYSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_BUYSMITH_Condition;
	information		= DIA_Huno_BUYSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "Chtěl bych koupit kovářskou výbavu.";
	trade			= 1;
};

FUNC INT DIA_Huno_BUYSMITH_Condition()
{	
	if	(Huno_LearnSmith == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_BUYSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_BUYSMITH_15_00"); //Chtěl bych koupit kovářskou výbavu.

	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
};


