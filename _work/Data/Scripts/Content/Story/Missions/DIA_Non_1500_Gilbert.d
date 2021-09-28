// ********************************
// 				EXIT
// ********************************

instance DIA_Gilbert_EXIT (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 999;
	condition	= DIA_Gilbert_EXIT_Condition;
	information	= DIA_Gilbert_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Gilbert_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Gilbert_First (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_First_Condition;
	information	= DIA_Gilbert_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Gilbert_First_Condition()
{
	if (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Gilbert_First_Info()
{
	AI_Output (self, other,"DIA_Gilbert_First_04_00"); //¿Qué estás haciendo aquí? ¡No suelo recibir muchos visitantes aquí arriba, je, je!
	AI_Output (self, other,"DIA_Gilbert_First_04_01"); //Has sido muy listo al encontrar mi escondite.
	
	B_GiveXP(XP_GilbertFound);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Gilbert_Hallo (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_Hallo_Condition;
	information	= DIA_Gilbert_Hallo_Info;
	permanent	= 1;
	description = "¿Qué estás haciendo aquí?";
};                       

FUNC int DIA_Gilbert_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Hallo_15_00"); //¿Qué estás haciendo aquí?
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_01"); //Estoy harto del Campamento Viejo. Tuve unos problemas con la gente de Gómez. Hace mucho tiempo de eso.
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_02"); //Supongo que nadie se acuerda ya de ello. Pero me quedo aquí. Hay demasiados tarugos circulando por el Campamento Viejo para mi gusto.
};




