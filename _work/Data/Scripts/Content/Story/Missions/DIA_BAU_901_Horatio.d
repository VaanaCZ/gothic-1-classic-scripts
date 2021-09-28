// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Horatio_EXIT (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 999;
	condition	= DIA_Horatio_EXIT_Condition;
	information	= DIA_Horatio_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Horatio_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Horatio_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Wasser
// ************************************************************

INSTANCE Info_Horatio_Wasser(C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 800;
	condition	= Info_Horatio_Wasser_Condition;
	information	= Info_Horatio_Wasser_Info;
	permanent	= 1;
	description = "Me manda Lefty. Os he traído un poco de agua.";
};                       

FUNC INT Info_Horatio_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Horatio_Wasser_Info()
{
	AI_Output(other,self,"Info_Horatio_Wasser_15_00"); //Me manda Lefty. Os he traído un poco de agua.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Horatio_Wasser_09_01"); //¡Gracias, tío! Estaba a punto de empezar a beber barro.
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Horatio_Wasser_NOWATER_09_00"); //Se te ha acabado. Pediré un poco a los demás.
	};
};

// ************************************************************
// 						Hallo
// ************************************************************
	var int horatio_trouble;
// ************************************************************

INSTANCE DIA_Horatio_Hello (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_Hello_Condition;
	information	= DIA_Horatio_Hello_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Horatio_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Horatio_Hello_Info()
{	
	AI_GotoNpc	(self, hero);

	AI_Output (self, other,"DIA_Horatio_Hello_09_00"); //¿Qué haces aquí? ¿Buscas problemas?
	
	Info_ClearChoices(DIA_Horatio_Hello );
	Info_AddChoice	 (DIA_Horatio_Hello,"¿Problemas? ¿Con quién? ¿Con un campesino?",DIA_Horatio_Hello_PissOff);
	Info_AddChoice	 (DIA_Horatio_Hello,"¡Eh, tranquilo! Soy nuevo.",DIA_Horatio_Hello_BeCool);
};

func void DIA_Horatio_Hello_BeCool()
{
	AI_Output (other, self,"DIA_Horatio_Hello_BeCool_15_00"); //¡Eh, tranquilo! Soy nuevo.
	AI_Output (self, other,"DIA_Horatio_Hello_BeCool_09_01"); //Uh... Pareces buena gente. Nunca se sabe. Todos los días llegan nuevos pensando que son la monda.
	Info_ClearChoices(DIA_Horatio_Hello );
};

func void DIA_Horatio_Hello_PissOff()
{
	AI_Output (other, self,"DIA_Horatio_Hello_PissOff_15_00"); //¿Problemas? ¿Con quién? ¿Con un campesino?
	AI_Output (self, other,"DIA_Horatio_Hello_PissOff_09_01"); //Sólo porque trabajo en los arrozales no quiere decir que no pueda defenderme de tipos como tú.
	AI_Output (self, other,"DIA_Horatio_Hello_PissOff_09_02"); //¡Ven aquí si quieres problemas!
	horatio_trouble = TRUE;
	
	Info_ClearChoices(DIA_Horatio_Hello);
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						SORRY (PERM)
// ************************************************************

INSTANCE DIA_Horatio_SORRY (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_SORRY_Condition;
	information	= DIA_Horatio_SORRY_Info;
	permanent	= 1;
	description = "Siento lo que dije acerca de los campesinos.";
};                       

FUNC INT DIA_Horatio_SORRY_Condition()
{
	if (horatio_trouble == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_SORRY_Info()
{	
	AI_Output (other, self,"DIA_Horatio_SORRY_15_00"); //Siento lo que dije acerca de los campesinos.
	AI_Output (self, other,"DIA_Horatio_SORRY_09_01"); //¡Deberías haberlo pensado antes, muchacho!
};

// ************************************************************
// 					Horatios Story
// ************************************************************

INSTANCE DIA_Horatio_Story (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_Story_Condition;
	information	= DIA_Horatio_Story_Info;
	permanent	= 0;
	description = "¿Qué hace un hombre como tú con los campesinos?";
};                       

FUNC INT DIA_Horatio_Story_Condition()
{
	if ( (horatio_trouble==FALSE) && (Npc_KnowsInfo(hero,DIA_Horatio_Hello)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_Story_Info()
{	
	AI_Output (other, self,"DIA_Horatio_Story_15_00"); //¿Qué hace con los campesinos un hombre como tú?
	AI_Output (self, other,"DIA_Horatio_Story_09_01"); //Me lo pidió Lee. Ya no lucho, salvo en defensa propia.
	AI_Output (self, other,"DIA_Horatio_Story_09_02"); //Una vez maté a un tipo, y estaba borracho. Por eso me arrojaron a esta maldita colonia. Por justicia.
	AI_Output (other, self,"DIA_Horatio_Story_15_03"); //¿Cómo sucedió?
	AI_Output (self, other,"DIA_Horatio_Story_09_04"); //Fue una pelea de taberna corriente. No pretendía matar al tipo, sólo que le debí golpear demasiado fuerte.
	AI_Output (self, other,"DIA_Horatio_Story_09_05"); //En aquel entonces era herrero. No era consciente de mis propias fuerzas.
};

// ************************************************************
// 						Warum hier?
// ************************************************************

INSTANCE DIA_Horatio_WhyHere (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_WhyHere_Condition;
	information	= DIA_Horatio_WhyHere_Info;
	permanent	= 0;
	description = "¿Por qué te incorporaste a ESTE campamento?";
};                       

FUNC INT DIA_Horatio_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_WhyHere_Info()
{	
	AI_Output (other, self,"DIA_Horatio_WhyHere_15_00"); //¿Por qué te incorporaste a ESTE campamento?
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_01"); //Te lo diré: La otra opción era unirme a esos zumbados de la secta, y no quería que sus gurús hurgarán en mi cerebro.
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_02"); //En el Campamento Viejo habría tenido bastantes problemas con los guardias, pero los mercenarios y los bandidos muestran algo de respeto.
	AI_Output (other, self,"DIA_Horatio_WhyHere_15_03"); //Te tienen miedo...
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_04"); //Tal vez. En cualquier caso, aquí he encontrado la paz, y tú deberías intentar hacer lo mismo.
};

// ************************************************************
// 						Bitte STR
// ************************************************************
	var int horatio_StrFree;
// ************************************************************

INSTANCE DIA_Horatio_PleaseTeachSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_PleaseTeachSTR_Condition;
	information	= DIA_Horatio_PleaseTeachSTR_Info;
	permanent	= 0;
	description = "¿Puedes hacer que sea tan fuerte como tú?";
};                       

FUNC INT DIA_Horatio_PleaseTeachSTR_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_PleaseTeachSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_15_00"); //¿Puedes hacer que sea tan fuerte como tú?
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_09_01"); //Aunque pudiera, ¿para QUÉ utilizarías tu fuerza?
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
	var C_NPC ricelord; ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if	Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio)
	{
		Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"¡Para poder acabar con el Señor del Arroz y sus esbirros!",DIA_Horatio_PleaseTeachSTR_Ricelord);
	}
	else
	{
		Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"Buena pregunta. Pensaré en ello...",DIA_Horatio_PleaseTeachSTR_BACK);
	};
	Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"¡Para defenderme!",DIA_Horatio_PleaseTeachSTR_Defend);
	Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"¡Para enseñar a estos bastardos a dirigirse a mí como es debido!",DIA_Horatio_PleaseTeachSTR_Attack);

	Log_CreateTopic		(CH1_HoratiosTeachings,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_HoratiosTeachings, LOG_RUNNING);
	B_LogEntry			(CH1_HoratiosTeachings,"Horatio, un granjero de los campos de arroz del Campamento Nuevo, puede enseñarme a golpear más fuerte. Pero, de algún modo, aún no he hallado la respuesta adecuada a su pregunta de por qué quiero eso.");
};

func void DIA_Horatio_PleaseTeachSTR_Attack()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Attack_15_00"); //¡Para enseñar a estos bastardos a dirigirse a mí como es debido!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Attack_09_01"); //Y antes de que te dieras cuenta, te habrías convertido en uno de esos bastardos... No, no voy a adiestrarte para eso.
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

func void DIA_Horatio_PleaseTeachSTR_Defend()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Defend_15_00"); //¡Para defenderme!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Defend_09_01"); //Para eso hace falta velocidad, no fuerza. ¿Crees que hendir cráneos es mejor que encontrar la paz?
};

func void DIA_Horatio_PleaseTeachSTR_BACK()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_BACK_15_00"); //Buena pregunta. Pensaré en ello...
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

func void DIA_Horatio_PleaseTeachSTR_Ricelord()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Ricelord_15_00"); //¡Para poder acabar con el Señor del Arroz y sus esbirros!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Ricelord_09_01"); //Hmm... No serías el primero que lo intenta.
	horatio_StrFree = TRUE;
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

// ************************************************************
// 						Nachgedacht (STR)
// ************************************************************

INSTANCE DIA_Horatio_ThoughtSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_ThoughtSTR_Condition;
	information	= DIA_Horatio_ThoughtSTR_Info;
	permanent	= 1;
	description = "He estado pensándomelo...";
};                       

FUNC INT DIA_Horatio_ThoughtSTR_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Horatio_PleaseTeachSTR) && (horatio_StrFree == FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_ThoughtSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_15_00"); //He estado pensándomelo...
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_09_01"); //¿Y? ¿Se te ocurre algo mejor?
	
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
	Info_AddChoice	 (DIA_Horatio_ThoughtSTR,"No.",DIA_Horatio_ThoughtSTR_NoIdea);
	
	var C_NPC ricelord; ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if	Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio)
	{
		Info_AddChoice	 (DIA_Horatio_ThoughtSTR,"SÍ. ¡Quiero ser capaz de enfrentarme al Señor del Arroz y sus esbirros!",DIA_Horatio_ThoughtSTR_Ricelord);
	};
};

func void DIA_Horatio_ThoughtSTR_NoIdea()
{
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_NoIdea_15_00"); //No.
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_NoIdea_09_01"); //Eso pensaba.
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
};

func void DIA_Horatio_ThoughtSTR_Ricelord()
{
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_Ricelord_15_00"); //SÍ. ¡Quiero ser capaz de enfrentarme al Señor del Arroz y sus esbirros!
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_Ricelord_09_01"); //Hmm... No serías el primero que lo intenta.
	horatio_StrFree = TRUE;
	
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
};

// ************************************************************
//					Will Ricelord köpfen
// ************************************************************

func void DIA_Horatio_HelpSTR_LEARN_NOW()
{
	if (other.attribute[ATR_STRENGTH]<=(100-5))
	{
		other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 5;
		PrintScreen	("Fuerza +5", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		other.attribute[ATR_STRENGTH] = 100; 
		PrintScreen	("Fuerza: 100", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
				
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_00"); //Si quieres golpear con fuerza tienes que conocer la estrategia adecuada. Eso es lo primero que aprendes como herrero.
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_01"); //Aprende a lanzar todo tu brazo, desde el hombro hasta la muñeca.
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_02"); //Cuanto mejor seas, más potente será el golpe. Cogerás el tranquillo rápidamente.
};

//--------------------------------------------------------------

INSTANCE DIA_Horatio_HelpSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_HelpSTR_Condition;
	information	= DIA_Horatio_HelpSTR_Info;
	permanent	= 0;
	description = "¡Si me ayudas, VENCERÉ al Señor del Arroz y sus secuaces!";
};                       

FUNC INT DIA_Horatio_HelpSTR_Condition()
{
	if (horatio_StrFree == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_HelpSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_HelpSTR_15_00"); //¡Si me ayudas, VENCERÉ al Señor del Arroz y sus secuaces!
	AI_Output (self, other,"DIA_Horatio_HelpSTR_09_01"); //¡Bien! He jurado que nunca volveré a atacar a nadie, pero jamás dije que no enseñaría a nadie a hacerlo.
	AI_Output (other, self,"DIA_Horatio_HelpSTR_15_02"); //¡Soy todo oídos!
	DIA_Horatio_HelpSTR_LEARN_NOW();

	Log_SetTopicStatus	(CH1_HoratiosTeachings, LOG_SUCCESS);
	B_LogEntry			(CH1_HoratiosTeachings,"Horatio me ha enseñado cómo usar mi fuerza en la batalla y golpear más fuerte. Ése sí que tiene buen corazón.");
};

// ************************************************************
// 							Thanks (PERM)
// ************************************************************

INSTANCE DIA_Horatio_Thanks (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_Thanks_Condition;
	information	= DIA_Horatio_Thanks_Info;
	permanent	= 1;
	description = "¡Gracias por tu ayuda!";
};                       

FUNC INT DIA_Horatio_Thanks_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_HelpSTR))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_Thanks_Info()
{	
	AI_Output (other, self,"DIA_Horatio_Thanks_15_00"); //¡Gracias por tu ayuda!
	AI_Output (self, other,"DIA_Horatio_Thanks_09_01"); //Usa tu conocimiento para una causa justa, y para NADA MÁS.
};



