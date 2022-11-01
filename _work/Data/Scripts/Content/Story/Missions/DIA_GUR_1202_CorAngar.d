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
	description = "Możesz mnie czegoś nauczyć?";
};                       

FUNC int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

FUNC VOID DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //Możesz mnie czegoś nauczyć?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Chcesz zostać silnym wojownikiem, więc szukasz mistrza, który wskaże ci drogę.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //To chwalebne, ale ja nie mogę ci pomóc.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //Poświęcam mój czas tylko członkom Wielkiego Kręgu Straży Świątynnej.
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
	description = "Co mam zrobić, żeby zostać Świątynnym Strażnikiem?";
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
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //Co mam zrobić, żeby zostać Świątynnym Strażnikiem?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //Najpierw musisz odsłużyć swoje jako Nowicjusz, dopóki nie przekonamy się, że jesteś oddanym sługą Śniącego.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //Dopiero wtedy możesz do mnie wrócić, a ja udzielę ci lekcji.
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
	description = "Pokażesz mi, jak poprawić moją siłę i zręczność?";
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
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //Pokażesz mi, jak poprawić moją siłę i zręczność?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Siła i zręczność to cechy wielkiego wojownika.
	
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
	description		= "Chcę zostać Świątynnym Strażnikiem!"; 
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
	AI_Output			(other, self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //Chcę zostać Świątynnym Strażnikiem!
	
	if	(hero.level < 10)
	{ 
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //Nie jesteś jeszcze gotowy. Możesz do nas dołączyć, kiedy zdobędziesz nieco więcej doświadczenia.
	    GUR_1202_CorAngar_WANNABETPL.permanent = 1;
    }
    else if	(hero.level >= 10)
    {
	    AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //Nadszedł dzień, w którym dane ci będzie do nas dołączyć.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Pamiętaj, że Świątynny Strażnik to coś więcej niż wojownik strzegący obozu Bractwa. Jesteśmy wybranymi strażnikami wyznawców Śniącego. Bronimy duchowej aury tego miejsca.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //Wykorzystujemy zarówno naszą siłę fizyczną jak i duchową. Prawdziwym Strażnikiem Świątynnym może zostać tylko ten, którego ciało i duch funkcjonują w idealnej harmonii.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //Cieszę się, że udało ci się osiągnąć tak wiele w tak krótkim czasie.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Pamiętaj: Duchowa koncentracja i zdrowe ciało sprostają każdemu wyzwaniu.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //Idź teraz do Gor Na Totha. Znajdziesz go na placu treningowym. On da ci nowy pancerz.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero, GIL_TPL);
		hero.guild = GIL_TPL;

		Log_CreateTopic	(GE_BecomeTemplar,	LOG_NOTE);
		B_LogEntry		(GE_BecomeTemplar,"Dziś Cor Angar przyjął mnie w poczet Straży Świątynnej. Gor Na Toth ma mi wręczyć moją nową zbroję. Znajdę go przy placu treningowym.");
		Log_CreateTopic	(GE_TeacherPSI,		LOG_NOTE);
		B_LogEntry		(GE_TeacherPSI,"Cor Angar pomoże mi rozwinąć moją siłę, zręczność i walkę dwuręcznym orężem - to ostatnie dopiero, gdy nauczę się posługiwać bronią jednoręczną. Zwykle przebywa na placu treningowym Świątynnej Straży, na górnym poziomie obozu.");
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
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01"); //Chciałbym potrafić posługiwać się dwuręcznym mieczem.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02"); //Walka dwuręcznym orężem stanowi poważne wyzwanie dla twojej siły i zręczności.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03"); //Aby móc sprawnie posługiwać się dwuręczna bronią musisz nie tylko rozwijać swoje ciało, ale również i umysł.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04"); //Tylko pełna kontrola nad ciałem i umysłem pozwoli ci rozwijać swoje umiejętności.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05"); //Koncentracja to podstawa. To ona jednoczy ciało i umysł.

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
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");		//Chciałbym dowiedzieć się czegoś więcej o walce dwuręcznym orężem.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02"); //Wiesz już jak zmusić ostrze swego miecza do tańca śmierci. Teraz pokażę ci jak wykorzystać twoje umiejętności w walce.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03"); //Oczyma duszy spróbuj przewidzieć następny ruch twojego przeciwnika.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04"); //Poznanie sposobu walki nieprzyjaciela to już połowa sukcesu.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05"); //Bądź szybki, twoja ruchliwość i płynność twoich ruchów powinny iść w parze z siłą i precyzją twoich ciosów.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06"); //Naucz się ignorować ból. To twoja siła ducha zadecyduje o ostatecznym wyniku starcia.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07"); //Zachowaj spokój. Zachowanie czystości umysłu i niezachwianej koncentracji przypieczętuje twoje zwycięstwo.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08"); //Rozsądnie wykorzystuj swoje umiejętności, i pamiętaj: kto prowokuje walkę - ginie w walce. 

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
	description		= "Co się stanie teraz?"; 
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
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //Co się stanie teraz?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //Wizja była bardzo mglista. Zamiast odpowiedzi dała nam jeszcze więcej pytań.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //Ale jedna rzecz nie ulega wątpliwości: widziałem Orka w jaskini. W pobliżu znajduje się opuszczone miejsce orkowego kultu.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //Orkowie chowali tam swoich zmarłych, dlatego nazywamy ten labirynt jaskiń Cmentarzyskiem Orków.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //Nasz Guru, Baal Lukor udał się tam z oddziałem Strażników Świątynnych. Może znajdą coś, co pozwoli nam wyjaśnić znaczenie wizji.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //Przydałby mi się ktoś, kto rozejrzy się tam trochę i zda mi raport z sytuacji.
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //Dlaczego nie pójdziesz tam sam? W końcu jesteś przywódcą Straży Świątynnej!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //Moim zadaniem jest ochrona Jaśnie Oświeconego. Muszę zostać na miejscu, żeby strzec Y'Beriona.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //Oddałeś Obozowi nieocenione usługi. Tylko na tobie mogę polegać.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //Proszę, udaj się na Cmentarzysko Orków i dostarcz mi informacji na temat odkryć poczynionych przez Strażników.
	
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"A co dostanę w zamian?",	GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Natychmiast ruszę w drogę!",	GUR_1202_CorAngar_SENDS_KNOW);
};  
func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //A co dostanę w zamian?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //Chcesz rudy? Chyba jednak źle cię oceniłem. Ale potrzebuję twojej pomocy. Proszę, oto 100 bryłek rudy. Więcej ode mnie nie dostaniesz!
	CreateInvItems		(self,ItMiNugget,100);
	B_GiveInvItems      (self, hero, ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //Natychmiast ruszę w drogę!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Zanim pójdziesz, weź ten pierścień. Niech cię chroni w walce.
	
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
	description		= "Gdzie jest to Cmentarzysko Orków?"; 
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
	AI_Output			(other, self,"GUR_1202_CorAngar_WHERE_Info_15_01"); //Gdzie jest to Cmentarzysko Orków?
	AI_Output			(self, other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //Niedaleko stąd. Nowicjusz Talas wskaże ci drogę. Znajdziesz go na świątynnym dziedzińcu. On będzie twoim przewodnikiem.

	B_LogEntry		(CH3_OrcGraveyard,"Nowicjusz Talas wskaże mi drogę do cmentarzyska orków. Czeka na mnie na świątynnym dziedzińcu.");
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
	description		= "Byłem na Cmentarzysku Orków."; 
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
	
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //Byłem na Cmentarzysku Orków. Tam NIC NIE MA. Ani Śniącego, ani znaku... Nic!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //A co z Baalem Lukorem i Strażnikami?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //Wszyscy zginęli.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //Zginęli? Ale dlaczego, co się stało?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //W jaskiniach aż roiło się od Orków. Wybili Straż Świątynną do nogi.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Tylko ja i Baal Lukor wyszliśmy z tego cało, ale nagle Baal postradał zmysły.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //Wrzeszczał, że Śniący kazał mu mnie zabić i zamierzał wykonać to polecenie.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //Najwyraźniej nie mógł się pogodzić z niepowodzeniem swojej misji.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //Nie wierzę, żeby błogosławiony wpływ Śniącego mógł go popchnąć do tak brutalnego działania.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //To nie może... Nie może... NIEWAŻNE!!!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //Najważniejsze, że zamiar Baala Lukora się nie powiódł.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Teraz naszą jedyną nadzieją jest Y'Berion.
	 

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
	description = "Co słychać u Jaśnie Oświeconego?";
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
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //Co słychać u Jaśnie Oświeconego?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //Nie budzi się. I z godziny na godzinę jest co raz słabszy. Wiem, jak można go zbudzić, ale potrzebuję twojej pomocy.
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //Co mam zrobić?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //Przynieś mi pięć najmocniejszych ziół uzdrawiających jakie można znaleźć na bagnach!
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //Spiesz się!
	AI_StopProcessInfos	(self);
	CorAngar_FindHerb = LOG_RUNNING;
	
	Log_CreateTopic		(CH3_FindHerbs,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_RUNNING);
	B_LogEntry		(CH3_FindHerbs,"Y'Berion nadal nie odzyskał przytomności. Cor Angar nakazał mi znaleźć pięć leczniczych ziół o silnym działaniu.");
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
	description = "Gdzie mogę znaleźć te zioła?";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_WHERE_15_01"); //Gdzie mogę znaleźć te zioła?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Poszukaj na bagnach za Obozem. Musisz się zapuścić dość daleko, więc uważaj na błotne węże!
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_03"); //I nie trać ani chwili. Idź już!
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,"Potrzebne Angarowi zioła rosną daleko na bagnach, za obozem Bractwa. Muszę mieć oczy szeroko otwarte - tamta okolica roi się od błotnych węży.");
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
	description = "Jak rozpoznam te zioła?";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_LOOK_15_01"); //Jak rozpoznam te zioła?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_02"); //Przypominają gwiazdę z ośmioma zielonymi i pomarańczowymi liśćmi.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_03"); //Ruszaj w drogę.
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,"Lecznicze zioła przypominają gwiazdy. Mają cztery zielone i cztery pomarańczowe liście.");
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
	description = "Nie znalazłem jeszcze potrzebnej ilości ziół.";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Running_15_01");//Nie znalazłem jeszcze potrzebnej ilości ziół.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_02");//Może Fortuno, handlarz ziołami, ma trochę w swoich zapasach.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_03");//Pospiesz się. Potrzebuję pięciu ziół. Y'Berionowi nie zostało już zbyt wiele czasu.
	AI_StopProcessInfos	(self);

	//-------- Fortuno die Kräuter "unterschieben" --------
	if	!Fortuno_HasYBerionHerbs
	{
		var C_NPC	fortuno;
		fortuno = Hlp_GetNpc(Nov_1357_Fortuno);
		CreateInvItems		(fortuno,	ItFo_Plants_Herb_03,	5);	

		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry		(CH3_FindHerbs,"Fortuno, handlarz zielem, może mieć takie zioła na składzie.");
	};
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_CorAngar_FindHerb_Success (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Success_Condition;
	information	= Info_CorAngar_FindHerb_Success_Info;
	permanent	= 0;
	description	= "Mam już wszystkie uzdrawiające zioła dla Y'Beriona.";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_01"); //Mam już wszystkie uzdrawiające zioła dla Y'Beriona.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_02"); //Dobra robota. Y'Berion zbudził się na chwilę tuż przed twoim przybyciem.
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_03"); //Powiedział coś?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_04"); //Tak. Powiedział, że Śniący nie jest tym, za co go uważamy. Pod żadnym pozorem nie wolno nam go zbudzić. 
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_05"); //Pozostaje nam tylko mieć nadzieję, że dla biednego Y'Beriona nie jest jeszcze za późno.
	Yberion_dead = LOG_RUNNING;

	B_GiveInvItems	(other, self, ItFo_Plants_Herb_03, 5 );
	Npc_RemoveInvItems(self, ItFo_Plants_Herb_03, 5 );
	B_GiveXP  			(XP_FindHerbs);

	CorAngar_FindHerb = LOG_SUCCESS;
	
	B_LogEntry		(CH3_FindHerbs,"Dałem Cor Angarowi odpowiednie zioła. Miejmy tylko nadzieję, że nie jest jeszcze za późno...");
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
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Y'BERION NIE ŻYJE. Nasz duchowy przywódca odszedł w zaświaty!
	AI_TurnToNpc		(self, other);
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //Nawet twoja błyskawiczna pomoc nie mogła zapobiec jego śmierci.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //I co teraz będzie?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //Zawsze ufałem Y'Berionowi. Tuż przed śmiercią kazał nam upatrywać nadziei ocalenia w planie ucieczki opracowanym przez Magów Wody.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Dlatego powinniśmy wesprzeć Magów Wody w ich dążeniach.
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //Przyda się im kamień ogniskujący i almanach. Ale te są wciąż w rękach Cor Kaloma.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //A gdzie jest Cor Kalom?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //W gniewie zebrał oddział Strażników Świątynnych i wyruszył na poszukiwanie Śniącego.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Niech to szlag! I jak teraz odzyskamy kamień ogniskujący?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //Zdaję się, że kamień i księga są wciąż w jego laboratorium. Masz tu klucz do skrzyni.

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
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); //Jeszcze coś!
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_02"); //Tak?
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); //Weź tę magiczną runę jako symbol naszej wdzięczności za twoje dokonania.
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_04"); //Pozwoli ci ona w dogodnej chwili przeteleportować się na świątynny dziedziniec.
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); //Dziękuję!

	//-------- Spieler wird losgeschickt --------
	B_Story_SentToNC	();
};
 
