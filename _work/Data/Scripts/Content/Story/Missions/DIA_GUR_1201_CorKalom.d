// ****************************************
// 					FIRST 
// ****************************************

instance  GUR_1201_CorKalom_FIRST (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_FIRST_Condition;
	information		= GUR_1201_CorKalom_FIRST_Info;
	permanent		= 1;
	important		= 1;
};

FUNC int  GUR_1201_CorKalom_FIRST_Condition()
{
	if (Npc_IsInState(self,ZS_TALK))
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_FIRST_Info()
{
	AI_Output (self, other,"GUR_1201_CorKalom_FIRST_10_00"); //�Qu� quieres?
	Kalom_TalkedTo = TRUE;
};  

// ****************************************
// 				Wanna Join
// ****************************************

instance  GUR_1201_CorKalom_WannaJoin (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_WannaJoin_Condition;
	information		= GUR_1201_CorKalom_WannaJoin_Info;
	permanent		= 0;
	description		= "Me gustar�a ingresar en la Hermandad."; 
};

FUNC int  GUR_1201_CorKalom_WannaJoin_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_WannaJoin_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_WannaJoin_15_00"); //Me gustar�a ingresar en la Hermandad.
	AI_Output (other, self,"GUR_1201_CorKalom_WannaJoin_15_01"); //Tengo entendido que eres el maestro de los novicios y que t� decides qui�n puede ingresar.
	AI_Output (self, other,"GUR_1201_CorKalom_WannaJoin_10_02"); //�No tengo tiempo! Mis experimentos son demasiado importantes para que pierda el tiempo con nuevos novicios.
	AI_Output (self, other,"GUR_1201_CorKalom_WannaJoin_10_03"); //Confiar� en el juicio de los Baal. Cuando digan que est�s listo para vestir la t�nica de novicio, vuelve a verme.
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Cor Kalom dejar� que me una a la Hermandad como novicio si consigo convencer a cuatro de los Baal para que hablen en mi favor.");
};  

// ****************************************
// 				Kaloms Recipe
// ****************************************

instance  GUR_1201_CorKalom_Recipe (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 20;
	condition		= GUR_1201_CorKalom_Recipe_Condition;
	information		= GUR_1201_CorKalom_Recipe_Info;
	permanent		= 0;
	description		= "A uno de los mercaderes del Campamento Viejo le gustar�a tener una f�rmula."; 
};

FUNC int  GUR_1201_CorKalom_Recipe_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_Recipe_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_Recipe_15_00"); //A uno de los mercaderes del Campamento Viejo le gustar�a tener la f�rmula de una poci�n curativa.
	AI_Output (self, other,"GUR_1201_CorKalom_Recipe_10_01"); //�Mis f�rmulas no est�n a la venta!

	B_LogEntry	(CH1_KalomsRecipe,"Cor Kalom no me dar� la f�rmula. Pero en su laboratorio hay unos cofres... y �l parece tan ocupado...");
};  

// ****************************************
// 				Experimente (PERM)
// ****************************************

instance  GUR_1201_CorKalom_Experimente (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 2;
	condition		= GUR_1201_CorKalom_Experimente_Condition;
	information		= GUR_1201_CorKalom_Experimente_Info;
	permanent		= 1;
	description		= "�Qu� clase de experimentos realizas?"; 
};

FUNC int  GUR_1201_CorKalom_Experimente_Condition()
{
	if	(Kapitel <= 2)
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_Experimente_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_Experimente_15_00"); //�Qu� clase de experimentos realizas?
	AI_Output (self, other,"GUR_1201_CorKalom_Experimente_10_01"); //Mi investigaci�n tiene lugar a un nivel que no comprendes, muchacho. �No me hagas perder el tiempo!
};  

// ****************************************
// Info BRINGWEED
// ****************************************

instance  GUR_1201_CorKalom_BRINGWEED (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 2;
	condition		= GUR_1201_CorKalom_BRINGWEED_Condition;
	information		= GUR_1201_CorKalom_BRINGWEED_Info;
	permanent		= 1;
	description		= "�Estoy repartiendo la cosecha diaria de hierba del pantano!"; 
};

FUNC int  GUR_1201_CorKalom_BRINGWEED_Condition()
{
	if	(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC void  GUR_1201_CorKalom_BRINGWEED_Info()
{
	AI_Output				(other, self,"GUR_1201_CorKalom_BRINGWEED_15_00"); //�Estoy repartiendo la cosecha diaria de hierba del pantano!

	if	(Npc_HasItems(hero, ItMi_Plants_Swampherb_01) < 100)
	{
		AI_Output			(self, other,"GUR_1201_CorKalom_BRINGWEED_10_01"); //�Y se supone que ESO es todo? ���Espero TODA la cosecha, es decir, al menos 100 tallos!!!
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output			(self, other,"GUR_1201_CorKalom_BRINGWEED_10_02"); //Ah, d�mela. �Y qu�tate de mi vista!

		B_GiveInvItems	(hero, self, ItMi_Plants_Swampherb_01, 100);
        Npc_RemoveInvItems (self, ItMi_Plants_Swampherb_01, 100);
		BaalOrun_FetchWeed = LOG_SUCCESS;
		B_LogEntry			(CH1_DeliverWeed,"Cor Kalom ha estado tan insoportable como siempre cuando le he entregado la cosecha de hierba del pantano de hoy.");
		Log_SetTopicStatus	(CH1_DeliverWeed,	LOG_SUCCESS);
		B_GiveXP			(XP_DeliveredWeedHarvest);
		
		BaalOrun_FetchWeed = LOG_SUCCESS;		
		AI_StopProcessInfos	(self);
	};
};  

// ****************************************
// 				Crawlerzangen (PERM)
// ****************************************

instance  GUR_1201_CorKalom_Crawlerzangen (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 800;
	condition		= GUR_1201_CorKalom_Crawlerzangen_Condition;
	information		= GUR_1201_CorKalom_Crawlerzangen_Info;
	permanent		= 1;
	description		= "Tengo mand�bulas de reptadores para ti..."; 
};

FUNC int  GUR_1201_CorKalom_Crawlerzangen_Condition()
{
	if (Npc_HasItems(other, ItAt_Crawler_01)>0)
	{
		return 1;
	};
};

FUNC void  GUR_1201_CorKalom_Crawlerzangen_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_Crawlerzangen_15_00"); //Tengo mand�bulas de reptadores para ti...
	
	if (Npc_HasItems(other,ItAt_Crawler_01) > 9)
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_01"); //Muy bien. Ten algunas de mis mejores pociones como recompensa.
		CreateInvItems(self, ItFo_Potion_Mana_03, 3);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_03, 3);
	}
	else if (Npc_HasItems(other,ItAt_Crawler_01) > 2)
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_02"); //Bien. Toma algunas pociones como recompensa.
		CreateInvItems(self, ItFo_Potion_Mana_02, 2);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_02, 2);
	}
	else
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_03"); //Hm. �Eso es todo? Ten, toma una poci�n de mana y desaparece.
		CreateInvItems(self, ItFo_Potion_Mana_01, 1);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_01, 1);
		AI_StopProcessInfos(self);
	};
	
	B_GiveInvItems(other, self, ItAt_Crawler_01, Npc_HasItems(other,ItAt_Crawler_01));
}; 




// ****************************************
// 				Join PSI
// ****************************************

instance  GUR_1201_CorKalom_JoinPSI (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_JoinPSI_Condition;
	information		= GUR_1201_CorKalom_JoinPSI_Info;
	permanent		= 1;
	description		= "�Creo que he convencido a los Baal!"; 
};

FUNC int  GUR_1201_CorKalom_JoinPSI_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	Npc_KnowsInfo(hero, GUR_1201_CorKalom_WannaJoin) 
	{
		return 1;
	};
};

func void  GUR_1201_CorKalom_JoinPSI_Info()
{
	var int counter;
	counter = 0;	//Counter l�schen, da er noch den Stand der letzten Analyse hat!
	
	AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_00"); //�Creo que he convencido a los Baal!
	
	if (Npc_KnowsInfo(hero,DIA_BaalOrun_GotWeed))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_01"); //Baal Orun dice que he demostrado ser un siervo digno del Durmiente.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalCadar_SleepSpell))
	{
		AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_10_02"); //Contin�a...
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_03"); //Baal Cadar me considera un alumno receptivo.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalNamib_FirstTalk))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_04"); //Baal Namib est� convencido de que soy un verdadero creyente.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalTyon_Vision))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_05"); //Gracias a m�, Baal Tyon tuvo una visi�n.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalTondral_SendToKalom))
	{
		AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_10_06"); //�Y?
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_07"); //Baal Tondral dice que debo recibir la t�nica. Le he llevado un nuevo estudiante.
		counter = counter + 1;
	};
	//-------------------------------------	
	if	(hero.level >= 5)
	{	
		if (counter >= 4)
		{
			AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_08"); //Bien. Si los Baal te apoyan, eso me es suficiente.
			AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_09"); //Ten, ponte esto. Y ahora ve y s� �til.
	
			// Ernennung zum Novizen
			CreateInvItem		(self, NOV_ARMOR_M);
			B_GiveInvItems      (self,hero, NOV_ARMOR_M, 1);
			AI_EquipBestArmor	(other);
			Npc_SetTrueGuild	(hero,GIL_NOV);
			hero.guild = GIL_NOV;
			B_LogEntry			(CH1_JoinPsi,"Hoy, Cor Kalom me ha nombrado novicio. Ha estado tan insoportable como siempre, pero ya pertenezco de verdad a la Hermandad del Durmiente del campamento del pantano.");
			B_LogEntry			(GE_TraderPSI,"Obtendr� una mejor ARMADURA DE NOVICIO de manos de Baal Namib.");
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_SUCCESS);
			B_GiveXP			(XP_BecomeNovice);
	
			// Canceln der anderen Aufnahmen
			Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
			B_LogEntry			(CH1_JoinOC,"Al haber decidido unirme a la Hermandad del Durmiente del campamento del pantano, ya no puedo pertenecer a las Sombras de G�mez.");
			
			Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
			B_LogEntry			(CH1_JoinNC,"Ya no puedo unirme a los bandidos del Campamento Nuevo, pues mi lugar est� con la Hermandad del Durmiente.");
			
			//Log_SetTopicStatus	(CH1_LostNek,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_FiskNewDealer,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_KalomsRecipe,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_BringList,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_MordragKO,	LOG_FAILED);
		}
		else
		{
			AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_NOT_10_00"); //�Y?
			AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_NOT_15_01"); //Eso es todo.
			AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_NOT_10_02"); //�Est�s haciendo que pierda mi valioso tiempo! �Vuelve en cuanto cuatro de los Baal te consideren digno!
		};
	}
	else
	{	
		B_PrintGuildCondition(5);
	};
};

// ****************************************
// 				Join PSI2
// ****************************************

instance  GUR_1201_CorKalom_JoinPSI2 (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_JoinPSI2_Condition;
	information		= GUR_1201_CorKalom_JoinPSI2_Info;
	permanent		= 0;
	description		= "�Eso es todo? �No me das la bienvenida ni nada?"; 
};

FUNC int  GUR_1201_CorKalom_JoinPSI2_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return 1;
	};
};

func void  GUR_1201_CorKalom_JoinPSI2_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_JoinPSI_15_10"); //�Eso es todo? �No me das la bienvenida ni nada?
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_11"); //Bienvenido.
	AI_Output			(other, self,"GUR_1201_CorKalom_JoinPSI_15_12"); //Eso suena mucho mejor.
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_13"); //�No te quedes por aqu�! Haz algo. Coge estas hierbas y ll�vaselas a G�mez al Campamento Viejo.
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_14"); //Si sus secuaces no te dejan pasar, diles que te manda Cor Kalom.
	
	CreateInvItems		(self, itmijoint_3, 30);
	B_GiveInvItems      (self, hero, itmijoint_3, 30);

	KALOM_KRAUTBOTE = LOG_RUNNING;
	Log_CreateTopic		(CH1_KrautBote,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_KrautBote,	LOG_RUNNING);
	B_LogEntry			(CH1_KrautBote,"Cor Kalom me ha enviado a entregar hierba a G�mez en el Campamento Viejo."); 
	
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_15"); //�Qu�? �Sigues aqu�?
	AI_StopProcessInfos	(self);
};  

// **************************************************************************
// 							MISSION: 	Drug Monopol
// **************************************************************************



// --------------------------------------------------------------------------

INSTANCE Info_Kalom_DrugMonopol (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_Kalom_DrugMonopol_Condition;
	information	= Info_Kalom_DrugMonopol_Info;
	permanent 	= 0; 
	description = "�Tienes otro encargo para m�?";
};


FUNC INT Info_Kalom_DrugMonopol_Condition()
{
	if (Npc_GetTrueGuild(other)==GIL_NOV)
	{
		return 1;
	};
};

FUNC VOID Info_Kalom_DrugMonopol_Info()
{
	AI_Output (other, self,"Mis_1_Psi_Kalom_DrugMonopol_15_00"); //�Tienes otro encargo para m�?
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_01"); //En el Campamento Nuevo hay un peque�o grupo de hombres que han empezado a producir su propia hierba.
	//AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_02"); //Sie wollen unsere Kunden im Neuen Lager abwerben, Das werden wir nicht zulassen.
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_03"); //Haz que detengan su producci�n...
	AI_Output (other, self,"Mis_1_Psi_Kalom_DrugMonopol_15_04"); //�C�mo...?
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_05"); //�No me molestes con los detalles!
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_06"); //El campamento de los mezcladores debe de estar en alg�n lugar fuera del Campamento Nuevo. Ya sabes lo que tienes que hacer.

	Kalom_DrugMonopol = LOG_RUNNING;
	Log_CreateTopic		(CH1_DrugMonopol,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_DrugMonopol,	LOG_RUNNING);
	B_LogEntry			(CH1_DrugMonopol,"Cor Kalom quiere que acabe con la competencia de producci�n de hierba del Campamento Nuevo. No s� por d�nde empezar exactamente, pero deber�a hacerlo FRENTE al Campamento Nuevo.");

	var C_NPC Renyu; 	
	Renyu = Hlp_GetNpc(ORG_860_Renyu);
	Renyu.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	
	var C_NPC Killian; 	
	Killian = Hlp_GetNpc(ORG_861_Killian);
	Killian.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
};

// **************************************************************************
// 							SUCCESS
// **************************************************************************

INSTANCE Info_Kalom_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_Kalom_Success_Condition;
	information	= Info_Kalom_Success_Info;
	permanent	= 1;
	description = "Acerca de la producci�n de hierba en el Campamento Nuevo...";
};


FUNC INT Info_Kalom_Success_Condition()
{
	if	(Kalom_DrugMonopol == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Kalom_Success_Info()
{
	var C_NPC Killian; 	Killian = Hlp_GetNpc(ORG_861_Killian);
	var C_NPC Renyu; 	Renyu = Hlp_GetNpc(ORG_860_Renyu);
	var C_NPC Jacko; 	Jacko = Hlp_GetNpc(ORG_862_Jacko);
		
	AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_00"); //Acerca de la producci�n de hierba en el Campamento Nuevo...
	AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_01"); //�S�?
	
	if (Stooges_Fled != TRUE)
	{
		AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_02"); //No puedo encontrar a estos hombres.
		AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_03"); //No habr�a esperado otra cosa de ti.
	}
	else if (Stooges_Fled == TRUE)
	||		(Npc_IsDead(Jacko)&&Npc_IsDead(Renyu)&&Npc_IsDead(Killian))
 	{
		AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_04"); //Han desaparecido.
		AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_05"); //Me sorprendes. Subestim� tus capacidades. Tal vez puedas ser �til, a fin de cuentas.
		//AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_06"); //Rede mit den Baals.
		
		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry			(CH1_DrugMonopol,"He comunicado a Cor Kalom que la competencia de producci�n de hierba del Campamento Nuevo ha sido detenida. Su reacci�n ha sido tan 'amistosa' como de costumbre.");
		Log_SetTopicStatus	(CH1_DrugMonopol,	LOG_SUCCESS);
		B_GiveXP			(XP_DrugMonopol);
	};
};

// ****************************************************************
// 							KRAUTBOTE ZUR�CK
// ****************************************************************

INSTANCE Info_Kalom_KrautboteBACK(C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr 			= 1;
	condition	= Info_Kalom_KrautboteBACK_Condition;
	information	= Info_Kalom_KrautboteBACK_Info;
	permanent 	= 1;
	description = "He entregado la hierba.";
};

func INT Info_Kalom_KrautboteBACK_Condition()
{
	if	Kalom_DeliveredWeed
	{
		return TRUE;
	};
};

FUNC VOID Info_Kalom_KrautboteBACK_Info()
{
	AI_Output (other, self,"Mis_1_Psi_Kalom_KrautboteBACK_15_00"); //He entregado la hierba.
	
	if (Npc_HasItems (hero,itminugget)>=500)
	{
		AI_Output (self, other,"Mis_1_Psi_Kalom_KrautboteBACK_10_01"); //Bien. Haz que te encarguen algo en otro lugar.

		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry			(CH1_KrautBote,"Cor Kalom ha recibido el dinero de la entrega de hierba a los Magnates del Mineral.");
		Log_SetTopicStatus	(CH1_KrautBote,	LOG_SUCCESS);
		B_GiveInvItems		(hero, self, ItMiNugget, 500);
		B_GiveXP			(XP_WeedShipmentReported);

		Info_Kalom_KrautboteBACK.permanent = 0;
	}
	else
	{
		AI_Output (self, other,"Mis_1_Psi_Kalom_KrautboteBACK_10_02"); //�D�nde est�n las 500 pepitas, muchacho? �Aseg�rate de tra�rmelas deprisa!
	}; 
};














// **************************************************************************
//
// 									KAPITEL 2
//
// **************************************************************************
instance Info_CorKalom_BringFocus (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringFocus_Condition;
	information	= Info_CorKalom_BringFocus_Info;
	permanent	= 0;
	important 	= 0;
	description = "Me manda Y'Berion. Tengo el foco.";
};

FUNC INT Info_CorKalom_BringFocus_Condition()
{	
	if  (YBerion_BringFocus == LOG_SUCCESS) && ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_CorKalom_BringFocus_Info()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_Info3_15_01"); //Me manda Y'Berion. Tengo el foco.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_02"); //Ahhhh... El foco... Por fin. Ya puedo estudiar la magia de estos artefactos.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_03"); //Si tuviera suficiente secreci�n... �maldita sea!
	
	B_LogEntry		(CH2_Focus,"He dejado el ominoso foco donde Cor Kalom!");		
	Log_SetTopicStatus	(CH2_Focus,	LOG_SUCCESS);
	
	B_GiveInvItems	    (hero, self, Focus_1, 1);
	Npc_RemoveInvItem   (self, Focus_1);
	B_GiveXP			(XP_BringFocusToCorKalom);
};

// ------------------------------ 2. Belohnung f�r Fokus ergaunern ----------------------------------
instance Info_CorKalom_BLUFF (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr			= 10;
	condition	= Info_CorKalom_BLUFF_Condition;
	information	= Info_CorKalom_BLUFF_Info;
	permanent	= 0;
	description = "�Y'Berion dijo que me pagar�as si te tra�a el foco!";
};

FUNC INT Info_CorKalom_BLUFF_Condition()
{	
	if ( Npc_KnowsInfo (hero,Info_CorKalom_BringFocus)) 
	&& (CorKalom_BringMCQBalls != LOG_SUCCESS) 
	{
		return 1;
	};
};

FUNC VOID Info_CorKalom_BLUFF_Info()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BLUFF_Info3_15_01"); //�Y'Berion dijo que me pagar�as si te tra�a el foco!
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BLUFF_Info3_10_02"); //�De verdad? �Dijo eso? Bueno. �Supongo que basta con 50 pepitas!
	
	CreateInvItems (self,Itminugget,50);
	B_GiveInvItems (self, other, Itminugget,50);
};

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_SACHE (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_SACHE_Condition;
	information		= GUR_1201_CorKalom_SACHE_Info;
	important		= 0;
	permanent		= 0;
	description		= "�Secreci�n?"; 
};

FUNC int  GUR_1201_CorKalom_SACHE_Condition()
{	
	if (Npc_KnowsInfo ( hero,Info_CorKalom_BringFocus))
	{
		return 1;
	};

};
FUNC VOID  GUR_1201_CorKalom_SACHE_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_Info_15_01"); //�Secreci�n?
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_Info_10_02"); //S�. Como debes saber, yo elaboro las pociones m�gicas para la invocaci�n del Durmiente. Para ello necesito la secreci�n de las mand�bulas de los reptadores.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_Info_10_03"); //Sabes lo que son los reptadores, �no?

	Info_Clearchoices	(GUR_1201_CorKalom_SACHE);
	Info_Addchoice		(GUR_1201_CorKalom_SACHE,"No.",GUR_1201_CorKalom_SACHE_NEIN);
	Info_Addchoice		(GUR_1201_CorKalom_SACHE,"S�.",GUR_1201_CorKalom_SACHE_JA);
};  
//------------------------------------------------------
FUNC VOID GUR_1201_CorKalom_SACHE_NEIN ()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_NEIN_15_01"); //No.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_02"); //Son bestias peligrosas que recorren las minas oscuras y devoran la carne humana que pueden conseguir.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_03"); //Sus mand�bulas contienen una secreci�n especial.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_04"); //La uso para elaborar una poci�n que marca el sendero espiritual para el Durmiente.
	Info_ClearChoices (GUR_1201_CorKalom_SACHE);
};
//------------------------------------------------------
func void GUR_1201_CorKalom_SACHE_JA()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_JA_15_01"); //S�.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_JA_10_02"); //�Muy bien!
	Info_ClearChoices (GUR_1201_CorKalom_SACHE);
};
// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_VISION (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_VISION_Condition;
	information		= GUR_1201_CorKalom_VISION_Info;
	important		= 0;
	permanent		= 0;
	description		= "�Habla!"; 
};

FUNC int  GUR_1201_CorKalom_VISION_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_SACHE))
	{
		return 1;
	};

};
FUNC void  GUR_1201_CorKalom_VISION_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_VISION_Info_15_01"); //�Habla!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_02"); //Bueno, hace poco tuve una visi�n del mism�simo Durmiente. Me dio una se�al.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_03"); //Me hizo entender que hay un medio distinto a la secreci�n de las mand�bulas.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_04"); //Y me escogi� para que transmitiera esta misi�n. No soy yo quien te encarga esta misi�n. �Es el Durmiente!
	AI_Output			(other, self,"GUR_1201_CorKalom_VISION_Info_15_05"); //�Imposible!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_06"); //�C�llate, necio!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_07"); //Me hizo entender que la senda que he emprendido es la correcta, pero los medios no son lo bastante fuertes.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_08"); //Los medios adecuados se pueden encontrar en los reptadores, pero no basta con las mand�bulas.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_09"); //Debe haber algo m�s.
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_NEST (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_NEST_Condition;
	information		= GUR_1201_CorKalom_NEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "�Has estudiado alguna vez a los reptadores de las minas?"; 
};

FUNC int  GUR_1201_CorKalom_NEST_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_VISION))
	{
		return 1;
	};

};
func void  GUR_1201_CorKalom_NEST_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_NEST_Info_15_01"); //�Has estudiado alguna vez a los reptadores de las minas? Tal vez haya otra parte del cuerpo que contenga m�s secreci�n.
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_02"); //Hemos diseccionado algunos reptadores, pero la secreci�n s�lo parece estar en las mand�bulas.
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_03"); //Debe haber algo m�s. �Encuentra su nido y averiguar�s la respuesta!

	CorKalom_BringMCQBalls = LOG_RUNNING;

};  


// ***************************** Mission MCEggs annehmen ****************************************//
func void GUR_1201_CorKalom_WEG_ACCEPT()
{
	Log_CreateTopic		(CH2_MCEggs,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_MCEggs,	LOG_RUNNING);
	B_LogEntry		(CH2_MCEggs,"El Gur� Cor Kalom me ha pedido que busque una fuente de secreci�n de reptador en la Vieja Mina. Hasta la fecha se han utilizado las mand�bulas de los monstruos, pero tengo que encontrar algo diferente que produzca una secreci�n m�s potente.");

	if (PresseTourJanuar2001)
	{
		CreateInvItems	(hero,	ItAt_Crawlerqueen,	3);
	};
};


// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_WEG (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_WEG_Condition;
	information		= GUR_1201_CorKalom_WEG_Info;
	nr				= 21;
	important		= 0;
	permanent		= 0;
	description		= "�Parece una b�squeda oscura y siniestra!"; 
};

FUNC int  GUR_1201_CorKalom_WEG_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_NEST)) && !( Npc_KnowsInfo (hero,GUR_1201_CorKalom_RAT)) 
	{
		return 1;
	};
};

FUNC void  GUR_1201_CorKalom_WEG_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_WEG_Info_15_01"); //�Parece una b�squeda oscura y siniestra!
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_02"); //Toma estos pergaminos con conjuros de luz, que te vendr�n bien en los pozos oscuros.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_03"); //Los templarios de las minas te ayudar�n.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_04"); //Que el Durmiente te d� fuerzas, que su luz brille en tu sendero e ilumine tu esp�ritu, y que refuerce tu voluntad.

	CreateInvItems		(self, ItArScrollLight, 5);
	B_GiveInvItems      (self, other, ItArScrollLight, 5);

	GUR_1201_CorKalom_WEG_ACCEPT();
};  


// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_RAT (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_RAT_Condition;
	information		= GUR_1201_CorKalom_RAT_Info;
	nr				= 20;
	important		= 0;
	permanent		= 0;
	description		= "�Parece que esto podr�a convertirse en una aventura bastante sangrienta!"; 
};

FUNC int  GUR_1201_CorKalom_RAT_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_NEST)) && !( Npc_KnowsInfo (hero,GUR_1201_CorKalom_WEG)) 
	{
		return 1;
	};

};
func void  GUR_1201_CorKalom_RAT_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_RAT_Info_15_01"); //�Parece que esto podr�a convertirse en una aventura bastante sangrienta!
	AI_Output			(self, other,"GUR_1201_CorKalom_RAT_Info_10_02"); //Ll�vate estas pociones.
	AI_Output			(self, other,"GUR_1201_CorKalom_RAT_Info_10_03"); //No te las doy porque quiera que sigas vivo, sino porque hay que realizar esta misi�n.

	CreateInvItems		(self, ItFo_Potion_Health_02, 5);
	B_GiveInvItems      (self, other, ItFo_Potion_Health_02, 5);

	GUR_1201_CorKalom_WEG_ACCEPT();
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_RUN (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_RUN_Condition;
	information		= GUR_1201_CorKalom_RUN_Info;
	important		= 0;
	permanent		= 0;
	description		= "�D�nde encontrar� a los reptadores de la mina?"; 
};

FUNC int  GUR_1201_CorKalom_RUN_Condition()
{	
	if ((CorKalom_BringMCQBalls == LOG_RUNNING) 
	&&	(Npc_HasItems(hero, ItAt_Crawlerqueen)< 1)) 
	{
		return 1;
	};
};

FUNC void  GUR_1201_CorKalom_RUN_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_RUN_Info_15_01"); //�D�nde encontrar� a los reptadores de minas?
	AI_Output			(self, other,"GUR_1201_CorKalom_RUN_Info_10_02"); //En la Vieja Mina.

	if	!EnteredOldMine
	{
		AI_Output		(other, self,"GUR_1201_CorKalom_RUN_Info_15_03"); //�D�nde est� la Vieja Mina?
		AI_Output		(self, other,"GUR_1201_CorKalom_RUN_Info_10_04"); //Toma este mapa. En �l est�n marcados los lugares importantes que hay dentro de la Barrera.
		CreateInvItem	(self,ItWrWorldmap);   
		B_GiveInvItems  (self, other, ItWrWorldmap, 1);
	};
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_CRAWLER (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_CRAWLER_Condition;
	information		= GUR_1201_CorKalom_CRAWLER_Info;
	important		= 0;
	permanent		= 0;
	description		= "�Cu�l es el mejor modo de combatir a los reptadores de la mina?"; 
};

FUNC int  GUR_1201_CorKalom_CRAWLER_Condition()
{
	if Npc_KnowsInfo (hero, GUR_1201_CorKalom_RUN)
	&& (CorKalom_BringMCQBalls != LOG_SUCCESS) 
	{
	return 1;
	};
};


FUNC void  GUR_1201_CorKalom_CRAWLER_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_CRAWLER_Info_15_01"); //�Cu�l es el mejor modo de combatir a los reptadores de la mina?
	AI_Output			(self,other, "GUR_1201_CorKalom_CRAWLER_Info_10_02"); //En la mina hay templarios. Cazan a los reptadores por sus mand�bulas. Habla con Gor Na Vid. �l te ayudar�.
};

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_FIND (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_FIND_Condition;
	information		= GUR_1201_CorKalom_FIND_Info;
	important		= 0;
	permanent		= 0;
	description		= "�C�mo puedo encontrar el nido en la mina?"; 
};

FUNC int  GUR_1201_CorKalom_FIND_Condition()
{
	if ( Npc_KnowsInfo (hero, GUR_1201_CorKalom_CRAWLER))
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_FIND_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_FIND_Info_15_01"); //�C�mo puedo encontrar el nido en la mina?
	AI_Output			(self,other, "GUR_1201_CorKalom_FIND_Info_10_02"); //�sa es la parte m�s dif�cil de la misi�n. No puedo decirte d�nde buscar, ni lo que debes buscar. Pero el Durmiente te acompa�ar�.
	AI_Output			(other, self,"GUR_1201_CorKalom_FIND_Info_15_03"); //Vaya, menudo consuelo.
};
// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_CorKalom_BringMCQBalls_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringMCQBalls_Success_Condition;
	information	= Info_CorKalom_BringMCQBalls_Success_Info;
	permanent	= 0;
	description	= "He encontrado huevos de una reina reptadora.";
};                       

FUNC INT Info_CorKalom_BringMCQBalls_Success_Condition()
{
	if (  Npc_HasItems(hero, ItAt_Crawlerqueen) >= 3 )
	{
		return 1;
	};
};
FUNC VOID Info_CorKalom_BringMCQBalls_Success_Info()
{	
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_01"); //He encontrado huevos de una reina reptadora.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_02"); //Lo sab�a. Mi visi�n era una se�al. �Los huevos de la reina deben contener la potente secreci�n!
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_03"); //�Excelente, con ella puedo crear una poci�n para contactar con el Durmiente!
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_04"); //�Qu� hay de mi recompensa?
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_05"); //Oh, s�... Gracias.
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_06"); //Me refiero a una recompensa TANGIBLE.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_07"); //Vale, vale. �Qu� quieres?
	CorKalom_BringMCQBalls = LOG_SUCCESS;
	B_GiveInvItems	(hero, self, ItAt_Crawlerqueen,3);
	Npc_RemoveInvItems(self, ItAt_Crawlerqueen,3);
	B_GiveXP			(XP_BringMCEggs);
	B_LogEntry		(CH2_MCEggs,"Le he entregado a Cor Kalom tres huevos de reptador de la mina. Se mostr� muy antip�tico, �y tuve que pedirle mi exigua recompensa!");
	Log_SetTopicStatus	(CH2_MCEggs,	LOG_SUCCESS);
	
	B_LogEntry	(CH1_GotoPsiCamp,"Creo que ya s� lo bastante acerca de los asuntos de la secta como para informar a Mordrag al respecto.");
	B_LogEntry	(CH1_GotoPsi,"Creo que ya s� lo bastante acerca de los asuntos de la secta. Debo cont�rselo a Raven tan pronto como est� de vuelta en el Campamento Viejo.");
	
	Info_ClearChoices (Info_CorKalom_BringMCQBalls_Success);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Una runa.",Info_CorKalom_BringMCQBalls_Success_RUNE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Un arma.",Info_CorKalom_BringMCQBalls_Success_WAFFE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Una poci�n curativa.",Info_CorKalom_BringMCQBalls_Success_HEAL);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Mineral.",Info_CorKalom_BringMCQBalls_Success_ORE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Mana.",Info_CorKalom_BringMCQBalls_Success_MANA);
};
func void Info_CorKalom_BringMCQBalls_Success_RUNE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_15_01"); //Una runa.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_10_02"); //�Que esta runa ilumine tu camino!
	CreateInvItem		(self,ItArRuneLight);
	B_GiveInvItems      (self, hero, ItArRuneLight, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);

};	
func void Info_CorKalom_BringMCQBalls_Success_WAFFE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_15_01"); //Un arma.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_10_02"); //�Que esta arma destruya a tus enemigos!
	CreateInvItem		(self, ItMw_1H_Mace_War_03);
	B_GiveInvItems      (self, hero, ItMw_1H_Mace_War_03, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_HEAL()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_15_01"); //Una poci�n curativa.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_10_02"); //�Que esta poci�n prolongue tu vida!
	CreateInvItem		(self,ItFo_Potion_Health_Perma_01);
	B_GiveInvItems      (self, hero, ItFo_Potion_Health_Perma_01, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_ORE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_15_01"); //Mineral.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_10_02"); //�Acepta este mineral como muestra de gratitud de toda la Hermandad!
	CreateInvItems		(self,ItMinugget,100);
	B_GiveInvItems      (self, hero, ItMinugget, 100);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_MANA()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_15_01"); //Mana.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_10_02"); //�Que esta poci�n refuerce la magia que llevas en tu interior!
	CreateInvItem		(self,ItFo_Potion_Mana_Perma_01);
	B_GiveInvItems      (self, hero, ItFo_Potion_Mana_Perma_01, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	

// **************************************************************************
// 				MISSION: Bring Book
// **************************************************************************
INSTANCE Info_CorKalom_BringBook (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringBook_Condition;
	information	= Info_CorKalom_BringBook_Info;
	permanent	= 0;
	description = "�Podemos empezar a convocar al Durmiente?";
};

func INT Info_CorKalom_BringBook_Condition()
{
	if ( CorKalom_BringMCQBalls == LOG_SUCCESS )
	{
		return 1;
	};	
};
func VOID Info_CorKalom_BringBook_Info()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Info_15_01"); //�Podemos empezar a convocar al Durmiente?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_02"); //�No! A�n no he encontrado el modo de cargar el foco.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_03"); //Nos falta el conocimiento antiguo acerca de estos artefactos.
	AI_Output			(other, self,"Info_CorKalom_BringBook_Info_15_04"); //�Quieres decir que recog� los huevos para nada?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_05"); //No, esc�chame. Hay un almanaque que contiene lo que necesitamos saber.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_06"); //Compramos el libro al mago del fuego Corristo del Campamento Viejo.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_07"); //Sin embargo, fue robado cuando trataban de traerlo desde el Campamento Viejo.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_08"); //Hab�a encargado a Talas, un novicio, que recogiera el libro, pero le robaron.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_09"); //Me defraud�, pero le he dado otra oportunidad. Debe recuperar el almanaque perdido.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_10"); //Habla con �l. Necesitar� toda la ayuda que pueda recibir.
	
	CorKalom_BringBook = LOG_RUNNING;
	Log_CreateTopic		(CH2_Book,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Book,	LOG_RUNNING);
	B_LogEntry		(CH2_Book,"Cor Kalom necesita un �ltimo objeto para la gran invocaci�n del Durmiente. Se trata de un libro acerca del uso de los focos de piedra. El novicio Talas fue tan patoso que los trasgos robaron el almanaque. Justo ahora est� buscando a alguien en el patio delantero que le ayude a recuperar el libro.");

	Info_ClearChoices (Info_CorKalom_BringBook);
	
	Info_Addchoice(Info_CorKalom_BringBook,DIALOG_BACK						,Info_CorKalom_BringBook_BACK);
	Info_Addchoice(Info_CorKalom_BringBook,"�Qu� conseguir� a cambio?",Info_CorKalom_BringBook_EARN);
	Info_Addchoice(Info_CorKalom_BringBook,"�Qui�n rob� el almanaque?",Info_CorKalom_BringBook_WHO);
	Info_Addchoice(Info_CorKalom_BringBook,"�D�nde puedo encontrar a Talas?",Info_CorKalom_BringBook_WHERE);
};
func void Info_CorKalom_BringBook_BACK ()
{
	Info_ClearChoices (Info_CorKalom_BringBook);
};

func void Info_CorKalom_BringBook_WHERE ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Where_15_01"); //�D�nde puedo encontrar a Talas?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Where_10_02"); //Est� en el atrio de la colina del templo, intentando conseguir que le ayude alguien.
};
func void Info_CorKalom_BringBook_WHO ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Who_15_01"); //�Qui�n rob� el almanaque?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Who_10_02"); //Talas me dijo que fue asaltado por trasgos negros.
};
func void Info_CorKalom_BringBook_EARN ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Earn_15_01"); //�Qu� conseguir� a cambio?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Earn_10_02"); //�Acaso no he demostrado ya mi generosidad? Recibir�s una recompensa justa.
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_CorKalom_BringBook_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringBook_Success_Condition;
	information	= Info_CorKalom_BringBook_Success_Info;
	permanent	= 0;
	description	= "He encontrado el libro.";
};                       

FUNC INT Info_CorKalom_BringBook_Success_Condition()
{	
	if (	Npc_HasItems (Hero,ItWrFokusbuch)
	&&		(CorKalom_BringBook==LOG_RUNNING)	)
	{
		return 1 ; 
	};
};
FUNC VOID Info_CorKalom_BringBook_Success_Info()
{	
	AI_Output			(other, self,"Info_CorKalom_BringBook_Success_15_01"); //He encontrado el libro.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_02"); //Buen trabajo. Tenemos todo lo que necesitamos.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_03"); //Ahora acabar� los preparativos.
	AI_Output			(other, self,"Info_CorKalom_BringBook_Success_15_04"); //�D�nde tendr� lugar la invocaci�n?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_05"); //Espera hasta la noche, y ven al patio del templo. Nos reuniremos aqu� para invocar al poderoso Durmiente.

	B_GiveInvItems	    (hero, self, ItWrFokusbuch, 1);
	Npc_RemoveInvItem   (self,ItWrFokusbuch);
	B_GiveXP			(XP_BringBook);
	CorKalom_BringBook = LOG_SUCCESS;

	B_LogEntry		(CH2_Book,"Tras entregarle el almanaque a Cor Kalom, �ste prepara a la Hermandad para la gran invocaci�n del Durmiente. �sta tendr� lugar en el patio delantero del templo durante la noche.");
	Log_SetTopicStatus	(CH2_Book,	LOG_SUCCESS);

	//-------- Gurus und Novizen auf dem Tempelvorplatz versammeln --------
	AI_StopProcessInfos	(self);

	B_Story_PrepareRitual();
};


// ----------------------------BELOHNUNG ---------------------------------------
instance Info_CorKalom_Belohnung (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr			= 1;
	condition	= Info_CorKalom_Belohnung_Condition;
	information	= Info_CorKalom_Belohnung_Info;
	permanent	= 0;
	description = "�Qu� hay de mi pago?";
};                       

FUNC INT Info_CorKalom_Belohnung_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_CorKalom_BringBook_Success) )
	{
		return 1;
	};
};

FUNC VOID Info_CorKalom_Belohnung_Info()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_15_00");//�Qu� hay de mi pago?
	AI_Output			(self, other,"Info_CorKalom_Belohnung_10_01");//�Qu� quieres?
	
	Info_ClearChoices (Info_CorKalom_Belohnung);
	Info_Addchoice(Info_CorKalom_Belohnung,"Un pergamino de conjuro.",Info_CorKalom_Belohnung_SCROLL);
	Info_Addchoice(Info_CorKalom_Belohnung,"Mineral.",Info_CorKalom_Belohnung_ORE);
	Info_Addchoice(Info_CorKalom_Belohnung,"Poci�n de mana.",Info_CorKalom_Belohnung_MANA);

};
func void Info_CorKalom_Belohnung_SCROLL()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_SCROLL_15_00");//Dame estos pergaminos de conjuros.
	AI_Output			(self, other,"Info_CorKalom_Belohnung_SCROLL_10_01");//Usa estos hechizos sabiamente.
	CreateInvItems (self,ItArScrollSleep,3);
	B_GiveInvItems  (self,hero,ItArScrollSleep,3);
	Info_ClearChoices (Info_CorKalom_Belohnung);
};
func void Info_CorKalom_Belohnung_ORE ()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_ORE_15_00");//Dame mineral.
	AI_Output			(self, other,"Info_CorKalom_Belohnung_ORE_10_01");//Esto deber�a satisfacer tu codicia de mineral.
	CreateInvItems  (self,ItMinugget,300);
	B_GiveInvItems  (self,hero,ItMinugget,300);
	Info_ClearChoices (Info_CorKalom_Belohnung);
};
func void Info_CorKalom_Belohnung_MANA()
{
	AI_Output						(other, self,"Info_CorKalom_Belohnung_MANA_15_00");//Pociones de mana.
	AI_Output						(self, other,"Info_CorKalom_Belohnung_MANA_10_01");//�Que estas pociones te den fuerza!
	CreateInvItems 		(self,ItFo_Potion_Mana_02,5);
	B_GiveInvItems      (self,hero,ItFo_Potion_Mana_02,5);
	Info_ClearChoices	(Info_CorKalom_Belohnung);
};

// ************************ EXIT **************************************************************************

instance  GUR_1201_CorKalom_Exit (C_INFO)
{
	npc			=  GUR_1201_CorKalom;
	nr			=  999;
	condition	=  GUR_1201_CorKalom_Exit_Condition;
	information	=  GUR_1201_CorKalom_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  GUR_1201_CorKalom_Exit_Condition()
{
	return 1;
};

FUNC VOID  GUR_1201_CorKalom_Exit_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_Exit_15_01"); //Nos vemos.
	AI_Output			(self, other,"GUR_1201_CorKalom_Exit_10_02"); //Que el Durmiente te ilumine.
	
	AI_StopProcessInfos	( self );
};
// *******************************************************************************************************



