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
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //Udìlal bys líp, kdyby ses do Starého tábora dostal celý!
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
	description		= "Co tady dìláš?"; 
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
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //Co tady dìláš?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Zajišujeme, aby se nikdo nedostal do blízkosti místa výmìny. Hlavnì nikdo z tìch vrahounù z Nového tábora.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //Ty jsi ten novej, co ho dneska vyhodili, že jo?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //Jo, já.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //Pak udìláš nejlíp, když se budeš mít na pozoru pøed tìma chlapíkama z Nového tábora!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //Pracuju pro Starý tábor, zrovna tak jako ti ostatní, které vidíš poblíž místa výmìny.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //Pøedpokládám, že jsi mluvil s Diegem...?
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"Ne.",DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"Ano.",DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //Ne.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //Tak to udìlej! To on se stará o nováèky.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //Ví toho o kolonii hodnì - vìci, které jsou pro nováèky, jako jsi ty, dùležité.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //Ano.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //Dobøe. Pak budeš vìdìt, co se tady všude dìje.
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
	description		= "Proè se mám mít na pozoru pøed chlapy z Nového tábora?"; 
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
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //Proè se mám mít na pozoru pøed chlapy z Nového tábora?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //Starý tábor je ve srovnání s Novým táborem klidné a mírumilovné místo.
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //Nový tábor nedostává žádné dodávky z vnìjšího svìta. Vìtšina tamìjších darebákù pak krade, co potøebuje.
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
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //Rudobaroni mají všechno pod kontrolou. Hned po nich následují stráže a po nich Stíny. Kopáèi jsou až vespodu.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //Každý nový pøíchozí zaèíná jako kopáè. Pokud se chceš stát nìèím lepším, musíš být nejprve pøijat mezi Stíny.
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
	description		= "Když jsem se sem dostal, jeden z tìch chlapù mì praštil do tváøe."; 
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
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //Když jsem se sem dostal, jeden z tìch chlapù mì praštil do tváøe.
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //Dìlají to všem nováèkùm. Øíkají tomu 'Kmotr'.
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //Och. Jsou všichni ti chlapi ve Starém táboøe takoví?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //Je tam dost gaunerù. Ale když jim platíš za ochranu, nechají tì být.
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
	description		= "Vidìl jsem, jak dolù se zbožím poslali i nìjakou ženu."; 
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
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //Vidìl jsem, jak dolù se zbožím poslali i nìjakou ženu.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //Jistì, Rudobaroni dostanou všechno, co se jim zachce.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //Chceš tím øíci, že Král vymìòuje ženy za rudu?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //Jsou to také samozøejmì odsouzené trestankynì. Ale pokud si o nì Gomez neøekne, sedí zamèené nìkde ve vìzení.
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
	description		= "Hledám nìjakou zbraò..."; 
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
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //Hledám nìjakou zbraò...
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //V uzavøeném dolu za kaòonem by mìly být nìjaké staré zbranì.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //Nezaèínej ale válku, aniž bys mìl jinou zbraò než rezavý krumpáè - tyhle vìci jsou pomalé a tìžké.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //Nezkušený bojovník by je mìl použít jen v nouzi.
	
};



