// ************************ EXIT **************************

instance  Info_XardasDemon_EXIT (C_INFO)
{
	npc			=	XardasDemon;
	nr			=	999;
	condition	=	Info_XardasDemon_EXIT_Condition;
	information	=	Info_XardasDemon_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_XardasDemon_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_XardasDemon_EXIT_Info()
{
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output (hero, self,"Info_Saturas_EXIT_15_01"); //�miertelny?... Kto, ja?... Dobrze, ju� id�!

	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info INTRO
//***************************************************************************
instance Info_XardasDemon_INTRO (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_INTRO_Condition;
	information	= Info_XardasDemon_INTRO_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_XardasDemon_INTRO_Condition()
{	
	if (FindXardas)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_INTRO_Info()
{
	AI_TurnAway		(hero, self);
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_01"); //Zaraz... Kto... Kto to powiedzia�?
	AI_WhirlAround	(hero, self);	//KEIN B_Whirlaround()!!!
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_02"); //To TY?! Jak... Jak si� dosta�e� do mojej g�owy?
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_03"); //CZYM jeste�? S�ug� swego pana?
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_04"); //Wygl�dasz mi raczej na stwora z piek�a rodem!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_05"); //Mam by� cicho?
};

//***************************************************************************
//	Info MASTERWHO
//***************************************************************************
instance Info_XardasDemon_MASTERWHO (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_MASTERWHO_Condition;
	information	= Info_XardasDemon_MASTERWHO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Czy imi� twego pana nie brzmi przypadkiem XARDAS?";
};

FUNC INT Info_XardasDemon_MASTERWHO_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_XardasDemon_INTRO))
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_MASTERWHO_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_MASTERWHO_15_01"); //Czy imi� twego pana nie brzmi przypadkiem XARDAS?
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_MASTERWHO_15_02"); //Aha... Wi�c imiona nie s� istotne... W porz�dku.
	AI_Output		(hero, self,"Info_XardasDemon_MASTERWHO_15_03"); //Za��my, �e to JEST wie�a Xardasa.
};

//***************************************************************************
//	Info MASTERHOW
//***************************************************************************
instance Info_XardasDemon_MASTERHOW (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_MASTERHOW_Condition;
	information	= Info_XardasDemon_MASTERHOW_Info;
	permanent	= 0;
	important 	= 0;
	description = "Domagam si� widzenia z twoim panem!";
};

FUNC INT Info_XardasDemon_MASTERHOW_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_XardasDemon_INTRO))
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_MASTERHOW_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_01"); //Domagam si� widzenia z twoim panem!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_02"); //...Ja? Niegodny?? ...Jaki znowu sprawdzian?
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_03"); //Ach! Rozumiem... Ktokolwiek zechce rozmawia� z twoim panem, musi najpierw udowodni�, �e jest tego godzien!
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_04"); //...Zaraz, co m�wi�e�? Dow�d? Zwyci�stwa nad czym?... Zwyci�stwa nad �ywio�ami?
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_05"); //...Kamie�? ...L�d? ...Ogie�?

	FindGolemHearts = 1;		// Auftrag vergeben

	B_LogEntry		(CH4_FindXardas,"W wie�y Xardasa spotka�em demona, kt�ry przem�wi� do mnie telepatycznie. Zanim pozwoli mi spotka� si� ze swoim panem, mam mu z�o�y� trzy dowody mojego zwyci�stwa nad �ywio�ami ognia, lodu i ziemi.");
};

//***************************************************************************
//	Info NOHEART
//***************************************************************************
instance Info_XardasDemon_NOHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_NOHEART_Condition;
	information	= Info_XardasDemon_NOHEART_Info;
	permanent	= 1;
	important 	= 0;
	description = "M�wisz zagadkami!";
};

FUNC INT Info_XardasDemon_NOHEART_Condition()
{	
	if 	 Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	!Npc_HasItems (hero, ItAt_StoneGolem_01)
	&&	!Npc_HasItems (hero, ItAt_IceGolem_01)
	&&	!Npc_HasItems (hero, ItAt_FireGolem_01)
	&&	(FindGolemHearts < 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_NOHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_NOHEART_15_01"); //M�wisz zagadkami!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_NOHEART_15_02"); //... Ju� to s�ysza�em. Powtarzasz si�!
	AI_Output		(hero, self,"Info_XardasDemon_NOHEART_15_03"); //... Domagasz si� dowodu mojego zwyci�stwa nad �ywio�ami ognia, lodu i ziemi!
};

//***************************************************************************
//	Ein Herz abliefern
//***************************************************************************
func void B_XardasDemon_GiveHeart()
{
	if 		(FindGolemHearts == 1)
	{
		AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_01"); //Co? A, tak!... Godnego dowodu!
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_02"); //... Brakuje? Brakuje jeszcze dw�ch?
		FindGolemHearts = 2;
	}
	else if (FindGolemHearts == 2)
	{
		AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_03"); //... Podw�jny? ... Drugi dow�d?
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_04"); //... Potrzeba jeszcze jednego?
		FindGolemHearts = 3;
	}
	else if (FindGolemHearts == 3)
	{
		AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_05"); //...Perfekcja?... Jestem godny?
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_06"); //W takim razie domagam si� widzenia z twoim panem!
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_07"); //...Kolejny dow�d?... Jaki znowu dow�d?... Runa?... Runa DLA mnie?
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_08"); //C�, w takim razie przyjmuj� t� run� teleportacji, jako dow�d tego, �e okaza�em si� godny!

		B_Story_AccessToXardas();
	};
};


//***************************************************************************
//	Info STONEHEART
//***************************************************************************
instance Info_XardasDemon_STONEHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_STONEHEART_Condition;
	information	= Info_XardasDemon_STONEHEART_Info;
	permanent	= 0;
	important 	= 0;
	description = "Oto serce kamiennego golema.";
};

FUNC INT Info_XardasDemon_STONEHEART_Condition()
{	
	if 	Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	Npc_HasItems (hero, ItAt_StoneGolem_01)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_STONEHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_STONEHEART_15_01"); //Oto serce kamiennego golema.

    B_GiveInvItems  (hero, self, ItAt_StoneGolem_01, 1);
	Npc_RemoveInvItem(self, ItAt_StoneGolem_01);

	B_XardasDemon_GiveHeart();
};

//***************************************************************************
//	Info ICEHEART
//***************************************************************************
instance Info_XardasDemon_ICEHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_ICEHEART_Condition;
	information	= Info_XardasDemon_ICEHEART_Info;
	permanent	= 0;
	important 	= 0;
	description = "Czy to serce lodowego golema jest wystarczaj�cym dowodem?";
};

FUNC INT Info_XardasDemon_ICEHEART_Condition()
{	
	if 	Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	Npc_HasItems (hero, ItAt_IceGolem_01)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_ICEHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_ICEHEART_15_01"); //Czy to serce lodowego golema jest wystarczaj�cym dowodem?

	B_GiveInvItems  (hero, self, ItAt_IceGolem_01, 1);

	B_XardasDemon_GiveHeart();
};

//***************************************************************************
//	Info FIREHEART
//***************************************************************************
instance Info_XardasDemon_FIREHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_FIREHEART_Condition;
	information	= Info_XardasDemon_FIREHEART_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mo�e by� to serce ognistego golema?";
};

FUNC INT Info_XardasDemon_FIREHEART_Condition()
{	
	if 	Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	Npc_HasItems (hero, ItAt_FireGolem_01)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_FIREHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_FIREHEART_15_01"); //Mo�e by� to serce ognistego golema?

	B_GiveInvItems  (hero, self, ItAt_FireGolem_01, 1);

	B_XardasDemon_GiveHeart();
};





