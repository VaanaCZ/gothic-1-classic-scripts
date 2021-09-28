// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dexter_Exit (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 999;
	condition	= DIA_Dexter_Exit_Condition;
	information	= DIA_Dexter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dexter_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begr�ssung
// **************************************************

INSTANCE DIA_Dexter_First (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_First_Condition;
	information	= DIA_Dexter_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Dexter_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_First_Info()
{
	AI_Output (self,other,"DIA_Dexter_IAmNew_10_00"); //�Eh, t�! Tengo a la venta hierba del pantano y pociones del Campamento de la Secta. �Quieres algo?
};

// **************************************************
// 					Kraut
// **************************************************

INSTANCE DIA_Dexter_Kraut (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_Kraut_Condition;
	information	= DIA_Dexter_Kraut_Info;
	permanent	= 0;
	description	= "�Qu� es la hierba del pantano?";
};                       

FUNC INT DIA_Dexter_Kraut_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Kraut_Info()
{
	AI_Output (other,self,"DIA_Dexter_Kraut_15_00"); //�Qu� es la hierba del pantano?
	AI_Output (self,other,"DIA_Dexter_Kraut_10_01"); //Eres nuevo aqu�, �verdad? Se puede fumar. A la mayor�a de nosotros nos resulta muy relajante.
};

// **************************************************
// 					TRADE
// **************************************************

// **************************************************

INSTANCE DIA_Dexter_Trade (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_Trade_Condition;
	information	= DIA_Dexter_Trade_Info;
	permanent	= 1;
	description	= "Mu�strame tus mercanc�as.";
	Trade		= 1;
};                       

FUNC INT DIA_Dexter_Trade_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Trade_Info()
{
	AI_Output (other,self,"DIA_Dexter_Trade_15_00"); //D�jame ver tu mercanc�a.
	AI_Output (self,other,"DIA_Dexter_Trade_10_01"); //Tengo el mejor material de por aqu�.
	
	if	(Dexter_Traded == FALSE)
	{
		Log_CreateTopic(GE_TraderOC, LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Dexter, la Sombra, comercia con hierba del pantano y POCIONES del Campamento de la Secta.");
	
		Dexter_Traded = TRUE;
	};
};

// **************************************************
// 					JOIN OC
// **************************************************
	var int Dexter_GetKalomsRecipe;
// **************************************************

INSTANCE DIA_Dexter_JoinOC (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_JoinOC_Condition;
	information	= DIA_Dexter_JoinOC_Info;
	permanent	= 0;
	description	= "Quiero ingresar en el Campamento. Quiero convertirme en una Sombra.";
};                       

FUNC INT DIA_Dexter_JoinOC_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Dexter_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_00"); //Quiero unirme al Campamento; quiero ser un miembro de las Sombras.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_01"); //�Ah, s�? �Est�s buscando una oportunidad de demostrar tu val�a?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_02"); //Estupendo; puedes hacerme un favor. Si lo haces bien, hablar� a Diego en tu favor.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_03"); //�De qu� se trata?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_04"); //En el Campamento de la Secta hay un hombre llamado Kalorn. Un pez gordo, uno de los Gur�s de la secta.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_05"); //Kalorn es un alquimista. Tiene la f�rmula de una poci�n de curaci�n de gran efectividad.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_06"); //Me gustar�a comprarle la f�rmula y producirla por mi cuenta.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_07"); //Pero nadie puede acercarse a Kalorn.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_08"); //�Y qu� esperas que haga yo?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_09"); //Los chalados de la secta siempre andan en busca de nuevos reclutamientos. T� eres nuevo aqu�. Finge que quieres unirte a ellos.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_10"); //Kalorn es uno de los Gur�s, lo que quiere decir que es �l quien examina a los nuevos candidatos. Si consigues hablar con �l, intenta conseguirme la f�rmula.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_11"); //Me da igual si quieres pagar por ella o no.

	Info_ClearChoices(DIA_Dexter_JoinOC);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"De acuerdo. Ver� si puedo conseguir el anillo.",DIA_Dexter_JoinOC_Ok);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Parece un asunto dif�cil. �Qu� gano con ello?",DIA_Dexter_JoinOC_HowMuch);
};

func void DIA_Dexter_JoinOC_Ok()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Ok_15_00"); //De acuerdo; intentar� consegu�rtela.
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, la Sombra del mercado, me ha pedido que vaya a ver al Gur� Kalom en el Campamento de la Secta para conseguirle una f�rmula.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter ha dicho que para entrar debo fingir ser un partidario del Campamento de la Secta.");
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

func void DIA_Dexter_JoinOC_HowMuch()	
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_HowMuch_15_00"); //Parece un asunto complicado; �qu� saco yo en limpio de ello?
	AI_Output (self,other,"DIA_Dexter_JoinOC_HowMuch_10_01"); //Habr� un momento en que Diego me pregunte si eres digno de unirte a nosotros. Adivina de qu� depender� mi respuesta.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Tal vez tenga que pagar la f�rmula. Dame 50 pepitas como adelanto.",DIA_Dexter_JoinOC_Advance);
};

func void DIA_Dexter_JoinOC_Advance()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Advance_15_00"); //Puede que tenga que pagar por la f�rmula; dame 50 pepitas por adelantado.
	AI_Output (self,other,"DIA_Dexter_JoinOC_Advance_10_01"); //Olv�dalo.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"�Sin mineral no hay f�rmula!",DIA_Dexter_JoinOC_Threat);
};

func void DIA_Dexter_JoinOC_Threat()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Threat_15_00"); //�Si no me das mineral, no tendr�s la f�rmula!
	AI_Output (self,other,"DIA_Dexter_JoinOC_Threat_10_01"); //�Bueno! Hablaremos de mineral cuando hayas obtenido la f�rmula.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"�No! Quiero ver mineral, o tendr�s que preparar la f�rmula t� mismo.",DIA_Dexter_JoinOC_OreNowOrElse);
};

func void DIA_Dexter_JoinOC_OreNowOrElse()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00"); //�No! Quiero ver tu mineral ahora mismo o tendr�s que obtener la f�rmula t� mismo.
	AI_Output (self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01"); //Hay reci�n llegados m�s que suficientes; me parece que deber�a encargarle esta tarea a uno de ellos.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"�De acuerdo! Olvid�moslo todo.",DIA_Dexter_JoinOC_ForgetIt);
};

func void DIA_Dexter_JoinOC_ForgetIt()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00"); //�Vale! Olvidemos todo este asunto.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01"); //�No tan deprisa! S�lo quer�a ver hasta d�nde ibas a llegar... 50 pepitas es mucho para un reci�n llegado, �no crees?
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02"); //Eso est� mejor.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03"); //Vale, vale, aqu� tengo las 50 pepitas. �No me defraudes, chico!
	
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, la Sombra del mercado, me ha pedido que vaya a ver al Gur� Kalom en el Campamento de la Secta para conseguirle una f�rmula.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter ha dicho que para entrar debo fingir ser un partidario del Campamento de la Secta.");
	
	CreateInvItems(self, itminugget, 50);
	B_GiveInvItems(self, other, itminugget, 50);
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

// **************************************************
// 					Where ST
// **************************************************
var int Dexter_PsiCamp;
// **************************************************

INSTANCE DIA_Dexter_WhereST (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_WhereST_Condition;
	information	= DIA_Dexter_WhereST_Info;
	permanent	= 1;
	description	= "�D�nde est� el Campamento de la Secta?";
};                       

FUNC INT DIA_Dexter_WhereST_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_WhereST_Info()
{
	AI_Output (other,self,"DIA_Dexter_WhereST_15_00"); //�D�nde est� el Campamento de la Secta?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_01"); //Sal del Campamento por la puerta sur y dir�gete hacia el este. Ser� mejor que te lleves un mapa.
	
	if (Npc_HasItems(self,ItWrWorldmap) >0)														//Bj�rn
		{																						//Bj�rn
			AI_Output (self,other,"DIA_Dexter_WhereST_10_02"); //Aqu� tengo uno que cuesta 50 pepitas.
		};																						//Bj�rn
	
	AI_Output (other,self,"DIA_Dexter_WhereST_15_02"); //La puerta sur es la de la torre en ruinas, �no?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_03"); //Exactamente.
	
	if	!Dexter_PsiCamp
	{
		B_LogEntry    (CH1_KalomsRecipe,"El Campamento de la Secta se encuentra al este del Campamento Viejo.");
		Dexter_PsiCamp = TRUE;
	};
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Dexter_KalomsRecipeSuccess (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_KalomsRecipeSuccess_Condition;
	information	= DIA_Dexter_KalomsRecipeSuccess_Info;
	permanent	= 1;
	description	= "�Tengo la f�rmula que quer�as!";
};                       

FUNC INT DIA_Dexter_KalomsRecipeSuccess_Condition()
{
	if ( (Dexter_GetKalomsRecipe == LOG_RUNNING) && (Npc_HasItems (other, KalomsRecipe) > 0) )
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_KalomsRecipeSuccess_Info()
{
	AI_Output (other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00"); //�Tengo la f�rmula que quer�as!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01"); //�Espl�ndido! �D�jamela ver!
	
	B_UseFakeScroll();
	
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02"); //�Muy bien! Ahora puedo producir las pociones por mi cuenta.
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03"); //�Eres un hombre eficaz! �Le hablar� a Diego de ti!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //Toma, aqu� tienes algo como pago por tus esfuerzos.
	
	CreateInvItems (other,itminugget,50);
	
	B_GiveInvItems (other, self, KalomsRecipe, 1);
	
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter se ha quedado impresionado. Estoy seguro de que hablar� con Diego en mi favor.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter se ha quedado impresionado. Pero no me servir� de nada: ya no puedo convertirme en una Sombra.");
	};
	B_GiveXP (XP_DexterKalom);
};

