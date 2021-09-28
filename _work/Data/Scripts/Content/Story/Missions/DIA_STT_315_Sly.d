// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_315_Sly_Exit (C_INFO)
{
	npc			= STT_315_Sly;
	nr 			= 999;
	condition	= DIA_STT_315_Sly_Exit_Condition;
	information	= DIA_STT_315_Sly_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_315_Sly_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_315_Sly_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begrüssung 
// **************************************************

instance DIA_STT_315_Sly (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_Condition;
	information		= DIA_STT_315_Sly_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_STT_315_Sly_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_Info()
{
	AI_SetWalkmode	(self, NPC_WALK);
	AI_GotoNpc		(self, other);
	AI_Output		(self, other,"DIA_STT_315_Sly_10_01"); //Eres nuevo aquí, ¿verdad? Tu cara no me resulta conocida.
	AI_Output		(self, other,"DIA_STT_315_Sly_10_02"); //Me llamo Sly. Tengo una oferta de trabajo para un recién llegado..
};

// **************************************************
// 					Erste Begrüssung 
// **************************************************
	var int Sly_LostNek;
// **************************************************

INSTANCE DIA_STT_315_LostNek (C_INFO)
{
	npc				= STT_315_Sly;
	nr 				= 1;
	condition		= DIA_STT_315_LostNek_Condition;
	information		= DIA_STT_315_LostNek_Info;
	permanent		= 0;
	description		= "¿Tienes trabajo para mí? ¿En qué consiste?";
};

FUNC INT DIA_STT_315_LostNek_Condition()
{	
	return 1;		
};

func VOID DIA_STT_315_LostNek_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_15_00"); //¿Tienes un trabajo para mí? ¿Cuál?
	AI_Output (self, other,"DIA_STT_315_LostNek_10_01"); //¡Uno de nuestros guardias ha desaparecido! Se llama Nek. Es posible que se haya pasado al Campamento Nuevo.
	AI_Output (self, other,"DIA_STT_315_LostNek_10_02"); //Al ser nuevo aquí, andarás mucho por ahí. Así que mantén los ojos bien abiertos.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_03"); //Si le encuentras, hablaré en tu favor en el Campamento.
	};
	Info_ClearChoices	(DIA_STT_315_LostNek);
	Info_AddChoice		(DIA_STT_315_LostNek,"Veré si puedo encontrarlo.",DIA_STT_315_LostNek_DoIt);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_STT_315_LostNek,"¿De qué servirá que hables en mi favor?",DIA_STT_315_LostNek_Why);
	};
};

func void DIA_STT_315_LostNek_Why()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_Why_15_00"); //¿Para qué me servirá que hables en mi favor?
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_01"); //Si quieres unirte al Campamento, necesitas a gente que hable en tu favor.
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_02"); //Si Diego y yo hablamos en tu favor, eso te ayudaría mucho.
};

func void DIA_STT_315_LostNek_DoIt()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_00"); //Intentaré encontrarle.
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_01"); //Si ves a Fletcher, pregúntale por Nek. Él es quien ha pasado a encargarse del distrito tras la desaparición de Nek.
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_02"); //¿Dónde puedo encontrarle?
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_03"); //Su distrito es el de la arena.
	Sly_LostNek = LOG_RUNNING;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Sly, la Sombra, ha prometido hablan por mí ante Diego si encuentro a Nek. El guardia puede haberse unido al Campamento Nuevo. Debería preguntar por Nek a Fletcher, del distrito de la arena.");
	}
	else
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Sly, la Sombra, me ha pedido que encuentre al guardia desterrado Nek, que podría haberse unido al Campamento Nuevo. Debería preguntar por Nek a Fletcher, del distrito de la arena.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNek );
	AI_StopProcessInfos	(self);
};

// **************************************************
// 						SUCCESS
// **************************************************

INSTANCE DIA_STT_315_LostNekSuccess (C_INFO)
{
	npc				= STT_315_Sly;
	nr 				= 1;
	condition		= DIA_STT_315_LostNekSuccess_Condition;
	information		= DIA_STT_315_LostNekSuccess_Info;
	permanent		= 1;
	description		= "He encontrado a Nek.";
};

FUNC INT DIA_STT_315_LostNekSuccess_Condition()
{	
	if ( (Sly_LostNek == LOG_RUNNING) && (Npc_HasItems(other,Neks_Amulett) > 0) )
	{
		return 1;
	};
};

func VOID DIA_STT_315_LostNekSuccess_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_15_00"); //He encontrado a Nek.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_10_01"); //¡Espléndido! ¿Tienes alguna prueba de ello?
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"No, me temo que no.",DIA_STT_315_LostNekSuccess_NoProof);
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"He encontrado este amuleto que llevaba encima. Aquí tienes.",DIA_STT_315_LostNekSuccess_Proof);
};

func void DIA_STT_315_LostNekSuccess_Proof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //Llevaba encima un amuleto; aquí lo tienes.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //La verdad es que lo importante era el amuleto. Eres un tipo listo.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //Puede que hayas pensado en quedarte con el amuleto, pero has tomado la decisión correcta.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& hero.guild == GIL_NONE
	{
		AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //Si Diego me pregunta por ti, votaré en tu favor.
	};
	Sly_LostNek = LOG_SUCCESS;
	
	B_GiveInvItems (other, self, Neks_Amulett, 1);
	
	Log_SetTopicStatus		(CH1_LostNek, LOG_SUCCESS);
	B_LogEntry				(CH1_LostNek,"Le he dado a Sly el amuleto de Nek. Mi honradez le ha asombrado.");
	
	B_GiveXP (XP_Slysearchfornek);		
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC, LOG_RUNNING);
		B_LogEntry			(CH1_JoinOC,"Le he dado a Sly el amuleto de Nek. Irá a ver a Diego y hablará en mi favor.");
	}
	else
	{	
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus  (CH1_JoinOC, LOG_FAILED);
		B_LogEntry			(CH1_JoinOC,"Le he dado a Sly el amuleto de Nek. Tampoco es que vaya a servirme de nada: de todas formas, ya nunca me dejarán unirme el Campamento Viejo.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};


func void DIA_STT_315_LostNekSuccess_NoProof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //No, me temo que no.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //¿Oh? No me estarás ocultando algo, ¿verdad? Nek llevaba encima un amuleto.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //No me gusta que la gente me oculte cosas que me pertenecen. ¡Si encuentras el amuleto, tráemelo!
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //Pensaré en ti cuando tenga el amuleto en la mano.
	
	B_LogEntry( CH1_LostNek,"Sly quiere tener el amuleto de Nek.");
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************

instance DIA_STT_315_Sly_AfterSuccess (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_AfterSuccess_Condition;
	information		= DIA_STT_315_Sly_AfterSuccess_Info;
	permanent		= 1;
	description		= "¿Qué tal?";
	
};

FUNC int DIA_STT_315_Sly_AfterSuccess_Condition()
{
	if ( (Kapitel == 1) && (Sly_LostNek == LOG_SUCCESS) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_AfterSuccess_Info()
{
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_00"); //¿Cómo va todo?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //¡Muy bien! ¡Conmigo ya no necesitarás seguir preocupándote por Diego!
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //Favor por favor, ¿eh?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //Así es.
};


	
	
	




		
		
