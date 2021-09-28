//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_Xardas_EXIT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	nr			= 999;
	condition	= Info_Xardas_EXIT_Condition;
	information	= Info_Xardas_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Xardas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Xardas_EXIT_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneFireball))
	{
		CreateInvItem (self, ItArRuneFireball);
	};
	if (Npc_HasItems (self,ItArScrollSummonDemon)<1)
	{
		CreateInvItems (self, ItArScrollSummonDemon,2);
	};

};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DISTURB
//---------------------------------------------------------------------
instance  Info_Xardas_DISTURB (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DISTURB_Condition;
	information	= Info_Xardas_DISTURB_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_Xardas_DISTURB_Condition()
{	
	if	/*(FindGolemHearts == 4)
	&&	*/!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_DISTURB_Info()
{
	B_WhirlAround	(self, hero);
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_01"); //¿QUIÉN SE ATREVE A INTERRUMPIR MIS ESTUDIOS?
	AI_Output 		(hero, self,"Info_Xardas_DISTURB_15_02"); //Me llamo...
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_03"); //No quiero saber tu nombre. Es del todo intrascendente.
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_04"); //Lo único que importa es que eres la primera persona en muchos años que consigue resolver los acertijos de mi gólem.
}; 

//---------------------------------------------------------------------
//	Info OTHERS
//---------------------------------------------------------------------
instance  Info_Xardas_OTHERS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_OTHERS_Condition;
	information	= Info_Xardas_OTHERS_Info;
	important	= 0;
	permanent	= 0;
	description = "¿Ha habido otros visitantes?";
};

FUNC int  Info_Xardas_OTHERS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_OTHERS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_01"); //¿Es que ha habido más visitantes?
	AI_Output 		(self, hero,"Info_Xardas_OTHERS_14_02"); //No muchos; además, cuando empezaron a resultarme molestos les hice enfrentarse a una de mis criaturas sobrenaturales.
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_03"); //Te gusta estar solo, ¿verdad?
}; 

//---------------------------------------------------------------------
//	Info SATURAS
//---------------------------------------------------------------------
instance  Info_Xardas_SATURAS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SATURAS_Condition;
	information	= Info_Xardas_SATURAS_Info;
	important	= 0;
	permanent	= 0;
	description = "Me manda Saturas. ¡Necesitamos tu ayuda!";
};

FUNC int  Info_Xardas_SATURAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SATURAS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_01"); //Vengo de parte de Saturas. ¡Necesitamos tu ayuda!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_02"); //Los magos del Agua planean utilizar su gran montículo de mineral.
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_03"); //¡El montículo de mineral NO es la solución!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_04"); //¿No lo es?
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_05"); //¡NO!
}; 

//---------------------------------------------------------------------
//	Info KDW
//---------------------------------------------------------------------
instance  Info_Xardas_KDW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_KDW_Condition;
	information	= Info_Xardas_KDW_Info;
	important	= 0;
	permanent	= 0;
	description = "¡Todos los Magos del Fuego han muerto!";
};

FUNC int  Info_Xardas_KDW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};
};

FUNC void  Info_Xardas_KDW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_01"); //¡Todos los Magos del Fuego están muertos!
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_02"); //Gómez los hizo asesinar.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_03"); //Eso no me sorprende. Esos necios carniceros bárbaros del castillo nunca fueron de fiar, especialmente Gómez.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_04"); //Corristo y los demás magos eligieron a su propio verdugo cuando ayudaron a Gómez a usurpar el poder.
}; 

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance  Info_Xardas_SLEEPER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SLEEPER_Condition;
	information	= Info_Xardas_SLEEPER_Info;
	important	= 0;
	permanent	= 0;
	description = "Se dice que el llamado Durmiente es un archidemonio maléfico.";
};

FUNC int  Info_Xardas_SLEEPER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SLEEPER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_01"); //Se dice que el cacareado 'Durmiente' es un malvado archidemonio.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_02"); //Eso es lo que averiguó la Hermandad en el pantano.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_03"); //Ahora los Magos del Agua creen que todo el mundo en la colonia corre un gran peligro.
	AI_Output 		(self, hero,"Info_Xardas_SLEEPER_14_04"); //El peligro es más grande de lo que nadie dentro de la Barrera pueda imaginar siquiera. 
}; 

//---------------------------------------------------------------------
//	Info DANGER
//---------------------------------------------------------------------
instance  Info_Xardas_DANGER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DANGER_Condition;
	information	= Info_Xardas_DANGER_Info;
	important	= 0;
	permanent	= 0;
	description = "Si la explosión del montículo de mineral no evita el gran peligro...";
};

FUNC int  Info_Xardas_DANGER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_SLEEPER)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SATURAS)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_DANGER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_01"); //Si la explosión del montículo de mineral no previene el gran peligro...
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_02"); //¡...Olvida el montículo de mineral! Su poder no abrirá la Barrera.
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_03"); //Si Corristo y Saturas no hubieran desperdiciado su tiempo peleándose por asuntos vanos y necios a lo largo de los últimos años, todos sabrían lo que yo sé ahora.
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_04"); //¿Y qué es lo que sabes?
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_05"); //Ninguno de los doce magos se detuvo a pensar por qué la formación de la Barrera escapó a su control o por qué cobró unas dimensiones tan enormes.
};

//---------------------------------------------------------------------
//	Info BARRIER
//---------------------------------------------------------------------
instance  Info_Xardas_BARRIER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_BARRIER_Condition;
	information	= Info_Xardas_BARRIER_Info;
	important	= 0;
	permanent	= 0;
	description = "¿Averiguaste por qué sucedió aquello?";
};

FUNC int  Info_Xardas_BARRIER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DANGER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_BARRIER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_01"); //¿Conseguiste averiguar la causa? 
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_02"); //Bueno, una cosa es segura. La respuesta se encuentra oculta a gran profundidad, bajo el pueblo orco.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_03"); //¿El pueblo orco?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_04"); //En contra de lo que piensa mucha gente, los orcos no son animales. Su cultura es tan antigua como la humana.
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_05"); //Hace unos pocos cientos de años, cinco chamanes orcos invocaron a un viejo archidemonio del que esperaban obtener el poder necesario para que su clan derrotase a sus enemigos.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_06"); //¿Y este archidemonio era el Durmiente?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_07"); //Los orcos le dieron este nombre mucho después. ¡Pero no voy a decirte por qué lo hicieron ni por qué están aterrados ahora de esta figura sobrenatural!
}; 

//---------------------------------------------------------------------
//	Info EVENT
//---------------------------------------------------------------------
instance  Info_Xardas_EVENT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENT_Condition;
	information	= Info_Xardas_EVENT_Info;
	important	= 0;
	permanent	= 0;
	description = "¿Por qué no? ¿En cuánto mineral estabas pensando?";
};

FUNC int  Info_Xardas_EVENT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_BARRIER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_01"); //¿Por qué no?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_02"); //Creo que tú podrías ser... ¡NO, para estar absolutamente seguro, tendrás que llevar a cabo otra tarea!
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_03"); //¿Qué tarea?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_04"); //Escucha con atención. Los orcos han expulsado de su poblado a uno de sus chamanes.
}; 

//---------------------------------------------------------------------
//	Info EVENTWHY
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHY (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHY_Condition;
	information	= Info_Xardas_EVENTWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "¿Por qué lo han desterrado?";
};

FUNC int  Info_Xardas_EVENTWHY_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHY_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHY_15_01"); //¿Por qué le expulsaron?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHY_14_02"); //El agonizante guerrero orco ya no pudo responder a esa pregunta cuando fue interrogado por uno de mis demonios.
}; 

//---------------------------------------------------------------------
//	Info EVENTHOW
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTHOW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTHOW_Condition;
	information	= Info_Xardas_EVENTHOW_Info;
	important	= 0;
	permanent	= 0;
	description = "¿Qué tiene que ver este chamán orco con mi misión?";
};

FUNC int  Info_Xardas_EVENTHOW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTHOW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_01"); //¿Qué tiene que ver este chamán orco con mi tarea?
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_02"); //Él te contará el resto de la historia del Durmiente.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_03"); //¡No es muy probable que un chamán orco esté interesado en hablar conmigo!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_04"); //¿Quieres que te ayude o no?
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_05"); //Bueno, sí, pero...
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_06"); //¡Entonces no vuelvas a cuestionar mis palabras!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_07"); //Encuentra al chamán. No se lleva demasiado bien con sus hermanos del poblado orco, así que quizá te escuche antes de convertirte en una antorcha viviente.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_08"); //¡Eso me tranquiliza!
}; 

//---------------------------------------------------------------------
//	Info EVENTWHERE
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHERE (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHERE_Condition;
	information	= Info_Xardas_EVENTWHERE_Info;
	important	= 0;
	permanent	= 0;
	description = "¿Dónde se encuentra este chamán exiliado?";
};

FUNC int  Info_Xardas_EVENTWHERE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHERE_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_01"); //¿Dónde se encuentra este chamán exiliado?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_02"); //Dirígete hacia la antigua ciudadela al este. No tiene pérdida, está en la cima de una montaña elevada que puede verse desde lejos.
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_03"); //¿Se puede entrar así como así?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_04"); //La llaman la vieja ciudadela, pero apenas queda ningún resto aparte de los cimientos de las murallas. Hace décadas que no es más que una ruina.
}; 

//---------------------------------------------------------------------
//	Info ACCEPT
//---------------------------------------------------------------------
instance  Info_Xardas_ACCEPT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_ACCEPT_Condition;
	information	= Info_Xardas_ACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description = "¡Conseguiré las respuestas de este chamán!";
};

FUNC int  Info_Xardas_ACCEPT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHY)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTHOW)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHERE)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_ACCEPT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_ACCEPT_15_01"); //¡Conseguiré que el chamán me proporcione las respuestas!
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_02"); //Mi sirviente ya te ha entregado una runa de teletransporte para la estrella de cinco puntas que hay en el piso de abajo.
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_03"); //Eso facilitará después tu regreso.

	B_Story_CordsPost();		// Falls Spieler Gorn am Wassermagier-Pentragramm nicht angesprochen hat!
	B_Story_FindOrcShaman();
	
	AI_StopProcessInfos(self);
}; 
/*------------------------------------------------------------------------
						SCROLLS UND RUNEN VERKAUFEN							
------------------------------------------------------------------------*/

instance  Kdf_404_Xardas_SELLMAGICSTUFF (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information		= Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important		= 0;
	permanent		= 1;
	trade			= 1;
	description		= "Busco conocimiento mágico."; 
	
};

FUNC int  Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{	
	if ( Npc_KnowsInfo(hero, Info_Xardas_ACCEPT))
	{
		return TRUE;
	};

};
FUNC void  Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
	AI_Output (other, self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //Busco conocimientos mágicos.
};

//---------------------------------------------------------------------
//	Info RETURN
//---------------------------------------------------------------------
instance  Info_Xardas_RETURN (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_RETURN_Condition;
	information	= Info_Xardas_RETURN_Info;
	important	= 0;
	permanent	= 0;
	description = "¡Tengo las respuestas del chamán orco!";
};

FUNC int  Info_Xardas_RETURN_Condition()
{	
	if	UrShak_SpokeOfUluMulu
	&&	!EnteredTemple
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_RETURN_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_01"); //¡Tengo las respuestas del chamán orco!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_02"); //¡Bueno, entonces infórmame!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_03"); //Los cinco chamanes orcos que invocaron al Durmiente le erigieron un gran templo subterráneo, cuya entrada se encuentra en el poblado orco.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_04"); //¡En efecto!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_05"); //¡Dando muestras de una gran ingratitud, les arrancó los corazones y les condenó a ellos y a los trabajadores a una existencia eterna como criaturas muertas vivientes!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_06"); //¡Espléndido, espléndido!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_07"); //¡Los orcos sellaron el templo y empezaron a hacer sacrificios para aplacar al demonio!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_08"); //¿Has encontrado una manera de entrar en el templo?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_09"); //Sí, hay un orco que...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_10"); //¡No me des los detalles! ¡Ve al templo subterráneo! ¡Ahí encontrarás la única manera de destruir la Barrera!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_11"); //¡No lo comprendo!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_12"); //¿Es que no acudiste a mí para que te ayudara a destruir la Barrera?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_13"); //Sí, pero...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_14"); //¡ENTONCES VE! ¡Ya hemos perdido demasiado tiempo! ¡Ve al templo subterráneo y encuentra la respuesta!

	B_Story_ReturnedFromUrShak();
}; 

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info FOUNDTEMPLE
//---------------------------------------------------------------------
instance  Info_Xardas_FOUNDTEMPLE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FOUNDTEMPLE_Condition;
	information		= Info_Xardas_FOUNDTEMPLE_Info;
	important		= 0;
	permanent		= 0;
	description		= "¡He encontrado el modo de entrar en el templo subterráneo!"; 
};

FUNC int  Info_Xardas_FOUNDTEMPLE_Condition()
{	
	if (EnteredTemple)
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_FOUNDTEMPLE_Info()
{
	AI_Output (other, self,"Info_Xardas_FOUNDTEMPLE_15_01"); //¡He encontrado una manera de entrar en el templo subterráneo!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_02"); //¿QUE HAS...? ¡Eso es extraordinario!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_03"); //¡Te has hecho muy poderoso! Más que cualquier otro dentro de la Barrera.
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_04"); //¡Puede que sea cierto que eres el hombre del que hablaban las profecías orcas!
};

//---------------------------------------------------------------------
//	Info PROPHECY
//---------------------------------------------------------------------
instance  Info_Xardas_PROPHECY (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_PROPHECY_Condition;
	information		= Info_Xardas_PROPHECY_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Profecías? ¿Qué profecías?"; 
};

FUNC int  Info_Xardas_PROPHECY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Xardas_FOUNDTEMPLE))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_PROPHECY_Info()
{
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_01"); //¿Profecías? ¿Qué profecías?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_02"); //Unos antiquísimos documentos orcos, escritos poco después del sellado del templo subterráneo, mencionan a un 'Enemigo Santo'.
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_03"); //¿Un enemigo santo?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_04"); //¡Alguien que vendrá a expulsar al DURMIENTE de nuestro mundo para siempre!
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_05"); //¿Y se supone que yo soy el que mencionan las antiguas profecías? ¡Sin duda te equivocas!
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_06"); //Tal vez... ¡pero tal vez no!
};

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD_Condition;
	information		= Info_Xardas_LOADSWORD_Info;
	important		= 0;
	permanent		= 0;
	description		= "He encontrado esta extraña espada."; 
};

FUNC int  Info_Xardas_LOADSWORD_Condition()
{	
	if ( Npc_HasItems ( hero, Mythrilklinge ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD_Info()
{
	AI_Output				(other, self,"Info_Xardas_LOADSWORD_15_01"); //He encontrado esta extraña espada.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_02"); //Enséñamela.

	CreateInvItem 			(self, Mythrilklinge01);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);

	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_03"); //Interesante. En ella está grabada la palabra 'URIZIEL'
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_04"); //he oído hablar de esta espada. Es un arma de la antigüedad, de cuando la raza humana era joven.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_05"); //Fue forjada de un material desconocido. ¡Y no hay nada escrito acerca de quien la creó!
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_06"); //¡Se decía que la espada tenía unos poderes increíbles, pero no detecto ningún aura mágica! 
	
	Npc_RemoveInvItem 		(hero, Mythrilklinge);	
	CreateInvItem 			(hero, Mythrilklinge01);
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD01 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD01_Condition;
	information		= Info_Xardas_LOADSWORD01_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿URIZIEL poseía poderes increíbles?"; 
};

FUNC int  Info_Xardas_LOADSWORD01_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD ))
	{			
		return TRUE;
	};	
};


FUNC void  Info_Xardas_LOADSWORD01_Info()
{
	Npc_RemoveInvItem 	(self, Mythrilklinge01);

	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_01"); //¿URIZIEL poseía poderes increíbles?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_02"); //Está escrito que el dueño del arma podía perforar la armadura más resistente y atravesar los hechizos de protección más poderosos.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_03"); //¿Cómo consiguieron obtener los orcos un arma tan poderosa?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_04"); //Se dice que los orcos la obtuvieron de manos de un poderoso señor de la guerra. ¡No sabían cómo utilizarla, pero la escondieron!
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_05"); //¡Pero no la ocultaron lo bastante bien!
};

//---------------------------------------------------------------------
//	Info LOADSWORD02
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD02 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD02_Condition;
	information		= Info_Xardas_LOADSWORD02_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Es posible restaurar los antiguos poderes del arma?"; 
};

FUNC int  Info_Xardas_LOADSWORD02_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD01 ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD02_Info()
{
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_01"); //¿Sería posible devolverle al arma sus antiguos poderes?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_02"); //Para eso sería necesaria una gran fuente de poder.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_03"); //¿Quieres decir lo suficientemente fuerte como para poder hacer explotar la Barrera Mágica?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_04"); //Sí, así de fuerte, más o menos.
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_05"); //Además, necesitarás una fórmula mágica para transferir el poder.
	AI_Output			(self, other,"Info_Xardas_LOADSWORD02_14_06"); //Dame algo de tiempo y crearé la fórmula mágica.

	B_Story_ShowedUrizielToXardas();
};


//---------------------------------------------------------------------
//	Info BETTERARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_BETTERARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_BETTERARMOR_Condition;
	information		= Info_Xardas_BETTERARMOR_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mientras tanto, buscaré una armadura mejor."; 
};

FUNC int  Info_Xardas_BETTERARMOR_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD02))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_BETTERARMOR_Info()
{
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_01"); //¡Mientras tanto buscaré una armadura mejor!

	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if (armorInstance == CRW_ARMOR_H)
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_02"); //¡Estas placas de reptador remendadas han recibido demasiados agujeros en el templo subterráneo!
	}
	else if (armorInstance == KDW_ARMOR_H) || (armorInstance == KDW_ARMOR_L)		
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_03"); //¡Estos harapos azules no fueron protección suficiente en el templo subterráneo!
	}
	else
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_04"); //¡Los muertos vivientes han abollado demasiado mi armadura!
	};
	
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_05"); //Deberías ir a mi antigua torre.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_06"); //¿Tu antigua torre?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_07"); //Se hundió bajo la superficie de uno de los lagos del este durante uno de los terremotos. Sus agujas todavía asoman por encima del agua.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_08"); //En su interior quedan algunos artefactos. Nunca he intentado recuperarlos.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_09"); //¿Cómo puedo llegar hasta allí?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_10"); //No he estado allí desde el terremoto, así que tendrás que encontrar por ti mismo la manera de entrar.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_11"); //Pero toma esta llave. Es la que abre el arcón en el que solía guardar algunos artefactos particularmente poco corrientes.

	B_Story_ExploreSunkenTower();
};


//---------------------------------------------------------------------
//	Info OREARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_OREARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_OREARMOR_Condition;
	information		= Info_Xardas_OREARMOR_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Info_Xardas_OREARMOR_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OREARMOR_Info()
{
	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if	(armorInstance == ORE_ARMOR_M)
	||	(armorInstance == ORE_ARMOR_H)
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_01"); //¡Veo que llevas puesta la armadura de mineral!
	}
	else
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_02"); //Ya veo que has encontrado la armadura de mineral
	};
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_03"); //La encontré en uno de esos arcones viejos en la torre hundida.
	AI_Output		(self, other,"Info_Xardas_OREARMOR_14_04"); //Pertenecía al general que blandió a URIZIEL en la batalla contra los orcos.
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_05"); //¡Espero que me traiga más suerte de la que le trajo a él!
};

//---------------------------------------------------------------------
//	Info FORMULA 
//---------------------------------------------------------------------
instance  Info_Xardas_FORMULA (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FORMULA_Condition;
	information		= Info_Xardas_FORMULA_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Has finalizado la fórmula mágica para reactivar a URIZIEL?";
};

FUNC int  Info_Xardas_FORMULA_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	||	Npc_HasItems(hero, ItArRuneTeleport1)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_FORMULA_Info()
{
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_01"); //¿Has conseguido completar la fórmula mágica para reactivar a URIZIEL?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_02"); //Sí, ya está. Pero no podrás utilizarla tú solo.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_03"); //¿Por qué no?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_04"); //Tiene que ser leída en voz alta por un mago mientras tú tocas la fuente de poder con la espada.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_05"); //¡Entonces tendré que buscar ayuda!
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_06"); //Toma la fórmula y devuélvele a la espada su antiguo poder. ¡Te hará falta!

	B_Story_LoadSword();
};

//---------------------------------------------------------------------
//	Info ALTRUNE 
//---------------------------------------------------------------------
instance  Info_Xardas_ALTRUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_ALTRUNE_Condition;
	information		= Info_Xardas_ALTRUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "¡Como soy mago, me resultará difícil blandir a URIZIEL!";
};

FUNC int  Info_Xardas_ALTRUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_FORMULA)
	&&	((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB))
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_ALTRUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_ALTRUNE_15_01"); //¡Dado que soy un mago, me resultará difícil blandir a URIZIEL!
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_02"); //Existe una solución.
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_03"); //¡Pero primero tendrás que devolverle a la espada sus antiguos poderes! ¡Regresa cuando lo hayas hecho!
};


//---------------------------------------------------------------------
//	Info SWORDLOADED
//---------------------------------------------------------------------
instance  Info_Xardas_SWORDLOADED (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_SWORDLOADED_Condition;
	information		= Info_Xardas_SWORDLOADED_Info;
	important		= 0;
	permanent		= 0;
	description		= "¡He reactivado a URIZIEL!"; 
};

FUNC int  Info_Xardas_SWORDLOADED_Condition()
{	
	if  Npc_HasItems(hero,Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_SWORDLOADED_Info()
{
	AI_Output		(other, self,"Info_Xardas_SWORDLOADED_15_01"); //¡He reactivado a URIZIEL!
	AI_Output		(self, other,"Info_Xardas_SWORDLOADED_14_02"); //Es increíble; la espada ha recuperado sus antiguos poderes. ¡Ahora tienes un arma verdaderamente poderosa!

	Wld_InsertItem			(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");	//Unblutige Lösung für´s Ich-brauch-Orc-Statue-Massaker ***Björn***

};

//---------------------------------------------------------------------
//	Info MAKERUNE
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNE_Condition;
	information		= Info_Xardas_MAKERUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "¡Dijiste que podría haber un modo de esgrimir a URIZIEL aunque yo fuera un mago!"; 
};

FUNC int  Info_Xardas_MAKERUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_ALTRUNE)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SWORDLOADED)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_01"); //Dijiste que existía una manera en que podría blandir a URIZIEL pese a ser un mago, ¿no?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_02"); //Examina a URIZIEL con detenimiento. Verás que en la espada hay una joya azul de gran tamaño.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_03"); //Ahí es donde residen los poderes mágicos del arma.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_04"); //Si quito la joya, podré crear una runa mágica que posea los atributos de URIZIEL.
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_05"); //¿Una runa mágica hecha con URIZIEL?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_06"); //¡En combate, la runa será tan poderosa como la espada!
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_07"); //¡Pero no te olvides de que sólo un Mago del Sexto Círculo será capaz de controlar una runa mágica tan poderosa!
};

//---------------------------------------------------------------------
//	Info MAKERUNEDOIT
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNEDOIT (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNEDOIT_Condition;
	information		= Info_Xardas_MAKERUNEDOIT_Info;
	important		= 0;
	permanent		= 1;
	description		= "¡Quita la joya de URIZIEL!"; 
};

FUNC int  Info_Xardas_MAKERUNEDOIT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_MAKERUNE)
	&&	Npc_HasItems (hero,	Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNEDOIT_Info()
{
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_01"); //¡Saca la joya de URIZIEL!
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	{
		AI_Output		(self, other,"Info_Xardas_MAKERUNEDOIT_14_02"); //¡Pero todavía no dominas el Sexto Círculo de Magia!
	};
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_03"); //Esta decisión es definitiva. ¿Estás seguro de querer que extraiga la joya?

	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"¡SÍ, hazlo!",	Info_Xardas_MAKERUNE_YES);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"¡NO, no lo hagas!",	Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_04"); //¡Sí, hazlo!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_05"); //Ya que así lo deseas... ¡Toma, aquí tienes la espada vacía y la runa!

	Npc_RemoveInvItem 	(hero, Mythrilklinge02);
	CreateInvItems 		(self, UrizielRune, 2);	
	B_GiveInvItems      (self, hero, UrizielRune, 2);// Wegen Ausgabe "2 Items übergeben", wird direkt angeglichen
	Npc_RemoveInvItem	(hero, UrizielRune);
	CreateInvItem		(hero, Mythrilklinge03);
	B_LogEntry			(CH5_Uriziel,"Xardas ha arrancado la gema mágica de la espada URIZIEL. El poder de esta hoja reside ahora en una runa mágica de poderes sin igual.");
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_SUCCESS);
};	

func void Info_Xardas_MAKERUNE_NO ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_06"); //¡NO, no lo hagas!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_07"); //Como desees. ¡La espada seguirá teniendo sus poderes mágicos!
};	
	

//---------------------------------------------------------------------
//	Info LOADSWORD9 --> SC kann DMB werden
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD09 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD09_Condition;
	information		= Info_Xardas_LOADSWORD09_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,0); 
};

FUNC int  Info_Xardas_LOADSWORD09_Condition()
{	
	if (EnteredTemple)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{			
		return TRUE;
	};	
};
func void  Info_Xardas_LOADSWORD09_Info()
{
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//¿Puedes enseñarme?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //Te elevaré hasta el Sexto Círculo de Magia.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //Ten en cuenta que únicamente los magos más poderosos ingresan en el Sexto Círculo. Está reservado para aquellos cuya vida es una señal.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //Tu señal es la unificación de los elementos.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //El Sexto Círculo te permite hacer uso de la magia de cualquier runa.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //Y no olvides que no debes reclamar el poder, sino servirlo.
			
			CreateInvItem 		(hero, DMB_ARMOR_M);		// SN: kann nicht mit B_GiveInvItem() übergeben werden, da Xardas sonst nackt dasteht!
			AI_EquipBestArmor	(hero);

			//Fakeitem für Bildschirmausgabe
			CreateInvItem		(self,			ItAmArrow);
			B_GiveInvItems		(self, hero,	ItAmArrow, 1);
			Npc_RemoveInvItem	(hero,			ItAmArrow);

			hero.guild 	= GIL_DMB;	
			Npc_SetTrueGuild	( hero, GIL_DMB );	
			Info_Xardas_LOADSWORD09.permanent = 0;
			AI_StopProcessInfos	( self );
		};
	}
	else 
	{
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//Todavía no. Tienes el talento, pero careces de la suficiente experiencia. Que Saturas te enseñe primero; después te instruiré yo.
		
		AI_StopProcessInfos	( self );
	};
};

	
