
// **************************************************
//						 EXIT 
// **************************************************

instance  Org_819_Drax_Exit (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 999;
	condition	= Org_819_Drax_Exit_Condition;
	information	= Org_819_Drax_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_819_Drax_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					 Ihr jagt hier...
// **************************************************

instance  Org_819_Drax_HuntHere (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_HuntHere_Condition;
	information	= Org_819_Drax_HuntHere_Info;
	permanent	= 0;
	description = "Est�s cazando, �verdad?";
};                       

FUNC int  Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_HuntHere_Info()
{
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_00"); //Est�s de caza, �verdad?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_01"); //Eso parece... �qu� es lo que quieres?
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_02"); //�Me puedes dar alg�n consejo para la caza?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_03"); //Podr�a ense�arte algunas cosas... pero todo tiene un precio.
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_04"); //�Cu�nto ser�a?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_05"); //Para empezar, bastar�a con un buen trago de cerveza... luego, ya veremos.
};

// **************************************************
//				Scavenger jagen + Bier
// **************************************************
	var int drax_bierbekommen;
	var int drax_Lehrer_frei;
// **************************************************

instance  Org_819_Drax_Scavenger (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Scavenger_Condition;
	information	= Org_819_Drax_Scavenger_Info;
	permanent	= 1;
	description = "Aqu� tienes, toma una cerveza y h�blame de la caza.";
};                       

FUNC int  Org_819_Drax_Scavenger_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_819_Drax_HuntHere) && (drax_bierbekommen==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Scavenger_Info()
{
	if (Npc_HasItems(other,itfobeer)>0)
	{
		B_GiveInvItems	(other, self, itfobeer,1);
	
		AI_Output	(other, self,"Org_819_Drax_Scavenger_15_00"); //Aqu� tienes, t�mate une cerveza y h�blame de la caza.
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem	(self,	ItFobeer);
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_01"); //Carro�eros, as� llamamos a los grandes p�jaros; hay que atacarlos uno tras otro. Es f�cil atraer a uno para que se aleje de la manada.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_02"); //Se irritar�n si te acercas demasiado. Pasado un rato, se lanzar�n a atacarte. Llegados a este punto, deber�as esperarlos arma en ristre.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_03"); //Si consigues darle a la bestia antes de que ella te d� a ti, tienes que seguir luchando y entonces podr�s derrotar a la criatura sin sufrir da�o alguno.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_04"); //Si es la bestia la que te da a ti primero... Bueno... No dejes que lo hagan.
		drax_bierbekommen = TRUE;
	}
	else
	{
		AI_Output (other, self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //No tengo cerveza.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //Entonces ve a por ella. Ese ser� el mejor consejo gratis que recibas en mucho tiempo. �Y, de paso, tr�ete tambi�n algo de mineral!
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //�Puedo darte algo de informaci�n sobre animales, pero tiene un precio!
	};	
	drax_Lehrer_frei = TRUE;
	
	Log_CreateTopic	(GE_TeacherOW, LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"El bandido Drax se ha ofrecido a ense�arme a destripar animales si puedo pagarle lo que pide. Caza yendo de camino de la plaza del mercado al Campamento Viejo.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_819_Drax_Creatures (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Creatures_Condition;
	information	= Org_819_Drax_Creatures_Info;
	permanent	= 1;
	description = "�Qu� m�s puedes contarme acerca de la caza?";
};                       

FUNC int  Org_819_Drax_Creatures_Condition()
{
	if ( Drax_Lehrer_frei == TRUE )
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Creatures_Info()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_15_00"); //�Qu� m�s puedes contarme sobre la caza?
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_06_01"); //Mucho... Pero te costar� m�s que una cerveza.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_02"); //Si sabes c�mo hacerlo, puedes llevarte los dientes, garras y piel de las criaturas. Son dif�ciles de conseguir, pero muy valiosas.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_03"); //Cualquier mercader te las cambiar� por algo.
		
		Info_ClearChoices(Org_819_Drax_Creatures);
		Info_AddChoice   (Org_819_Drax_Creatures, DIALOG_BACK 													,Org_819_Drax_Creatures_BACK);
		Info_AddChoice   (Org_819_Drax_Creatures,"Pides mucho a cambio de tus consejos.",Org_819_Drax_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_819_Drax_Creatures,"Sacar dientes (coste: 1 punto de habilidad, 50 pepitas de mineral)",Org_819_Drax_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Despellejar (coste: 1 punto de habilidad, 100 pepitas de mineral)",Org_819_Drax_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Arrancar garras (coste: 1 punto de habilidad, 50 pepitas de mineral)",Org_819_Drax_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Despellejar reptiles (coste: 1 punto de habilidad, 100 pepitas de mineral)",Org_819_Drax_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //Ya te he contado todo lo que s�.
	};
};

func void Org_819_Drax_Creatures_BACK()
{
	Info_ClearChoices(Org_819_Drax_Creatures);
};

func void Org_819_Drax_Creatures_PrettyMuch()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //Est�s pidiendo mucho por tus consejos.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //Es posible, pero podr�s ganar mucho mineral con estos consejos.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //Los animales que mates sin saber c�mo descuartizarlos no har�n m�s que pudrirse.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //Y eso es desperdiciar una oportunidad de despellejarlos y vender sus pieles por mucho dinero.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //Yo en tu lugar intentar�a obtener estos conocimientos lo antes posible.
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Zahn_15_00"); //�C�mo hago para sacarles los dientes?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Aprender: sacar dientes", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_01"); //Lo m�s importante es lograr que los dientes no se astillen. Para evitarlo, aplica tu pu�al cerca del centro del diente y haz palanca con mucho cuidado.
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_02"); //Puedes sacarle los dientes a los lobos, bestias de sombra y chasqueadores.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Conocimientos sobre la extracci�n de dientes: lobo, perro orco, chasqueador, mordedor, sabueso de sangre, bestia de sombra.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //Tienes que acumular m�s experiencia o este conocimiento no te ser� de ninguna utilidad.
			PrintScreen	("�Faltan puntos de habilidad!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //Antes quiero ver algo de mineral. �Como ya te dije, todo tiene un precio!
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Fell_15_00"); //�C�mo hago para despellejar a estas criaturas?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self, itminugget,100);
			
			PrintScreen	("Aprender: despellejar", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_01"); //Es muy importante despellejarlas de atr�s adelante. Te resultar� f�cil una vez le hayas cogido el truco. �Las pieles son muy valiosas!
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_02"); //Las pieles de los lobos y bestias de sombra pueden utilizarse para confeccionar ropas. Cuando examines la piel de un animal muerto, pronto ver�s si puede ser utilizada o no. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Conocimientos sobre c�mo quitar pieles: lobo, perro orco, bestia de sombra, troll.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //Necesitas m�s experiencia; si no, mis consejos no te servir�n de nada.
			PrintScreen	("�Faltan puntos de habilidad!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //Antes quiero ver algo de mineral. �Como ya te dije, todo tiene un precio!
	};
};

func void Org_819_Drax_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Aprender: arrancar garras", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_819_Drax_Creatures_Kralle_15_00"); //�Ens��ame a arrancar las garras!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_01"); //La verdad es que es muy sencillo, si sabes lo que tienes que hacer. Dobla las garras hacia delante, nunca hacia atr�s; �tampoco debes sacarlas tirando de ellas!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_02"); //Las garras se pueden sacar especialmente de los lagartos. A partir de ahora, sabr�s de qu� criaturas debes obtener garras.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Conocimiento sobre la extracci�n de garras: lagarto, chasqueador, acechador, mordedor, cuchilla.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //Necesitas m�s experiencia; si no, mis consejos no te servir�n de nada.
			PrintScreen	("�Faltan puntos de habilidad!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //Antes quiero ver algo de mineral. �Como ya te dije, todo tiene un precio!
	};
};

func void Org_819_Drax_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Aprender: desollar lagarto", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_819_Drax_Creatures_Haut_15_00"); //�Qu� debo tener en cuenta a la hora de despellejar reptiles?
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_01"); //Los �nicos reptiles adecuados para este prop�sito son los acechadores y los tiburones de la ci�naga.
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_02"); //Si cortas la piel por los costados, saldr� sola. De ahora en adelante deber�as poder despellejar reptiles.
				
			Knows_GetHide = TRUE;
			
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Conocimientos sobre c�mo quita pieles: acechador, tibur�n de la ci�naga.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //Necesitas m�s experiencia; si no, mis consejos no te servir�n de nada.
			PrintScreen	("�Faltan puntos de habilidad!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //Antes quiero ver algo de mineral. �Como ya te dije, todo tiene un precio!
	};
};
