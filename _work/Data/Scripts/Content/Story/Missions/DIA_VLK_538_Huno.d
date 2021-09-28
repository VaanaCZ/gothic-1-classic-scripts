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
	description		= "Widz�, �e znasz si� na swoim fachu.";
};

FUNC INT DIA_Huno_YouKnowYourJob_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output (other,self,"DIA_Huno_YouKnowYourJob_15_00"); //Widz�, �e znasz si� na swoim fachu.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Jeszcze nikt nie mia� powodu do narzekania.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_02"); //I lepiej, �eby nikt tego nie robi�! Ka�dy dure� potrzebuje miecza, i to w�a�nie ode mnie dostaj�!
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
	description		= "Jak d�ugo zajmuje wykucie jednego miecza?";
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
	AI_Output (other,self,"DIA_Huno_HowLong_15_00"); //Jak d�ugo zajmuje wykucie jednego miecza?
	AI_Output (self,other,"DIA_Huno_HowLong_09_01"); //To zale�y. Je�li chodzi o najprostsze ostrza, wystarczy kilka minut.
	AI_Output (self,other,"DIA_Huno_HowLong_09_02"); //Oczywi�cie pod warunkiem, �e jestem odpowiednio zmotywowany... Finansowo.
	AI_Output (self,other,"DIA_Huno_HowLong_09_03"); //Oczywi�cie �wiry pokroju �wistaka musz� czeka� na swoje cacka nieco d�u�ej.
	AI_Output (other,self,"DIA_Huno_HowLong_15_04"); //Dlaczego? Czy�by �wistak za ma�o ci zap�aci�?
	AI_Output (self,other,"DIA_Huno_HowLong_09_05"); //Nie, wr�cz przeciwnie. Za sw�j ostatni miecz da� mi 150 bry�ek rudy.
	AI_Output (self,other,"DIA_Huno_HowLong_09_06"); //Ale facet lubi bogate zdobienia i takie tam babskie fanaberie, a to oczywi�cie kosztuje!
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
	description		= "Jak stoisz z prac�, kowalu?";
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
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Jak stoisz z prac�, kowalu?
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_01"); //A co ci� to obchodzi?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_02"); //By� mo�e mam dla ciebie zam�wienie.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_03"); //Czy�by? A c� takiego, je�li wolno spyta�?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_04"); //Jeszcze si� zastanowi�.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_05"); //Wr��, jak naprawd� b�dziesz czego� potrzebowa�. P�ki co - nie zawracaj mi g�owy.
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
	description		= "Ch�tnie spr�bowa�bym si� jako kowal.";
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
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_00"); //Ch�tnie spr�bowa�bym si� jako kowal.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_01"); //Tylko nie wyobra�aj sobie, �e tak �atwo jest wyku� solidny miecz!
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_02"); //Co powinienem zrobi�?
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_03"); //Dobra, we� stal i rozgrzej j� nad ogniem.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_04"); //Potem rozbij j� na kowadle.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_05"); //Jak sko�czysz, w�� rozgrzane ostrze do wody, �eby je zahartowa�.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_06"); //Na koniec trzeba je jeszcze naostrzy� na kamieniu szlifierskim.
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_07"); //Rozumiem.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_08"); //Oczywi�cie do tego wszystkiego potrzeba odpowiedniego wyposa�enia. M�g�bym ci je sprzeda�, je�li chcesz.

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
	description		= "Chcia�bym kupi� narz�dzia kowalskie!";
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
	AI_Output (other,self,"DIA_Huno_BUYSMITH_15_00"); //Chcia�bym kupi� narz�dzia kowalskie!

	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
};


