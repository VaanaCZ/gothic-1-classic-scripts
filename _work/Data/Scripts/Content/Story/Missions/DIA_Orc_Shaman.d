//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_OrcShaman_EXIT (C_INFO)
{
	npc			= ORC_2200_Shaman;
	nr			= 999;
	condition	= Info_OrcShaman_EXIT_Condition;
	information	= Info_OrcShaman_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_OrcShaman_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_OrcShaman_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info THX
//---------------------------------------------------------------------
instance  Info_OrcShaman_THX (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_THX_Condition;
	information	= Info_OrcShaman_THX_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_OrcShaman_THX_Condition()
{	
	if	(Kapitel == 4)
	{
		return TRUE;
	};
};
FUNC void  Info_OrcShaman_THX_Info()
{
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_01"); //Deberte gracias, forastero.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_02"); //Orcos malos querer matarme.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_03"); //Hermanos anta�o enemigos hoy.
}; 

//---------------------------------------------------------------------
//	Info WHO
//---------------------------------------------------------------------
instance  Info_OrcShaman_WHO (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_WHO_Condition;
	information	= Info_OrcShaman_WHO_Info;
	important	= 0;
	permanent	= 0;
	description = "�Qui�n eres?";
};

FUNC int  Info_OrcShaman_WHO_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_WHO_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_WHO_15_01"); //�Qui�n eres?
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_02"); //Nombre ser Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_03"); //Ser hijo de esp�ritu. Gente llamar cham�n.
}; 

//---------------------------------------------------------------------
//	Info TONGUE
//---------------------------------------------------------------------
instance  Info_OrcShaman_TONGUE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_TONGUE_Condition;
	information	= Info_OrcShaman_TONGUE_Info;
	important	= 0;
	permanent	= 0;
	description = "�C�mo es que conoces nuestro idioma?";
};

FUNC int  Info_OrcShaman_TONGUE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_TONGUE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_TONGUE_15_01"); //�C�mo es que conoces nuestro idioma?
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_02"); //Ur-Shak ser esclavo de humanos en mina.
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_03"); //Escapar. Hacer muchos inviernos.
}; 

//---------------------------------------------------------------------
//	Info MINE
//---------------------------------------------------------------------
instance  Info_OrcShaman_MINE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_MINE_Condition;
	information	= Info_OrcShaman_MINE_Info;
	important	= 0;
	permanent	= 0;
	description = "�Eras esclavo en la mina? �En qu� mina?";
};

FUNC int  Info_OrcShaman_MINE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_TONGUE))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_MINE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_MINE_15_01"); //�Fuiste un esclavo en la mina? �Qu� mina?
	AI_Output 		(self, hero,"Info_OrcShaman_MINE_17_02"); //Mina estar bajo poblado en Hondonada.
}; 

//---------------------------------------------------------------------
//	Info WHY
//---------------------------------------------------------------------
instance  Info_OrcShaman_WHY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_WHY_Condition;
	information	= Info_OrcShaman_WHY_Info;
	important	= 0;
	permanent	= 0;
	description = "�Por qu� se te oponen tus hermanos?";
};

FUNC int  Info_OrcShaman_WHY_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_WHY_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_WHY_15_01"); //�Por qu� est�s enfrentado a tus hermanos?
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_02"); //Ur-Shak estar en desgracia..
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_03"); //Mancillar creencia en Krushak.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_04"); //Creer que KRUSHAK ser mal demonio.
}; 

//---------------------------------------------------------------------
//	Info KRUSHAK
//---------------------------------------------------------------------
instance  Info_OrcShaman_KRUSHAK (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_KRUSHAK_Condition;
	information	= Info_OrcShaman_KRUSHAK_Info;
	important	= 0;
	permanent	= 0;
	description = "�Qu� significa KRUSHAK?";
};

FUNC int  Info_OrcShaman_KRUSHAK_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_WHY))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_KRUSHAK_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_01"); //�Qu� quiere decir KRUSHAK?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_02"); //Humanos decir DORMIR.
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_03"); //�Quieres decir 'Durmiente'?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_04"); //�S�, humanos decir DURMIENTE!
}; 

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance  Info_OrcShaman_SLEEPER (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SLEEPER_Condition;
	information	= Info_OrcShaman_SLEEPER_Info;
	important	= 0;
	permanent	= 0;
	description = "�Qu� sabes del Durmiente?";
};

FUNC int  Info_OrcShaman_SLEEPER_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_KRUSHAK))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_SLEEPER_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_01"); //�Qu� sabes acerca del Durmiente?
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_02"); //Ser cinco hermanos. �Hacer muchos inviernos!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_03"); //�Ser hijos de esp�ritu, como Ur-Shak!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_04"); //�Quieres decir cinco chamanes!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_05"); //�Invocar a KRUSHAK!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_06"); //�Querer derrotar clan de enemigo!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_07"); //�Cinco hermanos construir templo bajo tierra para KRUSHAK!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_08"); //�Un templo subterr�neo para el Durmiente! �Eso es lo que debi� querer decir Xaras cuando me dijo que la entrada estaba 'en la villa orca'!
}; 

//---------------------------------------------------------------------
//	Info CURSE
//---------------------------------------------------------------------
instance  Info_OrcShaman_CURSE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_CURSE_Condition;
	information	= Info_OrcShaman_CURSE_Info;
	important	= 0;
	permanent	= 0;
	description = "�Qu� sucedi� en el templo subterr�neo?";
};

FUNC int  Info_OrcShaman_CURSE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_SLEEPER))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_CURSE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_01"); //�Qu� ocurri� en el templo subterr�neo?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_02"); //Los hermanos entregar coraz�n a KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_03"); //Pero KRUSHAK malo. KRUSHAK maldecir a todos los que construir templo.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_04"); //Hermanos sin coraz�n, muertos y vivos. A la vez.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_05"); //KRUSHAK ahora tener coraz�n de hermanos. Coraz�n ahora ser poder para KRUSHAK.
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_06"); //�Qu� les ocurri� a los obreros que construyeron el templo?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_07"); //KRUSHAK maldecir a todos. Obreros tambi�n. Todos muertos y vivos mismo tiempo.
}; 

//---------------------------------------------------------------------
//	Info OUTSIDE
//---------------------------------------------------------------------
instance  Info_OrcShaman_OUTSIDE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_OUTSIDE_Condition;
	information	= Info_OrcShaman_OUTSIDE_Info;
	important	= 0;
	permanent	= 0;
	description = "�No hicieron nada al respecto los orcos de la superficie?";
};

FUNC int  Info_OrcShaman_OUTSIDE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_CURSE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_OUTSIDE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_OUTSIDE_15_01"); //�Y los orcos de la superficie no hicieron nada al respecto?
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_02"); //Sellar templo. Hermanos hoy adorar a KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_03"); //Sacrificios para KRUSHAK, para que no ser malo.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_04"); //Ur-Shak pensar que sacrificio ser malo. Decir que KRUSHAK malo.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_05"); //Hermanos no querer o�r. Hermanos decir que Ur-Shak irse. Hermanos pegar a Ur-Shak.
}; 

//---------------------------------------------------------------------
//	Info INTEMPLE
//---------------------------------------------------------------------
instance  Info_OrcShaman_INTEMPLE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_INTEMPLE_Condition;
	information	= Info_OrcShaman_INTEMPLE_Info;
	important	= 0;
	permanent	= 0;
	description = "�Tengo que entrar en el templo subterr�neo! �Puedes llevarme?";
};

FUNC int  Info_OrcShaman_INTEMPLE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_OUTSIDE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_INTEMPLE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_01"); //�Tengo que entrar en el templo subterr�neo! �Puedes llevarme hasta all�?
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_02"); //Ur-Shak dar gracias a forastero. Forastero salvar a Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_03"); //Pero entrada de templo ser hogar. Ur-Shak no poder ir a hogar.
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_04"); //Entiendo; quieres decir que no te permiten entrar en la villa orca.
};

//---------------------------------------------------------------------
//	Info MAP
//---------------------------------------------------------------------
instance  Info_OrcShaman_MAP (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_MAP_Condition;
	information	= Info_OrcShaman_MAP_Info;
	important	= 0;
	permanent	= 0;
	description = "�Puedes indicarme en mi mapa d�nde est� el pueblo orco?";
};

FUNC int  Info_OrcShaman_MAP_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_OrcShaman_INTEMPLE)
	&&	Npc_HasItems (hero, ItWrWorldmap)
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_MAP_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_01"); //�Puedes indicarme la situaci�n de la villa orca en mi mapa?
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_02"); //Hogar de Ur-Shak estar donde mapa estar vac�o.
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_03"); //�Forastero dar mapa a Ur-Shak; Ur-Shak acabar mapa!
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_04"); //(garabatea en el mapa)
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_05"); //Es asombroso; eres un gran cart�grafo. �Gracias!

	B_GiveInvItems  (hero, self, ItWrWorldmap, 1);
	Npc_RemoveInvItem(self, ItWrWorldmap);
	CreateInvItem	 (self, ItWrWorldmap_Orc);
	B_GiveInvItems  (self, hero, ItWrWorldmap_Orc, 1);
}; 

//---------------------------------------------------------------------
//	Info FIGHT
//---------------------------------------------------------------------
instance  Info_OrcShaman_FIGHT (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_FIGHT_Condition;
	information	= Info_OrcShaman_FIGHT_Info;
	important	= 0;
	permanent	= 0;
	description = "�Bien, parece que tendr� que abrirme paso luchando!";
};

FUNC int  Info_OrcShaman_FIGHT_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_INTEMPLE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_FIGHT_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_FIGHT_15_01"); //�Bueno, parece que tendr� que abrirme camino a la fuerza!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_02"); //�Hermanos en hogar ser muy fuertes! �Hermanos ser muuuuchos!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_03"); //Forastero no ir. �Muchos guerreros! �Forastero morir!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_04"); //Otros hijos de esp�ritu en hogar. �Forastero encender fuego y forastero morir!
}; 

//---------------------------------------------------------------------
//	Info OTHERWAY
//---------------------------------------------------------------------
instance  Info_OrcShaman_OTHERWAY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_OTHERWAY_Condition;
	information	= Info_OrcShaman_OTHERWAY_Info;
	important	= 0;
	permanent	= 0;
	description = "�Vale, vale, pero tengo que encontrar el modo de entrar en el templo!";
};

FUNC int  Info_OrcShaman_OTHERWAY_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_FIGHT))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_OTHERWAY_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_01"); //�De acuerdo, de acuerdo, pero tengo que encontrar la manera de entrar en el templo!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_02"); //�Ur-Shak saber c�mo! �Forastero llevar ULU-MULU!
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_03"); //�ULU-MULU? �Qu� es un Ulu-Mulu?
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_04"); //�Ser se�al de amistad! �Hermanos respetar ULU-MULU!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_05"); //�Si forastero llevar ULU-MULU, forastero no morir!
};

//---------------------------------------------------------------------
//	Info ULUMULU
//---------------------------------------------------------------------
instance  Info_OrcShaman_ULUMULU (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_ULUMULU_Condition;
	information	= Info_OrcShaman_ULUMULU_Info;
	important	= 0;
	permanent	= 0;
	description = "�D�nde puedo conseguir este Ulu-Mulu?";
};

FUNC int  Info_OrcShaman_ULUMULU_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_OTHERWAY))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_ULUMULU_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_01"); //�D�nde puedo conseguir este Ulu-Mulu?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_02"); //�Forastero ir a ver a amigo de Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_03"); //�Amigo de Ur-Shak dar ULU-MULU! �Forastero llevar ULU-MULU y forastero no morir!
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_04"); //Ya; ya he entendido lo de 'no morir', pero, �d�nde puedo encontrar a tu amigo?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_05"); //Amigo de Ur-Shak en mina de humanos. Amigo no huir con Ur-Shak. Amigo estar enfermo entonces.

	B_Story_FoundUrShak	();
	
	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"�Te ten�an preso en la Mina Libre?",										Info_OrcShaman_ULUMULU_FM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"�Estabas prisionero en la mina abandonada?",									Info_OrcShaman_ULUMULU_VM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"�Te ten�an cautivo en la Vieja Mina?",										Info_OrcShaman_ULUMULU_AM);
}; 

func void Info_OrcShaman_ULUMULU_VM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_08"); //�Estuviste prisionero en la mina abandonada?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_09"); //Ur-Shak no conocer palabra.
};

func void Info_OrcShaman_ULUMULU_AM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_10"); //�Estuviste cautivo en la Vieja Mina?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_11"); //�Ur-Shak no comprender!
};

func void Info_OrcShaman_ULUMULU_FM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_12"); //�Te retuvieron en la Mina Libre?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_13"); //Ur-Shak prisionero en mina bajo poblado en Hondonada.
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_14"); //�Ur-Shak creer gente llamarlo as�!

	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
};

//---------------------------------------------------------------------
//	Info BYEBYE
//---------------------------------------------------------------------
instance  Info_OrcShaman_BYEBYE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_BYEBYE_Condition;
	information	= Info_OrcShaman_BYEBYE_Info;
	important	= 0;
	permanent	= 0;
	description = "�Gracias por tu ayuda!";
};

FUNC int  Info_OrcShaman_BYEBYE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_ULUMULU))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_BYEBYE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_01"); //�Gracias por tu ayuda!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_02"); //Ur-Shak dar gracias a forastero. Forastero salvar a Ur-Shak. Ahora, forastero amigo de Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_03"); //Amigo aceptar regalo. �Tomar talism�n de Ur-Shak! �Talism�n proteger de aliento de lagarto de fuego!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_04"); //Ur-Shak no poder volver a hogar. �Ur-Shak vivir aqu� ahora! �Amigo volver cuando necesitar ayuda!
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_05"); //�Puede que te tome la palabra!

	B_Story_FriendOfUrShak	();

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info FRIENDLYHELLO
//---------------------------------------------------------------------
instance  Info_OrcShaman_FRIENDLYHELLO (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_FRIENDLYHELLO_Condition;
	information	= Info_OrcShaman_FRIENDLYHELLO_Info;
	important	= 0;
	permanent	= 0;
	description = "�Qu� tal te va, amigo m�o?";
};

FUNC int  Info_OrcShaman_FRIENDLYHELLO_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_OrcShaman_BYEBYE)
	&&	FriendOfUrShak
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_FRIENDLYHELLO_Info()
{
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_01"); //�C�mo te va, amigo?
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_02"); //�Ur-Shak tener salud!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_03"); //�Ur-Shak ahora intentar encontrar ULU-MULU para �l!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_04"); //�Tal vez Ur-Shak poder volver a hogar con ULU-MULU propio!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_05"); //�Amigo volver cuando necesitar ayuda!
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_06"); //�Cu�date!
	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info ORCCITY
//---------------------------------------------------------------------
instance  Info_OrcShaman_ORCCITY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_ORCCITY_Condition;
	information	= Info_OrcShaman_ORCCITY_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_OrcShaman_ORCCITY_Condition()
{	
	if	(Npc_GetDistToWP(hero, "SPAWN_OW_WARAN_ORC_01")<1000)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_ORCCITY_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(hero, self);

	AI_Output 		(self, hero,"Info_OrcShaman_ORCCITY_17_01"); //�Ur-Shak dar la bienvenida a amigo!

	if (Npc_HasItems(hero, UluMulu))
	{
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_02"); //�Amigo tener ULU-MULU! �Eso ser bueno!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_03"); //�Amigo no olvidar llevar ULU-MULU en mano cuando cruzar puente!
	}
	else
	{	
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_04"); //�Amigo no tener ULU-MULU! �Eso no ser bueno!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_05"); //�Amigo no cruzar puente o amigo morir!
	};
}; 

//---------------------------------------------------------------------
//	Info YOUHERE
//---------------------------------------------------------------------
instance  Info_OrcShaman_YOUHERE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_YOUHERE_Condition;
	information	= Info_OrcShaman_YOUHERE_Info;
	important	= 0;
	permanent	= 0;
	description = "�Qu� est�s haciendo tan cerca del pueblo?";
};

FUNC int  Info_OrcShaman_YOUHERE_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_ORCCITY)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_YOUHERE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_01"); //�Qu� haces tan cerca de la villa?
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_02"); //�Ur-Shak observar hermanos en hogar!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_03"); //�Ur-Shak pensar que KRUSHAK pronto despertar!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_04"); //�Ur-Shak esperar aqu� y luchar con KRUSHAK cuando despertar!
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_05"); //�QUE el Durmiente despertar� pronto? �Espero que te equivoques!
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_06"); //�Teniendo en cuenta todo lo que he o�do acerca del archidemonio, prefiero que siga durmiendo!
}; 

//---------------------------------------------------------------------
//	Info SEAL
//---------------------------------------------------------------------
instance  Info_OrcShaman_SEAL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SEAL_Condition;
	information	= Info_OrcShaman_SEAL_Info;
	important	= 0;
	permanent	= 0;
	description = "�Me dijiste que tus hermanos hab�an sellado el templo!";
};

FUNC int  Info_OrcShaman_SEAL_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_ORCCITY)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_SEAL_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SEAL_15_01"); //�La �ltima vez que nos vimos, me dijiste que tus hermanos hab�an sellado el templo!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_02"); //�Ur-Shak sellar templo en tierra muy bien!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_03"); //�Amigo no poder entrar!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_04"); //�Amigo usar magia de hermanos que ser hijos de esp�ritu como Ur-Shak!
}; 

//---------------------------------------------------------------------
//	Info SCROLL
//---------------------------------------------------------------------
instance  Info_OrcShaman_SCROLL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SCROLL_Condition;
	information	= Info_OrcShaman_SCROLL_Info;
	important	= 0;
	permanent	= 0;
	description = "�D�nde puedo encontrar esta magia?";
};

FUNC int  Info_OrcShaman_SCROLL_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_SEAL)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_SCROLL_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SCROLL_15_01"); //�D�nde puedo encontrar esta magia?
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_02"); //�Deber ir a cueva de hermanos que ser hijos de esp�ritu como Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_03"); //�Pero amigo deber tener cuidado cuando usar magia!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_04"); //�A los hermanos de Ur-Shak no gustarle! �ULU-MULU no ser de ayuda cuando amigo utilizar magia!

	B_LogEntry		(CH4_EnterTemple,"He vuelto a reunirme con el cham�n Ur-Shak frente al pueblo orco. Me ha dicho que s�lo puedo llegar a la antesala del templo subterr�neo mediante un conjuro orco. Los chamanes orcos guardan los conjuros de ese tipo en sus cuevas.");
}; 

//---------------------------------------------------------------------
//	Info IDOL
//---------------------------------------------------------------------
instance  Info_OrcShaman_IDOL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_IDOL_Condition;
	information	= Info_OrcShaman_IDOL_Info;
	important	= 0;
	permanent	= 0;
	description = "�Hay alg�n otro camino que lleve al templo?";
};

FUNC int  Info_OrcShaman_IDOL_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_SCROLL)
	&&	!OrcCity_Sanctum_OuterGateOpen
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_IDOL_Info()
{
	//SN: fliegt raus, da der Hinweis jetzt sofort nach dem Hinweis mit der Scroll gegeben wird.
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_01"); //Ich habe den Teleportzauber verbraucht und das Gitter zur Tempelvorhalle l�sst sich nicht �ffnen!
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_02"); //Wie komme ich jetzt wieder in den Tempel?

	if	Npc_HasItems(hero,ItMi_Stuff_Idol_Sleeper_01) 
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_03"); //�Amigo encontrar estatua en columna!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_04"); //�Ahora, amigo poder abrir portal a sal�n del templo!

		B_LogEntry	(CH4_EnterTemple,"Hay otro camino que tambi�n conduce al interior del templo. Debo usar la estatuilla del Durmiente de la columna sagrada de los chamanes orcos. �sta abrir� la puerta del templo.");
	}
	else
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_05"); //�Ahora amigo tener que quitar estatua de columna!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_06"); //�Ahora, estatua abrir puerta al sal�n del templo!

		B_LogEntry	(CH4_EnterTemple,"Existe otra forma de entrar en el templo. Hay una estatuilla del Durmiente en la columna sagrada de los chamanes orcos que abre la puerta del templo. A los hermanos de Ur-Shak no va a gustarles cuando descubran que estoy usando su icono sagrado.");
	};
}; 

