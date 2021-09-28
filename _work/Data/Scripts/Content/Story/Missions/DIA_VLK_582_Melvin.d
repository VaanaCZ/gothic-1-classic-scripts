// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Melvin_Exit (C_INFO)
{
	npc			= Vlk_582_Melvin;
	nr			= 999;
	condition	= DIA_Melvin_Exit_Condition;
	information	= DIA_Melvin_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Melvin_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Melvin_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Was machst du?
// **************************************************

INSTANCE DIA_Melvin_Hello (C_INFO)
{
	npc				= Vlk_582_Melvin;
	nr				= 1;
	condition		= DIA_Melvin_Hello_Condition;
	information		= DIA_Melvin_Hello_Info;
	permanent		= 0;
	description		= "¡Hola! No eres de este campamento, ¿verdad?";
};

FUNC INT DIA_Melvin_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Melvin_Hello_Info()
{
	AI_Output (other, self,"DIA_Melvin_Hello_15_00"); //¡Hola! Tú no eres de este campamento, ¿verdad?
	AI_Output (self, other,"DIA_Melvin_Hello_03_01"); //¡Bueno, ahora sí lo soy! Abandoné el Campamento Viejo hace una semana. Le dije a mi amigo Dusty que viniera conmigo, pero prefirió esperar.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"El cavador Melvin se ha unido a la Hermandad. Su amigo Dusty sigue en el Campamento Viejo, pero también está pensando en marcharse.");
};

// **************************************************
// 				Dusty getroffen
// **************************************************

INSTANCE DIA_Melvin_MetDusty (C_INFO)
{
	npc				= Vlk_582_Melvin;
	nr				= 1;
	condition		= DIA_Melvin_MetDusty_Condition;
	information		= DIA_Melvin_MetDusty_Info;
	permanent		= 0;
	description		= "Conozco a Dusty. Hablé con él un rato.";
};

FUNC INT DIA_Melvin_MetDusty_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Melvin_Hello)) && (Npc_KnowsInfo(hero,DIA_Dusty_Hello)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Melvin_MetDusty_Info()
{
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_00"); //Conozco a Dusty; hablé con él un rato.
	AI_Output (self, other,"DIA_Melvin_MetDusty_03_01"); //Si vuelves a verle, dile que fue una tontería quedarse ahí. Esto es diez veces mejor que sufrir los abusos de los guardias del Campamento Viejo.
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_02"); //Se lo diré si vuelvo a verle.
};


