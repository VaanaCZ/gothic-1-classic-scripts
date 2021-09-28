// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Scatty_Exit (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 999;
	condition	= DIA_Scatty_Exit_Condition;
	information	= DIA_Scatty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Scatty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Was machst du hier 
// **************************************************

INSTANCE DIA_Scatty_WhatDoYouDo (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WhatDoYouDo_Condition;
	information	= DIA_Scatty_WhatDoYouDo_Info;
	permanent	= 0;
	description = "Czym si� tutaj zajmujesz?";
};                       

FUNC INT DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output (other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //Czym si� tutaj zajmujesz?
	AI_Output (self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //Organizuj� walki na arenie. Przyjmuj� zak�ady, pozyskuj� nowych wojownik�w... No wiesz.
};

// **************************************************
// 					 Join OC
// **************************************************
	var int Scatty_ChargeKirgo;
	var int Scatty_ChargeKharim;
	var int Scatty_ChargeGorHanis;
// **************************************************

INSTANCE DIA_Scatty_JoinOC (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_JoinOC_Condition;
	information	= DIA_Scatty_JoinOC_Info;
	permanent	= 0;
	description = "Chc� do��czy� do waszego obozu. Mo�esz mi pom�c?";
};                       

FUNC INT DIA_Scatty_JoinOC_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Scatty_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Scatty_JoinOC_15_00"); //Chc� do��czy� do waszego obozu. Mo�esz mi pom�c?
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_01"); //Pomog� ci, je�li zrobisz na mnie odpowiednio dobre wra�enie.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_02"); //Najlepsi wojownicy z wszystkich oboz�w przybywaj� tutaj, by stan�� w szranki na mojej arenie.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_03"); //Wyzwij kt�rego� z nich na pojedynek. Zobacz�, co potrafisz, i je�li mi si� spodoba, mo�e szepn� s��wko w twoim imieniu.
	
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kharim;	Kharim = Hlp_GetNpc(Sld_729_Kharim);		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC GorHanis;	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	
	B_LogEntry( CH1_JoinOC,"Scatty, organizator walk na arenie, chcia�by zobaczy�, jak sobie poradz� w starciu z kt�rym� z jego wojownik�w.");
};

// **************************************************
// 					 KIRGO SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KirgoSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KirgoSuccess_Condition;
	information	= DIA_Scatty_KirgoSuccess_Info;
	permanent	= 0;
	description = "Walczy�em z Kirgo!";
};                       

FUNC INT DIA_Scatty_KirgoSuccess_Condition()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			

	if ( (Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ( (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KirgoSuccess_Info()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);	
	
	AI_Output (other,self,"DIA_Scatty_KirgoSuccess_15_00"); //Walczy�em z Kirgo!
	if (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_01"); //Tak, ale przegra�e�!
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_02"); //Chyba nie my�lisz, �e b�d� pod wra�eniem takiego popisu...
		Scatty_ChargeKirgo = LOG_FAILED;
		
		B_LogEntry( CH1_JoinOC,"Pora�ka w walce z Kirgo nie zjedna�a mi bynajmniej sympatii Scatty'ego.");
	}
	else if (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_03"); //I pokona�e� go! Ca�kiem nie�le jak na takiego ��todzioba! Jestem pod wra�eniem!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"Scatty by� pod wra�eniem mojej walki z Kirgo.");
		B_GiveXP (XP_kirgovictory);
	};
};

// **************************************************
// 					 KHARIM SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KHARIMSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KHARIMSuccess_Condition;
	information	= DIA_Scatty_KHARIMSuccess_Info;
	permanent	= 0;
	description = "Wyzwa�em Kharima na pojedynek!";
};                       

FUNC INT DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);			

	if ( (Scatty_ChargeKHARIM == LOG_RUNNING) && (Kharim_Charged == TRUE) && ( (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KHARIMSuccess_Info()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);	
	
	AI_Output (other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //Wyzwa�em Kharima na pojedynek!
	if (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //I spu�ci� ci niez�e baty!
		if (Npc_GetTrueGuild (hero) == GIL_NONE)
		{
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //Ale musz� przyzna�, �e wybra�e� sobie dobrego przeciwnika. Nie znosz� tych sukinsyn�w z Nowego Obozu.
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Widz�, �e my�limy podobnie. Przyda si� nam kto� taki jak ty!
		};
		Scatty_ChargeKHARIM = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry( CH1_JoinOC,"Zosta�em pokonany przez Kharima! Scatty podziwia moj� odwag�, ale uwa�a, �e wojownik ze mnie �aden.");
		
	}
	else if (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //I pokona�e� go! Musz� przyzna�, �e �wietnie sobie poradzi�e�. Kharim od dawna uchodzi� za jednego z najlepszych wojownik�w w kolonii.
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //Jestem pod wra�eniem!
		Scatty_ChargeKHARIM = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"Pokaza�em Kharimowi, gdzie raki zimuj�. Scatty by� pod wra�eniem.");
		B_GiveXP(XP_kharimvictory);
	};
};


// **************************************************
// 				 Warum andere Lager K�mpfer
// **************************************************

INSTANCE DIA_Scatty_OtherCamps (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_OtherCamps_Condition;
	information	= DIA_Scatty_OtherCamps_Info;
	permanent	= 0;
	description = "Dlaczego pozwalacie obcym walczy� na waszej arenie?";
};                       

FUNC INT DIA_Scatty_OtherCamps_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_OtherCamps_Info()
{
	AI_Output (other,self,"DIA_Scatty_OtherCamps_15_00"); //My�la�em, �e Stary i Nowy Ob�z nie dogaduj� si� najlepiej. Dlaczego pozwalacie obcym walczy� na waszej arenie?
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_01"); //To proste. Raz w tygodniu organizujemy walki, a Kopacze lubi� patrze�, jak Szkodniki z Nowego Obozu dostaj� po g�owie.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_02"); //Gdy walczy kt�ry� z nich przyjmuj� wi�cej zak�ad�w, a to dobrze wp�ywa na interes!
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_03"); //Osobi�cie nienawidz� tych wieprzy z Nowego Obozu, ale w tych trudnych czasach �aden pieni�dz nie �mierdzi...
};

// **************************************************
// 					Will Wetten
// **************************************************

INSTANCE DIA_Scatty_WannaBet (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaBet_Condition;
	information	= DIA_Scatty_WannaBet_Info;
	permanent	= 1;
	description = "Chcia�bym obstawi� walk�.";
};                       

FUNC INT DIA_Scatty_WannaBet_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_WannaBet_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaBet_15_00"); //Chcia�bym obstawi� walk�.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_01"); //Przecie� teraz nikt nie walczy!
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_02"); //Najbli�sza walka odb�dzie si� dopiero za kilka dni. B�dzie og�oszenie!
	
};

// **************************************************
// 					Will K�mpfen
// **************************************************

INSTANCE DIA_Scatty_WannaFight (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaFight_Condition;
	information	= DIA_Scatty_WannaFight_Info;
	permanent	= 1;
	description = "Chcia�bym stoczy� walk� na arenie.";
};                       

FUNC INT DIA_Scatty_WannaFight_Condition()
{
//	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
//	{
//		return 1;
//	};
};

FUNC VOID DIA_Scatty_WannaFight_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaFight_15_00"); //Chcia�bym stoczy� walk� na arenie.
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_01"); //Nie mog� ci pozwoli� walczy�, p�ki nie do��czysz do kt�rego� z oboz�w.
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_02"); //Ludzi nie interesuj� niezale�ni wojownicy.
};

// **************************************************
// 					TRAIN
// **************************************************

INSTANCE DIA_Scatty_TRAIN (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 10;
	condition	= DIA_Scatty_TRAIN_Condition;
	information	= DIA_Scatty_TRAIN_Info;
	permanent	= 1;
	description = "Zajmujesz si� r�wnie� szkoleniem wojownik�w?";
};                       

FUNC INT DIA_Scatty_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_TRAIN_Info()
{
	if( log_scattytrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
    B_LogEntry(GE_TeacherOC,"Scatty mo�e mnie nauczy� walki jednor�cznym or�em.");
    log_scattytrain = TRUE;
    };
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_00"); //Zajmujesz si� r�wnie� szkoleniem wojownik�w?
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_01"); //Tak, ale nie za darmo. Jak chcesz, �ebym ci� czego� nauczy�, musisz zap�aci�.


	Info_ClearChoices	(DIA_Scatty_TRAIN );
	Info_AddChoice		(DIA_Scatty_TRAIN,DIALOG_BACK		,DIA_Scatty_TRAIN_BACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,150)	,DIA_Scatty_TRAIN_2h);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,50)	,DIA_Scatty_TRAIN_1h);
	};
};

func void DIA_Scatty_TRAIN_BACK()
{
	Info_ClearChoices	(DIA_Scatty_TRAIN );
};

func void DIA_Scatty_TRAIN_1h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Chcia�bym nauczy� si� walki jednor�cznym or�em.
	
	if (Npc_HasItems(other,itminugget) >= 50)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_01"); //M�dra decyzja. Jednak zanim poznasz bardziej zaawansowane techniki, powiniene� nauczy� si� prawid�owo trzyma� or� w r�ku.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Pocz�tkuj�cy cz�sto �api� zwyk�y miecz obydwoma r�kami. Radzi�bym ci si� do tego nie przyzwyczaja�, to fatalny nawyk. 
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Trzymaj bro� jedn� r�k�, ostrzem do g�ry, i zacznij ni� macha�.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Musisz si� nauczy�, jak zgra� twoje ruchy z bezw�adno�ci� or�a. Dzi�ki temu twoje ataki b�d� szybsze i bardziej zaskakuj�ce.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Zapami�taj sobie dobrze, co ci powiedzia�em, a tw�j styl walki stanie si� o wiele bardziej elegancki i skuteczny.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_06"); //A, i jeszcze co�! Niekt�re ciosy powoduj� wi�ksze obra�enia ni� zwykle. Oczywi�cie, jako pocz�tkuj�cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Ale to si� zmieni w miar� czynienia przez ciebie post�p�w.
			B_GiveInvItems(other,self,itminugget,50);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj�cej ilo�ci rudy!
	};
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos�ugiwa� si� jednor�czn� broni�.
	
	if (Npc_HasItems(other,itminugget) >= 150)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //Dobrze, podstawy ju� znasz. Nieznaczne opuszczenie broni zwi�kszy si�� twojego pierwszego ciosu.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Musisz wykorzysta� si�� bezw�adno�ci, pami�tasz? �wietnie. Teraz nauczysz si� lepiej balansowa� cia�em. Po zadaniu dw�ch cios�w wykonaj obr�t. To powinno zmyli� twojego przeciwnika i pozwoli� ci wyj�� na dobr� pozycj� do nast�pnego ataku.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Wtedy wyprowad� nast�pne ci�cie z prawej strony...
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //I znowu do przodu. Pami�taj - trening czyni mistrza, wi�c najlepiej we� si� od razu do roboty!
			B_GiveInvItems(other,self,itminugget,150);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //Wr��, gdy b�dziesz mia� wystarczaj�co du�o rudy.
	};
};
