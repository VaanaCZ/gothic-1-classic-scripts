// **************************************************
//						 EXIT 
// **************************************************

instance  Org_818_Ratford_Exit (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 999;
	condition	= Org_818_Ratford_Exit_Condition;
	information	= Org_818_Ratford_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_818_Ratford_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					Wrong Way
// **************************************************

instance  Org_818_Ratford_WrongWay (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WrongWay_Condition;
	information	= Org_818_Ratford_WrongWay_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_818_Ratford_WrongWay_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WrongWay_Info()
{
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_00"); //Hej, ty!
	AI_Output (other, self,"Org_818_Ratford_WrongWay_15_01"); //Czego chcesz?
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_02"); //Chcę cię ostrzec. Idąc dalej wejdziesz na nasze tereny łowieckie.
};

// **************************************************
//					Was jagt ihr
// **************************************************

instance  Org_818_Ratford_WhatGame (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhatGame_Condition;
	information	= Org_818_Ratford_WhatGame_Info;
	permanent	= 0;
	description = "Na co polujecie?";
};                       

FUNC int  Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhatGame_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_00"); //Na co polujecie?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_01"); //Głównie na ścierwojady. Da się je zjeść, no i nietrudno je zabić... Jeśli wie się jak to zrobić.
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_02"); //Naprawdę? Macie jakąś specjalną metodę?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_03"); //Zapytaj mojego kumpla, Draxa. Nikt nie wie więcej o ścierwojadach niż on.
};

// **************************************************
//					Warum gefährlich
// **************************************************

instance  Org_818_Ratford_WhyDangerous (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhyDangerous_Condition;
	information	= Org_818_Ratford_WhyDangerous_Info;
	permanent	= 0;
	description = "Dlaczego ten teren jest tak niebezpieczny?";
};                       

FUNC int  Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhyDangerous_15_00"); //Dlaczego ten teren jest tak niebezpieczny?
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_01"); //Jesteś tu nowy, co? W całej kolonii jest mnóstwo mniej lub bardziej niebezpiecznych miejsc.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_02"); //Ścieżki pomiędzy obozami są dość bezpieczne, ale nawet tam można natknąć się na stado wilków, które będą chciały zjeść cię na kolację.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_03"); //Dlatego lepiej nie ruszać się nigdzie bez odpowiedniego oręża i zbroi.
};

// **************************************************
//					Wo Ausrüstung
// **************************************************

instance  Org_818_Ratford_WoEquipment (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoEquipment_Condition;
	information	= Org_818_Ratford_WoEquipment_Info;
	permanent	= 0;
	description = "Skąd mogę wziąć lepsze wyposażenie?";
};                       

FUNC int  Org_818_Ratford_WoEquipment_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_WoEquipment_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoEquipment_15_00"); //Skąd mogę wziąć lepsze wyposażenie?
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_01"); //Najbliżej będzie pewnie Stary Obóz. Idź dalej tą samą ścieżką, na pewno trafisz.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_02"); //Ale lepsze ceny znajdziesz u nas - w Nowym Obozie. Oczywiście pod warunkiem, że znasz właściwych ludzi.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_03"); //Kiedy trafisz do Starego Obozu, poszukaj mężczyzny imieniem Mordrag. To jeden z naszych. Za kilka bryłek rudy można u niego kupić wiele wartościowych rzeczy.
	
	Log_CreateTopic	(GE_TraderOC, LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Szkodnik Mordrag handluje w Starym Obozie różnymi towarami. Ponoć ma bardzo przystępne ceny.");
};

// **************************************************
//					More Locations
// **************************************************

instance  Org_818_Ratford_MoreLocations (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_MoreLocations_Condition;
	information	= Org_818_Ratford_MoreLocations_Info;
	permanent	= 0;
	description = "Opowiedz mi jeszcze o kolonii.";
};                       

FUNC int  Org_818_Ratford_MoreLocations_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_MoreLocations_Info()
{
	AI_Output (other, self,"Org_818_Ratford_MoreLocations_15_00"); //Opowiedz mi jeszcze o kolonii.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_01"); //Jeśli zamierzasz podróżować między obozami, przyda ci się mapa z wszystkimi ścieżkami i ślepymi zaułkami.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_02"); //Niektóre ścieżki prowadzą do niebezpiecznych kanionów, gdzie można wpaść na istoty, na które... lepiej nie wpadać.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_03"); //Pod żadnym pozorem nie włócz się w pobliżu starych ruin. Większość z nich pamięta jeszcze pierwszą wojnę z Orkami. Niektóre są nawet pozostałościami po ich osiedlach.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_04"); //Często kręcą się tam Orkowie albo jeszcze gorsze poczwary. Na twoim miejscu unikałbym takich miejsc jak ognia. Zwłaszcza nocą.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_05"); //I jeszcze jedna rada - nie wchodź do lasu!
};

// **************************************************
//					Wo Karte?
// **************************************************

instance Org_818_Ratford_WoKarte (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoKarte_Condition;
	information	= Org_818_Ratford_WoKarte_Info;
	permanent	= 0;
	description = "Gdzie mogę zdobyć jakąś mapę?";
};                       

FUNC int Org_818_Ratford_WoKarte_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC void Org_818_Ratford_WoKarte_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_15_00"); //Gdzie mogę zdobyć jakąś mapę?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_01"); //Popytaj ludzi w Starym Obozie. Mieszka tam jeden kartograf. 
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_02"); //Może uda ci się gwizdnąć mu jakąś mapę. Przy okazji mógłbyś zwinąć także jedną dla mnie!
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice   (Org_818_Ratford_WoKarte,"Jeśli uda mi się zdobyć je bez płacenia, wezmę ile tylko dam radę udźwignąć!",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice	 (Org_818_Ratford_WoKarte,"Dlaczego? Jego mapy nie są na sprzedaż?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //Jeśli uda mi się zdobyć je bez płacenia, wezmę ile tylko dam radę udźwignąć!
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //Równy z ciebie gość! Powinieneś pomyśleć o dołączeniu do Nowego Obozu. Gdybyś kiedyś tam trafił, pytaj o Laresa. To on zajmuje się nowymi. Na pewno znajdzie dla ciebie jakieś zajęcie!
	
	VAR C_NPC Lares; Lares = Hlp_GetNpc(ORG_801_LARES);
	Lares.aivar[AIV_FINDABLE]=TRUE;
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //Dlaczego? Jego mapy nie są na sprzedaż? 
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //Jeśli stać cię na tak ogromny wydatek...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

// **************************************************
//						Danke
// **************************************************

instance  Org_818_Ratford_Thanks (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 888;
	condition	= Org_818_Ratford_Thanks_Condition;
	information	= Org_818_Ratford_Thanks_Info;
	permanent	= 0;
	description = "Dzięki za pomoc.";
};                       

FUNC int  Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Thanks_Info()
{
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_00"); //Dzięki za pomoc.
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_01"); //Tylko nie myśl, że wszyscy tutaj są tacy mili!
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_02"); //Niewiele można znaleźć w kieszeniach Nowego, ale w kolonii są ludzie, którzy rozłupaliby ci czaszkę za stary kilof.
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_04"); //Będę o tym pamiętał.
};











