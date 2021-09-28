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
// 					Ich J�ger
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
	AI_Output (self, other,"DIA_cavalorn_Hunter_12_01"); //Jestem my�liwym. Poluj� g��wnie na �cierwojady.
	
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
	description		= "Mo�esz mnie nauczy� czego� o my�listwie?"; 
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
		B_LogEntry		(GE_TeacherOW,"Cavalorn jest my�liwym. Mo�e mnie nauczy� skradania si� i strzelania z �uku. Mieszka w chacie, na drodze pomi�dzy Starym a Nowym Obozem.");
		log_cavalorntrain = TRUE;
	};
	AI_Output (other, self,"DIA_cavalorn_Lehrer_15_00"); //Mo�esz mnie nauczy� czego� o my�listwie?
	AI_Output (self, other,"DIA_cavalorn_Lehrer_12_01"); //To zale�y tylko od tego, co chcia�by� wiedzie�.
	
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
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Bow_15_00"); //Mo�esz mnie nauczy�, jak sprawniej pos�ugiwa� si� �ukiem?
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_01"); //Jako pocz�tkuj�cy powiniene� zawsze pami�ta�, �e skuteczno�� strzelania z �uku zale�y przede wszystkim od przyj�tej postawy.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_02"); //Rozstaw stopy szeroko, ramiona unie� na t� sam� wysoko��, wstrzymaj oddech i strzelaj!
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_03"); //Je�li uda ci si� trafi� w szczeg�lnie wra�liwe punkty cia�a ofiary, nie b�dzie potrzeby oddawania drugiego strza�u. Oczywi�cie pocz�tkuj�cy strzelcy mog� tylko pomarzy� o trafieniu w czu�y punkt.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_04"); //Ale je�li zastosujesz si� do moich wskaz�wek, mo�esz liczy� na wi�cej trafie� w cel.
	};
};

func void DIA_Cavalorn_Lehrer_Schleichen()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //Chcia�bym porusza� si� bezszelestnie.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //I s�usznie. Skradanie pozwoli ci dosta� si� niepostrze�enie do cudzych dom�w, albo po cichu zaj�� od ty�u przeciwnika.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //Chodz�c na lekko ugi�tych nogach b�dziesz m�g� uwa�niej obserwowa� grunt, po kt�rym st�pasz, no i �atwiej b�dzie ci balansowa� cia�em.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //Oczywi�cie kto� obserwuj�cy ci� z boku natychmiast nabierze podejrze�, wi�c skradaj si� zawsze nie b�d�c widzianym przez osoby trzecie.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Zapami�taj sobie dobrze co ci powiedzia�em, i przede wszystkim nie daj si� z�apa�!
	};
};
func void DIA_Cavalorn_Lehrer_Bow_2()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //Jeste� ju� ca�kiem niez�ym my�liwym. Teraz pora aby� pozna� reszt� najwa�niejszych informacji.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //Dobry �ucznik bierze pod uwag� wiele czynnik�w zewn�trznych, ale robi to odruchowo, nie�wiadomie.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Odkryj tajniki funkcjonowania twojego oka, pami�taj o sile naci�gu i wyobra�aj sobie trajektori� lotu strza�y, ale przede wszystkim - zawsze b�d� czujny!
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //Opanowa�e� ju� wi�kszo�� tajnik�w strzelania z �uku. Teraz pozosta�o ci tylko rozwija� twoje umiej�tno�ci podczas polowania i walki.
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
	description		= "Gdzie mog� zdoby� �uk?"; 
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
	AI_Output (other, self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //Gdzie mog� zdoby� �uk?
	AI_Output (self, other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //Tutaj! Sprzedaj� najwspanialsze �uki w ca�ym Starym Obozie.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Cavalorn sprzedaje �uki i strza�y. Znajd� go w jego chacie, na drodze pomi�dzy Starym a Nowym Obozem.");
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
	description		= "Poka� mi swoje towary."; 
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
	AI_Output (other, self,"STT_336_cavalorn_TRADE_Info_15_01"); //Poka� mi swoje towary.
	
};  








