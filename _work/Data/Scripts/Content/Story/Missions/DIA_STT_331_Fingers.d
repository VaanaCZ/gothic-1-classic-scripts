// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_331_Fingers_Exit (C_INFO)
{
	npc			= STT_331_Fingers;
	nr			= 999;
	condition	= DIA_STT_331_Fingers_Exit_Condition;
	information	= DIA_STT_331_Fingers_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_331_Fingers_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_331_Fingers_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				 Schatten werden
// **************************************************
	var int Fingers_CanTeach;
// **************************************************

INSTANCE DIA_Fingers_BecomeShadow (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_BecomeShadow_Condition;
	information		= DIA_Fingers_BecomeShadow_Info;
	permanent		= 1;
	description		= "Voglio diventare un'Ombra!"; 
};

FUNC INT DIA_Fingers_BecomeShadow_Condition()
{	
	if ( (Fingers_CanTeach == FALSE) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_BecomeShadow_Info()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_15_00"); //Voglio diventare un'Ombra!
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_05_01"); //E allora?
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
	Info_AddChoice		(DIA_Fingers_BecomeShadow,DIALOG_BACK										,DIA_Fingers_BecomeShadow_BACK);
	if (Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice		(DIA_Fingers_BecomeShadow,"Cerco qualcuno che m'insegni qualcosa.",DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice		(DIA_Fingers_BecomeShadow,"Puoi aiutarmi?",DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_AnyTips_15_00"); //Puoi aiutarmi?
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_AnyTips_05_01"); //Non saprei come...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_00"); //Cerco qualcuno che m'insegni qualcosa.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_01"); //Perché sei venuto da me?
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_02"); //Mi manda Diego.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_03"); //Potevi dirlo prima!
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_04"); //Se desideri entrare a far parte del campo, devi essere un buon combattente o un abile ladro.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_05"); //Se le Ombre importanti decideranno di metterti alla prova, ti daranno delle missioni da svolgere segretamente.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_06"); //Ecco perché farai bene a diventare un ladro abile, per iniziare.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_07"); //Casualmente, io sono il ladro migliore di Campo Vecchio.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry			(GE_TeacherOC,"Fingers può insegnarmi a BORSEGGIARE e FORZARE SERRATURE.");
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

// **************************************************
// 						 Lehrer
// **************************************************
	var int Fingers_Wherecavalorn;

INSTANCE DIA_Fingers_Lehrer (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Lehrer_Condition;
	information		= DIA_Fingers_Lehrer_Info;
	permanent		= 1;
	description		= "Cosa puoi insegnarmi?"; 
};

FUNC INT DIA_Fingers_Lehrer_Condition()
{	
	if (Fingers_CanTeach == TRUE)
	{
		return 1;	
	};
};

FUNC VOID DIA_Fingers_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_15_00"); //Cosa puoi insegnarmi?
	AI_Output (self, other,"DIA_Fingers_Lehrer_05_02"); //Dipende da ciò che vuoi sapere.



	Info_ClearChoices	(DIA_Fingers_Lehrer);
	Info_AddChoice		(DIA_Fingers_Lehrer,DIALOG_BACK																	,DIA_Fingers_Lehrer_BACK);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2	,	LPCOST_TALENT_PICKPOCKET_2,0)	,DIA_Fingers_Lehrer_Pickpocket2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1	,	LPCOST_TALENT_PICKPOCKET_1,0)	,DIA_Fingers_Lehrer_Pickpocket);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2		,	LPCOST_TALENT_PICKLOCK_2,0)	,DIA_Fingers_Lehrer_Lockpick2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1		,	LPCOST_TALENT_PICKLOCK_1,0)	,DIA_Fingers_Lehrer_Lockpick);
	Info_AddChoice		(DIA_Fingers_Lehrer,"Voglio imparare a muovermi furtivamente.",DIA_Fingers_Lehrer_Schleichen);
};


func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Schleichen_15_00"); //Voglio imparare a muovermi furtivamente.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_01"); //Ritengo, senza falsa modestia, di essere uno dei migliori ladri mai apparsi nella colonia.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_02"); //Ma se si tratta d'insegnare a camminare di nascosto, Cavalorn è l'uomo che cerchi!
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick_15_00"); //Come faccio a migliorare la mia abilità di scassinatore?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_01"); //Ti piacerebbe saperlo, vero? Non è molto difficile.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_02"); //La cosa principale è stare attento che non ti si rompa il grimaldello.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_03"); //Sii paziente e vedrai che non avrai bisogno di portartene molti!
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick2_15_00"); //Come faccio a diventare uno scassinatore esperto?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_01"); //Solo con l'esperienza, riuscirai a capire dal suono quando un grimaldello sta per rompersi
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_02"); //Penso tu ne abbia a sufficienza. Impara a identificare il leggero clic del lucchetto e non sprecherai più tanti grimaldelli.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_03"); //In questo campo, un esperto può riuscire ad aprire un baule senza rompere neppure un grimaldello.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //Voglio diventare un abile borseggiatore!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //Così vuoi alleggerire un po' di gente, eh? Molto bene.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //T'insegnerò a migliorare le tue abilità, ma sarà ancora molto facile che ti colgano sul fatto.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //Dovresti rischiare solo se nelle vicinanze c'è esclusivamente la tua vittima e nessun altro.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //Solo un esperto può svuotare le tasche della gente senza farsi scoprire!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //Scordatelo! Non diventerai mai un ladro esperto, se prima non avrai imparato a muoverti furtivamente.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Pickpocket2_15_00"); //Voglio diventare un borseggiatore esperto!
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_01"); //Sei migliorato abbastanza da imparare gli ultimi trucchi del mestiere.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_02"); //Ma ricorda che anche i migliori si fanno beccare, a volte.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Stai attento.
	};
};

func VOID DIA_Fingers_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Fingers_Lehrer );
};

// **************************************************
// 					Wo Cavalorn
// **************************************************

INSTANCE DIA_Fingers_WhereCavalorn (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_WhereCavalorn_Condition;
	information		= DIA_Fingers_WhereCavalorn_Info;
	permanent		= 1;
	description		= "Dove si trova Cavalorn?"; 
};

FUNC INT DIA_Fingers_WhereCavalorn_Condition()
{	
	if (Fingers_Wherecavalorn == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_WhereCavalorn_Info()
{
	AI_Output (other, self,"DIA_Fingers_WhereCavalorn_15_00"); //Dove si trova Cavalorn?
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_01"); //Sta cacciando nella radura. Lo troverai sulla strada per Campo Nuovo. A ovest di Campo Vecchio c'è un grande canyon.
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_02"); //In questo canyon, c'è la vecchia capanna di un taglialegna. Lo troverai lì.
	
	B_LogEntry( GE_TeacherOW,"Cavalorn può insegnarmi a essere furtivo. La sua capanna si trova in un canyon a ovest di Campo Vecchio, in direzione di Campo Nuovo.");
};

// **************************************************
// 					Gutes Wort
// **************************************************
	var int Fingers_Learnt;
// **************************************************

INSTANCE DIA_Fingers_Learnt (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Learnt_Condition;
	information		= DIA_Fingers_Learnt_Info;
	permanent		= 1;
	description		= "Potresti parlare bene di me con Diego?"; 
};

FUNC INT DIA_Fingers_Learnt_Condition()
{	
	if ( (Fingers_Learnt != LOG_SUCCESS) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Learnt_Info()
{
	AI_Output (other, self,"DIA_Fingers_Learnt_15_00"); //Parleresti bene di me con Diego?

	if ( Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK)+Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET)+Npc_GetTalentSkill(other, NPC_TALENT_SNEAK)	> 0)
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_01"); //Sì. Hai appreso delle nozioni che ti renderanno molto utile.
		AI_Output (self, other,"DIA_Fingers_Learnt_05_02"); //Abbiamo bisogno di ladri abili in questo campo. Avrai il mio voto.
		Fingers_Learnt = LOG_SUCCESS;
		
		B_GiveXP (XP_Fingerstrain);
		B_LogEntry( CH1_JoinOC,"Fingers è molto contento dei miei progressi.");
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_03"); //Dipende...
		AI_Output (self, other,"DIA_Fingers_Learnt_05_04"); //Se dimostrerai di aver appreso qualcosa come ladro, potresti esserci utile!
		AI_Output (other, self,"DIA_Fingers_Learnt_15_05"); //Come posso fare?
		AI_Output (self, other,"DIA_Fingers_Learnt_05_06"); //Impara un'abilità da ladro! Devi diventare più bravo nel muoverti furtivamente, borseggiare o forzare serrature. Allora avrai il mio voto.
		Fingers_Learnt = LOG_RUNNING;
		
		B_LogEntry( CH1_JoinOC,"Fingers parlerà in mio favore, quando avrò appreso un'abilità da ladro.");
	};
};




























