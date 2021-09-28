// *****************************************************************************************
// Mobsi-Fokusnamen
// *****************************************************************************************

CONST STRING MOBNAME_BACKPACK_1		= "";
CONST STRING MOBNAME_CRATE			= "Cassa";
CONST STRING MOBNAME_CHEST			= "Scrigno";
CONST STRING MOBNAME_BED			= "Letto";
CONST STRING MOBNAME_DOOR			= "Porta";
CONST STRING MOBNAME_CAMP			= "";
CONST STRING MOBNAME_TORCH			= "";
CONST STRING MOBNAME_TORCHHOLDER	= "";
CONST STRING MOBNAME_BARBQ_SCAV		= "";
CONST STRING MOBNAME_BARRELO_OC		= "";
CONST STRING MOBNAME_BENCH			= "";
CONST STRING MOBNAME_ANVIL			= "Incudine";
CONST STRING MOBNAME_BUCKET			= "Secchio d'acqua";
CONST STRING MOBNAME_FORGE			= "Fuoco del fabbro";
CONST STRING MOBNAME_GRINDSTONE		= "Mola";
CONST STRING MOBNAME_WHEEL			= "Argano";
CONST STRING MOBNAME_LAB			= "";
CONST STRING MOBNAME_BOOK			= "";
CONST STRING MOBNAME_CHAIR			= "";
CONST STRING MOBNAME_CAULDRON		= "Bricco";
CONST STRING MOBNAME_THRONE			= "";
CONST STRING MOBNAME_PAN			= "Padella";
CONST STRING MOBNAME_REPAIR			= "";
CONST STRING MOBNAME_WATERPIPE		= "Tubatura";
CONST STRING MOBNAME_LADDER			= "Scala";
CONST STRING MOBNAME_SWITCH			= "Interruttore";
CONST STRING MOBNAME_BARONSTHRONE	= "";
CONST STRING MOBNAME_ORE			= "Pezzo di metallo";
CONST STRING MOBNAME_ROPEWAY		= "";
CONST STRING MOBNAME_STOMPER		= "";
CONST STRING MOBNAME_BELLOW			= "Mugolio";
CONST STRING MOBNAME_STONEMILL		= "";
CONST STRING MOBNAME_ORC_MUMMY		= "Mummia";
CONST STRING MOBNAME_PILLAR			= "Colonna";
CONST STRING MOBNAME_BASKET_RICE	= "";
CONST STRING MOBNAME_DRUM			= "";
CONST STRING MOBNAME_GROUND_SLOT	= "n/d";
CONST STRING MOBNAME_HERB_PSI		= "Schiacciatori d'erba";
CONST STRING MOBNAME_IDOL			= "Statuina";
CONST STRING MOBNAME_LEAN_WALL		= "";
CONST STRING MOBNAME_ORCDRUM		= "";
CONST STRING MOBNAME_TARGETSTONE	= "Obiettivo";
CONST STRING MOBNAME_SHRINE			= "Reliquiario del cuore degli orchi";
CONST STRING MOBNAME_SWORDSTONE		= "Strano reliquiario";


// *****************************************************************************************
// Gildennamen
// *****************************************************************************************

CONST STRING TXT_GUILDS	[GIL_MAX] =	{
// - Charakterblatt (Text der Spielergilde)
// - Debuganzeige (Taste "G")
	"(niente)",
	"Barone delle miniere",
	"Guardia",
	"Ombra",
	"Mago del Fuoco",
	"Minatore",
	"Mago dell'Acqua",
	"Mercenario",
	"Ladro",
	"Contadino",
	"Tritarocce",			// 10
	"Guru",
	"Novizio",
	"Templare",
	"Negromante",
	"Pupa",
	"",
	"Lucertola",			// 17
	"Dormiente",
	"Goblin",
	"Troll",
	"Laceratore",
	"Pidocchio di miniera",
	"Scarafaggio",
	"Saprofago",
	"Demone",
	"Lupo",
	"Mostro d'ombra",
	"Mosca vampiro",
	"Squalo di palude",			// 30
	"Zombi",
	"Orco zombi",
	"Scheletro",
	"Cane orco",
	"Topo talpa",
	"Golem",
	"Imboscatore",
	"",				// 38
	"Orco sciamano",
	"Orco guerriero",
	"Orco esploratore",
	"Orco schiavo"
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
	"Luce",					// SPL_LIGHT		=	0;
	"Palla di fuoco",				// SPL_FIREBALL		=	1;
	"n/d",						// SPL_TRANSFORM	=	2;
	"Paura",					// SPL_FEAR			=	3;
	"Guarigione",					// SPL_HEAL			=	4;
	"n/d",						// SPL_LIGHTNING	=	5;
	"Evoca un demone",			// SPL_SUMMONDEMON	=	6;
	"Evoca uno scheletro",		// SPL_SUMMONSKELETON=	7;
	"n/d",						// SPL_FORGET		=	8;
	"Colpo di vento",				// SPL_WINDFIST		=	9;
	"Telecinesi",				// SPL_TELEKINESIS	=	10;
	"Carisma",					// SPL_CHARM		=	11;
	"Sonno",					// SPL_SLEEP		=	12;
	"Pirocinesi",				// SPL_PYROKINESIS	=	13;
	"Anello mortale",				// SPL_MASSDEATH	=	14;
	"Controllo",				// SPL_CONTROL		=	15;
	"Morte dei non-morti",		// SPL_DESTROYUNDEAD=	16;
	"Globo di fuoco",				// SPL_FIREBOLT		=	17;
	"Tempesta di fuoco",				// SPL_FIRESTORM	=	18;
	"Pioggia di fuoco",				// SPL_FIRERAIN		=	19;
	"n/d",						// SPL_SPEED		=	20;
	"Teletrasporto ai Maghi del Fuoco",		// SPL_TELEPORT1	=	21;
	"Teletrasporto ai Maghi dell'Acqua",	// SPL_TELEPORT2	=	22;
	"Teletrasporto al Negromante",	// SPL_TELEPORT3	=	23;
	"Teletrasporto degli orchi",		// SPL_TELEPORT4	=	24;
	"Teletrasporto a Campo Palude",		// SPL_TELEPORT5	=	25;
	"Trasformazione in mosca vampiro",	// SPL_TRF_BLOODFLY	=	26;
	"n/d",						// SPL_TRF_BLOODHOUND=	27;
	"Trasformazione in mosca vampiro",	// SPL_TRF_CRAWLER	=	28;
	"Trasformazione in imboscatore",		// SPL_TRF_LURKER	=	29;
	"Trasformazione in scarafaggio",	// SPL_TRF_MEATBUG	=	30;
	"Trasformazione in topo talpa",		// SPL_TRF_MOLERAT	=	31;
	"Trasformazione in cane orco",		// SPL_TRF_ORCDOG	=	32;
	"n/d",						// SPL_TRF_RAZOR	=	33;
	"Trasformazione in saprofago",	// SPL_TRF_SCAVENGER=	34;
	"n/d",						// SPL_TRF_SCAVENGER2=	35;
	"Trasformazione in mostro d'ombra",	// SPL_TRF_SHADOWBEAST=	36;
	"Trasformazione in laceratore",		// SPL_TRF_SNAPPER	=	37;
	"Trasformazione in lucertola",		// SPL_TRF_WARAN	=	38;
	"Trasformazione in lupo",			// SPL_TRF_WOLF		=	39;
	"Saetta",					// SPL_CHAINLIGHTNING=	40;
	"Globo di ghiaccio",					// SPL_THUNDERBOLT	=	41;
	"Globo elettrico",				// SPL_THUNDERBALL	=	42;
	"Blocco di ghiaccio",					// SPL_ICECUBE		=	43;
	"Onda di gelo",					// SPL_ICEWAVE		=	44;
	"Evoca un golem",			// SPL_SUMMONGOLEM	=	45;
	"Armate delle tenebre",		// SPL_ARMYOFDARKNESS=	46;
	"Colpo di vento",				// SPL_STORMFIST	=	47;
	"n/d",						// SPL_TELEKINESIS2	=	48;
	"Soffio mortale",				// SPL_BREATHOFDEATH=	49;
	"Rimpicciolisci mostro",				// SPL_SHRINK		=	50;
	"n/d",						// SPL_UNDRESS		=	51;
	"n/d",						// SPL_DANCE		=	52;
	"Ira",					// SPL_BERZERK		=	53;
	"Ira di URIZIEL",			// SPL_NEW1			=	17;
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
	"Armi a una mano",
	"Armi a due mani",
	"Arco",
	"Balestra",
	"Forzare serrature",
	"Borseggiare",
	"Magia",
	"Furtivo",
	"Rigenerazione",
	"Maestro del fuoco",
	"Acrobazie"
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
	"inesperto|allenato|maestro",						//NPC_TALENT_1H          
	"inesperto|allenato|maestro",                       //NPC_TALENT_2H           
	"inesperto|allenato|maestro",                       //NPC_TALENT_BOW         
	"inesperto|allenato|maestro",                       //NPC_TALENT_CROSSBOW    
	"inesperto|allenato|maestro",                       //NPC_TALENT_PICKLOCK   
	"inesperto|allenato|maestro",                       //NPC_TALENT_PICKPOCKET
	"no|1o Cerchio|2o Cerchio|3o Cerchio|4o Cerchio|5o Cerchio|6o Cerchio", //NPC_TALENT_MAGE         
	"no|sì",                                              //NPC_TALENT_SNEAK       
	"|",                                      		        //NPC_TALENT_REGENERATE 
	"|",                                          		    //NPC_TALENT_FIREMASTER   
	"no|sì"                                               //NPC_TALENT_ACROBAT      
};

// *****************************************************************************************
// Inventory-Kategorien
// *****************************************************************************************

CONST STRING TXT_INV_CAT [INV_CAT_MAX] = {
	"",
	"Armi",
	"Armatura",
	"Magia",
	"Manufatti",
	"Cibo",
	"Pozioni",
	"Scritti",
	"Varie"
};


// ***************************************************************************************
// Fokusnamen der Ambient-NSCs
// ***************************************************************************************

CONST STRING NAME_Buddler		= "Minatore";
CONST STRING NAME_Schatten		= "Ombra";
CONST STRING NAME_ConvoiTraeger	= "Corriere del convoglio";
CONST STRING NAME_ConvoiWache	= "Guardia del convoglio";
CONST STRING NAME_Torwache		= "Guardia al cancello";
CONST STRING NAME_Brueckenwache	= "Guardia del ponte";
CONST STRING NAME_Gardist		= "Guardia";
CONST STRING NAME_Bauer			= "Contadino";
CONST STRING NAME_Schlaeger		= "Criminale";
CONST STRING NAME_Schuerfer		= "Tritarocce";
CONST STRING NAME_Organisator	= "Ladro";
CONST STRING NAME_Soeldner		= "Mercenario";
CONST STRING NAME_Novize		= "Novizio";
CONST STRING NAME_Templer		= "Templare";
CONST STRING NAME_Raeuber		= "Criminale";
CONST STRING NAME_Tuersteher	= "Buttafuori";

const string NAME_MadNovice		=	"Novizio ossessionato";
const string NAME_MadTemplar	=	"Templare fanatico";
const string NAME_MadTemplar2	=	"Templare apocalittico";


// *************************************************************
// DIALOG OPTIONEN
// *************************************************************

CONST STRING DIALOG_ENDE		= "FINE";
CONST STRING DIALOG_BACK		= "INDIETRO";
const string DIALOG_TRADE		= "(Commercio)";

// *************************************************************
// FOKUSNAMEN DER ITEMS
// *************************************************************

const string NAME_Ring			= "Anello";
const string NAME_Amulett		= "Amuleto";
const string NAME_Trank			= "Pozione";
const string NAME_Rune			= "Runa";
const string NAME_Spruchrolle	= "Incantesimo";


// *************************************************************
// TEXTE FÜR ITEM-BESCHREIBUNGEN IM INV.
// *************************************************************

const string NAME_Value			= "Valore:";

const string NAME_Mag_Circle	= "Cerchio:";
const string NAME_Manakosten	= "Costo in mana:";
const string NAME_ManakostenMax	= "Costo in mana (max):";
const string NAME_ManaPerSec	= "Mana per sec.";
const string NAME_Duration		= "Durata (in minuti)";

const string NAME_Mana_needed	= "Mana necessario:";
const string NAME_Str_needed	= "Forza necessaria:";
const string NAME_Dex_needed	= "Destrezza necessaria:";

const string NAME_Spell_Load	= "Incantesimo caricabile";
const string NAME_Spell_Invest	= "Incantesimo duraturo";

const string NAME_Dam_Edge		= "Danno da arma:";
const string NAME_Dam_Point		= "Danno da freccia:";
const string NAME_Dam_Fire		= "Danno da fuoco:";
const string NAME_Dam_Magic		= "Danno da magia:";
const string NAME_Dam_Fly		= "Danno da tempesta:";

const string NAME_Damage		= "Danno:";
const string NAME_PerMana		= " (per mana)";
const string NAME_DamagePerSec	= "Danno per sec.";

const string NAME_Prot_Edge		= "Protezione dalle armi:";
const string NAME_Prot_Point	= "Protezione dalle frecce:";
const string NAME_Prot_Fire		= "Protezione dal fuoco:";
const string NAME_Prot_Magic	= "Protezione dalla magia:";

const string NAME_Bonus_HP		= "Bonus energia vitale:";
const string NAME_Bonus_Mana	= "Bonus mana:";

const string NAME_Bonus_HpMax	= "Bonus per massima energia vitale:";
const string NAME_Bonus_ManaMax	= "Bonus per massimo mana:";

const string NAME_Bonus_Dex		= "Bonus destrezza:";
const string NAME_Bonus_Str		= "Bonus forza:";

const string NAME_OneHanded		= "Arma a una mano";
const string NAME_TwoHanded		= "Arma a due mani";

//----------------- MH: zusätzlich wegen FlexTranslate ---------------------

const string NAME_HealingPerMana = "Guarigione per mana"; 

const string NAME_BuyAttributeSTR = "Forza +";
const string NAME_BuyAttributeDEX = "Destrezza +";
const string NAME_BuyAttributeMAN = "Mana +";

// ***************************************************************************************
// sonstige Bildschirmausgaben
// ***************************************************************************************
const string NAME_XPGained			= "Esperienza +";			// bei jedem Erfahrungsgewinn
const string NAME_LevelUp			= "Su di un livello!";		// beim Stufenaufstieg

const string NAME_NewLogEntry		= "Nuova pagina di diario";




//***************************************************************************************
// Stringkonstanten aus den G_FUNCTIONS
//***************************************************************************************
const string _STR_INVALID					= "(Sconosciuto)-"									;

const string _STR_ATTRIBUTE_HITPOINTS		= "Energia vitale"											;
const string _STR_ATTRIBUTE_HITPOINTS_MAX	= "Energia vitale massima"								;
const string _STR_ATTRIBUTE_MANA			= "Mana"											;
const string _STR_ATTRIBUTE_MANA_MAX		= "Mana massimo"									;
const string _STR_ATTRIBUTE_STRENGTH		= "Forza"											;
const string _STR_ATTRIBUTE_DEXTERITY		= "Destrezza"								;
const string _STR_ATTRIBUTE_MAGIC_CIRCLE	= "Incantesimo"								;

// Bildschirmausgabe, falls der Spieler eine Waffe anlegen will, für die ihm Attributspunkte fehlen
const string _STR_CANNOTUSE_PRE_PLAYER		= "Ti mancano "										;
const string _STR_CANNOTUSE_POINTS			= " punti"											;
const string _STR_CANNOTUSE_LEVELS		    = " livelli"											;
const string _STR_CANNOTUSE_POST			= " per usare quest'oggetto."				;

// Bildschirmausgabe, falls ein NSC zu wenig Attributspunkte, für das Anlegen von Waffen hat (nur Debugzwecke!)
const string _STR_CANNOTUSE_PRE_NPC			= " ("												;
const string _STR_CANNOTUSE_POST_NPC		= ") mancano "										;

// Bidschrimausgabe zum Thema Schloß öffnen/knacken
const string _STR_MESSAGE_INTERACT_NO_KEY	= "Niente chiave o grimaldello.";
const string _STR_MESSAGE_PICKLOCK_SUCCESS	= "Suona bene.";
const string _STR_MESSAGE_PICKLOCK_UNLOCK	= "La serratura è aperta.";
const string _STR_MESSAGE_PICKLOCK_FAILURE	= "Merda... Tutto daccapo.";
const string _STR_MESSAGE_PICKLOCK_BROKEN	= "Il grimaldello s'è rotto.";

// Bidschrimausgabe zum Thema Hebel/Winden
const string _STR_MESSAGE_OCLEVER_STUCKS	= "La leva non si muove."			;
const string _STR_MESSAGE_OCLEVER_MOVES		= "La statuetta muove la leva."			;
const string _STR_MESSAGE_WHEEL_STUCKS		= "L'argano è inceppato."					;

// Bidschrimausgabe beim storybedingten Transfer von Items
const string _STR_MESSAGE_ITEM_GIVEN		= " Oggetto dato!"								;	//SPACE davor wichtig, weil Trennzeichen
const string _STR_MESSAGE_ITEMS_GIVEN		= " Oggetti dati!"							;
const string _STR_MESSAGE_ORE_GIVEN			= " Pezzi di metallo dati!"									;
const string _STR_MESSAGE_ITEM_TAKEN		= " Oggetto ricevuto!"							;
const string _STR_MESSAGE_ITEMS_TAKEN		= " Oggetti ricevuti!"							;
const string _STR_MESSAGE_ORE_TAKEN			= " Pezzi di metallo ricevuti!"									;

// Bidschrimausgabe fürs Tausch-Fenster
const string _STR_MESSAGE_TRADE_FAILURE		= "Le tue merci non valgono abbastanza."	;

// GILDENAUFNAHMEBEDINGUNG (für die Funktion "B_PrintGuildCondition()" )
const string _STR_MESSAGE_Joincamp			=	"Condizione per l'ammissione: livello"; 

// nicht beklaubare NSCs
const string _STR_MESSAGE_CANNOTSTEAL		=	"Non puoi rubarlo.";

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
const string NAME_BuyArmorPostfix	=	" pezzi di metallo)";	
const string NAME_LearnPrefix		=	" (";	
const string NAME_LearnMidfix		=	" pezzi di metallo,";
const string NAME_LearnPostfixS		=	"punto abilità)";	
const string NAME_LearnPostfixP		=	"punti abilità)";	

const string NAME_LearnStrength_1	=	"Forza +1";
const string NAME_LearnStrength_5	=	"Forza +5";
const string NAME_LearnStrength_10	=	"Forza +10";
const string NAME_LearnStrength_20	=	"Forza +20";

const string NAME_LearnDexterity_1	=	"Destrezza +1";
const string NAME_LearnDexterity_5	=	"Destrezza +5";
const string NAME_LearnDexterity_10	=	"Destrezza +10";
const string NAME_LearnDexterity_20	=	"Destrezza +20";

const string NAME_LearnMana_1		=	"Mana +1";
const string NAME_LearnMana_5		=	"Mana +5";
const string NAME_LearnMana_10		=	"Mana +10";
const string NAME_LearnMana_20		=	"Mana +20";

const string NAME_Learn1h_1			=	"Armi a una mano livello 1";
const string NAME_Learn1h_2			=	"Armi a una mano livello 2";
const string NAME_Learn2h_1			=	"Armi a due mani livello 1";
const string NAME_Learn2h_2			=	"Armi a due mani livello 2";

const string NAME_LearnBow_1		=	"Arco livello 1";
const string NAME_LearnBow_2		=	"Arco livello 2";
const string NAME_LearnCrossbow_1	=	"Balestra livello 1";
const string NAME_LearnCrossbow_2	=	"Balestra livello 2";

const string NAME_LearnMage_1		=	"1o Cerchio magico";
const string NAME_LearnMage_2		=	"2o Cerchio magico";
const string NAME_LearnMage_3		=	"3o Cerchio magico";
const string NAME_LearnMage_4		=	"4o Cerchio magico";
const string NAME_LearnMage_5		=	"5o Cerchio magico";
const string NAME_LearnMage_6		=	"6o Cerchio magico";

const string NAME_LearnPickpocket_1	=	"Borseggio livello 1";
const string NAME_LearnPickpocket_2	=	"Borseggio livello 2";
const string NAME_LearnPicklock_1	=	"Forzare serrature livello 1";
const string NAME_LearnPicklock_2	=	"Forzare serrature livello 2";

const string NAME_LearnAcrobat		=	"Acrobazie";
const string NAME_LearnSneak		=	"Furtivo";

const string NAME_RaiseStrength		=	"Forza +";
const string NAME_RaiseDexterity	=	"Destrezza +";
const string NAME_RaiseStrDex		=	"Forza e destrezza +";
const string NAME_RaiseManaMax		=	"Mana massimo +";
const string NAME_RaiseHealthMax	=	"Energia vitale massima +";

//---------------- MH: für B_BuildBuyArmorString ----------------------------

const string NAME_CorristoHighRobe	= 	"Maestro, voglio indossare l'alta veste del fuoco.";
const string NAME_SaturasHighRobe	= 	"Alta veste";
const string NAME_DiegoHeavyShadows	=	"Armatura pes. ombra. Protezione: armi 40, frecce 5, fuoco 20";
const string NAME_StoneHeavyGuards	= 	"Armatura pes. guardia. Protezione: armi 70, frecce 10, fuoco 35";
const string NAME_StoneGuards		= 	"Armatura guardia. Protezione: armi 55, frecce 10, fuoco 25";
const string NAME_WolfBandits		= 	"Armatura bandito. Protezione: armi 35, frecce 5, fuoco 15"; 
const string NAME_WolfHeavyBandits	= 	"Armatura pes. bandito. Protezione: armi 40, frecce 5, fuoco 20";
const string NAME_LeeMercs			= 	"Armatura mercenario. Protezione: armi 55, frecce 10, fuoco 25";
const string NAME_LeeHeavyMercs		= 	"Armatura pes. mercenario. Protezione: armi 70, frecce 10, fuoco 35";
const string NAME_FiskLightDiggers	= 	"Armatura leg. mercenario. Protezione: armi 10, frecce 5";
const string NAME_FiskDiggers		= 	"Calzoni minatore. Protezione: armi 15, fuoco 5";
const string NAME_GorNaTothHeavyTpl = 	"Armatura pes. templare. Protezione: armi 70, frecce 10, fuoco 35";
const string NAME_GorNaTothTpl 		=	"Armatura templare. Protezione: armi 55, frecce 10, fuoco 25";
const string NAME_TorwachenPsiRock	=	"Fascia. Protezione: armi 15, fuoco 10";




// ***************************************************************************************
// Menuetext-Konstanten
// ***************************************************************************************
// Text, der erscheint, wenn eine Menueoption noch ein APPLY benoetigt (Aufloesung).
// Vermutlich kein Text notwendig, da durch Menuestruktur deutlich gemacht
const string MENU_TEXT_NEEDS_APPLY		= "";

// Text, der erscheint, wenn ein Restart des Spiels notwendig ist (Grafikkartebauswahl).
// Maximal ca. 60 Zeichen, da nur eine Zeile Platz!
const string MENU_TEXT_NEEDS_RESTART	= "Alcune impostazioni avranno effetto solo dopo il riavvio.";

//
//	TRADE MANAGER
//
const string STR_INFO_TRADE_ACCEPT						= "Conferma"			;
const string STR_INFO_TRADE_RESET						= "Annulla"			;
const string STR_INFO_TRADE_EXIT						= "INDIETRO"				;

const string STR_BADENIXE = "Pupa a mollo";

// ****************
// B_Kapitelwechsel
// ****************

const string KapWechsel_1			= "Capitolo 1"					;
const string KapWechsel_1_Text		= "Benvenuto alla colonia"	;
const string KapWechsel_2			= "Capitolo 2"					;
const string KapWechsel_2_Text		= "Il nido dei pidocchi di miniera"	;
const string KapWechsel_3			= "Capitolo 3"					;
const string KapWechsel_3_Text		= "Manufatti dall'antico potere"	;
const string KapWechsel_4			= "Capitolo 4"					;
const string KapWechsel_4_Text		= "Xardas"						;
const string KapWechsel_5			= "Capitolo 5"					;
const string KapWechsel_5_Text		= "I guardiani del portale"		;
const string KapWechsel_6			= "Capitolo 6"					;
const string KapWechsel_6_Text		= "L'antro del Dormiente"	;
