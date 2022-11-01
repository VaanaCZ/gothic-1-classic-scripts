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
	AI_Output (other, self,"Org_818_Ratford_WrongWay_15_01"); //Co chceš?
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_02"); //Chci tě varovat. Jestli půjdeš dál touhle cestou, vstoupíš na naši loveckou půdu.
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
	description = "Co tady lovíte?";
};                       

FUNC int  Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhatGame_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_00"); //Co tady lovíte?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_01"); //Většinou mrchožrouty. Je z nich spousta masa. Kromě toho, není tak těžké je dostat... Když víš, jak na to.
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_02"); //Opravdu? A jak?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_03"); //Zeptej se tady mého přítele Draxe - ví o tom víc než kdokoliv jiný.
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
	description = "Proč je ta oblast tak nebezpečná?";
};                       

FUNC int  Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhyDangerous_15_00"); //Proč je ta oblast tak nebezpečná?
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_01"); //Právě jsi sem přišel, viď? V kolonii jsou různé oblasti, které jsou více nebo méně nebezpečné.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_02"); //Cesty mezi tábory jsou docela bezpečné. Ale i na nich ti můžou zkřížit cestu nějací vlci, kteří na tebe budou hledět jako na snadnou kořist.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_03"); //A to právě do té doby, dokud nebudeš mít pořádnou zbraň a zbroj.
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
	description = "Kde dostanu lepší výbavu?";
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
	AI_Output (other, self,"Org_818_Ratford_WoEquipment_15_00"); //Kde dostanu lepší vybavení?
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_01"); //Nejblíže to bude ve Starém táboře. Přímo tahle cesta tě tam dovede.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_02"); //Ale v našem táboře to dostaneš levněji. Nový tábor - tam potkáš ty správné lidi.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_03"); //Jestli půjdeš do Starého tábora, ptej se po Mordragovi. Je jedním z nás. Za trochu rudy ti prodá to správné zboží.
	
	Log_CreateTopic	(GE_TraderOC, LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Bandita Mordrag prodává ve Starém táboře za přijatelné ceny veškeré zboží.");
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
	description = "Pověz mi víc o oblastech v kolonii.";
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
	AI_Output (other, self,"Org_818_Ratford_MoreLocations_15_00"); //Pověz mi víc o oblastech v kolonii.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_01"); //Když cestuješ mezi tábory, musíš mít mapu, abys rozpoznal cesty a slepé stezky.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_02"); //Slepé stezky tě často dovedou do nebezpečných kaňonů, kde potkáš příšery, kterým je lepší se vyhnout.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_03"); //Nevcházej do starých zřícenin. Je jich tu v okolí spousta. Většina z nich se datuje do časů první skřetí války. Některé jsou opuštěná skřetí sídla.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_04"); //V těchto zříceninách bývají často skřeti - nebo ještě horší příšery. Těmhle místům bych se vyhýbal, obzvlášť v noci.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_05"); //A ještě jedna rada - nechoď do lesa!
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
	description = "Kde dostanu mapu?";
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
	AI_Output (other, self,"Org_818_Ratford_WoKarte_15_00"); //Kde dostanu mapu?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_01"); //Zeptej se lidí ve Starém táboře, žije tam jeden kartograf.
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_02"); //Možná se ti podaří nějakou z jeho map ukrást! Jestli se ti to podaří, vezmi také jednu pro mě!
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice   (Org_818_Ratford_WoKarte,"Jestli se mi je podaří vzít bez placení, vezmu jich tolik, kolik unesu!",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice	 (Org_818_Ratford_WoKarte,"Proč? On neprodává mapy?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //Jestli se mi je podaří vzít bez placení, vezmu jich tolik, kolik unesu!
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //Líbíš se mi. Měl by ses rozhodnout pro Nový tábor! Jestli tam půjdeš, ptej se na Larese. Stará se o nové příchozí. Myslím, že pro tebe bude mít práci!
	
	VAR C_NPC Lares; Lares = Hlp_GetNpc(ORG_801_LARES);
	Lares.aivar[AIV_FINDABLE]=TRUE;
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //Proč? On neprodává mapy? 
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //Jestli máš dost rudy, abys je zaplatil...
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
	description = "Díky za pomoc.";
};                       

FUNC int  Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Thanks_Info()
{
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_00"); //Díky za pomoc.
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_01"); //Nemysli si, že se bude každý chovat tak přátelsky, mladej!
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_02"); //Nový příchozí ani nemusí mít zrovna narvané kapsy, ale někteří tě zabijou třeba jenom pro krumpáč.
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_04"); //Budu si to pamatovat.
};











