// *****************************************************************************************
// Mobsi-Fokusnamen
// *****************************************************************************************

CONST STRING MOBNAME_BACKPACK_1		= "";
CONST STRING MOBNAME_CRATE			= "Caja";
CONST STRING MOBNAME_CHEST			= "Cofre";
CONST STRING MOBNAME_BED			= "Cama";
CONST STRING MOBNAME_DOOR			= "Puerta";
CONST STRING MOBNAME_CAMP			= "";
CONST STRING MOBNAME_TORCH			= "";
CONST STRING MOBNAME_TORCHHOLDER	= "";
CONST STRING MOBNAME_BARBQ_SCAV		= "";
CONST STRING MOBNAME_BARRELO_OC		= "";
CONST STRING MOBNAME_BENCH			= "";
CONST STRING MOBNAME_ANVIL			= "Yunque";
CONST STRING MOBNAME_BUCKET			= "Cubo de agua";
CONST STRING MOBNAME_FORGE			= "Fuego de herrero";
CONST STRING MOBNAME_GRINDSTONE		= "Piedra de afilar";
CONST STRING MOBNAME_WHEEL			= "Torno";
CONST STRING MOBNAME_LAB			= "";
CONST STRING MOBNAME_BOOK			= "";
CONST STRING MOBNAME_CHAIR			= "";
CONST STRING MOBNAME_CAULDRON		= "Tetera";
CONST STRING MOBNAME_THRONE			= "";
CONST STRING MOBNAME_PAN			= "Sartén";
CONST STRING MOBNAME_REPAIR			= "";
CONST STRING MOBNAME_WATERPIPE		= "Pipa de agua";
CONST STRING MOBNAME_LADDER			= "Escalera de mano";
CONST STRING MOBNAME_SWITCH			= "Interruptor";
CONST STRING MOBNAME_BARONSTHRONE	= "";
CONST STRING MOBNAME_ORE			= "Pepita de mineral";
CONST STRING MOBNAME_ROPEWAY		= "";
CONST STRING MOBNAME_STOMPER		= "";
CONST STRING MOBNAME_BELLOW			= "Fuelle";
CONST STRING MOBNAME_STONEMILL		= "";
CONST STRING MOBNAME_ORC_MUMMY		= "Momia";
CONST STRING MOBNAME_PILLAR			= "Columna";
CONST STRING MOBNAME_BASKET_RICE	= "";
CONST STRING MOBNAME_DRUM			= "";
CONST STRING MOBNAME_GROUND_SLOT	= "n/a";
CONST STRING MOBNAME_HERB_PSI		= "Trituradora de hierba";
CONST STRING MOBNAME_IDOL			= "Estatuilla";
CONST STRING MOBNAME_LEAN_WALL		= "";
CONST STRING MOBNAME_ORCDRUM		= "";
CONST STRING MOBNAME_TARGETSTONE	= "Objetivo";
CONST STRING MOBNAME_SHRINE			= "Capilla del Corazón de los orcos";
CONST STRING MOBNAME_SWORDSTONE		= "Extraña capilla";


// *****************************************************************************************
// Gildennamen
// *****************************************************************************************

CONST STRING TXT_GUILDS	[GIL_MAX] =	{
// - Charakterblatt (Text der Spielergilde)
// - Debuganzeige (Taste "G")
	"(Ninguna)",
	"Magnate del mineral",
	"Guardia",
	"Sombra",
	"Mago del Fuego",
	"Cavador",
	"Mago del Agua",
	"Mercenario",
	"Bandido",
	"Campesino",
	"Raspador",			// 10
	"Gurú",
	"Novicio",
	"Templario",
	"Nigromante",
	"Nena",
	"",
	"Lagarto",			// 17
	"Durmiente",
	"Trasgo",
	"Troll",
	"Chasqueador",
	"Reptador de la mina",
	"Sabandija de carne",
	"Carroñero",
	"Demonio",
	"Lobo",
	"Bestia de sombra",
	"Mosca de sangre",
	"Tiburón de la ciénaga",			// 30
	"Zombi",
	"Zombi orco",
	"Esqueleto",
	"Perro orco",
	"Ratopo",
	"Gólem",
	"Acechador",
	"",				// 38
	"Chamán orco",
	"Guerrero orco",
	"Explorador orco",
	"Esclavo orco"
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
	"Luz",					// SPL_LIGHT		=	0;
	"Bola de fuego",				// SPL_FIREBALL		=	1;
	"n/a",						// SPL_TRANSFORM	=	2;
	"Miedo",					// SPL_FEAR			=	3;
	"Curación",					// SPL_HEAL			=	4;
	"n/a",						// SPL_LIGHTNING	=	5;
	"Convocar demonio",			// SPL_SUMMONDEMON	=	6;
	"Convocar esqueletos",		// SPL_SUMMONSKELETON=	7;
	"n/a",						// SPL_FORGET		=	8;
	"Puño del viento",				// SPL_WINDFIST		=	9;
	"Telequinesia",				// SPL_TELEKINESIS	=	10;
	"Hechizar",					// SPL_CHARM		=	11;
	"Dormir",					// SPL_SLEEP		=	12;
	"Piroquinesia",				// SPL_PYROKINESIS	=	13;
	"Anillo de Muerte",				// SPL_MASSDEATH	=	14;
	"Control",				// SPL_CONTROL		=	15;
	"Muerte a los no-muertos",		// SPL_DESTROYUNDEAD=	16;
	"Virote de fuego",				// SPL_FIREBOLT		=	17;
	"Tormenta de fuego",				// SPL_FIRESTORM	=	18;
	"Lluvia de fuego",				// SPL_FIRERAIN		=	19;
	"n/a",						// SPL_SPEED		=	20;
	"Teleportarse Magos del Fuego",		// SPL_TELEPORT1	=	21;
	"Teleportarse Magos del Agua",	// SPL_TELEPORT2	=	22;
	"Teleportarse Nigromante",	// SPL_TELEPORT3	=	23;
	"Teletransporte orco",		// SPL_TELEPORT4	=	24;
	"Teleportarse Campamento del Pantano",		// SPL_TELEPORT5	=	25;
	"Transformarse en mosca de sangre",	// SPL_TRF_BLOODFLY	=	26;
	"n/a",						// SPL_TRF_BLOODHOUND=	27;
	"Transformarse en reptador de la mina",	// SPL_TRF_CRAWLER	=	28;
	"Transformarse en acechador",		// SPL_TRF_LURKER	=	29;
	"Transformarse en sabandija de carne",	// SPL_TRF_MEATBUG	=	30;
	"Transformarse en ratopo",		// SPL_TRF_MOLERAT	=	31;
	"Transformarse en perro orco",		// SPL_TRF_ORCDOG	=	32;
	"n/a",						// SPL_TRF_RAZOR	=	33;
	"Transformarse en carroñero",	// SPL_TRF_SCAVENGER=	34;
	"n/a",						// SPL_TRF_SCAVENGER2=	35;
	"Transformarse en bestia de sombra",	// SPL_TRF_SHADOWBEAST=	36;
	"Transformarse en chasqueador",		// SPL_TRF_SNAPPER	=	37;
	"Transformarse en lagarto",		// SPL_TRF_WARAN	=	38;
	"Transformarse en lobo",			// SPL_TRF_WOLF		=	39;
	"Relámpago zigzagueante",					// SPL_CHAINLIGHTNING=	40;
	"Rayo de hielo",					// SPL_THUNDERBOLT	=	41;
	"Bola relampagueante",				// SPL_THUNDERBALL	=	42;
	"Bloque de hielo",					// SPL_ICECUBE		=	43;
	"Ola de hielo",					// SPL_ICEWAVE		=	44;
	"Convocar gólem",			// SPL_SUMMONGOLEM	=	45;
	"Ejército de las tinieblas",		// SPL_ARMYOFDARKNESS=	46;
	"Puño de la tormenta",				// SPL_STORMFIST	=	47;
	"n/a",						// SPL_TELEKINESIS2	=	48;
	"Aliento mortal",				// SPL_BREATHOFDEATH=	49;
	"Encoger monstruo",				// SPL_SHRINK		=	50;
	"n/a",						// SPL_UNDRESS		=	51;
	"n/a",						// SPL_DANCE		=	52;
	"Bersérker",					// SPL_BERZERK		=	53;
	"Ira de URIZIEL",			// SPL_NEW1			=	17;
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
	"Espada de una mano",
	"Espada de dos manos",
	"Arco",
	"Ballesta",
	"Cerrajería",
	"Hurto",
	"Magia",
	"Sigilo",
	"Regeneración",
	"Maestro del Fuego",
	"Acrobacia"
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
	"no cualificado|entrenado|maestro",						//NPC_TALENT_1H          
	"no cualificado|entrenado|maestro",                       //NPC_TALENT_2H           
	"no cualificado|entrenado|maestro",                       //NPC_TALENT_BOW         
	"no cualificado|entrenado|maestro",                       //NPC_TALENT_CROSSBOW    
	"no cualificado|entrenado|maestro",                       //NPC_TALENT_PICKLOCK   
	"no cualificado|entrenado|maestro",                       //NPC_TALENT_PICKPOCKET
	"no|Círculo 1|Círculo 2|Círculo 3|Círculo 4|Círculo 5|Círculo 6", //NPC_TALENT_MAGE         
	"No|Sí",                                              //NPC_TALENT_SNEAK       
	"|",                                      		        //NPC_TALENT_REGENERATE 
	"|",                                          		    //NPC_TALENT_FIREMASTER   
	"No|Sí"                                               //NPC_TALENT_ACROBAT      
};

// *****************************************************************************************
// Inventory-Kategorien
// *****************************************************************************************

CONST STRING TXT_INV_CAT [INV_CAT_MAX] = {
	"",
	"Armas",
	"Armadura",
	"Magia",
	"Artefactos",
	"Comida",
	"Pociones",
	"Escritos",
	"Varios"
};


// ***************************************************************************************
// Fokusnamen der Ambient-NSCs
// ***************************************************************************************

CONST STRING NAME_Buddler		= "Cavador";
CONST STRING NAME_Schatten		= "Sombra";
CONST STRING NAME_ConvoiTraeger	= "Porteador de caravana";
CONST STRING NAME_ConvoiWache	= "Guardia de caravana";
CONST STRING NAME_Torwache		= "Guardia de la puerta";
CONST STRING NAME_Brueckenwache	= "Guardia del puente";
CONST STRING NAME_Gardist		= "Guardia";
CONST STRING NAME_Bauer			= "Campesino";
CONST STRING NAME_Schlaeger		= "Matón";
CONST STRING NAME_Schuerfer		= "Raspador";
CONST STRING NAME_Organisator	= "Bandido";
CONST STRING NAME_Soeldner		= "Mercenario";
CONST STRING NAME_Novize		= "Novicio";
CONST STRING NAME_Templer		= "Templario";
CONST STRING NAME_Raeuber		= "Matón";
CONST STRING NAME_Tuersteher	= "Gorila";

const string NAME_MadNovice		=	"Novicio obsesionado";
const string NAME_MadTemplar	=	"Templario fanático";
const string NAME_MadTemplar2	=	"Templario apocalíptico";


// *************************************************************
// DIALOG OPTIONEN
// *************************************************************

CONST STRING DIALOG_ENDE		= "FIN";
CONST STRING DIALOG_BACK		= "ATRÁS";
const string DIALOG_TRADE		= "(Comerciar)";

// *************************************************************
// FOKUSNAMEN DER ITEMS
// *************************************************************

const string NAME_Ring			= "Anillo";
const string NAME_Amulett		= "Amuleto";
const string NAME_Trank			= "Poción";
const string NAME_Rune			= "Runa";
const string NAME_Spruchrolle	= "Pergamino de conjuro";


// *************************************************************
// TEXTE FÜR ITEM-BESCHREIBUNGEN IM INV.
// *************************************************************

const string NAME_Value			= "Valor:";

const string NAME_Mag_Circle	= "Círculo:";
const string NAME_Manakosten	= "Costes en mana:";
const string NAME_ManakostenMax	= "Costes en mana (máx.):";
const string NAME_ManaPerSec	= "Mana por segundo";
const string NAME_Duration		= "Duración (minutos)";

const string NAME_Mana_needed	= "Mana requerido:";
const string NAME_Str_needed	= "Fuerza requerida:";
const string NAME_Dex_needed	= "Destreza requerida:";

const string NAME_Spell_Load	= "Conjuro de carga";
const string NAME_Spell_Invest	= "Conjuro de inversión";

const string NAME_Dam_Edge		= "Daño de arma";
const string NAME_Dam_Point		= "Daño de flecha";
const string NAME_Dam_Fire		= "Daño de fuego";
const string NAME_Dam_Magic		= "Daño de magia";
const string NAME_Dam_Fly		= "Daño de tormenta";

const string NAME_Damage		= "Daño";
const string NAME_PerMana		= " (por mana)";
const string NAME_DamagePerSec	= "Daño por segundo";

const string NAME_Prot_Edge		= "Protección contra armas:";
const string NAME_Prot_Point	= "Protección contra flechas:";
const string NAME_Prot_Fire		= "Protección contra fuego:";
const string NAME_Prot_Magic	= "Protección contra magia:";

const string NAME_Bonus_HP		= "Bonificación de vida:";
const string NAME_Bonus_Mana	= "Bonificación de mana:";

const string NAME_Bonus_HpMax	= "Bonificación a vida máxima:";
const string NAME_Bonus_ManaMax	= "Bonificación a mana máximo:";

const string NAME_Bonus_Dex		= "Bonificación de Destreza:";
const string NAME_Bonus_Str		= "Bonificación de Fuerza:";

const string NAME_OneHanded		= "Arma de una mano";
const string NAME_TwoHanded		= "Arma de dos manos";

//----------------- MH: zusätzlich wegen FlexTranslate ---------------------

const string NAME_HealingPerMana = "Curación por mana"; 

const string NAME_BuyAttributeSTR = "Fuerza +";
const string NAME_BuyAttributeDEX = "Destreza +";
const string NAME_BuyAttributeMAN = "Mana +";

// ***************************************************************************************
// sonstige Bildschirmausgaben
// ***************************************************************************************
const string NAME_XPGained			= "Experiencia +";			// bei jedem Erfahrungsgewinn
const string NAME_LevelUp			= "¡Nuevo nivel!";		// beim Stufenaufstieg

const string NAME_NewLogEntry		= "Nueva anotación en el diario";




//***************************************************************************************
// Stringkonstanten aus den G_FUNCTIONS
//***************************************************************************************
const string _STR_INVALID					= "(Unknown)-"									;

const string _STR_ATTRIBUTE_HITPOINTS		= "puntos de Vida"											;
const string _STR_ATTRIBUTE_HITPOINTS_MAX	= "puntos de Vida máxima"								;
const string _STR_ATTRIBUTE_MANA			= "puntos de Mana"											;
const string _STR_ATTRIBUTE_MANA_MAX		= "puntos de Mana máximo"									;
const string _STR_ATTRIBUTE_STRENGTH		= "puntos de Fuerza"											;
const string _STR_ATTRIBUTE_DEXTERITY		= "puntos de Destreza"								;
const string _STR_ATTRIBUTE_MAGIC_CIRCLE	= "niveles de conjuro mágico"								;

// Bildschirmausgabe, falls der Spieler eine Waffe anlegen will, für die ihm Attributspunkte fehlen
const string _STR_CANNOTUSE_PRE_PLAYER		= "Te faltan "										;
const string _STR_CANNOTUSE_POINTS			= ""											;
const string _STR_CANNOTUSE_LEVELS		    = ""											;
const string _STR_CANNOTUSE_POST			= " para usar este objeto."				;

// Bildschirmausgabe, falls ein NSC zu wenig Attributspunkte, für das Anlegen von Waffen hat (nur Debugzwecke!)
const string _STR_CANNOTUSE_PRE_NPC			= " ("												;
const string _STR_CANNOTUSE_POST_NPC		= ") are missing"										;

// Bidschrimausgabe zum Thema Schloß öffnen/knacken
const string _STR_MESSAGE_INTERACT_NO_KEY	= "No hay ganzúa ni llave.";
const string _STR_MESSAGE_PICKLOCK_SUCCESS	= "Suena bien.";
const string _STR_MESSAGE_PICKLOCK_UNLOCK	= "La cerradura se ha abierto.";
const string _STR_MESSAGE_PICKLOCK_FAILURE	= "Mierda... vuelta a empezar.";
const string _STR_MESSAGE_PICKLOCK_BROKEN	= "La ganzúa se ha roto.";

// Bidschrimausgabe zum Thema Hebel/Winden
const string _STR_MESSAGE_OCLEVER_STUCKS	= "La palanca no se mueve en absoluto."			;
const string _STR_MESSAGE_OCLEVER_MOVES		= "La estatuilla mueve la palanca."			;
const string _STR_MESSAGE_WHEEL_STUCKS		= "El torno está atascado."					;

// Bidschrimausgabe beim storybedingten Transfer von Items
const string _STR_MESSAGE_ITEM_GIVEN		= " objeto entregado"								;	//SPACE davor wichtig, weil Trennzeichen
const string _STR_MESSAGE_ITEMS_GIVEN		= " objetos entregados"							;
const string _STR_MESSAGE_ORE_GIVEN			= " pepitas entregadas"									;
const string _STR_MESSAGE_ITEM_TAKEN		= " objeto recibido"							;
const string _STR_MESSAGE_ITEMS_TAKEN		= " objetos recibidos"							;
const string _STR_MESSAGE_ORE_TAKEN			= " pepitas recibidas"									;

// Bidschrimausgabe fürs Tausch-Fenster
const string _STR_MESSAGE_TRADE_FAILURE		= "El valor de tus bienes no es lo bastante alto."	;

// GILDENAUFNAHMEBEDINGUNG (für die Funktion "B_PrintGuildCondition()" )
const string _STR_MESSAGE_Joincamp			=	"Condición para la admisión: nivel"; 

// nicht beklaubare NSCs
const string _STR_MESSAGE_CANNOTSTEAL		=	"No se puede robar.";

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
const string NAME_BuyArmorPostfix	=	" pepitas)";	
const string NAME_LearnPrefix		=	" (";	
const string NAME_LearnMidfix		=	" pepitas,";
const string NAME_LearnPostfixS		=	" punto de habilidad)";	
const string NAME_LearnPostfixP		=	" puntos de habilidad)";	

const string NAME_LearnStrength_1	=	"Fuerza +1";
const string NAME_LearnStrength_5	=	"Fuerza +5";
const string NAME_LearnStrength_10	=	"Fuerza +10";
const string NAME_LearnStrength_20	=	"Fuerza +20";

const string NAME_LearnDexterity_1	=	"Destreza +1";
const string NAME_LearnDexterity_5	=	"Destreza +5";
const string NAME_LearnDexterity_10	=	"Destreza +10";
const string NAME_LearnDexterity_20	=	"Destreza +20";

const string NAME_LearnMana_1		=	"Mana +1";
const string NAME_LearnMana_5		=	"Mana +5";
const string NAME_LearnMana_10		=	"Mana +10";
const string NAME_LearnMana_20		=	"Mana +20";

const string NAME_Learn1h_1			=	"Espada una mano nivel 1";
const string NAME_Learn1h_2			=	"Espada una mano nivel 2";
const string NAME_Learn2h_1			=	"Espada dos manos nivel 1";
const string NAME_Learn2h_2			=	"Espada dos manos nivel 2";

const string NAME_LearnBow_1		=	"Arco nivel 1";
const string NAME_LearnBow_2		=	"Arco nivel 2";
const string NAME_LearnCrossbow_1	=	"Ballesta nivel 1";
const string NAME_LearnCrossbow_2	=	"Ballesta nivel 2";

const string NAME_LearnMage_1		=	"1er Círculo de Magia";
const string NAME_LearnMage_2		=	"2o Círculo de Magia";
const string NAME_LearnMage_3		=	"3er Círculo de Magia";
const string NAME_LearnMage_4		=	"4o Círculo de Magia";
const string NAME_LearnMage_5		=	"5o Círculo de Magia";
const string NAME_LearnMage_6		=	"6o Círculo de Magia";

const string NAME_LearnPickpocket_1	=	"Hurto nivel 1";
const string NAME_LearnPickpocket_2	=	"Hurto nivel 2";
const string NAME_LearnPicklock_1	=	"Cerrajería nivel 1";
const string NAME_LearnPicklock_2	=	"Cerrajería nivel 2";

const string NAME_LearnAcrobat		=	"Acrobacia";
const string NAME_LearnSneak		=	"Sigilo";

const string NAME_RaiseStrength		=	"Fuerza +";
const string NAME_RaiseDexterity	=	"Destreza +";
const string NAME_RaiseStrDex		=	"Fuerza y Destreza +";
const string NAME_RaiseManaMax		=	"Mana máximo +";
const string NAME_RaiseHealthMax	=	"Vida máxima +";

//---------------- MH: für B_BuildBuyArmorString ----------------------------

const string NAME_CorristoHighRobe	= 	"Maestro, me gustaría vestir la Gran Túnica del Fuego.";
const string NAME_SaturasHighRobe	= 	"Gran túnica";
const string NAME_DiegoHeavyShadows	=	"Armadura p. Sombra. Protecc.: Armas 40, Flechas 5, Fuego 20";
const string NAME_StoneHeavyGuards	= 	"Armadura p. guardia. Protecc.: Armas 70, Flechas 10, Fuego 35";
const string NAME_StoneGuards		= 	"Armadura guardia. Protecc.: Armas 55, Flechas 10, Fuego 25";
const string NAME_WolfBandits		= 	"Armadura de bandido. Protecc.: Armas 35, Flechas 5, Fuego 15"; 
const string NAME_WolfHeavyBandits	= 	"Armadura p. bandido. Protecc.: Armas 40, Flechas 5, Fuego 20";
const string NAME_LeeMercs			= 	"Armadura mercenario. Protecc.: Armas 55, Flechas 10, Fuego 25";
const string NAME_LeeHeavyMercs		= 	"Armadura p. mercenar. Protecc.: Armas 70, Flechas 10, Fuego 35";
const string NAME_FiskLightDiggers	= 	"Pantalón ligero cavador. Protecc.: Armas 10, Fuego 5";
const string NAME_FiskDiggers		= 	"Pantalón cavador. Protecc.: Armas 15, Fuego 5";
const string NAME_GorNaTothHeavyTpl = 	"Armadura p. templar. Protecc.: Armas 70, Flechas 10, Fuego 35";
const string NAME_GorNaTothTpl 		=	"Armadura templario. Protecc.: Armas 55, Flechas 10, Fuego 25";
const string NAME_TorwachenPsiRock	=	"Taparrabos. Protecc.: Armas 15, Fuego 10";




// ***************************************************************************************
// Menuetext-Konstanten
// ***************************************************************************************
// Text, der erscheint, wenn eine Menueoption noch ein APPLY benoetigt (Aufloesung).
// Vermutlich kein Text notwendig, da durch Menuestruktur deutlich gemacht
const string MENU_TEXT_NEEDS_APPLY		= "";

// Text, der erscheint, wenn ein Restart des Spiels notwendig ist (Grafikkartebauswahl).
// Maximal ca. 60 Zeichen, da nur eine Zeile Platz!
const string MENU_TEXT_NEEDS_RESTART	= "Algunos reajustes sólo se activarán después de reiniciar.";

//
//	TRADE MANAGER
//
const string STR_INFO_TRADE_ACCEPT						= "Aceptar"			;
const string STR_INFO_TRADE_RESET						= "Rechazar"			;
const string STR_INFO_TRADE_EXIT						= "ATRÁS"				;

const string STR_BADENIXE = "Nena bañista";

// ****************
// B_Kapitelwechsel
// ****************

const string KapWechsel_1			= "Capítulo 1"					;
const string KapWechsel_1_Text		= "Bienvenido a la colonia"	;
const string KapWechsel_2			= "Capítulo 2"					;
const string KapWechsel_2_Text		= "El nido de los reptadores de la mina"	;
const string KapWechsel_3			= "Capítulo 3"					;
const string KapWechsel_3_Text		= "Artefactos de antiguo poder"	;
const string KapWechsel_4			= "Capítulo 4"					;
const string KapWechsel_4_Text		= "Xardas"						;
const string KapWechsel_5			= "Capítulo 5"					;
const string KapWechsel_5_Text		= "Los Guardianes del Portal"		;
const string KapWechsel_6			= "Capítulo 6"					;
const string KapWechsel_6_Text		= "La guarida del Durmiente"	;
