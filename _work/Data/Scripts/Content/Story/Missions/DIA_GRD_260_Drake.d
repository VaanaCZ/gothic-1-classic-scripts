// ************************	EXIT **************************

instance  Grd_260_Drake_Exit (C_INFO) //E1
{
	npc			=  Grd_260_Drake;
	nr			=  999;
	condition	=  Grd_260_Drake_Exit_Condition;
	information	=  Grd_260_Drake_Exit_Info;
	important	=  0;
	permanent	=  1;
	description	= DIALOG_ENDE;
};

FUNC int  Grd_260_Drake_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_260_Drake_Exit_Info()
{
	AI_Output			(other,	self,"Info_Exit_Info_15_01"); //Hasta la vista.
	AI_StopProcessInfos	( self );
};
/**************** GEFAHREN *********************/

INSTANCE  Grd_260_Drake_Gefahr (C_INFO)	//E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Gefahr_Condition;
	information		= Grd_260_Drake_Gefahr_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿A qué tengo que estar atento en la mina?";
};

FUNC INT  Grd_260_Drake_Gefahr_Condition()
{
		return (Npc_KnowsInfo (hero,Grd_260_Drake_Mine));
};

func VOID  Grd_260_Drake_Gefahr_Info()
{

	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_01");//¿A qué tengo que estar atento en la mina?
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//Sobre todo a los reptadores de la mina. Son bestias peligrosas.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//Tuvimos que abandonar unas cuantas cuevas por su culpa. También se han comido a unos cuantos cavadores.
	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//Háblame de los reptadores.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//Tengo la boca tan seca...
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//Tráeme una cerveza y te hablaré de los reptadores.


};
/**************** CRAWLER, MEHR	GEFAHREN INFOS *********************/

INSTANCE  Grd_260_Drake_Crawler_Okay (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Crawler_Okay_Condition;
	information		= Grd_260_Drake_Crawler_Okay_Info;
	important		= 0;
	permanent		= 0;
	description		= "(Dar cerveza)";
};

FUNC INT  Grd_260_Drake_Crawler_Okay_Condition()
{
	if (Npc_KnowsInfo (hero,Grd_260_Drake_Gefahr))
	{
			return 1;
	};
};
FUNC void Grd_260_Drake_Crawler_Okay_Info()
{
	if	( Npc_HasItems (hero,ItFobeer) )
	{
		AI_Output			(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");//¡Ten, bebe a mi salud!

		B_GiveInvItems		(hero, self, ItFoBeer, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,ItFobeer);

		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//Gracias. Bueno, los reptadores viven en grandes manadas, sobre todo en las cavernas laterales.
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//Todavía no nos han atacado en el pozo principal. Si te encuentras alguna vez con uno, ¡huye!
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//O apoya la espalda contra la pared. ¡De ese modo puedes tener una oportunidad!

		//Grd_260_Drake_Crawler_Okay.permanent = 0;
	}
	else
	{
		AI_Output			(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//¿Estás de broma? Vuelve cuando tengas cerveza.
   		Grd_260_Drake_Crawler_Okay.permanent = 1;
   };
};
// ***************** DIE MINE *****************************

instance  Grd_260_Drake_Mine (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Condition;
	information		= Grd_260_Drake_Mine_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Puedes contarme algo de la mina?";
};

FUNC int  Grd_260_Drake_Mine_Condition()
{
	return 1;
};
func void Grd_260_Drake_Mine_Info ()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Info_15_01");//¿Puedes contarme algo de la mina?
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_02");//Bueno, la parte en la que estamos es el pozo principal. Un sistema de pasarelas lleva hasta el fondo.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_03");//Y por todas partes se cava para extraer mineral. Pero tienes que tener cuidado, también hay allí muchos reptadores.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_04");//En el fondo está la fundición. Fundimos parte del mineral para usarlo aquí mismo.


};
// ***************** MEHR MINE *****************************
instance  Grd_260_Drake_Mine_Mehr (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Mehr_Condition;
	information		= Grd_260_Drake_Mine_Mehr_Info;
	important		= 0;
	permanent		= 0;
	description		= "¡Háblame más de la mina!";
};

FUNC int  Grd_260_Drake_Mine_Mehr_Condition()
{
	if ( Npc_KnowsInfo (hero, Grd_260_Drake_Mine) )
	{
		return 1;
	};
};
func void  Grd_260_Drake_Mine_Mehr_Info	()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//¡Cuéntame más cosas!
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//Si quieres saber más, ve a Viper. Él es el fundidor.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//O habla con Ian. Es el jefe y organiza todo en la mina.
	
};

// ***************** IAN *****************************
instance  Grd_260_Drake_Ian	(C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Ian_Condition;
	information		= Grd_260_Drake_Ian_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Dónde puedo encontrar a Ian?";
};

FUNC int  Grd_260_Drake_Ian_Condition()
{
	if !(Npc_KnowsInfo (hero,STT_301_IAN_HI)) && ( Npc_KnowsInfo (hero,	Grd_260_Drake_Mine_Mehr))
	{
		return TRUE;
	};

};
FUNC void  Grd_260_Drake_Ian_Info()
{
	AI_Output			(other,self,"Grd_260_Drake_Ian_Info_15_01");//¿Dónde puedo encontrar a Ian?
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_02");//Está en medio del pozo principal, junto al almacén.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_03");//Oh, una cosa más; conoces a Thorus, ¿no? ¡Olvídate de él!
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_04");//Sólo hay una persona que manda aquí, y es Ian. Él es el jefe.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_05");//Si te enfrentas a él, te enfrentarás a todos nosotros. ¿Te enteras?
};	 

/*------------------------------------------------------------------------
//						GARDEAUFNAHME								//
------------------------------------------------------------------------*/
instance Grd_260_Drake_GARDEAUFNAHME (C_INFO)
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_GARDEAUFNAHME_Condition;
	information		= Grd_260_Drake_GARDEAUFNAHME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_260_Drake_GARDEAUFNAHME_Condition()
{	
	if (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) 
	&& ( Npc_GetTrueGuild  (hero) == GIL_STT)
	&& (! Npc_KnowsInfo   (hero,Grd_264_Gardist_GARDEAUFNAHME))
	{
		return TRUE;
	};
};
func void  Grd_260_Drake_GARDEAUFNAHME_Info()
{
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //¡Oye, hiciste un buen trabajo con los reptadores! ¡Te mereces que se te admita en la guardia!
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //¡Ve al Campamento Viejo y pídeselo a Thorus!

	Log_CreateTopic (GE_BecomeGuard,LOG_NOTE);
	B_LogEntry (GE_BecomeGuard,"Debo hablar con Thorus tan pronto como haya vuelto con los huevos. Quizá él me deje unirme a la guardia.");
};

