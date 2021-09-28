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
	description = "Czym siê tutaj zajmujesz?";
};                       

FUNC INT DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output (other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //Czym siê tutaj zajmujesz?
	AI_Output (self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //Organizujê walki na arenie. Przyjmujê zak³ady, pozyskujê nowych wojowników... No wiesz.
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
	description = "Chcê do³¹czyæ do waszego obozu. Mo¿esz mi pomóc?";
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
	AI_Output (other,self,"DIA_Scatty_JoinOC_15_00"); //Chcê do³¹czyæ do waszego obozu. Mo¿esz mi pomóc?
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_01"); //Pomogê ci, jeœli zrobisz na mnie odpowiednio dobre wra¿enie.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_02"); //Najlepsi wojownicy z wszystkich obozów przybywaj¹ tutaj, by stan¹æ w szranki na mojej arenie.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_03"); //Wyzwij któregoœ z nich na pojedynek. Zobaczê, co potrafisz, i jeœli mi siê spodoba, mo¿e szepnê s³ówko w twoim imieniu.
	
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kharim;	Kharim = Hlp_GetNpc(Sld_729_Kharim);		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC GorHanis;	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	
	B_LogEntry( CH1_JoinOC,"Scatty, organizator walk na arenie, chcia³by zobaczyæ, jak sobie poradzê w starciu z którymœ z jego wojowników.");
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
	description = "Walczy³em z Kirgo!";
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
	
	AI_Output (other,self,"DIA_Scatty_KirgoSuccess_15_00"); //Walczy³em z Kirgo!
	if (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_01"); //Tak, ale przegra³eœ!
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_02"); //Chyba nie myœlisz, ¿e bêdê pod wra¿eniem takiego popisu...
		Scatty_ChargeKirgo = LOG_FAILED;
		
		B_LogEntry( CH1_JoinOC,"Pora¿ka w walce z Kirgo nie zjedna³a mi bynajmniej sympatii Scatty'ego.");
	}
	else if (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_03"); //I pokona³eœ go! Ca³kiem nieŸle jak na takiego ¿ó³todzioba! Jestem pod wra¿eniem!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"Scatty by³ pod wra¿eniem mojej walki z Kirgo.");
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
	description = "Wyzwa³em Kharima na pojedynek!";
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
	
	AI_Output (other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //Wyzwa³em Kharima na pojedynek!
	if (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //I spuœci³ ci niez³e baty!
		if (Npc_GetTrueGuild (hero) == GIL_NONE)
		{
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //Ale muszê przyznaæ, ¿e wybra³eœ sobie dobrego przeciwnika. Nie znoszê tych sukinsynów z Nowego Obozu.
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Widzê, ¿e myœlimy podobnie. Przyda siê nam ktoœ taki jak ty!
		};
		Scatty_ChargeKHARIM = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry( CH1_JoinOC,"Zosta³em pokonany przez Kharima! Scatty podziwia moj¹ odwagê, ale uwa¿a, ¿e wojownik ze mnie ¿aden.");
		
	}
	else if (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //I pokona³eœ go! Muszê przyznaæ, ¿e œwietnie sobie poradzi³eœ. Kharim od dawna uchodzi³ za jednego z najlepszych wojowników w kolonii.
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //Jestem pod wra¿eniem!
		Scatty_ChargeKHARIM = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"Pokaza³em Kharimowi, gdzie raki zimuj¹. Scatty by³ pod wra¿eniem.");
		B_GiveXP(XP_kharimvictory);
	};
};


// **************************************************
// 				 Warum andere Lager Kämpfer
// **************************************************

INSTANCE DIA_Scatty_OtherCamps (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_OtherCamps_Condition;
	information	= DIA_Scatty_OtherCamps_Info;
	permanent	= 0;
	description = "Dlaczego pozwalacie obcym walczyæ na waszej arenie?";
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
	AI_Output (other,self,"DIA_Scatty_OtherCamps_15_00"); //Myœla³em, ¿e Stary i Nowy Obóz nie dogaduj¹ siê najlepiej. Dlaczego pozwalacie obcym walczyæ na waszej arenie?
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_01"); //To proste. Raz w tygodniu organizujemy walki, a Kopacze lubi¹ patrzeæ, jak Szkodniki z Nowego Obozu dostaj¹ po g³owie.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_02"); //Gdy walczy któryœ z nich przyjmujê wiêcej zak³adów, a to dobrze wp³ywa na interes!
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_03"); //Osobiœcie nienawidzê tych wieprzy z Nowego Obozu, ale w tych trudnych czasach ¿aden pieni¹dz nie œmierdzi...
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
	description = "Chcia³bym obstawiæ walkê.";
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
	AI_Output (other,self,"DIA_Scatty_WannaBet_15_00"); //Chcia³bym obstawiæ walkê.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_01"); //Przecie¿ teraz nikt nie walczy!
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_02"); //Najbli¿sza walka odbêdzie siê dopiero za kilka dni. Bêdzie og³oszenie!
	
};

// **************************************************
// 					Will Kämpfen
// **************************************************

INSTANCE DIA_Scatty_WannaFight (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaFight_Condition;
	information	= DIA_Scatty_WannaFight_Info;
	permanent	= 1;
	description = "Chcia³bym stoczyæ walkê na arenie.";
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
	AI_Output (other,self,"DIA_Scatty_WannaFight_15_00"); //Chcia³bym stoczyæ walkê na arenie.
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_01"); //Nie mogê ci pozwoliæ walczyæ, póki nie do³¹czysz do któregoœ z obozów.
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_02"); //Ludzi nie interesuj¹ niezale¿ni wojownicy.
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
	description = "Zajmujesz siê równie¿ szkoleniem wojowników?";
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
    B_LogEntry(GE_TeacherOC,"Scatty mo¿e mnie nauczyæ walki jednorêcznym orê¿em.");
    log_scattytrain = TRUE;
    };
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_00"); //Zajmujesz siê równie¿ szkoleniem wojowników?
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_01"); //Tak, ale nie za darmo. Jak chcesz, ¿ebym ciê czegoœ nauczy³, musisz zap³aciæ.


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
	AI_Output (other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Chcia³bym nauczyæ siê walki jednorêcznym orê¿em.
	
	if (Npc_HasItems(other,itminugget) >= 50)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_01"); //M¹dra decyzja. Jednak zanim poznasz bardziej zaawansowane techniki, powinieneœ nauczyæ siê prawid³owo trzymaæ orê¿ w rêku.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Pocz¹tkuj¹cy czêsto ³api¹ zwyk³y miecz obydwoma rêkami. Radzi³bym ci siê do tego nie przyzwyczajaæ, to fatalny nawyk. 
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Trzymaj broñ jedn¹ rêk¹, ostrzem do góry, i zacznij ni¹ machaæ.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Musisz siê nauczyæ, jak zgraæ twoje ruchy z bezw³adnoœci¹ orê¿a. Dziêki temu twoje ataki bêd¹ szybsze i bardziej zaskakuj¹ce.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Zapamiêtaj sobie dobrze, co ci powiedzia³em, a twój styl walki stanie siê o wiele bardziej elegancki i skuteczny.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_06"); //A, i jeszcze coœ! Niektóre ciosy powoduj¹ wiêksze obra¿enia ni¿ zwykle. Oczywiœcie, jako pocz¹tkuj¹cy masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Ale to siê zmieni w miarê czynienia przez ciebie postêpów.
			B_GiveInvItems(other,self,itminugget,50);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Nie masz wystarczaj¹cej iloœci rudy!
	};
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Naucz mnie sprawniej pos³ugiwaæ siê jednorêczn¹ broni¹.
	
	if (Npc_HasItems(other,itminugget) >= 150)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //Dobrze, podstawy ju¿ znasz. Nieznaczne opuszczenie broni zwiêkszy si³ê twojego pierwszego ciosu.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Musisz wykorzystaæ si³ê bezw³adnoœci, pamiêtasz? Œwietnie. Teraz nauczysz siê lepiej balansowaæ cia³em. Po zadaniu dwóch ciosów wykonaj obrót. To powinno zmyliæ twojego przeciwnika i pozwoliæ ci wyjœæ na dobr¹ pozycjê do nastêpnego ataku.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Wtedy wyprowadŸ nastêpne ciêcie z prawej strony...
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //I znowu do przodu. Pamiêtaj - trening czyni mistrza, wiêc najlepiej weŸ siê od razu do roboty!
			B_GiveInvItems(other,self,itminugget,150);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //Wróæ, gdy bêdziesz mia³ wystarczaj¹co du¿o rudy.
	};
};
