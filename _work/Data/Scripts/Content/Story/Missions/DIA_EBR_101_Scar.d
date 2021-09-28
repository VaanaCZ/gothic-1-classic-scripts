// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_SCAR_EXIT(C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 999;
	condition	= DIA_SCAR_EXIT_Condition;
	information	= DIA_SCAR_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SCAR_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_SCAR_Hello (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Hello_Condition;
	information	= DIA_SCAR_Hello_Info;
	permanent	= 0;
	description = "Kdo jsi?";
};                       

FUNC INT DIA_SCAR_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_Hello_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Hello_15_00"); //Kdo jsi?
	AI_Output (self, other,"DIA_SCAR_Hello_08_01"); //Øíkají mi Scar.
};

// ************************************************************
// 							What
// ************************************************************

INSTANCE DIA_SCAR_What (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_What_Condition;
	information	= DIA_SCAR_What_Info;
	permanent	= 0;
	description = "Co je tvá práce?";
};                       

FUNC INT DIA_SCAR_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_What_Info()
{	
	AI_Output (other, self,"DIA_SCAR_What_15_00"); //Co je tvá práce?
	AI_Output (self, other,"DIA_SCAR_What_08_01"); //Spolu s Artem dáváme pozor, aby se nikdo nedostal ke Gomezovi bez pozvání.
	AI_Output (self, other,"DIA_SCAR_What_08_02"); //A já dávám pozor na ženy, aby je nikdo nerušil.
};

// ************************************************************
// 							Frau
// ************************************************************

INSTANCE DIA_SCAR_Frau (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Frau_Condition;
	information	= DIA_SCAR_Frau_Info;
	permanent	= 0;
	description = "Když mì sem uvrhli, vidìl jsem jednu ženu, jak ji posílají dolù se zbožím.";
};                       

FUNC INT DIA_SCAR_Frau_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_What))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_Frau_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Frau_15_00"); //Když mì sem uvrhli, vidìl jsem jednu ženu, jak ji posílají dolù se zbožím.
	AI_Output (self, other,"DIA_SCAR_Frau_08_01"); //A co?
	AI_Output (other, self,"DIA_SCAR_Frau_15_02"); //Je tady?
	AI_Output (self, other,"DIA_SCAR_Frau_08_03"); //Poslyš, jestli se ti líbí, dám ti jednu radu. Zapomeò na ni.
	AI_Output (self, other,"DIA_SCAR_Frau_08_04"); //Jenom sem pøišla a Gomez ji zamkl v místnosti.
	AI_Output (self, other,"DIA_SCAR_Frau_08_05"); //Až s ní bude hotový, mohl by ji poslat dolu. Ale teï je JEHO - takže bude lepší, když na ni zapomeneš.
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_SCAR_PERM (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_PERM_Condition;
	information	= DIA_SCAR_PERM_Info;
	permanent	= 1;
	description = "Mùžeš mi nìco øíci o Gomezovi?";
};                       

FUNC INT DIA_SCAR_PERM_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Frau))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_PERM_Info()
{	
	AI_Output (other, self,"DIA_SCAR_PERM_15_00"); //Mùžeš mi nìco øíci o Gomezovi?
	AI_Output (self, other,"DIA_SCAR_PERM_08_01"); //Všechno, co potøebuješ vìdìt je to, že je to nejmocnìjší muž v kolonii.
	AI_Output (self, other,"DIA_SCAR_PERM_08_02"); //Dostane, co chce, ale to, co chce nejvíc, je moc.
};

