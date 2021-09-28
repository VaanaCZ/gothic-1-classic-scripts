// *****************************************************************************************
// Mobsi-Fokusnamen
// *****************************************************************************************

CONST STRING MOBNAME_BACKPACK_1		= "";
CONST STRING MOBNAME_CRATE			= "Сундук";
CONST STRING MOBNAME_CHEST			= "Ящик";
CONST STRING MOBNAME_BED			= "Кровать";
CONST STRING MOBNAME_DOOR			= "Дверь";
CONST STRING MOBNAME_CAMP			= "";
CONST STRING MOBNAME_TORCH			= "";
CONST STRING MOBNAME_TORCHHOLDER	= "";
CONST STRING MOBNAME_BARBQ_SCAV		= "";
CONST STRING MOBNAME_BARRELO_OC		= "";
CONST STRING MOBNAME_BENCH			= "";
CONST STRING MOBNAME_ANVIL			= "Наковальня";
CONST STRING MOBNAME_BUCKET			= "Ведро с водой";
CONST STRING MOBNAME_FORGE			= "Печь";
CONST STRING MOBNAME_GRINDSTONE		= "Точильный камень";
CONST STRING MOBNAME_WHEEL			= "Лебедка";
CONST STRING MOBNAME_LAB			= "";
CONST STRING MOBNAME_BOOK			= "";
CONST STRING MOBNAME_CHAIR			= "";
CONST STRING MOBNAME_CAULDRON		= "Котел";
CONST STRING MOBNAME_THRONE			= "";
CONST STRING MOBNAME_PAN			= "Сковорода";
CONST STRING MOBNAME_REPAIR			= "";
CONST STRING MOBNAME_WATERPIPE		= "Кальян";
CONST STRING MOBNAME_LADDER			= "Лестница";
CONST STRING MOBNAME_SWITCH			= "Переключатель";
CONST STRING MOBNAME_BARONSTHRONE	= "";
CONST STRING MOBNAME_ORE			= "Залежи руды";
CONST STRING MOBNAME_ROPEWAY		= "";
CONST STRING MOBNAME_STOMPER		= "";
CONST STRING MOBNAME_BELLOW			= "Кузнечный мех";
CONST STRING MOBNAME_STONEMILL		= "";
CONST STRING MOBNAME_ORC_MUMMY		= "Мумия";
CONST STRING MOBNAME_PILLAR			= "Колонна";
CONST STRING MOBNAME_BASKET_RICE	= "";
CONST STRING MOBNAME_DRUM			= "";
CONST STRING MOBNAME_GROUND_SLOT	= "";
CONST STRING MOBNAME_HERB_PSI		= "Пресс";
CONST STRING MOBNAME_IDOL			= "Статуя";
CONST STRING MOBNAME_LEAN_WALL		= "";
CONST STRING MOBNAME_ORCDRUM		= "";
CONST STRING MOBNAME_TARGETSTONE	= "Мишень";
CONST STRING MOBNAME_SHRINE			= "Саркофаг с сердцем орка";
CONST STRING MOBNAME_SWORDSTONE		= "Необычный камень";


// *****************************************************************************************
// Gildennamen
// *****************************************************************************************

CONST STRING TXT_GUILDS	[GIL_MAX] =	{
// - Charakterblatt (Text der Spielergilde)
// - Debuganzeige (Taste "G")
	" (нет)",
	" Барон",
	" Стражник",
	" Призрак",
	" Маг Огня",
	" Рудокоп",
	" Маг Воды",
	" Наемник",
	" Вор",
	" Крестьянин",
	" Рудокоп",			// 10
	" Гуру",
	" Послушник",
	" Страж",
	" Некромант",
	" Девица",
	"",
	" Ящерица",			// 17
	" Спящий",
	" Гоблин",
	" Тролль",
	" Глорх",
	" Ползун",
	" Мясной жук",
	" Падальщик",
	" Демон",
	" Волк",
	" Мракорис",
	" Шершень",
	" Болотожор",			// 30
	" Зомби",
	" Орк",
	" Скелет",
	" Орочья собака",
	" Кротокрыс",
	" Голем",
	" Шныг",
	"",				// 38
	" Орк-шаман",
	" Орк-воин",
	"Орк-солдат",
	"Орк-раб"
};


// *****************************************************************************************
// Attribut-Beschreibungen
// *****************************************************************************************
/* SN: wird laut Bert nicht mehr benцtigt. Ich kommentier es erst mal eine Version lang aus
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

"TXT_ATTRIBUTE_DESC" - Beschreibung	der	Attribute fьr CharScreen.
"TXT_FIGHT_TALENTS"	- Namen	der	Kampftalente
"TXT_FIGHT_TALENTS_DESC" - Beschreibung	der	Kampftalente fьr CharScreen.
"TXT_TALENTS" -	Namen der sonstigen	Talente
"TXT_TALENTS_DESC" - Beschreibung der Talente fьr CharScreen
"TXT_SPELLS_DESC" -	Beschreibung der Spells	fьr	CharScreen

Die	Reihenfolge	der	jeweiligen Texte kцnnt ihr der Konstantenreihenfolge aus
der	"constants.d" entnehmen, die hier auch mit dranhaengt und fuer
fehlerfreies (Test-)parsen benцtigt	wird.
*/

// *****************************************************************************************
// Zauberspruchnamen
// *****************************************************************************************

CONST STRING TXT_SPELLS	[MAX_SPELL]	= {
	"Свет",					// SPL_LIGHT		=	0;
	"Огненный шар",				// SPL_FIREBALL		=	1;
	"",						// SPL_TRANSFORM	=	2;
	"Страх",					// SPL_FEAR			=	3;
	"Лечение",					// SPL_HEAL			=	4;
	"",						// SPL_LIGHTNING	=	5;
	"Призыв демона",			// SPL_SUMMONDEMON	=	6;
	"Призыв скелета",		// SPL_SUMMONSKELETON=	7;
	"",						// SPL_FORGET		=	8;
	"Кулак ветра",				// SPL_WINDFIST		=	9;
	"Телекинез",				// SPL_TELEKINESIS	=	10;
	"Чары",					// SPL_CHARM		=	11;
	"Сон	",					// SPL_SLEEP		=	12;
	"Пирокинез",				// SPL_PYROKINESIS	=	13;
	"Волна смерти",				// SPL_MASSDEATH	=	14;
	"Контроль",				// SPL_CONTROL		=	15;
	"Уничтожить нежить",		// SPL_DESTROYUNDEAD=	16;
	"Огненная стрела",				// SPL_FIREBOLT		=	17;
	"Огненный шторм",				// SPL_FIRESTORM	=	18;
	"Огненный дождь",				// SPL_FIRERAIN		=	19;
	"",						// SPL_SPEED		=	20;
	"Телепортация к магам Огня",		// SPL_TELEPORT1	=	21;
	"Телепортация к магам Воды",	// SPL_TELEPORT2	=	22;
	"Телепортация к некроманту",	// SPL_TELEPORT3	=	23;
	"Орочье заклинание",		// SPL_TELEPORT4	=	24;
	"Телепортация в Болотный Лагерь",		// SPL_TELEPORT5	=	25;
	"Превращение в шершня ",	// SPL_TRF_BLOODFLY	=	26;
	"n",						// SPL_TRF_BLOODHOUND=	27;
	"Превращение в ползуна",	// SPL_TRF_CRAWLER	=	28;
	"Превращение в шныга",		// SPL_TRF_LURKER	=	29;
	"Превращение в жука",	// SPL_TRF_MEATBUG	=	30;
	"Превращение в кротокрыса",		// SPL_TRF_MOLERAT	=	31;
	"Превращение в орочью собаку",		// SPL_TRF_ORCDOG	=	32;
	"n",						// SPL_TRF_RAZOR	=	33;
	"Превращение в падальщика",	// SPL_TRF_SCAVENGER=	34;
	"n",						// SPL_TRF_SCAVENGER2=	35;
	"Превращение в мракориса",	// SPL_TRF_SHADOWBEAST=	36;
	"Превращение в глорха",		// SPL_TRF_SNAPPER	=	37;
	"Превращение в ящерицу",		// SPL_TRF_WARAN	=	38;
	"Превращение в волка",			// SPL_TRF_WOLF		=	39;
	"Молния",					// SPL_CHAINLIGHTNING=	40;
	"Ледяная стрела",					// SPL_THUNDERBOLT	=	41;
	"Шаровая молния",				// SPL_THUNDERBALL	=	42;
	"Ледяная глыба",					// SPL_ICECUBE		=	43;
	"Ледяная волна",					// SPL_ICEWAVE		=	44;
	"Призыв голема",			// SPL_SUMMONGOLEM	=	45;
	"Армия тьмы",		// SPL_ARMYOFDARKNESS=	46;
	"Шторм",				// SPL_STORMFIST	=	47;
	"n",						// SPL_TELEKINESIS2	=	48;
	"Дыхание смерти",				// SPL_BREATHOFDEATH=	49;
	"Ужас врагов",				// SPL_SHRINK		=	50;
	"n",						// SPL_UNDRESS		=	51;
	"n",						// SPL_DANCE		=	52;
	"Гнев",					// SPL_BERZERK		=	53;
	"Гнев УРИЗЕЛЯ",			// SPL_NEW1			=	17;
	"2",						// SPL_NEW2			=	18;
	"3",						// SPL_NEW3			=	19;
	"4",						// SPL_NEW4			=	20;
	"5"						// SPL_NEW5			=	21;
 };

/* SN: wird laut Bert nicht mehr benцtigt. Ich kommentier es erst mal eine Version lang aus
CONST STRING TXT_SPELLS_DESC [MAX_SPELL] = {
// FIXME: wo werden die benutzt?
	"LichtDescr",						// SPL_LIGHT		=	0;
	"FeuerballDescr",					// SPL_FIREBALL		=	1;
	"VerwandelnDescr",					// SPL_TRANSFORM	=	2;
	"FearDescr",						// SPL_FEAR			=	3;
	"HeilenDescr",						// SPL_HEAL			=	4;
	"BlitzDescr",						// SPL_LIGHTNING	=	5;
	"Dдmon beschw.Descr",				// SPL_SUMMONDEMON	=	6;
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
	"Одноручный меч   ",
	"Двуручный меч   ",
	"Лук    ",
	"Арбалет",
	"Взлом замков",
	"Воровство",
	"Магия",
	"Подкрадывание",
	"Регенерация",
	"Мастер Огня",
	"Акробатика"
};

/* SN: wird laut Bert nicht mehr benцtigt. Ich kommentier es erst mal eine Version lang aus
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
	"                                                   ",	
	"не обучен|ученик|мастер",						//NPC_TALENT_1H          
	"не обучен|ученик|мастер",                       //NPC_TALENT_2H           
	"не обучен|ученик|мастер",                       //NPC_TALENT_BOW         
	"не обучен|ученик|мастер",                       //NPC_TALENT_CROSSBOW    
	"не обучен|ученик|мастер",                       //NPC_TALENT_PICKLOCK   
	"не обучен|ученик|мастер",                       //NPC_TALENT_PICKPOCKET
	"нет|1 Круг|2 Круг|3 Круг|4 Круг|5 Круг|6 Круг", //NPC_TALENT_MAGE         
	"нет|да",                                              //NPC_TALENT_SNEAK       
	"|",                                      		        //NPC_TALENT_REGENERATE 
	"|",                                          		    //NPC_TALENT_FIREMASTER   
	"нет|да"                                               //NPC_TALENT_ACROBAT      
};

// *****************************************************************************************
// Inventory-Kategorien
// *****************************************************************************************

CONST STRING TXT_INV_CAT [INV_CAT_MAX] = {
	"             ",
	"Оружие",
	"Доспехи",
	"Магия",
	"Артефакты",
	"Пища",
	"Зелья",
	"Документы",
	"Разное"
};


// ***************************************************************************************
// Fokusnamen der Ambient-NSCs
// ***************************************************************************************

CONST STRING NAME_Buddler		= "Рудокоп";
CONST STRING NAME_Schatten		= "Призрак";
CONST STRING NAME_ConvoiTraeger	= "Грузчик";
CONST STRING NAME_ConvoiWache	= "Охранник";
CONST STRING NAME_Torwache		= "Привратник";
CONST STRING NAME_Brueckenwache	= "Стражник у моста";
CONST STRING NAME_Gardist		= "Стражник";
CONST STRING NAME_Bauer			= "Крестьянин";
CONST STRING NAME_Schlaeger		= "Охранник";
CONST STRING NAME_Schuerfer		= "Рудокоп";
CONST STRING NAME_Organisator	= "Вор";
CONST STRING NAME_Soeldner		= "Наемник";
CONST STRING NAME_Novize		= "Послушник";
CONST STRING NAME_Templer		= "Страж";
CONST STRING NAME_Raeuber		= "Грабитель";
CONST STRING NAME_Tuersteher	= "Вышибала";

const string NAME_MadNovice		=	"Одержимый послушник";
const string NAME_MadTemplar	=	"Фанатичный Страж";
const string NAME_MadTemplar2	=	"Страж Апокалипсиса";


// *************************************************************
// DIALOG OPTIONEN
// *************************************************************

CONST STRING DIALOG_ENDE		= "ЗАКОНЧИТЬ РАЗГОВОР";
CONST STRING DIALOG_BACK		= "НАЗАД";
const string DIALOG_TRADE		= "(Обмен)";

// *************************************************************
// FOKUSNAMEN DER ITEMS
// *************************************************************

const string NAME_Ring			= "Кольцо";
const string NAME_Amulett		= "Амулет";
const string NAME_Trank			= "Зелье";
const string NAME_Rune			= "Руна";
const string NAME_Spruchrolle	= "Свиток";


// *************************************************************
// TEXTE FЬR ITEM-BESCHREIBUNGEN IM INV.
// *************************************************************

const string NAME_Value			= "Цена:";

const string NAME_Mag_Circle	= "Круг:";
const string NAME_Manakosten	= "Магическая сила:";
const string NAME_ManakostenMax	= "Магическая сила (макс.):";
const string NAME_ManaPerSec	= "Маг. силы в сек.";
const string NAME_Duration		= "Длительность (мин.)";

const string NAME_Mana_needed	= "Требуемая маг. сила:";
const string NAME_Str_needed	= "Требуемая сила:";
const string NAME_Dex_needed	= "Требуемая ловкость:";

const string NAME_Spell_Load	= "Зарядное заклинание";
const string NAME_Spell_Invest	= "Инвестир. заклинание";

const string NAME_Dam_Edge		= "Урон от оружия";
const string NAME_Dam_Point		= "Урон от стрел";
const string NAME_Dam_Fire		= "Огненный урон";
const string NAME_Dam_Magic		= "Магический урон";
const string NAME_Dam_Fly		= "Урон от электричества";

const string NAME_Damage		= "Урон:";
const string NAME_PerMana		= " (за единицу маг. силы)";
const string NAME_DamagePerSec	= "Урон в сек.";

const string NAME_Prot_Edge		= "Защита от оружия:";
const string NAME_Prot_Point	= "Защита от стрел:";
const string NAME_Prot_Fire		= "Защита от огня:";
const string NAME_Prot_Magic	= "Защита от магии:";

const string NAME_Bonus_HP		= "Бонус к жизненной силе:";
const string NAME_Bonus_Mana	= "Бонус к маг. силе:";

const string NAME_Bonus_HpMax	= "Бонус за макс. жизненную силу:";
const string NAME_Bonus_ManaMax	= "Бонус за макс. маг. силу:";

const string NAME_Bonus_Dex		= "Бонус к ловкости:";
const string NAME_Bonus_Str		= "Бонус к силе:";

const string NAME_OneHanded		= "Одноручное оружие";
const string NAME_TwoHanded		= "Двуручное оружие";

// ***************************************************************************************
// sonstige Bildschirmausgaben
// ***************************************************************************************
const string NAME_XPGained			= "Опыт +";			// bei jedem Erfahrungsgewinn
const string NAME_LevelUp			= "Достигнут новый уровень!";		// beim Stufenaufstieg

const string NAME_NewLogEntry		= "В дневнике появилась новая запись.";




//***************************************************************************************
// Stringkonstanten aus den G_FUNCTIONS
//***************************************************************************************
const string _STR_INVALID					= "(Неизвестно)-"									;

const string _STR_ATTRIBUTE_HITPOINTS		= "жизненной силы "											;
const string _STR_ATTRIBUTE_HITPOINTS_MAX	= "макс. жизненной силы "								;
const string _STR_ATTRIBUTE_MANA			= "маг. силы "											;
const string _STR_ATTRIBUTE_MANA_MAX		= "макс. маг. силы "									;
const string _STR_ATTRIBUTE_STRENGTH		= "силы "											;
const string _STR_ATTRIBUTE_DEXTERITY		= "ловкости "								;
const string _STR_ATTRIBUTE_MAGIC_CIRCLE	= "Нет нужного"								;

// Bildschirmausgabe, falls der Spieler eine Waffe anlegen will, fьr die ihm Attributspunkte fehlen
const string _STR_CANNOTUSE_PRE_PLAYER		= "Недостаточно "										;
const string _STR_CANNOTUSE_POINTS			= ""											;
const string _STR_CANNOTUSE_LEVELS		    = "Круга магии "											;
const string _STR_CANNOTUSE_POST			= "для использования."				;

// Bildschirmausgabe, falls ein NSC zu wenig Attributspunkte, fьr das Anlegen von Waffen hat (nur Debugzwecke!)
const string _STR_CANNOTUSE_PRE_NPC			= " ("												;
const string _STR_CANNOTUSE_POST_NPC		= ") отсутствует."										;

// Bidschrimausgabe zum Thema SchloЯ цffnen/knacken
const string _STR_MESSAGE_INTERACT_NO_KEY	= "Нет отмычки или подходящего ключа.";
const string _STR_MESSAGE_PICKLOCK_SUCCESS	= "Слышу щелчок. Все идет как надо.";
const string _STR_MESSAGE_PICKLOCK_UNLOCK	= "Замок взломан.";
const string _STR_MESSAGE_PICKLOCK_FAILURE	= "Черт... Ничего на вышло.";
const string _STR_MESSAGE_PICKLOCK_BROKEN	= "Отмычка сломалась.";

// Bidschrimausgabe zum Thema Hebel/Winden
const string _STR_MESSAGE_OCLEVER_STUCKS	= "Я не могу сдвинуть рычаг."			;
const string _STR_MESSAGE_OCLEVER_MOVES		= "Рычаг подвинулся с помощью статуи."			;
const string _STR_MESSAGE_WHEEL_STUCKS		= "Лебедка застопорилась."					;

// Bidschrimausgabe beim storybedingten Transfer von Items
const string _STR_MESSAGE_ITEM_GIVEN		= " предмет отдан."								;	//SPACE davor wichtig, weil Trennzeichen
const string _STR_MESSAGE_ITEMS_GIVEN		= " предметов отдано."							;
const string _STR_MESSAGE_ORE_GIVEN			= " кусков руды отдано."									;
const string _STR_MESSAGE_ITEM_TAKEN		= " предмет получен."							;
const string _STR_MESSAGE_ITEMS_TAKEN		= " предметов получено."							;
const string _STR_MESSAGE_ORE_TAKEN			= " кусков руды получено."									;

// Bidschrimausgabe fьrs Tausch-Fenster
const string _STR_MESSAGE_TRADE_FAILURE		= "Это неравноценный обмен."	;

// GILDENAUFNAHMEBEDINGUNG (fьr die Funktion "B_PrintGuildCondition()" )
const string _STR_MESSAGE_Joincamp			=	"Условие: уровень"; 

// nicht beklaubare NSCs
const string _STR_MESSAGE_CANNOTSTEAL		=	"Воровство невозможно.";

// ***************************************************************************************
// Relative Y-Koordinaten fьr die Bildschirmausgabe (in % der aktuellen Bildhцhe)
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
const string NAME_BuyArmorPostfix	=	" руды)";	
const string NAME_LearnPrefix		=	" (";	
const string NAME_LearnMidfix		=	" руды,";
const string NAME_LearnPostfixS		=	" очко обучения)";	
const string NAME_LearnPostfixP		=	" очков обучения)";	

const string NAME_LearnStrength_1	=	"Сила +1";
const string NAME_LearnStrength_5	=	"Сила +5";
const string NAME_LearnStrength_10	=	"Сила +10";
const string NAME_LearnStrength_20	=	"Сила +20";

const string NAME_LearnDexterity_1	=	"Ловкость +1";
const string NAME_LearnDexterity_5	=	"Ловкость +5";
const string NAME_LearnDexterity_10	=	"Ловкость +10";
const string NAME_LearnDexterity_20	=	"Ловкость +20";

const string NAME_LearnMana_1		=	"Магическая сила +1";
const string NAME_LearnMana_5		=	"Магическая сила +5";
const string NAME_LearnMana_10		=	"Магическая сила +10";
const string NAME_LearnMana_20		=	"Магическая сила +20";

const string NAME_Learn1h_1			=	"Первый уровень - одноручное оружие";
const string NAME_Learn1h_2			=	"Второй уровень - одноручное оружие";
const string NAME_Learn2h_1			=	"Первый уровень - двуручное оружие";
const string NAME_Learn2h_2			=	"Второй уровень - двуручное оружие";

const string NAME_LearnBow_1		=	"Первый уровень - лук";
const string NAME_LearnBow_2		=	"Второй уровень - лук";
const string NAME_LearnCrossbow_1	=	"Первый уровень - арбалет";
const string NAME_LearnCrossbow_2	=	"Второй уровень - арбалет";

const string NAME_LearnMage_1		=	"1-й Круг магии";
const string NAME_LearnMage_2		=	"2-й Круг магии";
const string NAME_LearnMage_3		=	"3-й Круг магии";
const string NAME_LearnMage_4		=	"4-й Круг магии";
const string NAME_LearnMage_5		=	"5-й Круг магии";
const string NAME_LearnMage_6		=	"6-й Круг магии";

const string NAME_LearnPickpocket_1	=	"Первый уровень - воровство";
const string NAME_LearnPickpocket_2	=	"Второй уровень - воровство";
const string NAME_LearnPicklock_1	=	"Первый уровень - взлом замков";
const string NAME_LearnPicklock_2	=	"Второй уровень - взлом замков";

const string NAME_LearnAcrobat		=	"Акробатика";
const string NAME_LearnSneak		=	"Подкрадывание";

const string NAME_RaiseStrength		=	"Сила +";
const string NAME_RaiseDexterity	=	"Ловкость +";
const string NAME_RaiseStrDex		=	"Сила и ловкость +";
const string NAME_RaiseManaMax		=	"Макс. маг. сила +";
const string NAME_RaiseHealthMax	=	"Макс. жизненная сила +";

// ***************************************************************************************
// Menuetext-Konstanten
// ***************************************************************************************
// Text, der erscheint, wenn eine Menueoption noch ein APPLY benoetigt (Aufloesung).
// Vermutlich kein Text notwendig, da durch Menuestruktur deutlich gemacht
const string MENU_TEXT_NEEDS_APPLY		= "";

// Text, der erscheint, wenn ein Restart des Spiels notwendig ist (Grafikkartebauswahl).
// Maximal ca. 60 Zeichen, da nur eine Zeile Platz!
const string MENU_TEXT_NEEDS_RESTART	= "Некоторые настройки будут задействованы только после повторного запуска игры.";
