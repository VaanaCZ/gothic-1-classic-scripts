// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Cavalorn_Exit (C_INFO)
{
	npc			= STT_336_Cavalorn;
	nr			= 999;
	condition	= DIA_Cavalorn_Exit_Condition;
	information	= DIA_Cavalorn_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cavalorn_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Cavalorn_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Jäger
// **************************************************

INSTANCE DIA_cavalorn_Hunter (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Hunter_Condition;
	information		= DIA_cavalorn_Hunter_Info;
	permanent		= 0;
	description		= "Co tu robisz?"; 
};

FUNC INT DIA_cavalorn_Hunter_Condition()
{	
	return 1;	
};

FUNC VOID DIA_cavalorn_Hunter_Info()
{
	AI_Output (other, self,"DIA_cavalorn_Hunter_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_cavalorn_Hunter_12_01"); //Jestem myœliwym. Polujê g³ównie na œcierwojady.
	
};

// **************************************************
// 						Lehrer
// **************************************************

INSTANCE DIA_cavalorn_Lehrer (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Lehrer_Condition;
	information		= DIA_cavalorn_Lehrer_Info;
	permanent		= 1;
	description		= "Mo¿esz mnie nauczyæ czegoœ o myœlistwie?"; 
};

FUNC INT DIA_cavalorn_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return 1;	
	};
};

FUNC VOID DIA_cavalorn_Lehrer_Info()
{
	if (log_cavalorntrain == FALSE)
	{
		Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
		B_LogEntry		(GE_TeacherOW,"Cavalorn jest myœliwym. Mo¿e mnie nauczyæ skradania siê i strzelania z ³uku. Mieszka w chacie, na drodze pomiêdzy Starym a Nowym Obozem.");
		log_cavalorntrain = TRUE;
	};
	AI_Output (other, self,"DIA_cavalorn_Lehrer_15_00"); //Mo¿esz mnie nauczyæ czegoœ o myœlistwie?
	AI_Output (self, other,"DIA_cavalorn_Lehrer_12_01"); //To zale¿y tylko od tego, co chcia³byœ wiedzieæ.
	
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
	Info_AddChoice		(DIA_cavalorn_Lehrer,DIALOG_BACK															,DIA_cavalorn_Lehrer_BACK);

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_2,		LPCOST_TALENT_BOW_2,0)	,DIA_cavalorn_Lehrer_Bow_2);
	};

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_1,		LPCOST_TALENT_BOW_1,0)	,DIA_cavalorn_Lehrer_Bow);
	};
	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)	,DIA_cavalorn_Lehrer_Schleichen);
	};
};

func void DIA_cavalorn_Lehrer_BACK()
{
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
};

func void DIA_Cavalorn_Lehrer_Bow()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Bow_15_00"); //Mo¿esz mnie nauczyæ, jak sprawniej pos³ugiwaæ siê ³ukiem?
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_01"); //Jako pocz¹tkuj¹cy powinieneœ zawsze pamiêtaæ, ¿e skutecznoœæ strzelania z ³uku zale¿y przede wszystkim od przyjêtej postawy.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_02"); //Rozstaw stopy szeroko, ramiona unieœ na tê sam¹ wysokoœæ, wstrzymaj oddech i strzelaj!
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_03"); //Jeœli uda ci siê trafiæ w szczególnie wra¿liwe punkty cia³a ofiary, nie bêdzie potrzeby oddawania drugiego strza³u. Oczywiœcie pocz¹tkuj¹cy strzelcy mog¹ tylko pomarzyæ o trafieniu w czu³y punkt.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_04"); //Ale jeœli zastosujesz siê do moich wskazówek, mo¿esz liczyæ na wiêcej trafieñ w cel.
	};
};

func void DIA_Cavalorn_Lehrer_Schleichen()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //Chcia³bym poruszaæ siê bezszelestnie.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //I s³usznie. Skradanie pozwoli ci dostaæ siê niepostrze¿enie do cudzych domów, albo po cichu zajœæ od ty³u przeciwnika.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //Chodz¹c na lekko ugiêtych nogach bêdziesz móg³ uwa¿niej obserwowaæ grunt, po którym st¹pasz, no i ³atwiej bêdzie ci balansowaæ cia³em.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //Oczywiœcie ktoœ obserwuj¹cy ciê z boku natychmiast nabierze podejrzeñ, wiêc skradaj siê zawsze nie bêd¹c widzianym przez osoby trzecie.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Zapamiêtaj sobie dobrze co ci powiedzia³em, i przede wszystkim nie daj siê z³apaæ!
	};
};
func void DIA_Cavalorn_Lehrer_Bow_2()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //Jesteœ ju¿ ca³kiem niez³ym myœliwym. Teraz pora abyœ pozna³ resztê najwa¿niejszych informacji.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //Dobry ³ucznik bierze pod uwagê wiele czynników zewnêtrznych, ale robi to odruchowo, nieœwiadomie.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Odkryj tajniki funkcjonowania twojego oka, pamiêtaj o sile naci¹gu i wyobra¿aj sobie trajektoriê lotu strza³y, ale przede wszystkim - zawsze b¹dŸ czujny!
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //Opanowa³eœ ju¿ wiêkszoœæ tajników strzelania z ³uku. Teraz pozosta³o ci tylko rozwijaæ twoje umiejêtnoœci podczas polowania i walki.
	};
};
/*------------------------------------------------------------------------
						BOGEN KAUFEN						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_SELLBOW (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_SELLBOW_Condition;
	information		= STT_336_cavalorn_SELLBOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Gdzie mogê zdobyæ ³uk?"; 
};

FUNC int  STT_336_cavalorn_SELLBOW_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_SELLBOW_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //Gdzie mogê zdobyæ ³uk?
	AI_Output (self, other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //Tutaj! Sprzedajê najwspanialsze ³uki w ca³ym Starym Obozie.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Cavalorn sprzedaje ³uki i strza³y. Znajdê go w jego chacie, na drodze pomiêdzy Starym a Nowym Obozem.");
};  

/*------------------------------------------------------------------------
						TRADE						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_TRADE (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_TRADE_Condition;
	information		= STT_336_cavalorn_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Poka¿ mi swoje towary."; 
	trade 			= 1;
};

FUNC int  STT_336_cavalorn_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero,STT_336_cavalorn_SELLBOW))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_TRADE_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_TRADE_Info_15_01"); //Poka¿ mi swoje towary.
	
};  








