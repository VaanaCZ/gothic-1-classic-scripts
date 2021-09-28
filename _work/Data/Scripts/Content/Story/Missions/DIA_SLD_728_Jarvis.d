// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Jarvis_EXIT (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_EXIT_08_00"); //�Vigila tu retaguardia!
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						First
// ************************************************************

INSTANCE DIA_Jarvis_First (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_First_Condition;
	information	= DIA_Jarvis_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Jarvis_First_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_First_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_First_08_00"); //�Tienes intenci�n de atravesar esta puerta?
	AI_Output (other, self,"DIA_Jarvis_First_15_01"); //�Tienes intenci�n de detenerme?
	AI_Output (self, other,"DIA_Jarvis_First_08_02"); //No, pero deber�as saber lo que te espera aqu�. �Esto no es como en el Campamento Viejo, ni tampoco como estar con los chalados de la secta!
	AI_Output (other, self,"DIA_Jarvis_First_15_03"); //�Y qu� es lo que me espera aqu�?
	AI_Output (self, other,"DIA_Jarvis_First_08_04"); //No hay ni guardias ni templarios que puedan protegerte. Cada uno a lo suyo; los �nicos que nos mantenemos unidos somos los mercenarios.
};

// ************************************************************
// 						S�ldner
// ************************************************************

INSTANCE DIA_Jarvis_SldInfo (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_SldInfo_Condition;
	information	= DIA_Jarvis_SldInfo_Info;
	permanent	= 0;
	description	= "�Qu� hacen los mercenarios?";
};                       

FUNC INT DIA_Jarvis_SldInfo_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_SldInfo_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_SldInfo_15_00"); //�Qu� es lo que hacen los mercenarios?
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_01"); //Nosotros... Somos los mercenarios de los magos del agua.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_02"); //Nuestro objetivo es escapar de aqu�. Estamos trabajando duro para conseguirlo y no tenemos planes de tom�rnoslo con calma como los tipos del Campamento Viejo, que se est�n limitando a vaguear y depender del trabajo de los cavadores.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_03"); //Y todos somos seguidores de Lee. Es un gran hombre. Es �l quien mantiene unido el campamento.
};

// ************************************************************
// 						Magier
// ************************************************************

INSTANCE DIA_Jarvis_Magier (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Magier_Condition;
	information	= DIA_Jarvis_Magier_Info;
	permanent	= 0;
	description	= "�Qu� hacen los magos?";
};                       

FUNC INT DIA_Jarvis_Magier_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_SldInfo))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Magier_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Magier_15_00"); //�Qu� es lo que hacen los magos?
	AI_Output (self, other,"DIA_Jarvis_Magier_08_01"); //Investigan las caracter�sticas del mineral que nuestros raspadores extraen en la mina.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_02"); //Por lo que yo s�, quieren hacer saltar por los aires el maldito mont�culo de mineral para librarnos de la Barrera.
	AI_Output (other, self,"DIA_Jarvis_Magier_15_03"); //Suena peligroso.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_04"); //Dijeron que no deb�amos preocuparnos.
};

// ************************************************************
// 						Erzhaufen
// ************************************************************

INSTANCE DIA_Jarvis_Erzhaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Erzhaufen_Condition;
	information	= DIA_Jarvis_Erzhaufen_Info;
	permanent	= 0;
	description	= "�Ten�is un mont�culo de mineral enorme aqu�?";
};                       

FUNC INT DIA_Jarvis_Erzhaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Erzhaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Erzhaufen_15_00"); //�As� que aqu� ten�is un enorme mont�culo de mineral?
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_01"); //Podr�a decirse que s�. Con eso podr�amos comprar a la mujer del rey.
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_02"); //Pero para nada queremos venderle el mineral a ese viejo cabr�n. �Lo que queremos es SALIR DE AQU�!
};

// ************************************************************
// 						Wo Haufen
// ************************************************************

INSTANCE DIA_Jarvis_WoHaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_WoHaufen_Condition;
	information	= DIA_Jarvis_WoHaufen_Info;
	permanent	= 0;
	description	= "�D�nde est� el mont�culo de mineral?";
};                       

FUNC INT DIA_Jarvis_WoHaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Erzhaufen))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_WoHaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_00"); //�D�nde est� el mont�culo de mineral?
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_01"); //Quieres ver el mont�culo de mineral, �eh? Hay un agujero en el centro de la cueva, y all� es donde echan el mineral.
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_02"); //Pero no vas a poder siquiera acercarte a �l. Los magos y nuestra gente lo vigilan d�a y noche.
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_03"); //Sent�a curiosidad.
};

// ************************************************************
// 						Rest
// ************************************************************

INSTANCE DIA_Jarvis_Rest (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_Rest_Condition;
	information	= DIA_Jarvis_Rest_Info;
	permanent	= 0;
	description	= "�Qu� hay del resto de la gente?";
};                       

FUNC INT DIA_Jarvis_Rest_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Rest_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Rest_15_00"); //�Y qu� hay de la dem�s gente?
	AI_Output (self, other,"DIA_Jarvis_Rest_08_01"); //Todos son delincuentes. El Campamento les importa un cuerno. Preferir�a tener a simples campesinos vigilando la puerta principal.
};

// ************************************************************
// 						PERM
// ************************************************************

INSTANCE DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 10;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= 1;
	description	= "�C�mo van las cosas actualmente?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_PERM_15_00"); //�C�mo van las cosas ahora mismo?
	AI_Output (self, other,"DIA_Jarvis_PERM_08_01"); //Los raspadores siguen recogiendo. Una vez hayan conseguido el mineral suficiente, haremos saltar el mont�culo por los aires.
};

/*------------------------------------------------------------------------
//							S�LDNERAUFNAHME									//
------------------------------------------------------------------------*/
instance Sld_728_Jarvis_AUFNAHMESOLDIER (C_INFO)
{
	npc				= Sld_728_Jarvis;
	condition		= Sld_728_Jarvis_AUFNAHMESOLDIER_Condition;
	information		= Sld_728_Jarvis_AUFNAHMESOLDIER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Sld_728_Jarvis_AUFNAHMESOLDIER_Condition()
{	
	if ( Npc_GetTrueGuild  (hero) == GIL_ORG) 
	&& ( (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS) )
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  Sld_728_Jarvis_AUFNAHMESOLDIER_Info()
{
	AI_GotoNpc (hero,self); 
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Oye, he o�do decir que se las has hecho pasar canutas a los reptadores de la mina.
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Lee deber�a estar m�s que dispuesto a aceptarte entre los mercenarios. Ve a hablar con �l.

	self.flags = 0;		// Immortal-Flag l�schen

	Log_CreateTopic (GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry (GE_BecomeMercenary,"Deber�a hablar con Lee. Quiz� �l me deje unirme a los mercenarios.");
};






	


