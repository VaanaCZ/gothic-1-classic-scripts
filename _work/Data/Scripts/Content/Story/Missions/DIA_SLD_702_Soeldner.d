// ********************************
// 				EXIT
// ********************************

instance DIA_Sld_702_EXIT (C_INFO)
{
	npc			= Sld_702_Soeldner;
	nr			= 999;
	condition	= DIA_Sld_702_EXIT_Condition;
	information	= DIA_Sld_702_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Sld_702_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Sld_702_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Sld_702_First (C_INFO)
{
	npc			= Sld_702_Soeldner;
	nr			= 1;
	condition	= DIA_Sld_702_First_Condition;
	information	= DIA_Sld_702_First_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int DIA_Sld_702_First_Condition()
{
	if (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Sld_702_First_Info()
{
	AI_Output (self, other,"DIA_Sld_702_First_04_00"); //Víš, kam jdeš?
	AI_Output (other, self,"DIA_Sld_702_First_15_01"); //Kam?
	AI_Output (self, other,"DIA_Sld_702_First_04_02"); //Jdeš pøímo k Leeovi, našemu vùdci.
};

// ********************************
// 				PERM
// ********************************

instance DIA_Sld_702_PERM (C_INFO)
{
	npc			= Sld_702_Soeldner;
	nr			= 1;
	condition	= DIA_Sld_702_PERM_Condition;
	information	= DIA_Sld_702_PERM_Info;
	permanent	= 1;
	description = "Co musím udìlat, abys mì pustil k Leeovi?";
};                       

FUNC int DIA_Sld_702_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Sld_702_PERM_Info()
{
	AI_Output (other, self,"DIA_Sld_702_PERM_15_00"); //Co musím udìlat, abys mì pustil k Leeovi?
	AI_Output (self, other,"DIA_Sld_702_PERM_04_01"); //Nic!
	AI_Output (self, other,"DIA_Sld_702_PERM_04_02"); //Tohle není Starý tábor a Lee není Gomez!
	AI_Output (self, other,"DIA_Sld_702_PERM_04_03"); //Nepotøebuje žádnou armádu lokajù, za které by se schovával. Dokáže se ubránit sám!
	AI_Output (self, other,"DIA_Sld_702_PERM_04_04"); //MY jsme tady jen pro pøípad, kdyby nás potøeboval.
};



