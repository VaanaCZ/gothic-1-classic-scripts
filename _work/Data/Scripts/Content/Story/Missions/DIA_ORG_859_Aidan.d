// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Aidan_Exit (C_INFO)
{
	npc			= ORG_859_Aidan;
	nr			= 999;
	condition	= DIA_Aidan_Exit_Condition;
	information	= DIA_Aidan_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Aidan_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Aidan_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ****************************************
// 				Hallo
// ****************************************

instance DIA_Aidan_Hello (C_INFO)
{
	npc				= Org_859_Aidan;
	nr				= 1;
	condition		= DIA_Aidan_Hello_Condition;
	information		= DIA_Aidan_Hello_Info;
	permanent		= 0;
	description		= "¿Qué haces aquí?";
};

FUNC int  DIA_Aidan_Hello_Condition()
{	
	return 1;
};

func void  DIA_Aidan_Hello_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //¿Qué estás haciendo aquí?
	AI_Output (self, other,"DIA_Aidan_Hello_13_01"); //Soy un cazador. Me gano la vida vendiendo pieles y dientes.
	AI_Output (other, self,"DIA_Aidan_Hello_15_02"); //¿Se saca dinero con eso?
	AI_Output (self, other,"DIA_Aidan_Hello_13_03"); //Sí; siempre que conozcas la manera correcta de descuartizar a estas bestias.

	Log_CreateTopic	(GE_TeacherOW,	LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Aidan, un cazador que vive en el camino entre los Campamentos Viejo y Nuevo, puede enseñarme a destripar animales.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_859_Aidan_Creatures (C_INFO)
{
	npc			= Org_859_Aidan;
	nr			= 1;
	condition	= Org_859_Aidan_Creatures_Condition;
	information	= Org_859_Aidan_Creatures_Info;
	permanent	= 1;
	description = "Quiero aprender a descuartizar animales.";
};                       

FUNC int  Org_859_Aidan_Creatures_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Aidan_Hello))
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_859_Aidan_Creatures_Info()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_15_00"); //Quiero aprender a descuartizar animales.
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_13_01"); //¿Qué es lo que quieres saber?
		
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice   (Org_859_Aidan_Creatures, DIALOG_BACK 											,Org_859_Aidan_Creatures_BACK);

		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_859_Aidan_Creatures,"Sacar dientes (coste: 1 punto de habilidad, 50 pepitas de mineral)",Org_859_Aidan_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Despellejar (coste: 1 punto de habilidad, 100 pepitas de mineral)",Org_859_Aidan_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Arrancar garras (coste: 1 punto de habilidad, 50 pepitas de mineral)",Org_859_Aidan_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Despellejar reptiles (coste: 1 punto de habilidad, 100 pepitas de mineral)",Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //Te he enseñado todo lo que sé.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Zahn_15_00"); //¿Cómo hago para sacar los dientes?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Aprender: sacar dientes", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_01"); //Lo más importante es lograr que no se astillen. Para evitarlo, aplica tu puñal cerca del centro del diente y haz palanca con mucho cuidado.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_02"); //Puedes sacarle los dientes a los lobos, bestias de sombra y chasqueadores.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Conocimientos sobre la extracción de dientes: lobo, perro orco, chasqueador, mordedor, sabueso de sangre, bestia de sombra.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Necesitas más experiencia; si no, mis consejos no te servirán de nada.
			PrintScreen	("¡Faltan puntos de habilidad!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Antes quiero ver algo de mineral. ¡Como ya te dije, todo tiene un precio!
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Fell_15_00"); //¿Cómo hago para despellejar a estas criaturas?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Aprender: despellejar", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_01"); //Es muy importante despellejarlas de atrás adelante. Te resultará fácil una vez le hayas cogido el truco. ¡Las pieles son muy valiosas!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_02"); //Las pieles de los lobos y bestias de sombra puede utilizarse para confeccionar ropas. Cuando examines la piel de un animal muerto, pronto verás si puede ser utilizada o no. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Conocimientos sobre cómo quitar pieles: lobo, perro orco, bestia de sombra, troll.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Necesitas más experiencia; si no, mis consejos no te servirán de nada.
			PrintScreen	("¡Faltan puntos de habilidad!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Antes quiero ver algo de mineral. ¡Como ya te dije, todo tiene un precio!
	};
};

func void Org_859_Aidan_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Aprender: arrancar garras", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_859_Aidan_Creatures_Kralle_15_00"); //¡Enséñame a arrancar las garras!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_01"); //La verdad es que es muy sencillo, si sabes lo que tienes que hacer. Dobla las garras hacia delante, nunca hacia atrás; ¡tampoco debes sacarlas tirando de ellas!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Las garras de lagarto son especialmente útiles. A partir de ahora, sabrás de qué criaturas debes obtener garras.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Conocimiento sobre la extracción de garras: lagarto, chasqueador, acechador, mordedor, cuchilla.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Necesitas más experiencia; si no, mis consejos no te servirán de nada.
			PrintScreen	("¡Faltan puntos de habilidad!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Antes quiero ver algo de mineral. ¡Como ya te dije, todo tiene un precio!
	};
};

func void Org_859_Aidan_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Aprender: desollar lagarto", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_859_Aidan_Creatures_Haut_15_00"); //¿Qué debo tener en cuenta al despellejar reptiles?
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_01"); //Los únicos reptiles adecuados para este propósito son los acechadores y los tiburones de la ciénaga.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_02"); //Si cortas la piel por los costados, saldrá sola. De ahora en adelante deberías poder despellejar reptiles.
				
			Knows_GetHide = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Conocimientos sobre cómo quitar pieles: acechador, tiburón de la ciénaga.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Necesitas más experiencia; si no, mis consejos no te servirán de nada.
			PrintScreen	("¡Faltan puntos de habilidad!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Antes quiero ver algo de mineral. ¡Como ya te dije, todo tiene un precio!
	};
};
