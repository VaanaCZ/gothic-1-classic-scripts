// *****************************************************************************************
// Mobsi-Fokusnamen
// *****************************************************************************************

CONST STRING MOBNAME_BACKPACK_1		= "";
CONST STRING MOBNAME_CRATE			= "������";
CONST STRING MOBNAME_CHEST			= "����";
CONST STRING MOBNAME_BED			= "�������";
CONST STRING MOBNAME_DOOR			= "�����";
CONST STRING MOBNAME_CAMP			= "";
CONST STRING MOBNAME_TORCH			= "";
CONST STRING MOBNAME_TORCHHOLDER	= "";
CONST STRING MOBNAME_BARBQ_SCAV		= "";
CONST STRING MOBNAME_BARRELO_OC		= "";
CONST STRING MOBNAME_BENCH			= "";
CONST STRING MOBNAME_ANVIL			= "����������";
CONST STRING MOBNAME_BUCKET			= "����� � �����";
CONST STRING MOBNAME_FORGE			= "����";
CONST STRING MOBNAME_GRINDSTONE		= "��������� ������";
CONST STRING MOBNAME_WHEEL			= "�������";
CONST STRING MOBNAME_LAB			= "";
CONST STRING MOBNAME_BOOK			= "";
CONST STRING MOBNAME_CHAIR			= "";
CONST STRING MOBNAME_CAULDRON		= "�����";
CONST STRING MOBNAME_THRONE			= "";
CONST STRING MOBNAME_PAN			= "���������";
CONST STRING MOBNAME_REPAIR			= "";
CONST STRING MOBNAME_WATERPIPE		= "������";
CONST STRING MOBNAME_LADDER			= "��������";
CONST STRING MOBNAME_SWITCH			= "�������������";
CONST STRING MOBNAME_BARONSTHRONE	= "";
CONST STRING MOBNAME_ORE			= "������ ����";
CONST STRING MOBNAME_ROPEWAY		= "";
CONST STRING MOBNAME_STOMPER		= "";
CONST STRING MOBNAME_BELLOW			= "��������� ���";
CONST STRING MOBNAME_STONEMILL		= "";
CONST STRING MOBNAME_ORC_MUMMY		= "�����";
CONST STRING MOBNAME_PILLAR			= "�������";
CONST STRING MOBNAME_BASKET_RICE	= "";
CONST STRING MOBNAME_DRUM			= "";
CONST STRING MOBNAME_GROUND_SLOT	= "";
CONST STRING MOBNAME_HERB_PSI		= "�����";
CONST STRING MOBNAME_IDOL			= "������";
CONST STRING MOBNAME_LEAN_WALL		= "";
CONST STRING MOBNAME_ORCDRUM		= "";
CONST STRING MOBNAME_TARGETSTONE	= "������";
CONST STRING MOBNAME_SHRINE			= "�������� � ������� ����";
CONST STRING MOBNAME_SWORDSTONE		= "��������� ������";


// *****************************************************************************************
// Gildennamen
// *****************************************************************************************

CONST STRING TXT_GUILDS	[GIL_MAX] =	{
// - Charakterblatt (Text der Spielergilde)
// - Debuganzeige (Taste "G")
	" (���)",
	" �����",
	" ��������",
	" �������",
	" ��� ����",
	" �������",
	" ��� ����",
	" �������",
	" ���",
	" ����������",
	" �������",			// 10
	" ����",
	" ���������",
	" �����",
	" ���������",
	" ������",
	"",
	" �������",			// 17
	" ������",
	" ������",
	" ������",
	" �����",
	" ������",
	" ������ ���",
	" ���������",
	" �����",
	" ����",
	" ��������",
	" �������",
	" ���������",			// 30
	" �����",
	" ���",
	" ������",
	" ������ ������",
	" ���������",
	" �����",
	" ����",
	"",				// 38
	" ���-�����",
	" ���-����",
	"���-������",
	"���-���"
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
	"����",					// SPL_LIGHT		=	0;
	"�������� ���",				// SPL_FIREBALL		=	1;
	"",						// SPL_TRANSFORM	=	2;
	"�����",					// SPL_FEAR			=	3;
	"�������",					// SPL_HEAL			=	4;
	"",						// SPL_LIGHTNING	=	5;
	"������ ������",			// SPL_SUMMONDEMON	=	6;
	"������ �������",		// SPL_SUMMONSKELETON=	7;
	"",						// SPL_FORGET		=	8;
	"����� �����",				// SPL_WINDFIST		=	9;
	"���������",				// SPL_TELEKINESIS	=	10;
	"����",					// SPL_CHARM		=	11;
	"���	",					// SPL_SLEEP		=	12;
	"���������",				// SPL_PYROKINESIS	=	13;
	"����� ������",				// SPL_MASSDEATH	=	14;
	"��������",				// SPL_CONTROL		=	15;
	"���������� ������",		// SPL_DESTROYUNDEAD=	16;
	"�������� ������",				// SPL_FIREBOLT		=	17;
	"�������� �����",				// SPL_FIRESTORM	=	18;
	"�������� �����",				// SPL_FIRERAIN		=	19;
	"",						// SPL_SPEED		=	20;
	"������������ � ����� ����",		// SPL_TELEPORT1	=	21;
	"������������ � ����� ����",	// SPL_TELEPORT2	=	22;
	"������������ � ����������",	// SPL_TELEPORT3	=	23;
	"������ ����������",		// SPL_TELEPORT4	=	24;
	"������������ � �������� ������",		// SPL_TELEPORT5	=	25;
	"����������� � ������ ",	// SPL_TRF_BLOODFLY	=	26;
	"n",						// SPL_TRF_BLOODHOUND=	27;
	"����������� � �������",	// SPL_TRF_CRAWLER	=	28;
	"����������� � �����",		// SPL_TRF_LURKER	=	29;
	"����������� � ����",	// SPL_TRF_MEATBUG	=	30;
	"����������� � ����������",		// SPL_TRF_MOLERAT	=	31;
	"����������� � ������ ������",		// SPL_TRF_ORCDOG	=	32;
	"n",						// SPL_TRF_RAZOR	=	33;
	"����������� � ����������",	// SPL_TRF_SCAVENGER=	34;
	"n",						// SPL_TRF_SCAVENGER2=	35;
	"����������� � ���������",	// SPL_TRF_SHADOWBEAST=	36;
	"����������� � ������",		// SPL_TRF_SNAPPER	=	37;
	"����������� � �������",		// SPL_TRF_WARAN	=	38;
	"����������� � �����",			// SPL_TRF_WOLF		=	39;
	"������",					// SPL_CHAINLIGHTNING=	40;
	"������� ������",					// SPL_THUNDERBOLT	=	41;
	"������� ������",				// SPL_THUNDERBALL	=	42;
	"������� �����",					// SPL_ICECUBE		=	43;
	"������� �����",					// SPL_ICEWAVE		=	44;
	"������ ������",			// SPL_SUMMONGOLEM	=	45;
	"����� ����",		// SPL_ARMYOFDARKNESS=	46;
	"�����",				// SPL_STORMFIST	=	47;
	"n",						// SPL_TELEKINESIS2	=	48;
	"������� ������",				// SPL_BREATHOFDEATH=	49;
	"���� ������",				// SPL_SHRINK		=	50;
	"n",						// SPL_UNDRESS		=	51;
	"n",						// SPL_DANCE		=	52;
	"����",					// SPL_BERZERK		=	53;
	"���� �������",			// SPL_NEW1			=	17;
	"2",						// SPL_NEW2			=	18;
	"3",						// SPL_NEW3			=	19;
	"4",						// SPL_NEW4			=	20;
	"5"						// SPL_NEW5			=	21;
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
	"���������� ���   ",
	"��������� ���   ",
	"���    ",
	"�������",
	"����� ������",
	"���������",
	"�����",
	"�������������",
	"�����������",
	"������ ����",
	"����������"
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
	"                                                   ",	
	"�� ������|������|������",						//NPC_TALENT_1H          
	"�� ������|������|������",                       //NPC_TALENT_2H           
	"�� ������|������|������",                       //NPC_TALENT_BOW         
	"�� ������|������|������",                       //NPC_TALENT_CROSSBOW    
	"�� ������|������|������",                       //NPC_TALENT_PICKLOCK   
	"�� ������|������|������",                       //NPC_TALENT_PICKPOCKET
	"���|1 ����|2 ����|3 ����|4 ����|5 ����|6 ����", //NPC_TALENT_MAGE         
	"���|��",                                              //NPC_TALENT_SNEAK       
	"|",                                      		        //NPC_TALENT_REGENERATE 
	"|",                                          		    //NPC_TALENT_FIREMASTER   
	"���|��"                                               //NPC_TALENT_ACROBAT      
};

// *****************************************************************************************
// Inventory-Kategorien
// *****************************************************************************************

CONST STRING TXT_INV_CAT [INV_CAT_MAX] = {
	"             ",
	"������",
	"�������",
	"�����",
	"���������",
	"����",
	"�����",
	"���������",
	"������"
};


// ***************************************************************************************
// Fokusnamen der Ambient-NSCs
// ***************************************************************************************

CONST STRING NAME_Buddler		= "�������";
CONST STRING NAME_Schatten		= "�������";
CONST STRING NAME_ConvoiTraeger	= "�������";
CONST STRING NAME_ConvoiWache	= "��������";
CONST STRING NAME_Torwache		= "����������";
CONST STRING NAME_Brueckenwache	= "�������� � �����";
CONST STRING NAME_Gardist		= "��������";
CONST STRING NAME_Bauer			= "����������";
CONST STRING NAME_Schlaeger		= "��������";
CONST STRING NAME_Schuerfer		= "�������";
CONST STRING NAME_Organisator	= "���";
CONST STRING NAME_Soeldner		= "�������";
CONST STRING NAME_Novize		= "���������";
CONST STRING NAME_Templer		= "�����";
CONST STRING NAME_Raeuber		= "���������";
CONST STRING NAME_Tuersteher	= "��������";

const string NAME_MadNovice		=	"��������� ���������";
const string NAME_MadTemplar	=	"���������� �����";
const string NAME_MadTemplar2	=	"����� ������������";


// *************************************************************
// DIALOG OPTIONEN
// *************************************************************

CONST STRING DIALOG_ENDE		= "��������� ��������";
CONST STRING DIALOG_BACK		= "�����";
const string DIALOG_TRADE		= "(�����)";

// *************************************************************
// FOKUSNAMEN DER ITEMS
// *************************************************************

const string NAME_Ring			= "������";
const string NAME_Amulett		= "������";
const string NAME_Trank			= "�����";
const string NAME_Rune			= "����";
const string NAME_Spruchrolle	= "������";


// *************************************************************
// TEXTE F�R ITEM-BESCHREIBUNGEN IM INV.
// *************************************************************

const string NAME_Value			= "����:";

const string NAME_Mag_Circle	= "����:";
const string NAME_Manakosten	= "���������� ����:";
const string NAME_ManakostenMax	= "���������� ���� (����.):";
const string NAME_ManaPerSec	= "���. ���� � ���.";
const string NAME_Duration		= "������������ (���.)";

const string NAME_Mana_needed	= "��������� ���. ����:";
const string NAME_Str_needed	= "��������� ����:";
const string NAME_Dex_needed	= "��������� ��������:";

const string NAME_Spell_Load	= "�������� ����������";
const string NAME_Spell_Invest	= "��������. ����������";

const string NAME_Dam_Edge		= "���� �� ������";
const string NAME_Dam_Point		= "���� �� �����";
const string NAME_Dam_Fire		= "�������� ����";
const string NAME_Dam_Magic		= "���������� ����";
const string NAME_Dam_Fly		= "���� �� �������������";

const string NAME_Damage		= "����:";
const string NAME_PerMana		= " (�� ������� ���. ����)";
const string NAME_DamagePerSec	= "���� � ���.";

const string NAME_Prot_Edge		= "������ �� ������:";
const string NAME_Prot_Point	= "������ �� �����:";
const string NAME_Prot_Fire		= "������ �� ����:";
const string NAME_Prot_Magic	= "������ �� �����:";

const string NAME_Bonus_HP		= "����� � ��������� ����:";
const string NAME_Bonus_Mana	= "����� � ���. ����:";

const string NAME_Bonus_HpMax	= "����� �� ����. ��������� ����:";
const string NAME_Bonus_ManaMax	= "����� �� ����. ���. ����:";

const string NAME_Bonus_Dex		= "����� � ��������:";
const string NAME_Bonus_Str		= "����� � ����:";

const string NAME_OneHanded		= "���������� ������";
const string NAME_TwoHanded		= "��������� ������";

// ***************************************************************************************
// sonstige Bildschirmausgaben
// ***************************************************************************************
const string NAME_XPGained			= "���� +";			// bei jedem Erfahrungsgewinn
const string NAME_LevelUp			= "��������� ����� �������!";		// beim Stufenaufstieg

const string NAME_NewLogEntry		= "� �������� ��������� ����� ������.";




//***************************************************************************************
// Stringkonstanten aus den G_FUNCTIONS
//***************************************************************************************
const string _STR_INVALID					= "(����������)-"									;

const string _STR_ATTRIBUTE_HITPOINTS		= "��������� ���� "											;
const string _STR_ATTRIBUTE_HITPOINTS_MAX	= "����. ��������� ���� "								;
const string _STR_ATTRIBUTE_MANA			= "���. ���� "											;
const string _STR_ATTRIBUTE_MANA_MAX		= "����. ���. ���� "									;
const string _STR_ATTRIBUTE_STRENGTH		= "���� "											;
const string _STR_ATTRIBUTE_DEXTERITY		= "�������� "								;
const string _STR_ATTRIBUTE_MAGIC_CIRCLE	= "��� �������"								;

// Bildschirmausgabe, falls der Spieler eine Waffe anlegen will, f�r die ihm Attributspunkte fehlen
const string _STR_CANNOTUSE_PRE_PLAYER		= "������������ "										;
const string _STR_CANNOTUSE_POINTS			= ""											;
const string _STR_CANNOTUSE_LEVELS		    = "����� ����� "											;
const string _STR_CANNOTUSE_POST			= "��� �������������."				;

// Bildschirmausgabe, falls ein NSC zu wenig Attributspunkte, f�r das Anlegen von Waffen hat (nur Debugzwecke!)
const string _STR_CANNOTUSE_PRE_NPC			= " ("												;
const string _STR_CANNOTUSE_POST_NPC		= ") �����������."										;

// Bidschrimausgabe zum Thema Schlo� �ffnen/knacken
const string _STR_MESSAGE_INTERACT_NO_KEY	= "��� ������� ��� ����������� �����.";
const string _STR_MESSAGE_PICKLOCK_SUCCESS	= "����� ������. ��� ���� ��� ����.";
const string _STR_MESSAGE_PICKLOCK_UNLOCK	= "����� �������.";
const string _STR_MESSAGE_PICKLOCK_FAILURE	= "����... ������ �� �����.";
const string _STR_MESSAGE_PICKLOCK_BROKEN	= "������� ���������.";

// Bidschrimausgabe zum Thema Hebel/Winden
const string _STR_MESSAGE_OCLEVER_STUCKS	= "� �� ���� �������� �����."			;
const string _STR_MESSAGE_OCLEVER_MOVES		= "����� ���������� � ������� ������."			;
const string _STR_MESSAGE_WHEEL_STUCKS		= "������� �������������."					;

// Bidschrimausgabe beim storybedingten Transfer von Items
const string _STR_MESSAGE_ITEM_GIVEN		= " ������� �����."								;	//SPACE davor wichtig, weil Trennzeichen
const string _STR_MESSAGE_ITEMS_GIVEN		= " ��������� ������."							;
const string _STR_MESSAGE_ORE_GIVEN			= " ������ ���� ������."									;
const string _STR_MESSAGE_ITEM_TAKEN		= " ������� �������."							;
const string _STR_MESSAGE_ITEMS_TAKEN		= " ��������� ��������."							;
const string _STR_MESSAGE_ORE_TAKEN			= " ������ ���� ��������."									;

// Bidschrimausgabe f�rs Tausch-Fenster
const string _STR_MESSAGE_TRADE_FAILURE		= "��� ������������� �����."	;

// GILDENAUFNAHMEBEDINGUNG (f�r die Funktion "B_PrintGuildCondition()" )
const string _STR_MESSAGE_Joincamp			=	"�������: �������"; 

// nicht beklaubare NSCs
const string _STR_MESSAGE_CANNOTSTEAL		=	"��������� ����������.";

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
const string NAME_BuyArmorPostfix	=	" ����)";	
const string NAME_LearnPrefix		=	" (";	
const string NAME_LearnMidfix		=	" ����,";
const string NAME_LearnPostfixS		=	" ���� ��������)";	
const string NAME_LearnPostfixP		=	" ����� ��������)";	

const string NAME_LearnStrength_1	=	"���� +1";
const string NAME_LearnStrength_5	=	"���� +5";
const string NAME_LearnStrength_10	=	"���� +10";
const string NAME_LearnStrength_20	=	"���� +20";

const string NAME_LearnDexterity_1	=	"�������� +1";
const string NAME_LearnDexterity_5	=	"�������� +5";
const string NAME_LearnDexterity_10	=	"�������� +10";
const string NAME_LearnDexterity_20	=	"�������� +20";

const string NAME_LearnMana_1		=	"���������� ���� +1";
const string NAME_LearnMana_5		=	"���������� ���� +5";
const string NAME_LearnMana_10		=	"���������� ���� +10";
const string NAME_LearnMana_20		=	"���������� ���� +20";

const string NAME_Learn1h_1			=	"������ ������� - ���������� ������";
const string NAME_Learn1h_2			=	"������ ������� - ���������� ������";
const string NAME_Learn2h_1			=	"������ ������� - ��������� ������";
const string NAME_Learn2h_2			=	"������ ������� - ��������� ������";

const string NAME_LearnBow_1		=	"������ ������� - ���";
const string NAME_LearnBow_2		=	"������ ������� - ���";
const string NAME_LearnCrossbow_1	=	"������ ������� - �������";
const string NAME_LearnCrossbow_2	=	"������ ������� - �������";

const string NAME_LearnMage_1		=	"1-� ���� �����";
const string NAME_LearnMage_2		=	"2-� ���� �����";
const string NAME_LearnMage_3		=	"3-� ���� �����";
const string NAME_LearnMage_4		=	"4-� ���� �����";
const string NAME_LearnMage_5		=	"5-� ���� �����";
const string NAME_LearnMage_6		=	"6-� ���� �����";

const string NAME_LearnPickpocket_1	=	"������ ������� - ���������";
const string NAME_LearnPickpocket_2	=	"������ ������� - ���������";
const string NAME_LearnPicklock_1	=	"������ ������� - ����� ������";
const string NAME_LearnPicklock_2	=	"������ ������� - ����� ������";

const string NAME_LearnAcrobat		=	"����������";
const string NAME_LearnSneak		=	"�������������";

const string NAME_RaiseStrength		=	"���� +";
const string NAME_RaiseDexterity	=	"�������� +";
const string NAME_RaiseStrDex		=	"���� � �������� +";
const string NAME_RaiseManaMax		=	"����. ���. ���� +";
const string NAME_RaiseHealthMax	=	"����. ��������� ���� +";

// ***************************************************************************************
// Menuetext-Konstanten
// ***************************************************************************************
// Text, der erscheint, wenn eine Menueoption noch ein APPLY benoetigt (Aufloesung).
// Vermutlich kein Text notwendig, da durch Menuestruktur deutlich gemacht
const string MENU_TEXT_NEEDS_APPLY		= "";

// Text, der erscheint, wenn ein Restart des Spiels notwendig ist (Grafikkartebauswahl).
// Maximal ca. 60 Zeichen, da nur eine Zeile Platz!
const string MENU_TEXT_NEEDS_RESTART	= "��������� ��������� ����� ������������� ������ ����� ���������� ������� ����.";
