// *****************************************************************************************
// Mobsi-Fokusnamen
// *****************************************************************************************

CONST STRING MOBNAME_BACKPACK_1		= "";
CONST STRING MOBNAME_CRATE			= "Bedna";
CONST STRING MOBNAME_CHEST			= "Truhlice";
CONST STRING MOBNAME_BED			= "L˘ûko";
CONST STRING MOBNAME_DOOR			= "Dve¯e";
CONST STRING MOBNAME_CAMP			= "";
CONST STRING MOBNAME_TORCH			= "";
CONST STRING MOBNAME_TORCHHOLDER	= "";
CONST STRING MOBNAME_BARBQ_SCAV		= "";
CONST STRING MOBNAME_BARRELO_OC		= "";
CONST STRING MOBNAME_BENCH			= "";
CONST STRING MOBNAME_ANVIL			= "Kovadlina";
CONST STRING MOBNAME_BUCKET			= "N·doba na vodu";
CONST STRING MOBNAME_FORGE			= "Kov·¯sk· v˝heÚ";
CONST STRING MOBNAME_GRINDSTONE		= "Brus";
CONST STRING MOBNAME_WHEEL			= "Navij·k";
CONST STRING MOBNAME_LAB			= "";
CONST STRING MOBNAME_BOOK			= "";
CONST STRING MOBNAME_CHAIR			= "";
CONST STRING MOBNAME_CAULDRON		= "KotlÌk";
CONST STRING MOBNAME_THRONE			= "";
CONST STRING MOBNAME_PAN			= "P·nev";
CONST STRING MOBNAME_REPAIR			= "";
CONST STRING MOBNAME_WATERPIPE		= "VodnÌ d˝mka";
CONST STRING MOBNAME_LADDER			= "éeb¯Ìk";
CONST STRING MOBNAME_SWITCH			= "SpÌnaË";
CONST STRING MOBNAME_BARONSTHRONE	= "";
CONST STRING MOBNAME_ORE			= "Magick˝ nuget";
CONST STRING MOBNAME_ROPEWAY		= "";
CONST STRING MOBNAME_STOMPER		= "";
CONST STRING MOBNAME_BELLOW			= "MÏchy";
CONST STRING MOBNAME_STONEMILL		= "";
CONST STRING MOBNAME_ORC_MUMMY		= "Mumie";
CONST STRING MOBNAME_PILLAR			= "Sloup";
CONST STRING MOBNAME_BASKET_RICE	= "";
CONST STRING MOBNAME_DRUM			= "";
CONST STRING MOBNAME_GROUND_SLOT	= "n/a";
CONST STRING MOBNAME_HERB_PSI		= "Bylinn· kaöe";
CONST STRING MOBNAME_IDOL			= "Figurka";
CONST STRING MOBNAME_LEAN_WALL		= "";
CONST STRING MOBNAME_ORCDRUM		= "";
CONST STRING MOBNAME_TARGETSTONE	= "TerË";
CONST STRING MOBNAME_SHRINE			= "Sk¯etÌ relikvi·¯ se srdci";
CONST STRING MOBNAME_SWORDSTONE		= "Podivn˝ relikvi·¯";


// *****************************************************************************************
// Gildennamen
// *****************************************************************************************

CONST STRING TXT_GUILDS	[GIL_MAX] =	{
// - Charakterblatt (Text der Spielergilde)
// - Debuganzeige (Taste "G")
	"(nic)",
	"Rudobaron",
	"Str·ûce",
	"StÌn",
	"M·g OhnÏ",
	"Kop·Ë",
	"M·g Vody",
	"éold·k",
	"Bandita",
	"RolnÌk",
	"Ruda¯",			// 10
	"Guru",
	"Novic",
	"Templ·¯",
	"Nekromant",
	"DÌvka",
	"",
	"JeötÏrka",			// 17
	"Sp·Ë",
	"Goblin",
	"Trol",
	"ChÚapavec",
	"D˘lnÌ Ëerv",
	"érav· ötÏnice",
	"Mrchoûrout",
	"Demon",
	"Vlk",
	"StÌnov· öelma",
	"Krvav· moucha",
	"MoË·lov˝ ûralok",			// 30
	"Zombie",
	"Sk¯etÌ zombie",
	"Kostlivec",
	"Sk¯etÌ pes",
	"Krysokrt",
	"Golem",
	"»Ìhavec",
	"",				// 38
	"Sk¯etÌ öaman",
	"Sk¯etÌ bojovnÌk",
	"Sk¯etÌ zvÏd",
	"Sk¯etÌ otrok"
};


// *****************************************************************************************
// Attribut-Beschreibungen
// *****************************************************************************************
/* SN: wird laut Bert nicht mehr benˆtigt. Ich kommentier es erst mal eine Version lang aus
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

"TXT_ATTRIBUTE_DESC" - Beschreibung	der	Attribute f¸r CharScreen.
"TXT_FIGHT_TALENTS"	- Namen	der	Kampftalente
"TXT_FIGHT_TALENTS_DESC" - Beschreibung	der	Kampftalente f¸r CharScreen.
"TXT_TALENTS" -	Namen der sonstigen	Talente
"TXT_TALENTS_DESC" - Beschreibung der Talente f¸r CharScreen
"TXT_SPELLS_DESC" -	Beschreibung der Spells	f¸r	CharScreen

Die	Reihenfolge	der	jeweiligen Texte kˆnnt ihr der Konstantenreihenfolge aus
der	"constants.d" entnehmen, die hier auch mit dranhaengt und fuer
fehlerfreies (Test-)parsen benˆtigt	wird.
*/

// *****************************************************************************************
// Zauberspruchnamen
// *****************************************************************************************

CONST STRING TXT_SPELLS	[MAX_SPELL]	= {
	"SvÏtlo",					// SPL_LIGHT		=	0;
	"Ohniv· koule",				// SPL_FIREBALL		=	1;
	"n/a",						// SPL_TRANSFORM	=	2;
	"Strach",					// SPL_FEAR			=	3;
	"UzdravenÌ",					// SPL_HEAL			=	4;
	"n/a",						// SPL_LIGHTNING	=	5;
	"Vyvol·nÌ dÈmona",			// SPL_SUMMONDEMON	=	6;
	"Vyvol·nÌ kostlivce",		// SPL_SUMMONSKELETON=	7;
	"n/a",						// SPL_FORGET		=	8;
	"⁄der vÏtru",				// SPL_WINDFIST		=	9;
	"Telekineze",				// SPL_TELEKINESIS	=	10;
	"äarm",					// SPL_CHARM		=	11;
	"Sp·nek",					// SPL_SLEEP		=	12;
	"Pyrokineze",				// SPL_PYROKINESIS	=	13;
	"Kruh smrti",				// SPL_MASSDEATH	=	14;
	"Ovl·dnutÌ",				// SPL_CONTROL		=	15;
	"Smrt nemrtvÈmu",		// SPL_DESTROYUNDEAD=	16;
	"Ohniv˝ öÌp",				// SPL_FIREBOLT		=	17;
	"Ohniv· bou¯e",				// SPL_FIRESTORM	=	18;
	"Ohniv˝ dÈöù",				// SPL_FIRERAIN		=	19;
	"n/a",						// SPL_SPEED		=	20;
	"Teleport m·ga OhnÏ",		// SPL_TELEPORT1	=	21;
	"Teleport m·ga Vody",	// SPL_TELEPORT2	=	22;
	"Teleport nekromanta",	// SPL_TELEPORT3	=	23;
	"Sk¯etÌ teleport",		// SPL_TELEPORT4	=	24;
	"Teleport T·bora v baûin·ch",		// SPL_TELEPORT5	=	25;
	"PromÏna v krvavou mouchu",	// SPL_TRF_BLOODFLY	=	26;
	"n/a",						// SPL_TRF_BLOODHOUND=	27;
	"PromÏna v d˘lnÌho Ëerva",	// SPL_TRF_CRAWLER	=	28;
	"PromÏna v ËÌhavce",		// SPL_TRF_LURKER	=	29;
	"PromÏna ve ûravou ötÏnici",	// SPL_TRF_MEATBUG	=	30;
	"PromÏna v krysokrta",		// SPL_TRF_MOLERAT	=	31;
	"PromÏna v sk¯etÌho psa",		// SPL_TRF_ORCDOG	=	32;
	"n/a",						// SPL_TRF_RAZOR	=	33;
	"PromÏna v mrchoûrouta",	// SPL_TRF_SCAVENGER=	34;
	"n/a",						// SPL_TRF_SCAVENGER2=	35;
	"PromÏna v stÌnovou öelmu",	// SPL_TRF_SHADOWBEAST=	36;
	"PromÏna v chÚapavce",		// SPL_TRF_SNAPPER	=	37;
	"PromÏna v jeötÏrku",		// SPL_TRF_WARAN	=	38;
	"PromÏna ve vlka",			// SPL_TRF_WOLF		=	39;
	"Blesk",					// SPL_CHAINLIGHTNING=	40;
	"Ledov˝ öÌp",					// SPL_THUNDERBOLT	=	41;
	"Kulov˝ blesk",				// SPL_THUNDERBALL	=	42;
	"Ledov˝ blok",					// SPL_ICECUBE		=	43;
	"Ledov· vlna",					// SPL_ICEWAVE		=	44;
	"Vyvol·nÌ golema",			// SPL_SUMMONGOLEM	=	45;
	"Arm·da Temnot",		// SPL_ARMYOFDARKNESS=	46;
	"VÏtrn· pÏst",				// SPL_STORMFIST	=	47;
	"n/a",						// SPL_TELEKINESIS2	=	48;
	"Dech smrti",				// SPL_BREATHOFDEATH=	49;
	"Zmenöi nestv˘ru",				// SPL_SHRINK		=	50;
	"n/a",						// SPL_UNDRESS		=	51;
	"n/a",						// SPL_DANCE		=	52;
	"Berserk",					// SPL_BERZERK		=	53;
	"HnÏv URIZIELU",			// SPL_NEW1			=	17;
	"New2",						// SPL_NEW2			=	18;
	"New3",						// SPL_NEW3			=	19;
	"New4",						// SPL_NEW4			=	20;
	"New5"						// SPL_NEW5			=	21;
 };

/* SN: wird laut Bert nicht mehr benˆtigt. Ich kommentier es erst mal eine Version lang aus
CONST STRING TXT_SPELLS_DESC [MAX_SPELL] = {
// FIXME: wo werden die benutzt?
	"LichtDescr",						// SPL_LIGHT		=	0;
	"FeuerballDescr",					// SPL_FIREBALL		=	1;
	"VerwandelnDescr",					// SPL_TRANSFORM	=	2;
	"FearDescr",						// SPL_FEAR			=	3;
	"HeilenDescr",						// SPL_HEAL			=	4;
	"BlitzDescr",						// SPL_LIGHTNING	=	5;
	"D‰mon beschw.Descr",				// SPL_SUMMONDEMON	=	6;
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
	"JednoruËnÌ meË",
	"ObouruËnÌ meË",
	"Luk",
	"Samost¯Ìl",
	"OtevÌr·nÌ z·mk˘",
	"VybÌr·nÌ kapes",
	"Magie",
	"PlÌûenÌ",
	"Regenerace",
	"Mistr ohnÏ",
	"Akrobacie"
};

/* SN: wird laut Bert nicht mehr benˆtigt. Ich kommentier es erst mal eine Version lang aus
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
	"zaË·teËnÌk|pokroËil˝|mistr",						//NPC_TALENT_1H          
	"zaË·teËnÌk|pokroËil˝|mistr",                       //NPC_TALENT_2H           
	"zaË·teËnÌk|pokroËil˝|mistr",                       //NPC_TALENT_BOW         
	"zaË·teËnÌk|pokroËil˝|mistr",                       //NPC_TALENT_CROSSBOW    
	"zaË·teËnÌk|pokroËil˝|mistr",                       //NPC_TALENT_PICKLOCK   
	"zaË·teËnÌk|pokroËil˝|mistr",                       //NPC_TALENT_PICKPOCKET
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
	"ZbranÏ",
	"Zbroj",
	"Magie",
	"Artefakty",
	"JÌdlo",
	"Lektvary",
	"Rukopisy",
	"R˘znÈ"
};


// ***************************************************************************************
// Fokusnamen der Ambient-NSCs
// ***************************************************************************************

CONST STRING NAME_Buddler		= "Kop·Ë";
CONST STRING NAME_Schatten		= "StÌn";
CONST STRING NAME_ConvoiTraeger	= "NosiË konvoje";
CONST STRING NAME_ConvoiWache	= "Str·ûce konvoje";
CONST STRING NAME_Torwache		= "Str·ûce br·ny";
CONST STRING NAME_Brueckenwache	= "Str·ûce mostu";
CONST STRING NAME_Gardist		= "Str·ûce";
CONST STRING NAME_Bauer			= "RolnÌk";
CONST STRING NAME_Schlaeger		= "LupiË";
CONST STRING NAME_Schuerfer		= "Ruda¯";
CONST STRING NAME_Organisator	= "Bandita";
CONST STRING NAME_Soeldner		= "éold·k";
CONST STRING NAME_Novize		= "Novic";
CONST STRING NAME_Templer		= "Templ·¯";
CONST STRING NAME_Raeuber		= "LupiË";
CONST STRING NAME_Tuersteher	= "VyhazovaË";

const string NAME_MadNovice		=	"Posedl˝ novic";
const string NAME_MadTemplar	=	"Fanatick˝ templ·¯";
const string NAME_MadTemplar2	=	"Apokalyptick˝ templ·¯";


// *************************************************************
// DIALOG OPTIONEN
// *************************************************************

CONST STRING DIALOG_ENDE		= "KONEC";
CONST STRING DIALOG_BACK		= "ZPÃT";
const string DIALOG_TRADE		= "(Obchoduj)";

// *************************************************************
// FOKUSNAMEN DER ITEMS
// *************************************************************

const string NAME_Ring			= "Prsten";
const string NAME_Amulett		= "Amulet";
const string NAME_Trank			= "Lektvar";
const string NAME_Rune			= "Runa";
const string NAME_Spruchrolle	= "Kouzeln˝ svitek";


// *************************************************************
// TEXTE F‹R ITEM-BESCHREIBUNGEN IM INV.
// *************************************************************

const string NAME_Value			= "Cena:";

const string NAME_Mag_Circle	= "Kruh:";
const string NAME_Manakosten	= "StojÌ magickÈ energie:";
const string NAME_ManakostenMax	= "StojÌ magickÈ energie (max.):";
const string NAME_ManaPerSec	= "Mana za sek.";
const string NAME_Duration		= "Trv·nÌ (minuty)";

const string NAME_Mana_needed	= "Poûadovan· mana:";
const string NAME_Str_needed	= "Poûadovan· sÌla:";
const string NAME_Dex_needed	= "Poûadovan· obratnost:";

const string NAME_Spell_Load	= "ObnovitelnÈ kouzlo";
const string NAME_Spell_Invest	= "Jednor·zovÈ kouzlo";

const string NAME_Dam_Edge		= "PoökozenÌ zbranÏmi";
const string NAME_Dam_Point		= "PoökozenÌ öÌpy";
const string NAME_Dam_Fire		= "PoökozenÌ ohnÏm";
const string NAME_Dam_Magic		= "PoökozenÌ magiÌ";
const string NAME_Dam_Fly		= "PoökozenÌ bou¯Ì";

const string NAME_Damage		= "PoökozenÌ";
const string NAME_PerMana		= " (za manu)";
const string NAME_DamagePerSec	= "PoökozenÌ za s.";

const string NAME_Prot_Edge		= "Ochrana proti zbranÌm:";
const string NAME_Prot_Point	= "Ochrana proti öÌp˘m:";
const string NAME_Prot_Fire		= "Ochrana proti ohni:";
const string NAME_Prot_Magic	= "Ochrana proti magii:";

const string NAME_Bonus_HP		= "Bonus zdravÌ:";
const string NAME_Bonus_Mana	= "Bonus magickÈ energie:";

const string NAME_Bonus_HpMax	= "Bonus pro maximum zdravÌ:";
const string NAME_Bonus_ManaMax	= "Bonus pro maximum magickÈ energie:";

const string NAME_Bonus_Dex		= "Bonus obratnosti:";
const string NAME_Bonus_Str		= "Bonus sÌly:";

const string NAME_OneHanded		= "JednoruËnÌ zbraÚ";
const string NAME_TwoHanded		= "ObouruËnÌ zbraÚ";

//----------------- MH: zus‰tzlich wegen FlexTranslate ---------------------

const string NAME_HealingPerMana = "Uzdravov·nÌ za manu"; 

const string NAME_BuyAttributeSTR = "SÌla +";
const string NAME_BuyAttributeDEX = "Obratnost +";
const string NAME_BuyAttributeMAN = "Mana +";

// ***************************************************************************************
// sonstige Bildschirmausgaben
// ***************************************************************************************
const string NAME_XPGained			= "Zkuöenost +";			// bei jedem Erfahrungsgewinn
const string NAME_LevelUp			= "O ˙roveÚ v˝ö!";				// beim Stufenaufstieg

const string NAME_NewLogEntry		= "Nov˝ z·pis do denÌku";




//***************************************************************************************
// Stringkonstanten aus den G_FUNCTIONS
//***************************************************************************************
const string _STR_INVALID					= "(Nezn·mo)-"								;

const string _STR_ATTRIBUTE_HITPOINTS		= "ZdravÌ"									;
const string _STR_ATTRIBUTE_HITPOINTS_MAX	= "Maximum zdravÌ"							;
const string _STR_ATTRIBUTE_MANA			= "Mana"									;
const string _STR_ATTRIBUTE_MANA_MAX		= "Maximum many"							;
const string _STR_ATTRIBUTE_STRENGTH		= "SÌla"								;
const string _STR_ATTRIBUTE_DEXTERITY		= "Obratnost"								;
const string _STR_ATTRIBUTE_MAGIC_CIRCLE	= "Kouzeln˝ svitek"								;

// Bildschirmausgabe, falls der Spieler eine Waffe anlegen will, f¸r die ihm Attributspunkte fehlen
const string _STR_CANNOTUSE_PRE_PLAYER		= "Nedostatek "						;
const string _STR_CANNOTUSE_POINTS			= " body"									;
const string _STR_CANNOTUSE_LEVELS		    = " ˙rovnÏ"									;
const string _STR_CANNOTUSE_POST			= " pro pouûitÌ tÈto poloûky"						;

// Bildschirmausgabe, falls ein NSC zu wenig Attributspunkte, f¸r das Anlegen von Waffen hat (nur Debugzwecke!)
const string _STR_CANNOTUSE_PRE_NPC			= " ("												;
const string _STR_CANNOTUSE_POST_NPC		= ") sch·zejÌ "									;

// Bidschrimausgabe zum Thema Schloﬂ ˆffnen/knacken
const string _STR_MESSAGE_INTERACT_NO_KEY	= "é·dn˝ paklÌË ani klÌË.";
const string _STR_MESSAGE_PICKLOCK_SUCCESS	= "To znÌ dob¯e.";
const string _STR_MESSAGE_PICKLOCK_UNLOCK	= "Z·mek byl otev¯en.";
const string _STR_MESSAGE_PICKLOCK_FAILURE	= "Sakra... a znova od zaË·tku.";
const string _STR_MESSAGE_PICKLOCK_BROKEN	= "PaklÌË se zlomil.";

// Bidschrimausgabe zum Thema Hebel/Winden
const string _STR_MESSAGE_OCLEVER_STUCKS	= "S tou p·kou nejde v˘bec pohnout."			;
const string _STR_MESSAGE_OCLEVER_MOVES		= "Ta soöka pohybuje p·kou."			;
const string _STR_MESSAGE_WHEEL_STUCKS		= "Navij·k se zamotal."					;

// Bidschrimausgabe beim storybedingten Transfer von Items
const string _STR_MESSAGE_ITEM_GIVEN		= " poloûka p¯ed·na!"							;	//SPACE davor wichtig, weil Trennzeichen
const string _STR_MESSAGE_ITEM_TAKEN		= " poloûka p¯ijata!"							;
const string _STR_MESSAGE_ITEMS_GIVEN		= " poloûek p¯ed·no!"							;
const string _STR_MESSAGE_ITEMS_TAKEN		= " poloûek p¯ijato!"						;
const string _STR_MESSAGE_ORE_GIVEN			= " ruda p¯ed·na!"								;
const string _STR_MESSAGE_ORE_TAKEN			= " ruda p¯ijata!"							;

// Bidschrimausgabe f¸rs Tausch-Fenster
const string _STR_MESSAGE_TRADE_FAILURE		= "Hodnota tvÈho zboûÌ nenÌ dost velk·."	;

// GILDENAUFNAHMEBEDINGUNG (f¸r die Funktion "B_PrintGuildCondition()" )
const string _STR_MESSAGE_Joincamp			=	"PodmÌnka pro p¯ijetÌ: ⁄roveÚ"; 

// nicht beklaubare NSCs
const string _STR_MESSAGE_CANNOTSTEAL		=	"Nelze ukr·st.";

// ***************************************************************************************
// Relative Y-Koordinaten f¸r die Bildschirmausgabe (in % der aktuellen Bildhˆhe)
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
const string NAME_LearnPostfixS		=	" znalostnÌ bod)";	
const string NAME_LearnPostfixP		=	" znalostnÌch bod˘)";	

const string NAME_LearnStrength_1	=	"SÌla +1";
const string NAME_LearnStrength_5	=	"SÌla +5";
const string NAME_LearnStrength_10	=	"SÌla +10";
const string NAME_LearnStrength_20	=	"SÌla +20";

const string NAME_LearnDexterity_1	=	"Obratnost +1";
const string NAME_LearnDexterity_5	=	"Obratnost +5";
const string NAME_LearnDexterity_10	=	"Obratnost +10";
const string NAME_LearnDexterity_20	=	"Obratnost +20";

const string NAME_LearnMana_1		=	"Mana +1";
const string NAME_LearnMana_5		=	"Mana +5";
const string NAME_LearnMana_10		=	"Mana +10";
const string NAME_LearnMana_20		=	"Mana +20";

const string NAME_Learn1h_1			=	"JednoruËnÌ zbraÚ ˙roveÚ 1";
const string NAME_Learn1h_2			=	"JednoruËnÌ zbraÚ ˙roveÚ 2";
const string NAME_Learn2h_1			=	"ObouruËnÌ zbraÚ ˙roveÚ 1";
const string NAME_Learn2h_2			=	"ObouruËnÌ zbraÚ ˙roveÚ 2";

const string NAME_LearnBow_1		=	"Luk ⁄roveÚ 1";
const string NAME_LearnBow_2		=	"Luk ⁄roveÚ 2";
const string NAME_LearnCrossbow_1	=	"Samost¯Ìl ⁄roveÚ 1";
const string NAME_LearnCrossbow_2	=	"Samost¯Ìl ⁄roveÚ 2";

const string NAME_LearnMage_1		=	"1. Kruh magie";
const string NAME_LearnMage_2		=	"2. Kruh magie";
const string NAME_LearnMage_3		=	"3. Kruh magie";
const string NAME_LearnMage_4		=	"4. Kruh magie";
const string NAME_LearnMage_5		=	"5. Kruh magie";
const string NAME_LearnMage_6		=	"6. Kruh magie";

const string NAME_LearnPickpocket_1	=	"VybÌr·nÌ kapes ⁄roveÚ 1";
const string NAME_LearnPickpocket_2	=	"VybÌr·nÌ kapes ⁄roveÚ 2";
const string NAME_LearnPicklock_1	=	"OtevÌr·nÌ z·mk˘ ⁄roveÚ 1";
const string NAME_LearnPicklock_2	=	"OtevÌr·nÌ z·mk˘ ⁄roveÚ 2";

const string NAME_LearnAcrobat		=	"Akrobacie";
const string NAME_LearnSneak		=	"PlÌûenÌ";

const string NAME_RaiseStrength		=	"SÌla +";
const string NAME_RaiseDexterity	=	"Obratnost +";
const string NAME_RaiseStrDex		=	"SÌla a obratnost +";
const string NAME_RaiseManaMax		=	"Maximum magickÈ energie +";
const string NAME_RaiseHealthMax	=	"Maximum zdravÌ +";

//---------------- MH: f¸r B_BuildBuyArmorString ----------------------------

const string NAME_CorristoHighRobe	= 	"Mist¯e, r·d bych oblÈkl vzneöenÈ roucho OhnÏ.";
const string NAME_SaturasHighRobe	= 	"VzneöenÈ roucho";
const string NAME_DiegoHeavyShadows	=	"TÏûk· zbroj StÌn˘. Ochrana: ZbranÏ 40, äÌpy 5, OheÚ 20";
const string NAME_StoneHeavyGuards	= 	"TÏûk· zbroj str·ûe. Ochrana: ZbranÏ 70, äÌpy 10, OheÚ 35";
const string NAME_StoneGuards		= 	"Zbroj str·ûe. Ochrana: ZbranÏ 55, äÌpy 10, OheÚ 25";
const string NAME_WolfBandits		= 	"Zbroj bandity. Ochrana: ZbranÏ 35, äÌpy 5, OheÚ 15"; 
const string NAME_WolfHeavyBandits	= 	"TÏûk· zbroj bandity. Ochrana: ZbranÏ 40, äÌpy 5, OheÚ 20";
const string NAME_LeeMercs			= 	"Zbroj ûold·ka. Ochrana: ZbranÏ 55, äÌpy 10, OheÚ 25";
const string NAME_LeeHeavyMercs		= 	"TÏûk· zbroj ûold·ka. Ochrana: ZbranÏ 70, äÌpy 10, OheÚ 35";
const string NAME_FiskLightDiggers	= 	"LehkÈ kalhoty kop·Ëe. Ochrana: ZbranÏ 10, OheÚ 5";
const string NAME_FiskDiggers		= 	"Kalhoty kop·Ëe. Ochrana: ZbranÏ 15, OheÚ 5";
const string NAME_GorNaTothHeavyTpl = 	"TÏûk· zbroj templ·¯e Ochrana: ZbranÏ 70, äÌpy 10, OheÚ 35";
const string NAME_GorNaTothTpl 		=	"Zbroj templ·¯e Ochrana: ZbranÏ 55, äÌpy 10, OheÚ 25";
const string NAME_TorwachenPsiRock	=	"BedernÌ rouöka. Ochrana: ZbranÏ 15, OheÚ 10";




// ***************************************************************************************
// Menuetext-Konstanten
// ***************************************************************************************
// Text, der erscheint, wenn eine Menueoption noch ein APPLY benoetigt (Aufloesung).
// Vermutlich kein Text notwendig, da durch Menuestruktur deutlich gemacht
const string MENU_TEXT_NEEDS_APPLY		= "";

// Text, der erscheint, wenn ein Restart des Spiels notwendig ist (Grafikkartebauswahl).
// Maximal ca. 60 Zeichen, da nur eine Zeile Platz!
const string MENU_TEXT_NEEDS_RESTART	= "NÏkterÈ zmÏny v nastavenÌ se projevÌ aû po dalöÌm spuötÏnÌ.";

//
//	TRADE MANAGER
//
const string STR_INFO_TRADE_ACCEPT						= "Souhlasit"			;
const string STR_INFO_TRADE_RESET						= "OdmÌtnout"			;
const string STR_INFO_TRADE_EXIT						= "ZPÃT"			;

const string STR_BADENIXE = "Badenixe";

// ****************
// B_Kapitelwechsel
// ****************

const string KapWechsel_1			= "Kapitola 1"					;
const string KapWechsel_1_Text		= "VÌtej do kolonie"			;
const string KapWechsel_2			= "Kapitola 2"					;
const string KapWechsel_2_Text		= "HnÌzdo d˘lnÌch Ëerv˘"		;
const string KapWechsel_3			= "Kapitola 3"					;
const string KapWechsel_3_Text		= "Artefakty prad·vn˝ch sil"	;
const string KapWechsel_4			= "Kapitola 4"					;
const string KapWechsel_4_Text		= "Xardas"						;
const string KapWechsel_5			= "Kapitola 5"					;
const string KapWechsel_5_Text		= "Str·ûci port·lu"				;
const string KapWechsel_6			= "Kapitola 6"					;
const string KapWechsel_6_Text		= "Sp·Ëovo doupÏ"				;
