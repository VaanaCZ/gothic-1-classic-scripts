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
	description		= "Widzę, że znasz się na swoim fachu.";
};

FUNC INT DIA_Huno_YouKnowYourJob_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output (other,self,"DIA_Huno_YouKnowYourJob_15_00"); //Widzę, że znasz się na swoim fachu.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Jeszcze nikt nie miał powodu do narzekania.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_02"); //I lepiej, żeby nikt tego nie robił! Każdy dureń potrzebuje miecza, i to właśnie ode mnie dostają!
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
	description		= "Jak długo zajmuje wykucie jednego miecza?";
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
	AI_Output (other,self,"DIA_Huno_HowLong_15_00"); //Jak długo zajmuje wykucie jednego miecza?
	AI_Output (self,other,"DIA_Huno_HowLong_09_01"); //To zależy. Jeśli chodzi o najprostsze ostrza, wystarczy kilka minut.
	AI_Output (self,other,"DIA_Huno_HowLong_09_02"); //Oczywiście pod warunkiem, że jestem odpowiednio zmotywowany... Finansowo.
	AI_Output (self,other,"DIA_Huno_HowLong_09_03"); //Oczywiście świry pokroju Świstaka muszą czekać na swoje cacka nieco dłużej.
	AI_Output (other,self,"DIA_Huno_HowLong_15_04"); //Dlaczego? Czyżby Świstak za mało ci zapłacił?
	AI_Output (self,other,"DIA_Huno_HowLong_09_05"); //Nie, wręcz przeciwnie. Za swój ostatni miecz dał mi 150 bryłek rudy.
	AI_Output (self,other,"DIA_Huno_HowLong_09_06"); //Ale facet lubi bogate zdobienia i takie tam babskie fanaberie, a to oczywiście kosztuje!
	AI_Output (self,other,"DIA_Huno_HowLong_09_07"); //Hej, ciekawski z ciebie facet, kolego!
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
	description		= "Jak stoisz z pracą, kowalu?";
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
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Jak stoisz z pracą, kowalu?
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_01"); //A co cię to obchodzi?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_02"); //Być może mam dla ciebie zamówienie.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_03"); //Czyżby? A cóż takiego, jeśli wolno spytać?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_04"); //Jeszcze się zastanowię.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_05"); //Wróć, jak naprawdę będziesz czegoś potrzebował. Póki co - nie zawracaj mi głowy.
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
	description		= "Chętnie spróbowałbym sił jako kowal.";
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
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_00"); //Chętnie spróbowałbym sił jako kowal.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_01"); //Tylko nie wyobrażaj sobie, że tak łatwo jest wykuć solidny miecz!
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_02"); //Co powinienem zrobić?
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_03"); //Dobra, weź stal i rozgrzej ją nad ogniem.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_04"); //Potem rozbij ją na kowadle.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_05"); //Jak skończysz, włóż rozgrzane ostrze do wody, żeby je zahartować.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_06"); //Na koniec trzeba je jeszcze naostrzyć na kamieniu szlifierskim.
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_07"); //Rozumiem.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_08"); //Oczywiście do tego wszystkiego potrzeba odpowiedniego wyposażenia. Mógłbym ci je sprzedać, jeśli chcesz.

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
	description		= "Chciałbym kupić narzędzia kowalskie!";
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
	AI_Output (other,self,"DIA_Huno_BUYSMITH_15_00"); //Chciałbym kupić narzędzia kowalskie!

	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
};


