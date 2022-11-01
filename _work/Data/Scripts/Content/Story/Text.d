// *****************************************************************************************
// Mobsi-Fokusnamen
// *****************************************************************************************

CONST STRING MOBNAME_BACKPACK_1		= "";
CONST STRING MOBNAME_CRATE			= "Bedna";
CONST STRING MOBNAME_CHEST			= "Truhlice";
CONST STRING MOBNAME_BED			= "Lůžko";
CONST STRING MOBNAME_DOOR			= "Dveře";
CONST STRING MOBNAME_CAMP			= "";
CONST STRING MOBNAME_TORCH			= "";
CONST STRING MOBNAME_TORCHHOLDER	= "";
CONST STRING MOBNAME_BARBQ_SCAV		= "";
CONST STRING MOBNAME_BARRELO_OC		= "";
CONST STRING MOBNAME_BENCH			= "";
CONST STRING MOBNAME_ANVIL			= "Kovadlina";
CONST STRING MOBNAME_BUCKET			= "Nádoba na vodu";
CONST STRING MOBNAME_FORGE			= "Kovářská výheň";
CONST STRING MOBNAME_GRINDSTONE		= "Brus";
CONST STRING MOBNAME_WHEEL			= "Naviják";
CONST STRING MOBNAME_LAB			= "";
CONST STRING MOBNAME_BOOK			= "";
CONST STRING MOBNAME_CHAIR			= "";
CONST STRING MOBNAME_CAULDRON		= "Kotlík";
CONST STRING MOBNAME_THRONE			= "";
CONST STRING MOBNAME_PAN			= "Pánev";
CONST STRING MOBNAME_REPAIR			= "";
CONST STRING MOBNAME_WATERPIPE		= "Vodní dýmka";
CONST STRING MOBNAME_LADDER			= "Žebřík";
CONST STRING MOBNAME_SWITCH			= "Spínač";
CONST STRING MOBNAME_BARONSTHRONE	= "";
CONST STRING MOBNAME_ORE			= "Magický nuget";
CONST STRING MOBNAME_ROPEWAY		= "";
CONST STRING MOBNAME_STOMPER		= "";
CONST STRING MOBNAME_BELLOW			= "Měchy";
CONST STRING MOBNAME_STONEMILL		= "";
CONST STRING MOBNAME_ORC_MUMMY		= "Mumie";
CONST STRING MOBNAME_PILLAR			= "Sloup";
CONST STRING MOBNAME_BASKET_RICE	= "";
CONST STRING MOBNAME_DRUM			= "";
CONST STRING MOBNAME_GROUND_SLOT	= "n/a";
CONST STRING MOBNAME_HERB_PSI		= "Bylinná kaše";
CONST STRING MOBNAME_IDOL			= "Figurka";
CONST STRING MOBNAME_LEAN_WALL		= "";
CONST STRING MOBNAME_ORCDRUM		= "";
CONST STRING MOBNAME_TARGETSTONE	= "Terč";
CONST STRING MOBNAME_SHRINE			= "Skřetí relikviář se srdci";
CONST STRING MOBNAME_SWORDSTONE		= "Podivný relikviář";


// *****************************************************************************************
// Gildennamen
// *****************************************************************************************

CONST STRING TXT_GUILDS	[GIL_MAX] =	{
// - Charakterblatt (Text der Spielergilde)
// - Debuganzeige (Taste "G")
	"(nic)",
	"Rudobaron",
	"Strážce",
	"Stín",
	"Mág Ohně",
	"Kopáč",
	"Mág Vody",
	"Žoldák",
	"Bandita",
	"Rolník",
	"Rudař",			// 10
	"Guru",
	"Novic",
	"Templář",
	"Nekromant",
	"Dívka",
	"",
	"Ještěrka",			// 17
	"Spáč",
	"Goblin",
	"Trol",
	"Chňapavec",
	"Důlní červ",
	"Žravá štěnice",
	"Mrchožrout",
	"Demon",
	"Vlk",
	"Stínová šelma",
	"Krvavá moucha",
	"Močálový žralok",			// 30
	"Zombie",
	"Skřetí zombie",
	"Kostlivec",
	"Skřetí pes",
	"Krysokrt",
	"Golem",
	"Číhavec",
	"",				// 38
	"Skřetí šaman",
	"Skřetí bojovník",
	"Skřetí zvěd",
	"Skřetí otrok"
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
	"Světlo",					// SPL_LIGHT		=	0;
	"Ohnivá koule",				// SPL_FIREBALL		=	1;
	"n/a",						// SPL_TRANSFORM	=	2;
	"Strach",					// SPL_FEAR			=	3;
	"Uzdravení",					// SPL_HEAL			=	4;
	"n/a",						// SPL_LIGHTNING	=	5;
	"Vyvolání démona",			// SPL_SUMMONDEMON	=	6;
	"Vyvolání kostlivce",		// SPL_SUMMONSKELETON=	7;
	"n/a",						// SPL_FORGET		=	8;
	"Úder větru",				// SPL_WINDFIST		=	9;
	"Telekineze",				// SPL_TELEKINESIS	=	10;
	"Šarm",					// SPL_CHARM		=	11;
	"Spánek",					// SPL_SLEEP		=	12;
	"Pyrokineze",				// SPL_PYROKINESIS	=	13;
	"Kruh smrti",				// SPL_MASSDEATH	=	14;
	"Ovládnutí",				// SPL_CONTROL		=	15;
	"Smrt nemrtvému",		// SPL_DESTROYUNDEAD=	16;
	"Ohnivý šíp",				// SPL_FIREBOLT		=	17;
	"Ohnivá bouře",				// SPL_FIRESTORM	=	18;
	"Ohnivý déšť",				// SPL_FIRERAIN		=	19;
	"n/a",						// SPL_SPEED		=	20;
	"Teleport mága Ohně",		// SPL_TELEPORT1	=	21;
	"Teleport mága Vody",	// SPL_TELEPORT2	=	22;
	"Teleport nekromanta",	// SPL_TELEPORT3	=	23;
	"Skřetí teleport",		// SPL_TELEPORT4	=	24;
	"Teleport Tábora v bažinách",		// SPL_TELEPORT5	=	25;
	"Proměna v krvavou mouchu",	// SPL_TRF_BLOODFLY	=	26;
	"n/a",						// SPL_TRF_BLOODHOUND=	27;
	"Proměna v důlního červa",	// SPL_TRF_CRAWLER	=	28;
	"Proměna v číhavce",		// SPL_TRF_LURKER	=	29;
	"Proměna ve žravou štěnici",	// SPL_TRF_MEATBUG	=	30;
	"Proměna v krysokrta",		// SPL_TRF_MOLERAT	=	31;
	"Proměna v skřetího psa",		// SPL_TRF_ORCDOG	=	32;
	"n/a",						// SPL_TRF_RAZOR	=	33;
	"Proměna v mrchožrouta",	// SPL_TRF_SCAVENGER=	34;
	"n/a",						// SPL_TRF_SCAVENGER2=	35;
	"Proměna v stínovou šelmu",	// SPL_TRF_SHADOWBEAST=	36;
	"Proměna v chňapavce",		// SPL_TRF_SNAPPER	=	37;
	"Proměna v ještěrku",		// SPL_TRF_WARAN	=	38;
	"Proměna ve vlka",			// SPL_TRF_WOLF		=	39;
	"Blesk",					// SPL_CHAINLIGHTNING=	40;
	"Ledový šíp",					// SPL_THUNDERBOLT	=	41;
	"Kulový blesk",				// SPL_THUNDERBALL	=	42;
	"Ledový blok",					// SPL_ICECUBE		=	43;
	"Ledová vlna",					// SPL_ICEWAVE		=	44;
	"Vyvolání golema",			// SPL_SUMMONGOLEM	=	45;
	"Armáda Temnot",		// SPL_ARMYOFDARKNESS=	46;
	"Větrná pěst",				// SPL_STORMFIST	=	47;
	"n/a",						// SPL_TELEKINESIS2	=	48;
	"Dech smrti",				// SPL_BREATHOFDEATH=	49;
	"Zmenši nestvůru",				// SPL_SHRINK		=	50;
	"n/a",						// SPL_UNDRESS		=	51;
	"n/a",						// SPL_DANCE		=	52;
	"Berserk",					// SPL_BERZERK		=	53;
	"Hněv URIZIELU",			// SPL_NEW1			=	17;
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
	"Jednoruční meč",
	"Obouruční meč",
	"Luk",
	"Samostříl",
	"Otevírání zámků",
	"Vybírání kapes",
	"Magie",
	"Plížení",
	"Regenerace",
	"Mistr ohně",
	"Akrobacie"
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
	"začátečník|pokročilý|mistr",						//NPC_TALENT_1H          
	"začátečník|pokročilý|mistr",                       //NPC_TALENT_2H           
	"začátečník|pokročilý|mistr",                       //NPC_TALENT_BOW         
	"začátečník|pokročilý|mistr",                       //NPC_TALENT_CROSSBOW    
	"začátečník|pokročilý|mistr",                       //NPC_TALENT_PICKLOCK   
	"začátečník|pokročilý|mistr",                       //NPC_TALENT_PICKPOCKET
	"ne|Kruh 1|Kruh 2|Kruh 3|Kruh 4|Kruh 5|Kruh 6", //NPC_TALENT_MAGE         
	"Ne|Ano",                                              //NPC_TALENT_SNEAK       
	"|",                                      		        //NPC_TALENT_REGENERATE 
	"|",                                          		    //NPC_TALENT_FIREMASTER   
	"Ne|Ano"                                               //NPC_TALENT_ACROBAT      
};

// *****************************************************************************************
// Inventory-Kategorien
// *****************************************************************************************

CONST STRING TXT_INV_CAT [INV_CAT_MAX] = {
	"",
	"Zbraně",
	"Zbroj",
	"Magie",
	"Artefakty",
	"Jídlo",
	"Lektvary",
	"Rukopisy",
	"Různé"
};


// ***************************************************************************************
// Fokusnamen der Ambient-NSCs
// ***************************************************************************************

CONST STRING NAME_Buddler		= "Kopáč";
CONST STRING NAME_Schatten		= "Stín";
CONST STRING NAME_ConvoiTraeger	= "Nosič konvoje";
CONST STRING NAME_ConvoiWache	= "Strážce konvoje";
CONST STRING NAME_Torwache		= "Strážce brány";
CONST STRING NAME_Brueckenwache	= "Strážce mostu";
CONST STRING NAME_Gardist		= "Strážce";
CONST STRING NAME_Bauer			= "Rolník";
CONST STRING NAME_Schlaeger		= "Lupič";
CONST STRING NAME_Schuerfer		= "Rudař";
CONST STRING NAME_Organisator	= "Bandita";
CONST STRING NAME_Soeldner		= "Žoldák";
CONST STRING NAME_Novize		= "Novic";
CONST STRING NAME_Templer		= "Templář";
CONST STRING NAME_Raeuber		= "Lupič";
CONST STRING NAME_Tuersteher	= "Vyhazovač";

const string NAME_MadNovice		=	"Posedlý novic";
const string NAME_MadTemplar	=	"Fanatický templář";
const string NAME_MadTemplar2	=	"Apokalyptický templář";


// *************************************************************
// DIALOG OPTIONEN
// *************************************************************

CONST STRING DIALOG_ENDE		= "KONEC";
CONST STRING DIALOG_BACK		= "ZPĚT";
const string DIALOG_TRADE		= "(Obchoduj)";

// *************************************************************
// FOKUSNAMEN DER ITEMS
// *************************************************************

const string NAME_Ring			= "Prsten";
const string NAME_Amulett		= "Amulet";
const string NAME_Trank			= "Lektvar";
const string NAME_Rune			= "Runa";
const string NAME_Spruchrolle	= "Kouzelný svitek";


// *************************************************************
// TEXTE FÜR ITEM-BESCHREIBUNGEN IM INV.
// *************************************************************

const string NAME_Value			= "Cena:";

const string NAME_Mag_Circle	= "Kruh:";
const string NAME_Manakosten	= "Stojí magické energie:";
const string NAME_ManakostenMax	= "Stojí magické energie (max.):";
const string NAME_ManaPerSec	= "Mana za sek.";
const string NAME_Duration		= "Trvání (minuty)";

const string NAME_Mana_needed	= "Požadovaná mana:";
const string NAME_Str_needed	= "Požadovaná síla:";
const string NAME_Dex_needed	= "Požadovaná obratnost:";

const string NAME_Spell_Load	= "Obnovitelné kouzlo";
const string NAME_Spell_Invest	= "Jednorázové kouzlo";

const string NAME_Dam_Edge		= "Poškození zbraněmi";
const string NAME_Dam_Point		= "Poškození šípy";
const string NAME_Dam_Fire		= "Poškození ohněm";
const string NAME_Dam_Magic		= "Poškození magií";
const string NAME_Dam_Fly		= "Poškození bouří";

const string NAME_Damage		= "Poškození";
const string NAME_PerMana		= " (za manu)";
const string NAME_DamagePerSec	= "Poškození za s.";

const string NAME_Prot_Edge		= "Ochrana proti zbraním:";
const string NAME_Prot_Point	= "Ochrana proti šípům:";
const string NAME_Prot_Fire		= "Ochrana proti ohni:";
const string NAME_Prot_Magic	= "Ochrana proti magii:";

const string NAME_Bonus_HP		= "Bonus zdraví:";
const string NAME_Bonus_Mana	= "Bonus magické energie:";

const string NAME_Bonus_HpMax	= "Bonus pro maximum zdraví:";
const string NAME_Bonus_ManaMax	= "Bonus pro maximum magické energie:";

const string NAME_Bonus_Dex		= "Bonus obratnosti:";
const string NAME_Bonus_Str		= "Bonus síly:";

const string NAME_OneHanded		= "Jednoruční zbraň";
const string NAME_TwoHanded		= "Obouruční zbraň";

//----------------- MH: zusätzlich wegen FlexTranslate ---------------------

const string NAME_HealingPerMana = "Uzdravování za manu"; 

const string NAME_BuyAttributeSTR = "Síla +";
const string NAME_BuyAttributeDEX = "Obratnost +";
const string NAME_BuyAttributeMAN = "Mana +";

// ***************************************************************************************
// sonstige Bildschirmausgaben
// ***************************************************************************************
const string NAME_XPGained			= "Zkušenost +";			// bei jedem Erfahrungsgewinn
const string NAME_LevelUp			= "O úroveň výš!";				// beim Stufenaufstieg

const string NAME_NewLogEntry		= "Nový zápis do deníku";




//***************************************************************************************
// Stringkonstanten aus den G_FUNCTIONS
//***************************************************************************************
const string _STR_INVALID					= "(Neznámo)-"								;

const string _STR_ATTRIBUTE_HITPOINTS		= "Zdraví"									;
const string _STR_ATTRIBUTE_HITPOINTS_MAX	= "Maximum zdraví"							;
const string _STR_ATTRIBUTE_MANA			= "Mana"									;
const string _STR_ATTRIBUTE_MANA_MAX		= "Maximum many"							;
const string _STR_ATTRIBUTE_STRENGTH		= "Síla"								;
const string _STR_ATTRIBUTE_DEXTERITY		= "Obratnost"								;
const string _STR_ATTRIBUTE_MAGIC_CIRCLE	= "Kouzelný svitek"								;

// Bildschirmausgabe, falls der Spieler eine Waffe anlegen will, für die ihm Attributspunkte fehlen
const string _STR_CANNOTUSE_PRE_PLAYER		= "Nedostatek "						;
const string _STR_CANNOTUSE_POINTS			= " body"									;
const string _STR_CANNOTUSE_LEVELS		    = " úrovně"									;
const string _STR_CANNOTUSE_POST			= " pro použití této položky"						;

// Bildschirmausgabe, falls ein NSC zu wenig Attributspunkte, für das Anlegen von Waffen hat (nur Debugzwecke!)
const string _STR_CANNOTUSE_PRE_NPC			= " ("												;
const string _STR_CANNOTUSE_POST_NPC		= ") scházejí "									;

// Bidschrimausgabe zum Thema Schloß öffnen/knacken
const string _STR_MESSAGE_INTERACT_NO_KEY	= "Žádný paklíč ani klíč.";
const string _STR_MESSAGE_PICKLOCK_SUCCESS	= "To zní dobře.";
const string _STR_MESSAGE_PICKLOCK_UNLOCK	= "Zámek byl otevřen.";
const string _STR_MESSAGE_PICKLOCK_FAILURE	= "Sakra... a znova od začátku.";
const string _STR_MESSAGE_PICKLOCK_BROKEN	= "Paklíč se zlomil.";

// Bidschrimausgabe zum Thema Hebel/Winden
const string _STR_MESSAGE_OCLEVER_STUCKS	= "S tou pákou nejde vůbec pohnout."			;
const string _STR_MESSAGE_OCLEVER_MOVES		= "Ta soška pohybuje pákou."			;
const string _STR_MESSAGE_WHEEL_STUCKS		= "Naviják se zamotal."					;

// Bidschrimausgabe beim storybedingten Transfer von Items
const string _STR_MESSAGE_ITEM_GIVEN		= " položka předána!"							;	//SPACE davor wichtig, weil Trennzeichen
const string _STR_MESSAGE_ITEM_TAKEN		= " položka přijata!"							;
const string _STR_MESSAGE_ITEMS_GIVEN		= " položek předáno!"							;
const string _STR_MESSAGE_ITEMS_TAKEN		= " položek přijato!"						;
const string _STR_MESSAGE_ORE_GIVEN			= " ruda předána!"								;
const string _STR_MESSAGE_ORE_TAKEN			= " ruda přijata!"							;

// Bidschrimausgabe fürs Tausch-Fenster
const string _STR_MESSAGE_TRADE_FAILURE		= "Hodnota tvého zboží není dost velká."	;

// GILDENAUFNAHMEBEDINGUNG (für die Funktion "B_PrintGuildCondition()" )
const string _STR_MESSAGE_Joincamp			=	"Podmínka pro přijetí: Úroveň"; 

// nicht beklaubare NSCs
const string _STR_MESSAGE_CANNOTSTEAL		=	"Nelze ukrást.";

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
const string NAME_BuyArmorPostfix	=	" ruda)";	
const string NAME_LearnPrefix		=	" (";	
const string NAME_LearnMidfix		=	" ruda, ";
const string NAME_LearnPostfixS		=	" znalostní bod)";	
const string NAME_LearnPostfixP		=	" znalostních bodů)";	

const string NAME_LearnStrength_1	=	"Síla +1";
const string NAME_LearnStrength_5	=	"Síla +5";
const string NAME_LearnStrength_10	=	"Síla +10";
const string NAME_LearnStrength_20	=	"Síla +20";

const string NAME_LearnDexterity_1	=	"Obratnost +1";
const string NAME_LearnDexterity_5	=	"Obratnost +5";
const string NAME_LearnDexterity_10	=	"Obratnost +10";
const string NAME_LearnDexterity_20	=	"Obratnost +20";

const string NAME_LearnMana_1		=	"Mana +1";
const string NAME_LearnMana_5		=	"Mana +5";
const string NAME_LearnMana_10		=	"Mana +10";
const string NAME_LearnMana_20		=	"Mana +20";

const string NAME_Learn1h_1			=	"Jednoruční zbraň úroveň 1";
const string NAME_Learn1h_2			=	"Jednoruční zbraň úroveň 2";
const string NAME_Learn2h_1			=	"Obouruční zbraň úroveň 1";
const string NAME_Learn2h_2			=	"Obouruční zbraň úroveň 2";

const string NAME_LearnBow_1		=	"Luk Úroveň 1";
const string NAME_LearnBow_2		=	"Luk Úroveň 2";
const string NAME_LearnCrossbow_1	=	"Samostříl Úroveň 1";
const string NAME_LearnCrossbow_2	=	"Samostříl Úroveň 2";

const string NAME_LearnMage_1		=	"1. Kruh magie";
const string NAME_LearnMage_2		=	"2. Kruh magie";
const string NAME_LearnMage_3		=	"3. Kruh magie";
const string NAME_LearnMage_4		=	"4. Kruh magie";
const string NAME_LearnMage_5		=	"5. Kruh magie";
const string NAME_LearnMage_6		=	"6. Kruh magie";

const string NAME_LearnPickpocket_1	=	"Vybírání kapes Úroveň 1";
const string NAME_LearnPickpocket_2	=	"Vybírání kapes Úroveň 2";
const string NAME_LearnPicklock_1	=	"Otevírání zámků Úroveň 1";
const string NAME_LearnPicklock_2	=	"Otevírání zámků Úroveň 2";

const string NAME_LearnAcrobat		=	"Akrobacie";
const string NAME_LearnSneak		=	"Plížení";

const string NAME_RaiseStrength		=	"Síla +";
const string NAME_RaiseDexterity	=	"Obratnost +";
const string NAME_RaiseStrDex		=	"Síla a obratnost +";
const string NAME_RaiseManaMax		=	"Maximum magické energie +";
const string NAME_RaiseHealthMax	=	"Maximum zdraví +";

//---------------- MH: für B_BuildBuyArmorString ----------------------------

const string NAME_CorristoHighRobe	= 	"Mistře, rád bych oblékl vznešené roucho Ohně.";
const string NAME_SaturasHighRobe	= 	"Vznešené roucho";
const string NAME_DiegoHeavyShadows	=	"Těžká zbroj Stínů. Ochrana: Zbraně 40, Šípy 5, Oheň 20";
const string NAME_StoneHeavyGuards	= 	"Těžká zbroj stráže. Ochrana: Zbraně 70, Šípy 10, Oheň 35";
const string NAME_StoneGuards		= 	"Zbroj stráže. Ochrana: Zbraně 55, Šípy 10, Oheň 25";
const string NAME_WolfBandits		= 	"Zbroj bandity. Ochrana: Zbraně 35, Šípy 5, Oheň 15"; 
const string NAME_WolfHeavyBandits	= 	"Těžká zbroj bandity. Ochrana: Zbraně 40, Šípy 5, Oheň 20";
const string NAME_LeeMercs			= 	"Zbroj žoldáka. Ochrana: Zbraně 55, Šípy 10, Oheň 25";
const string NAME_LeeHeavyMercs		= 	"Těžká zbroj žoldáka. Ochrana: Zbraně 70, Šípy 10, Oheň 35";
const string NAME_FiskLightDiggers	= 	"Lehké kalhoty kopáče. Ochrana: Zbraně 10, Oheň 5";
const string NAME_FiskDiggers		= 	"Kalhoty kopáče. Ochrana: Zbraně 15, Oheň 5";
const string NAME_GorNaTothHeavyTpl = 	"Těžká zbroj templáře Ochrana: Zbraně 70, Šípy 10, Oheň 35";
const string NAME_GorNaTothTpl 		=	"Zbroj templáře Ochrana: Zbraně 55, Šípy 10, Oheň 25";
const string NAME_TorwachenPsiRock	=	"Bederní rouška. Ochrana: Zbraně 15, Oheň 10";




// ***************************************************************************************
// Menuetext-Konstanten
// ***************************************************************************************
// Text, der erscheint, wenn eine Menueoption noch ein APPLY benoetigt (Aufloesung).
// Vermutlich kein Text notwendig, da durch Menuestruktur deutlich gemacht
const string MENU_TEXT_NEEDS_APPLY		= "";

// Text, der erscheint, wenn ein Restart des Spiels notwendig ist (Grafikkartebauswahl).
// Maximal ca. 60 Zeichen, da nur eine Zeile Platz!
const string MENU_TEXT_NEEDS_RESTART	= "Některé změny v nastavení se projeví až po dalším spuštění.";

//
//	TRADE MANAGER
//
const string STR_INFO_TRADE_ACCEPT						= "Souhlasit"			;
const string STR_INFO_TRADE_RESET						= "Odmítnout"			;
const string STR_INFO_TRADE_EXIT						= "ZPĚT"			;

const string STR_BADENIXE = "Badenixe";

// ****************
// B_Kapitelwechsel
// ****************

const string KapWechsel_1			= "Kapitola 1"					;
const string KapWechsel_1_Text		= "Vítej do kolonie"			;
const string KapWechsel_2			= "Kapitola 2"					;
const string KapWechsel_2_Text		= "Hnízdo důlních červů"		;
const string KapWechsel_3			= "Kapitola 3"					;
const string KapWechsel_3_Text		= "Artefakty pradávných sil"	;
const string KapWechsel_4			= "Kapitola 4"					;
const string KapWechsel_4_Text		= "Xardas"						;
const string KapWechsel_5			= "Kapitola 5"					;
const string KapWechsel_5_Text		= "Strážci portálu"				;
const string KapWechsel_6			= "Kapitola 6"					;
const string KapWechsel_6_Text		= "Spáčovo doupě"				;
