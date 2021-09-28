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
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_01"); //�QUI�N SE ATREVE A INTERRUMPIR MIS ESTUDIOS?
	AI_Output 		(hero, self,"Info_Xardas_DISTURB_15_02"); //Me llamo...
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_03"); //No quiero saber tu nombre. Es del todo intrascendente.
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_04"); //Lo �nico que importa es que eres la primera persona en muchos a�os que consigue resolver los acertijos de mi g�lem.
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
	description = "�Ha habido otros visitantes?";
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
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_01"); //�Es que ha habido m�s visitantes?
	AI_Output 		(self, hero,"Info_Xardas_OTHERS_14_02"); //No muchos; adem�s, cuando empezaron a resultarme molestos les hice enfrentarse a una de mis criaturas sobrenaturales.
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_03"); //Te gusta estar solo, �verdad?
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
	description = "Me manda Saturas. �Necesitamos tu ayuda!";
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
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_01"); //Vengo de parte de Saturas. �Necesitamos tu ayuda!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_02"); //Los magos del Agua planean utilizar su gran mont�culo de mineral.
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_03"); //�El mont�culo de mineral NO es la soluci�n!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_04"); //�No lo es?
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_05"); //�NO!
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
	description = "�Todos los Magos del Fuego han muerto!";
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
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_01"); //�Todos los Magos del Fuego est�n muertos!
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_02"); //G�mez los hizo asesinar.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_03"); //Eso no me sorprende. Esos necios carniceros b�rbaros del castillo nunca fueron de fiar, especialmente G�mez.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_04"); //Corristo y los dem�s magos eligieron a su propio verdugo cuando ayudaron a G�mez a usurpar el poder.
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
	description = "Se dice que el llamado Durmiente es un archidemonio mal�fico.";
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
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_02"); //Eso es lo que averigu� la Hermandad en el pantano.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_03"); //Ahora los Magos del Agua creen que todo el mundo en la colonia corre un gran peligro.
	AI_Output 		(self, hero,"Info_Xardas_SLEEPER_14_04"); //El peligro es m�s grande de lo que nadie dentro de la Barrera pueda imaginar siquiera. 
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
	description = "Si la explosi�n del mont�culo de mineral no evita el gran peligro...";
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
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_01"); //Si la explosi�n del mont�culo de mineral no previene el gran peligro...
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_02"); //�...Olvida el mont�culo de mineral! Su poder no abrir� la Barrera.
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_03"); //Si Corristo y Saturas no hubieran desperdiciado su tiempo pele�ndose por asuntos vanos y necios a lo largo de los �ltimos a�os, todos sabr�an lo que yo s� ahora.
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_04"); //�Y qu� es lo que sabes?
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_05"); //Ninguno de los doce magos se detuvo a pensar por qu� la formaci�n de la Barrera escap� a su control o por qu� cobr� unas dimensiones tan enormes.
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
	description = "�Averiguaste por qu� sucedi� aquello?";
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
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_01"); //�Conseguiste averiguar la causa? 
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_02"); //Bueno, una cosa es segura. La respuesta se encuentra oculta a gran profundidad, bajo el pueblo orco.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_03"); //�El pueblo orco?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_04"); //En contra de lo que piensa mucha gente, los orcos no son animales. Su cultura es tan antigua como la humana.
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_05"); //Hace unos pocos cientos de a�os, cinco chamanes orcos invocaron a un viejo archidemonio del que esperaban obtener el poder necesario para que su clan derrotase a sus enemigos.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_06"); //�Y este archidemonio era el Durmiente?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_07"); //Los orcos le dieron este nombre mucho despu�s. �Pero no voy a decirte por qu� lo hicieron ni por qu� est�n aterrados ahora de esta figura sobrenatural!
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
	description = "�Por qu� no? �En cu�nto mineral estabas pensando?";
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
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_01"); //�Por qu� no?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_02"); //Creo que t� podr�as ser... �NO, para estar absolutamente seguro, tendr�s que llevar a cabo otra tarea!
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_03"); //�Qu� tarea?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_04"); //Escucha con atenci�n. Los orcos han expulsado de su poblado a uno de sus chamanes.
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
	description = "�Por qu� lo han desterrado?";
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
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHY_15_01"); //�Por qu� le expulsaron?
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
	description = "�Qu� tiene que ver este cham�n orco con mi misi�n?";
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
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_01"); //�Qu� tiene que ver este cham�n orco con mi tarea?
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_02"); //�l te contar� el resto de la historia del Durmiente.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_03"); //�No es muy probable que un cham�n orco est� interesado en hablar conmigo!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_04"); //�Quieres que te ayude o no?
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_05"); //Bueno, s�, pero...
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_06"); //�Entonces no vuelvas a cuestionar mis palabras!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_07"); //Encuentra al cham�n. No se lleva demasiado bien con sus hermanos del poblado orco, as� que quiz� te escuche antes de convertirte en una antorcha viviente.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_08"); //�Eso me tranquiliza!
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
	description = "�D�nde se encuentra este cham�n exiliado?";
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
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_01"); //�D�nde se encuentra este cham�n exiliado?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_02"); //Dir�gete hacia la antigua ciudadela al este. No tiene p�rdida, est� en la cima de una monta�a elevada que puede verse desde lejos.
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_03"); //�Se puede entrar as� como as�?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_04"); //La llaman la vieja ciudadela, pero apenas queda ning�n resto aparte de los cimientos de las murallas. Hace d�cadas que no es m�s que una ruina.
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
	description = "�Conseguir� las respuestas de este cham�n!";
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
	AI_Output 		(hero, self,"Info_Xardas_ACCEPT_15_01"); //�Conseguir� que el cham�n me proporcione las respuestas!
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_02"); //Mi sirviente ya te ha entregado una runa de teletransporte para la estrella de cinco puntas que hay en el piso de abajo.
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_03"); //Eso facilitar� despu�s tu regreso.

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
	description		= "Busco conocimiento m�gico."; 
	
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
	AI_Output (other, self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //Busco conocimientos m�gicos.
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
	description = "�Tengo las respuestas del cham�n orco!";
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
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_01"); //�Tengo las respuestas del cham�n orco!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_02"); //�Bueno, entonces inf�rmame!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_03"); //Los cinco chamanes orcos que invocaron al Durmiente le erigieron un gran templo subterr�neo, cuya entrada se encuentra en el poblado orco.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_04"); //�En efecto!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_05"); //�Dando muestras de una gran ingratitud, les arranc� los corazones y les conden� a ellos y a los trabajadores a una existencia eterna como criaturas muertas vivientes!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_06"); //�Espl�ndido, espl�ndido!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_07"); //�Los orcos sellaron el templo y empezaron a hacer sacrificios para aplacar al demonio!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_08"); //�Has encontrado una manera de entrar en el templo?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_09"); //S�, hay un orco que...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_10"); //�No me des los detalles! �Ve al templo subterr�neo! �Ah� encontrar�s la �nica manera de destruir la Barrera!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_11"); //�No lo comprendo!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_12"); //�Es que no acudiste a m� para que te ayudara a destruir la Barrera?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_13"); //S�, pero...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_14"); //�ENTONCES VE! �Ya hemos perdido demasiado tiempo! �Ve al templo subterr�neo y encuentra la respuesta!

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
	description		= "�He encontrado el modo de entrar en el templo subterr�neo!"; 
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
	AI_Output (other, self,"Info_Xardas_FOUNDTEMPLE_15_01"); //�He encontrado una manera de entrar en el templo subterr�neo!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_02"); //�QUE HAS...? �Eso es extraordinario!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_03"); //�Te has hecho muy poderoso! M�s que cualquier otro dentro de la Barrera.
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_04"); //�Puede que sea cierto que eres el hombre del que hablaban las profec�as orcas!
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
	description		= "�Profec�as? �Qu� profec�as?"; 
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
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_01"); //�Profec�as? �Qu� profec�as?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_02"); //Unos antiqu�simos documentos orcos, escritos poco despu�s del sellado del templo subterr�neo, mencionan a un 'Enemigo Santo'.
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_03"); //�Un enemigo santo?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_04"); //�Alguien que vendr� a expulsar al DURMIENTE de nuestro mundo para siempre!
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_05"); //�Y se supone que yo soy el que mencionan las antiguas profec�as? �Sin duda te equivocas!
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_06"); //Tal vez... �pero tal vez no!
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
	description		= "He encontrado esta extra�a espada."; 
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
	AI_Output				(other, self,"Info_Xardas_LOADSWORD_15_01"); //He encontrado esta extra�a espada.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_02"); //Ens��amela.

	CreateInvItem 			(self, Mythrilklinge01);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);

	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_03"); //Interesante. En ella est� grabada la palabra 'URIZIEL'
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_04"); //he o�do hablar de esta espada. Es un arma de la antig�edad, de cuando la raza humana era joven.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_05"); //Fue forjada de un material desconocido. �Y no hay nada escrito acerca de quien la cre�!
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_06"); //�Se dec�a que la espada ten�a unos poderes incre�bles, pero no detecto ning�n aura m�gica! 
	
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
	description		= "�URIZIEL pose�a poderes incre�bles?"; 
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

	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_01"); //�URIZIEL pose�a poderes incre�bles?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_02"); //Est� escrito que el due�o del arma pod�a perforar la armadura m�s resistente y atravesar los hechizos de protecci�n m�s poderosos.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_03"); //�C�mo consiguieron obtener los orcos un arma tan poderosa?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_04"); //Se dice que los orcos la obtuvieron de manos de un poderoso se�or de la guerra. �No sab�an c�mo utilizarla, pero la escondieron!
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_05"); //�Pero no la ocultaron lo bastante bien!
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
	description		= "�Es posible restaurar los antiguos poderes del arma?"; 
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
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_01"); //�Ser�a posible devolverle al arma sus antiguos poderes?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_02"); //Para eso ser�a necesaria una gran fuente de poder.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_03"); //�Quieres decir lo suficientemente fuerte como para poder hacer explotar la Barrera M�gica?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_04"); //S�, as� de fuerte, m�s o menos.
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_05"); //Adem�s, necesitar�s una f�rmula m�gica para transferir el poder.
	AI_Output			(self, other,"Info_Xardas_LOADSWORD02_14_06"); //Dame algo de tiempo y crear� la f�rmula m�gica.

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
	description		= "Mientras tanto, buscar� una armadura mejor."; 
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
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_01"); //�Mientras tanto buscar� una armadura mejor!

	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if (armorInstance == CRW_ARMOR_H)
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_02"); //�Estas placas de reptador remendadas han recibido demasiados agujeros en el templo subterr�neo!
	}
	else if (armorInstance == KDW_ARMOR_H) || (armorInstance == KDW_ARMOR_L)		
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_03"); //�Estos harapos azules no fueron protecci�n suficiente en el templo subterr�neo!
	}
	else
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_04"); //�Los muertos vivientes han abollado demasiado mi armadura!
	};
	
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_05"); //Deber�as ir a mi antigua torre.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_06"); //�Tu antigua torre?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_07"); //Se hundi� bajo la superficie de uno de los lagos del este durante uno de los terremotos. Sus agujas todav�a asoman por encima del agua.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_08"); //En su interior quedan algunos artefactos. Nunca he intentado recuperarlos.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_09"); //�C�mo puedo llegar hasta all�?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_10"); //No he estado all� desde el terremoto, as� que tendr�s que encontrar por ti mismo la manera de entrar.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_11"); //Pero toma esta llave. Es la que abre el arc�n en el que sol�a guardar algunos artefactos particularmente poco corrientes.

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
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_01"); //�Veo que llevas puesta la armadura de mineral!
	}
	else
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_02"); //Ya veo que has encontrado la armadura de mineral
	};
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_03"); //La encontr� en uno de esos arcones viejos en la torre hundida.
	AI_Output		(self, other,"Info_Xardas_OREARMOR_14_04"); //Pertenec�a al general que blandi� a URIZIEL en la batalla contra los orcos.
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_05"); //�Espero que me traiga m�s suerte de la que le trajo a �l!
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
	description		= "�Has finalizado la f�rmula m�gica para reactivar a URIZIEL?";
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
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_01"); //�Has conseguido completar la f�rmula m�gica para reactivar a URIZIEL?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_02"); //S�, ya est�. Pero no podr�s utilizarla t� solo.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_03"); //�Por qu� no?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_04"); //Tiene que ser le�da en voz alta por un mago mientras t� tocas la fuente de poder con la espada.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_05"); //�Entonces tendr� que buscar ayuda!
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_06"); //Toma la f�rmula y devu�lvele a la espada su antiguo poder. �Te har� falta!

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
	description		= "�Como soy mago, me resultar� dif�cil blandir a URIZIEL!";
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
	AI_Output		(other, self,"Info_Xardas_ALTRUNE_15_01"); //�Dado que soy un mago, me resultar� dif�cil blandir a URIZIEL!
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_02"); //Existe una soluci�n.
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_03"); //�Pero primero tendr�s que devolverle a la espada sus antiguos poderes! �Regresa cuando lo hayas hecho!
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
	description		= "�He reactivado a URIZIEL!"; 
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
	AI_Output		(other, self,"Info_Xardas_SWORDLOADED_15_01"); //�He reactivado a URIZIEL!
	AI_Output		(self, other,"Info_Xardas_SWORDLOADED_14_02"); //Es incre�ble; la espada ha recuperado sus antiguos poderes. �Ahora tienes un arma verdaderamente poderosa!

	Wld_InsertItem			(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");	//Unblutige L�sung f�r�s Ich-brauch-Orc-Statue-Massaker ***Bj�rn***

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
	description		= "�Dijiste que podr�a haber un modo de esgrimir a URIZIEL aunque yo fuera un mago!"; 
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
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_01"); //Dijiste que exist�a una manera en que podr�a blandir a URIZIEL pese a ser un mago, �no?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_02"); //Examina a URIZIEL con detenimiento. Ver�s que en la espada hay una joya azul de gran tama�o.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_03"); //Ah� es donde residen los poderes m�gicos del arma.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_04"); //Si quito la joya, podr� crear una runa m�gica que posea los atributos de URIZIEL.
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_05"); //�Una runa m�gica hecha con URIZIEL?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_06"); //�En combate, la runa ser� tan poderosa como la espada!
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_07"); //�Pero no te olvides de que s�lo un Mago del Sexto C�rculo ser� capaz de controlar una runa m�gica tan poderosa!
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
	description		= "�Quita la joya de URIZIEL!"; 
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
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_01"); //�Saca la joya de URIZIEL!
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	{
		AI_Output		(self, other,"Info_Xardas_MAKERUNEDOIT_14_02"); //�Pero todav�a no dominas el Sexto C�rculo de Magia!
	};
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_03"); //Esta decisi�n es definitiva. �Est�s seguro de querer que extraiga la joya?

	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"�S�, hazlo!",	Info_Xardas_MAKERUNE_YES);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"�NO, no lo hagas!",	Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_04"); //�S�, hazlo!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_05"); //Ya que as� lo deseas... �Toma, aqu� tienes la espada vac�a y la runa!

	Npc_RemoveInvItem 	(hero, Mythrilklinge02);
	CreateInvItems 		(self, UrizielRune, 2);	
	B_GiveInvItems      (self, hero, UrizielRune, 2);// Wegen Ausgabe "2 Items �bergeben", wird direkt angeglichen
	Npc_RemoveInvItem	(hero, UrizielRune);
	CreateInvItem		(hero, Mythrilklinge03);
	B_LogEntry			(CH5_Uriziel,"Xardas ha arrancado la gema m�gica de la espada URIZIEL. El poder de esta hoja reside ahora en una runa m�gica de poderes sin igual.");
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_SUCCESS);
};	

func void Info_Xardas_MAKERUNE_NO ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_06"); //�NO, no lo hagas!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_07"); //Como desees. �La espada seguir� teniendo sus poderes m�gicos!
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
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//�Puedes ense�arme?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //Te elevar� hasta el Sexto C�rculo de Magia.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //Ten en cuenta que �nicamente los magos m�s poderosos ingresan en el Sexto C�rculo. Est� reservado para aquellos cuya vida es una se�al.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //Tu se�al es la unificaci�n de los elementos.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //El Sexto C�rculo te permite hacer uso de la magia de cualquier runa.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //Y no olvides que no debes reclamar el poder, sino servirlo.
			
			CreateInvItem 		(hero, DMB_ARMOR_M);		// SN: kann nicht mit B_GiveInvItem() �bergeben werden, da Xardas sonst nackt dasteht!
			AI_EquipBestArmor	(hero);

			//Fakeitem f�r Bildschirmausgabe
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
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//Todav�a no. Tienes el talento, pero careces de la suficiente experiencia. Que Saturas te ense�e primero; despu�s te instruir� yo.
		
		AI_StopProcessInfos	( self );
	};
};

	
