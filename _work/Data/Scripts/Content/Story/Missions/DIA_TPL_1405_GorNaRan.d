// *******************************
// 				EXIT
// *******************************

instance  DIA_GorNaRan_Exit (C_INFO)
{
	npc			=  TPL_1405_GorNaRan;
	nr			=  999;
	condition	=  DIA_GorNaRan_Exit_Condition;
	information	=  DIA_GorNaRan_Exit_Info;
	permanent	=  1;
	description = "KONEC";
};                       

FUNC int  DIA_GorNaRan_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_GorNaRan_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// *******************************
// 				Wache
// *******************************

instance  DIA_GorNaRan_Wache (C_INFO)
{
	npc			=  TPL_1405_GorNaRan;
	nr			=  1;
	condition	=  DIA_GorNaRan_Wache_Condition;
	information	=  DIA_GorNaRan_Wache_Info;
	permanent	=  1;
	description = "Co tady d�l�?";
};                       

FUNC int  DIA_GorNaRan_Wache_Condition()
{
	return TRUE;
};

FUNC VOID  DIA_GorNaRan_Wache_Info()
{
	AI_Output (other, self,"DIA_GorNaRan_Wache_15_00"); //Co tady d�l�?
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_01"); //D�v�m pozor, aby se mo��lov� �raloci nedostali p��li� bl�zko k t�boru.
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_02"); //B�t tebou, tak bych se od t�ch besti� dr�el d�l. Nem� proti nim v�bec �anci.
	AI_Output (self, other,"DIA_GorNaRan_Wache_13_03"); //Te� u� m� neru�, mus�m d�vat bedliv� pozor.
	AI_StopProcessInfos	( self );
};









instance Info_TPL_1405_GorNaRan (C_INFO)
{
	npc			= TPL_1405_GorNaRan;
	condition	= Info_TPL_1405_GorNaRan_Condition;
	information	= Info_TPL_1405_GorNaRan_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_TPL_1405_GorNaRan_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};	
};

FUNC VOID Info_TPL_1405_GorNaRan_Info()
{
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_01"); //Kam si mysl�, �e jde�? Nikdo tudy nesm� proj�t!
};


// ****************** ANGRIFF  *********************

INSTANCE Info_TPL_1405_GorNaRan2 (C_INFO)
{
	npc			= TPL_1405_GorNaRan;
	nr			= 1;
	condition	= Info_TPL_1405_GorNaRan2_Condition;
	information	= Info_TPL_1405_GorNaRan2_Info;
	permanent	= 1;
	description = "Co se tu vlastn� d�je?";
};                       

FUNC INT Info_TPL_1405_GorNaRan2_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1405_GorNaRan )) {
		return 1;
	};
};

FUNC VOID Info_TPL_1405_GorNaRan2_Info()
{
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_02"); //Co se tu vlastn� d�je?
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_03"); //Pt� se m�, co se tu d�je? Vrhni se do prachu a vzd�vej �ctu Sp��ovi, proto�e v okam�iku procitne, aby zatratil v�echny bezv�rce na tomhle sv�t�.
};


// ****************** ANGRIFF  *********************

INSTANCE Info_TPL_1405_GorNaRan3 (C_INFO)
{
	npc			= TPL_1405_GorNaRan;
	nr			= 1;
	condition	= Info_TPL_1405_GorNaRan3_Condition;
	information	= Info_TPL_1405_GorNaRan3_Info;
	permanent	= 1;
	description = "Cht�l jsem se jenom porozhl�dnout.";
};                       

FUNC INT Info_TPL_1405_GorNaRan3_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1405_GorNaRan )) {
		return 1;
	};
};

FUNC VOID Info_TPL_1405_GorNaRan3_Info()
{	
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_04"); //Cht�l jsem se jenom porozhl�dnout.
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_05"); //Ty �erve, ty a tob� podobn� tady nebudete m�t co pohled�vat, a� se Sp�� probud�! Budu t� odtud muset vyprovodit.
	
	AI_StopProcessInfos	( self );
	
	Npc_SetTarget 	( self, hero );
	AI_StartState 		( self, ZS_Attack, 1 ,"" );
};



INSTANCE Info_TPL_1405_GorNaRan4 (C_INFO)
{
	npc			= TPL_1405_GorNaRan;
	nr			= 1;
	condition	= Info_TPL_1405_GorNaRan4_Condition;
	information	= Info_TPL_1405_GorNaRan4_Info;
	permanent	= 0;
	description = "Nem��e� m� zastavit!";
};                       

FUNC INT Info_TPL_1405_GorNaRan4_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1405_GorNaRan )) {
		return 1;
	};
};

FUNC VOID Info_TPL_1405_GorNaRan4_Info()
{	
	AI_Output (other, self,"Info_TPL_1405_GorNaRan_Info_15_06"); //Nem��e� m� zastavit!
	AI_Output (self, other,"Info_TPL_1405_GorNaRan_Info_13_07"); //Jak mysl�, chlap�e. Za Sp��e!

	AI_StopProcessInfos	( self );

	Npc_SetTarget 	( self, hero );
	AI_StartState 	( self, ZS_Attack, 1 ,"" );
};
