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
	description		= "Zd� se, �e sv� pr�ci rozum�.";
};

FUNC INT DIA_Huno_YouKnowYourJob_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output (other,self,"DIA_Huno_YouKnowYourJob_15_00"); //Zd� se, �e sv� pr�ci rozum�.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Zat�m si nikdo nest�oval.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_02"); //Rozhodn� to nebyl �patn� n�pad. Ka�d� idiot tu pot�ebuje me� a to je v�c, kterou dostane ode m�.
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
	description		= "Jak dlouho ti trv� v�roba jedn� �epele?";
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
	AI_Output (other,self,"DIA_Huno_HowLong_15_00"); //Jak dlouho ti trv� v�roba jedn� �epele?
	AI_Output (self,other,"DIA_Huno_HowLong_09_01"); //Z�le�� na typu. Jednoru�n� me�e d�l�m rychle jako hurik�n.
	AI_Output (self,other,"DIA_Huno_HowLong_09_02"); //Samoz�ejm� v p��pad�, kdy m� motivuje cena.
	AI_Output (self,other,"DIA_Huno_HowLong_09_03"); //Podiv�n jako Whistler obvykle mus� �ekat na svou hra�ku d�le ne� ostatn� lidi.
	AI_Output (other,self,"DIA_Huno_HowLong_15_04"); //Pro�? Neplat� dost?
	AI_Output (self,other,"DIA_Huno_HowLong_09_05"); //Ne, naopak. Za posledn� me� dal 150 nuget�.
	AI_Output (self,other,"DIA_Huno_HowLong_09_06"); //Ten chlap�k m� z�libu v ozdob�ch a l�kadlech na holky, proto to nen� levn�.
	AI_Output (self,other,"DIA_Huno_HowLong_09_07"); //Hele, nejsi trochu moc zv�dav�, p��teli?
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
	description		= "Tak co, kov��i, jak jdou obchody?";
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
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Tak co, kov��i, jak jdou obchody?
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_01"); //Pro� to chce� v�d�t?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_02"); //M�l bych pro tebe zak�zku.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_03"); //Opravdu? A jakou?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_04"); //Budu o tom p�em��let.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_05"); //P�ij�, a� bude� n�co opravdu pot�ebovat a p�esta� mi l�zt na nervy.
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
	description		= "Cht�l bych tu zkusit pracovat.";
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
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_00"); //Cht�l bych tu zkusit pracovat.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_01"); //Och, ale nemysli si, �e t� nech�m d�lat v�st�edn� �epele!
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_02"); //Co mus�m d�lat?
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_03"); //Dob�e, vezmi ocel a vlo� ji do v�hn�.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_04"); //Potom mus� do ruda roz�havenou ocel polo�it na kovadlinu.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_05"); //Kdy� bude� hotov�, vlo�� horkou ocel do t�mhletoho kbel�ku s vodou, aby se ochladila.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_06"); //Vychladl� �epel se mus� nakonec nabrousit na brusu.
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_07"); //Aha.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_08"); //Bude� k tomu samoz�ejm� pot�ebovat n�jak� v�ci, kter� ti m��u prodat.

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
	description		= "Cht�l bych koupit kov��skou v�bavu.";
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
	AI_Output (other,self,"DIA_Huno_BUYSMITH_15_00"); //Cht�l bych koupit kov��skou v�bavu.

	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
};


