// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Kyle_Exit (C_INFO)
{
	npc			= Vlk_536_Kyle;
	nr			= 999;
	condition	= DIA_Kyle_Exit_Condition;
	information	= DIA_Kyle_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kyle_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kyle_Exit_Info()
{
	Npc_SetRefuseTalk(self,120);	//wegen AUTO-Ansprechen
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Kyle_HutRage (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_HutRage_Condition;
	information		= DIA_Kyle_HutRage_Info;
	permanent		= 1;
	important		= 1;
};

FUNC INT DIA_Kyle_HutRage_Condition()
{	
	if ( (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Kyle_HutRage_Info()
{
	AI_Output (self, other,"DIA_Kyle_HutRage_10_00"); //¿Cuántas veces os he dicho que no atraveséis mi cabaña corriendo, bastardos?
};

// **************************************************
// 				Was ist dein Problem?
// **************************************************

INSTANCE DIA_Kyle_Problem (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_Problem_Condition;
	information		= DIA_Kyle_Problem_Info;
	permanent		= 1;
	description		= "¿Qué problema tienes?";
};

FUNC INT DIA_Kyle_Problem_Condition()
{	
	return 1;	
};

FUNC VOID DIA_Kyle_Problem_Info()
{
	AI_Output (other, self,"DIA_Kyle_Problem_15_00"); //¿Cuál es tu problema?
	AI_Output (self, other,"DIA_Kyle_Problem_10_01"); //¡Déjame en paz, tío! ¡Todo el mundo es un problema para mí!
	AI_Output (self, other,"DIA_Kyle_Problem_10_02"); //Todo empezó cuando construí mi cabaña.
	AI_Output (self, other,"DIA_Kyle_Problem_10_03"); //Me dijeron que no la levantara cerca de la zanja.
	AI_Output (self, other,"DIA_Kyle_Problem_10_04"); //Pero ninguno de esos bastardos me advirtió lo que pasaría si lo hacía.
	AI_Output (self, other,"DIA_Kyle_Problem_10_05"); //A mi regreso de la mina hace unos días, tenía una segunda puerta.
	AI_Output (self, other,"DIA_Kyle_Problem_10_06"); //Cerdos. Los odio. No tengo palabras para expresar el odio que siento hacia ellos.
	AI_Output (self, other,"DIA_Kyle_Problem_10_07"); //Ahora todo el mundo atraviesa mi cabaña corriendo. Todos los idiotas.
};

	
	
	
	
	


















