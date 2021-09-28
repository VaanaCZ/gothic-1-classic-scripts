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
	AI_Output (self, other,"Info_Nefarius_Hallo_04_01"); //Jsem Nefarius. Mág Kruhu vody.
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
	AI_Output (self, other,"Info_Nefarius_WoSaturas_04_01"); //Projdi tou velkou kulatou branou. Tam ho najdeš.
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
	description =	"Chtìl bych se stát mágem Kruhu vody.";
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
	AI_Output (other, self,"Info_Nefarius_WannaMage_15_00"); //Chtìl bych se stát mágem Kruhu vody.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_01"); //(smích) Ne tak rychle, chlapèe!
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_02"); //Než mezi sebe vezmeme nìjakého mladíka, musí vykonat nìco velkého.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_03"); //A nìjaký èas nám musí sloužit.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_04"); //Pokud to myslíš vážnì, mìl by ses pøidat k žoldákùm. U nich nám mùžeš sloužit.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_05"); //A jednoho dne možná dostaneš možnost vykonat nìco velkého.
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
	description =	"Jsem pøipraven na vstup do Kruhu vody?";
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
	AI_Output (other, self,"Info_Nefarius_NowReady_15_00"); //Jsem pøipraven na vstup do Kruhu vody?
	
	if (Npc_GetTrueGuild (hero) != GIL_SLD) 
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_01"); //Staò se jedním z našich žoldákù, pak se uvidí...
	}
	else
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_02"); //Vím, stal ses jedním z našich žoldákù. Velmi dobøe, velmi dobøe...
		AI_Output (self, other,"Info_Nefarius_NowReady_04_03"); //Èas dokoná zbytek...
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
	AI_Output (self, other,"Info_Nefarius_OCNews_04_00"); //Jsou nìjaké noviny u našich pøátel ze Starého tábora?
	AI_Output (other, self,"Info_Nefarius_OCNews_15_01"); //Gomez zabil všechny mágy Ohnì!
	AI_Output (self, other,"Info_Nefarius_OCNews_04_02"); //Ne! Ten grázl! Varoval jsem Corrista - nikdy se mu nedalo vìøit! Musíš o tom øíci Saturasovi!
	if (Npc_GetTrueGuild(hero)==GIL_SLD)
	{
		AI_Output (self, other,"Info_Nefarius_OCNews_04_03"); //Poèkej!
		AI_Output (self, other,"Info_Nefarius_OCNews_04_04"); //Èelil jsi za nás velkému nebezpeèí.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_05"); //Myslím, že jsi už hoden obléknout roucho mága Vody.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_06"); //Teï ale promluv se Saturasem. Pospìš si!
	};
	AI_StopProcessInfos	(self);
};
