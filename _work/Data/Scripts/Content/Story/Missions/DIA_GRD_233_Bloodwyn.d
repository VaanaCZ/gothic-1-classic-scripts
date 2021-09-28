// ******************************************************************
// Zur Info: Bloodwyn: 244, 243; Bloodwyn: 229, 242; Fletcher: 241, 240

// ************************************************************
// 			  				   EXIT_Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_EXIT_Schutzgeld (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 999;
	condition	= Info_Bloodwyn_EXIT_Schutzgeld_Condition;
	information	= Info_Bloodwyn_EXIT_Schutzgeld_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Bloodwyn_EXIT_Schutzgeld_Condition()
{
	return 1;
};

FUNC VOID Info_Bloodwyn_EXIT_Schutzgeld_Info()
{	
	AI_Output (other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00"); //Hasta luego.
	if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //Cuídate, muchacho.
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //¡No te preocupes por nada aquí en el campamento! Te estaremos protegiendo.
	};
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
INSTANCE Info_Bloodwyn_Hello (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Hello_Condition;
	information	= Info_Bloodwyn_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Bloodwyn_Hello_Condition()
{	
	if (Kapitel <= 2) 
	{
		return 1;
	};
};
FUNC VOID Info_Bloodwyn_Hello_Info()
{	
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_00"); //¡Eh, tú!
	AI_Output (other, self,"Info_Bloodwyn_Hello_15_01"); //¿Me hablas a mí?
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_02"); //¡Te lo advierto! ¡La gente como tú puede meterse en líos muy deprisa por aquí!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_03"); //¡Y la mayoría de los tipos que meten aquí son unos bastardos!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_04"); //Creen que pueden hacer lo que les apetece contigo. Pero no lo permitiremos.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_05"); //Gómez quiere paz en el campamento, y los guardias aseguramos que la tenga. Pero es un trabajo que no sale barato.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_06"); //Por eso te pido un poco de mineral. Considéralo como una especie de muestra de amistad. Tú nos ayudas y nosotros te ayudaremos. Si te metes en líos, nosotros te sacaremos de ellos.

	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"¿Por qué no? ¿En cuánto mineral estabas pensando?",Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice		(Info_Bloodwyn_Hello,"¿Quieres que pague dinero a cambio de protección? ¡Puedo cuidar de mí mismo!",Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice		(Info_Bloodwyn_Hello,"¿Me estás amenazando?",Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
	AI_Output (other, self,"Info_Bloodwyn_ForgetIt_15_00"); //O sea, que queréis que pague a cambio de vuestra protección. ¡No gracias, puedo cuidar de mí mismo.
	AI_Output (self, other,"Info_Bloodwyn_ForgetIt_08_01"); //Como quieras, chaval. ¡Pronto te arrepentirás de haber rechazado una oferta amistosa!
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
	AI_Output (other, self,"Info_Bloodwyn_SollDrohungSein_15_00"); //¿Me estás amenazando?
	AI_Output (self, other,"Info_Bloodwyn_SollDrohungSein_08_01"); //¡Al contrario! ¡Es un ofrecimiento amistoso!
};

func void Info_Bloodwyn_Hello_HowMuch()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //¿Por qué no? ¿En cuánto mineral estabas pensando?
	AI_Output (self, other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //No mucho. Todo lo que necesito son 10 pepitas.
	
	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"No tengo 10 pepitas de mineral.",Info_Bloodwyn_Hello_NotNow);
	if (Npc_HasItems(other,itminugget)>=10)
	{
		Info_AddChoice	(Info_Bloodwyn_Hello,"Aquí tienes tu mineral. Siempre viene bien tener uno o dos amigos.",Info_Bloodwyn_Hello_OkTakeIt);
	};
};
// -------------------------------------------------------
func void Info_Bloodwyn_Hello_OkTakeIt()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //Aquí tienes tu mineral. Siempre viene bien tener uno o dos amigos.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //Pareces un chico listo. A partir de ahora, te protegeremos.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //Pero eso no quiere decir que puedas hacer lo que te dé la gana por aquí, ¿de acuerdo?
	
	B_GiveInvItems 	    (other, self, itminugget, 10);
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_NotNow()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_NotNow_15_00"); //No tengo 10 pepitas.
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_01"); //Entonces aceptaré lo que tengas, no pasa nada. Me puedes dar el resto la próxima vez que te vea.
	AI_GotoNpc (self,other);
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_02"); //Déjame ver...
		
	if (Npc_HasItems(other, itminugget) > 0)
	{
		if (Npc_HasItems(other, itminugget) > 9)
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //¡Anda, mira! Parece que alguien no sabe contar hasta 10, ¿eh?
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //Voy a quedarme con todo lo que tienes. Eso me ayudará a olvidar que me has mentido.
		}
		else
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //Oh, también acepto pequeños donativos. ¡La intención es lo que cuenta! ¡Gracias por el mineral, chaval!
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //A partir de ahora, estaré pendiente de ti cuando estés en el campamento.
		};
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //Hm, estás sin blanca. Bueno, supongo que habrá otras ocasiones.
	};
	
	B_GiveInvItems		(other, self, itminugget, Npc_HasItems(other, itminugget) );//Alle Nuggets entfernen
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

// ************************************************************
// 						Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_PayDay (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_PayDay_Condition;
	information	= Info_Bloodwyn_PayDay_Info;
	permanent	= 1;		
	important   = 1;				//*** NUR, WENN SC AUCH 10 ERZ HAT! ***
};                       

FUNC INT Info_Bloodwyn_PayDay_Condition()
{
	if ( (Kapitel <= 2) && (Bloodwyn_PayDay <= Wld_GetDay()-1) && (Npc_HasItems(other, itminugget)>=10) )
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayDay_Info()
{	
	if (Bloodwyn_ProtectionPaid == TRUE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_00"); //¡Ah, me alegro de verte, amigo mío!
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_01"); //¿Cómo va tu contribución diaria? Ya sabes que debes 10 pepitas.
		
		Info_ClearChoices	(Info_Bloodwyn_PayDay );
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Toma. 10 pepitas no es mucho entre amigos.",Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice		(Info_Bloodwyn_PayDay,"No voy a pagar. Ya me has sacado demasiado.",Info_Bloodwyn_PayDay_PayNoMore);
	}
	else if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_00"); //¡Eh, tú!
		AI_Output (other, self,"Info_Bloodwyn_PayDay_Den_15_01"); //¿Ahora qué?
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_02"); //Ha llegado el momento de que demuestres que eres un verdadero amigo.
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_03"); //Sólo 10 pepitas y participas. ¿Qué dices?
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //Toma. 10 pepitas no es mucho entre amigos.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //¡Lo que yo pienso!
	
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //No voy a pagar. Ya me has sacado demasiado.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //¡Me decepcionas! Ya no somos amigos. ¡Procura que no te asalten o te roben ahora que estás solo!
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //No te preocupes, puedo cuidar de mí mismo.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //Ya veremos...
	
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Npc_SetPermAttitude (self,ATT_ANGRY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

// ************************************************************
// 						DOCH zahlen
// ************************************************************

INSTANCE Info_Bloodwyn_Doch (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Doch_Condition;
	information	= Info_Bloodwyn_Doch_Info;
	permanent	= 1;
	description = "He cambiado de opinión. Voy a pagarte las 10 pepitas.";
};                       

FUNC INT Info_Bloodwyn_Doch_Condition()
{
	if (Bloodwyn_ProtectionPaid == FALSE)
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_Doch_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_Doch_15_00"); //He cambiado de opinión. Voy a pagarte las 10 pepitas.
	if (Npc_HasItems(other, itminugget)>=10)
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_01"); //¡Eso es! ¿Ves? Puedes tomar las decisiones correctas.
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_02"); //Y a partir de ahora seguirás pagándome tu contribución diaria, ¿verdad?
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude (self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_NoOre_08_00"); //Entonces vuelve cuando la tengas.
		AI_StopProcessInfos	(self);
	};
};


	

INSTANCE Info_Bloodwyn_PayForJesse (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 5;
	condition	= Info_Bloodwyn_PayForJesse_Condition;
	information	= Info_Bloodwyn_PayForJesse_Info;
	permanent	= 1;
	description = "Jesse me manda para que pague sus 10 pepitas.";
};                       

FUNC INT Info_Bloodwyn_PayForJesse_Condition()
{
	if (Jesse_PayForMe == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayForJesse_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_00"); //Jesse me manda para que pague sus 10 pepitas.
	if  (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_01"); //Lo que debes hacer es pagar TUS 10 pepitas.
	};
	AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_02"); //No te preocupes por Jesse. Es un perdedor y no va a llegar a ninguna parte.
	if (Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_03"); //No, pago por él. ¡Coge sus 10 pepitas y déjale en paz!
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_04"); //De acuerdo, tío; si así lo quieres.
		Jesse_PayForMe = LOG_SUCCESS;
	}
	else
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_05"); //¡Oh! Parece que no llevo encima tanto mineral!
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_06"); //¡Es un augurio, tío! ¡Piénsatelo bien! ¡Pagar por ese haragán es un desperdicio de buen mineral!
	};
};
/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_233_Bloodwyn_WELCOME (C_INFO)
{
	npc				= GRD_233_Bloodwyn;
	condition		= GRD_233_Bloodwyn_WELCOME_Condition;
	information		= GRD_233_Bloodwyn_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_233_Bloodwyn_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_233_Bloodwyn_WELCOME_Info()
{
	AI_Output (self, other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //Ya eres uno de los nuestros. Bien hecho. ¡Los guardias necesitan hombres como tú!
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
instance Info_Bloodwyn_DIE (C_INFO)
{
	npc			= Grd_233_Bloodwyn;
	condition	= Info_Bloodwyn_DIE_Condition;
	information	= Info_Bloodwyn_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Bloodwyn_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Bloodwyn_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_01"); //¡Es el traidor infiltrado! ¡BAH! ¡Y te consideramos un guardia!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_02"); //¡Parece que hemos pasado por alto a uno de los magos del fuego rebeldes!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_03"); //¡Es la Sombra que nos traicionó!
		};			

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_04"); //Espera. ¿De qué estás hablando, Bloodwyn?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_05"); //Así que estás confabulado con el Campamento Nuevo, ¿eh?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_06"); //No, espera, aún...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_07"); //Supongo que pensabas que podías seguir así eternamente...
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_08"); //Basta de tonterías...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_09"); //Los traidores como tú deben morir.
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_10"); //¡¡¡MUERE, TRAIDOR!!!

		if	Npc_KnowsInfo(hero, Info_Fletcher_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Fletcher, que ahora vigila la puerta principal, ha reaccionado del mismo modo que Bloodwyn en la puerta posterior. No sé por qué, pero debe estar relacionado de algún modo con mi búsqueda de los focos de parte del Campamento Nuevo.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Bloodwyn, que vigila la puerta posterior del Campamento Viejo junto a un grupo de guardias, me ha llamado traidor y renegado. ¡No me ha escuchado y me ha atacado de repente!");
			B_LogEntry			(CH4_BannedFromOC,"¡Parece que he sido desterrado del Campamento Viejo!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_11"); //¿Así que te has atrevido a salir del Campamento Nuevo? ¡Qué maniobra más estúpida!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_12"); //Oh, ¿así que te has atrevido a salir del campamento del pantano?  ¡Qué maniobra más estúpida!
		};

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_13"); //¿Qué? ¿Qué quieres decir?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_14"); //¿No te has enterado del ataque a tu mina?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_15"); //¿Qué...?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_16"); //¡Lo siento, pero no podemos dejar que te vayas de la lengua!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_17"); //Oye, no quiero líos...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_18"); //¡Deberías haberlo pensado antes!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_19"); //Mira, ya estoy harto de eso...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_20"); //¡Y yo también! ¡MATADLO!
	};
	
	Npc_ExchangeRoutine	(self,				"FMTaken2");	// Verstärkung vor das Hinterem Tor (Anführer)
	B_ExchangeRoutine	(GRD_232_Gardist,	"FMTaken2");	// Verstärkung vor das Hinterem Tor
	B_ExchangeRoutine	(GRD_229_Gardist,	"FMTaken2");	// Verstärkung vor das Hinterem Tor (Fernkämpfer)
	B_ExchangeRoutine	(GRD_216_Torwache,	"FMTaken2");	// reguläre Wache am Hinteren Tor
	B_ExchangeRoutine	(GRD_217_Torwache,	"FMTaken2");	// reguläre Wache am Hinteren Tor

	B_SetPermAttitude	(GRD_233_Bloodwyn,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_232_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_229_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_216_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_217_Torwache,	ATT_HOSTILE);

	
	if	!Npc_KnowsInfo(hero, Info_Fletcher_DIE)
	{
		B_LogEntry		(CH4_Firemages,"Las puertas del Campamento Viejo ahora están cerradas y protegidas por guardias que atacan a todo el que se acerca por allí. ");
	};
	
	AI_StopProcessInfos	(self);
};

