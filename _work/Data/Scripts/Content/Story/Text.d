// *****************************************************************************************
// Mobsi-Fokusnamen
// *****************************************************************************************

CONST STRING MOBNAME_BACKPACK_1		= "";
CONST STRING MOBNAME_CRATE			= "Коробка";
CONST STRING MOBNAME_CHEST			= "Сундук";
CONST STRING MOBNAME_BED			= "Кровать";
CONST STRING MOBNAME_DOOR			= "Дверь";
CONST STRING MOBNAME_CAMP			= "";
CONST STRING MOBNAME_TORCH			= "";
CONST STRING MOBNAME_TORCHHOLDER	= "";
CONST STRING MOBNAME_BARBQ_SCAV		= "";
CONST STRING MOBNAME_BARRELO_OC		= "";
CONST STRING MOBNAME_BENCH			= "";
CONST STRING MOBNAME_ANVIL			= "Наковальня";
CONST STRING MOBNAME_BUCKET			= "Ведро";
CONST STRING MOBNAME_FORGE			= "Горнило";
CONST STRING MOBNAME_GRINDSTONE		= "Точило";
CONST STRING MOBNAME_WHEEL			= "Лебедка";
CONST STRING MOBNAME_LAB			= "";
CONST STRING MOBNAME_BOOK			= "";
CONST STRING MOBNAME_CHAIR			= "";
CONST STRING MOBNAME_CAULDRON		= "Котел";
CONST STRING MOBNAME_THRONE			= "";
CONST STRING MOBNAME_PAN			= "Сковорода";
CONST STRING MOBNAME_REPAIR			= "";
CONST STRING MOBNAME_WATERPIPE		= "Труба";
CONST STRING MOBNAME_LADDER			= "Лестница";
CONST STRING MOBNAME_SWITCH			= "Переключатель";
CONST STRING MOBNAME_BARONSTHRONE	= "";
CONST STRING MOBNAME_ORE			= "Руда";
CONST STRING MOBNAME_ROPEWAY		= "";
CONST STRING MOBNAME_STOMPER		= "";
CONST STRING MOBNAME_BELLOW			= "Мехи";
CONST STRING MOBNAME_STONEMILL		= "";
CONST STRING MOBNAME_ORC_MUMMY		= "Мумия";
CONST STRING MOBNAME_PILLAR			= "Колонна";
CONST STRING MOBNAME_BASKET_RICE	= "";
CONST STRING MOBNAME_DRUM			= "";
CONST STRING MOBNAME_GROUND_SLOT	= "нет";
CONST STRING MOBNAME_HERB_PSI		= "Пресс";
CONST STRING MOBNAME_IDOL			= "Статуэтка";
CONST STRING MOBNAME_LEAN_WALL		= "";
CONST STRING MOBNAME_ORCDRUM		= "";
CONST STRING MOBNAME_TARGETSTONE	= "Цель";
CONST STRING MOBNAME_SHRINE			= "Святилище орков";
CONST STRING MOBNAME_SWORDSTONE		= "Странное святилище";


// *****************************************************************************************
// Gildennamen
// *****************************************************************************************

CONST STRING TXT_GUILDS	[GIL_MAX] =	{
// - Charakterblatt (Text der Spielergilde)
// - Debuganzeige (Taste "G")
	"(нет)",
	"Барон",
	"Стражник",
	"Призрак",
	"Маг Огня",
	"Рудокоп",
	"Маг Воды",
	"Наемник",
	"Вор",
	"Крестьянин",
	"Скребок",			// 10
	"Гуру",
	"Послушник",
	"Страж",
	"Некромант",
	"Девица",
	"",
	"Ящерица",			// 17
	"Спящий",
	"Гоблин",
	"Тролль",
	"Глорх",
	"Ползун",
	"Мясной жук",
	"Падальщик",
	"Демон",
	"Волк",
	"Мракорис",
	"Шершень",
	"Болотожор",			// 30
	"Зомби",
	"Орк-зомби",
	"Скелетон",
	"Орочья гончая",
	"Кротокрыс",
	"Голем",
	"Шныг",
	"",				// 38
	"Шаман орков",
	"Воин орков",
	"Разведчик орков",
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
	"нет",						// SPL_TRANSFORM	=	2;
	"Страх",					// SPL_FEAR			=	3;
	"Исцеление",					// SPL_HEAL			=	4;
	"нет",						// SPL_LIGHTNING	=	5;
	"Создать демона",			// SPL_SUMMONDEMON	=	6;
	"Создать скелетонов",		// SPL_SUMMONSKELETON=	7;
	"нет",						// SPL_FORGET		=	8;
	"Кулак ветра",				// SPL_WINDFIST		=	9;
	"Телекинез",				// SPL_TELEKINESIS	=	10;
	"Чары",					// SPL_CHARM		=	11;
	"Сон",					// SPL_SLEEP		=	12;
	"Пирокинез",				// SPL_PYROKINESIS	=	13;
	"Кольцо смерти",				// SPL_MASSDEATH	=	14;
	"Контроль",				// SPL_CONTROL		=	15;
	"Смерть нежити",		// SPL_DESTROYUNDEAD=	16;
	"Огненная стрела",				// SPL_FIREBOLT		=	17;
	"Огненный шторм",				// SPL_FIRESTORM	=	18;
	"Огненный дождь",				// SPL_FIRERAIN		=	19;
	"нет",						// SPL_SPEED		=	20;
	"Портал к Магам Огня",		// SPL_TELEPORT1	=	21;
	"Портал к Магам Воды",	// SPL_TELEPORT2	=	22;
	"Портал к Некроманту",	// SPL_TELEPORT3	=	23;
	"Портал к оркам",		// SPL_TELEPORT4	=	24;
	"Портал в Болотный Лагерь",		// SPL_TELEPORT5	=	25;
	"Трансформация в шершня",	// SPL_TRF_BLOODFLY	=	26;
	"нет",						// SPL_TRF_BLOODHOUND=	27;
	"Трансформация в ползуна",	// SPL_TRF_CRAWLER	=	28;
	"Трансформация в шныгу",		// SPL_TRF_LURKER	=	29;
	"Трансформация в мясного жука",	// SPL_TRF_MEATBUG	=	30;
	"Трансформация в кротокрыса",		// SPL_TRF_MOLERAT	=	31;
	"Трансформация в орочью гончую",		// SPL_TRF_ORCDOG	=	32;
	"нет",						// SPL_TRF_RAZOR	=	33;
	"Трансформация в падальщика",	// SPL_TRF_SCAVENGER=	34;
	"n/a",						// SPL_TRF_SCAVENGER2=	35;
	"Трансформация в мракориса",	// SPL_TRF_SHADOWBEAST=	36;
	"Трансформация в глорха",		// SPL_TRF_SNAPPER	=	37;
	"Трансформация в ящерицу",		// SPL_TRF_WARAN	=	38;
	"Трансформация в волка",			// SPL_TRF_WOLF		=	39;
	"Молния",					// SPL_CHAINLIGHTNING=	40;
	"Ледяная стрела",					// SPL_THUNDERBOLT	=	41;
	"Шаровая молния",				// SPL_THUNDERBALL	=	42;
	"Ледяная глыба",					// SPL_ICECUBE		=	43;
	"Ледяная волна",					// SPL_ICEWAVE		=	44;
	"Создать голема",			// SPL_SUMMONGOLEM	=	45;
	"Аримия тьмы",		// SPL_ARMYOFDARKNESS=	46;
	"Кулак шторма",				// SPL_STORMFIST	=	47;
	"нет",						// SPL_TELEKINESIS2	=	48;
	"Дыхание смерти",				// SPL_BREATHOFDEATH=	49;
	"Исчезновение монстра",				// SPL_SHRINK		=	50;
	"нет",						// SPL_UNDRESS		=	51;
	"нет",						// SPL_DANCE		=	52;
	"Берсеркер",					// SPL_BERZERK		=	53;
	"Гнем Уризеля",			// SPL_NEW1			=	17;
	"Новый2",						// SPL_NEW2			=	18;
	"Новый3",						// SPL_NEW3			=	19;
	"Новый4",						// SPL_NEW4			=	20;
	"Новый5"						// SPL_NEW5			=	21;
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
	"Одноручный меч",
	"Двуручный меч",
	"Лук",
	"Арбалет",
	"Вскрытие замков",
	"Кража",
	"Магия",
	"Подкрадывание",
	"Восстановление",
	"Мастер огня",
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
	"",	
	"не обучен|обучен|мастер",						//NPC_TALENT_1H          
	"не обучен|обучен|мастер",                       //NPC_TALENT_2H           
	"не обучен|обучен|мастер",                       //NPC_TALENT_BOW         
	"не обучен|обучен|мастер",                       //NPC_TALENT_CROSSBOW    
	"не обучен|обучен|мастер",                       //NPC_TALENT_PICKLOCK   
	"не обучен|обучен|мастер",                       //NPC_TALENT_PICKPOCKET
	"не обучен|Круг 1|Круг 2|Круг 3|Круг 4|Круг 5|Круг 6", //NPC_TALENT_MAGE         
	"не обучен|обучен",                                              //NPC_TALENT_SNEAK       
	"|",                                      		        //NPC_TALENT_REGENERATE 
	"|",                                          		    //NPC_TALENT_FIREMASTER   
	"не обучен|обучен"                                               //NPC_TALENT_ACROBAT      
};

// *****************************************************************************************
// Inventory-Kategorien
// *****************************************************************************************

CONST STRING TXT_INV_CAT [INV_CAT_MAX] = {
	"",
	"Оружие",
	"Доспехи",
	"Магия",
	"Артефакты",
	"Еда",
	"Эликсиры",
	"Документы",
	"Разное"
};


// ***************************************************************************************
// Fokusnamen der Ambient-NSCs
// ***************************************************************************************

CONST STRING NAME_Buddler		= "Рудокоп";
CONST STRING NAME_Schatten		= "Призрак";
CONST STRING NAME_ConvoiTraeger	= "Носильщик";
CONST STRING NAME_ConvoiWache	= "Охранник";
CONST STRING NAME_Torwache		= "Стражник у ворот";
CONST STRING NAME_Brueckenwache	= "Стражник у моста";
CONST STRING NAME_Gardist		= "Стражник";
CONST STRING NAME_Bauer			= "Крестьянин";
CONST STRING NAME_Schlaeger		= "Головорез";
CONST STRING NAME_Schuerfer		= "Скребок";
CONST STRING NAME_Organisator	= "Вор";
CONST STRING NAME_Soeldner		= "Наемник";
CONST STRING NAME_Novize		= "Послушник";
CONST STRING NAME_Templer		= "Страж";
CONST STRING NAME_Raeuber		= "Головорез";
CONST STRING NAME_Tuersteher	= "Громила";

const string NAME_MadNovice		=	"Фанатичный послушник";
const string NAME_MadTemplar	=	"Фанатичный страж";
const string NAME_MadTemplar2	=	"Апокалипсический страж";


// *************************************************************
// DIALOG OPTIONEN
// *************************************************************

CONST STRING DIALOG_ENDE		= "ЗАКОНЧИТЬ";
CONST STRING DIALOG_BACK		= "НАЗАД";
const string DIALOG_TRADE		= "(Торговать)";

// *************************************************************
// FOKUSNAMEN DER ITEMS
// *************************************************************

const string NAME_Ring			= "Кольцо";
const string NAME_Amulett		= "Амулет";
const string NAME_Trank			= "Эликсир";
const string NAME_Rune			= "Руна";
const string NAME_Spruchrolle	= "Свиток";


// *************************************************************
// TEXTE FЬR ITEM-BESCHREIBUNGEN IM INV.
// *************************************************************

const string NAME_Value			= "Ценность:";

const string NAME_Mag_Circle	= "Круг:";
const string NAME_Manakosten	= "Стоит маны:";
const string NAME_ManakostenMax	= "Стоит маны (макс.):";
const string NAME_ManaPerSec	= "Маны в сек.";
const string NAME_Duration		= "Длительность (мин.)";

const string NAME_Mana_needed	= "Требуется маны:";
const string NAME_Str_needed	= "Требуется силы:";
const string NAME_Dex_needed	= "Требуется ловкости:";

const string NAME_Spell_Load	= "Заклинание заряда";
const string NAME_Spell_Invest	= "Заклининие покрова";

const string NAME_Dam_Edge		= "Урон от оружия";
const string NAME_Dam_Point		= "Урон от стрелы";
const string NAME_Dam_Fire		= "Урон от огня";
const string NAME_Dam_Magic		= "Урон от магии";
const string NAME_Dam_Fly		= "Урон от электричества";

const string NAME_Damage		= "Урон:";
const string NAME_PerMana		= " (за единицу маны)";
const string NAME_DamagePerSec	= "Урон в секунду";

const string NAME_Prot_Edge		= "Защита от оружия:";
const string NAME_Prot_Point	= "Защита от стрел:";
const string NAME_Prot_Fire		= "Защита от огня:";
const string NAME_Prot_Magic	= "Защита от магии:";

const string NAME_Bonus_HP		= "Бонус к жизни:";
const string NAME_Bonus_Mana	= "Бонус к мане:";

const string NAME_Bonus_HpMax	= "Бонус за максимальную жизнь:";
const string NAME_Bonus_ManaMax	= "Бонус за максимальную ману:";

const string NAME_Bonus_Dex		= "Бонус к ловкости:";
const string NAME_Bonus_Str		= "Бонус к силе:";

const string NAME_OneHanded		= "Одноручное оружие";
const string NAME_TwoHanded		= "Двуручное оружие";

//----------------- MH: zusдtzlich wegen FlexTranslate ---------------------

const string NAME_HealingPerMana = "Исцеление за ед. маны"; 

const string NAME_BuyAttributeSTR = "Сила +";
const string NAME_BuyAttributeDEX = "Ловкость +";
const string NAME_BuyAttributeMAN = "Мана +";

// ***************************************************************************************
// sonstige Bildschirmausgaben
// ***************************************************************************************
const string NAME_XPGained			= "опыт +";			// bei jedem Erfahrungsgewinn
const string NAME_LevelUp			= "Достигнут новый уровень!";				// beim Stufenaufstieg

const string NAME_NewLogEntry		= "Новая запись в дневнике";




//***************************************************************************************
// Stringkonstanten aus den G_FUNCTIONS
//***************************************************************************************
const string _STR_INVALID					= "(неизвестно)-"								;

const string _STR_ATTRIBUTE_HITPOINTS		= "жизни"									;
const string _STR_ATTRIBUTE_HITPOINTS_MAX	= "максимальной жизни"							;
const string _STR_ATTRIBUTE_MANA			= "маны"									;
const string _STR_ATTRIBUTE_MANA_MAX		= "максимальной маны"							;
const string _STR_ATTRIBUTE_STRENGTH		= "силы"								;
const string _STR_ATTRIBUTE_DEXTERITY		= "ловкости"								;
const string _STR_ATTRIBUTE_MAGIC_CIRCLE	= "Для использования этого предмета необходимо знание "								;

// Bildschirmausgabe, falls der Spieler eine Waffe anlegen will, fьr die ihm Attributspunkte fehlen
const string _STR_CANNOTUSE_PRE_PLAYER		= "Для использования этого предмета вам не хватает "						;
const string _STR_CANNOTUSE_POINTS			= "ед. "									;
const string _STR_CANNOTUSE_LEVELS		    = " Круга Магии!"									;
const string _STR_CANNOTUSE_POST			= "!"						;

// Bildschirmausgabe, falls ein NSC zu wenig Attributspunkte, fьr das Anlegen von Waffen hat (nur Debugzwecke!)
const string _STR_CANNOTUSE_PRE_NPC			= " ("												;
const string _STR_CANNOTUSE_POST_NPC		= ")  не хватает"									;

// Bidschrimausgabe zum Thema SchloЯ цffnen/knacken
const string _STR_MESSAGE_INTERACT_NO_KEY	= "Нет отмычки или ключа.";
const string _STR_MESSAGE_PICKLOCK_SUCCESS	= "звучит хорошо.";
const string _STR_MESSAGE_PICKLOCK_UNLOCK	= "Замок открыт.";
const string _STR_MESSAGE_PICKLOCK_FAILURE	= "Черт... все сначала.";
const string _STR_MESSAGE_PICKLOCK_BROKEN	= "Отмычка сломалась.";

// Bidschrimausgabe zum Thema Hebel/Winden
const string _STR_MESSAGE_OCLEVER_STUCKS	= "Рычаг не двигается."			;
const string _STR_MESSAGE_OCLEVER_MOVES		= "Статуэтка двигает рычаг."			;
const string _STR_MESSAGE_WHEEL_STUCKS		= "Лебедка заела."					;

// Bidschrimausgabe beim storybedingten Transfer von Items
const string _STR_MESSAGE_ITEM_GIVEN		= "Отдан 1 предмет"							;	//SPACE davor wichtig, weil Trennzeichen
const string _STR_MESSAGE_ITEM_TAKEN		= "Получен 1 предмет"							;
const string _STR_MESSAGE_ITEMS_GIVEN		= "Отдано предметов: "							;
const string _STR_MESSAGE_ITEMS_TAKEN		= "Получено предметов: "						;
const string _STR_MESSAGE_ORE_GIVEN			= "Отдано руды: "								;
const string _STR_MESSAGE_ORE_TAKEN			= "Получено руды: "							;

// Bidschrimausgabe fьrs Tausch-Fenster
const string _STR_MESSAGE_TRADE_FAILURE		= "Стоимость товаров недостаточно высока."	;

// GILDENAUFNAHMEBEDINGUNG (fьr die Funktion "B_PrintGuildCondition()" )
const string _STR_MESSAGE_Joincamp			=	"Условие принятия: Уровень "; 

// nicht beklaubare NSCs
const string _STR_MESSAGE_CANNOTSTEAL		=	"Кража невозможна.";

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
const string NAME_LearnMidfix		=	" руды, ";
const string NAME_LearnPostfixS		=	"оч. обучения)";	
const string NAME_LearnPostfixP		=	"оч. обучения)";	

const string NAME_LearnStrength_1	=	"Сила +1";
const string NAME_LearnStrength_5	=	"Сила +5";
const string NAME_LearnStrength_10	=	"Сила +10";
const string NAME_LearnStrength_20	=	"Сила +20";

const string NAME_LearnDexterity_1	=	"Ловкость +1";
const string NAME_LearnDexterity_5	=	"Ловкость +5";
const string NAME_LearnDexterity_10	=	"Ловкость +10";
const string NAME_LearnDexterity_20	=	"Ловкость +20";

const string NAME_LearnMana_1		=	"Мана +1";
const string NAME_LearnMana_5		=	"Мана +5";
const string NAME_LearnMana_10		=	"Мана +10";
const string NAME_LearnMana_20		=	"Мана +20";

const string NAME_Learn1h_1			=	"Одноручный меч, уровень 1";
const string NAME_Learn1h_2			=	"Одноручный меч, уровень 2";
const string NAME_Learn2h_1			=	"Двуручный меч, уровень 1";
const string NAME_Learn2h_2			=	"Двуручный меч, уровень 1";

const string NAME_LearnBow_1		=	"Лук, уровень 1";
const string NAME_LearnBow_2		=	"Лук, уровень 2";
const string NAME_LearnCrossbow_1	=	"Арбалет, уровень 1";
const string NAME_LearnCrossbow_2	=	"Арбалет, уровень 2";

const string NAME_LearnMage_1		=	"Первый круг магии";
const string NAME_LearnMage_2		=	"Второй круг магии";
const string NAME_LearnMage_3		=	"Третий круг магии";
const string NAME_LearnMage_4		=	"Четвертый круг магии";
const string NAME_LearnMage_5		=	"Пятый круг магии";
const string NAME_LearnMage_6		=	"Шестой круг магии";

const string NAME_LearnPickpocket_1	=	"Кража, уровень 1";
const string NAME_LearnPickpocket_2	=	"Кража, уровень 2";
const string NAME_LearnPicklock_1	=	"Вскрывание замков, уровень 1";
const string NAME_LearnPicklock_2	=	"Вскрывание замков, уровень 2";

const string NAME_LearnAcrobat		=	"Акробатика";
const string NAME_LearnSneak		=	"Подкрадывание";

const string NAME_RaiseStrength		=	"Сила +";
const string NAME_RaiseDexterity	=	"Ловкость +";
const string NAME_RaiseStrDex		=	"Сила и ловкость +";
const string NAME_RaiseManaMax		=	"Максимальная мана +";
const string NAME_RaiseHealthMax	=	"Максимальная жизнь +";

//---------------- MH: fьr B_BuildBuyArmorString ----------------------------

const string NAME_CorristoHighRobe	= 	"Господин мой, я хочу носить облачение высших магов Огня.";
const string NAME_SaturasHighRobe	= 	"Облачение высших магов";
const string NAME_DiegoHeavyShadows	=	"Тяжелый доспех призраков. Защита: от оружия 40, от стрел 5, от огня 20";
const string NAME_StoneHeavyGuards	= 	"Тяжелый доспех стражника. Защита: от оружия 70, от стрел 10, от огня 35";
const string NAME_StoneGuards		= 	"Доспех стражника. Защита: от оружия 55, от стрел 10, от огня 25";
const string NAME_WolfBandits		= 	"Доспех вора. Защита: от оружия 35, от стрел 5, от огня 15"; 
const string NAME_WolfHeavyBandits	= 	"Тяжелый доспех вора. Защита: от оружия 40, от стрел 5, от огня 20";
const string NAME_LeeMercs			= 	"Доспех наемника. Защита: от оружия 55, от стрел 10, от огня 25";
const string NAME_LeeHeavyMercs		= 	"Тяжелый доспех наемника. Защита: от оружия 70, от стрел 10, от огня 35";
const string NAME_FiskLightDiggers	= 	"Простые штаны рудокопа. Защита: от оружия 10, от огня 5";
const string NAME_FiskDiggers		= 	"Штаны рудокопа. Защита: от оружия 15, от огня 5";
const string NAME_GorNaTothHeavyTpl = 	"Тяжелый доспех стража. Защита: от оружия 70, от стрел 10, от огня 35";
const string NAME_GorNaTothTpl 		=	"Доспех стража. Защита: от оружия 55, от стрел 10, от огня 25";
const string NAME_TorwachenPsiRock	=	"Набедренная повязка. Защита: от оружия 15, от огня 10";




// ***************************************************************************************
// Menuetext-Konstanten
// ***************************************************************************************
// Text, der erscheint, wenn eine Menueoption noch ein APPLY benoetigt (Aufloesung).
// Vermutlich kein Text notwendig, da durch Menuestruktur deutlich gemacht
const string MENU_TEXT_NEEDS_APPLY		= "";

// Text, der erscheint, wenn ein Restart des Spiels notwendig ist (Grafikkartebauswahl).
// Maximal ca. 60 Zeichen, da nur eine Zeile Platz!
const string MENU_TEXT_NEEDS_RESTART	= "Некоторые настройки вступят в силу только после перезагрузки.";

//
//	TRADE MANAGER
//
const string STR_INFO_TRADE_ACCEPT						= "Принять"				;
const string STR_INFO_TRADE_RESET						= "Отказаться"			;
const string STR_INFO_TRADE_EXIT						= "Назад"				;

const string STR_BADENIXE = "Badenixe";

// ****************
// B_Kapitelwechsel
// ****************

const string KapWechsel_1			= "Глава 1"						;
const string KapWechsel_1_Text		= "Добро пожаловать!"			;
const string KapWechsel_2			= "Глава 2"						;
const string KapWechsel_2_Text		= "Пещеры ползунов"				;
const string KapWechsel_3			= "Глава 3"						;
const string KapWechsel_3_Text		= "Артефакты древних сил"		;
const string KapWechsel_4			= "Глава 4"						;
const string KapWechsel_4_Text		= "Ксардас"						;
const string KapWechsel_5			= "Глава 5"						;
const string KapWechsel_5_Text		= "Хранители портала"			;
const string KapWechsel_6			= "Глава 6"						;
const string KapWechsel_6_Text		= "Логово Спящего"				;
