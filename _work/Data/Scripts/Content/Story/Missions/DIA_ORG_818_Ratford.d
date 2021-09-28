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
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_02"); //Chci tì varovat. Jestli pùjdeš dál touhle cestou, vstoupíš na naši loveckou pùdu.
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
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_01"); //Vìtšinou mrchorouty. Je z nich spousta masa. Kromì toho, není tak tìké je dostat... Kdy víš, jak na to.
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_02"); //Opravdu? A jak?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_03"); //Zeptej se tady mého pøítele Draxe - ví o tom víc ne kdokoliv jinı.
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
	description = "Proè je ta oblast tak nebezpeèná?";
};                       

FUNC int  Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhyDangerous_15_00"); //Proè je ta oblast tak nebezpeèná?
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_01"); //Právì jsi sem pøišel, viï? V kolonii jsou rùzné oblasti, které jsou více nebo ménì nebezpeèné.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_02"); //Cesty mezi tábory jsou docela bezpeèné. Ale i na nich ti mùou zkøíit cestu nìjací vlci, kteøí na tebe budou hledìt jako na snadnou koøist.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_03"); //A to právì do té doby, dokud nebudeš mít poøádnou zbraò a zbroj.
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
	description = "Kde dostanu lepší vıbavu?";
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
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_01"); //Nejblíe to bude ve Starém táboøe. Pøímo tahle cesta tì tam dovede.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_02"); //Ale v našem táboøe to dostaneš levnìji. Novı tábor - tam potkáš ty správné lidi.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_03"); //Jestli pùjdeš do Starého tábora, ptej se po Mordragovi. Je jedním z nás. Za trochu rudy ti prodá to správné zboí.
	
	Log_CreateTopic	(GE_TraderOC, LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Bandita Mordrag prodává ve Starém táboøe za pøijatelné ceny veškeré zboí.");
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
	description = "Povìz mi víc o oblastech v kolonii.";
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
	AI_Output (other, self,"Org_818_Ratford_MoreLocations_15_00"); //Povìz mi víc o oblastech v kolonii.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_01"); //Kdy cestuješ mezi tábory, musíš mít mapu, abys rozpoznal cesty a slepé stezky.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_02"); //Slepé stezky tì èasto dovedou do nebezpeènıch kaòonù, kde potkáš pøíšery, kterım je lepší se vyhnout.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_03"); //Nevcházej do starıch zøícenin. Je jich tu v okolí spousta. Vìtšina z nich se datuje do èasù první skøetí války. Nìkteré jsou opuštìná skøetí sídla.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_04"); //V tìchto zøíceninách bıvají èasto skøeti - nebo ještì horší pøíšery. Tìmhle místùm bych se vyhıbal, obzvláš v noci.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_05"); //A ještì jedna rada - nechoï do lesa!
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
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_01"); //Zeptej se lidí ve Starém táboøe, ije tam jeden kartograf.
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_02"); //Moná se ti podaøí nìjakou z jeho map ukrást! Jestli se ti to podaøí, vezmi také jednu pro mì!
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice   (Org_818_Ratford_WoKarte,"Jestli se mi je podaøí vzít bez placení, vezmu jich tolik, kolik unesu!",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice	 (Org_818_Ratford_WoKarte,"Proè? On neprodává mapy?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //Jestli se mi je podaøí vzít bez placení, vezmu jich tolik, kolik unesu!
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //Líbíš se mi. Mìl by ses rozhodnout pro Novı tábor! Jestli tam pùjdeš, ptej se na Larese. Stará se o nové pøíchozí. Myslím, e pro tebe bude mít práci!
	
	VAR C_NPC Lares; Lares = Hlp_GetNpc(ORG_801_LARES);
	Lares.aivar[AIV_FINDABLE]=TRUE;
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //Proè? On neprodává mapy? 
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
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_01"); //Nemysli si, e se bude kadı chovat tak pøátelsky, mladej!
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_02"); //Novı pøíchozí ani nemusí mít zrovna narvané kapsy, ale nìkteøí tì zabijou tøeba jenom pro krumpáè.
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_04"); //Budu si to pamatovat.
};











