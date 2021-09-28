// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalIsidro_EXIT(C_INFO)
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 999;
	condition	= DIA_BaalIsidro_EXIT_Condition;
	information	= DIA_BaalIsidro_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalIsidro_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalIsidro_Hello(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Hello_Condition;
	information	= DIA_BaalIsidro_Hello_Info;
	permanent	= 0;
	description = "No pareces muy contento.";
};                       

FUNC INT DIA_BaalIsidro_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_Hello_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_00"); //No pareces demasiado contento.
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_01"); //¡No lo estoy!
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_02"); //Necesito librarme de un montón de hierba.
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_03"); //¿Vienes a vender mercancías del Campamento de la Secta?
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_04"); //Sí, pero paso de hacerlo.
};

// ************************************************************
// 					 	TRADE
// ************************************************************

INSTANCE DIA_BaalIsidro_TRADE(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 800;
	condition	= DIA_BaalIsidro_TRADE_Condition;
	information	= DIA_BaalIsidro_TRADE_Info;
	permanent	= 1;
	description = "Enséñame lo que tienes.";
	trade 		= 1;
};                       

FUNC INT DIA_BaalIsidro_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_TRADE_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_TRADE_15_00"); //Muéstrame lo que llevas.
	AI_Output (self, other,"DIA_BaalIsidro_TRADE_03_01"); //Aquí tienes...
};

// ************************************************************
// 					 Ich verkaufe für dich
// ************************************************************

INSTANCE DIA_BaalIsidro_GimmeKraut(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_GimmeKraut_Condition;
	information	= DIA_BaalIsidro_GimmeKraut_Info;
	permanent	= 0;
	description = "Podría vender la hierba para ti... A cambio de un detalle, por supuesto.";
};                       

FUNC INT DIA_BaalIsidro_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_GimmeKraut_Info()
{	
	AI_Output			(other, self,"DIA_BaalIsidro_GimmeKraut_15_00"); //Podría vender esta hierba en tu lugar; a cambio de algo, por supuesto.
	AI_Output			(self, other,"DIA_BaalIsidro_GimmeKraut_03_01"); //Olvídalo; no estoy tan borracho como para eso. Te limitarías a huir con ella.

	Log_CreateTopic		(CH1_DealerJob, LOG_MISSION);
    Log_SetTopicStatus	(CH1_DealerJob, LOG_RUNNING);
    B_LogEntry			(CH1_DealerJob,"El novicio Baal Isidro frecuenta la taberna del lago y se coge cogorzas. Debería vender su parte de los tallos de hierba, pero no lo consigue. Quizá pueda convencerle para que me deje a mí, pero, ¿cómo lo hago?"); 
};

// ************************************************************
// 					Baal Kagan hat gepetzt
// ************************************************************

INSTANCE DIA_BaalIsidro_Problem(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Problem_Condition;
	information	= DIA_BaalIsidro_Problem_Info;
	permanent	= 0;
	description = "Tienes un problema. Baal Kagan hará que te sustituyan.";
};                       

FUNC INT DIA_BaalIsidro_Problem_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_Problem_Info()
{	
	AI_Output			(other, self,"DIA_BaalIsidro_Problem_15_00"); //Deja que te diga algo; tienes un problema. Baal Kagan hará que seas sustituido.
	AI_Output			(self, other,"DIA_BaalIsidro_Problem_03_01"); //¿Qué? ¡Que el Durmiente se apiade de mí! ¡Tengo que librarme de la mercancía!
	
	if (BaalIsidro_GotDrink == FALSE)
	{
	    B_LogEntry		(CH1_DealerJob,"Baal Isidro se disgustó claramente cuando le hablé de mi plan de sustituirle. Sin embargo, eso no ha bastado para que me deje.");
	}
	else
	{
	    B_LogEntry		(CH1_DealerJob,"Cuando Baal Isidro oyó que Baal Kagan pensaba reemplazarlo, se asustó muchísimo de repente. ¡Creo que ahora aceptará mi oferta!");
	};	
};

// ************************************************************
// 					 Trink noch einen
// ************************************************************
	var int BaalIsidro_GotDrink;
// ************************************************************

INSTANCE DIA_BaalIsidro_Drink(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Drink_Condition;
	information	= DIA_BaalIsidro_Drink_Info;
	permanent	= 1;
	description = "Aquí tienes. Te invito a otro trago.";
};                       

FUNC INT DIA_BaalIsidro_Drink_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_BaalIsidro_GimmeKraut) && (BaalIsidro_GotDrink == FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_Drink_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Drink_15_00"); //Toma, te invito a otro trago.
	
	if ( (Npc_HasItems(other,ItFoBooze)>0) || (Npc_HasItems(other,ItFoBeer)>0) || (Npc_HasItems(other,ItFoWine)>0) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_Drink_03_01"); //¡Gracias, hombre; brindaré por tu salud!

		if 		(Npc_HasItems(other,ItFoBooze))
		{
			B_GiveInvItems	(other,self,ItFoBooze,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoBooze);		
		}
		else if (Npc_HasItems(other,ItFoBeer))
		{
			B_GiveInvItems	(other,self,ItFoBeer,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoBeer);		
		}
		else if (Npc_HasItems(other,ItFoWine))
		{
			B_GiveInvItems	(other,self,ItFoWine,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoWine);		
		};
		
		BaalIsidro_GotDrink = TRUE;

		if	Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem)
		{
		    B_LogEntry	(CH1_DealerJob,"El sorbo final de mi generosa oferta ha terminado ahogando el último ápice de resistencia de Baal Isidro. Creo que ahora aceptará mi oferta.");
		}
		else
		{
		    B_LogEntry	(CH1_DealerJob,"Baal Isidro ha aceptado con mucho gusto la bebida pero aún no quiere cederme la venta de hierba.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_NO_Drink_03_00"); //¿Cómo? ¿Dónde?
	};
};

// ************************************************************
// 					 Übrleg's dir!
// ************************************************************
	var int BaalIsidro_DealerJob;
// ************************************************************

INSTANCE DIA_BaalIsidro_ThinkAgain(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_ThinkAgain_Condition;
	information	= DIA_BaalIsidro_ThinkAgain_Info;
	permanent	= 1;
	description = "Piensa en ello. Dame la hierba y compartiremos los beneficios.";
};                       

FUNC INT DIA_BaalIsidro_ThinkAgain_Condition()
{
	if	( Npc_KnowsInfo(hero, DIA_BaalIsidro_GimmeKraut) && ((BaalIsidro_DealerJob!=LOG_RUNNING)&&(BaalIsidro_DealerJob!=LOG_SUCCESS)) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_ThinkAgain_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_00"); //Piensa en ello; si me das la hierba compartiremos las ganancias.
	
	if ( (BaalIsidro_GotDrink == TRUE) && Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_01"); //Oh, tío, tengo que librarme de la mercancía. No estarás intentando hacerme quedar por tonto, ¿verdad?
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_02"); //Te doy mi palabra.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_03"); //Estupendo; aquí tienes la mercancía... Deberías conseguir al menos 400 pepitas por ella. Es decir, 200 para cada uno. Te espero aquí. Vuelve tan pronto como tengas el mineral.
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_04"); //¿Sabes quién querrá cantidades más grandes por aquí?
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_05"); //Sabía que debería haber ido yo.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_06"); //Me sentiré mucho mejor ahora que me he librado de la mercancía.
		
		BaalIsidro_DealerJob = LOG_RUNNING;
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro me ha dado montones de tallos de hierba. Si los vendo, me dará la mitad de los beneficios, lo que supondría 200 pepitas.");	
	
		//Itemübergabe
		CreateInvItems		(self,			itmijoint_1, 40);
		B_GiveInvItems  	(self, other,	itmijoint_1, 50);//Notwendig zur Textausgabe "50 Items übergeben", wird sofort ausgeglichen
		Npc_RemoveInvItems	(self,			itmijoint_2, 20);
		Npc_RemoveInvItems	(self,			itmijoint_3, 20);
		Npc_RemoveInvItems	(other,			itmijoint_1, 40);
		CreateInvItems		(other,			itmijoint_2, 20);
		CreateInvItems		(other,			itmijoint_3, 20);
					
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00"); //No, tío. Ya me las apañaré.
	};
};

// ************************************************************
// 					RUNNING / SUCCESS
// ************************************************************

INSTANCE DIA_BaalIsidro_RUNNING(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_RUNNING_Condition;
	information	= DIA_BaalIsidro_RUNNING_Info;
	permanent	= 0;
	description = "He vendido la hierba. Aquí tienes tus 200 pepitas de mineral.";
};                       

FUNC INT DIA_BaalIsidro_RUNNING_Condition()
{
	if (BaalIsidro_DealerJob == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_RUNNING_Info()
{	
	AI_Output				(other, self,"DIA_BaalIsidro_RUNNING_15_00"); //He vendido la hierba.
	AI_Output				(self, other,"DIA_BaalIsidro_RUNNING_03_01"); //¿Y mis 200 pepitas?
	
	if (Npc_HasItems(other,itminugget)>=200)
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_15_02"); //Aquí las tienes.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_03"); //Genial... Ahora ya no me importa un pito Baal Kagan (risa desagradable).
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_04"); //Ha sido un placer hacer negocios contigo.

		B_GiveInvItems		(hero, self, ItMiNugget, 200);
		BaalIsidro_DealerJob = LOG_SUCCESS;
		
		Log_SetTopicStatus	(CH1_DealerJob, LOG_SUCCESS);
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro ha sentido un gran alivio al recibir sus 200 pepitas.");	
	    B_GiveXP			(XP_BaalIsidroPayShare);
	}
	else
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_NoOre_15_05"); //No las llevo encima.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_NoOre_03_06"); //¡Entonces ve a por ellas!
		AI_StopProcessInfos	(self);
	};
};

