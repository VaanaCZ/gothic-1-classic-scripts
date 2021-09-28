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
	AI_Output (self, other,"DIA_SCAR_Hello_08_01"); //��kaj� mi Scar.
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
	description = "Co je tv� pr�ce?";
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
	AI_Output (other, self,"DIA_SCAR_What_15_00"); //Co je tv� pr�ce?
	AI_Output (self, other,"DIA_SCAR_What_08_01"); //Spolu s Artem d�v�me pozor, aby se nikdo nedostal ke Gomezovi bez pozv�n�.
	AI_Output (self, other,"DIA_SCAR_What_08_02"); //A j� d�v�m pozor na �eny, aby je nikdo neru�il.
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
	description = "Kdy� m� sem uvrhli, vid�l jsem jednu �enu, jak ji pos�laj� dol� se zbo��m.";
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
	AI_Output (other, self,"DIA_SCAR_Frau_15_00"); //Kdy� m� sem uvrhli, vid�l jsem jednu �enu, jak ji pos�laj� dol� se zbo��m.
	AI_Output (self, other,"DIA_SCAR_Frau_08_01"); //A co?
	AI_Output (other, self,"DIA_SCAR_Frau_15_02"); //Je tady?
	AI_Output (self, other,"DIA_SCAR_Frau_08_03"); //Posly�, jestli se ti l�b�, d�m ti jednu radu. Zapome� na ni.
	AI_Output (self, other,"DIA_SCAR_Frau_08_04"); //Jenom sem p�i�la a Gomez ji zamkl v m�stnosti.
	AI_Output (self, other,"DIA_SCAR_Frau_08_05"); //A� s n� bude hotov�, mohl by ji poslat dolu. Ale te� je JEHO - tak�e bude lep��, kdy� na ni zapomene�.
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
	description = "M��e� mi n�co ��ci o Gomezovi?";
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
	AI_Output (other, self,"DIA_SCAR_PERM_15_00"); //M��e� mi n�co ��ci o Gomezovi?
	AI_Output (self, other,"DIA_SCAR_PERM_08_01"); //V�echno, co pot�ebuje� v�d�t je to, �e je to nejmocn�j�� mu� v kolonii.
	AI_Output (self, other,"DIA_SCAR_PERM_08_02"); //Dostane, co chce, ale to, co chce nejv�c, je moc.
};

