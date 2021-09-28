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
	description		= "Widzê, ¿e znasz siê na swoim fachu.";
};

FUNC INT DIA_Huno_YouKnowYourJob_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output (other,self,"DIA_Huno_YouKnowYourJob_15_00"); //Widzê, ¿e znasz siê na swoim fachu.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Jeszcze nikt nie mia³ powodu do narzekania.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_02"); //I lepiej, ¿eby nikt tego nie robi³! Ka¿dy dureñ potrzebuje miecza, i to w³aœnie ode mnie dostaj¹!
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
	description		= "Jak d³ugo zajmuje wykucie jednego miecza?";
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
	AI_Output (other,self,"DIA_Huno_HowLong_15_00"); //Jak d³ugo zajmuje wykucie jednego miecza?
	AI_Output (self,other,"DIA_Huno_HowLong_09_01"); //To zale¿y. Jeœli chodzi o najprostsze ostrza, wystarczy kilka minut.
	AI_Output (self,other,"DIA_Huno_HowLong_09_02"); //Oczywiœcie pod warunkiem, ¿e jestem odpowiednio zmotywowany... Finansowo.
	AI_Output (self,other,"DIA_Huno_HowLong_09_03"); //Oczywiœcie œwiry pokroju Œwistaka musz¹ czekaæ na swoje cacka nieco d³u¿ej.
	AI_Output (other,self,"DIA_Huno_HowLong_15_04"); //Dlaczego? Czy¿by Œwistak za ma³o ci zap³aci³?
	AI_Output (self,other,"DIA_Huno_HowLong_09_05"); //Nie, wrêcz przeciwnie. Za swój ostatni miecz da³ mi 150 bry³ek rudy.
	AI_Output (self,other,"DIA_Huno_HowLong_09_06"); //Ale facet lubi bogate zdobienia i takie tam babskie fanaberie, a to oczywiœcie kosztuje!
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
	description		= "Jak stoisz z prac¹, kowalu?";
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
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Jak stoisz z prac¹, kowalu?
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_01"); //A co ciê to obchodzi?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_02"); //Byæ mo¿e mam dla ciebie zamówienie.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_03"); //Czy¿by? A có¿ takiego, jeœli wolno spytaæ?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_04"); //Jeszcze siê zastanowiê.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_05"); //Wróæ, jak naprawdê bêdziesz czegoœ potrzebowa³. Póki co - nie zawracaj mi g³owy.
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
	description		= "Chêtnie spróbowa³bym si³ jako kowal.";
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
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_00"); //Chêtnie spróbowa³bym si³ jako kowal.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_01"); //Tylko nie wyobra¿aj sobie, ¿e tak ³atwo jest wykuæ solidny miecz!
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_02"); //Co powinienem zrobiæ?
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_03"); //Dobra, weŸ stal i rozgrzej j¹ nad ogniem.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_04"); //Potem rozbij j¹ na kowadle.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_05"); //Jak skoñczysz, w³ó¿ rozgrzane ostrze do wody, ¿eby je zahartowaæ.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_06"); //Na koniec trzeba je jeszcze naostrzyæ na kamieniu szlifierskim.
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_07"); //Rozumiem.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_08"); //Oczywiœcie do tego wszystkiego potrzeba odpowiedniego wyposa¿enia. Móg³bym ci je sprzedaæ, jeœli chcesz.

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
	description		= "Chcia³bym kupiæ narzêdzia kowalskie!";
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
	AI_Output (other,self,"DIA_Huno_BUYSMITH_15_00"); //Chcia³bym kupiæ narzêdzia kowalskie!

	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
};


