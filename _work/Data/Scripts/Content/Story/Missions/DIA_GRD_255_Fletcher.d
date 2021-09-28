// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance  DIA_Fletcher_EXIT (C_INFO)
{
	npc			=	Grd_255_Fletcher;
	nr			=	999;
	condition	=	DIA_Fletcher_EXIT_Condition;
	information	=	DIA_Fletcher_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  DIA_Fletcher_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fletcher_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
//						FIRST	NACHT				
// ************************************************************

instance DIA_Fletcher_First (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_First_Condition;
	information		= DIA_Fletcher_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_First_Condition()
{	
	if (Wld_IsTime(00,00,06,00))
	{
		return 1;
	};
};

func void  DIA_Fletcher_First_Info()
{
	AI_Output (self, other,"DIA_Fletcher_First_06_00"); //Hej, ty!
	AI_Output (other, self,"DIA_Fletcher_First_15_01"); //Kto? Ja?
	AI_Output (self, other,"DIA_Fletcher_First_06_02"); //Wiesz dobrze, do kogo m�wi�, synku!
	AI_Output (self, other,"DIA_Fletcher_First_06_03"); //Co� ci powiem: to m�j rejon. I nie chc� tutaj �adnych k�opot�w!
	AI_Output (self, other,"DIA_Fletcher_First_06_04"); //Ale nowi, tacy jak ty, zawsze sprawiaj� k�opoty. Zw�aszcza, kiedy buszuj� tutaj w nocy.
	AI_Output (self, other,"DIA_Fletcher_First_06_05"); //Lepiej b�dzie je�li p�jdziesz sobie ju� do domu i nie poka�esz si� tutaj zbyt pr�dko. Przy arenie jest jedna pusta chata, ma daszek nad wej�ciem. Id� spa�!
	AI_Output (self, other,"DIA_Fletcher_First_06_06"); //Ale je�li z�api� ci� na grzebaniu w cudzych chatach, osobi�cie postaram si�, �eby� ju� nigdy wi�cej tego nie zrobi�!
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
//							Hallo				
// ************************************************************
	var int fletcher_whytalk;
// ************************************************************

instance DIA_Fletcher_Hello (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 2;
	condition		= DIA_Fletcher_Hello_Condition;
	information		= DIA_Fletcher_Hello_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_Hello_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void  DIA_Fletcher_Hello_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_15_00"); //Hej, ty!
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //Je�li chcesz si� pozby� swoich pieni�dzy za ochron�, wybra�e� z�y dzie�.
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //Tak? A dlaczego?
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //Bo mnie tu nie ma.
	
	Info_ClearChoices	(DIA_Fletcher_Hello);
	Info_AddChoice		(DIA_Fletcher_Hello,"Rozumiem.",DIA_Fletcher_Hello_ISee);
	Info_AddChoice		(DIA_Fletcher_Hello,"To jakim cudem z tob� rozmawiam?",DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice		(DIA_Fletcher_Hello,"Czy�by? A gdzie jeste�?",DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhereElse_15_00"); //Czy�by? A gdzie jeste�?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhereElse_06_01"); //W tej chwili siedz� w zamku, przy ognisku i popijam piwo.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //To jakim cudem z tob� rozmawiam?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Nek gdzie� znikn��. Zwykle to on patroluje ten rejon.
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //A dop�ki nie raczy si� tutaj zjawi�, Thorus kaza� MI mie� oko na wszystko.
	fletcher_whytalk = TRUE;
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_ISee_15_00"); //Rozumiem.
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

// ************************************************************
//						Wo Nek				
// ************************************************************

instance DIA_Fletcher_WoNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WoNek_Condition;
	information		= DIA_Fletcher_WoNek_Info;
	permanent		= 0;
	description		= "Wiesz gdzie si� podziewa Nek?";
};

func int DIA_Fletcher_WoNek_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_STT_315_LostNek) || (fletcher_whytalk==TRUE) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_WoNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WoNek_15_00"); //Wiesz, gdzie si� podziewa Nek?
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_01"); //Nie, i raczej si� tego nie dowiem.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_02"); //Je�li komu� co� o tym wiadomo, to pewnie tutejszym Kopaczom. Ale oni nie rozmawiaj� ze Stra�nikami.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_03"); //A zw�aszcza ze mn�, bo wiedz�, �e brzydz� si� ich robot�. Za�o�� si�, �e pod�miewaj� si� ze mnie za moimi plecami.
	
	Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	B_LogEntry			(CH1_LostNek,"Mo�e Kopacze mieszkaj�cy w pobli�u areny wiedz� gdzie si� podzia� Nek.");
};

// ************************************************************
//						Trotzdem Schutzgeld				
// ************************************************************

instance DIA_Fletcher_TroSchu (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_TroSchu_Condition;
	information		= DIA_Fletcher_TroSchu_Info;
	permanent		= 0;
	description		= "Ale dlaczego nie zbierasz pieni�dzy za ochron�?";
};

FUNC int  DIA_Fletcher_TroSchu_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_Hello) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_TroSchu_Info()
{
	AI_Output (other, self,"DIA_Fletcher_TroSchu_15_00"); //Ale dlaczego nie zbierasz pieni�dzy za ochron�?
	AI_Output (self, other,"DIA_Fletcher_TroSchu_06_01"); //Nek zebra� ju�, co by�o do zebrania. Wi�cej z nich nie wycisn�.
};

// ************************************************************
//						Wegen Nek			
// ************************************************************
	var int fletcher_foundNek;
// ************************************************************

instance DIA_Fletcher_WegenNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WegenNek_Condition;
	information		= DIA_Fletcher_WegenNek_Info;
	permanent		= 1;
	description		= "Chodzi o Neka.";
};

FUNC int  DIA_Fletcher_WegenNek_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_WoNek) && (fletcher_foundNek==FALSE) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_WegenNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WegenNek_15_00"); //Chodzi o Neka.
	AI_Output (self, other,"DIA_Fletcher_WegenNek_06_01"); //Tak?
	
	var C_NPC Nek; Nek = Hlp_GetNpc(Grd_282_Nek);
	
	if ( (Sly_LostNek == LOG_SUCCESS) || (!Hlp_IsValidNpc(Nek)) )
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_02"); //Chyba go znalaz�em.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_03"); //Co? Gdzie on jest?
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_04"); //W innym, lepszym �wiecie...
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_05"); //O cholera! To znaczy, �e b�d� tutaj tkwi� do ko�ca �ycia. Mia�em nadziej�, �e ten b�cwa� jednak wr�ci.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_06"); //Teraz mam k�opot.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_07"); //�adnych wie�ci.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_08"); //Informuj mnie na bie��co.
	};
};

// ************************************************************
//						Problem
// ************************************************************

instance DIA_Fletcher_Problem (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_Problem_Condition;
	information		= DIA_Fletcher_Problem_Info;
	permanent		= 0;
	description		= "Jaki problem?";
};

FUNC int  DIA_Fletcher_Problem_Condition()
{	
	if ( fletcher_foundNek == TRUE )
	{
		return 1;
	};
};

func void  DIA_Fletcher_Problem_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Problem_15_00"); //Jaki problem?
	AI_Output (self, other,"DIA_Fletcher_Problem_06_01"); //Jestem winien Scatty'emu nie lada sumk�. Kiedy dowie si�, �e przej��em dzia�k� Neka, b�dzie mnie nachodzi� codziennie...
};	












//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
//						GARDIST GEWORDEN					
// ************************************************************
instance Grd_255_Fletcher_WELCOME (C_INFO)
{
	npc				= Grd_255_Fletcher;
	condition		= Grd_255_Fletcher_WELCOME_Condition;
	information		= Grd_255_Fletcher_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_255_Fletcher_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  Grd_255_Fletcher_WELCOME_Info()
{
	AI_Output (self, other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //Widz�, �e szybko nauczy�e� si� dba� o swoje interesy. Witamy w Stra�y!
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Fletcher_DIE (C_INFO)
{
	npc			= Grd_255_Fletcher;
	condition	= Info_Fletcher_DIE_Condition;
	information	= Info_Fletcher_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Fletcher_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Fletcher_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //Zdrajco! I pomy�le�, �e uwa�ali�my ci� za jednego z nas!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //To jeden z tych zdradzieckich Mag�w Ognia!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //Witaj, ZDRAJCO! Teraz nie pomog� ci nawet znajomo�ci w�r�d Cieni!
		};			

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_04"); //O czym ty do diab�a m�wisz, Fletcher?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //Zadajesz si� z tymi bandziorami z Nowego Obozu! A mo�e nie?!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Zaczekaj...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //My�la�e�, �e si� nie domy�limy, co? CO?!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //Hej... Postrada�e� zmys�y?!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //Ja? Ale� sk�d. Za to TY za chwil� stracisz G�OW�, kolego.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //GI�, ZDRAJCO!!!

		if	Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Bloodwyn okopa� si� przy tylnej bramie. Na m�j widok zareagowa� podobnie jak Fletcher. Mam wra�enie, �e ma to co� wsp�lnego z moimi poszukiwaniami kamienia ogniskuj�cego dla Nowego Obozu.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Fletcher, kt�ry strze�e teraz g��wnej bramy Starego Obozu, nazwa� mnie zdrajc�. Nie chcia� mnie nawet wys�ucha� - od razu rzuci� si� do ataku!");
			B_LogEntry			(CH4_BannedFromOC,"Wygl�da na to, �e zosta�em wygnany ze Starego Obozu!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //No prosz�. To go�� z Nowego Obozu!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //Patrzcie no. To go�� z Sekty!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //I co z tego? Masz z tym jaki� problem?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //Mie�, to ja b�d� wasz� ma�� kopalni�!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //Czy�by? Chyba �nisz!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //Przykro mi, ale nie mo�emy pozwoli�, �eby� o tym komu� powiedzia�!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Zaczekaj, nie szukam k�opot�w.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //Trzeba by�o o tym pomy�le� zanim tutaj przyszed�e�!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //Hej, co u...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //Dalej ch�opcy! Na niego!
	};

	Npc_ExchangeRoutine	(self,	"FMTaken2");				// Verst�rkung vor das Haupttor (Anf�hrer)
	B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor
	B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor
	B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken2");	// Verst�rkung vor das Haupttor (Fernk�mpfer)
	B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken2");	// regul�re Wache am Haupttor
	B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken2");	// regul�re Wache am Haupttor

	B_SetPermAttitude	(GRD_255_Fletcher,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_252_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_253_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_244_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_214_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_215_Torwache,	ATT_HOSTILE);
	
	if	!Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
	{
		B_LogEntry		(CH4_Firemages,"Bramy do Starego Obozu zosta�y zamkni�te i pozostaj� pilnie strze�one. Stra�nicy atakuj� ka�dego, kto podejdzie w pobli�e obozu.");
	};
	
	AI_StopProcessInfos	(self);
};

