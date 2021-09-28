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
	description = "Co dìláš?";
};                       

FUNC int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Hallo_15_00"); //Co dìláš?
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_01"); //Vyrábím rýžovou pálenku, hochu.
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_02"); //Tady - vezmi láhev. Ale neøíkej to Silasovi.
	
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
	description = "Jak to chodí v palírnì?";
};                       

FUNC int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_PERM_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_PERM_15_00"); //Jak to chodí v palírnì?
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_01"); //Jen stìží dokážu ty chlapy udržet na uzdì. Èlovìèe, jen by pili!
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_02"); //Je to vážnì dobré. Dokud mám co dìlat, poskoci Rýžového Lorda mì nechávají na pokoji.
	
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
	description = "Co mi mùžeš øíci o Rýžovém Lordovi?";
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
	AI_Output (other, self,"DIA_Jeremiah_Horatio_15_00"); //Co mi mùžeš øíci o Rýžovém Lordovi?
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_01"); //Je to zpropadenej gauner! Jeho lidi vyhledávají slabé, které pak nutí pracovat na polích.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_02"); //Jediný, kdo by se mu mohl postavit, je Horatio. Ten ale nechce násilí.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_03"); //Jednou jsem ho slyšel øíkat, že by Rýžového Lorda nejradìji praštil po hlavì, ale nikdy by to doopravdy neudìlal.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_04"); //Bylo by to proti jeho pøesvìdèení.
};

