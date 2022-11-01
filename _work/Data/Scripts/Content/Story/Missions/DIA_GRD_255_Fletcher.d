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
	AI_Output (other, self,"DIA_Fletcher_First_15_01"); //Kdo? Já?
	AI_Output (self, other,"DIA_Fletcher_First_06_02"); //Však ty víš, s kým mluvím, zlatíčko!
	AI_Output (self, other,"DIA_Fletcher_First_06_03"); //Musím ti něco říci. Tohle je MŮJ obvod a nechci tu žádné problémy!
	AI_Output (self, other,"DIA_Fletcher_First_06_04"); //Nováčci jako ty mívají vždycky problémy. Obzvlášť, když se tu motají v noci.
	AI_Output (self, other,"DIA_Fletcher_First_06_05"); //Tak raději běž, a ať už tě tu nevidím! Naproti aréně je prázdná chatrč, v které je pelest. Trochu se vyspi.
	AI_Output (self, other,"DIA_Fletcher_First_06_06"); //A jestli tě chytím v nějaké jiné chatrči, osobně dohlídnu na to, abys toho litoval.
	
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
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //Jestli jdeš dát peníze za ochranu - pak sis zvolil špatný den.
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //Tak? Co to má znamenat?
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //Protože už tady nejsem.
	
	Info_ClearChoices	(DIA_Fletcher_Hello);
	Info_AddChoice		(DIA_Fletcher_Hello,"Aha...",DIA_Fletcher_Hello_ISee);
	Info_AddChoice		(DIA_Fletcher_Hello,"Tak jak to, že tady s tebou mluvím?",DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice		(DIA_Fletcher_Hello,"Och, a kde teda potom jsi?",DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhereElse_15_00"); //Och, a kde teda potom jsi?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhereElse_06_01"); //Momentálně jsem na hradě, sedím u velkého táborového ohně a piju džbánky piva.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //Tak jak to, že tady s tebou mluvím?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Zmizel Nek. Za tenhle obvod obvykle zodpovídá on.
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //A dokud se znovu neobjeví, Thorus MI přikázal, abych tu dělal stráž.
	fletcher_whytalk = TRUE;
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_ISee_15_00"); //Aha.
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
	description		= "Víš, kam zmizel Nek?";
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
	AI_Output (other, self,"DIA_Fletcher_WoNek_15_00"); //Víš, kam zmizel Nek?
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_01"); //Ne, a ani ho nebudu hledat.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_02"); //Pokud by o tom mohl v téhle čtvrti někdo něco vědět, pak jsou to kopáči. Ti ale se strážemi nemluví.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_03"); //Obzvlášť ne teď, když vědí, jak já tuhle špinavou práci nenávidím. Vsadím se, že se mi vysmívají za zádama.
	
	Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	B_LogEntry			(CH1_LostNek,"Možná budou kopáči z oblasti arény vědět, kam zmizel Nek.");
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
	description		= "Proč přesto nevybereš nějaké peníze za ochranu?";
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
	AI_Output (other, self,"DIA_Fletcher_TroSchu_15_00"); //Proč přesto nevybereš nějaké peníze za ochranu?
	AI_Output (self, other,"DIA_Fletcher_TroSchu_06_01"); //Nek už je vybral, než zmizel. Už toho moc nezbylo, aby se ještě vybíralo.
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
	description		= "Co se týče Neka...";
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
	AI_Output (other, self,"DIA_Fletcher_WegenNek_15_00"); //Co se týče Neka...
	AI_Output (self, other,"DIA_Fletcher_WegenNek_06_01"); //Jistě?
	
	var C_NPC Nek; Nek = Hlp_GetNpc(Grd_282_Nek);
	
	if ( (Sly_LostNek == LOG_SUCCESS) || (!Hlp_IsValidNpc(Nek)) )
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_02"); //Myslím, že vím, kde je.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_03"); //Cože? A kde je?
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_04"); //Je z něj žrádlo pro krysy...
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_05"); //Ach ne! Sakra! To znamená, že se tu teď budu muset ukazovat. Doufal jsem, že se vrátí zpátky.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_06"); //A máme tu problém.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_07"); //Žádné zprávy.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_08"); //Pořád mě informuj.
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
	description		= "Co je to za problém?";
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
	AI_Output (other, self,"DIA_Fletcher_Problem_15_00"); //Co je to za problém?
	AI_Output (self, other,"DIA_Fletcher_Problem_06_01"); //Jsem dlužný Scattymu, a to pořádně. Teď se dozví, že dělám Nekovu práci a bude sem chodit každý den...
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
	AI_Output (self, other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //Pochopil jsi rychle, jak to tu chodí. Vítej mezi stráže!
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
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //Zrádce! Myslet si, že necháme takové jako ty, aby se k nám přidali. BRR!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //Je to jeden z těch zrádných mágů Ohně! BRR!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //Zdar, zrádče! To, žes byl jedním z Gomezových Stínů, ti teď nepomůže!
		};			

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_04"); //Moment. Jak to myslíš, Fletchere?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //Patříš k té čeládce z Nového tábora, viď?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Zadrž...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //Myslel sis, že na to nepřijdeme, co?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //No tak... Zadrž!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //Ne, TY zadrž - a drž si pevně hlavu! Protože o ní co nevidět přijdeš!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //SMRT ZRÁDCI!!!

		if	Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Bloodwyn se opevnil u zadní brány. Zachoval se stejně jako Fletcher, který teď střeží hlavní bránu. Nevím sice jak, ale musí to nějak souviset s mým hledáním ohniska v pro Nový tábor.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Fletcher, který se skupinou vojáků střeží hlavní bránu Starého tábora, mě nazval zrádcem a odpadlíkem. Ani mě nevyslechl a zaútočil na mě!");
			B_LogEntry			(CH4_BannedFromOC,"Vypadá to, že jsem vyhoštěn ze Starého tábora.");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //Podívej se na to. Je to chlap z Nového tábora!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //Podívej se na to. Je to chlap z tábora od bažin!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //A co? Co tady pohledáváš?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //Váš důl bude zanedlouho náš.
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //Jo? Pěkný sen!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //Promiň, ale nemůžu riskovat, že to řekneš někomu dalšímu!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Zadrž, nechci žádné problémy!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //Na to's měl myslet dřív, než ses tu ukázal!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //Hej, co má tahle hádka...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //Pojďte, hoši, chytneme ho!
	};

	Npc_ExchangeRoutine	(self,	"FMTaken2");				// Verstärkung vor das Haupttor (Anführer)
	B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor
	B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor
	B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor (Fernkämpfer)
	B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken2");	// reguläre Wache am Haupttor
	B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken2");	// reguläre Wache am Haupttor

	B_SetPermAttitude	(GRD_255_Fletcher,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_252_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_253_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_244_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_214_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_215_Torwache,	ATT_HOSTILE);
	
	if	!Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
	{
		B_LogEntry		(CH4_Firemages,"Brány Starého tábora jsou nyní uzavřeny a hlídány strážemi. Napadají každého, kdo se přiblíží k táboru.");
	};
	
	AI_StopProcessInfos	(self);
};

