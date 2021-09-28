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
	AI_Output			(self, other,"Tpl_1438_Templer_Exit_Info_13_02"); //Niech nadejdzie przebudzenie Œni¹cego.
	
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
	description		= "Co Stra¿nicy Œwi¹tynni robi¹ w kopalni?"; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_INFO_Info_15_01"); //Co Stra¿nicy Œwi¹tynni robi¹ w kopalni?
	AI_Output			(self, other,"Tpl_1438_Templer_INFO_Info_13_02"); //Polujemy na pe³zacze. Wracaj do Obozu. Tam bêdziesz bezpieczny.
}; 

// ***************** SEKRET *****************************

instance  Tpl_1438_Templer_WHY (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_WHY_Condition;
	information		= Tpl_1438_Templer_WHY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Dlaczego polujecie na pe³zacze?"; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_01"); //Dlaczego polujecie na pe³zacze?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_02"); //Ich wnêtrznoœci zawieraj¹ niezwykle cenn¹ wydzielinê.
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_03"); //Co to za wydzielina?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_04"); //Trucizna. Tylko nasz wielki Guru, Cor Kalom, potrafi przyrz¹dzaæ z niej magiczne wywary.
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
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_02"); //To jeden z najpotê¿niejszych ludzi w ca³ym Bractwie. Posiad³ wiele tajemnic magii i potrafi kontrolowaæ ludzkie myœli!
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_03"); //Oprócz tego jest równie¿ alchemikiem. Przygotowuje wywary, które pozwol¹ nam nawi¹zaæ kontakt ze Œni¹cym. Jeœli chcesz go poznaæ, udaj siê do naszego obozu. Zawsze chêtnie witamy nowych goœci!
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_04"); //Zastanowiê siê...
};  
//---------------------WENN DIE EIERSUCHE LÄUFT-------------------------------  
instance  Tpl_1438_Templer_EGGSEARCH (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_EGGSEARCH_Condition;
	information		= Tpl_1438_Templer_EGGSEARCH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Szukam gniazda pe³zaczy."; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01"); //Szukam gniazda pe³zaczy.
	AI_Output			(self, other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02"); //Porozmawiaj z Gor Na Videm, Gor Na Koshem lub Gor Na Barem. Oni wiedz¹ wiêcej o pe³zaczach ni¿ ja.

	B_LogEntry		(CH2_MCEggs,"Przy wejœciu do Starej Kopalni zapyta³em Œwi¹tynnego Stra¿nika o gniazdo pe³zaczy. Skierowa³ mnie do swoich pobratymców: Gor Na Vida, Gor Na Kosha i Gor Na Bara. Imiona cz³onków Bractwa zaczynaj¹ doprowadzaæ mnie do sza³u.");  
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
	description		= "Jak mogê pozyskaæ wydzielinê z wnêtrznoœci pe³zaczy?"; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_ZANGEN_Info_15_01"); //Jak mogê pozyskaæ wydzielinê z wnêtrznoœci pe³zaczy?
	AI_Output			(self, other,"Tpl_1438_Templer_ZANGEN_Info_13_02"); //To nie takie proste, ale mogê ciê nauczyæ.
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
	description		= "Naucz siê usuwaæ wnêtrznoœci pe³zaczy (1 punkt umiejêtnoœci)"; 
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
	
	AI_Output			(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01"); //Naucz mnie pozyskiwaæ wydzielinê z wnêtrznoœci pe³zaczy.
	
	if (hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01"); //Najpierw musisz wykonaæ g³êbokie ciêcie. Tylko uwa¿aj, ¿eby nie przeci¹æ gruczo³u jadowego, bo trucizna mo¿e trysn¹æ ci na rêce.
		AI_Output		(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02"); //To musi byæ bardzo bolesne.
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03"); //Jeszcze jak! Pozna³eœ kiedyœ Korgura Trzy Palce, tego ³owcê pe³zaczy? A, nie - to by³o przed twoim przybyciem. Có¿, kontynuujmy...
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04"); //Wytnij spory kawa³ miêsa dooko³a gruczo³u. Jeœli bêdziesz wystarczaj¹co ostro¿ny, powinno ci siê udaæ bezpiecznie pozyskaæ gruczo³y.
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry		(GE_AnimalTrophies,"Jak usuwaæ wnêtrznoœci pe³zaczy.");
		Tpl_1438_Templer_TEACHZANGEN.permanent		= 0;
		PrintScreen		("Nowa umiejêtnoœæ: Wycinanie wnêtrznoœci pe³zaczy", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else 
	{
		PrintScreen		("Za ma³o punktów umiejêtnoœci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say			(self, other, "$NOLEARNNOPOINTS");
	};
};   
