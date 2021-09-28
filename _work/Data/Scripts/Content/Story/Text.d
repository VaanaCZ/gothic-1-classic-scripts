// *****************************************************************************************
// Mobsi-Fokusnamen
// *****************************************************************************************

CONST STRING MOBNAME_BACKPACK_1		= "";
CONST STRING MOBNAME_CRATE			= "Skrzynia";
CONST STRING MOBNAME_CHEST			= "Skrzynia";
CONST STRING MOBNAME_BED			= "£ó¿ko";
CONST STRING MOBNAME_DOOR			= "Drzwi";
CONST STRING MOBNAME_CAMP			= "";
CONST STRING MOBNAME_TORCH			= "";
CONST STRING MOBNAME_TORCHHOLDER	= "";
CONST STRING MOBNAME_BARBQ_SCAV		= "";
CONST STRING MOBNAME_BARRELO_OC		= "";
CONST STRING MOBNAME_BENCH			= "";
CONST STRING MOBNAME_ANVIL			= "Kowad³o";
CONST STRING MOBNAME_BUCKET			= "Wiadro wody";
CONST STRING MOBNAME_FORGE			= "Palenisko";
CONST STRING MOBNAME_GRINDSTONE		= "Kamieñ szlifierski";
CONST STRING MOBNAME_WHEEL			= "Ko³owrót";
CONST STRING MOBNAME_LAB			= "";
CONST STRING MOBNAME_BOOK			= "";
CONST STRING MOBNAME_CHAIR			= "";
CONST STRING MOBNAME_CAULDRON		= "Kocio³";
CONST STRING MOBNAME_THRONE			= "";
CONST STRING MOBNAME_PAN			= "Patelnia";
CONST STRING MOBNAME_REPAIR			= "";
CONST STRING MOBNAME_WATERPIPE		= "Fajka wodna";
CONST STRING MOBNAME_LADDER			= "Drabina";
CONST STRING MOBNAME_SWITCH			= "Prze³¹cznik";
CONST STRING MOBNAME_BARONSTHRONE	= "";
CONST STRING MOBNAME_ORE			= "Bry³ka rudy";
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
	"Stra¿nik",
	"Cieñ",
	"Mag Ognia",
	"Kopacz",
	"Mag Wody",
	"Najemnik",
	"Szkodnik",
	"Zbieracz",
	"Kret",			// 10
	"Guru",
	"Nowicjusz",
	"Stra¿nik Œwi¹tynny",
	"Nekromanta",
	"Babka",
	"",
	"Jaszczur",			// 17
	"Œni¹cy",
	"Goblin",
	"Troll",
	"Zêbacz",
	"Pe³zacz",
	"Chrz¹szcz",
	"Œcierwojad",
	"Demon",
	"Wilk",
	"Cieniostwór",
	"Krwiopijca",
	"W¹¿ b³otny",			// 30
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
	"Œwiat³o",					// SPL_LIGHT		=	0;
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
	"Pierœcieñ œmierci",				// SPL_MASSDEATH	=	14;
	"Kontrola",				// SPL_CONTROL		=	15;
	"Œmieræ o¿ywieñcom",		// SPL_DESTROYUNDEAD=	16;
	"Ognisty pocisk",				// SPL_FIREBOLT		=	17;
	"Ognista burza",				// SPL_FIRESTORM	=	18;
	"Deszcz ognia",				// SPL_FIRERAIN		=	19;
	"n/a",						// SPL_SPEED		=	20;
	"Teleport, Magowie Ognia",		// SPL_TELEPORT1	=	21;
	"Teleport, Magowie Wody",	// SPL_TELEPORT2	=	22;
	"Teleport, Nekromanta",	// SPL_TELEPORT3	=	23;
	"Teleport, Orkowie",		// SPL_TELEPORT4	=	24;
	"Teleport, Bractwo",		// SPL_TELEPORT5	=	25;
	"Przemiana w krwiopijcê",	// SPL_TRF_BLOODFLY	=	26;
	"n/a",						// SPL_TRF_BLOODHOUND=	27;
	"Przemiana w pe³zacza",	// SPL_TRF_CRAWLER	=	28;
	"Przemiana w topielca",		// SPL_TRF_LURKER	=	29;
	"Przemiana w chrz¹szcza",	// SPL_TRF_MEATBUG	=	30;
	"Przemiana w kretoszczura",		// SPL_TRF_MOLERAT	=	31;
	"Przemiana w orkowego psa",		// SPL_TRF_ORCDOG	=	32;
	"n/a",						// SPL_TRF_RAZOR	=	33;
	"Przemiana w œcierwojada",	// SPL_TRF_SCAVENGER=	34;
	"n/a",						// SPL_TRF_SCAVENGER2=	35;
	"Przemiana w cieniostwora",	// SPL_TRF_SHADOWBEAST=	36;
	"Przemiana w zêbacza",		// SPL_TRF_SNAPPER	=	37;
	"Przemiana w jaszczura",		// SPL_TRF_WARAN	=	38;
	"Przemiana w wilka",			// SPL_TRF_WOLF		=	39;
	"Grom",					// SPL_CHAINLIGHTNING=	40;
	"Sopel lodu",					// SPL_THUNDERBOLT	=	41;
	"Piorun kulisty",				// SPL_THUNDERBALL	=	42;
	"Bry³a lodu",					// SPL_ICECUBE		=	43;
	"Lodowa fala",					// SPL_ICEWAVE		=	44;
	"Przyzwanie golema",			// SPL_SUMMONGOLEM	=	45;
	"Armia Ciemnoœci",		// SPL_ARMYOFDARKNESS=	46;
	"Uderzenie burzy",				// SPL_STORMFIST	=	47;
	"n/a",						// SPL_TELEKINESIS2	=	48;
	"Tchnienie Œmierci",				// SPL_BREATHOFDEATH=	49;
	"Zmniejszenie potwora",				// SPL_SHRINK		=	50;
	"n/a",						// SPL_UNDRESS		=	51;
	"n/a",						// SPL_DANCE		=	52;
	"Sza³",					// SPL_BERZERK		=	53;
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
	"Broñ jednorêczna",
	"Broñ dwurêczna",
	"£uk",
	"Kusza",
	"Otwieranie zamków",
	"Kradzie¿",
	"Magia",
	"Skradanie siê",
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
	"brak|Kr¹g 1|Kr¹g 2|Kr¹g 3|Kr¹g 4|Kr¹g 5|Kr¹g 6", //NPC_TALENT_MAGE         
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
	"Broñ",
	"Pancerz",
	"Magia",
	"Artefakty",
	"¯ywnoœæ",
	"Napoje",
	"Pisma",
	"Pozosta³e"
};


// ***************************************************************************************
// Fokusnamen der Ambient-NSCs
// ***************************************************************************************

CONST STRING NAME_Buddler		= "Kopacz";
CONST STRING NAME_Schatten		= "Cieñ";
CONST STRING NAME_ConvoiTraeger	= "Tragarz";
CONST STRING NAME_ConvoiWache	= "Stra¿nik";
CONST STRING NAME_Torwache		= "Stra¿nik bramy";
CONST STRING NAME_Brueckenwache	= "Stra¿nik mostu";
CONST STRING NAME_Gardist		= "Stra¿nik";
CONST STRING NAME_Bauer			= "Zbieracz";
CONST STRING NAME_Schlaeger		= "Bandzior";
CONST STRING NAME_Schuerfer		= "Kret";
CONST STRING NAME_Organisator	= "Szkodnik";
CONST STRING NAME_Soeldner		= "Najemnik";
CONST STRING NAME_Novize		= "Nowicjusz";
CONST STRING NAME_Templer		= "Stra¿nik Œwi¹tynny";
CONST STRING NAME_Raeuber		= "Bandzior";
CONST STRING NAME_Tuersteher	= "Wykidaj³o";

const string NAME_MadNovice		=	"Opêtany Nowicjusz";
const string NAME_MadTemplar	=	"Fanatyczny Stra¿nik";
const string NAME_MadTemplar2	=	"Apokaliptyczny Stra¿nik";


// *************************************************************
// DIALOG OPTIONEN
// *************************************************************

CONST STRING DIALOG_ENDE		= "KONIEC";
CONST STRING DIALOG_BACK		= "WSTECZ";
const string DIALOG_TRADE		= "HANDEL";

// *************************************************************
// FOKUSNAMEN DER ITEMS
// *************************************************************

const string NAME_Ring			= "Pierœcieñ";
const string NAME_Amulett		= "Amulet";
const string NAME_Trank			= "Napój";
const string NAME_Rune			= "Runa";
const string NAME_Spruchrolle	= "Zwój";


// *************************************************************
// TEXTE FÜR ITEM-BESCHREIBUNGEN IM INV.
// *************************************************************

const string NAME_Value			= "Wartoœæ:";

const string NAME_Mag_Circle	= "Kr¹g:";
const string NAME_Manakosten	= "Koszt mana: ";
const string NAME_ManakostenMax	= "Koszt mana (maks.):";
const string NAME_ManaPerSec	= "Mana/sek.";
const string NAME_Duration		= "Czas trwania (min.):";

const string NAME_Mana_needed	= "Wymagana mana:";
const string NAME_Str_needed	= "Wymagana si³a:";
const string NAME_Dex_needed	= "Wymagana zrêcznoœæ:";

const string NAME_Spell_Load	= "Zaklêcie odnawialne";
const string NAME_Spell_Invest	= "Zaklêcie inwestycyjne";

const string NAME_Dam_Edge		= "Obr. Broñ";
const string NAME_Dam_Point		= "Obr. Pociski";
const string NAME_Dam_Fire		= "Obr. Ogieñ";
const string NAME_Dam_Magic		= "Obr. Magia";
const string NAME_Dam_Fly		= "Obr. Burza";

const string NAME_Damage		= "Obra¿enia:";
const string NAME_PerMana		= "/mana:";
const string NAME_DamagePerSec	= "Obra¿enia/sek.:";

const string NAME_Prot_Edge		= "Ochrona przed broni¹:";
const string NAME_Prot_Point	= "Ochrona przed pociskami:";
const string NAME_Prot_Fire		= "Ochrona przed ogniem:";
const string NAME_Prot_Magic	= "Ochrona przed magi¹:";

const string NAME_Bonus_HP		= "Bonus P¯:";
const string NAME_Bonus_Mana	= "Bonus mana:";

const string NAME_Bonus_HpMax	= "Bonus do maks. P¯:";
const string NAME_Bonus_ManaMax	= "Bonus do maks. mana:";

const string NAME_Bonus_Dex		= "Bonus do zrêcznoœci:";
const string NAME_Bonus_Str		= "Bonus do si³y:";

const string NAME_OneHanded		= "Broñ jednorêczna";
const string NAME_TwoHanded		= "Broñ dwurêczna";

//----------------- MH: zusätzlich wegen FlexTranslate ---------------------

const string NAME_HealingPerMana = "Uzdrowienie/mana:"; 

const string NAME_BuyAttributeSTR = "Si³a +";
const string NAME_BuyAttributeDEX = "Zrêcznoœæ +";
const string NAME_BuyAttributeMAN = "Mana +";

// ***************************************************************************************
// sonstige Bildschirmausgaben
// ***************************************************************************************
const string NAME_XPGained			= "Doœwiadczenie +";			// bei jedem Erfahrungsgewinn
const string NAME_LevelUp			= "Kolejny poziom!";				// beim Stufenaufstieg

const string NAME_NewLogEntry		= "Nowy zapis w dzienniku";




//***************************************************************************************
// Stringkonstanten aus den G_FUNCTIONS
//***************************************************************************************
const string _STR_INVALID					= "(Nieznane)-"								;

const string _STR_ATTRIBUTE_HITPOINTS		= "P¯"									;
const string _STR_ATTRIBUTE_HITPOINTS_MAX	= "Maks. P¯"							;
const string _STR_ATTRIBUTE_MANA			= "pkt. Many"									;
const string _STR_ATTRIBUTE_MANA_MAX		= "pkt. Maks. Many"							;
const string _STR_ATTRIBUTE_STRENGTH		= "pkt. Si³y"								;
const string _STR_ATTRIBUTE_DEXTERITY		= "pkt. Zrêcznoœci"								;
const string _STR_ATTRIBUTE_MAGIC_CIRCLE	= "krêgu"								;

// Bildschirmausgabe, falls der Spieler eine Waffe anlegen will, für die ihm Attributspunkte fehlen
const string _STR_CANNOTUSE_PRE_PLAYER		= "Brakuje ci "						;
const string _STR_CANNOTUSE_POINTS			= " "									;
const string _STR_CANNOTUSE_LEVELS		    = " magii"									;
const string _STR_CANNOTUSE_POST			= " by u¿yæ tego przedmiotu."						;

// Bildschirmausgabe, falls ein NSC zu wenig Attributspunkte, für das Anlegen von Waffen hat (nur Debugzwecke!)
const string _STR_CANNOTUSE_PRE_NPC			= " ("												;
const string _STR_CANNOTUSE_POST_NPC		= ") brakuje "									;

// Bidschrimausgabe zum Thema Schloß öffnen/knacken
const string _STR_MESSAGE_INTERACT_NO_KEY	= "Brak klucza lub wytrycha.";
const string _STR_MESSAGE_PICKLOCK_SUCCESS	= "Brzmi nieŸle.";
const string _STR_MESSAGE_PICKLOCK_UNLOCK	= "Zamek zosta³ otwarty.";
const string _STR_MESSAGE_PICKLOCK_FAILURE	= "Cholera... Trzeba zacz¹æ od pocz¹tku.";
const string _STR_MESSAGE_PICKLOCK_BROKEN	= "Wytrych pêk³.";

// Bidschrimausgabe zum Thema Hebel/Winden
const string _STR_MESSAGE_OCLEVER_STUCKS	= "DŸwignia ani drgnie!"			;
const string _STR_MESSAGE_OCLEVER_MOVES		= "Statuetka przesuwa dŸwigniê."			;
const string _STR_MESSAGE_WHEEL_STUCKS		= "Ko³owrót siê zaci¹³!"					;

// Bidschrimausgabe beim storybedingten Transfer von Items
const string _STR_MESSAGE_ITEM_GIVEN		= " przedmiot oddany!"							;	//SPACE davor wichtig, weil Trennzeichen
const string _STR_MESSAGE_ITEM_TAKEN		= " przedmiot otrzymany!"							;
const string _STR_MESSAGE_ITEMS_GIVEN		= "Przedmioty oddane: "							;
const string _STR_MESSAGE_ITEMS_TAKEN		= "Przedmioty otrzymane: "						;
const string _STR_MESSAGE_ORE_GIVEN			= "Bry³ki oddane: "								;
const string _STR_MESSAGE_ORE_TAKEN			= "Bry³ki otrzymane: "							;

// Bidschrimausgabe fürs Tausch-Fenster
const string _STR_MESSAGE_TRADE_FAILURE		= "Twoje dobra nie s¹ tyle warte."	;

// GILDENAUFNAHMEBEDINGUNG (für die Funktion "B_PrintGuildCondition()" )
const string _STR_MESSAGE_Joincamp			=	"Warunek przyjêcia: Poziom "; 

// nicht beklaubare NSCs
const string _STR_MESSAGE_CANNOTSTEAL		=	"nie mo¿e zostaæ okradziony.";

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
const string NAME_BuyArmorPostfix	=	" bry³ek rudy)";	
const string NAME_LearnPrefix		=	" (";	
const string NAME_LearnMidfix		=	" bry³ek rudy, ";
const string NAME_LearnPostfixS		=	" pkt. umiejêtnoœci)";	
const string NAME_LearnPostfixP		=	" pkt. umiejêtnoœci)";	

const string NAME_LearnStrength_1	=	"Si³a +1";
const string NAME_LearnStrength_5	=	"Si³a +5";
const string NAME_LearnStrength_10	=	"Si³a +10";
const string NAME_LearnStrength_20	=	"Si³a +20";

const string NAME_LearnDexterity_1	=	"Zrêcznoœæ +1";
const string NAME_LearnDexterity_5	=	"Zrêcznoœæ +5";
const string NAME_LearnDexterity_10	=	"Zrêcznoœæ +10";
const string NAME_LearnDexterity_20	=	"Zrêcznoœæ +20";

const string NAME_LearnMana_1		=	"Mana +1";
const string NAME_LearnMana_5		=	"Mana +5";
const string NAME_LearnMana_10		=	"Mana +10";
const string NAME_LearnMana_20		=	"Mana +20";

const string NAME_Learn1h_1			=	"Broñ jednorêczna, poziom 1";
const string NAME_Learn1h_2			=	"Broñ jednorêczna, poziom 2";
const string NAME_Learn2h_1			=	"Broñ dwurêczna, poziom 1";
const string NAME_Learn2h_2			=	"Broñ dwurêczna, poziom 2";

const string NAME_LearnBow_1		=	"£uk, poziom 1";
const string NAME_LearnBow_2		=	"£uk, poziom 2";
const string NAME_LearnCrossbow_1	=	"Kusza, poziom 1";
const string NAME_LearnCrossbow_2	=	"Kusza, poziom 2";

const string NAME_LearnMage_1		=	"Pierwszy kr¹g magii";
const string NAME_LearnMage_2		=	"Drugi kr¹g magii";
const string NAME_LearnMage_3		=	"Trzeci kr¹g magii";
const string NAME_LearnMage_4		=	"Czwarty kr¹g magii";
const string NAME_LearnMage_5		=	"Pi¹ty kr¹g magii";
const string NAME_LearnMage_6		=	"Szósty kr¹g magii";

const string NAME_LearnPickpocket_1	=	"Kradzie¿, poziom 1";
const string NAME_LearnPickpocket_2	=	"Kradzie¿, poziom 2";
const string NAME_LearnPicklock_1	=	"Otwieranie zamków, poziom 1";
const string NAME_LearnPicklock_2	=	"Otwieranie zamków, poziom 2";

const string NAME_LearnAcrobat		=	"Akrobatyka";
const string NAME_LearnSneak		=	"Skradanie siê";

const string NAME_RaiseStrength		=	"Si³a +";
const string NAME_RaiseDexterity	=	"Zrêcznoœæ +";
const string NAME_RaiseStrDex		=	"Si³a i Zrêcznoœæ +";
const string NAME_RaiseManaMax		=	"Maksymalna mana +";
const string NAME_RaiseHealthMax	=	"Maksymalne P¯ +";

//---------------- MH: für B_BuildBuyArmorString ----------------------------

const string NAME_CorristoHighRobe	= 	"Mistrzu, chcia³bym nosiæ szatê Arcymaga Ognia.";
const string NAME_SaturasHighRobe	= 	"Szata Arcymaga";
const string NAME_DiegoHeavyShadows	=	"Ciê¿ka Zbroja Cienia. Broñ 40, Pociski 5, Ogieñ 20";
const string NAME_StoneHeavyGuards	= 	"Ciê¿ka Zbroja Stra¿nika. Broñ 70, Pociski 10, Ogieñ 35";
const string NAME_StoneGuards		= 	"Zbroja Stra¿nika. Broñ 55, Pociski 10, Ogieñ 25";
const string NAME_WolfBandits		= 	"Pancerz Szkodnika. Broñ 35, Pociski 5, Ogieñ 15"; 
const string NAME_WolfHeavyBandits	= 	"Ciê¿ki Pancerz Szkodnika. Broñ 40, Pociski 5, Ogieñ 20";
const string NAME_LeeMercs			= 	"Pancerz Najemnika. Broñ 55, Pociski 10, Ogieñ 25";
const string NAME_LeeHeavyMercs		= 	"Ciê¿ki Pancerz Najemnika. Broñ 70, Pociski 10, Ogieñ 35";
const string NAME_FiskLightDiggers	= 	"Lekkie Spodnie Kopacza. Broñ 10, Ogieñ 5";
const string NAME_FiskDiggers		= 	"Spodnie Kopacza. Broñ 15, Ogieñ 5";
const string NAME_GorNaTothHeavyTpl = 	"Ciê¿ka Zbroja Œwi¹tynna. Broñ 70, Pociski 10, Ogieñ 35";
const string NAME_GorNaTothTpl 		=	"Zbroja Œwi¹tynna. Broñ 55, Pociski 10, Ogieñ 25";
const string NAME_TorwachenPsiRock	=	"Przepaska. Broñ 15, Ogieñ 10";




// ***************************************************************************************
// Menuetext-Konstanten
// ***************************************************************************************
// Text, der erscheint, wenn eine Menueoption noch ein APPLY benoetigt (Aufloesung).
// Vermutlich kein Text notwendig, da durch Menuestruktur deutlich gemacht
const string MENU_TEXT_NEEDS_APPLY		= "";

// Text, der erscheint, wenn ein Restart des Spiels notwendig ist (Grafikkartebauswahl).
// Maximal ca. 60 Zeichen, da nur eine Zeile Platz!
const string MENU_TEXT_NEEDS_RESTART	= "Czêœæ zmian wejdzie w ¿ycie po zrestartowaniu komputera.";


//	TRADE MANAGER
//
const string STR_INFO_TRADE_ACCEPT						= "Przyjmij"			;
const string STR_INFO_TRADE_RESET						= "Odrzuæ"			;
const string STR_INFO_TRADE_EXIT						= "WSTECZ"			;