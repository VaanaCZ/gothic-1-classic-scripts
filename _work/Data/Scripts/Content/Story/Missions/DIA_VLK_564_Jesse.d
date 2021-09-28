// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Jesse_Exit (C_INFO)
{
	npc			= Vlk_564_Jesse;
	nr			= 999;
	condition	= DIA_Jesse_Exit_Condition;
	information	= DIA_Jesse_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jesse_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Jesse_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Hi
// **************************************************

INSTANCE DIA_Jesse_Hallo (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Hallo_Condition;
	information		= DIA_Jesse_Hallo_Info;
	permanent		= 0;
	description		= "Come va?";
};

FUNC INT DIA_Jesse_Hallo_Condition()
{	
	if (!Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jesse_Hallo_15_00"); //Come va?
	AI_Output (self, other,"DIA_Jesse_Hallo_03_01"); //Sei nuovo, vero? Farai meglio a non metterti nei guai con le guardie.
	AI_Output (self, other,"DIA_Jesse_Hallo_03_02"); //Se ti chiedono la tassa di protezione... paga! Altrimenti metà campo ti si rivolterà contro.
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

INSTANCE DIA_Jesse_Warn (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Warn_Condition;
	information		= DIA_Jesse_Warn_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Jesse_Warn_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Herek_Bully)) && (Herek_ProtectionBully==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Warn_Info()
{
	AI_Output (self, other,"DIA_Jesse_Warn_03_00"); //Ehi, tu! È vero che non hai pagato la tassa di protezione a Bloodwyn?
	AI_Output (other, self,"DIA_Jesse_Warn_15_01"); //Che vuoi?
	AI_Output (self, other,"DIA_Jesse_Warn_03_02"); //Avvisarti! Bloodwyn ha pagato delle persone per farti fuori.
	AI_Output (self, other,"DIA_Jesse_Warn_03_03"); //L'ho visto parlare con Herek, laggiù, e Dio solo sa chi altri abbia assoldato.
	AI_Output (other, self,"DIA_Jesse_Warn_15_04"); //Il tuo avvertimento riguardo Herek arriva un po' tardi.
	AI_Output (self, other,"DIA_Jesse_Warn_03_05"); //Deve aver parlato anche con qualcun altro, comunque. Stai in guardia!
};

// **************************************************
// 				MISSION Pay 4 Me
// **************************************************
	
// ************************************************************

INSTANCE DIA_Jesse_Mission (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Mission_Condition;
	information		= DIA_Jesse_Mission_Info;
	permanent		= 0;
	description		= "Perché mi hai raccontato questa storia?";
};

FUNC INT DIA_Jesse_Mission_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Jesse_Mission))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Mission_Info()
{
	AI_Output (other, self,"DIA_Jesse_Mission_15_00"); //Perché mi hai raccontato questa storia?
	AI_Output (self, other,"DIA_Jesse_Mission_03_01"); //Così mi devi un favore. Mi sembri un tipo sveglio, quindi hai capito sicuramente.
	AI_Output (self, other,"DIA_Jesse_Mission_03_02"); //Io ho fatto un favore a TE, quindi ti darò la possibilità di restituirmelo.
	
	Info_ClearChoices	(DIA_Jesse_Mission );
	Info_AddChoice		(DIA_Jesse_Mission,"Scordatelo! Non ti devo nulla!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice		(DIA_Jesse_Mission,"Cosa hai in mente?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output (other, self,"DIA_Jesse_Mission_ForgetIt_15_00"); //Non ti devo nulla!
	AI_Output (self, other,"DIA_Jesse_Mission_ForgetIt_03_01"); //Oh! Allora crepa!
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
	AI_StopProcessInfos	(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output (other, self,"DIA_Jesse_Mission_What_15_00"); //Cosa hai in mente?
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_01"); //Non ho più metallo e Bloodwyn mi sta alle calcagna.
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_02"); //Ora che ti ho aiutato, potresti dargli i 10 pezzi di metallo che gli devo? Digli che sono da parte mia.
	Npc_SetTrueGuild(self,GIL_NONE); //KEIN Schutzgeld
	
	Info_AddChoice		(DIA_Jesse_Mission,"Io, pagare per te? Scordatelo!",DIA_Jesse_Mission_NO);
	Info_AddChoice		(DIA_Jesse_Mission,"Vedrò cosa posso fare.",DIA_Jesse_Mission_YES);
};
//-------------------------------
func void DIA_Jesse_Mission_YES()
{
	AI_Output (other, self,"DIA_Jesse_Mission_YES_15_00"); //Vedrò cosa posso fare.
	AI_Output (self, other,"DIA_Jesse_Mission_YES_03_01"); //Grazie, amico! Mi hai salvato, per oggi! Fammi sapere quando le cose si saranno sistemate, d'accordo?
	Jesse_PayForMe = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Jesse_Mission );
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output (other, self,"DIA_Jesse_Mission_NO_15_00"); //Io, pagare per te? Scordatelo!
	AI_Output (self, other,"DIA_Jesse_Mission_NO_03_01"); //Sembra che mi sia sbagliato. In futuro, non contare su di me.
	//MUSS SO - Mike
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
};


// **************************************************
// 					RUNNING / SUCCESS
// **************************************************

INSTANCE DIA_Jesse_MisSuccess (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_MisSuccess_Condition;
	information		= DIA_Jesse_MisSuccess_Info;
	permanent		= 0;
	description		= "Ho pagato Bloodwyn!";
};

FUNC INT DIA_Jesse_MisSuccess_Condition()
{	
	if (Jesse_PayForMe == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_MisSuccess_Info()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_15_00"); //Ho pagato Bloodwyn!
	AI_Output (self, other,"DIA_Jesse_MisSuccess_03_01"); //Davvero? Ottimo! Ora siamo pari.
	Npc_SetTrueGuild(self,GIL_VLK); //Schutzgeld GEZAHLT
	
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
	Info_AddChoice		(DIA_Jesse_MisSuccess,"COSAAAA??? Ho pagato 10 pezzi di metallo per una notizia che sapevo già?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice		(DIA_Jesse_MisSuccess,"Va bene: tu hai fatto un favore a me, io ne farò uno a te.",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //COSAAAA??? Ho pagato 10 pezzi di metallo per una notizia che sapevo già?
	AI_Output (self, other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Così sembra.
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Ok_15_00"); //Va bene: tu hai fatto un favore a me, io ne farò uno a te.
};

//a) <Herek tot>
//b) Herek wird versuchen, 


/* */
