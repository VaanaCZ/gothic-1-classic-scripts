//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################

// ************************ EXIT **************************

instance DIA_GUR_1202_CorAngar_Exit (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 999;
	condition	= DIA_GUR_1202_CorAngar_Exit_Condition;
	information	= DIA_GUR_1202_CorAngar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_GUR_1202_CorAngar_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GUR_1202_CorAngar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************	
//		Später Trainer 
// ************************

instance DIA_CorAngar_LaterTrainer (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_LaterTrainer_Condition;
	information	= DIA_CorAngar_LaterTrainer_Info;
	permanent	= 0;
	description = "Budeš mě cvičit?";
};                       

FUNC int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

FUNC VOID DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //Budeš mě cvičit?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Chceš se stát silným bojovníkem, takže hledáš někoho, kdo tě bude cvičit.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //To je chvályhodné. Já ale nejsem ten, koho potřebuješ.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //Svůj čas věnuji jen příslušníkům Svatého templářského kruhu.
};

// ************************	
//		Wie Templer
// ************************

instance DIA_CorAngar_WieTempler (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_WieTempler_Condition;
	information	= DIA_CorAngar_WieTempler_Info;
	permanent	= 1;
	description = "Jak se můžu stát templářem?";
};                       

FUNC int DIA_CorAngar_WieTempler_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && (Npc_GetTrueGuild(other) != GIL_TPL) )
	{
		return 1;
	};
};

FUNC VOID DIA_CorAngar_WieTempler_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //Jak se můžu stát templářem?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //Zaprvé, musíš sloužit jako novic do té doby, než dokážeš, že upřímně věříš ve Spáče.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //Pak se ke mně vrátíš a já ti dám pokyny.
	AI_StopProcessInfos	( self );
};

/////////////////////////////////
/////////////////////////////////
//////// Kapitel 2 //////////////
/////////////////////////////////
/////////////////////////////////

//-------------------------------------------------------------------------
//							STÄRKE UND DEX STEIGERN
//-------------------------------------------------------------------------
INSTANCE GUR_1202_CorAngar_Teach(C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 10;
	condition	= GUR_1202_CorAngar_Teach_Condition;
	information	= GUR_1202_CorAngar_Teach_Info;
	permanent	= 1;
	description = "Můžeš cvičit mojí sílu a obratnost?";
};                       

FUNC INT GUR_1202_CorAngar_Teach_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};
};

FUNC VOID GUR_1202_CorAngar_Teach_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //Můžeš cvičit mojí sílu a obratnost?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Každý bojovník musí být silný a obratný.
	
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_BACK()
{
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
};

func void GUR_1202_CorAngar_Teach_STR_1()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_STR_5()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_1()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_5()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

//--------------------------------------------------------------
// TEMPLER WERDEN
//--------------------------------------------------------------
instance  GUR_1202_CorAngar_WANNABETPL (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WANNABETPL_Condition;
	information		= GUR_1202_CorAngar_WANNABETPL_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chci se stát templářem!"; 
};

FUNC int  GUR_1202_CorAngar_WANNABETPL_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	&& (Npc_GetTrueGuild (hero) == GIL_NOV)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_WANNABETPL_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //Chci se stát templářem!
	
	if	(hero.level < 10)
	{ 
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //Nejsi ještě připraven. Můžeš se k nám připojit, jakmile získáš víc zkušeností.
	    GUR_1202_CorAngar_WANNABETPL.permanent = 1;
    }
    else if	(hero.level >= 10)
    {
	    AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //Nadešel čas, aby ses k nám přidal.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Pamatuj, že templář není jen dobrým bojovníkem a strážcem tábora. Jsme vyvolení strážci Spáče. Strážci ducha.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //Používáme jak fyzickou, tak duchovní sílu. Jen ti, jejichž těla i duše splývají v jednotě, jsou praví templáři.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //Jsem opravdu potěšen, že jsi došel tak daleko v tak krátké době. Nyní jsi připraven se k nám přidat.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Zapamatuj si: soustředěná duše a trénované tělo odolají každé hrozbě.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //Teď jdi na cvičiště za Gorem Na Tothem. Dá ti novou zbroj.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero, GIL_TPL);
		hero.guild = GIL_TPL;

		Log_CreateTopic	(GE_BecomeTemplar,	LOG_NOTE);
		B_LogEntry		(GE_BecomeTemplar,"Dnes mě Cor Kalom pasoval na templáře. Gor Na Toth mi předá moji novou zbroj. Obvykle bývá na cvičišti.");
		Log_CreateTopic	(GE_TeacherPSI,		LOG_NOTE);
		B_LogEntry		(GE_TeacherPSI,"Cor Angar cvičí SÍLU, OBRATNOST a boj s OBOURUČNÍMI ZBRANĚMI. Bude mě učit až tehdy, když se stanu mistrem boje s JEDNORUČNÍMI ZBRANĚMI. Obvykle bývá na cvičišti v druhé úrovni můstků.");
	};

};

//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND1 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND1_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1,	LPCOST_TALENT_2H_1,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTrueGuild    (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND1_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01"); //Chci se naučit zacházet s obouručním mečem.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02"); //Boj s obouručním mečem vyžaduje určitou sílu a obratnost.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03"); //Abys dokázal zacházet s obouručním mečem, musíš být nejen pánem svého těla, ale zrovna tak své mysli.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04"); //Jedině když se staneš pánem svého těla i mysli zároveň, můžeš se naučit umění boje.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05"); //Klíčem úspěchu je soustředění. Soustředěná jednota těla a mysli.

		GUR_1202_CorAngar_ZWEIHAND1.permanent		= 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND2 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND2_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2,	LPCOST_TALENT_2H_2,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND2_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");		//Chci se naučit víc o boji s obouručními zbraněmi.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02"); //Teď ovládáš tanec s ostřím. Naučím tě, jak se stát mistrem v boji.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03"); //Použij duchovní sílu k tomu, abys vyčetl protivníkův pohyb, ještě než zaútočí.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04"); //Znalost protivníkovy taktiky boje je poloviční vítězství.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05"); //Buď rychlý, tvoje útoky musí být překvapující a plynulé, údery přesné a tvrdé.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06"); //Nauč se nevnímat bolest. Výsledek zápasu vždy nakonec rozhodne síla tvojí vůle.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07"); //Zůstaň klidný. Přežiješ jen tehdy, když se pustíš do boje s klidem a soustředěním.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08"); //Využívej své umění obezřetně. A zapamatuj si: vyprovokovat boj znamená totéž, co v něm zemřít.

		GUR_1202_CorAngar_ZWEIHAND2.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  

  
  
  
  
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################
 
// **************************************************************************
// 				nach der großen Beschwörung
// **************************************************************************
instance  GUR_1202_CorAngar_SENDS (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_SENDS_Condition;
	information		= GUR_1202_CorAngar_SENDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak to dopadlo?"; 
};

FUNC int  GUR_1202_CorAngar_SENDS_Condition()
{	
	if	(Kapitel == 3)
	&&	(CorAngar_GotoOGY == FALSE)
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_SENDS_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //Jak to dopadlo?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //Vidina byla příliš nejasná. Přinesla nám víc hádanek než odpovědí.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //Jedna věc je však docela jasná: viděl jsem jednoho skřeta v jeskyni. Nedaleko je jedna stará opuštěná jeskyně skřetů, kterou  používali pro bohoslužby.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //Skřeti tam pohřbívali své mrtvé, proto tomu systému jeskyní říkáme Skřetí hřbitov.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //Guru Baal Lukor tam odešel s několika templáři. Možná tam najdeme něco, co by nám pomohlo porozumět té vidině.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //Potřebuji, aby se tam někdo porozhlédl a dal mi zprávu o stavu věcí.
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //Proč tam nejdeš sám? Jsi přece vůdce templářů!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //Můj úkol je chránit Osvíceného. Musím tu zůstat s Y´Berionem a střežit ho.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //Odvedl jsi táboru dobré služby. Věřím ti víc než komukoliv jinému odtud.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //Chci tě požádat, abys šel do Skřetího hřbitova a podal mi zprávu, co tam templáři našli.
	
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Co dostanu za odměnu?",	GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Ihned se vydám na cestu!",	GUR_1202_CorAngar_SENDS_KNOW);
};  
func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //Co dostanu za odměnu?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //Chceš rudu? Vidím, že jsem se v tobě zmýlil. Ale potřebuju tě. Tady je 100 nugetů. Víc už nedostaneš!
	CreateInvItems		(self,ItMiNugget,100);
	B_GiveInvItems      (self, hero, ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //Ihned se vydám na cestu!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Ještě než odejdeš, vem si tenhle prsten. Ať tě ochrání v boji!
	
	B_Story_GotoOrcGraveyard();

	CreateInvItem		(self, Schutzring_Geschosse1);
	B_GiveInvItems      (self, hero, Schutzring_Geschosse1, 1);
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
};
	
instance  GUR_1202_CorAngar_WHERE (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WHERE_Condition;
	information		= GUR_1202_CorAngar_WHERE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Kde je Skřetí hřbitov?"; 
};

FUNC int  GUR_1202_CorAngar_WHERE_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_SENDS) )
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_WHERE_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WHERE_Info_15_01"); //Kde je Skřetí hřbitov?
	AI_Output			(self, other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //Nedaleko odtud. Novic Talas zná cestu. Najdeš ho na dvoře u chrámu. Dovede tě tam.

	B_LogEntry		(CH3_OrcGraveyard,"Novic Talas mi ukáže cestu k skřetímu hřbitovu. Počká na mě na nádvoří chrámu.");
};  

// **************************************************************************
// 				nach dem Ork-Friedhof
// **************************************************************************
instance  GUR_1202_CorAngar_AFTER (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_AFTER_Condition;
	information		= GUR_1202_CorAngar_AFTER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Byl jsem na Skřetím hřbitově. Není TAM NIC. Žádný Spáč, žádné znamení, prostě nic."; 
};

FUNC int  GUR_1202_CorAngar_AFTER_Condition()
{
	  
	if   ( BaalLukor_BringParchment == 4 ) 
	{
		return	1;
	};
};

FUNC void  GUR_1202_CorAngar_AFTER_Info()
{
	
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //Byl jsem na Skřetím hřbitově. Není TAM NIC. Žádný Spáč, žádné znamení, prostě nic.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //A co Baal Lukor a templáři?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //Jsou mrtví.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //Mrtví? Ale proč? Jak se to stalo?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //Celý jeskynní systém se hemží skřety. Zabili všechny templáře.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Baal Lukor a já jsme přežili, ale Lukor znenadání zešílel.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //Vykřikoval, že mu Spáč nařídil, aby mě zabil, a chystal se svůj rozkaz splnit.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //Vypadalo to, že se nemůže smířit s tím, že nic nenašel.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //Nemůžu uvěřit, že by Spáčův vliv mohl vést k takovýmhle násilným činům.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //To nemůže být... nemůže být... JEN TAK!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //Nejdůležitější ale je, že se to Baalu Lukorovi v jeho šílenství nepodařilo.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Y´Berion je teď naše jediná naděje.
	 

	B_GiveXP			(XP_ReportToCorAngar);
	B_Story_BackFromOrcGraveyard();
};  
	
// **************************************************************************
// 				MISSION: Find Herb
// **************************************************************************
INSTANCE Info_CorAngar_FindHerb (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Condition;
	information	= Info_CorAngar_FindHerb_Info;
	permanent	= 0;
	important 	= 0;
	description = "Co je s Y´Berionem?";
};

func INT Info_CorAngar_FindHerb_Condition()
{
	  
	if   ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_AFTER) )
	{
		return	1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Info()
{
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //Co je s Y´Berionem?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //Nedokáže se sám probudit. Je stále slabší a slabší. Vím, jak ho probudit, ale potřebuji tvou pomoc.
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //Co mám udělat?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //Přines mi z bažin léčivé byliny. Pět nejsilnějších druhů by mělo stačit!
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //Prosím rychle!
	AI_StopProcessInfos	(self);
	CorAngar_FindHerb = LOG_RUNNING;
	
	Log_CreateTopic		(CH3_FindHerbs,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_RUNNING);
	B_LogEntry		(CH3_FindHerbs,"Y´Berion je stále v bezvědomí. Cor Angar mě požádal, abych nasbíral pět nejsilnějších léčivých bylin.");
};

// ---------------------------- FindHerb - WHERE ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_WHERE (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_WHERE_Condition;
	information	= Info_CorAngar_FindHerb_WHERE_Info;
	permanent	= 0;
	important	= 0; 
	description = "Kde najdu ty byliny?";
};                       

FUNC INT Info_CorAngar_FindHerb_WHERE_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_WHERE_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_WHERE_15_01"); //Kde najdu ty byliny?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Hledej je v bažinách za táborem. Musíš pro ně jít hluboko do močálu, ale dávej pozor, ať tě nedostanou močáloví žraloci.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_03"); //A teď už mě nezdržuj. Běž!
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,"Léčivé byliny na lék pro Y´Beriona rostou hluboko v bažinách za táborem Bratrstva. Jsou tam také nebezpeční močáloví žraloci. Musím mít oči na stopkách.");
};

// ---------------------------- FindHerb - LOOK ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_LOOK (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_LOOK_Condition;
	information	= Info_CorAngar_FindHerb_LOOK_Info;
	permanent	= 0;
	important	= 0; 
	description = "Jak ty byliny poznám?";
};                       

FUNC INT Info_CorAngar_FindHerb_LOOK_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_LOOK_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_LOOK_15_01"); //Jak ty byliny poznám?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_02"); //Vypadají jako hvězdy s osmi zelenými a oranžovými cípy.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_03"); //A teď se vydej na cestu.
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,"Léčivé byliny vypadají jako hvězdice s čtyřmi zelenými a čtyřmi oranžovými okvětními lístky.");
};



// ---------------------------- RUNNING ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_Running (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_Running_Condition;
	information	= Info_CorAngar_FindHerb_Running_Info;
	permanent	= 1;
	important	= 0; 
	description = "Ještě jsem nenašel léčivých bylin dost.";
};                       

FUNC INT Info_CorAngar_FindHerb_Running_Condition()
{
	if	(CorAngar_FindHerb==LOG_RUNNING)
	&&	(Npc_HasItems(other,ItFo_Plants_Herb_03)<5)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_WHERE)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_LOOK)
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Running_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Running_15_01");//Ještě jsem nenašel léčivých bylin dost.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_02");//Možná má nějaké na skladě Fortuno, obchodník bylinami.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_03");//Pospěš. Potřebuji jich pět. Y´Berion ztratil příliš času.
	AI_StopProcessInfos	(self);

	//-------- Fortuno die Kräuter "unterschieben" --------
	if	!Fortuno_HasYBerionHerbs
	{
		var C_NPC	fortuno;
		fortuno = Hlp_GetNpc(Nov_1357_Fortuno);
		CreateInvItems		(fortuno,	ItFo_Plants_Herb_03,	5);	

		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry		(CH3_FindHerbs,"Fortuno, obchodník s bylinkami z Bratrstva, by takové byliny mohl mít.");
	};
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_CorAngar_FindHerb_Success (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Success_Condition;
	information	= Info_CorAngar_FindHerb_Success_Info;
	permanent	= 0;
	description	= "Mám léčivé byliny pro Y´Beriona.";
};                       

FUNC INT Info_CorAngar_FindHerb_Success_Condition()
{
	if ( Npc_HasItems ( other, ItFo_Plants_Herb_03 ) >= 5 ) && ( CorAngar_FindHerb == LOG_RUNNING )
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_FindHerb_Success_Info()
{	
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_01"); //Mám léčivé byliny pro Y´Beriona.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_02"); //Výborně. Zatímco jsi byl pryč, Y´Berion na chvilku procitl.
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_03"); //Říkal něco?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_04"); //Ano, říkal, že Spáč není to, co si myslíme. Nesmíme se ho znovu pokoušet probudit.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_05"); //Vše, co teď můžeme dělat, je doufat, že pro Y´Beriona není ještě moc pozdě.
	Yberion_dead = LOG_RUNNING;

	B_GiveInvItems	(other, self, ItFo_Plants_Herb_03, 5 );
	Npc_RemoveInvItems(self, ItFo_Plants_Herb_03, 5 );
	B_GiveXP  			(XP_FindHerbs);

	CorAngar_FindHerb = LOG_SUCCESS;
	
	B_LogEntry		(CH3_FindHerbs,"Dodal jsem Coru Angarovi dostatek léčivých bylin. Teď můžeme jen doufat, že nebylo příliš pozdě.");
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_SUCCESS);

	//-------- Versuch YBerion zu heilen... --------
	var C_NPC YBerion; 	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	AI_Wait				(self,	1);
	AI_GotoNpc			(self,	YBerion);
	AI_TurnToNpc		(self,	YBerion);
	AI_PlayAni			(self,	"T_PLUNDER");
	AI_WaitTillEnd		(self,	YBerion);
	//YBerion.attribute[ATR_HITPOINTS] = 0;
	//AI_StartState		(YBerion,	ZS_Dead,	0,	"");

	//-------- ...scheitert. YBerion ist tot --------
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Y´BERION JE MRTEV. Náš duchovní vůdce nás opustil.
	AI_TurnToNpc		(self, other);
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //Ani tvoje rychlá pomoc ho nestačila zachránit.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //A co teď, Cor Angare?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //Vždycky jsem Y´Berionovi věřil. Krátce před svou smrtí upínal všechny své naděje na plán útěku mágů Vody.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Pak bychom měli mágům Vody s jejich plánem pomoci.
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //Potřebují ohnisko a almanach. Obě věci jsou stále majetkem Cora Kaloma.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //Kde je Cor Kalom?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //V hněvu se vydal s několika templáři svou vlastní cestou ke Spáčovi.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Sakra, jak teď to ohnisko dostaneme?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //Doufám, že to ohnisko i almanach nechal ve své dílně. Tady je klíč k té truhle.

	CreateInvItem		(self,			ITKE_PSI_KALOM_01); 
	B_GiveInvItems		(self,	other,	ITKE_PSI_KALOM_01,	1);
};
 
// ------------------------------ TELEPORT ----------------------------------
INSTANCE Info_CorAngar_TELEPORT (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_TELEPORT_Condition;
	information	= Info_CorAngar_TELEPORT_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_CorAngar_TELEPORT_Condition()
{
	if	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success)
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_TELEPORT_Info()
{	
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); //Ještě moment!
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_02"); //Ano?
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); //Vem si tuhle magickou runu jako vyjádření našeho vděku za tvoje velké činy.
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_04"); //Pomůže ti snadno a rychle se přenést do chrámového dvora, kdykoliv to budeš potřebovat.
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); //Děkuju!

	//-------- Spieler wird losgeschickt --------
	B_Story_SentToNC	();
};
 
