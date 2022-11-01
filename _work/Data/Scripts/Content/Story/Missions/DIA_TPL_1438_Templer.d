instance  Tpl_1438_Templer_Exit (C_INFO)
{
	npc			=  Tpl_1438_Templer;
	nr			=  999;
	condition	=  Tpl_1438_Templer_Exit_Condition;
	information	=  Tpl_1438_Templer_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1438_Templer_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1438_Templer_Exit_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_Exit_Info_15_01"); //Do zobaczenia.
	AI_Output			(self, other,"Tpl_1438_Templer_Exit_Info_13_02"); //Niech nadejdzie przebudzenie Śniącego.
	
	AI_StopProcessInfos	( self );
};
// ***************** GELABER *****************************

instance  Tpl_1438_Templer_INFO (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_INFO_Condition;
	information		= Tpl_1438_Templer_INFO_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co Strażnicy Świątynni robią w kopalni?"; 
};

FUNC int  Tpl_1438_Templer_INFO_Condition()
{	
	if (  CorKalom_BringMCQBalls != LOG_RUNNING ) 
	{
		return TRUE;
	};

};

FUNC void  Tpl_1438_Templer_INFO_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_INFO_Info_15_01"); //Co Strażnicy Świątynni robią w kopalni?
	AI_Output			(self, other,"Tpl_1438_Templer_INFO_Info_13_02"); //Polujemy na pełzacze. Wracaj do Obozu. Tam będziesz bezpieczny.
}; 

// ***************** SEKRET *****************************

instance  Tpl_1438_Templer_WHY (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_WHY_Condition;
	information		= Tpl_1438_Templer_WHY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Dlaczego polujecie na pełzacze?"; 
};

FUNC int  Tpl_1438_Templer_WHY_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1438_Templer_INFO )) 
	{
		return 1;
	};

};
FUNC void  Tpl_1438_Templer_WHY_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_01"); //Dlaczego polujecie na pełzacze?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_02"); //Ich wnętrzności zawierają niezwykle cenną wydzielinę.
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_03"); //Co to za wydzielina?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_04"); //Trucizna. Tylko nasz wielki Guru, Cor Kalom, potrafi przyrządzać z niej magiczne wywary.
};
// ***************** KALOM *****************************

instance  Tpl_1438_Templer_KALOM (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_KALOM_Condition;
	information		= Tpl_1438_Templer_KALOM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Kim jest Cor Kalom?"; 
};

FUNC int  Tpl_1438_Templer_KALOM_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1438_Templer_WHY )) 
	{
		return 1;
	};

};

FUNC void  Tpl_1438_Templer_KALOM_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_01"); //Kim jest Cor Kalom?
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_02"); //To jeden z najpotężniejszych ludzi w całym Bractwie. Posiadł wiele tajemnic magii i potrafi kontrolować ludzkie myśli!
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_03"); //Oprócz tego jest również alchemikiem. Przygotowuje wywary, które pozwolą nam nawiązać kontakt ze Śniącym. Jeśli chcesz go poznać, udaj się do naszego obozu. Zawsze chętnie witamy nowych gości!
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_04"); //Zastanowię się...
};  
//---------------------WENN DIE EIERSUCHE LÄUFT-------------------------------  
instance  Tpl_1438_Templer_EGGSEARCH (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_EGGSEARCH_Condition;
	information		= Tpl_1438_Templer_EGGSEARCH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Szukam gniazda pełzaczy."; 
};

FUNC int  Tpl_1438_Templer_EGGSEARCH_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING )
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_EGGSEARCH_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01"); //Szukam gniazda pełzaczy.
	AI_Output			(self, other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02"); //Porozmawiaj z Gor Na Videm, Gor Na Koshem lub Gor Na Barem. Oni wiedzą więcej o pełzaczach niż ja.

	B_LogEntry		(CH2_MCEggs,"Przy wejściu do Starej Kopalni zapytałem Świątynnego Strażnika o gniazdo pełzaczy. Skierował mnie do swoich pobratymców: Gor Na Vida, Gor Na Kosha i Gor Na Bara. Imiona członków Bractwa zaczynają doprowadzać mnie do szału.");  
};  
/*------------------------------------------------------------------------
//							ZANGEN FREISCHALTEN						    //
------------------------------------------------------------------------*/

instance  Tpl_1438_Templer_ZANGEN (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_ZANGEN_Condition;
	information		= Tpl_1438_Templer_ZANGEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak mogę pozyskać wydzielinę z wnętrzności pełzaczy?"; 
};

FUNC int  Tpl_1438_Templer_ZANGEN_Condition()
{	
	if	(Npc_KnowsInfo (hero,Tpl_1438_Templer_WHY) || (CorKalom_BringMCQBalls == LOG_RUNNING))
	&&	(Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_ZANGEN_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_ZANGEN_Info_15_01"); //Jak mogę pozyskać wydzielinę z wnętrzności pełzaczy?
	AI_Output			(self, other,"Tpl_1438_Templer_ZANGEN_Info_13_02"); //To nie takie proste, ale mogę cię nauczyć.
}; 
/*------------------------------------------------------------------------
//							LERNEN ZANGEN ZU ENTFERNEN					//
------------------------------------------------------------------------*/

instance  Tpl_1438_Templer_TEACHZANGEN (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_TEACHZANGEN_Condition;
	information		= Tpl_1438_Templer_TEACHZANGEN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Naucz się usuwać wnętrzności pełzaczy (1 punkt umiejętności)"; 
};

FUNC int  Tpl_1438_Templer_TEACHZANGEN_Condition()
{	
	if	(Npc_KnowsInfo (hero,Tpl_1438_Templer_ZANGEN))
	&&	(Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_TEACHZANGEN_Info()
{
	
	AI_Output			(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01"); //Naucz mnie pozyskiwać wydzielinę z wnętrzności pełzaczy.
	
	if (hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01"); //Najpierw musisz wykonać głębokie cięcie. Tylko uważaj, żeby nie przeciąć gruczołu jadowego, bo trucizna może trysnąć ci na ręce.
		AI_Output		(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02"); //To musi być bardzo bolesne.
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03"); //Jeszcze jak! Poznałeś kiedyś Korgura Trzy Palce, tego łowcę pełzaczy? A, nie - to było przed twoim przybyciem. Cóż, kontynuujmy...
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04"); //Wytnij spory kawał mięsa dookoła gruczołu. Jeśli będziesz wystarczająco ostrożny, powinno ci się udać bezpiecznie pozyskać gruczoły.
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry		(GE_AnimalTrophies,"Jak usuwać wnętrzności pełzaczy.");
		Tpl_1438_Templer_TEACHZANGEN.permanent		= 0;
		PrintScreen		("Nowa umiejętność: Wycinanie wnętrzności pełzaczy", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else 
	{
		PrintScreen		("Za mało punktów umiejętności!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say			(self, other, "$NOLEARNNOPOINTS");
	};
};   
