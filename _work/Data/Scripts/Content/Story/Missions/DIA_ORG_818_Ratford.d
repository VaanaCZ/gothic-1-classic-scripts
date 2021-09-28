// **************************************************
//						 EXIT 
// **************************************************

instance  Org_818_Ratford_Exit (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 999;
	condition	= Org_818_Ratford_Exit_Condition;
	information	= Org_818_Ratford_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_818_Ratford_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					Wrong Way
// **************************************************

instance  Org_818_Ratford_WrongWay (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WrongWay_Condition;
	information	= Org_818_Ratford_WrongWay_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_818_Ratford_WrongWay_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WrongWay_Info()
{
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_00"); //¡Eh, tú!
	AI_Output (other, self,"Org_818_Ratford_WrongWay_15_01"); //¿Qué es lo que quieres?
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_02"); //Quiero darte un aviso. Si sigues así, te inmiscuirás en nuestro terreno.
};

// **************************************************
//					Was jagt ihr
// **************************************************

instance  Org_818_Ratford_WhatGame (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhatGame_Condition;
	information	= Org_818_Ratford_WhatGame_Info;
	permanent	= 0;
	description = "¿Qué cazáis?";
};                       

FUNC int  Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhatGame_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_00"); //¿Qué es lo cazáis?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_01"); //Sobre todo carroñeros. Tienen mucha carne en los huesos. Además, no es muy difícil pillarlos... Una vez sabes cómo hacerlo.
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_02"); //¿De verdad? ¿Cómo?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_03"); //Pregúntale a mi amigo Drax, aquí presente; él sabe más que nadie sobre estas cosas.
};

// **************************************************
//					Warum gefährlich
// **************************************************

instance  Org_818_Ratford_WhyDangerous (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhyDangerous_Condition;
	information	= Org_818_Ratford_WhyDangerous_Info;
	permanent	= 0;
	description = "¿Por qué es tan peligrosa esta zona?";
};                       

FUNC int  Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhyDangerous_15_00"); //¿Por qué es tan peligrosa esta zona?
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_01"); //Acabas de llegar, ¿verdad? En la colonia hay zonas diferenciadas que son mas o menos peligrosas.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_02"); //Los senderos entre los campamentos son bastante seguros. Pero incluso en ellos podrías encontrarte con algunos lobos que te considerarán una presa fácil.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_03"); //Y eso es precisamente lo que eres hasta que consigas un arma y armadura adecuadas.
};

// **************************************************
//					Wo Ausrüstung
// **************************************************

instance  Org_818_Ratford_WoEquipment (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoEquipment_Condition;
	information	= Org_818_Ratford_WoEquipment_Info;
	permanent	= 0;
	description = "¿Dónde puedo conseguir mejor equipo?";
};                       

FUNC int  Org_818_Ratford_WoEquipment_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_WoEquipment_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoEquipment_15_00"); //¿Dónde puedo conseguir ese equipo?
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_01"); //El lugar más cercano es el Campamento Viejo.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_02"); //Pero puedes conseguirlo más barato en nuestro Campamento Nuevo... Si es que conoces a la gente apropiada.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_03"); //Si vas al Campamento Viejo, pregunta por Mordrag. Es uno de los nuestros. A cambio de un poco de mineral te venderá la mercancía apropiada.
	
	Log_CreateTopic	(GE_TraderOC, LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"El bandido Mordrag vende todo tipo de bienes por precios razonables en el Campamento Viejo.");
};

// **************************************************
//					More Locations
// **************************************************

instance  Org_818_Ratford_MoreLocations (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_MoreLocations_Condition;
	information	= Org_818_Ratford_MoreLocations_Info;
	permanent	= 0;
	description = "Háblame más de las zonas de la colonia.";
};                       

FUNC int  Org_818_Ratford_MoreLocations_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_MoreLocations_Info()
{
	AI_Output (other, self,"Org_818_Ratford_MoreLocations_15_00"); //Cuéntame más cosas acerca de las zonas de la colonia.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_01"); //Si viajas entre los campamentos, necesitarás un mapa para distinguir los senderos de los callejones sin salida.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_02"); //Los callejones sin salida te llevan a desfiladeros peligrosos en los que te encontrarás criaturas a las que es mejor evitar.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_03"); //No entres en las viejas ruinas. Hay muchas por aquí. La mayoría de ellas son viejas fortificaciones que datan de los tiempos de la primera guerra orca. Algunas son viviendas orcas abandonadas.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_04"); //En esas ruinas suele haber orcos... o criaturas aun peores. Yo en tu lugar me mantendría alejado de esos lugares, sobre todo de noche.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_05"); //Un consejo más... ¡no entres en el bosque!
};

// **************************************************
//					Wo Karte?
// **************************************************

instance Org_818_Ratford_WoKarte (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoKarte_Condition;
	information	= Org_818_Ratford_WoKarte_Info;
	permanent	= 0;
	description = "¿Dónde puedo conseguir un mapa?";
};                       

FUNC int Org_818_Ratford_WoKarte_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC void Org_818_Ratford_WoKarte_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_15_00"); //¿Dónde puedo conseguir un mapa?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_01"); //Pregunta en el Campamento Viejo. Ahí vive un cartógrafo.
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_02"); //¡Quizá puedas robar uno de sus mapas! ¡Si lo logras, coge uno para mí también!
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice   (Org_818_Ratford_WoKarte,"¡Si consigo llevármelos sin pagar, me llevaré todos los que pueda!",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice	 (Org_818_Ratford_WoKarte,"¿Por qué? ¿No vende los mapas?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //¡Si consigo llevármelos sin pagar, cogeré todos los que pueda!
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //¡Me caes bien! ¡Deberías considerar venirte al Campamento Nuevo! Si vas allí, pregunta por Lares. Él se ocupa de los nuevos. ¿Estoy seguro de que tendrá algún trabajo para ti!
	
	VAR C_NPC Lares; Lares = Hlp_GetNpc(ORG_801_LARES);
	Lares.aivar[AIV_FINDABLE]=TRUE;
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //¿Por qué? ¿Es que no vende los mapas? 
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //Si consigues suficientes pepitas para pagar por ellos...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

// **************************************************
//						Danke
// **************************************************

instance  Org_818_Ratford_Thanks (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 888;
	condition	= Org_818_Ratford_Thanks_Condition;
	information	= Org_818_Ratford_Thanks_Info;
	permanent	= 0;
	description = "Gracias por tu ayuda.";
};                       

FUNC int  Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Thanks_Info()
{
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_00"); //Gracias por tu ayuda.
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_01"); //¡No vayas a pensar que todo el mundo va a ser igual de amable, muchacho!
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_02"); //Puedo que no haya demasiado en los bolsillos de un recién llegado, pero algunos hasta llegarían a pegarte una paliza por una piqueta!
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_04"); //Lo tendré presente.
};











