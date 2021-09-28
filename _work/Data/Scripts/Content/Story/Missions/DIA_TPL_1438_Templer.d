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
	AI_Output			(self, other,"Tpl_1438_Templer_Exit_Info_13_02"); //Niech nadejdzie przebudzenie �ni�cego.
	
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
	description		= "Co Stra�nicy �wi�tynni robi� w kopalni?"; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_INFO_Info_15_01"); //Co Stra�nicy �wi�tynni robi� w kopalni?
	AI_Output			(self, other,"Tpl_1438_Templer_INFO_Info_13_02"); //Polujemy na pe�zacze. Wracaj do Obozu. Tam b�dziesz bezpieczny.
}; 

// ***************** SEKRET *****************************

instance  Tpl_1438_Templer_WHY (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_WHY_Condition;
	information		= Tpl_1438_Templer_WHY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Dlaczego polujecie na pe�zacze?"; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_01"); //Dlaczego polujecie na pe�zacze?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_02"); //Ich wn�trzno�ci zawieraj� niezwykle cenn� wydzielin�.
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_03"); //Co to za wydzielina?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_04"); //Trucizna. Tylko nasz wielki Guru, Cor Kalom, potrafi przyrz�dza� z niej magiczne wywary.
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
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_02"); //To jeden z najpot�niejszych ludzi w ca�ym Bractwie. Posiad� wiele tajemnic magii i potrafi kontrolowa� ludzkie my�li!
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_03"); //Opr�cz tego jest r�wnie� alchemikiem. Przygotowuje wywary, kt�re pozwol� nam nawi�za� kontakt ze �ni�cym. Je�li chcesz go pozna�, udaj si� do naszego obozu. Zawsze ch�tnie witamy nowych go�ci!
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_04"); //Zastanowi� si�...
};  
//---------------------WENN DIE EIERSUCHE L�UFT-------------------------------  
instance  Tpl_1438_Templer_EGGSEARCH (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_EGGSEARCH_Condition;
	information		= Tpl_1438_Templer_EGGSEARCH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Szukam gniazda pe�zaczy."; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01"); //Szukam gniazda pe�zaczy.
	AI_Output			(self, other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02"); //Porozmawiaj z Gor Na Videm, Gor Na Koshem lub Gor Na Barem. Oni wiedz� wi�cej o pe�zaczach ni� ja.

	B_LogEntry		(CH2_MCEggs,"Przy wej�ciu do Starej Kopalni zapyta�em �wi�tynnego Stra�nika o gniazdo pe�zaczy. Skierowa� mnie do swoich pobratymc�w: Gor Na Vida, Gor Na Kosha i Gor Na Bara. Imiona cz�onk�w Bractwa zaczynaj� doprowadza� mnie do sza�u.");  
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
	description		= "Jak mog� pozyska� wydzielin� z wn�trzno�ci pe�zaczy?"; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_ZANGEN_Info_15_01"); //Jak mog� pozyska� wydzielin� z wn�trzno�ci pe�zaczy?
	AI_Output			(self, other,"Tpl_1438_Templer_ZANGEN_Info_13_02"); //To nie takie proste, ale mog� ci� nauczy�.
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
	description		= "Naucz si� usuwa� wn�trzno�ci pe�zaczy (1 punkt umiej�tno�ci)"; 
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
	
	AI_Output			(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01"); //Naucz mnie pozyskiwa� wydzielin� z wn�trzno�ci pe�zaczy.
	
	if (hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01"); //Najpierw musisz wykona� g��bokie ci�cie. Tylko uwa�aj, �eby nie przeci�� gruczo�u jadowego, bo trucizna mo�e trysn�� ci na r�ce.
		AI_Output		(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02"); //To musi by� bardzo bolesne.
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03"); //Jeszcze jak! Pozna�e� kiedy� Korgura Trzy Palce, tego �owc� pe�zaczy? A, nie - to by�o przed twoim przybyciem. C�, kontynuujmy...
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04"); //Wytnij spory kawa� mi�sa dooko�a gruczo�u. Je�li b�dziesz wystarczaj�co ostro�ny, powinno ci si� uda� bezpiecznie pozyska� gruczo�y.
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry		(GE_AnimalTrophies,"Jak usuwa� wn�trzno�ci pe�zaczy.");
		Tpl_1438_Templer_TEACHZANGEN.permanent		= 0;
		PrintScreen		("Nowa umiej�tno��: Wycinanie wn�trzno�ci pe�zaczy", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else 
	{
		PrintScreen		("Za ma�o punkt�w umiej�tno�ci!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say			(self, other, "$NOLEARNNOPOINTS");
	};
};   
