// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Cavalorn_Exit (C_INFO)
{
	npc			= STT_336_Cavalorn;
	nr			= 999;
	condition	= DIA_Cavalorn_Exit_Condition;
	information	= DIA_Cavalorn_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cavalorn_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Cavalorn_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Jäger
// **************************************************

INSTANCE DIA_cavalorn_Hunter (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Hunter_Condition;
	information		= DIA_cavalorn_Hunter_Info;
	permanent		= 0;
	description		= "¿Qué estás haciendo aquí?"; 
};

FUNC INT DIA_cavalorn_Hunter_Condition()
{	
	return 1;	
};

FUNC VOID DIA_cavalorn_Hunter_Info()
{
	AI_Output (other, self,"DIA_cavalorn_Hunter_15_00"); //¿Qué estás haciendo aquí?
	AI_Output (self, other,"DIA_cavalorn_Hunter_12_01"); //Soy un cazador; sobre todo de carroñeros.
	
};

// **************************************************
// 						Lehrer
// **************************************************

INSTANCE DIA_cavalorn_Lehrer (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Lehrer_Condition;
	information		= DIA_cavalorn_Lehrer_Info;
	permanent		= 1;
	description		= "¿Puedes enseñarme algo acerca de la caza?"; 
};

FUNC INT DIA_cavalorn_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return 1;	
	};
};

FUNC VOID DIA_cavalorn_Lehrer_Info()
{
	if (log_cavalorntrain == FALSE)
	{
		Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
		B_LogEntry		(GE_TeacherOW,"Cavalorn es cazador. Puede enseñarme SIGILO y TIRO CON ARCO. Vive en una cabaña situada entre los Campamentos Viejo y Nuevo.");
		log_cavalorntrain = TRUE;
	};
	AI_Output (other, self,"DIA_cavalorn_Lehrer_15_00"); //¿Puedes enseñarme algo del arte de cazar?
	AI_Output (self, other,"DIA_cavalorn_Lehrer_12_01"); //Eso depende de lo que quieras saber.
	
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
	Info_AddChoice		(DIA_cavalorn_Lehrer,DIALOG_BACK															,DIA_cavalorn_Lehrer_BACK);

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_2,		LPCOST_TALENT_BOW_2,0)	,DIA_cavalorn_Lehrer_Bow_2);
	};

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_1,		LPCOST_TALENT_BOW_1,0)	,DIA_cavalorn_Lehrer_Bow);
	};
	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)	,DIA_cavalorn_Lehrer_Schleichen);
	};
};

func void DIA_cavalorn_Lehrer_BACK()
{
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
};

func void DIA_Cavalorn_Lehrer_Bow()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Bow_15_00"); //¿Puedes enseñarme a manejar mejor el arco?
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_01"); //A un principiante no le resulta difícil mejorar. Depende de tu postura.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_02"); //Separa las piernas, pon ambos brazos a la misma altura, contén el aliento y ¡dispara!
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_03"); //Si alcanzas algunas partes del cuerpo no necesitarás más que un disparo. Al ser un principiante no tienes muchas posibilidades de alcanzar estas partes.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_04"); //Pero si tienes presente lo que te he dicho, la  próxima vez tu puntería será mejor.
	};
};

func void DIA_Cavalorn_Lehrer_Schleichen()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //Quiero aprender a moverme con sigilo.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //Excelente idea. Eso es muy importante a la hora de entrar en cabañas para atacar a alguien por detrás.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //Si doblas las rodillas al andar, podrás ver mejor el suelo y controlarás mejor tu cuerpo.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //¡Pero en esta postura resultarás fácil de identificar; haz que nadie te vea cuando te estés moviendo con sigilo!
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Ten presente lo que te he dicho y, sobre todo, ¡que no te pillen!
	};
};
func void DIA_Cavalorn_Lehrer_Bow_2()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //Ya eres un buen cazador. Ahora debes adquirir los conocimientos que te faltan.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //Para convertirte en un buen tirador, tienes que dejar de intentar convertirte en uno.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Descubre las leyes de ojo, la tensión, la trayectoria y el blanco. Estate siempre alerta y preparado.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //Ya has conseguido un gran dominio de la técnica. Ahora vete a aplicar tus conocimientos y habilidades.
	};
};
/*------------------------------------------------------------------------
						BOGEN KAUFEN						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_SELLBOW (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_SELLBOW_Condition;
	information		= STT_336_cavalorn_SELLBOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Dónde puedo conseguir un arco?"; 
};

FUNC int  STT_336_cavalorn_SELLBOW_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_SELLBOW_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //¿Dónde puedo conseguir un arco?
	AI_Output (self, other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //Aquí. Yo vendo los mejores arcos del Campamento Viejo.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Cavalorn comercia con ARCOS y FLECHAS. Lo encontraré de camino al Campamento Nuevo, en el cañón situado al oeste del Campamento Viejo.");
};  

/*------------------------------------------------------------------------
						TRADE						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_TRADE (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_TRADE_Condition;
	information		= STT_336_cavalorn_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Muéstrame tus mercancías."; 
	trade 			= 1;
};

FUNC int  STT_336_cavalorn_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero,STT_336_cavalorn_SELLBOW))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_TRADE_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_TRADE_Info_15_01"); //Déjame ver tu mercancía.
	
};  








