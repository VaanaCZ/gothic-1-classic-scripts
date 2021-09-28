// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kirgo_Exit (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 999;
	condition		= Info_Kirgo_Exit_Condition;
	information		= Info_Kirgo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Kirgo_Exit_Condition()
{
	return 1;
};

func VOID Info_Kirgo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Kirgo_What(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_What_Condition;
	information		= Info_Kirgo_What_Info;
	permanent		= 0;
	description 	= "¡Hola! Soy nuevo.";
};                       

FUNC INT Info_Kirgo_What_Condition()
{	
	if (Kapitel <= 2)
	{
		return 1;
	};
};
func VOID Info_Kirgo_What_Info()
{
	AI_Output (other, self,"Info_Kirgo_What_15_00"); //¡Hola! Soy nuevo.
	AI_Output (self, other,"Info_Kirgo_What_05_01"); //¡No me digas! ¡Háblame del mundo exterior! Llevo más de un mes sin saber nada del exterior!
	AI_Output (self, other,"Info_Kirgo_What_05_02"); //Soy Kirgo. Lucho en la arena.
};

// **************************************************
//				Bit du gut
// **************************************************

instance Info_Kirgo_Good (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Good_Condition;
	information		= Info_Kirgo_Good_Info;
	permanent		= 0;
	description 	= "¿Eres bueno? Luchando, quiero decir.";
};                       

FUNC INT Info_Kirgo_Good_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kirgo_What))
	{
		return 1;
	};
};

func VOID Info_Kirgo_Good_Info()
{
	AI_Output (other, self,"Info_Kirgo_Good_15_00"); //¿Eres bueno?
	AI_Output (self, other,"Info_Kirgo_Good_05_01"); //¿Luchando? ¡No llevo mucho haciéndolo, pero ya he ganado una pelea!
};

// **************************************
//				Fordern (Vorspiel)
// **************************************

instance Info_Kirgo_Charge(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Charge_Condition;
	information		= Info_Kirgo_Charge_Info;
	permanent		= 0;
	description 	= "¡Me gustaría desafiarte a combatir en la arena!";
};                       

FUNC INT Info_Kirgo_Charge_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo (hero,Info_Kirgo_What) && (Kapitel <= 1))	// Kapitelfix   ***Björn***
	{
		return 1;
	};
};

func VOID Info_Kirgo_Charge_Info()
{
	AI_Output (other, self,"Info_Kirgo_Charge_15_00"); //¡Me gustaría desafiarte a combatir en la arena!
	AI_Output (self, other,"Info_Kirgo_Charge_05_01"); //¿Qué? Pero yo no quiero luchar. ¿Por qué no nos tomamos una cerveza y charlamos del mundo exterior?
	Info_ClearChoices	(Info_Kirgo_Charge );
	Info_AddChoice		(Info_Kirgo_Charge,"¡No! ¡Quiero luchar ya!",Info_Kirgo_Charge_NOW);
	Info_AddChoice		(Info_Kirgo_Charge,"De acuerdo, entonces ¡dame una cerveza!",Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output (other, self,"Info_Kirgo_Charge_NOW_15_00"); //¡No! ¡Quiero luchar ya!
	AI_Output (self, other,"Info_Kirgo_Charge_NOW_05_01"); //En ese caso... Cuando tú quieras.
	Info_ClearChoices	(Info_Kirgo_Charge );
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_00"); //De acuerdo, entonces ¡dame una cerveza!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_01"); //¡Aquí tienes!
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_02"); //¡Gracias! Me temo que no puedo contarte mucho del mundo exterior. Me tuvieron encerrado en un agujero oscuro casi dos meses antes de arrojarme aquí.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_03"); //Qué pena... Oh, bueno, da igual... Oye, tienes buen aspecto para haber estado encerrado dos meses.
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_04"); //Me gustaría seguir así.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_05"); //Entonces, ¿por qué insistes en luchar con uno de nosotros?
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_06"); //¡Quiero que me reconozcan en el campamento!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_07"); //¿Hablas de Scatty? Hm, es uno de los hombres más influyentes en el Anillo Exterior... Tal vez logres impresionarle si me vences...
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_08"); //Pero si quieres impresionarle, tienes que ganar a Kharim. ¡Lo que pasa es que tal vez sea demasiado bueno para ti!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_09"); //¡Dime si aún quieres luchar conmigo! Pero no me gustará tumbarte.
	
	CreateInvItem (other, ItFoBeer);
	B_GiveInvItems (other, self, ItFoBeer, 1);
	
	self.npctype = npctype_FRIEND;
	
	Info_ClearChoices	(Info_Kirgo_Charge );
};

// **************************************
//				Fordern REAL
// **************************************
	var int Kirgo_Charged;
// **************************************

instance Info_Kirgo_ChargeREAL(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_ChargeREAL_Condition;
	information		= Info_Kirgo_ChargeREAL_Info;
	permanent		= 0;
	description 	= "Luchemos... ¿Estás preparado?";
};                       

FUNC INT Info_Kirgo_ChargeREAL_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kirgo_Charge) &&  (Kapitel <= 1))	//Kapitelfix	****Björn****
	{
		return 1;
	};
};

func VOID Info_Kirgo_ChargeREAL_Info()
{
	AI_Output (other, self,"Info_Kirgo_ChargeREAL_15_00"); //Luchemos... ¿Estás preparado?
	AI_Output (self, other,"Info_Kirgo_ChargeREAL_05_01"); //¡Sígueme!
	
	AI_StopProcessInfos	( self );
	
	Kirgo_Charged = TRUE;
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kirgo_InArena (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_InArena_Condition;
	information		= Info_Kirgo_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kirgo_InArena_Condition()
{
	if ( (Kirgo_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kirgo_InArena_Info()
{
	if (Kapitel <= 1)			//Fix für spätere Kapitel ****Björn****
	{
		AI_Output (self, other,"Info_Kirgo_InArena_05_00"); //Vale, vamos a ello. ¡Que gane el mejor!
		
		AI_StopProcessInfos	( self );
			
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_5_LetsForgetOurLittleFight"); //¡Olvidemos nuestra discusión sin importancia! ¿Vale?		
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};

};


















