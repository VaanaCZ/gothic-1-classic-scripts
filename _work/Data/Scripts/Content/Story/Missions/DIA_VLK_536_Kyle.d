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
	AI_Output (self, other,"DIA_Kyle_HutRage_10_00"); //�Cu�ntas veces os he dicho que no atraves�is mi caba�a corriendo, bastardos?
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
	description		= "�Qu� problema tienes?";
};

FUNC INT DIA_Kyle_Problem_Condition()
{	
	return 1;	
};

FUNC VOID DIA_Kyle_Problem_Info()
{
	AI_Output (other, self,"DIA_Kyle_Problem_15_00"); //�Cu�l es tu problema?
	AI_Output (self, other,"DIA_Kyle_Problem_10_01"); //�D�jame en paz, t�o! �Todo el mundo es un problema para m�!
	AI_Output (self, other,"DIA_Kyle_Problem_10_02"); //Todo empez� cuando constru� mi caba�a.
	AI_Output (self, other,"DIA_Kyle_Problem_10_03"); //Me dijeron que no la levantara cerca de la zanja.
	AI_Output (self, other,"DIA_Kyle_Problem_10_04"); //Pero ninguno de esos bastardos me advirti� lo que pasar�a si lo hac�a.
	AI_Output (self, other,"DIA_Kyle_Problem_10_05"); //A mi regreso de la mina hace unos d�as, ten�a una segunda puerta.
	AI_Output (self, other,"DIA_Kyle_Problem_10_06"); //Cerdos. Los odio. No tengo palabras para expresar el odio que siento hacia ellos.
	AI_Output (self, other,"DIA_Kyle_Problem_10_07"); //Ahora todo el mundo atraviesa mi caba�a corriendo. Todos los idiotas.
};

	
	
	
	
	


















