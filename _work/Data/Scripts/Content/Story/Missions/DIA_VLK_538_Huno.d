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
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Zatím si nikdo nestìžoval.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_02"); //Rozhodnì to nebyl špatný nápad. Každý idiot tu potøebuje meè a to je vìc, kterou dostane ode mì.
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
	description		= "Jak dlouho ti trvá výroba jedné èepele?";
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
	AI_Output (other,self,"DIA_Huno_HowLong_15_00"); //Jak dlouho ti trvá výroba jedné èepele?
	AI_Output (self,other,"DIA_Huno_HowLong_09_01"); //Záleží na typu. Jednoruèní meèe dìlám rychle jako hurikán.
	AI_Output (self,other,"DIA_Huno_HowLong_09_02"); //Samozøejmì v pøípadì, kdy mì motivuje cena.
	AI_Output (self,other,"DIA_Huno_HowLong_09_03"); //Podivín jako Whistler obvykle musí èekat na svou hraèku déle než ostatní lidi.
	AI_Output (other,self,"DIA_Huno_HowLong_15_04"); //Proè? Neplatí dost?
	AI_Output (self,other,"DIA_Huno_HowLong_09_05"); //Ne, naopak. Za poslední meè dal 150 nugetù.
	AI_Output (self,other,"DIA_Huno_HowLong_09_06"); //Ten chlapík má zálibu v ozdobách a lákadlech na holky, proto to není levné.
	AI_Output (self,other,"DIA_Huno_HowLong_09_07"); //Hele, nejsi trochu moc zvìdavý, pøíteli?
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
	description		= "Tak co, kováøi, jak jdou obchody?";
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
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Tak co, kováøi, jak jdou obchody?
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_01"); //Proè to chceš vìdìt?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_02"); //Mìl bych pro tebe zakázku.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_03"); //Opravdu? A jakou?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_04"); //Budu o tom pøemýšlet.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_05"); //Pøijï, až budeš nìco opravdu potøebovat a pøestaò mi lézt na nervy.
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
	description		= "Chtìl bych tu zkusit pracovat.";
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
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_00"); //Chtìl bych tu zkusit pracovat.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_01"); //Och, ale nemysli si, že tì nechám dìlat výstøední èepele!
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_02"); //Co musím dìlat?
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_03"); //Dobøe, vezmi ocel a vlož ji do výhnì.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_04"); //Potom musíš do ruda rozžhavenou ocel položit na kovadlinu.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_05"); //Když budeš hotový, vložíš horkou ocel do támhletoho kbelíku s vodou, aby se ochladila.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_06"); //Vychladlá èepel se musí nakonec nabrousit na brusu.
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_07"); //Aha.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_08"); //Budeš k tomu samozøejmì potøebovat nìjaké vìci, které ti mùžu prodat.

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
	description		= "Chtìl bych koupit kováøskou výbavu.";
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
	AI_Output (other,self,"DIA_Huno_BUYSMITH_15_00"); //Chtìl bych koupit kováøskou výbavu.

	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
};


