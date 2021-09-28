// *****************************************************************************************
// Mobsi-Fokusnamen
// *****************************************************************************************

CONST STRING MOBNAME_BACKPACK_1		= "";
CONST STRING MOBNAME_CRATE			= "Bedna";
CONST STRING MOBNAME_CHEST			= "Truhlice";
CONST STRING MOBNAME_BED			= "L��ko";
CONST STRING MOBNAME_DOOR			= "Dve�e";
CONST STRING MOBNAME_CAMP			= "";
CONST STRING MOBNAME_TORCH			= "";
CONST STRING MOBNAME_TORCHHOLDER	= "";
CONST STRING MOBNAME_BARBQ_SCAV		= "";
CONST STRING MOBNAME_BARRELO_OC		= "";
CONST STRING MOBNAME_BENCH			= "";
CONST STRING MOBNAME_ANVIL			= "Kovadlina";
CONST STRING MOBNAME_BUCKET			= "N�doba na vodu";
CONST STRING MOBNAME_FORGE			= "Kov��sk� v�he�";
CONST STRING MOBNAME_GRINDSTONE		= "Brus";
CONST STRING MOBNAME_WHEEL			= "Navij�k";
CONST STRING MOBNAME_LAB			= "";
CONST STRING MOBNAME_BOOK			= "";
CONST STRING MOBNAME_CHAIR			= "";
CONST STRING MOBNAME_CAULDRON		= "Kotl�k";
CONST STRING MOBNAME_THRONE			= "";
CONST STRING MOBNAME_PAN			= "P�nev";
CONST STRING MOBNAME_REPAIR			= "";
CONST STRING MOBNAME_WATERPIPE		= "Vodn� d�mka";
CONST STRING MOBNAME_LADDER			= "�eb��k";
CONST STRING MOBNAME_SWITCH			= "Sp�na�";
CONST STRING MOBNAME_BARONSTHRONE	= "";
CONST STRING MOBNAME_ORE			= "Magick� nuget";
CONST STRING MOBNAME_ROPEWAY		= "";
CONST STRING MOBNAME_STOMPER		= "";
CONST STRING MOBNAME_BELLOW			= "M�chy";
CONST STRING MOBNAME_STONEMILL		= "";
CONST STRING MOBNAME_ORC_MUMMY		= "Mumie";
CONST STRING MOBNAME_PILLAR			= "Sloup";
CONST STRING MOBNAME_BASKET_RICE	= "";
CONST STRING MOBNAME_DRUM			= "";
CONST STRING MOBNAME_GROUND_SLOT	= "n/a";
CONST STRING MOBNAME_HERB_PSI		= "Bylinn� ka�e";
CONST STRING MOBNAME_IDOL			= "Figurka";
CONST STRING MOBNAME_LEAN_WALL		= "";
CONST STRING MOBNAME_ORCDRUM		= "";
CONST STRING MOBNAME_TARGETSTONE	= "Ter�";
CONST STRING MOBNAME_SHRINE			= "Sk�et� relikvi�� se srdci";
CONST STRING MOBNAME_SWORDSTONE		= "Podivn� relikvi��";


// *****************************************************************************************
// Gildennamen
// *****************************************************************************************

CONST STRING TXT_GUILDS	[GIL_MAX] =	{
// - Charakterblatt (Text der Spielergilde)
// - Debuganzeige (Taste "G")
	"(nic)",
	"Rudobaron",
	"Str�ce",
	"St�n",
	"M�g Ohn�",
	"Kop��",
	"M�g Vody",
	"�old�k",
	"Bandita",
	"Roln�k",
	"Ruda�",			// 10
	"Guru",
	"Novic",
	"Templ��",
	"Nekromant",
	"D�vka",
	"",
	"Je�t�rka",			// 17
	"Sp��",
	"Goblin",
	"Trol",
	"Ch�apavec",
	"D�ln� �erv",
	"�rav� �t�nice",
	"Mrcho�rout",
	"Demon",
	"Vlk",
	"St�nov� �elma",
	"Krvav� moucha",
	"Mo��lov� �ralok",			// 30
	"Zombie",
	"Sk�et� zombie",
	"Kostlivec",
	"Sk�et� pes",
	"Krysokrt",
	"Golem",
	"��havec",
	"",				// 38
	"Sk�et� �aman",
	"Sk�et� bojovn�k",
	"Sk�et� zv�d",
	"Sk�et� otrok"
};


// *****************************************************************************************
// Attribut-Beschreibungen
// *****************************************************************************************
/* SN: wird laut Bert nicht mehr ben�tigt. Ich kommentier es erst mal eine Version lang aus
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

"TXT_ATTRIBUTE_DESC" - Beschreibung	der	Attribute f�r CharScreen.
"TXT_FIGHT_TALENTS"	- Namen	der	Kampftalente
"TXT_FIGHT_TALENTS_DESC" - Beschreibung	der	Kampftalente f�r CharScreen.
"TXT_TALENTS" -	Namen der sonstigen	Talente
"TXT_TALENTS_DESC" - Beschreibung der Talente f�r CharScreen
"TXT_SPELLS_DESC" -	Beschreibung der Spells	f�r	CharScreen

Die	Reihenfolge	der	jeweiligen Texte k�nnt ihr der Konstantenreihenfolge aus
der	"constants.d" entnehmen, die hier auch mit dranhaengt und fuer
fehlerfreies (Test-)parsen ben�tigt	wird.
*/

// *****************************************************************************************
// Zauberspruchnamen
// *****************************************************************************************

CONST STRING TXT_SPELLS	[MAX_SPELL]	= {
	"Sv�tlo",					// SPL_LIGHT		=	0;
	"Ohniv� koule",				// SPL_FIREBALL		=	1;
	"n/a",						// SPL_TRANSFORM	=	2;
	"Strach",					// SPL_FEAR			=	3;
	"Uzdraven�",					// SPL_HEAL			=	4;
	"n/a",						// SPL_LIGHTNING	=	5;
	"Vyvol�n� d�mona",			// SPL_SUMMONDEMON	=	6;
	"Vyvol�n� kostlivce",		// SPL_SUMMONSKELETON=	7;
	"n/a",						// SPL_FORGET		=	8;
	"�der v�tru",				// SPL_WINDFIST		=	9;
	"Telekineze",				// SPL_TELEKINESIS	=	10;
	"�arm",					// SPL_CHARM		=	11;
	"Sp�nek",					// SPL_SLEEP		=	12;
	"Pyrokineze",				// SPL_PYROKINESIS	=	13;
	"Kruh smrti",				// SPL_MASSDEATH	=	14;
	"Ovl�dnut�",				// SPL_CONTROL		=	15;
	"Smrt nemrtv�mu",		// SPL_DESTROYUNDEAD=	16;
	"Ohniv� ��p",				// SPL_FIREBOLT		=	17;
	"Ohniv� bou�e",				// SPL_FIRESTORM	=	18;
	"Ohniv� d隝",				// SPL_FIRERAIN		=	19;
	"n/a",						// SPL_SPEED		=	20;
	"Teleport m�ga Ohn�",		// SPL_TELEPORT1	=	21;
	"Teleport m�ga Vody",	// SPL_TELEPORT2	=	22;
	"Teleport nekromanta",	// SPL_TELEPORT3	=	23;
	"Sk�et� teleport",		// SPL_TELEPORT4	=	24;
	"Teleport T�bora v ba�in�ch",		// SPL_TELEPORT5	=	25;
	"Prom�na v krvavou mouchu",	// SPL_TRF_BLOODFLY	=	26;
	"n/a",						// SPL_TRF_BLOODHOUND=	27;
	"Prom�na v d�ln�ho �erva",	// SPL_TRF_CRAWLER	=	28;
	"Prom�na v ��havce",		// SPL_TRF_LURKER	=	29;
	"Prom�na ve �ravou �t�nici",	// SPL_TRF_MEATBUG	=	30;
	"Prom�na v krysokrta",		// SPL_TRF_MOLERAT	=	31;
	"Prom�na v sk�et�ho psa",		// SPL_TRF_ORCDOG	=	32;
	"n/a",						// SPL_TRF_RAZOR	=	33;
	"Prom�na v mrcho�routa",	// SPL_TRF_SCAVENGER=	34;
	"n/a",						// SPL_TRF_SCAVENGER2=	35;
	"Prom�na v st�novou �elmu",	// SPL_TRF_SHADOWBEAST=	36;
	"Prom�na v ch�apavce",		// SPL_TRF_SNAPPER	=	37;
	"Prom�na v je�t�rku",		// SPL_TRF_WARAN	=	38;
	"Prom�na ve vlka",			// SPL_TRF_WOLF		=	39;
	"Blesk",					// SPL_CHAINLIGHTNING=	40;
	"Ledov� ��p",					// SPL_THUNDERBOLT	=	41;
	"Kulov� blesk",				// SPL_THUNDERBALL	=	42;
	"Ledov� blok",					// SPL_ICECUBE		=	43;
	"Ledov� vlna",					// SPL_ICEWAVE		=	44;
	"Vyvol�n� golema",			// SPL_SUMMONGOLEM	=	45;
	"Arm�da Temnot",		// SPL_ARMYOFDARKNESS=	46;
	"V�trn� p�st",				// SPL_STORMFIST	=	47;
	"n/a",						// SPL_TELEKINESIS2	=	48;
	"Dech smrti",				// SPL_BREATHOFDEATH=	49;
	"Zmen�i nestv�ru",				// SPL_SHRINK		=	50;
	"n/a",						// SPL_UNDRESS		=	51;
	"n/a",						// SPL_DANCE		=	52;
	"Berserk",					// SPL_BERZERK		=	53;
	"Hn�v URIZIELU",			// SPL_NEW1			=	17;
	"New2",						// SPL_NEW2			=	18;
	"New3",						// SPL_NEW3			=	19;
	"New4",						// SPL_NEW4			=	20;
	"New5"						// SPL_NEW5			=	21;
 };

/* SN: wird laut Bert nicht mehr ben�tigt. Ich kommentier es erst mal eine Version lang aus
CONST STRING TXT_SPELLS_DESC [MAX_SPELL] = {
// FIXME: wo werden die benutzt?
	"LichtDescr",						// SPL_LIGHT		=	0;
	"FeuerballDescr",					// SPL_FIREBALL		=	1;
	"VerwandelnDescr",					// SPL_TRANSFORM	=	2;
	"FearDescr",						// SPL_FEAR			=	3;
	"HeilenDescr",						// SPL_HEAL			=	4;
	"BlitzDescr",						// SPL_LIGHTNING	=	5;
	"D�mon beschw.Descr",				// SPL_SUMMONDEMON	=	6;
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
	"Jednoru�n� me�",
	"Obouru�n� me�",
	"Luk",
	"Samost��l",
	"Otev�r�n� z�mk�",
	"Vyb�r�n� kapes",
	"Magie",
	"Pl�en�",
	"Regenerace",
	"Mistr ohn�",
	"Akrobacie"
};

/* SN: wird laut Bert nicht mehr ben�tigt. Ich kommentier es erst mal eine Version lang aus
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
	"za��te�n�k|pokro�il�|mistr",						//NPC_TALENT_1H          
	"za��te�n�k|pokro�il�|mistr",                       //NPC_TALENT_2H           
	"za��te�n�k|pokro�il�|mistr",                       //NPC_TALENT_BOW         
	"za��te�n�k|pokro�il�|mistr",                       //NPC_TALENT_CROSSBOW    
	"za��te�n�k|pokro�il�|mistr",                       //NPC_TALENT_PICKLOCK   
	"za��te�n�k|pokro�il�|mistr",                       //NPC_TALENT_PICKPOCKET
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
	"Zbran�",
	"Zbroj",
	"Magie",
	"Artefakty",
	"J�dlo",
	"Lektvary",
	"Rukopisy",
	"R�zn�"
};


// ***************************************************************************************
// Fokusnamen der Ambient-NSCs
// ***************************************************************************************

CONST STRING NAME_Buddler		= "Kop��";
CONST STRING NAME_Schatten		= "St�n";
CONST STRING NAME_ConvoiTraeger	= "Nosi� konvoje";
CONST STRING NAME_ConvoiWache	= "Str�ce konvoje";
CONST STRING NAME_Torwache		= "Str�ce br�ny";
CONST STRING NAME_Brueckenwache	= "Str�ce mostu";
CONST STRING NAME_Gardist		= "Str�ce";
CONST STRING NAME_Bauer			= "Roln�k";
CONST STRING NAME_Schlaeger		= "Lupi�";
CONST STRING NAME_Schuerfer		= "Ruda�";
CONST STRING NAME_Organisator	= "Bandita";
CONST STRING NAME_Soeldner		= "�old�k";
CONST STRING NAME_Novize		= "Novic";
CONST STRING NAME_Templer		= "Templ��";
CONST STRING NAME_Raeuber		= "Lupi�";
CONST STRING NAME_Tuersteher	= "Vyhazova�";

const string NAME_MadNovice		=	"Posedl� novic";
const string NAME_MadTemplar	=	"Fanatick� templ��";
const string NAME_MadTemplar2	=	"Apokalyptick� templ��";


// *************************************************************
// DIALOG OPTIONEN
// *************************************************************

CONST STRING DIALOG_ENDE		= "KONEC";
CONST STRING DIALOG_BACK		= "ZP�T";
const string DIALOG_TRADE		= "(Obchoduj)";

// *************************************************************
// FOKUSNAMEN DER ITEMS
// *************************************************************

const string NAME_Ring			= "Prsten";
const string NAME_Amulett		= "Amulet";
const string NAME_Trank			= "Lektvar";
const string NAME_Rune			= "Runa";
const string NAME_Spruchrolle	= "Kouzeln� svitek";


// *************************************************************
// TEXTE F�R ITEM-BESCHREIBUNGEN IM INV.
// *************************************************************

const string NAME_Value			= "Cena:";

const string NAME_Mag_Circle	= "Kruh:";
const string NAME_Manakosten	= "Stoj� magick� energie:";
const string NAME_ManakostenMax	= "Stoj� magick� energie (max.):";
const string NAME_ManaPerSec	= "Mana za sek.";
const string NAME_Duration		= "Trv�n� (minuty)";

const string NAME_Mana_needed	= "Po�adovan� mana:";
const string NAME_Str_needed	= "Po�adovan� s�la:";
const string NAME_Dex_needed	= "Po�adovan� obratnost:";

const string NAME_Spell_Load	= "Obnoviteln� kouzlo";
const string NAME_Spell_Invest	= "Jednor�zov� kouzlo";

const string NAME_Dam_Edge		= "Po�kozen� zbran�mi";
const string NAME_Dam_Point		= "Po�kozen� ��py";
const string NAME_Dam_Fire		= "Po�kozen� ohn�m";
const string NAME_Dam_Magic		= "Po�kozen� magi�";
const string NAME_Dam_Fly		= "Po�kozen� bou��";

const string NAME_Damage		= "Po�kozen�";
const string NAME_PerMana		= " (za manu)";
const string NAME_DamagePerSec	= "Po�kozen� za s.";

const string NAME_Prot_Edge		= "Ochrana proti zbran�m:";
const string NAME_Prot_Point	= "Ochrana proti ��p�m:";
const string NAME_Prot_Fire		= "Ochrana proti ohni:";
const string NAME_Prot_Magic	= "Ochrana proti magii:";

const string NAME_Bonus_HP		= "Bonus zdrav�:";
const string NAME_Bonus_Mana	= "Bonus magick� energie:";

const string NAME_Bonus_HpMax	= "Bonus pro maximum zdrav�:";
const string NAME_Bonus_ManaMax	= "Bonus pro maximum magick� energie:";

const string NAME_Bonus_Dex		= "Bonus obratnosti:";
const string NAME_Bonus_Str		= "Bonus s�ly:";

const string NAME_OneHanded		= "Jednoru�n� zbra�";
const string NAME_TwoHanded		= "Obouru�n� zbra�";

//----------------- MH: zus�tzlich wegen FlexTranslate ---------------------

const string NAME_HealingPerMana = "Uzdravov�n� za manu"; 

const string NAME_BuyAttributeSTR = "S�la +";
const string NAME_BuyAttributeDEX = "Obratnost +";
const string NAME_BuyAttributeMAN = "Mana +";

// ***************************************************************************************
// sonstige Bildschirmausgaben
// ***************************************************************************************
const string NAME_XPGained			= "Zku�enost +";			// bei jedem Erfahrungsgewinn
const string NAME_LevelUp			= "O �rove� v��!";				// beim Stufenaufstieg

const string NAME_NewLogEntry		= "Nov� z�pis do den�ku";




//***************************************************************************************
// Stringkonstanten aus den G_FUNCTIONS
//***************************************************************************************
const string _STR_INVALID					= "(Nezn�mo)-"								;

const string _STR_ATTRIBUTE_HITPOINTS		= "Zdrav�"									;
const string _STR_ATTRIBUTE_HITPOINTS_MAX	= "Maximum zdrav�"							;
const string _STR_ATTRIBUTE_MANA			= "Mana"									;
const string _STR_ATTRIBUTE_MANA_MAX		= "Maximum many"							;
const string _STR_ATTRIBUTE_STRENGTH		= "S�la"								;
const string _STR_ATTRIBUTE_DEXTERITY		= "Obratnost"								;
const string _STR_ATTRIBUTE_MAGIC_CIRCLE	= "Kouzeln� svitek"								;

// Bildschirmausgabe, falls der Spieler eine Waffe anlegen will, f�r die ihm Attributspunkte fehlen
const string _STR_CANNOTUSE_PRE_PLAYER		= "Nedostatek "						;
const string _STR_CANNOTUSE_POINTS			= " body"									;
const string _STR_CANNOTUSE_LEVELS		    = " �rovn�"									;
const string _STR_CANNOTUSE_POST			= " pro pou�it� t�to polo�ky"						;

// Bildschirmausgabe, falls ein NSC zu wenig Attributspunkte, f�r das Anlegen von Waffen hat (nur Debugzwecke!)
const string _STR_CANNOTUSE_PRE_NPC			= " ("												;
const string _STR_CANNOTUSE_POST_NPC		= ") sch�zej� "									;

// Bidschrimausgabe zum Thema Schlo� �ffnen/knacken
const string _STR_MESSAGE_INTERACT_NO_KEY	= "��dn� pakl�� ani kl��.";
const string _STR_MESSAGE_PICKLOCK_SUCCESS	= "To zn� dob�e.";
const string _STR_MESSAGE_PICKLOCK_UNLOCK	= "Z�mek byl otev�en.";
const string _STR_MESSAGE_PICKLOCK_FAILURE	= "Sakra... a znova od za��tku.";
const string _STR_MESSAGE_PICKLOCK_BROKEN	= "Pakl�� se zlomil.";

// Bidschrimausgabe zum Thema Hebel/Winden
const string _STR_MESSAGE_OCLEVER_STUCKS	= "S tou p�kou nejde v�bec pohnout."			;
const string _STR_MESSAGE_OCLEVER_MOVES		= "Ta so�ka pohybuje p�kou."			;
const string _STR_MESSAGE_WHEEL_STUCKS		= "Navij�k se zamotal."					;

// Bidschrimausgabe beim storybedingten Transfer von Items
const string _STR_MESSAGE_ITEM_GIVEN		= " polo�ka p�ed�na!"							;	//SPACE davor wichtig, weil Trennzeichen
const string _STR_MESSAGE_ITEMS_GIVEN		= " polo�ek p�ed�no!"							;
const string _STR_MESSAGE_ORE_GIVEN			= " ruda p�ed�na!"								;
const string _STR_MESSAGE_ITEM_TAKEN		= " polo�ka p�ijata!"							;
const string _STR_MESSAGE_ITEMS_TAKEN		= " polo�ek p�ijato!"						;
const string _STR_MESSAGE_ORE_TAKEN			= " ruda p�ijata!"							;

// Bidschrimausgabe f�rs Tausch-Fenster
const string _STR_MESSAGE_TRADE_FAILURE		= "Hodnota tv�ho zbo�� nen� dost velk�."	;

// GILDENAUFNAHMEBEDINGUNG (f�r die Funktion "B_PrintGuildCondition()" )
const string _STR_MESSAGE_Joincamp			=	"Podm�nka pro p�ijet�: �rove�"; 

// nicht beklaubare NSCs
const string _STR_MESSAGE_CANNOTSTEAL		=	"Nelze ukr�st.";

// ***************************************************************************************
// Relative Y-Koordinaten f�r die Bildschirmausgabe (in % der aktuellen Bildh�he)
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
const string NAME_LearnPostfixS		=	" znalostn� bod)";	
const string NAME_LearnPostfixP		=	" znalostn�ch bod�)";	

const string NAME_LearnStrength_1	=	"S�la +1";
const string NAME_LearnStrength_5	=	"S�la +5";
const string NAME_LearnStrength_10	=	"S�la +10";
const string NAME_LearnStrength_20	=	"S�la +20";

const string NAME_LearnDexterity_1	=	"Obratnost +1";
const string NAME_LearnDexterity_5	=	"Obratnost +5";
const string NAME_LearnDexterity_10	=	"Obratnost +10";
const string NAME_LearnDexterity_20	=	"Obratnost +20";

const string NAME_LearnMana_1		=	"Mana +1";
const string NAME_LearnMana_5		=	"Mana +5";
const string NAME_LearnMana_10		=	"Mana +10";
const string NAME_LearnMana_20		=	"Mana +20";

const string NAME_Learn1h_1			=	"Jednoru�n� zbra� �rove� 1";
const string NAME_Learn1h_2			=	"Jednoru�n� zbra� �rove� 2";
const string NAME_Learn2h_1			=	"Obouru�n� zbra� �rove� 1";
const string NAME_Learn2h_2			=	"Obouru�n� zbra� �rove� 2";

const string NAME_LearnBow_1		=	"Luk �rove� 1";
const string NAME_LearnBow_2		=	"Luk �rove� 2";
const string NAME_LearnCrossbow_1	=	"Samost��l �rove� 1";
const string NAME_LearnCrossbow_2	=	"Samost��l �rove� 2";

const string NAME_LearnMage_1		=	"1. Kruh magie";
const string NAME_LearnMage_2		=	"2. Kruh magie";
const string NAME_LearnMage_3		=	"3. Kruh magie";
const string NAME_LearnMage_4		=	"4. Kruh magie";
const string NAME_LearnMage_5		=	"5. Kruh magie";
const string NAME_LearnMage_6		=	"6. Kruh magie";

const string NAME_LearnPickpocket_1	=	"Vyb�r�n� kapes �rove� 1";
const string NAME_LearnPickpocket_2	=	"Vyb�r�n� kapes �rove� 2";
const string NAME_LearnPicklock_1	=	"Otev�r�n� z�mk� �rove� 1";
const string NAME_LearnPicklock_2	=	"Otev�r�n� z�mk� �rove� 2";

const string NAME_LearnAcrobat		=	"Akrobacie";
const string NAME_LearnSneak		=	"Pl�en�";

const string NAME_RaiseStrength		=	"S�la +";
const string NAME_RaiseDexterity	=	"Obratnost +";
const string NAME_RaiseStrDex		=	"S�la a obratnost +";
const string NAME_RaiseManaMax		=	"Maximum magick� energie +";
const string NAME_RaiseHealthMax	=	"Maximum zdrav� +";

//---------------- MH: f�r B_BuildBuyArmorString ----------------------------

const string NAME_CorristoHighRobe	= 	"Mist�e, r�d bych obl�kl vzne�en� roucho Ohn�.";
const string NAME_SaturasHighRobe	= 	"Vzne�en� roucho";
const string NAME_DiegoHeavyShadows	=	"T�k� zbroj St�n�. Ochrana: Zbran� 40, ��py 5, Ohe� 20";
const string NAME_StoneHeavyGuards	= 	"T�k� zbroj str�e. Ochrana: Zbran� 70, ��py 10, Ohe� 35";
const string NAME_StoneGuards		= 	"Zbroj str�e. Ochrana: Zbran� 55, ��py 10, Ohe� 25";
const string NAME_WolfBandits		= 	"Zbroj bandity. Ochrana: Zbran� 35, ��py 5, Ohe� 15"; 
const string NAME_WolfHeavyBandits	= 	"T�k� zbroj bandity. Ochrana: Zbran� 40, ��py 5, Ohe� 20";
const string NAME_LeeMercs			= 	"Zbroj �old�ka. Ochrana: Zbran� 55, ��py 10, Ohe� 25";
const string NAME_LeeHeavyMercs		= 	"T�k� zbroj �old�ka. Ochrana: Zbran� 70, ��py 10, Ohe� 35";
const string NAME_FiskLightDiggers	= 	"Lehk� kalhoty kop��e. Ochrana: Zbran� 10, Ohe� 5";
const string NAME_FiskDiggers		= 	"Kalhoty kop��e. Ochrana: Zbran� 15, Ohe� 5";
const string NAME_GorNaTothHeavyTpl = 	"T�k� zbroj templ��e Ochrana: Zbran� 70, ��py 10, Ohe� 35";
const string NAME_GorNaTothTpl 		=	"Zbroj templ��e Ochrana: Zbran� 55, ��py 10, Ohe� 25";
const string NAME_TorwachenPsiRock	=	"Bedern� rou�ka. Ochrana: Zbran� 15, Ohe� 10";




// ***************************************************************************************
// Menuetext-Konstanten
// ***************************************************************************************
// Text, der erscheint, wenn eine Menueoption noch ein APPLY benoetigt (Aufloesung).
// Vermutlich kein Text notwendig, da durch Menuestruktur deutlich gemacht
const string MENU_TEXT_NEEDS_APPLY		= "";

// Text, der erscheint, wenn ein Restart des Spiels notwendig ist (Grafikkartebauswahl).
// Maximal ca. 60 Zeichen, da nur eine Zeile Platz!
const string MENU_TEXT_NEEDS_RESTART	= "N�kter� zm�ny v nastaven� se projev� a� po dal��m spu�t�n�.";


//	TRADE MANAGER
//
const string STR_INFO_TRADE_ACCEPT						= "Souhlasit"			;
const string STR_INFO_TRADE_RESET						= "Odm�tnout"			;
const string STR_INFO_TRADE_EXIT						= "ZP�T"			;