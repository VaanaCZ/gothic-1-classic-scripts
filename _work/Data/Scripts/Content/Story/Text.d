// *****************************************************************************************
// Mobsi-Fokusnamen
// *****************************************************************************************

CONST STRING MOBNAME_BACKPACK_1		= "";
CONST STRING MOBNAME_CRATE			= "Skrzynia";
CONST STRING MOBNAME_CHEST			= "Skrzynia";
CONST STRING MOBNAME_BED			= "Łóżko";
CONST STRING MOBNAME_DOOR			= "Drzwi";
CONST STRING MOBNAME_CAMP			= "";
CONST STRING MOBNAME_TORCH			= "";
CONST STRING MOBNAME_TORCHHOLDER	= "";
CONST STRING MOBNAME_BARBQ_SCAV		= "";
CONST STRING MOBNAME_BARRELO_OC		= "";
CONST STRING MOBNAME_BENCH			= "";
CONST STRING MOBNAME_ANVIL			= "Kowadło";
CONST STRING MOBNAME_BUCKET			= "Wiadro wody";
CONST STRING MOBNAME_FORGE			= "Palenisko";
CONST STRING MOBNAME_GRINDSTONE		= "Kamień szlifierski";
CONST STRING MOBNAME_WHEEL			= "Kołowrót";
CONST STRING MOBNAME_LAB			= "";
CONST STRING MOBNAME_BOOK			= "";
CONST STRING MOBNAME_CHAIR			= "";
CONST STRING MOBNAME_CAULDRON		= "Kocioł";
CONST STRING MOBNAME_THRONE			= "";
CONST STRING MOBNAME_PAN			= "Patelnia";
CONST STRING MOBNAME_REPAIR			= "";
CONST STRING MOBNAME_WATERPIPE		= "Fajka wodna";
CONST STRING MOBNAME_LADDER			= "Drabina";
CONST STRING MOBNAME_SWITCH			= "Przełącznik";
CONST STRING MOBNAME_BARONSTHRONE	= "";
CONST STRING MOBNAME_ORE			= "Bryłka rudy";
CONST STRING MOBNAME_ROPEWAY		= "";
CONST STRING MOBNAME_STOMPER		= "";
CONST STRING MOBNAME_BELLOW			= "Miech";
CONST STRING MOBNAME_STONEMILL		= "";
CONST STRING MOBNAME_ORC_MUMMY		= "Mumia";
CONST STRING MOBNAME_PILLAR			= "Kolumna";
CONST STRING MOBNAME_BASKET_RICE	= "";
CONST STRING MOBNAME_DRUM			= "";
CONST STRING MOBNAME_GROUND_SLOT	= "n/a";
CONST STRING MOBNAME_HERB_PSI		= "Rozdrabniacz";
CONST STRING MOBNAME_IDOL			= "Figurka";
CONST STRING MOBNAME_LEAN_WALL		= "";
CONST STRING MOBNAME_ORCDRUM		= "";
CONST STRING MOBNAME_TARGETSTONE	= "Cel";
CONST STRING MOBNAME_SHRINE			= "Kaplica Serc";
CONST STRING MOBNAME_SWORDSTONE		= "Tajemnicza kapliczka";


// *****************************************************************************************
// Gildennamen
// *****************************************************************************************

CONST STRING TXT_GUILDS	[GIL_MAX] =	{
// - Charakterblatt (Text der Spielergilde)
// - Debuganzeige (Taste "G")
	"(brak)",
	"Magnat",
	"Strażnik",
	"Cień",
	"Mag Ognia",
	"Kopacz",
	"Mag Wody",
	"Najemnik",
	"Szkodnik",
	"Zbieracz",
	"Kret",			// 10
	"Guru",
	"Nowicjusz",
	"Strażnik Świątynny",
	"Nekromanta",
	"Babka",
	"",
	"Jaszczur",			// 17
	"Śniący",
	"Goblin",
	"Troll",
	"Zębacz",
	"Pełzacz",
	"Chrząszcz",
	"Ścierwojad",
	"Demon",
	"Wilk",
	"Cieniostwór",
	"Krwiopijca",
	"Wąż błotny",			// 30
	"Zombi",
	"Ork-Zombi",
	"Szkielet",
	"Orkowy pies",
	"Kretoszczur",
	"Golem",
	"Topielec",
	"",				// 38
	"Ork-Szaman",
	"Ork-Wojownik",
	"Ork-Zwiadowca",
	"Ork-Niewolnik"
};


// *****************************************************************************************
// Attribut-Beschreibungen
// *****************************************************************************************
/* SN: wird laut Bert nicht mehr benötigt. Ich kommentier es erst mal eine Version lang aus
const string TXT_ATTRIBUTE_DESC	[ATR_INDEX_MAX]	= {

	"HitpointDesc",
	"",
	"ManaDesc",
	"",
	"StrengthDesc",
	"DexterityDesc",
	"",
	""
};

"TXT_ATTRIBUTE_DESC" - Beschreibung	der	Attribute für CharScreen.
"TXT_FIGHT_TALENTS"	- Namen	der	Kampftalente
"TXT_FIGHT_TALENTS_DESC" - Beschreibung	der	Kampftalente für CharScreen.
"TXT_TALENTS" -	Namen der sonstigen	Talente
"TXT_TALENTS_DESC" - Beschreibung der Talente für CharScreen
"TXT_SPELLS_DESC" -	Beschreibung der Spells	für	CharScreen

Die	Reihenfolge	der	jeweiligen Texte könnt ihr der Konstantenreihenfolge aus
der	"constants.d" entnehmen, die hier auch mit dranhaengt und fuer
fehlerfreies (Test-)parsen benötigt	wird.
*/

// *****************************************************************************************
// Zauberspruchnamen
// *****************************************************************************************

CONST STRING TXT_SPELLS	[MAX_SPELL]	= {
	"Światło",					// SPL_LIGHT		=	0;
	"Kula ognia",				// SPL_FIREBALL		=	1;
	"n/a",						// SPL_TRANSFORM	=	2;
	"Strach",					// SPL_FEAR			=	3;
	"Uzdrowienie",					// SPL_HEAL			=	4;
	"n/a",						// SPL_LIGHTNING	=	5;
	"Przyzwanie demona",			// SPL_SUMMONDEMON	=	6;
	"Przyzwanie szkieletów",		// SPL_SUMMONSKELETON=	7;
	"n/a",						// SPL_FORGET		=	8;
	"Uderzenie wiatru",				// SPL_WINDFIST		=	9;
	"Telekineza",				// SPL_TELEKINESIS	=	10;
	"Urok",					// SPL_CHARM		=	11;
	"Sen",					// SPL_SLEEP		=	12;
	"Pirokineza",				// SPL_PYROKINESIS	=	13;
	"Pierścień śmierci",				// SPL_MASSDEATH	=	14;
	"Kontrola",				// SPL_CONTROL		=	15;
	"Śmierć ożywieńcom",		// SPL_DESTROYUNDEAD=	16;
	"Ognisty pocisk",				// SPL_FIREBOLT		=	17;
	"Ognista burza",				// SPL_FIRESTORM	=	18;
	"Deszcz ognia",				// SPL_FIRERAIN		=	19;
	"n/a",						// SPL_SPEED		=	20;
	"Teleport, Magowie Ognia",		// SPL_TELEPORT1	=	21;
	"Teleport, Magowie Wody",	// SPL_TELEPORT2	=	22;
	"Teleport, Nekromanta",	// SPL_TELEPORT3	=	23;
	"Teleport, Orkowie",		// SPL_TELEPORT4	=	24;
	"Teleport, Bractwo",		// SPL_TELEPORT5	=	25;
	"Przemiana w krwiopijcę",	// SPL_TRF_BLOODFLY	=	26;
	"n/a",						// SPL_TRF_BLOODHOUND=	27;
	"Przemiana w pełzacza",	// SPL_TRF_CRAWLER	=	28;
	"Przemiana w topielca",		// SPL_TRF_LURKER	=	29;
	"Przemiana w chrząszcza",	// SPL_TRF_MEATBUG	=	30;
	"Przemiana w kretoszczura",		// SPL_TRF_MOLERAT	=	31;
	"Przemiana w orkowego psa",		// SPL_TRF_ORCDOG	=	32;
	"n/a",						// SPL_TRF_RAZOR	=	33;
	"Przemiana w ścierwojada",	// SPL_TRF_SCAVENGER=	34;
	"n/a",						// SPL_TRF_SCAVENGER2=	35;
	"Przemiana w cieniostwora",	// SPL_TRF_SHADOWBEAST=	36;
	"Przemiana w zębacza",		// SPL_TRF_SNAPPER	=	37;
	"Przemiana w jaszczura",		// SPL_TRF_WARAN	=	38;
	"Przemiana w wilka",			// SPL_TRF_WOLF		=	39;
	"Grom",					// SPL_CHAINLIGHTNING=	40;
	"Sopel lodu",					// SPL_THUNDERBOLT	=	41;
	"Piorun kulisty",				// SPL_THUNDERBALL	=	42;
	"Bryła lodu",					// SPL_ICECUBE		=	43;
	"Lodowa fala",					// SPL_ICEWAVE		=	44;
	"Przyzwanie golema",			// SPL_SUMMONGOLEM	=	45;
	"Armia Ciemności",		// SPL_ARMYOFDARKNESS=	46;
	"Uderzenie burzy",				// SPL_STORMFIST	=	47;
	"n/a",						// SPL_TELEKINESIS2	=	48;
	"Tchnienie Śmierci",				// SPL_BREATHOFDEATH=	49;
	"Zmniejszenie potwora",				// SPL_SHRINK		=	50;
	"n/a",						// SPL_UNDRESS		=	51;
	"n/a",						// SPL_DANCE		=	52;
	"Szał",					// SPL_BERZERK		=	53;
	"Gniew Uriziela",			// SPL_NEW1			=	17;
	"New2",						// SPL_NEW2			=	18;
	"New3",						// SPL_NEW3			=	19;
	"New4",						// SPL_NEW4			=	20;
	"New5"						// SPL_NEW5			=	21;
 };

/* SN: wird laut Bert nicht mehr benötigt. Ich kommentier es erst mal eine Version lang aus
CONST STRING TXT_SPELLS_DESC [MAX_SPELL] = {
// FIXME: wo werden die benutzt?
	"LichtDescr",						// SPL_LIGHT		=	0;
	"FeuerballDescr",					// SPL_FIREBALL		=	1;
	"VerwandelnDescr",					// SPL_TRANSFORM	=	2;
	"FearDescr",						// SPL_FEAR			=	3;
	"HeilenDescr",						// SPL_HEAL			=	4;
	"BlitzDescr",						// SPL_LIGHTNING	=	5;
	"Dämon beschw.Descr",				// SPL_SUMMONDEMON	=	6;
	"Skelette beschw.Descr",			// SPL_SUMMONSKELETON=	7;
	"VergessenDescr",					// SPL_FORGET		=	8;
	"WindfaustDescr",					// SPL_WINDFIST		=	9;
	"TelekineseDescr",					// SPL_TELEKINESIS	=	10;
	"CharmDescr",						// SPL_CHARM		=	11;
	"SleepDescr",						// SPL_SLEEP		=	12;
	"PyrokinesisDescr",					// SPL_PYROKINESIS	=	13;
	"MassdeathDescr",					// SPL_MASSDEATH	=	14;
	"KontrolleDescr",					// SPL_CONTROL		=	15;
	"Untote	bannenDescr",				// SPL_DESTROYUNDEAD=	16;
	"FireboltDescr",					// SPL_FIREBOLT		=	17;
	"FireStormDescr",				// SPL_FIRESTORM	=	18;
	"FireRainDescr",					// SPL_FIRERAIN		=	19;
	"SpeedDescr",					// SPL_SPEED		=	20;
	"Teleport1Descr",				// SPL_TELEPORT1	=	21;
	"Teleport2Descr",				// SPL_TELEPORT2	=	22;
	"Teleport3Descr",				// SPL_TELEPORT3	=	23;
	"Teleport4Descr",				// SPL_TELEPORT4	=	24;
	"Teleport5Descr",				// SPL_TELEPORT5	=	25;
	"Transform BloodflyDescr",		// SPL_TRF_BLOODFLY	=	26;
	"Transform BloodhoundDescr",		// SPL_TRF_BLOODHOUND=	27;
	"Transform CrawlerDescr",		// SPL_TRF_CRAWLER	=	28;
	"Transform LurkerDescr",			// SPL_TRF_LURKER	=	29;
	"Transform MeatbugDescr",		// SPL_TRF_MEATBUG	=	30;
	"Transform MoleratDescr",		// SPL_TRF_MOLERAT	=	31;
	"Transform OrcDogDescr",			// SPL_TRF_ORCDOG	=	32;
	"Transform RazorDescr",			// SPL_TRF_RAZOR	=	33;
	"Transform ScavengerDescr",		// SPL_TRF_SCAVENGER=	34;
	"Transform Scavenger2Descr",		// SPL_TRF_SCAVENGER2=	35;
	"Transform ShadowbeastDescr",		// SPL_TRF_SHADOWBEAST=	36;
	"Transform SnapperDescr",		// SPL_TRF_SNAPPER	=	37;
	"Transform WaranDescr",			// SPL_TRF_WARAN	=	38;
	"Transform WolfDescr",			// SPL_TRF_WOLF		=	39;
	"ChainlightningDescr",			// SPL_CHAINLIGHTNING=	40;
	"TunderboltDescr",				// SPL_THUNDERBOLT	=	41;
	"ThunderballDescr",				// SPL_THUNDERBALL	=	42;
	"Ice CubeDescr",					// SPL_ICECUBE		=	43;
	"Ice WaveDescr",					// SPL_ICEWAVE		=	44;
	"Summon	GolemDescr",				// SPL_SUMMONGOLEM	=	45;
	"Army of DarknessDescr",			// SPL_ARMYOFDARKNESS=	46;
	"StormFistDescr",					// SPL_STORMFIST	=	47;
	"n/a",								// SPL_TELEKINESIS2	=	48;
	"Breath	of DeathDescr",				// SPL_BREATHOFDEATH=	49;
	"ShrinkDescr",						// SPL_SHRINK		=	50;
	"n/a",								// SPL_UNDRESS		=	51;
	"n/a",								// SPL_DANCE		=	52;
	"BerzerkDescr",						// SPL_BERZERK		=	53;
	"New1Descr",						// SPL_NEW1			=	17;
	"New2Descr",						// SPL_NEW2			=	18;
	"New3Descr",						// SPL_NEW3			=	19;
	"New4Descr",						// SPL_NEW4			=	20;
	"New5Descr"							// SPL_NEW5			=	21;
};
*/

								
// *****************************************************************************************
// Kampf-Talente
// *****************************************************************************************

CONST STRING TXT_TALENTS [NPC_TALENT_MAX] =	
{
	"",	
	"Broń jednoręczna",
	"Broń dwuręczna",
	"Łuk",
	"Kusza",
	"Otwieranie zamków",
	"Kradzież",
	"Magia",
	"Skradanie się",
	"Regeneracja",
	"Mistrz ognia",
	"Akrobatyka"
};

/* SN: wird laut Bert nicht mehr benötigt. Ich kommentier es erst mal eine Version lang aus
CONST STRING TXT_TALENTS_DESC [NPC_TALENT_MAX] = 
// FIXME: wo werden die benutzt?
{
	"",	
	"NPC_TALENT_1H",
	"NPC_TALENT_2H",
	"NPC_TALENT_BOW",
	"NPC_TALENT_CROSSBOW",
	"NPC_TALENT_PICKLOCK",
	"NPC_TALENT_PICKPOCKET",
	"NPC_TALENT_MAGE",
	"NPC_TALENT_SNEAK",
	"NPC_TALENT_REGENERATE",
	"NPC_TALENT_FIREMASTER",
	"NPC_TALENT_ACROBAT"
};
*/

CONST STRING TXT_TALENTS_SKILLS [NPC_TALENT_MAX] = 
{
	"",	
	"brak|adept|mistrz",						//NPC_TALENT_1H          
	"brak|adept|mistrz",                       //NPC_TALENT_2H           
	"brak|adept|mistrz",                       //NPC_TALENT_BOW         
	"brak|adept|mistrz",                       //NPC_TALENT_CROSSBOW    
	"brak|adept|mistrz",                       //NPC_TALENT_PICKLOCK   
	"brak|adept|mistrz",                       //NPC_TALENT_PICKPOCKET
	"brak|Krąg 1|Krąg 2|Krąg 3|Krąg 4|Krąg 5|Krąg 6", //NPC_TALENT_MAGE         
	"Nie|Tak",                                              //NPC_TALENT_SNEAK       
	"|",                                      		        //NPC_TALENT_REGENERATE 
	"|",                                          		    //NPC_TALENT_FIREMASTER   
	"Nie|Tak"                                               //NPC_TALENT_ACROBAT      
};

// *****************************************************************************************
// Inventory-Kategorien
// *****************************************************************************************

CONST STRING TXT_INV_CAT [INV_CAT_MAX] = {
	"",
	"Broń",
	"Pancerz",
	"Magia",
	"Artefakty",
	"Żywność",
	"Napoje",
	"Pisma",
	"Pozostałe"
};


// ***************************************************************************************
// Fokusnamen der Ambient-NSCs
// ***************************************************************************************

CONST STRING NAME_Buddler		= "Kopacz";
CONST STRING NAME_Schatten		= "Cień";
CONST STRING NAME_ConvoiTraeger	= "Tragarz";
CONST STRING NAME_ConvoiWache	= "Strażnik";
CONST STRING NAME_Torwache		= "Strażnik bramy";
CONST STRING NAME_Brueckenwache	= "Strażnik mostu";
CONST STRING NAME_Gardist		= "Strażnik";
CONST STRING NAME_Bauer			= "Zbieracz";
CONST STRING NAME_Schlaeger		= "Bandzior";
CONST STRING NAME_Schuerfer		= "Kret";
CONST STRING NAME_Organisator	= "Szkodnik";
CONST STRING NAME_Soeldner		= "Najemnik";
CONST STRING NAME_Novize		= "Nowicjusz";
CONST STRING NAME_Templer		= "Strażnik Świątynny";
CONST STRING NAME_Raeuber		= "Bandzior";
CONST STRING NAME_Tuersteher	= "Wykidajło";

const string NAME_MadNovice		=	"Opętany Nowicjusz";
const string NAME_MadTemplar	=	"Fanatyczny Strażnik";
const string NAME_MadTemplar2	=	"Apokaliptyczny Strażnik";


// *************************************************************
// DIALOG OPTIONEN
// *************************************************************

CONST STRING DIALOG_ENDE		= "KONIEC";
CONST STRING DIALOG_BACK		= "WSTECZ";
const string DIALOG_TRADE		= "HANDEL";

// *************************************************************
// FOKUSNAMEN DER ITEMS
// *************************************************************

const string NAME_Ring			= "Pierścień";
const string NAME_Amulett		= "Amulet";
const string NAME_Trank			= "Napój";
const string NAME_Rune			= "Runa";
const string NAME_Spruchrolle	= "Zwój";


// *************************************************************
// TEXTE FÜR ITEM-BESCHREIBUNGEN IM INV.
// *************************************************************

const string NAME_Value			= "Wartość:";

const string NAME_Mag_Circle	= "Krąg:";
const string NAME_Manakosten	= "Koszt mana: ";
const string NAME_ManakostenMax	= "Koszt mana (maks.):";
const string NAME_ManaPerSec	= "Mana/sek.";
const string NAME_Duration		= "Czas trwania (min.):";

const string NAME_Mana_needed	= "Wymagana mana:";
const string NAME_Str_needed	= "Wymagana siła:";
const string NAME_Dex_needed	= "Wymagana zręczność:";

const string NAME_Spell_Load	= "Zaklęcie odnawialne";
const string NAME_Spell_Invest	= "Zaklęcie inwestycyjne";

const string NAME_Dam_Edge		= "Obr. Broń";
const string NAME_Dam_Point		= "Obr. Pociski";
const string NAME_Dam_Fire		= "Obr. Ogień";
const string NAME_Dam_Magic		= "Obr. Magia";
const string NAME_Dam_Fly		= "Obr. Burza";

const string NAME_Damage		= "Obrażenia:";
const string NAME_PerMana		= "/mana:";
const string NAME_DamagePerSec	= "Obrażenia/sek.:";

const string NAME_Prot_Edge		= "Ochrona przed bronią:";
const string NAME_Prot_Point	= "Ochrona przed pociskami:";
const string NAME_Prot_Fire		= "Ochrona przed ogniem:";
const string NAME_Prot_Magic	= "Ochrona przed magią:";

const string NAME_Bonus_HP		= "Bonus PŻ:";
const string NAME_Bonus_Mana	= "Bonus mana:";

const string NAME_Bonus_HpMax	= "Bonus do maks. PŻ:";
const string NAME_Bonus_ManaMax	= "Bonus do maks. mana:";

const string NAME_Bonus_Dex		= "Bonus do zręczności:";
const string NAME_Bonus_Str		= "Bonus do siły:";

const string NAME_OneHanded		= "Broń jednoręczna";
const string NAME_TwoHanded		= "Broń dwuręczna";

//----------------- MH: zusätzlich wegen FlexTranslate ---------------------

const string NAME_HealingPerMana = "Uzdrowienie/mana:"; 

const string NAME_BuyAttributeSTR = "Siła +";
const string NAME_BuyAttributeDEX = "Zręczność +";
const string NAME_BuyAttributeMAN = "Mana +";

// ***************************************************************************************
// sonstige Bildschirmausgaben
// ***************************************************************************************
const string NAME_XPGained			= "Doświadczenie +";			// bei jedem Erfahrungsgewinn
const string NAME_LevelUp			= "Kolejny poziom!";				// beim Stufenaufstieg

const string NAME_NewLogEntry		= "Nowy zapis w dzienniku";




//***************************************************************************************
// Stringkonstanten aus den G_FUNCTIONS
//***************************************************************************************
const string _STR_INVALID					= "(Nieznane)-"								;

const string _STR_ATTRIBUTE_HITPOINTS		= "PŻ"									;
const string _STR_ATTRIBUTE_HITPOINTS_MAX	= "Maks. PŻ"							;
const string _STR_ATTRIBUTE_MANA			= "pkt. Many"									;
const string _STR_ATTRIBUTE_MANA_MAX		= "pkt. Maks. Many"							;
const string _STR_ATTRIBUTE_STRENGTH		= "pkt. Siły"								;
const string _STR_ATTRIBUTE_DEXTERITY		= "pkt. Zręczności"								;
const string _STR_ATTRIBUTE_MAGIC_CIRCLE	= "kręgu"								;

// Bildschirmausgabe, falls der Spieler eine Waffe anlegen will, für die ihm Attributspunkte fehlen
const string _STR_CANNOTUSE_PRE_PLAYER		= "Brakuje ci "						;
const string _STR_CANNOTUSE_POINTS			= " "									;
const string _STR_CANNOTUSE_LEVELS		    = " magii"									;
const string _STR_CANNOTUSE_POST			= " by użyć tego przedmiotu."						;

// Bildschirmausgabe, falls ein NSC zu wenig Attributspunkte, für das Anlegen von Waffen hat (nur Debugzwecke!)
const string _STR_CANNOTUSE_PRE_NPC			= " ("												;
const string _STR_CANNOTUSE_POST_NPC		= ") brakuje "									;

// Bidschrimausgabe zum Thema Schloß öffnen/knacken
const string _STR_MESSAGE_INTERACT_NO_KEY	= "Brak klucza lub wytrycha.";
const string _STR_MESSAGE_PICKLOCK_SUCCESS	= "Brzmi nieźle.";
const string _STR_MESSAGE_PICKLOCK_UNLOCK	= "Zamek został otwarty.";
const string _STR_MESSAGE_PICKLOCK_FAILURE	= "Cholera... Trzeba zacząć od początku.";
const string _STR_MESSAGE_PICKLOCK_BROKEN	= "Wytrych pękł.";

// Bidschrimausgabe zum Thema Hebel/Winden
const string _STR_MESSAGE_OCLEVER_STUCKS	= "Dźwignia ani drgnie!"			;
const string _STR_MESSAGE_OCLEVER_MOVES		= "Statuetka przesuwa dźwignię."			;
const string _STR_MESSAGE_WHEEL_STUCKS		= "Kołowrót się zaciął!"					;

// Bidschrimausgabe beim storybedingten Transfer von Items
const string _STR_MESSAGE_ITEM_GIVEN		= " przedmiot oddany!"							;	//SPACE davor wichtig, weil Trennzeichen
const string _STR_MESSAGE_ITEM_TAKEN		= " przedmiot otrzymany!"							;
const string _STR_MESSAGE_ITEMS_GIVEN		= "Przedmioty oddane: "							;
const string _STR_MESSAGE_ITEMS_TAKEN		= "Przedmioty otrzymane: "						;
const string _STR_MESSAGE_ORE_GIVEN			= "Bryłki oddane: "								;
const string _STR_MESSAGE_ORE_TAKEN			= "Bryłki otrzymane: "							;

// Bidschrimausgabe fürs Tausch-Fenster
const string _STR_MESSAGE_TRADE_FAILURE		= "Twoje dobra nie są tyle warte."	;

// GILDENAUFNAHMEBEDINGUNG (für die Funktion "B_PrintGuildCondition()" )
const string _STR_MESSAGE_Joincamp			=	"Warunek przyjęcia: Poziom "; 

// nicht beklaubare NSCs
const string _STR_MESSAGE_CANNOTSTEAL		=	"nie może zostać okradziony.";

// ***************************************************************************************
// Relative Y-Koordinaten für die Bildschirmausgabe (in % der aktuellen Bildhöhe)
// ***************************************************************************************
const int	_YPOS_MESSAGE_GIVEN				=	37;
const int	_YPOS_MESSAGE_TAKEN				=	40;
const int	_YPOS_MESSAGE_LOGENTRY			=	45;
const int	_YPOS_MESSAGE_XPGAINED			=	50;
const int	_YPOS_MESSAGE_LEVELUP			=	55;
const int 	_YPOS_MESSAGE_Joincamp			=	50;
const int	_YPOS_MESSAGE_PICKLOCK_SUCCESS	=	6;
const int	_YPOS_MESSAGE_PICKLOCK_UNLOCK	=	9;
const int	_YPOS_MESSAGE_PICKLOCK_FAILURE	=	12;
const int 	_YPOS_MESSAGE_PICKLOCK_BROKEN	=	15;
const int	_YPOS_MESSAGE_CANNOTSTEAL		=	6;


// ***************************************************************************************
// Zeitdauer der Bildschirmausgabe (in Sekunden)
// ***************************************************************************************
const int	_TIME_MESSAGE_GIVEN				=	4;
const int	_TIME_MESSAGE_TAKEN				=	4;
const int	_TIME_MESSAGE_LOGENTRY			=	4;
const int	_TIME_MESSAGE_XPGAINED			=	3;
const int	_TIME_MESSAGE_LEVELUP			=	5;
const int	_TIME_MESSAGE_RAISEATTRIBUTE	=	4;
const int	_TIME_MESSAGE_Joincamp			=	5;
const int	_TIME_MESSAGE_PICKLOCK			=	3;
const int	_TIME_MESSAGE_CANNOTSTEAL		=	2;


// ***************************************************************************************
// Zusammenbauen von Info_AddChoice()-Strings beim Kaufen/Lernen
// ***************************************************************************************
const string NAME_BuyArmorPrefix	=	" (";	
const string NAME_BuyArmorPostfix	=	" bryłek rudy)";	
const string NAME_LearnPrefix		=	" (";	
const string NAME_LearnMidfix		=	" bryłek rudy, ";
const string NAME_LearnPostfixS		=	" pkt. umiejętności)";	
const string NAME_LearnPostfixP		=	" pkt. umiejętności)";	

const string NAME_LearnStrength_1	=	"Siła +1";
const string NAME_LearnStrength_5	=	"Siła +5";
const string NAME_LearnStrength_10	=	"Siła +10";
const string NAME_LearnStrength_20	=	"Siła +20";

const string NAME_LearnDexterity_1	=	"Zręczność +1";
const string NAME_LearnDexterity_5	=	"Zręczność +5";
const string NAME_LearnDexterity_10	=	"Zręczność +10";
const string NAME_LearnDexterity_20	=	"Zręczność +20";

const string NAME_LearnMana_1		=	"Mana +1";
const string NAME_LearnMana_5		=	"Mana +5";
const string NAME_LearnMana_10		=	"Mana +10";
const string NAME_LearnMana_20		=	"Mana +20";

const string NAME_Learn1h_1			=	"Broń jednoręczna, poziom 1";
const string NAME_Learn1h_2			=	"Broń jednoręczna, poziom 2";
const string NAME_Learn2h_1			=	"Broń dwuręczna, poziom 1";
const string NAME_Learn2h_2			=	"Broń dwuręczna, poziom 2";

const string NAME_LearnBow_1		=	"Łuk, poziom 1";
const string NAME_LearnBow_2		=	"Łuk, poziom 2";
const string NAME_LearnCrossbow_1	=	"Kusza, poziom 1";
const string NAME_LearnCrossbow_2	=	"Kusza, poziom 2";

const string NAME_LearnMage_1		=	"Pierwszy krąg magii";
const string NAME_LearnMage_2		=	"Drugi krąg magii";
const string NAME_LearnMage_3		=	"Trzeci krąg magii";
const string NAME_LearnMage_4		=	"Czwarty krąg magii";
const string NAME_LearnMage_5		=	"Piąty krąg magii";
const string NAME_LearnMage_6		=	"Szósty krąg magii";

const string NAME_LearnPickpocket_1	=	"Kradzież, poziom 1";
const string NAME_LearnPickpocket_2	=	"Kradzież, poziom 2";
const string NAME_LearnPicklock_1	=	"Otwieranie zamków, poziom 1";
const string NAME_LearnPicklock_2	=	"Otwieranie zamków, poziom 2";

const string NAME_LearnAcrobat		=	"Akrobatyka";
const string NAME_LearnSneak		=	"Skradanie się";

const string NAME_RaiseStrength		=	"Siła +";
const string NAME_RaiseDexterity	=	"Zręczność +";
const string NAME_RaiseStrDex		=	"Siła i Zręczność +";
const string NAME_RaiseManaMax		=	"Maksymalna mana +";
const string NAME_RaiseHealthMax	=	"Maksymalne PŻ +";

//---------------- MH: für B_BuildBuyArmorString ----------------------------

const string NAME_CorristoHighRobe	= 	"Mistrzu, chciałbym nosić szatę Arcymaga Ognia.";
const string NAME_SaturasHighRobe	= 	"Szata Arcymaga";
const string NAME_DiegoHeavyShadows	=	"Ciężka Zbroja Cienia. Broń 40, Pociski 5, Ogień 20";
const string NAME_StoneHeavyGuards	= 	"Ciężka Zbroja Strażnika. Broń 70, Pociski 10, Ogień 35";
const string NAME_StoneGuards		= 	"Zbroja Strażnika. Broń 55, Pociski 10, Ogień 25";
const string NAME_WolfBandits		= 	"Pancerz Szkodnika. Broń 35, Pociski 5, Ogień 15"; 
const string NAME_WolfHeavyBandits	= 	"Ciężki Pancerz Szkodnika. Broń 40, Pociski 5, Ogień 20";
const string NAME_LeeMercs			= 	"Pancerz Najemnika. Broń 55, Pociski 10, Ogień 25";
const string NAME_LeeHeavyMercs		= 	"Ciężki Pancerz Najemnika. Broń 70, Pociski 10, Ogień 35";
const string NAME_FiskLightDiggers	= 	"Lekkie Spodnie Kopacza. Broń 10, Ogień 5";
const string NAME_FiskDiggers		= 	"Spodnie Kopacza. Broń 15, Ogień 5";
const string NAME_GorNaTothHeavyTpl = 	"Ciężka Zbroja Świątynna. Broń 70, Pociski 10, Ogień 35";
const string NAME_GorNaTothTpl 		=	"Zbroja Świątynna. Broń 55, Pociski 10, Ogień 25";
const string NAME_TorwachenPsiRock	=	"Przepaska. Broń 15, Ogień 10";




// ***************************************************************************************
// Menuetext-Konstanten
// ***************************************************************************************
// Text, der erscheint, wenn eine Menueoption noch ein APPLY benoetigt (Aufloesung).
// Vermutlich kein Text notwendig, da durch Menuestruktur deutlich gemacht
const string MENU_TEXT_NEEDS_APPLY		= "";

// Text, der erscheint, wenn ein Restart des Spiels notwendig ist (Grafikkartebauswahl).
// Maximal ca. 60 Zeichen, da nur eine Zeile Platz!
const string MENU_TEXT_NEEDS_RESTART	= "Część zmian wejdzie w życie po zrestartowaniu komputera.";


//	TRADE MANAGER
//
const string STR_INFO_TRADE_ACCEPT						= "Przyjmij"			;
const string STR_INFO_TRADE_RESET						= "Odrzuć"			;
const string STR_INFO_TRADE_EXIT						= "WSTECZ"			;