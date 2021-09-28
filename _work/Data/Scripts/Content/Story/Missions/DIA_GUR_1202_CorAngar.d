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
	description = "Mo¿esz mnie czegoœ nauczyæ?";
};                       

FUNC int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

FUNC VOID DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Chcesz zostaæ silnym wojownikiem, wiêc szukasz mistrza, który wska¿e ci drogê.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //To chwalebne, ale ja nie mogê ci pomóc.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //Poœwiêcam mój czas tylko cz³onkom Wielkiego Krêgu Stra¿y Œwi¹tynnej.
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
	description = "Co mam zrobiæ, ¿eby zostaæ Œwi¹tynnym Stra¿nikiem?";
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
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //Co mam zrobiæ, ¿eby zostaæ Œwi¹tynnym Stra¿nikiem?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //Najpierw musisz ods³u¿yæ swoje jako Nowicjusz, dopóki nie przekonamy siê, ¿e jesteœ oddanym s³ug¹ Œni¹cego.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //Dopiero wtedy mo¿esz do mnie wróciæ, a ja udzielê ci lekcji.
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
	description = "Poka¿esz mi, jak poprawiæ moj¹ si³ê i zrêcznoœæ?";
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
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //Poka¿esz mi, jak poprawiæ moj¹ si³ê i zrêcznoœæ?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Si³a i zrêcznoœæ to cechy wielkiego wojownika.
	
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
	description		= "Chcê zostaæ Œwi¹tynnym Stra¿nikiem!"; 
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
	AI_Output			(other, self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //Chcê zostaæ Œwi¹tynnym Stra¿nikiem!
	
	if	(hero.level < 10)
	{ 
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //Nie jesteœ jeszcze gotowy. Mo¿esz do nas do³¹czyæ, kiedy zdobêdziesz nieco wiêcej doœwiadczenia.
	    GUR_1202_CorAngar_WANNABETPL.permanent = 1;
    }
    else if	(hero.level >= 10)
    {
	    AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //Nadszed³ dzieñ, w którym dane ci bêdzie do nas do³¹czyæ.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Pamiêtaj, ¿e Œwi¹tynny Stra¿nik to coœ wiêcej ni¿ wojownik strzeg¹cy obozu Bractwa. Jesteœmy wybranymi stra¿nikami wyznawców Œni¹cego. Bronimy duchowej aury tego miejsca.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //Wykorzystujemy zarówno nasz¹ si³ê fizyczn¹ jak i duchow¹. Prawdziwym Stra¿nikiem Œwi¹tynnym mo¿e zostaæ tylko ten, którego cia³o i duch funkcjonuj¹ w idealnej harmonii.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //Cieszê siê, ¿e uda³o ci siê osi¹gn¹æ tak wiele w tak krótkim czasie.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Pamiêtaj: Duchowa koncentracja i zdrowe cia³o sprostaj¹ ka¿demu wyzwaniu.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //IdŸ teraz do Gor Na Totha. Znajdziesz go na placu treningowym. On da ci nowy pancerz.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero, GIL_TPL);
		hero.guild = GIL_TPL;

		Log_CreateTopic	(GE_BecomeTemplar,	LOG_NOTE);
		B_LogEntry		(GE_BecomeTemplar,"Dziœ Cor Angar przyj¹³ mnie w poczet Stra¿y Œwi¹tynnej. Gor Na Toth ma mi wrêczyæ moj¹ now¹ zbrojê. Znajdê go przy placu treningowym.");
		Log_CreateTopic	(GE_TeacherPSI,		LOG_NOTE);
		B_LogEntry		(GE_TeacherPSI,"Cor Angar pomo¿e mi rozwin¹æ moj¹ si³ê, zrêcznoœæ i walkê dwurêcznym orê¿em - to ostatnie dopiero, gdy nauczê siê pos³ugiwaæ broni¹ jednorêczn¹. Zwykle przebywa na placu treningowym Œwi¹tynnej Stra¿y, na górnym poziomie obozu.");
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
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01"); //Chcia³bym potrafiæ pos³ugiwaæ siê dwurêcznym mieczem.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02"); //Walka dwurêcznym orê¿em stanowi powa¿ne wyzwanie dla twojej si³y i zrêcznoœci.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03"); //Aby móc sprawnie pos³ugiwaæ siê dwurêczna broni¹ musisz nie tylko rozwijaæ swoje cia³o, ale równie¿ i umys³.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04"); //Tylko pe³na kontrola nad cia³em i umys³em pozwoli ci rozwijaæ swoje umiejêtnoœci.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05"); //Koncentracja to podstawa. To ona jednoczy cia³o i umys³.

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
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");		//Chcia³bym dowiedzieæ siê czegoœ wiêcej o walce dwurêcznym orê¿em.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02"); //Wiesz ju¿ jak zmusiæ ostrze swego miecza do tañca œmierci. Teraz poka¿ê ci jak wykorzystaæ twoje umiejêtnoœci w walce.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03"); //Oczyma duszy spróbuj przewidzieæ nastêpny ruch twojego przeciwnika.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04"); //Poznanie sposobu walki nieprzyjaciela to ju¿ po³owa sukcesu.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05"); //B¹dŸ szybki, twoja ruchliwoœæ i p³ynnoœæ twoich ruchów powinny iœæ w parze z si³¹ i precyzj¹ twoich ciosów.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06"); //Naucz siê ignorowaæ ból. To twoja si³a ducha zadecyduje o ostatecznym wyniku starcia.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07"); //Zachowaj spokój. Zachowanie czystoœci umys³u i niezachwianej koncentracji przypieczêtuje twoje zwyciêstwo.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08"); //Rozs¹dnie wykorzystuj swoje umiejêtnoœci, i pamiêtaj: kto prowokuje walkê - ginie w walce. 

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
	description		= "Co siê stanie teraz?"; 
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
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //Co siê stanie teraz?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //Wizja by³a bardzo mglista. Zamiast odpowiedzi da³a nam jeszcze wiêcej pytañ.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //Ale jedna rzecz nie ulega w¹tpliwoœci: widzia³em Orka w jaskini. W pobli¿u znajduje siê opuszczone miejsce orkowego kultu.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //Orkowie chowali tam swoich zmar³ych, dlatego nazywamy ten labirynt jaskiñ Cmentarzyskiem Orków.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //Nasz Guru, Baal Lukor uda³ siê tam z oddzia³em Stra¿ników Œwi¹tynnych. Mo¿e znajd¹ coœ, co pozwoli nam wyjaœniæ znaczenie wizji.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //Przyda³by mi siê ktoœ, kto rozejrzy siê tam trochê i zda mi raport z sytuacji.
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //Dlaczego nie pójdziesz tam sam? W koñcu jesteœ przywódc¹ Stra¿y Œwi¹tynnej!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //Moim zadaniem jest ochrona Jaœnie Oœwieconego. Muszê zostaæ na miejscu, ¿eby strzec Y'Beriona.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //Odda³eœ Obozowi nieocenione us³ugi. Tylko na tobie mogê polegaæ.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //Proszê, udaj siê na Cmentarzysko Orków i dostarcz mi informacji na temat odkryæ poczynionych przez Stra¿ników.
	
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"A co dostanê w zamian?",	GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Natychmiast ruszê w drogê!",	GUR_1202_CorAngar_SENDS_KNOW);
};  
func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //A co dostanê w zamian?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //Chcesz rudy? Chyba jednak Ÿle ciê oceni³em. Ale potrzebujê twojej pomocy. Proszê, oto 100 bry³ek rudy. Wiêcej ode mnie nie dostaniesz!
	CreateInvItems		(self,ItMiNugget,100);
	B_GiveInvItems      (self, hero, ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //Natychmiast ruszê w drogê!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Zanim pójdziesz, weŸ ten pierœcieñ. Niech ciê chroni w walce.
	
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
	AI_Output			(self, other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //Niedaleko st¹d. Nowicjusz Talas wska¿e ci drogê. Znajdziesz go na œwi¹tynnym dziedziñcu. On bêdzie twoim przewodnikiem.

	B_LogEntry		(CH3_OrcGraveyard,"Nowicjusz Talas wska¿e mi drogê do cmentarzyska orków. Czeka na mnie na œwi¹tynnym dziedziñcu.");
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
	description		= "By³em na Cmentarzysku Orków."; 
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
	
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //By³em na Cmentarzysku Orków. Tam NIC NIE MA. Ani Œni¹cego, ani znaku... Nic!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //A co z Baalem Lukorem i Stra¿nikami?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //Wszyscy zginêli.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //Zginêli? Ale dlaczego, co siê sta³o?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //W jaskiniach a¿ roi³o siê od Orków. Wybili Stra¿ Œwi¹tynn¹ do nogi.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Tylko ja i Baal Lukor wyszliœmy z tego ca³o, ale nagle Baal postrada³ zmys³y.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //Wrzeszcza³, ¿e Œni¹cy kaza³ mu mnie zabiæ i zamierza³ wykonaæ to polecenie.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //NajwyraŸniej nie móg³ siê pogodziæ z niepowodzeniem swojej misji.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //Nie wierzê, ¿eby b³ogos³awiony wp³yw Œni¹cego móg³ go popchn¹æ do tak brutalnego dzia³ania.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //To nie mo¿e... Nie mo¿e... NIEWA¯NE!!!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //Najwa¿niejsze, ¿e zamiar Baala Lukora siê nie powiód³.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Teraz nasz¹ jedyn¹ nadziej¹ jest Y'Berion.
	 

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
	description = "Co s³ychaæ u Jaœnie Oœwieconego?";
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
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //Co s³ychaæ u Jaœnie Oœwieconego?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //Nie budzi siê. I z godziny na godzinê jest co raz s³abszy. Wiem, jak mo¿na go zbudziæ, ale potrzebujê twojej pomocy.
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //Co mam zrobiæ?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //Przynieœ mi piêæ najmocniejszych zió³ uzdrawiaj¹cych jakie mo¿na znaleŸæ na bagnach!
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //Spiesz siê!
	AI_StopProcessInfos	(self);
	CorAngar_FindHerb = LOG_RUNNING;
	
	Log_CreateTopic		(CH3_FindHerbs,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_RUNNING);
	B_LogEntry		(CH3_FindHerbs,"Y'Berion nadal nie odzyska³ przytomnoœci. Cor Angar nakaza³ mi znaleŸæ piêæ leczniczych zió³ o silnym dzia³aniu.");
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
	description = "Gdzie mogê znaleŸæ te zio³a?";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_WHERE_15_01"); //Gdzie mogê znaleŸæ te zio³a?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Poszukaj na bagnach za Obozem. Musisz siê zapuœciæ doœæ daleko, wiêc uwa¿aj na b³otne wê¿e!
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_03"); //I nie traæ ani chwili. IdŸ ju¿!
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,"Potrzebne Angarowi zio³a rosn¹ daleko na bagnach, za obozem Bractwa. Muszê mieæ oczy szeroko otwarte - tamta okolica roi siê od b³otnych wê¿y.");
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
	description = "Jak rozpoznam te zio³a?";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_LOOK_15_01"); //Jak rozpoznam te zio³a?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_02"); //Przypominaj¹ gwiazdê z oœmioma zielonymi i pomarañczowymi liœæmi.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_03"); //Ruszaj w drogê.
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,"Lecznicze zio³a przypominaj¹ gwiazdy. Maj¹ cztery zielone i cztery pomarañczowe liœcie.");
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
	description = "Nie znalaz³em jeszcze potrzebnej iloœci zió³.";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Running_15_01");//Nie znalaz³em jeszcze potrzebnej iloœci zió³.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_02");//Mo¿e Fortuno, handlarz zio³ami, ma trochê w swoich zapasach.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_03");//Pospiesz siê. Potrzebujê piêciu zió³. Y'Berionowi nie zosta³o ju¿ zbyt wiele czasu.
	AI_StopProcessInfos	(self);

	//-------- Fortuno die Kräuter "unterschieben" --------
	if	!Fortuno_HasYBerionHerbs
	{
		var C_NPC	fortuno;
		fortuno = Hlp_GetNpc(Nov_1357_Fortuno);
		CreateInvItems		(fortuno,	ItFo_Plants_Herb_03,	5);	

		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry		(CH3_FindHerbs,"Fortuno, handlarz zielem, mo¿e mieæ takie zio³a na sk³adzie.");
	};
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_CorAngar_FindHerb_Success (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Success_Condition;
	information	= Info_CorAngar_FindHerb_Success_Info;
	permanent	= 0;
	description	= "Mam ju¿ wszystkie uzdrawiaj¹ce zio³a dla Y'Beriona.";
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
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_01"); //Mam ju¿ wszystkie uzdrawiaj¹ce zio³a dla Y'Beriona.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_02"); //Dobra robota. Y'Berion zbudzi³ siê na chwilê tu¿ przed twoim przybyciem.
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_03"); //Powiedzia³ coœ?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_04"); //Tak. Powiedzia³, ¿e Œni¹cy nie jest tym, za co go uwa¿amy. Pod ¿adnym pozorem nie wolno nam go zbudziæ. 
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_05"); //Pozostaje nam tylko mieæ nadziejê, ¿e dla biednego Y'Beriona nie jest jeszcze za póŸno.
	Yberion_dead = LOG_RUNNING;

	B_GiveInvItems	(other, self, ItFo_Plants_Herb_03, 5 );
	Npc_RemoveInvItems(self, ItFo_Plants_Herb_03, 5 );
	B_GiveXP  			(XP_FindHerbs);

	CorAngar_FindHerb = LOG_SUCCESS;
	
	B_LogEntry		(CH3_FindHerbs,"Da³em Cor Angarowi odpowiednie zio³a. Miejmy tylko nadziejê, ¿e nie jest jeszcze za póŸno...");
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
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Y'BERION NIE ¯YJE. Nasz duchowy przywódca odszed³ w zaœwiaty!
	AI_TurnToNpc		(self, other);
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //Nawet twoja b³yskawiczna pomoc nie mog³a zapobiec jego œmierci.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //I co teraz bêdzie?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //Zawsze ufa³em Y'Berionowi. Tu¿ przed œmierci¹ kaza³ nam upatrywaæ nadziei ocalenia w planie ucieczki opracowanym przez Magów Wody.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Dlatego powinniœmy wesprzeæ Magów Wody w ich d¹¿eniach.
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //Przyda siê im kamieñ ogniskuj¹cy i almanach. Ale te s¹ wci¹¿ w rêkach Cor Kaloma.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //A gdzie jest Cor Kalom?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //W gniewie zebra³ oddzia³ Stra¿ników Œwi¹tynnych i wyruszy³ na poszukiwanie Œni¹cego.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Niech to szlag! I jak teraz odzyskamy kamieñ ogniskuj¹cy?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //Zdajê siê, ¿e kamieñ i ksiêga s¹ wci¹¿ w jego laboratorium. Masz tu klucz do skrzyni.

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
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); //Jeszcze coœ!
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_02"); //Tak?
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); //WeŸ tê magiczn¹ runê jako symbol naszej wdziêcznoœci za twoje dokonania.
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_04"); //Pozwoli ci ona w dogodnej chwili przeteleportowaæ siê na œwi¹tynny dziedziniec.
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); //Dziêkujê!

	//-------- Spieler wird losgeschickt --------
	B_Story_SentToNC	();
};
 
