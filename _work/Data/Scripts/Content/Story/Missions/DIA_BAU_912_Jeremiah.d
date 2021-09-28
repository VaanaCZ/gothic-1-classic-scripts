// ********************************
// 				EXIT
// ********************************

instance DIA_Jeremiah_EXIT (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 999;
	condition	= DIA_Jeremiah_EXIT_Condition;
	information	= DIA_Jeremiah_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Jeremiah_Hallo (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_Hallo_Condition;
	information	= DIA_Jeremiah_Hallo_Info;
	permanent	= 0;
	description = "Co robisz?";
};                       

FUNC int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Hallo_15_00"); //Co robisz?
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_01"); //Przygotowuj� ry��wk�, ch�opcze.
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_02"); //Prosz� - we� sobie jedn� butelk�. Tylko nie m�w Silasowi.
	
	CreateInvItems	(self, ItFoBooze, 1);
	B_GiveInvItems	(self, other, ItFoBooze, 1);
};

// ********************************
// 				PERM
// ********************************
	var int Jeremiah_Bauer; //NUR lokal benutzt - wegen perm-info-condition Umgehung
// ********************************

instance DIA_Jeremiah_PERM (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_PERM_Condition;
	information	= DIA_Jeremiah_PERM_Info;
	permanent	= 1;
	description = "Jak idzie destylacja?";
};                       

FUNC int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_PERM_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_PERM_15_00"); //Jak idzie destylacja?
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_01"); //Przy tych facetach ledwie nad��am z zam�wieniami. Ci to potrafi� wypi�!
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_02"); //I nawet mi to na r�k�. Przynajmniej psy Ry�owego Ksi�cia zostawiaj� mnie w spokoju.
	
	Jeremiah_Bauer = TRUE;
};

// ********************************
// 				Horatio
// ********************************

instance DIA_Jeremiah_Horatio (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 2;
	condition	= DIA_Jeremiah_Horatio_Condition;
	information	= DIA_Jeremiah_Horatio_Info;
	permanent	= 0;
	description = "Co mo�esz mi powiedzie� o Ry�owym Ksi�ciu?";
};                       

FUNC int DIA_Jeremiah_Horatio_Condition()
{
	if (Jeremiah_Bauer == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Jeremiah_Horatio_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Horatio_15_00"); //Co mo�esz mi powiedzie� o Ry�owym Ksi�ciu?
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_01"); //To zapchlony wieprz! Jego siepacze zmuszaj� s�abszych do pracy na polach.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_02"); //Jedyna osoba, kt�ra mog�aby si� mu przeciwstawi� to Horacy. Ale on nie lubi przemocy.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_03"); //S�ysza�em, jak kiedy� powiedzia�, �e ma ochot� pogruchota� Ksi�ciu ko�ci, ale tak naprawd� nigdy by tego nie zrobi�.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_04"); //To by by�o wbrew jego zasadom.
};

