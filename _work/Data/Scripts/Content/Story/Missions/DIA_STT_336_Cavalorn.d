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
	AI_Output (self, other,"DIA_cavalorn_Hunter_12_01"); //Jestem myśliwym. Poluję głównie na ścierwojady.
	
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
	description		= "Możesz mnie nauczyć czegoś o myślistwie?"; 
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
		B_LogEntry		(GE_TeacherOW,"Cavalorn jest myśliwym. Może mnie nauczyć skradania się i strzelania z łuku. Mieszka w chacie, na drodze pomiędzy Starym a Nowym Obozem.");
		log_cavalorntrain = TRUE;
	};
	AI_Output (other, self,"DIA_cavalorn_Lehrer_15_00"); //Możesz mnie nauczyć czegoś o myślistwie?
	AI_Output (self, other,"DIA_cavalorn_Lehrer_12_01"); //To zależy tylko od tego, co chciałbyś wiedzieć.
	
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
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Bow_15_00"); //Możesz mnie nauczyć, jak sprawniej posługiwać się łukiem?
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_01"); //Jako początkujący powinieneś zawsze pamiętać, że skuteczność strzelania z łuku zależy przede wszystkim od przyjętej postawy.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_02"); //Rozstaw stopy szeroko, ramiona unieś na tę samą wysokość, wstrzymaj oddech i strzelaj!
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_03"); //Jeśli uda ci się trafić w szczególnie wrażliwe punkty ciała ofiary, nie będzie potrzeby oddawania drugiego strzału. Oczywiście początkujący strzelcy mogą tylko pomarzyć o trafieniu w czuły punkt.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_04"); //Ale jeśli zastosujesz się do moich wskazówek, możesz liczyć na więcej trafień w cel.
	};
};

func void DIA_Cavalorn_Lehrer_Schleichen()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //Chciałbym poruszać się bezszelestnie.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //I słusznie. Skradanie pozwoli ci dostać się niepostrzeżenie do cudzych domów, albo po cichu zajść od tyłu przeciwnika.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //Chodząc na lekko ugiętych nogach będziesz mógł uważniej obserwować grunt, po którym stąpasz, no i łatwiej będzie ci balansować ciałem.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //Oczywiście ktoś obserwujący cię z boku natychmiast nabierze podejrzeń, więc skradaj się zawsze nie będąc widzianym przez osoby trzecie.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Zapamiętaj sobie dobrze co ci powiedziałem, i przede wszystkim nie daj się złapać!
	};
};
func void DIA_Cavalorn_Lehrer_Bow_2()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //Jesteś już całkiem niezłym myśliwym. Teraz pora abyś poznał resztę najważniejszych informacji.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //Dobry łucznik bierze pod uwagę wiele czynników zewnętrznych, ale robi to odruchowo, nieświadomie.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Odkryj tajniki funkcjonowania twojego oka, pamiętaj o sile naciągu i wyobrażaj sobie trajektorię lotu strzały, ale przede wszystkim - zawsze bądź czujny!
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //Opanowałeś już większość tajników strzelania z łuku. Teraz pozostało ci tylko rozwijać twoje umiejętności podczas polowania i walki.
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
	description		= "Gdzie mogę zdobyć łuk?"; 
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
	AI_Output (other, self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //Gdzie mogę zdobyć łuk?
	AI_Output (self, other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //Tutaj! Sprzedaję najwspanialsze łuki w całym Starym Obozie.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Cavalorn sprzedaje łuki i strzały. Znajdę go w jego chacie, na drodze pomiędzy Starym a Nowym Obozem.");
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
	description		= "Pokaż mi swoje towary."; 
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
	AI_Output (other, self,"STT_336_cavalorn_TRADE_Info_15_01"); //Pokaż mi swoje towary.
	
};  








