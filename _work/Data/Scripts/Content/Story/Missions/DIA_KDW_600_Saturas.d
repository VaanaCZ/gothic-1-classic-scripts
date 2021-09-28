// ************************ EXIT **************************

instance  Info_Saturas_EXIT (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	999;
	condition	=	Info_Saturas_EXIT_Condition;
	information	=	Info_Saturas_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Saturas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Saturas_EXIT_Info()
{
	AI_Output			(self, other,"Info_Saturas_EXIT_14_01"); //¡Ojalá regreses indemne!

	AI_StopProcessInfos	(self);
};


// ************************ Intruder **************************

instance  Info_Saturas_Intruder (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	1;
	condition	=	Info_Saturas_Intruder_Condition;
	information	=	Info_Saturas_Intruder_Info;
	permanent	=	1;
	important	=	1;	
};                       

FUNC int  Info_Saturas_Intruder_Condition()
{
	if ( Npc_IsInState(self,ZS_Talk) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  Info_Saturas_Intruder_Info()
{
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //¿Qué estás haciendo aquí? ¡Tú aquí no pintas nada! ¡Largo!

	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Saturas_NEWS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NEWS_Condition;
	information	= Info_Saturas_NEWS_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "¡Traigo noticias importantes del campamento de la Hermandad!";
};

FUNC INT Info_Saturas_NEWS_Condition()
{	
	if ((CorAngar_SendToNC==TRUE) && Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_NEWS_Info()
{
	AI_Output			(other, self,"Info_Saturas_NEWS_15_01"); //¡Traigo noticias importantes del campamento de la Hermandad!
	AI_Output			(self, other,"Info_Saturas_NEWS_14_02"); //¡Si Cronos te ha dado permiso para visitarme, las noticias deben ser verdaderamente importantes!
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Saturas_YBERION (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_YBERION_Condition;
	information	= Info_Saturas_YBERION_Info;
	permanent	= 0;
	IMPORTANT = 0;
	description = "¡Y'Berion ha muerto!";
};

FUNC INT Info_Saturas_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_YBERION_Info()
{
	AI_Output			(other, self,"Info_Saturas_YBERION_15_01"); //¡Y'Berion ha muerto! Murió durante el rito de invocación del Durmiente.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_02"); //¿Y'Berion ha muerto? Eso son malas noticias, ¡malas de verdad!
	AI_Output			(self, other,"Info_Saturas_YBERION_14_03"); //¿Quién es ahora el líder de la Hermandad? ¿Ese embustero con ansias de poder de Cor Kalorn?
	AI_Output			(other, self,"Info_Saturas_YBERION_15_04"); //¡No! Kalorn le ha vuelto la espalda a la Hermandad. Se ha llevado consigo a algunos templarios. Nadie sabe dónde han ido.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_05"); //¿Por qué? ¡Él era el segundo en el escalafón tras Y'Berion!
	AI_Output			(other, self,"Info_Saturas_YBERION_15_06"); //Ciertos sucesos han convencido a los Gurús de que su senda no es la correcta. Parece ser que su dios es un malvado archidemonio.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_07"); //Uno de los Gurús casi me mata bajo la influencia del Durmiente, aunque yo acababa de salvarle la vida.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_08"); //Cor Kalorn era el único Gurú que no quería admitir la verdadera naturaleza de la infernal criatura; por eso ha abandonado el campamento del pantano.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_09"); //¡Entiendo! Bueno, al menos hemos tenido suerte en este asunto. Cor Angar es un buen hombre. Severo, pero honesto.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_10"); //Si hay alguien que pueda impedir que la Hermandad se desmorone tras esta catástrofe espiritual, es él.

	B_LogEntry		(CH3_EscapePlanNC,"Le he contado a Saturas los incidentes del campamento del pantano. Le satisface que Cor Angar haya asumido el liderazgo de la Hermandad.");
};

//***************************************************************************
//	Info BOOK
//***************************************************************************
instance Info_Saturas_BOOK (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BOOK_Condition;
	information	= Info_Saturas_BOOK_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "Tengo este almanaque...";
};

FUNC INT Info_Saturas_BOOK_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, ItWrFokusbuch))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BOOK_Info()
{
	AI_Output			(other, self,"Info_Saturas_BOOK_15_01"); //Tengo este almanaque...
	AI_Output			(other, self,"Info_Saturas_BOOK_15_02"); //Y'Berion lo utilizó para cargar el foco.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_03"); //Excelente. Para cargar los cinco focos de piedra necesitaremos el conocimiento contenido en este libro.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_04"); //¡Dame al almanaque!

	B_GiveInvItems		(hero,self,ItWrFokusbuch,1);
	Npc_RemoveInvItem	(self,ItWrFokusbuch);
	B_GiveXP  			(XP_DeliverBookToSaturas);
};

//***************************************************************************
//	Info FOCUS
//***************************************************************************
instance Info_Saturas_FOCUS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FOCUS_Condition;
	information	= Info_Saturas_FOCUS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Tengo este foco...";
};

FUNC INT Info_Saturas_FOCUS_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, Focus_1))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FOCUS_Info()
{
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_01"); //Tengo este foco...
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_02"); //Tienes en tus manos la llave que puede librarnos de todas nuestras cadenas.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_03"); //Es uno de los cinco focos de piedra que fueron utilizados para crear la Barrera Mágica.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_04"); //Y, con la ayuda del mismo poder de enfoque de estas piedras, derribaremos la gran muralla de energía.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_05"); //¿Pero no requerirá eso una gran cantidad de energía?
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_06"); //Cierto, pero a lo largo de todos estos años he ido reuniendo mineral de manera incansable, en lugar de dárselo a nuestros carceleros a cambio de lujos.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_07"); //Has de saber que cada pepita de mineral contiene cierta cantidad de energía mágica. Con la ayuda de la energía así reunida en el montículo de mineral podremos destruir la Barrera Mágica.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_08"); //Parece peligroso.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_09"); //La explosión sólo será de naturaleza mágica; sólo destruirá todo lo que haya sido modificado por la magia que hay dentro de la Barrera. Los seres humanos no corremos ningún peligro.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_10"); //Toma el foco. ¡Espero que te resulte de alguna utilidad para tus planes con respecto al montículo de mineral!

	B_GiveInvItems		(hero, self, Focus_1, 1);
	Npc_RemoveInvItem	(self, Focus_1);
	B_GiveXP  			(XP_DeliverFocusToSaturas);
};

//***************************************************************************
//	Info WHATNOW
//***************************************************************************
instance Info_Saturas_WHATNOW (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_WHATNOW_Condition;
	information	= Info_Saturas_WHATNOW_Info;
	permanent	= 0;
	important 	= 0;
	description = "¿Ahora qué vas a hacer con el foco y el almanaque?";
};

FUNC INT Info_Saturas_WHATNOW_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_FOCUS) && Npc_KnowsInfo(hero, Info_Saturas_BOOK))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_WHATNOW_Info()
{
	AI_Output			(other, self,"Info_Saturas_WHATNOW_15_01"); //¿Qué vas a hacer ahora con el foco y el almanaque?
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_03"); //Nada. ¡Primero necesitamos los otros cuatro focos de piedra!
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_04"); //Por desgracia, no tenemos ninguna de esas cuatro piedras mágicas.
};

//***************************************************************************
//	Info OFFER
//***************************************************************************
instance Info_Saturas_OFFER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_OFFER_Condition;
	information	= Info_Saturas_OFFER_Info;
	permanent	= 0;
	important 	= 0;
	description = "¡Estoy dispuesto a encontrar los otros cuatro focos de piedra para ti!";
};

FUNC INT Info_Saturas_OFFER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_WHATNOW))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_OFFER_Info()
{
	AI_Output			(other, self,"Info_Saturas_OFFER_15_01"); //¡Estoy dispuesto a encontrar para ti los cuatro focos de piedra restantes!
	AI_Output			(other, self,"Info_Saturas_OFFER_15_02"); //¡Después de todo, yo también deseo escapar de aquí algún día!
	AI_Output			(self, other,"Info_Saturas_OFFER_14_03"); //Debo advertirte que la búsqueda de las piedras será tan difícil como peligrosa.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_04"); //Dado que los conflictos con el Campamento Viejo crecen a cada día que pasa, tampoco puedo proporcionarte ningún mercenario.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_05"); //Estarás completamente solo.
	AI_Output			(other, self,"Info_Saturas_OFFER_15_06"); //Bueno... ¡Estoy acostumbrado a eso! Encontraré la manera de organizarlo todo.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_07"); //Tu confianza te honra, pero necesitarás algunos objetos que te ayuden.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_08"); //Toma este mapa. Es antiguo, pero en él verás los emplazamientos de los focos de piedra en el momento en que la Barrera fue creada.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_09"); //Toma también este pergamino de conjuro que te permitirá volver con mayor rapidez a nuestro campamento.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_10"); //Por último, tienes que hablar con Riordian. Es él quien elabora las pociones para el Campamento.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_11"); //Le encontrarás en su choza, aquí en el nivel superior.

	B_Story_BringFoci	();
};

//***************************************************************************
//	B_DeliverFocus
//***************************************************************************
func void B_DeliverFocus()
{
	//-------- 2. Fokus abliefern --------
	if 		(Saturas_BringFoci == 1)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_01"); //Hm, no está mal para empezar. Lo estás haciendo muy bien.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_02"); //Todavía falta encontrar tres focos de piedra para poder llevar a cabo nuestro plan.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_03"); //Ahora ve a buscar los focos de piedra restantes.
		Saturas_BringFoci = 2;	
		B_GiveXP  		(XP_DeliverSecondFocus);
	}

	//-------- 3. Fokus abliefern --------
	else if	(Saturas_BringFoci == 2)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_04"); //Excelente; éste es el segundo foco de piedra que nos traes.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_05"); //Nos acercamos más y más a nuestro objetivo.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_06"); //Ten valor y consigue los dos focos de piedra que faltan.
		Saturas_BringFoci = 3;	
		B_GiveXP  		(XP_DeliverThirdFocus);
	}
	
	//-------- 4. Fokus abliefern --------
	else if	(Saturas_BringFoci == 3)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_07"); //Increíble; ya tenemos cuatro focos de piedra en total.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_08"); //Ya sólo te queda uno para tenerlos todos.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_09"); //Ya le has prestado un gran servicio a nuestra comunidad. Obtén el foco de piedra que falta y pronto podremos liberarnos.
		Saturas_BringFoci = 4;	
		B_GiveXP  		(XP_DeliverFourthFocus);
	}
	
	//-------- 5. Fokus abliefern --------
	else if	(Saturas_BringFoci == 4)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_10"); //Espléndido; ya tenemos todos los focos de piedra.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_11"); //Tus hazañas tienen una importancia incalculable para nuestro campamento. Puedes estar seguro de mi eterna gratitud.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_12"); //Ahora ve a ver a Riordian. Él te dará algo por tus increíbles proezas.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_13"); //Habla también con Cronos, el guardián del mineral. Él te hará entrega de otro regalo de parte de nuestra comunidad.

		Saturas_BringFoci = 5;	
		B_GiveXP  			(XP_DeliverFifthFocus);

		B_LogEntry		(CH3_BringFoci,"He logrado encontrar los cuatro focos de piedra. Saturas está contento más allá de toda medida. Creo que en el Campamento Nuevo me deben un buen favor.");
		B_LogEntry		(CH3_BringFoci,"Los Magos del Agua Cronos y Riordian me han prometido una recompensa por recuperar los cuatro focos de piedra. Debo pasar a hacerles una visita.");

		
		// Aufhebung des Log_running_Status, wenn die Foki schon vorher abgegeben wurden, bevor SC die einzelnen Aufträge bekam.    ***Björn***
		
		Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	};
		
	//-------- Neuer Teleportzauber ? --------
	if ( !Npc_HasItems(hero, ItArScrollTeleport2) && (Saturas_BringFoci < 5) )	
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_14"); //Veo que has gastado el pergamino de teletransporte. Aquí tienes uno nuevo.
		CreateInvItem	(self,	ItArScrollTeleport2);
		B_GiveInvItems	(self, other, ItArScrollTeleport2, 1);
	};
};

//***************************************************************************
//	Info BRINGFOCUS2
//***************************************************************************
instance Info_Saturas_BRINGFOCUS2 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS2_Condition;
	information	= Info_Saturas_BRINGFOCUS2_Info;
	permanent	= 0;
	important	= 0;
	description = "¡He encontrado un foco en el cañón de los trolls!";
};

FUNC INT Info_Saturas_BRINGFOCUS2_Condition()
{	
	if ( Npc_HasItems(hero,focus_2) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS2_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS2_15_01"); //¡He encontrado un foco en el cañón del troll!

	B_LogEntry		(CH3_TrollCanyon,"El foco del cañón del troll está ahora a salvo con Saturas.");
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_2, 1);
	Npc_RemoveInvItem	(self,	focus_2);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS3
//***************************************************************************
instance Info_Saturas_BRINGFOCUS3 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS3_Condition;
	information	= Info_Saturas_BRINGFOCUS3_Info;
	permanent	= 0;
	important 	= 0;
	description = "¡He encontrado un foco en el fuerte de la montaña!";
};

FUNC INT Info_Saturas_BRINGFOCUS3_Condition()
{	
	if ( Npc_HasItems(hero,focus_3) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS3_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS3_15_01"); //¡He encontrado un foco en el fuerte de la montaña!

	B_LogEntry		(CH3_Fortress,"Saturas ha recibido de mí el foco del fuerte de la montaña.");
	Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_3, 1);
	Npc_RemoveInvItem	(hero,	focus_3);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS4
//***************************************************************************
instance Info_Saturas_BRINGFOCUS4 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS4_Condition;
	information	= Info_Saturas_BRINGFOCUS4_Info;
	permanent	= 0;
	important 	= 0;
	description = "¡He encontrado un foco en el monasterio en ruinas!";
};

FUNC INT Info_Saturas_BRINGFOCUS4_Condition()
{	
	if ( Npc_HasItems(hero,focus_4) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS4_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_01"); //¡He encontrado un foco en el monasterio en ruinas!
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_02"); //Gorn el mercenario se encontraba allí y me echó una mano.

	B_LogEntry		(CH3_MonasteryRuin,"Por fin puedo entregar a Saturas el foco del monasterio en ruinas.");
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_4, 1);
	Npc_RemoveInvItem	(hero,	focus_4);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS5
//***************************************************************************
instance Info_Saturas_BRINGFOCUS5 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS5_Condition;
	information	= Info_Saturas_BRINGFOCUS5_Info;
	permanent	= 0;
	important 	= 0;
	description = "¡He encontrado un foco bajo el anillo de piedra!";
};

FUNC INT Info_Saturas_BRINGFOCUS5_Condition()
{	
	if ( Npc_HasItems(hero,focus_5) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS5_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS5_15_01"); //¡He encontrado un foco bajo el círculo de piedras!

	B_LogEntry		(CH3_Stonehenge,"Le he entregado a Saturas el foco de la cripta situada bajo el círculo de piedras.");
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_5, 1);
	Npc_RemoveInvItem	(hero,	focus_5);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info ALLFOCI
//***************************************************************************
instance Info_Saturas_ALLFOCI (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ALLFOCI_Condition;
	information	= Info_Saturas_ALLFOCI_Info;
	permanent	= 0;
	important 	= 0;
	description = "¿Puedes hacer que explote el montículo de mineral?";
};

FUNC INT Info_Saturas_ALLFOCI_Condition()
{	
	if	(Saturas_BringFoci == 5)
	&&	(Kapitel < 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ALLFOCI_Info()
{
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_01"); //¿Puedes hacer saltar por los aires ya el montículo de mineral?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_02"); //Ya tenemos todos los artefactos necesarios para llevar a cabo nuestro plan.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_03"); //Pero la Barrera fue creada por doce magos.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_04"); //No hay magos suficientes en el Círculo del Agua para poder controlar las poderosas energías y guiarlas en el camino correcto.
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_05"); //¿Qué podemos hacer?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_06"); //Sé que ya has hecho mucho por nuestra comunidad; nuestra deuda de gratitud contigo es grande...
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_07"); //...pero, por el bien de todos los habitantes de la colonia, tengo que pedirte otro favor más.
};

//***************************************************************************
//	Info FAVOR
//***************************************************************************
instance Info_Saturas_FAVOR (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FAVOR_Condition;
	information	= Info_Saturas_FAVOR_Info;
	permanent	= 0;
	important 	= 0;
	description = "¿Un favor más?";
};

FUNC INT Info_Saturas_FAVOR_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_ALLFOCI))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FAVOR_Info()
{
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_01"); //¿Otro favor más?
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_02"); //Sí. Ve al Campamento Viejo e intenta que algunos Magos del Círculo del Fuego se unan a nuestra causa.
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_03"); //¿MAGOS DEL FUEGO? ¿Por qué iban a renunciar a sus cómodas vidas?
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_04"); //¡La destrucción de la Barrera les robaría su posición de privilegio!
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_05"); //Precisamente por esa razón DEBES llevar a cabo esta misión. Tú conoces a gente de todos los campamentos de la colonia.
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_06"); //Recuérdales a los Magos del Fuego los viejos tiempos en que estudiábamos juntos las artes de la magia.
};	

//***************************************************************************
//	Info ACCEPT
//***************************************************************************
instance Info_Saturas_ACCEPT (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ACCEPT_Condition;
	information	= Info_Saturas_ACCEPT_Info;
	permanent	= 0;
	important 	= 0;
	description = "¡De acuerdo, trataré de convencer a los Magos del Fuego!";
};

FUNC INT Info_Saturas_ACCEPT_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_FAVOR))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ACCEPT_Info()
{
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_01"); //¡Bueno, de acuerdo, intentaré convencer a los Magos del Fuego!
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_02"); //¡Pero no puedo prometerte nada! A mí me parece una misión casi imposible.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_03"); //Tienes que intentarlo. Si no lo logras, sólo quedará uno más...
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_04"); //Sólo uno...
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_05"); //¿...un QUÉ?
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_06"); //¡Olvídalo! ¡TIENES que lograrlo!
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_07"); //Aquí tienes una runa mágica. Entrégasela a Corristo, el Gran Mago del Círculo del Fuego, como prueba de nuestra buena fe.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_08"); //Con esto podrá teleportarse a esta sala cuando él quiera sin tener que pasar ante los guardias.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_09"); //Espero que convenzas de nuestras buenas intenciones a nuestros antiguos amigos.

	B_KapitelWechsel	(4);
};	







//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info AMBUSH
//---------------------------------------------------------------------
instance Info_Saturas_AMBUSH (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_AMBUSH_Condition;
	information	= Info_Saturas_AMBUSH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Saturas_AMBUSH_Condition()
{	
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_AMBUSH_Info()
{
	var C_NPC gorn;
	gorn = Hlp_GetNpc(PC_FIGHTER);
	AI_TurnToNpc		(gorn,hero);
	
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_01"); //Me alegra que estés de vuelta. ¡Ha ocurrido una cosa terrible!
	AI_Output			(hero,self,"Info_Saturas_AMBUSH_15_02"); //Deja que lo adivine; los guardias del Campamento Viejo han atacado la Mina Libre. ¿Acaso nadie los vio venir...?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_03"); //Un momento... ¿Cómo...? ...Ah, claro... ¡Te enteraste de ello en el Campamento Viejo!
	AI_Output	 		(self,hero,"Info_Saturas_AMBUSH_14_04"); //Gorn llegó aquí justo antes de que tú lo hicieras.
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_05"); //¿Qué es lo que habrá hecho que Gómez se atreva a llevar a cabo una acto tan agresivo?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_06"); //Debería darse cuenta de que una atrocidad así no puede conducir sino a la guerra.
};	

//---------------------------------------------------------------------
//	Info COLLAPSE
//---------------------------------------------------------------------
instance Info_Saturas_COLLAPSE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_COLLAPSE_Condition;
	information	= Info_Saturas_COLLAPSE_Info;
	permanent	= 0;
	important 	= 0;
	description = "¡La Vieja Mina se derrumbó en cuanto se filtró el agua!";
};

FUNC INT Info_Saturas_COLLAPSE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_COLLAPSE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_COLLAPSE_15_01"); //¡La Vieja Mina se ha derrumbado tras sufrir unas filtraciones de agua!
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_02"); //...Derrumbada... por supuesto... Entonces todo cobra sentido.
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_03"); //Gómez está entre la espada y la pared. Es más peligroso que nunca. ¡Ahora que no tiene nada que perder se atreverá a cualquier cosa!
};

//---------------------------------------------------------------------
//	Info MURDER
//---------------------------------------------------------------------
instance Info_Saturas_MURDER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_MURDER_Condition;
	information	= Info_Saturas_MURDER_Info;
	permanent	= 0;
	important 	= 0;
	description = "¡Gómez hizo que murieran todos los Magos del Fuego!";
};

FUNC INT Info_Saturas_MURDER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_MURDER_Info()
{
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_01"); //¡Gómez ha hecho asesinar a todos los Magos del Fuego!
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_02"); //¿QUE LOS HA HECHO ASESINAR? En el nombre de Beliar, ¿por qué iba a hacer algo así?
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_03"); //Estaban en contra del ataque a la Mina Libre y se oponían a Gómez.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_04"); //Entonces estamos condenados. Sin los otros seis magos nunca podremos controlar el poder concentrado del gigantesco montículo de mineral.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_05"); //Pero, a pesar de eso, te doy las gracias por darme este peligroso mensaje.

	B_GiveXP			(XP_ReportToSaturas);
	
	B_LogEntry			(CH4_Firemages,"Saturas no se alegró lo más mínimo cuando le conté los incidentes del Campamento Viejo. Suceda lo que suceda con su plan de fuga... tendrán que llevarlo a cabo SIN los Magos del Fuego.");
	Log_SetTopicStatus	(CH4_Firemages,	LOG_SUCCESS);
};



/*------------------------------------------------------------------------
							GILDENWECHSEL									
------------------------------------------------------------------------*/
instance  KDW_600_Saturas_NOMOREOC (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_NOMOREOC_Condition;
	information		= KDW_600_Saturas_NOMOREOC_Info;
	important		= 0;
	permanent		= 0;
	description		= "¡Me han desterrado del Campamento Viejo porque te he ayudado!"; 
};

FUNC int  KDW_600_Saturas_NOMOREOC_Condition()
{	
	if	Npc_KnowsInfo (hero,Info_Saturas_MURDER)
	&&	((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		return TRUE;
	};
};

FUNC void  KDW_600_Saturas_NOMOREOC_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_NOMOREOC_Info_15_01"); //¡He sido expulsado para siempre del Campamento Viejo por haberte ayudado!
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_02"); //¿Ya no formas parte del Campamento Viejo?
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Entonces te doy la bienvenida a nuestra comunidad.

	Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
	B_LogEntry			(CH4_BannedFromOC,"Tras ser expulsado del Campamento Viejo, Saturas me ha dado la bienvenida en el Nuevo.");
}; 

/*------------------------------------------------------------------------
							VOM GRD ZUM SLD									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_GOTOLEE (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_GOTOLEE_Condition;
	information		= KDW_600_Saturas_GOTOLEE_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Significa que los mercenarios aceptarán?"; 
};

FUNC int  KDW_600_Saturas_GOTOLEE_Condition()
{	
	if (oldHeroGuild == GIL_GRD)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_GOTOLEE_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_GOTOLEE_Info_15_01"); //¿Quiere eso decir que los mercenarios me acogerán?
	AI_Output			(self, other,"KDW_600_Saturas_GOTOLEE_Info_14_02"); //Habla con Lee. Él se encargará de ello. Luego vuelve a verme.

	B_LogEntry			(CH4_BannedFromOC,"Lee, el líder de los mercenarios, quiere hablar conmigo. Se supone que debo reunirme con él y volver después con Saturas."); 
};  
 
/*------------------------------------------------------------------------
							VON KDF ZU KDW									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_OATH (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_OATH_Condition;
	information		= KDW_600_Saturas_OATH_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Significa eso que ya pertenezco a los Magos del Agua?"; 
};

FUNC int  KDW_600_Saturas_OATH_Condition()
{	
	if (oldHeroGuild == GIL_KDF)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_OATH_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //¿Quiere eso decir que ahora pertenezco a la cofradía de los Magos del Agua?
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Todavía no. Primero tienes que prestar el juramento del Agua.
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_03"); //¡Pero si ya he prestado el juramento del Fuego!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_04"); //Hmmmm...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_05"); //¡Eso no quiere decir que vayas a romper tu juramento!
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_06"); //Esto... No comprendo.
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_07"); //Estás expandiendo tu juramento. ¡De ese modo te convertirás en un mago de ambos elementos!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_08"); //¡Entonces tendrás a tu disposición tanto la fuerza del Fuego como la sabiduría del Agua!

	B_LogEntry			(CH4_BannedFromOC,"Saturas me dejará unirme al Círculo del Agua sin que deba romper el juramento del Fuego."); 
};  

/*------------------------------------------------------------------------
//							KDWAUFNAHME									//
------------------------------------------------------------------------*/
instance KDW_600_Saturas_KDWAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_KDWAUFNAHME_Condition;
	information		= KDW_600_Saturas_KDWAUFNAHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Estoy listo para prestar juramento."; 
};

FUNC int  KDW_600_Saturas_KDWAUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_OATH))
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_KDWAUFNAHME_Info()
{
	
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Estoy preparado para prestar el juramento.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02"); //¡Vas a recibir la bendición del Agua, Siervo del Fuego!
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Ahora, pronuncia las palabras del juramento:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Juro por el poder de los dioses...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Juro por el poder de los dioses...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...y por el poder del Agua sagrada...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...y por el poder del Agua sagrada...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...que, de ahora en adelante, mis conocimientos y mis actos serán para siempre uno con el Agua.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...que, de ahora en adelante, mis conocimientos y mis actos serán para siempre uno con el Agua.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...hasta que mi cuerpo vuelva al reino de Beliar y la fuente de mi vida se seque.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...hasta que mi cuerpo vuelva al reino de Beliar y la fuente de mi vida se seque.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12"); //Con este juramento unes en tu interior el poder del Fuego y la bendición del Agua.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13"); //Ahora has unido lo que antes estaba separado. Que tu vida sea un presagio de la unificación de los elementos.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Lleva esta túnica en señal de tu unión con el Agua sagrada y con Adanos.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	B_LogEntry			(CH4_BannedFromOC,"Ya me he unido al Círculo del Agua. A partir de ahora tendré acceso a ambas escuelas de magia."); 
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);

	AI_StopProcessInfos	(self);
};
/*------------------------------------------------------------------------
						DIE MAGISCHEN KREISE							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_LESSON (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_LESSON_Condition;
	information		= KDW_600_Saturas_LESSON_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Puedes adiestrarme?"; 
};

FUNC int  KDW_600_Saturas_LESSON_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW) 
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_LESSON_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_LESSON_Info_15_01"); //¿Puedes instruirme?
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) <= 3)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_02"); //Tienes mucho que aprender. Te instruiré tan pronto como estés preparado.
	}
	else if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_03"); //Hay otro Círculo que aún no conoces. Te instruiré tan pronto como estés preparado.
	}
	else
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_04"); //¡Ya dominas el Quinto Círculo de Magia! Ya sabes todo lo que yo sé.
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_05"); //¡No queda nada que pueda enseñarte!
	};

	Log_CreateTopic		(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Saturas, el líder de los Magos del Agua, enseña los CÍRCULOS de magia. Siempre está en la estrella de cinco puntas del nivel superior.");
};  
//--------------------------------------------------------------------------
// 							DER ERSTE KREIS
//--------------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS1 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS1_Condition;
	information		= KDW_600_Saturas_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0); 
};

FUNC int  KDW_600_Saturas_KREIS1_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS1_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS1_Info_15_01"); //Estoy preparado para entrar en el Primer Círculo.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_02"); //Entrar en el primero de los Círculos mágicos conlleva el aprendizaje del manejo de las runas mágicas.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_03"); //Cada runa contiene la estructura de un conjuro mágico especial.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_04"); //Haciendo uso de tus poderes mágicos podrás ejecutar la magia de la runa.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_05"); //Pero, a diferencia de los pergaminos mágicos, que son al mismo tiempo fórmulas, el poder mágico de la runa asegura la integridad de la estructura del conjuro.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_06"); //Cada una de las runas es una fuente de poder mágico al que puedes recurrir en cualquier momento.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_07"); //Es tu propio poder mágico el que se gasta cuando haces uso de una runa, igual que ocurre con los pergaminos de conjuro.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_08"); //Según vayas entrando en los Círculos también irás aprendiendo a hacer uso de otras runas.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_09"); //Utiliza el poder de las runas para conocerte a ti mismo.
		KDW_600_Saturas_KREIS1.permanent = 0;
	};
};  
//---------------------------------------------------------------------
//						DER ZWEITE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS2_Condition;
	information		= KDW_600_Saturas_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0); 
};

FUNC int  KDW_600_Saturas_KREIS2_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS2_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS2_Info_15_01"); //Estoy preparado para entrar en el Segundo Círculo.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_02"); //Ya has aprendido a comprender las runas. Ahora ha llegado el momento de profundizar en esa comprensión.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_03"); //Cuando te unas al Segundo Círculo aprenderás los fundamentos de los más poderosos conjuros de combate y, por encima de todo, el secreto de la curación.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_04"); //Pero has de aprender muchas cosas si quieres reconocer los verdaderos secretos de la magia.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_05"); //Sabes que puedes hacer uso de cada runa todas las veces que quieras hasta que hayas agotado tus propios poderes.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_06"); //Pero, antes de actuar, piensa en el sentido de tus actos. Has obtenido poderes con los que podrás sembrar con facilidad el caos y la destrucción.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_07"); //Pero un verdadero mago sólo utiliza la magia cuando es necesario.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_08"); //Comprende primero la situación y entonces reconocerás el poder de las runas.
		KDW_600_Saturas_KREIS2.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER DRITTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS3 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS3_Condition;
	information		= KDW_600_Saturas_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0); 
};

FUNC int  KDW_600_Saturas_KREIS3_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 2)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS3_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS3_Info_15_01"); //¿Puedes enseñarme el Tercer Círculo?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_02"); //El Tercer Círculo de la Magia es uno de los pasos más importantes en la vida de un mago. Una vez alcanzado, dejas de ser un buscador.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_03"); //Ya has llegado lejos en el sendero de la magia. Has aprendido a utilizar las runas.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_04"); //Este conocimiento es la base del sendero que te queda por recorrer. Haz un uso ponderado de las runas.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_05"); //Puedes utilizar las runas o no hacerlo. Pero debes decidirte por una de estas posibilidades.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_06"); //Una vez hayas tomado una decisión, no dudes en utilizar tus poderes.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_07"); //Comprende tu sendero y reconocerás el poder de la decisión.
		KDW_600_Saturas_KREIS3.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER VIERTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS4 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS4_Condition;
	information		= KDW_600_Saturas_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0); 
};

FUNC int  KDW_600_Saturas_KREIS4_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS4_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS4_Info_15_01"); //Estoy preparado para entrar en el tercer Círculo.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_02"); //Ya has completado los tres primeros Círculos. Ahora ha llegado el momento de que aprendas los secretos de la magia.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_03"); //La magia de las runas se basa en la piedra. Son piedras mágicas, creadas con mineral mágico.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_04"); //Es el mismo mineral que se extrae en las minas. En los templos se dota a este mineral de fórmulas mágicas. Es allí donde las runas son transformadas en las herramientas de nuestro poder.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_05"); //Con las runas que ya controlas tienes la totalidad del saber de los templos del reino en las yemas de tus dedos.
		//AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_07"); //Comprende la magia y descubrirás el secreto del poder.
		KDW_600_Saturas_KREIS4.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							DER FÜNFTE KREIS							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_KREIS5 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS5_Condition;
	information		= KDW_600_Saturas_KREIS5_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,0); 
};

FUNC int  KDW_600_Saturas_KREIS5_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS5_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS5_Info_15_01"); //Estoy preparado para entrar en el Quinto Círculo.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 5, LPCOST_TALENT_MAGE_5))
	{
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_02"); //Sea. Te instruiré en el poder del Quinto Círculo.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_03"); //La Tormenta de fuego, la ola de hielo y el poder de destruir a los muertos vivientes son ahora hechizos cuyas runas puedes utilizar.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_04"); //Pero el conjuro más poderoso del Quinto Círculo es el Anillo de Muerte. Si en algún momento poseyeras esa runa, tendrías unos poderes peligrosos.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_05"); //Trata de utilizar esta clase de magia lo menos posible. Es un obsequio del dios de la oscuridad.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Ya has aprendido todo lo que yo puedo enseñarte.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_06"); //Expón tus propios límites y reconocerás tu verdadero poder.
		KDW_600_Saturas_KREIS5.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							SCHWERE ROBE								
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_HEAVYARMOR (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_HEAVYARMOR_Condition;
	information		= KDW_600_Saturas_HEAVYARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_SaturasHighRobe,VALUE_KDW_ARMOR_H); 
};

FUNC int  KDW_600_Saturas_HEAVYARMOR_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_HEAVYARMOR_Info()
{
	AI_Output				(other, self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01"); //Me gustaría vestir la Gran Túnica de Agua.
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) < 4)
	&& (Kapitel < 5)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02"); //Todavía no ha llegado el momento de que vistas la gran túnica.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03"); //La escasa cantidad de mineral que posees ni siquiera alcanza a cubrir los costes de fabricación.
	}
	else
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04"); //Ha llegado la hora. Eres digno de vestir la Gran Túnica de Agua.
		KDW_600_Saturas_HEAVYARMOR.permanent = 0;

		B_GiveInvItems		(hero,self,	ItMinugget,VALUE_KDW_ARMOR_H);
		CreateInvItem		(hero,		KDW_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
	};
}; 

//---------------------------------------------------------------------
//	Info NOWSLD
//---------------------------------------------------------------------
instance Info_Saturas_NOWSLD (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NOWSLD_Condition;
	information	= Info_Saturas_NOWSLD_Info;
	permanent	= 0;
	important	= 0;
	description = "Lee me ha admitido en los mercenarios.";
};

FUNC INT Info_Saturas_NOWSLD_Condition()
{	
	if	Npc_KnowsInfo(hero, Sld_700_Lee_CHANGESIDE)
	{
		return TRUE;
	}; 
};

FUNC VOID Info_Saturas_NOWSLD_Info()
{
	AI_Output			(hero,self,"Info_Saturas_NOWSLD_15_01"); //Lee me ha admitido entre los mercenarios.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_02"); //Espléndido. Excelente. Ahora formas oficialmente parte de nuestra comunidad.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_03"); //¡Bienvenido!

	B_LogEntry			(CH4_BannedFromOC,"Saturas me ha dado la bienvenida oficialmente como mercenario.");
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);	
};

//---------------------------------------------------------------------
//	Info XARDAS
//---------------------------------------------------------------------
instance Info_Saturas_XARDAS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDAS_Condition;
	information	= Info_Saturas_XARDAS_Info;
	permanent	= 0;
	important	= 0;
	description = "Cuando me enviaste a los Magos del Fuego, mencionaste a ALGUIEN...";
};

FUNC INT Info_Saturas_XARDAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_COLLAPSE)
	&&	Npc_KnowsInfo(hero, Info_Saturas_MURDER)
	{		 										//***Björn***>

		if( (Npc_GetTrueGuild(hero)!=GIL_GRD)  &&  (Npc_GetTrueGuild(hero)!=GIL_KDF)  )
		{
			return TRUE;
		};

/*												
		if 		(oldHeroGuild==GIL_GRD)
		{
			if (Npc_GetTrueGuild(hero)==GIL_SLD)
			{
				return TRUE;
			};
		}
		else if (oldHeroGuild==GIL_KDF)
		{
			if (Npc_GetTrueGuild(hero)==GIL_KDW)
			{
				return TRUE;
			};
		}
		else
		{
			return TRUE;
		}; 											<***Björn***
*/												

	};	
};

FUNC VOID Info_Saturas_XARDAS_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_01"); //Cuando me enviaste a ver a los Magos del Fuego, dijiste que había... ALGUIEN.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_02"); //Bueno, esperaba que pudiéramos conseguirlo sin su ayuda, pero tal y como se están desarrollando las cosas...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_03"); //¿De quién se trata?
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_04"); //¡De acuerdo, de acuerdo!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_05"); //Hace muchos, muchos años...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_06"); //¡Dame la versión resumida, por favor!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_07"); //¡Ten paciencia! Bueno, hace mucho, cuando los doce magos creamos la Barrera, nuestros poderes mágicos estaban dirigidos y controlados por un decimotercer mago.
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_08"); //¿Un decimotercer mago? ¡Creí que no había más que doce!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_09"); //Eso es lo que piensa la mayoría de la gente que no presenció los primeros días de la colonia.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_10"); //El decimotercer mago era nuestro líder. Todo esto ocurrió antes de que nos dividiéramos en los Círculos del Agua y el Fuego.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_11"); //Pero abandonó el Campamento Viejo, que antes era el único de la colonia.
};

//---------------------------------------------------------------------
//	Info XARDASWHO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHO_Condition;
	information	= Info_Saturas_XARDASWHO_Info;
	permanent	= 0;
	important 	= 0;
	description = "¿Cómo se llama el decimotercer mago?";
};

FUNC INT Info_Saturas_XARDASWHO_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHO_15_01"); //¿Cómo se llamaba este decimotercer mago?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_02"); //Su nombre es Xardas. ¡Ya casi nadie recuerda las viejas historias acerca de él!
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_03"); //¡Las que le llaman simplemente el NIGROMANTE!
};

//---------------------------------------------------------------------
//	Info XARDASWHY
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHY (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHY_Condition;
	information	= Info_Saturas_XARDASWHY_Info;
	permanent	= 0;
	important 	= 0;
	description = "¿Por qué se marchó del Campamento Viejo?";
};

FUNC INT Info_Saturas_XARDASWHY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHY_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_01"); //¿Por qué abandonó el Campamento Viejo?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_02"); //Había empezado a investigar la invocación de criaturas mágicas y muertos vivientes.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_03"); //Gómez no era el único que empezó a preocuparse. Casi todos los demás magos también se oponían a él y a sus actos impíos.
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_04"); //¿Qué ocurrió entonces?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_05"); //A diferencia de Gómez, él no era un asesino, así que evitó el conflicto y se marchó.
};

//---------------------------------------------------------------------
//	Info XARDASWHERE
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHERE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHERE_Condition;
	information	= Info_Saturas_XARDASWHERE_Info;
	permanent	= 0;
	important 	= 0;
	description = "¿Dónde se encuentra este mago ahora?";
};

FUNC INT Info_Saturas_XARDASWHERE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHERE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHERE_15_01"); //¿Dónde se encuentra hoy este mago?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_02"); //Vive aislado en su torre en medio de las tierras orcas.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_03"); //Ése es el extremo sur de la colonia.
};

//---------------------------------------------------------------------
//	Info XARDASHELP
//---------------------------------------------------------------------
instance Info_Saturas_XARDASHELP (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASHELP_Condition;
	information	= Info_Saturas_XARDASHELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "¡Iré hasta Xardas y le pediré ayuda!";
};

FUNC INT Info_Saturas_XARDASHELP_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHO)
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHY) 
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHERE) 
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASHELP_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_01"); //¡Iré a ver a Xardas y pediré su ayuda!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_02"); //Es el único que puede ayudarnos ahora.
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_03"); //Si no conoce ninguna salida o no quiere ayudarnos...
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_04"); //¡LO HARÁ!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_05"); //Hay otro problema...
	
	B_Story_FindXardas	();
};

//---------------------------------------------------------------------
//	Info XARDASPROBLEM
//---------------------------------------------------------------------
instance Info_Saturas_XARDASPROBLEM (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASPROBLEM_Condition;
	information	= Info_Saturas_XARDASPROBLEM_Info;
	permanent	= 0;
	important 	= 0;
	description = "¿Un problema?";
};

FUNC INT Info_Saturas_XARDASPROBLEM_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASHELP)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_01"); //¿Un problema?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_02"); //Sí. A lo largo de los años hemos intentado comunicarnos varias veces con Xardas.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_03"); //Pero parece que prefiere no ser molestado.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_04"); //¿Qué quieres decir con eso?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_05"); //Ninguno de los mensajeros enviado a su torre regresó jamás.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_06"); //Tendrás que encontrar el modo de superar a sus criaturas.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_07"); //¡Parece que esto va a ser interesante!
	
	B_LogEntry			(CH4_FindXardas,"Saturas me ha advertido acerca de las criaturas mágicas de Xardas, el Nigromante. Hay escritos acerca de los peligros y debilidades de estas criaturas en la biblioteca de los Magos del Agua. Debo dedicar algún tiempo a echar un vistazo en ella.");	
};

//---------------------------------------------------------------------
//	Info XARDASGO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASGO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASGO_Condition;
	information	= Info_Saturas_XARDASGO_Info;
	permanent	= 0;
	important 	= 0;
	description = "¿Cómo superaré a sus criaturas?";
};

FUNC INT Info_Saturas_XARDASGO_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASPROBLEM)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASGO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_01"); //¿Cómo conseguiré superar a sus criaturas?
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_02"); //¡Si lo supiera, te lo diría!
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_03"); //Te aconsejaría que llevases a cabo algunas investigaciones en nuestra biblioteca.
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_04"); //Puede que en los antiguos libros encuentres algo acerca de las fortalezas y debilidades de las criaturas invocadas mágicamente.
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_05"); //Buscaré en la biblioteca. Y no te preocupes...
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_06"); //¡Volveré!

	B_LogEntry			(CH4_FindXardas,"Hay escritos acerca de los peligros y debilidades de estas criaturas en la biblioteca de los Magos del Agua. Debo dedicar algún tiempo a echar un vistazo en ella.");
	
};

/*------------------------------------------------------------------------
//	TIMESUP- Xardas ist die Schlüsselperson, Saturas ist nicht mehr wichtig									
------------------------------------------------------------------------*/
instance KDW_600_Saturas_TIMESUP (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_TIMESUP_Condition;
	information		= KDW_600_Saturas_TIMESUP_Info;
	important	    = 1;
	permanent		= 0;
};

FUNC int  KDW_600_Saturas_TIMESUP_Condition()
{	
	if FindOrcShaman == LOG_RUNNING
	|| FindOrcShaman == LOG_SUCCESS
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_TIMESUP_Info()
{
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_00"); //¿Has hablado con Xardas?
	Info_ClearChoices	(KDW_600_Saturas_TIMESUP);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Bueno...",KDW_600_Saturas_TIMESUP_JA1);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"No...",KDW_600_Saturas_TIMESUP_JA2);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"No es lo que piensas...",KDW_600_Saturas_TIMESUP_JA3);

};
func void KDW_600_Saturas_TIMESUP_JA1()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_01"); //Bueno...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_02"); //¿Bueno...? ¿Bueno qué?
	//AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_03"); //Äh ... noch nicht ... ich bin aber schon unterwegs ...
	//AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_04"); //Beeile dich, wir dürfen keine Zeit mehr verlieren!
	//B_Story_CancelFindXardas();
	//AI_StopProcessInfos(self);
};
func void KDW_600_Saturas_TIMESUP_JA2()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_05"); //No...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_06"); //¿Por qué no?
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_07"); //Todavía no he conseguido entrar en esa región...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_08"); //¡Tienes que encontrarle y pedir su consejo!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};
func void KDW_600_Saturas_TIMESUP_JA3()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_09"); //Todo esto no es como tú piensas que es...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_10"); //¿Qué quieres decir? ¡Necesita encontrar una manera de hacer saltar por los aires el montículo de mineral!
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_11"); //Esto... El montículo de mineral... Um... Ah... ¡ha crecido mucho!
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_12"); //¡Encuentra a Xardas; tiene que ayudarnos!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};




//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////// SLD zu Magier		//////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

// ****************************************
// 			Aufnahme eines Sld 
// ****************************************

instance KDW_600_Saturas_HogeAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHME_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHME_Info;
	permanent		= 0;
	description		= "Nefarius dijo que yo estaba listo para vestir la túnica de un Mago del Agua."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHME_Condition()
{	
	if ( Npc_KnowsInfo(hero,Info_Saturas_MURDER) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHME_Info()
{
	AI_Output(other, self,"KDW_600_Saturas_HogeAUFNAHME_15_00"); //Nefarius me ha dicho que estoy preparado para vestir la túnica de Mago del Agua.
	
	/* AB HIER IST ALLES DOPPELT - geklaut aus der KdF-KdW-Aufnahme */
	
	AI_Output(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Entonces te doy la bienvenida a nuestra comunidad.
	AI_Output(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //¿Quiere eso decir que ahora pertenezco a la cofradía de los Magos del Agua?
	AI_Output(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Todavía no. Primero tienes que prestar el juramento del Agua.
};
	
// ****************************************
// 			Aufnahme eines Sld - Teil 2
// ****************************************
instance KDW_600_Saturas_HogeAUFNAHMETeil2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHMETeil2_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHMETeil2_Info;
	permanent		= 0;
	description		= "Estoy listo para prestar juramento."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHMETeil2_Condition()
{	
	if ( (Npc_KnowsInfo(hero,KDW_600_Saturas_HogeAUFNAHME)) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHMETeil2_Info()
{
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Estoy preparado para prestar el juramento.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Ahora, pronuncia las palabras del juramento:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Juro por el poder de los dioses...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Juro por el poder de los dioses...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...y por el poder del Agua sagrada...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...y por el poder del Agua sagrada...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...que, de ahora en adelante, mis conocimientos y mis actos serán para siempre uno con el Agua.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...que, de ahora en adelante, mis conocimientos y mis actos serán para siempre uno con el Agua.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...hasta que mi cuerpo vuelva al reino de Beliar y la fuente de mi vida se seque.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...hasta que mi cuerpo vuelva al reino de Beliar y la fuente de mi vida se seque.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Lleva esta túnica en señal de tu unión con el Agua sagrada y con Adanos.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	Log_CreateTopic		(CH4_SldToKdW,	LOG_NOTE);
	B_LogEntry			(CH4_SldToKdW,"Saturas me ha admitido en el Círculo del Agua.");

	AI_StopProcessInfos	(self);
};

