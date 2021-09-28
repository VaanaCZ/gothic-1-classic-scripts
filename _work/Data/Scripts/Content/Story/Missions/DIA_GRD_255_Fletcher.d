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
	AI_Output (self, other,"DIA_Fletcher_First_06_00"); //Ehi, tu!
	AI_Output (other, self,"DIA_Fletcher_First_15_01"); //Chi, io?
	AI_Output (self, other,"DIA_Fletcher_First_06_02"); //Lo sai benissimo, figliolo!
	AI_Output (self, other,"DIA_Fletcher_First_06_03"); //Lascia che ti dica una cosa: questo è il MIO distretto e non voglio guai!
	AI_Output (self, other,"DIA_Fletcher_First_06_04"); //I nuovi arrivati come te ne causano sempre, specialmente quando gironzolano intorno la notte.
	AI_Output (self, other,"DIA_Fletcher_First_06_05"); //Quindi perché non te ne torni a casa e non ti fai più rivedere? C'è una capanna vuota di fronte all'arena, quella con il patio. Vai a riposare.
	AI_Output (self, other,"DIA_Fletcher_First_06_06"); //Se ti becco in un'altra capanna, te ne farò pentire amaramente!
	
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
	AI_Output (other, self,"DIA_Fletcher_Hello_15_00"); //Ehi, tu!
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //Se vuoi pagare la tassa di protezione, hai scelto il giorno sbagliato.
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //Ah sì? E perché?
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //Perché io non sono qui.
	
	Info_ClearChoices	(DIA_Fletcher_Hello);
	Info_AddChoice		(DIA_Fletcher_Hello,"Capisco.",DIA_Fletcher_Hello_ISee);
	Info_AddChoice		(DIA_Fletcher_Hello,"E come mai ti sto parlando?",DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice		(DIA_Fletcher_Hello,"Oh! Allora dove sei?",DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhereElse_15_00"); //Oh! Allora dove sei?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhereElse_06_01"); //Dentro al castello, seduto vicino al grande falò a bere birra.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //E come mai ti sto parlando?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Nek è sparito. Questo distretto è sotto la sua responsabilità.
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //E finché non riappare, Thorus ha ordinato a ME di prendere il suo posto.
	fletcher_whytalk = TRUE;
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_ISee_15_00"); //Capisco.
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
	description		= "Sai dove si è cacciato Nek?";
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
	AI_Output (other, self,"DIA_Fletcher_WoNek_15_00"); //Sai dove si è cacciato Nek?
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_01"); //No, e non credo che lo scoprirò.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_02"); //Forse i minatori di questo distretto sanno qualcosa, ma non parlano con le guardie.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_03"); //Specialmente sapendo quanto odio questo maledetto lavoro. Scommetto che ridono alle mie spalle!
	
	Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	B_LogEntry			(CH1_LostNek,"Forse i minatori del distretto dell'arena sanno dov'è finito Nek.");
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
	description		= "Perché non raccogli altre tasse di protezione?";
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
	AI_Output (other, self,"DIA_Fletcher_TroSchu_15_00"); //Perché non raccogli altre tasse di protezione?
	AI_Output (self, other,"DIA_Fletcher_TroSchu_06_01"); //Nek ha fatto il suo giro prima di sparire. Non è rimasto molto da raccogliere.
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
	description		= "A proposito di Nek...";
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
	AI_Output (other, self,"DIA_Fletcher_WegenNek_15_00"); //A proposito di Nek...
	AI_Output (self, other,"DIA_Fletcher_WegenNek_06_01"); //Sì?
	
	var C_NPC Nek; Nek = Hlp_GetNpc(Grd_282_Nek);
	
	if ( (Sly_LostNek == LOG_SUCCESS) || (!Hlp_IsValidNpc(Nek)) )
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_02"); //Credo di averlo trovato.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_03"); //Cosa? Dov'è?
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_04"); //A nutrire i topi.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_05"); //Oh, no! Maledizione! Questo significa che ora dovrò occuparmi io di tutto! Speravo che sarebbe tornato!
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_06"); //Ora ho un problema.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_07"); //Non mi sorprende.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_08"); //Tienimi aggiornato.
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
	description		= "Qual è il problema?";
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
	AI_Output (other, self,"DIA_Fletcher_Problem_15_00"); //Qual è il problema?
	AI_Output (self, other,"DIA_Fletcher_Problem_06_01"); //Sono indebitato fino al collo con Scatty. Ora che sa che ho preso il posto di Nek, si farà vivo ogni giorno...
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
	AI_Output (self, other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //Ti sei abituato ai nostri metodi molto in fretta. Benvenuto fra le guardie!
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
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //Traditore! Se penso che abbiamo permesso a un verme come te di unirsi alle guardie! BAH!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //È uno di quei Maghi del Fuoco traditori! Bah!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //Ciao, traditore! Essere stato una delle Ombre di Gomez non ti aiuterà, ora.
		};			

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_04"); //Ehi! Di cosa parli, Fletcher?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //Sei in combutta con la feccia di Campo Nuovo, vero?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Aspetta...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //Probabilmente pensavi che non l'avremmo mai scoperto, vero?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //Ehi, non perdere la testa!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //Infatti sarai TU a perderla, molto presto!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //MUORI, TRADITORE!!!

		if	Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Bloodwyn si è trincerato al cancello posteriore e ha reagito allo stesso modo di Fletcher. Non so come, ma tutto ciò deve essere in qualche modo collegato alla mia ricerca delle pietre focalizzatrici.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Fletcher, il guardiano dell'ingresso principale di Campo Vecchio, mi ha chiamato traditore e rinnegato. Non ha voluto ascoltarmi e mi si è scagliato contro!");
			B_LogEntry			(CH4_BannedFromOC,"Sembra che io sia stato bandito da Campo Vecchio!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //Guardate! Uno di Campo Nuovo!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //Guardate! Uno di Campo Palude!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //E allora? Non sono affari vostri!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //Presto la tua miniera sarà nostra.
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //Davvero? Sogna pure, bello!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //Non posso permettere che tu vada a spifferarlo in giro!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Aspetta! Io non voglio problemi.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //Dovevi pensarci prima di farti vedere da queste parti!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //Ehi, ma che...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //Coraggio, ragazzi: prendiamolo!
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
		B_LogEntry		(CH4_Firemages,"Ora i cancelli di Campo Vecchio sono chiusi. Le guardie che li custodiscono attaccheranno chiunque tenti d'avvicinarsi.");
	};
	
	AI_StopProcessInfos	(self);
};

