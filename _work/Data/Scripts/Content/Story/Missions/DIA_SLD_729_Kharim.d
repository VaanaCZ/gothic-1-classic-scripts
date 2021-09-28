// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kharim_Exit (C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 999;
	condition		= Info_Kharim_Exit_Condition;
	information		= Info_Kharim_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Kharim_Exit_Condition()
{
	return 1;
};

func VOID Info_Kharim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Kharim_What(C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 1;
	condition		= Info_Kharim_What_Condition;
	information		= Info_Kharim_What_Info;
	permanent		= 0;
	description 	= "Soy nuevo aquí. ¿Quién eres?";
};                       

FUNC INT Info_Kharim_What_Condition()
{
	return 1;
};

func VOID Info_Kharim_What_Info()
{
	AI_Output (other, self,"Info_Kharim_What_15_00"); //Soy nuevo. ¿Quién eres?
	AI_Output (self, other,"Info_Kharim_What_09_01"); //¡Soy Kharim! ¡Debes haber llegado ahora mismo; si no, habrías oído hablar de mí!
	AI_Output (self, other,"Info_Kharim_What_09_02"); //Soy el mejor combatiente que ha habido nunca en este maldito campamento.
};

// **************************************
//				Fordern
// **************************************
	var int Kharim_Charged;
// **************************************

instance Info_Kharim_Charge(C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 2;
	condition		= Info_Kharim_Charge_Condition;
	information		= Info_Kharim_Charge_Info;
	permanent		= 1;
	description 	= "¡Te desafío! ¡Vayamos a la arena!";
};                       

FUNC INT Info_Kharim_Charge_Condition()
{
	if ( Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo(hero,Info_Kharim_What) && (Kharim_Charged != TRUE) && (Kapitel <= 1) ) // Kapitelfix ***Björn***
	{
		return 1;
	};
};

func VOID Info_Kharim_Charge_Info()
{
	AI_Output (other, self,"Info_Kharim_Charge_15_00"); //¡Te desafío! ¡Vamos a la arena!
	AI_Output (self, other,"Info_Kharim_Charge_09_01"); //¿TÚ? ¡Te voy a dar una buena tunda, muchacho!
	AI_Output (self, other,"Info_Kharim_Charge_09_02"); //¡Hazte un favor a ti mismo y piérdete!

	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Vale, vale, olvidémonos del asunto.",Info_Kharim_Charge_BACK);
	Info_AddChoice		(Info_Kharim_Charge,"Para no resultar herido, ¿eh, cobarde?",Info_Kharim_Charge_Insult);

};

func void Info_Kharim_Charge_BACK()
{
	AI_Output (other, self,"Info_Kharim_Charge_BACK_15_00"); //Vale, vale, olvídalo.
	
	AI_StopProcessInfos (self);
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_15_00"); //¿Para no hacerte daño, cobarde?
	AI_Output (self, other,"Info_Kharim_Charge_Insult_09_01"); //¿No se te ocurre nada mejor, chico?
	
	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"¡Estás aquí para tener la oportunidad de besar el trasero a Gómez!",Info_Kharim_Charge_Insult_GomezAss);
	Info_AddChoice		(Info_Kharim_Charge,"A ver qué tal esto: Tu madre se acostaba con carneros...",Info_Kharim_Charge_Insult_Goats);
	Info_AddChoice		(Info_Kharim_Charge,"No, no se me ocurre nada que puedas entender.",Info_Kharim_Charge_Insult_Stupid);
	Info_AddChoice		(Info_Kharim_Charge,"Tienes brazos delgados, pero es más fea tu jeta.",Info_Kharim_Charge_Insult_Face);
	Info_AddChoice		(Info_Kharim_Charge,"Vale, vale, olvidémonos del asunto.",Info_Kharim_Charge_BACK);
	
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult_Goats()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Goats_15_00"); //¿Como, por ejemplo, que tu madre fornica con cabras...?
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Goats_09_01"); //Sí, supongo que así es...
};

func void Info_Kharim_Charge_Insult_GomezAss()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_GomezAss_15_00"); //¡No has venido aquí más que para tener la oportunidad de besarle el culo a Gómez!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_01"); //¿CÓMO? ¡Gusano! ¡No sabes nada acerca de nosotros! ¡El Campamento Nuevo es INDEPENDIENTE de toda esa basura!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_02"); //Aparte de eso, no estoy aquí más que por una razón. Para zurrar a los listillos como tú.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_03"); //¡Será un placer para mí hacerte lo mismo! ¡Tu destino te aguarda en la arena!
	
	Kharim_Charged = TRUE;
	
	Info_ClearChoices	(Info_Kharim_Charge );
	AI_StopProcessInfos	( self );
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

func void Info_Kharim_Charge_Insult_Stupid()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Stupid_15_00"); //Meditémoslo. No, creo que no se me ocurre nada que tú pudieras entender.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Stupid_09_01"); //Tal vez deberías intentarlo.
};

func void Info_Kharim_Charge_Insult_Face()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Face_15_00"); //Al principio quería decir algo sobre tus patéticos brazos, pero luego vi tu fea cara.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Face_09_01"); //¡Me parece que ésta es tu última oportunidad de IRTE AL CUERNO!
};

// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kharim_InArena (C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 1;
	condition		= Info_Kharim_InArena_Condition;
	information		= Info_Kharim_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kharim_InArena_Condition()
{
	if ( (Kharim_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kharim_InArena_Info()
{
	if (Kapitel <= 1)				// Kapitelfix ***Björn***
	{
		AI_Output (self, other,"Info_Kharim_InArena_09_00"); //¡El dolor es cuestión de fuerza de voluntad!
		
		AI_StopProcessInfos	( self );
		
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_9_LetsForgetOurLittleFight"); //No me importaría olvidar esta pequeña discusión...	
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
	
	
};
