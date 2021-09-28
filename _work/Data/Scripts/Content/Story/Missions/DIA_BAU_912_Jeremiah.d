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
	description = "Co d�l�?";
};                       

FUNC int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Hallo_15_00"); //Co d�l�?
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_01"); //Vyr�b�m r��ovou p�lenku, hochu.
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_02"); //Tady - vezmi l�hev. Ale ne��kej to Silasovi.
	
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
	description = "Jak to chod� v pal�rn�?";
};                       

FUNC int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_PERM_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_PERM_15_00"); //Jak to chod� v pal�rn�?
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_01"); //Jen st�� dok�u ty chlapy udr�et na uzd�. �lov��e, jen by pili!
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_02"); //Je to v�n� dobr�. Dokud m�m co d�lat, poskoci R��ov�ho Lorda m� nech�vaj� na pokoji.
	
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
	description = "Co mi m��e� ��ci o R��ov�m Lordovi?";
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
	AI_Output (other, self,"DIA_Jeremiah_Horatio_15_00"); //Co mi m��e� ��ci o R��ov�m Lordovi?
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_01"); //Je to zpropadenej gauner! Jeho lidi vyhled�vaj� slab�, kter� pak nut� pracovat na pol�ch.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_02"); //Jedin�, kdo by se mu mohl postavit, je Horatio. Ten ale nechce n�sil�.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_03"); //Jednou jsem ho sly�el ��kat, �e by R��ov�ho Lorda nejrad�ji pra�til po hlav�, ale nikdy by to doopravdy neud�lal.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_04"); //Bylo by to proti jeho p�esv�d�en�.
};

