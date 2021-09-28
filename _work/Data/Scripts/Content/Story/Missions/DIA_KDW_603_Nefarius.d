// **************************** 
//				EXIT 
// ****************************

instance  Info_Nefarius_EXIT (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	999;
	condition	=	Info_Nefarius_EXIT_Condition;
	information	=	Info_Nefarius_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Nefarius_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************** 
//			Hallo 
// ****************************

instance  Info_Nefarius_Hallo (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_Hallo_Condition;
	information	=	Info_Nefarius_Hallo_Info;
	permanent	=	0;
	description =	"Kdo jsi?";
};                       

FUNC int  Info_Nefarius_Hallo_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_Hallo_Info()
{
	AI_Output (other, self,"Info_Nefarius_Hallo_15_00"); //Kdo jsi?
	AI_Output (self, other,"Info_Nefarius_Hallo_04_01"); //Jsem Nefarius. M�g Kruhu vody.
};

// **************************** 
//			Wo Saturas
// ****************************

instance  Info_Nefarius_WoSaturas (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	2;
	condition	=	Info_Nefarius_WoSaturas_Condition;
	information	=	Info_Nefarius_WoSaturas_Info;
	permanent	=	0;
	description =	"Kde najdu Saturase?";
};                       

FUNC int  Info_Nefarius_WoSaturas_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_WoSaturas_Info()
{
	AI_Output (other, self,"Info_Nefarius_WoSaturas_15_00"); //Kde najdu Saturase?
	AI_Output (self, other,"Info_Nefarius_WoSaturas_04_01"); //Projdi tou velkou kulatou branou. Tam ho najde�.
};

// **************************** 
//			WannaMage
// ****************************

instance  Info_Nefarius_WannaMage (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_WannaMage_Condition;
	information	=	Info_Nefarius_WannaMage_Info;
	permanent	=	0;
	description =	"Cht�l bych se st�t m�gem Kruhu vody.";
};                       

FUNC int  Info_Nefarius_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Hallo))
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_WannaMage_Info()
{
	AI_Output (other, self,"Info_Nefarius_WannaMage_15_00"); //Cht�l bych se st�t m�gem Kruhu vody.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_01"); //(sm�ch) Ne tak rychle, chlap�e!
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_02"); //Ne� mezi sebe vezmeme n�jak�ho mlad�ka, mus� vykonat n�co velk�ho.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_03"); //A n�jak� �as n�m mus� slou�it.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_04"); //Pokud to mysl� v�n�, m�l by ses p�idat k �old�k�m. U nich n�m m��e� slou�it.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_05"); //A jednoho dne mo�n� dostane� mo�nost vykonat n�co velk�ho.
};

// **************************** 
//			NowReady
// ****************************

instance  Info_Nefarius_NowReady (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_NowReady_Condition;
	information	=	Info_Nefarius_NowReady_Info;
	permanent	=	1;
	description =	"Jsem p�ipraven na vstup do Kruhu vody?";
};                       

FUNC int  Info_Nefarius_NowReady_Condition()
{
	if	( !FMTaken && Npc_KnowsInfo(hero, Info_Nefarius_WannaMage) && (Npc_GetTrueGuild(hero)!=GIL_KDW) )
	{
		return 1;
	};	
};

FUNC VOID  Info_Nefarius_NowReady_Info()
{
	AI_Output (other, self,"Info_Nefarius_NowReady_15_00"); //Jsem p�ipraven na vstup do Kruhu vody?
	
	if (Npc_GetTrueGuild (hero) != GIL_SLD) 
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_01"); //Sta� se jedn�m z na�ich �old�k�, pak se uvid�...
	}
	else
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_02"); //V�m, stal ses jedn�m z na�ich �old�k�. Velmi dob�e, velmi dob�e...
		AI_Output (self, other,"Info_Nefarius_NowReady_04_03"); //�as dokon� zbytek...
	};
};

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
///////////////		Kapitel 4				//////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

// **************************** 
//			OCNews
// ****************************

instance  Info_Nefarius_OCNews (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_OCNews_Condition;
	information	=	Info_Nefarius_OCNews_Info;
	permanent	=	0;
	important	= 	1;
};                       

FUNC int  Info_Nefarius_OCNews_Condition()
{
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID  Info_Nefarius_OCNews_Info()
{
	AI_Output (self, other,"Info_Nefarius_OCNews_04_00"); //Jsou n�jak� noviny u na�ich p��tel ze Star�ho t�bora?
	AI_Output (other, self,"Info_Nefarius_OCNews_15_01"); //Gomez zabil v�echny m�gy Ohn�!
	AI_Output (self, other,"Info_Nefarius_OCNews_04_02"); //Ne! Ten gr�zl! Varoval jsem Corrista - nikdy se mu nedalo v��it! Mus� o tom ��ci Saturasovi!
	if (Npc_GetTrueGuild(hero)==GIL_SLD)
	{
		AI_Output (self, other,"Info_Nefarius_OCNews_04_03"); //Po�kej!
		AI_Output (self, other,"Info_Nefarius_OCNews_04_04"); //�elil jsi za n�s velk�mu nebezpe��.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_05"); //Mysl�m, �e jsi u� hoden obl�knout roucho m�ga Vody.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_06"); //Te� ale promluv se Saturasem. Posp� si!
	};
	AI_StopProcessInfos	(self);
};
