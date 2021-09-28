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
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //Ud�lal bys l�p, kdyby ses do Star�ho t�bora dostal cel�!
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
	description		= "Co tady d�l�?"; 
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
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //Co tady d�l�?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Zaji��ujeme, aby se nikdo nedostal do bl�zkosti m�sta v�m�ny. Hlavn� nikdo z t�ch vrahoun� z Nov�ho t�bora.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //Ty jsi ten novej, co ho dneska vyhodili, �e jo?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //Jo, j�.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //Pak ud�l� nejl�p, kdy� se bude� m�t na pozoru p�ed t�ma chlap�kama z Nov�ho t�bora!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //Pracuju pro Star� t�bor, zrovna tak jako ti ostatn�, kter� vid� pobl� m�sta v�m�ny.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //P�edpokl�d�m, �e jsi mluvil s Diegem...?
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"Ne.",DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"Ano.",DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //Ne.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //Tak to ud�lej! To on se star� o nov��ky.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //V� toho o kolonii hodn� - v�ci, kter� jsou pro nov��ky, jako jsi ty, d�le�it�.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //Ano.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //Dob�e. Pak bude� v�d�t, co se tady v�ude d�je.
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
	description		= "Pro� se m�m m�t na pozoru p�ed chlapy z Nov�ho t�bora?"; 
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
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //Pro� se m�m m�t na pozoru p�ed chlapy z Nov�ho t�bora?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //Star� t�bor je ve srovn�n� s Nov�m t�borem klidn� a m�rumilovn� m�sto.
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //Nov� t�bor nedost�v� ��dn� dod�vky z vn�j��ho sv�ta. V�t�ina tam�j��ch dareb�k� pak krade, co pot�ebuje.
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
	description		= "A Star� t�bor?"; 
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
	AI_Output (other, self,"DIA_Orry_OldCamp_15_00"); //A Star� t�bor?
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //Rudobaroni maj� v�echno pod kontrolou. Hned po nich n�sleduj� str�e a po nich St�ny. Kop��i jsou a� vespodu.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //Ka�d� nov� p��choz� za��n� jako kop��. Pokud se chce� st�t n���m lep��m, mus� b�t nejprve p�ijat mezi St�ny.
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
	description		= "Kdy� jsem se sem dostal, jeden z t�ch chlap� m� pra�til do tv��e."; 
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
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //Kdy� jsem se sem dostal, jeden z t�ch chlap� m� pra�til do tv��e.
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //D�laj� to v�em nov��k�m. ��kaj� tomu 'Kmotr'.
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //Och. Jsou v�ichni ti chlapi ve Star�m t�bo�e takov�?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //Je tam dost gauner�. Ale kdy� jim plat� za ochranu, nechaj� t� b�t.
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
	description		= "Vid�l jsem, jak dol� se zbo��m poslali i n�jakou �enu."; 
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
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //Vid�l jsem, jak dol� se zbo��m poslali i n�jakou �enu.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //Jist�, Rudobaroni dostanou v�echno, co se jim zachce.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //Chce� t�m ��ci, �e Kr�l vym��uje �eny za rudu?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //Jsou to tak� samoz�ejm� odsouzen� trestankyn�. Ale pokud si o n� Gomez ne�ekne, sed� zam�en� n�kde ve v�zen�.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //Nev�m, co je hor��...
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
	description		= "Hled�m n�jakou zbra�..."; 
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
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //Hled�m n�jakou zbra�...
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //V uzav�en�m dolu za ka�onem by m�ly b�t n�jak� star� zbran�.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //Neza��nej ale v�lku, ani� bys m�l jinou zbra� ne� rezav� krump�� - tyhle v�ci jsou pomal� a t�k�.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //Nezku�en� bojovn�k by je m�l pou��t jen v nouzi.
	
};



