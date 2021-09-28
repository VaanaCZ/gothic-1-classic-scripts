// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Whistler_Exit (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 999;
	condition	= DIA_Whistler_Exit_Condition;
	information	= DIA_Whistler_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Whistler_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Whistler_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Ich bin neu hier 
// **************************************************

INSTANCE DIA_Whistler_IAmNew (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_IAmNew_Condition;
	information	= DIA_Whistler_IAmNew_Info;
	permanent	= 0;
	description = "¡Hola! ¡Soy nuevo aquí!";
};                       

FUNC INT DIA_Whistler_IAmNew_Condition()
{	
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Whistler_IAmNew_Info()
{
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_00"); //¡Hola! ¡Soy nuevo aquí!
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_01"); //¿Qué quieres de mí?
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_02"); //Quiero ser uno de vosotros; quiero unirme al Campamento.
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_03"); //Buscas que alguien te respalde, ¿eh?
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_04"); //Si quieres que le hable a Diego de ti, tienes que hacerme un favor.
};

// **************************************************
// 					 Welcher Gefallen
// **************************************************
	var int Whistler_BuyMySword;
	var int Whistler_BuyMySword_Day;
// **************************************************

INSTANCE DIA_Whistler_Favour (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_Favour_Condition;
	information	= DIA_Whistler_Favour_Info;
	permanent	= 0;
	description = "¿Qué clase de favor quieres?";
};                       

FUNC INT DIA_Whistler_Favour_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Whistler_IAmNew))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Favour_Info()
{
	AI_Output (other,self,"DIA_Whistler_Favour_15_00"); //¿Qué clase de favor?
	AI_Output (self,other,"DIA_Whistler_Favour_11_01"); //Quiero una de las armas de Fisk. Es uno de los comerciantes que hay en el mercado.
	AI_Output (self,other,"DIA_Whistler_Favour_11_02"); //A mí no quiere vendérmela. Es una espada ancha ornamentada.
	AI_Output (self,other,"DIA_Whistler_Favour_11_03"); //Te daré 100 pepitas para que me consigas el arma. Pero no le digas que es para mí.

	Info_ClearChoices(DIA_Whistler_Favour);
	Info_AddChoice	 (DIA_Whistler_Favour,"Vale, dame 100 pepitas de mineral. Conseguiré eso.",DIA_Whistler_Favour_Ok);
	Info_AddChoice	 (DIA_Whistler_Favour,"¿No has pensado que puedo huir con el mineral...?",DIA_Whistler_Favour_OreAway);
	Info_AddChoice	 (DIA_Whistler_Favour,"¿Por qué no quiere venderte el arma?",DIA_Whistler_Favour_WhyNotSell);
};

func void DIA_Whistler_Favour_Ok()
{
	AI_Output (other,self,"DIA_Whistler_Favour_Ok_15_00"); //De acuerdo, dame las 100 pepitas de mineral. Voy a por ella.
	AI_Output (self,other,"DIA_Whistler_Favour_Ok_11_01"); //Aquí tienes. ¡Vuelve a verme en cuanto la tengas!
	
	Whistler_BuyMySword = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry (CH1_JoinOC,"Whistler me ayudará si voy a ver a Fisk en el mercado y le compro una espada. Me ha dado 100 pepitas.");
	
	var C_NPC fisk; fisk = Hlp_GetNpc(Stt_311_Fisk);
	
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, hero, itminugget, 100);
	
	Whistler_BuyMySword_Day = Wld_GetDay();
	
	Info_ClearChoices(DIA_Whistler_Favour);
};

func void DIA_Whistler_Favour_OreAway()
{
	AI_Output (other,self,"DIA_Whistler_Favour_OreAway_15_00"); //¿No has pensado que podría fugarme con el mineral...?
	AI_Output (self,other,"DIA_Whistler_Favour_OreAway_11_01"); //¡No olvides que la colonia es pequeña! ¡Si te escapas con mi mineral, te encontraré!
};

func void DIA_Whistler_Favour_WhyNotSell()
{
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //¿Por qué no quiere venderte el arma?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //Tuvimos una pequeña discusión.
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //¿Y?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //¡Y eso es todo lo que necesitas saber!
};

// **************************************************
// 					 RUNNING 110
// **************************************************

INSTANCE DIA_Whistler_Running110 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 4;
	condition	= DIA_Whistler_Running110_Condition;
	information	= DIA_Whistler_Running110_Info;
	permanent	= 0;
	description = "Fisk ahora quiere 110 pepitas de mineral por su espada.";
};                       

FUNC INT DIA_Whistler_Running110_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Fisk_SCknows110 == TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Running110_Info()
{
	AI_Output (other,self,"DIA_Whistler_Running110_15_00"); //Ahora Fisk quiere 110 pepitas por su espada.
	AI_Output (self,other,"DIA_Whistler_Running110_11_01"); //Y ahora quieres que yo te dé las 10 que faltan.
	AI_Output (other,self,"DIA_Whistler_Running110_15_02"); //Creí que deseabas esa espada.
	AI_Output (self,other,"DIA_Whistler_Running110_11_03"); //Aquí las tienes; ¡ahora, date prisa!
	CreateInvItems  (self,itminugget,10);
	B_GiveInvItems  (self, hero, itminugget, 10);
};	

// **************************************************
// 				RUNNING - PayBack
// **************************************************

INSTANCE DIA_Whistler_RunningPayBack (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 5;
	condition	= DIA_Whistler_RunningPayBack_Condition;
	information	= DIA_Whistler_RunningPayBack_Info;
	permanent	= 1;
	description = "No puedo conseguir la espada. Te devuelvo tus 100 pepitas.";
};                       

FUNC INT DIA_Whistler_RunningPayBack_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_RunningPayBack_Info()
{
	AI_Output (other,self,"DIA_Whistler_RunningPayBack_15_00"); //No he podido conseguirte la espada; aquí te devuelvo tus 100 pepitas.
	
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_01"); //¡Idiota! ¡Aquí no necesitamos idiotas como tú! ¡Piérdete!
		B_GiveInvItems (hero, self, itminugget, 100);
		Whistler_BuyMySword = LOG_OBSOLETE;
		
		B_LogEntry (CH1_JoinOC,"La he pifiado; Whistler jamás conseguirá su espada.");
		
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_02"); //Pero no veo mis 100 pepitas; ¡será mejor que las consigas cuanto antes o tendrás problemas!
		AI_StopProcessInfos(self);
	};
};	




// **************************************************
// 					 Too late
// **************************************************

INSTANCE DIA_Whistler_MySword_TooLate (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_MySword_TooLate_Condition;
	information	= DIA_Whistler_MySword_TooLate_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Whistler_MySword_TooLate_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_TooLate_Info()
{
	AI_Output (self,other,"DIA_Whistler_MySword_TooLate_11_00"); //¡Aquí estás! Conque querías escaparte con mi mineral, ¿eh? ¡Ven aquí, jovencito!
	
	Whistler_BuyMySword = LOG_FAILED;
	
	B_LogEntry (CH1_JoinOC,"La he pifiado. Whistler está hasta la narices de mí.");
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude (self, ATT_ANGRY);
	Npc_SetTarget (self,other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

// **************************************************
// 					Success
// **************************************************

INSTANCE DIA_Whistler_MySword_Success (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_MySword_Success_Condition;
	information	= DIA_Whistler_MySword_Success_Info;
	permanent	= 1;
	description = "Tengo tu espada...";
};                       

FUNC INT DIA_Whistler_MySword_Success_Condition()
{
	if ( 	(Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day>(Wld_GetDay()-2)) 
		&&	(Npc_HasItems (other,Whistlers_Schwert)>=1) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_Success_Info()
{
	AI_Output (other,self,"DIA_Whistler_MySword_Success_15_00"); //Tengo tu espada.

    B_GiveInvItems (other, self, Whistlers_Schwert, 1);
	
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_01"); //No ha sido muy complicado, ¿verdad?  No importa; tú me has hecho un favor y yo te haré otro a cambio.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_02"); //Si Diego me pregunta, le hablaré favorablemente de ti. Hasta entonces, ¡que lo pases bien!
	
	B_LogEntry (CH1_JoinOC,"Whistler se ha alegrado cuando le he entregado la espada que quería. Va a recomendarme a Diego.");
	}
	else
	{
	B_LogEntry (CH1_JoinOC,"Whistler se ha alegrado cuando le he entregado la espada que quería. Por desgracia, no me va nada en ello, pues ya no puedo convertirme en una Sombra.");
	};
	Whistler_BuyMySword = LOG_SUCCESS;
	B_GiveXP (XP_Whistlerssword);
    
	AI_StopProcessInfos	( self );
};

// **************************************************
// 			STANDARD - Kap 1 nach SUCCESS
// **************************************************

INSTANCE DIA_Whistler_StandardKap1 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_StandardKap1_Condition;
	information	= DIA_Whistler_StandardKap1_Info;
	permanent	= 1;
	description = "¿Qué tal?";
};                       

FUNC INT DIA_Whistler_StandardKap1_Condition()
{
	if ( Whistler_BuyMySword == LOG_SUCCESS )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_StandardKap1_Info()
{
	AI_Output (other,self,"DIA_Whistler_StandardKap1_15_00"); //¿Cómo va todo...?
	AI_Output (self,other,"DIA_Whistler_StandardKap1_11_01"); //¡Muy bien! Me has hecho un favor, así que yo te haré uno a ti. Le diré a Diego que eres un hombre de fiar.
};





	
	





















