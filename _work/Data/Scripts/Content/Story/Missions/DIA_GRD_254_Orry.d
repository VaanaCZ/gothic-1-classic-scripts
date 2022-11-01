// **************************************************
// 						 PRE EXIT 
// **************************************************

INSTANCE DIA_Orry_PreExit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_PreExit_Condition;
	information	= DIA_Orry_PreExit_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_PreExit_Condition()
	
	{
		return 1;
	};

FUNC VOID DIA_Orry_PreExit_Info()
{
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //Udělal bys líp, kdyby ses do Starého tábora dostal celý!
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Orry_Exit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_Exit_Condition;
	information	= DIA_Orry_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_Exit_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orry_PreExit))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Wache
// **************************************************

INSTANCE DIA_Orry_GuardGate (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_GuardGate_Condition;
	information		= DIA_Orry_GuardGate_Info;
	permanent		= 0;
	description		= "Co tady děláš?"; 
};

FUNC INT DIA_Orry_GuardGate_Condition()
{	
	if (Kapitel <= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_GuardGate_Info()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //Co tady děláš?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Zajišťujeme, aby se nikdo nedostal do blízkosti místa výměny. Hlavně nikdo z těch vrahounů z Nového tábora.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //Ty jsi ten novej, co ho dneska vyhodili, že jo?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //Jo, já.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //Pak uděláš nejlíp, když se budeš mít na pozoru před těma chlapíkama z Nového tábora!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //Pracuju pro Starý tábor, zrovna tak jako ti ostatní, které vidíš poblíž místa výměny.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //Předpokládám, že jsi mluvil s Diegem...?
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"Ne.",DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"Ano.",DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //Ne.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //Tak to udělej! To on se stará o nováčky.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //Ví toho o kolonii hodně - věci, které jsou pro nováčky, jako jsi ty, důležité.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //Ano.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //Dobře. Pak budeš vědět, co se tady všude děje.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

// **************************************************
// 					New Camp
// **************************************************

INSTANCE DIA_Orry_NewCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 1;
	condition		= DIA_Orry_NewCamp_Condition;
	information		= DIA_Orry_NewCamp_Info;
	permanent		= 0;
	description		= "Proč se mám mít na pozoru před chlapy z Nového tábora?"; 
};

FUNC INT DIA_Orry_NewCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_NewCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //Proč se mám mít na pozoru před chlapy z Nového tábora?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //Starý tábor je ve srovnání s Novým táborem klidné a mírumilovné místo.
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //Nový tábor nedostává žádné dodávky z vnějšího světa. Většina tamějších darebáků pak krade, co potřebuje.
};

// **************************************************
// 					Old Camp
// **************************************************

INSTANCE DIA_Orry_OldCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_OldCamp_Condition;
	information		= DIA_Orry_OldCamp_Info;
	permanent		= 0;
	description		= "A Starý tábor?"; 
};

FUNC INT DIA_Orry_OldCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_OldCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_OldCamp_15_00"); //A Starý tábor?
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //Rudobaroni mají všechno pod kontrolou. Hned po nich následují stráže a po nich Stíny. Kopáči jsou až vespodu.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //Každý nový příchozí začíná jako kopáč. Pokud se chceš stát něčím lepším, musíš být nejprve přijat mezi Stíny.
};

// **************************************************
// 					Shore
// **************************************************

INSTANCE DIA_Orry_Shore (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Shore_Condition;
	information		= DIA_Orry_Shore_Info;
	permanent		= 0;
	description		= "Když jsem se sem dostal, jeden z těch chlapů mě praštil do tváře."; 
};

FUNC INT DIA_Orry_Shore_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Shore_Info()
{
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //Když jsem se sem dostal, jeden z těch chlapů mě praštil do tváře.
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //Dělají to všem nováčkům. Říkají tomu 'Kmotr'.
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //Och. Jsou všichni ti chlapi ve Starém táboře takoví?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //Je tam dost gaunerů. Ale když jim platíš za ochranu, nechají tě být.
};

// **************************************************
// 					Frau
// **************************************************

INSTANCE DIA_Orry_Woman (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Woman_Condition;
	information		= DIA_Orry_Woman_Info;
	permanent		= 0;
	description		= "Viděl jsem, jak dolů se zbožím poslali i nějakou ženu."; 
};

FUNC INT DIA_Orry_Woman_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Woman_Info()
{
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //Viděl jsem, jak dolů se zbožím poslali i nějakou ženu.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //Jistě, Rudobaroni dostanou všechno, co se jim zachce.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //Chceš tím říci, že Král vyměňuje ženy za rudu?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //Jsou to také samozřejmě odsouzené trestankyně. Ale pokud si o ně Gomez neřekne, sedí zamčené někde ve vězení.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //Nevím, co je horší...
};

// **************************************************
// 					Waffe
// **************************************************

INSTANCE DIA_Orry_Waffe (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Waffe_Condition;
	information		= DIA_Orry_Waffe_Info;
	permanent		= 0;
	description		= "Hledám nějakou zbraň..."; 
};

FUNC INT DIA_Orry_Waffe_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Waffe_Info()
{
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //Hledám nějakou zbraň...
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //V uzavřeném dolu za kaňonem by měly být nějaké staré zbraně.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //Nezačínej ale válku, aniž bys měl jinou zbraň než rezavý krumpáč - tyhle věci jsou pomalé a těžké.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //Nezkušený bojovník by je měl použít jen v nouzi.
	
};



