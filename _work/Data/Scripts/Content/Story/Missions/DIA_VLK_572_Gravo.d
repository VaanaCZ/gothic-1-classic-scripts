// **************************************************
//						 EXIT 
// **************************************************

instance DIA_Gravo_Exit (C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 999;
	condition		= DIA_Gravo_Exit_Condition;
	information		= DIA_Gravo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT DIA_Gravo_Exit_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hallo
// **************************************************

instance DIA_Gravo_Hallo(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_Hallo_Condition;
	information		= DIA_Gravo_Hallo_Info;
	permanent		= 0;
	description 	= "�Qu� tal te va?";
};                       

FUNC INT DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gravo_Hallo_15_00"); //�C�mo te va?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_01"); //Dado que he dejado de trabajar en la mina, no puedo quejarme.
	AI_Output (other, self,"DIA_Gravo_Hallo_15_02"); //�Y de d�nde sacas tu mineral?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_03"); //Ayudo a los que tienen problemas.
	AI_Output (self, other,"DIA_Gravo_Hallo_04_04"); //Si te metes en l�os con la gente influyente de por aqu�, puedo ayudarte a solucionar el asunto.
};

// **************************************************
//						HelpHow
// **************************************************

instance DIA_Gravo_HelpHow(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_HelpHow_Condition;
	information		= DIA_Gravo_HelpHow_Info;
	permanent		= 0;
	description 	= "�Que me ayudar�as si me metiese en un l�o? �C�mo?";
};                       

FUNC INT DIA_Gravo_HelpHow_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_HelpHow_Info()
{
	AI_Output (other, self,"DIA_Gravo_HelpHow_15_00"); //Si yo estuviera en problemas, �t� me ayudar�as? �C�mo?
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_01"); //Bueno, supongamos que t� tienes problemas con Thorus. Ser� mejor que no te metas nunca en problemas con �l, pero nunca se sabe.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_02"); //Thorus puede ser muy terco; una vez se cabrea con alguien, no vuelve a hablar con �l. Y eso es malo.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_03"); //Al ser un novato, dependes de �l. As� que vienes a verme. Conozco a mucha gente a la que Thorus hace caso.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_04"); //Entonces yo intercedo por ti y Thorus vuelve a ser tu amigo. Claro est� que los muchachos quieren algo de mineral a cambio de este tipo de favores. Tu mineral.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_05"); //Y yo me encargo de que el mineral llegue hasta la gente apropiada.

	B_LogEntry(GE_TraderOC,"El cavador Gravo vende un tipo especial de servicio. Si me meto en l�os con gente importante del Campamento, puedo pagarle para que lo arregle.");
};

// **************************************************
//						HelpAngryNow
// **************************************************

//---------------------------------------------------
func void B_Gravo_HelpAttitude(var C_NPC prob)
{
	if (Npc_GetPermAttitude(prob, other)==ATT_ANGRY)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //Exacto, est�s en su lista negra.
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //Har� que alguien hable con �l. Dame 100 pepitas y me hago cargo del problema.
		if (Npc_HasItems(other,itminugget)>=100)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Veamos cuanto tienes... �Ah! Con esto deber�a bastar. Puedes dar por resuelto el asunto.
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //Y no le hables a nadie acerca de ello. Comp�rtate como si no hubiera pasado nada.
			B_GiveInvItems (hero, self, itminugget, 100);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //I don't have that much.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Then I can't do anything for you - I'm sorry, boy.
		};
		
	}
	else if (Npc_GetPermAttitude(prob, other)==ATT_HOSTILE)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //�Y a eso le llamas un problema? Te quedas muy muy corto. Me parece que le gustar�a cortarte en pedacitos, muchacho.
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //No saldr� barato convencer a algunas personas para que lo tranquilicen. Te costar� por lo menos 500 pepitas.
		if (Npc_HasItems(other,itminugget)>=500)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Veamos lo que tienes aqu�... Parece que eres un ricach�n. Me llevar� 500 pepitas y solucionar� el problema.
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //Y recuerda que nunca ha de saberse que yo me ocup� del problema, as� que no le hables de ello a nadie. �Entendido?
			B_GiveInvItems (hero, self, itminugget, 500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //No tengo tanto.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Entonces no puedo solucionar tu problema, joven.
		};
	}
	else
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_NoProb_04_00"); //Por lo que yo s�, no tiene ning�n problema contigo, as� que tranquilo.
	};
};

//---------------------------------------------------

instance DIA_Gravo_HelpAngryNow(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_HelpAngryNow_Condition;
	information		= DIA_Gravo_HelpAngryNow_Info;
	permanent		= 1;
	description 	= "Puedes ayudarme. Creo que estoy metido en un l�o.";
};                       

FUNC INT DIA_Gravo_HelpAngryNow_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_HelpHow))
	{
		return 1;
	};
};

func VOID DIA_Gravo_HelpAngryNow_Info()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_15_00"); //�Podr�as ayudarme? Creo que tengo un problema.
	AI_Output (self, other,"DIA_Gravo_HelpAngryNow_04_01"); //Creo que s�, pero mi ayuda podr�a costarte entre 100 y 500 pepitas.
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, DIALOG_BACK			,DIA_Gravo_HelpAngryNow_BACK);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Ay�dame con Diego.",DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Ay�dame con Thorus.",DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Ay�dame con G�mez.",DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Diego_15_00"); //Ay�dame con Diego.
	var C_NPC diego; diego = Hlp_GetNpc (PC_Thief);
	B_Gravo_HelpAttitude(diego);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Thorus_15_00"); //Ay�dame con Thorus.
	var C_NPC thorus; thorus = Hlp_GetNpc (Grd_200_Thorus);
	B_Gravo_HelpAttitude(thorus);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Gomez_15_00"); //Ay�dame con G�mez.
	var C_NPC gomez; gomez = Hlp_GetNpc (Ebr_100_Gomez);
	B_Gravo_HelpAttitude(gomez);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

// **************************************************
//						Influence
// **************************************************

instance DIA_Gravo_Influence(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 2;
	condition		= DIA_Gravo_Influence_Condition;
	information		= DIA_Gravo_Influence_Info;
	permanent		= 1;
	description 	= "�Podr�as decirme qui�nes son las personas influyentes por aqu�?";
};                       

FUNC INT DIA_Gravo_Influence_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_Influence_Info()
{
	AI_Output (other, self,"DIA_Gravo_Influence_15_00"); //�Puedes decirme qu� miembros de las Sombras son gente influyente por aqu�?
	AI_Output (self, other,"DIA_Gravo_Influence_04_01"); //Quieres impresionar a la gente apropiada, �verdad?
	AI_Output (self, other,"DIA_Gravo_Influence_04_02"); //Diego es el m�s poderoso entre las Sombras y conf�a en Fingers, Whistler y Sly.
	AI_Output (self, other,"DIA_Gravo_Influence_04_03"); //Dexter y Fisk venden sus mercanc�as en el mercado. Tienen muchos clientes, incluso entre los guardias, y eso les hace ser muy influyentes.
	AI_Output (self, other,"DIA_Gravo_Influence_04_04"); //Y luego est� Scatty. Est� al mando de la arena y decide qui�n combate y todo eso. Mucha gente le debe mineral; �l tambi�n es importante.
	
	Log_CreateTopic (GE_TraderOC, LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Dexter y Fisk comercian con varios art�culos en la plaza del mercado.");

	
};











