// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_SCAR_EXIT(C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 999;
	condition	= DIA_SCAR_EXIT_Condition;
	information	= DIA_SCAR_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SCAR_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_SCAR_Hello (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Hello_Condition;
	information	= DIA_SCAR_Hello_Info;
	permanent	= 0;
	description = "¿Quién eres?";
};                       

FUNC INT DIA_SCAR_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_Hello_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Hello_15_00"); //¿Quién eres?
	AI_Output (self, other,"DIA_SCAR_Hello_08_01"); //Me llaman Scar.
};

// ************************************************************
// 							What
// ************************************************************

INSTANCE DIA_SCAR_What (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_What_Condition;
	information	= DIA_SCAR_What_Info;
	permanent	= 0;
	description = "¿En qué trabajas?";
};                       

FUNC INT DIA_SCAR_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_What_Info()
{	
	AI_Output (other, self,"DIA_SCAR_What_15_00"); //¿En qué trabajas?
	AI_Output (self, other,"DIA_SCAR_What_08_01"); //Arto y yo hacemos que nadie vea a Gómez a menos que esté invitado.
	AI_Output (self, other,"DIA_SCAR_What_08_02"); //Y también hacemos que las mujeres no se inquieten.
};

// ************************************************************
// 							Frau
// ************************************************************

INSTANCE DIA_SCAR_Frau (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Frau_Condition;
	information	= DIA_SCAR_Frau_Info;
	permanent	= 0;
	description = "Cuando me metieron aquí, vi que traían a una mujer...";
};                       

FUNC INT DIA_SCAR_Frau_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_What))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_Frau_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Frau_15_00"); //Cuando me metieron aquí, vi que traían a una mujer junto a las mercancías.
	AI_Output (self, other,"DIA_SCAR_Frau_08_01"); //¿Y qué?
	AI_Output (other, self,"DIA_SCAR_Frau_15_02"); //¿Está ella aquí?
	AI_Output (self, other,"DIA_SCAR_Frau_08_03"); //Mira, déjame darte un consejo por si estás interesado en ella: olvídala.
	AI_Output (self, other,"DIA_SCAR_Frau_08_04"); //Acaba de llegar y Gómez la tiene encerrada en su alcoba.
	AI_Output (self, other,"DIA_SCAR_Frau_08_05"); //Cuando haya acabado con ella, tal vez la envíe abajo. Pero por ahora es SUYA, así que será mejor que te olvides de ella.
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_SCAR_PERM (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_PERM_Condition;
	information	= DIA_SCAR_PERM_Info;
	permanent	= 1;
	description = "¿Me puedes decir algo sobre Gómez?";
};                       

FUNC INT DIA_SCAR_PERM_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Frau))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_PERM_Info()
{	
	AI_Output (other, self,"DIA_SCAR_PERM_15_00"); //¿Me puedes decir algo sobre Gómez?
	AI_Output (self, other,"DIA_SCAR_PERM_08_01"); //Sólo necesitas saber que es el hombre más poderoso de la colonia.
	AI_Output (self, other,"DIA_SCAR_PERM_08_02"); //Consigue todo lo que quiere, y lo que de verdad quiere es poder.
};

