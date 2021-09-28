//*********************************************************
//							EXIT									
//*********************************************************

instance  Sld_700_Lee_Exit (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  999;
	condition	=  Sld_700_Lee_Exit_Condition;
	information	=  Sld_700_Lee_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Sld_700_Lee_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Sld_700_Lee_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//*********************************************************
//						Greet									
//*********************************************************

instance  Sld_700_Lee_Greet (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  Sld_700_Lee_Greet_Condition;
	information	=  Sld_700_Lee_Greet_Info;
	permanent	=  0;
	description = "Eres el jefe de los mercenarios, ¿verdad?";
};                       

FUNC int  Sld_700_Lee_Greet_Condition()
{
	return 1;
};

FUNC VOID  Sld_700_Lee_Greet_Info()
{
	AI_Output (other, self,"DIA_Lee_Greet_15_00"); //Tú eres el jefe de los mercenarios, ¿verdad?
	AI_Output (self, other,"DIA_Lee_Greet_08_01"); //¡Exacto, muchacho!
};

//*********************************************************
//						Define									
//*********************************************************

instance  Sld_700_Lee_Define (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  Sld_700_Lee_Define_Condition;
	information	=  Sld_700_Lee_Define_Info;
	permanent	=  0;
	description = "¿Qué tienen que hacer los mercenarios de los magos?";
};                       

FUNC int  Sld_700_Lee_Define_Condition()
{
	if (Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_Define_Info()
{
	AI_Output (other, self,"DIA_Lee_Define_15_00"); //¿Qué es lo que tienen que hacer los mercenarios de los magos?
	AI_Output (self, other,"DIA_Lee_Define_08_01"); //Es muy sencillo. Proteger el mineral; proteger a los magos.
	AI_Output (self, other,"DIA_Lee_Define_08_02"); //A veces los magos tienen una tarea especial para alguno de nosotros.
};

//*********************************************************
//						Mitmachen									
//*********************************************************

instance  Sld_700_Lee_Mitmachen (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  2;
	condition	=  Sld_700_Lee_Mitmachen_Condition;
	information	=  Sld_700_Lee_Mitmachen_Info;
	permanent	=  0;
	description = "¡Me gustaría unirme a vosotros!";
};                       

FUNC int  Sld_700_Lee_Mitmachen_Condition()
{
	if	(Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	(oldHeroGuild == 0)
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_Mitmachen_Info()
{
	AI_Output (other, self,"DIA_Lee_Mitmachen_15_00"); //¡Me gustaría unirme a vosotros!
	AI_Output (self, other,"DIA_Lee_Mitmachen_08_01"); //¡Qué valor tienes! ¿De verdad crees que voy a aceptar al primero que venga?
	AI_Output (self, other,"DIA_Lee_Mitmachen_08_02"); //No puedes convertirte en uno de nosotros hasta que hayas pasado algún tiempo en el Campamento. ¡Te estaré observando!
};

//*********************************************************
//						NowReady for Sld?									
//*********************************************************
	var int Lee_SldPossible;
//*********************************************************

instance  Sld_700_Lee_NowReady (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  700;
	condition	=  Sld_700_Lee_NowReady_Condition;
	information	=  Sld_700_Lee_NowReady_Info;
	permanent	=  1;
	description = "Me gustaría convertirme en mercenario de los magos. ¿Estoy preparado?";
};                       

FUNC int  Sld_700_Lee_NowReady_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_ORG)
	&&	(Npc_KnowsInfo(hero,Sld_700_Lee_Mitmachen) || (hero.level >= 10))
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_NowReady_Info()
{
	AI_Output (other, self,"DIA_Lee_NowReady_15_00"); //Me gustaría ser uno de los mercenarios de los magos; ¿estoy listo ya?
	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_01"); //Tus hazañas en favor de la gente de la Vieja Mina han demostrado que eres un hombre de gran valía.
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_02"); //Estoy dispuesto a dejarte que te unas a los mercenarios.
	
		if hero.level < 10
		{
			AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_03"); //Pero todavía no estás listo para los mercenarios. Acumula algo de experiencia y lo conseguirás.
	    	AI_StopProcessInfos	(self);
			B_PrintGuildCondition(10);
	    }
	    else if hero.level >= 10
	    {
	    	AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //I'll give you a chance. How about it?
	    	Lee_SldPossible = TRUE;
		};
	}
	else
	{	
		if hero.level < 10
		{
			AI_Output (self, other,"DIA_Lee_NowReady_08_01"); //Todavía no tienes experiencia suficiente. Necesitas mejorar tus habilidades.
			B_PrintGuildCondition(10);
	    }
	    else if hero.level >= 10
	    {
	    	AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //Voy a darte una oportunidad. ¿Qué te parece?
	    	Lee_SldPossible = TRUE;
		};
	};
};

/*------------------------------------------------------------------------
							SÖLDNER WERDEN	2									
------------------------------------------------------------------------*/

instance  Sld_700_Lee_BECOMESLDNOW (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_BECOMESLDNOW_Condition;
	information		= Sld_700_Lee_BECOMESLDNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Quiero convertirme en mercenario."; 
};

FUNC int  Sld_700_Lee_BECOMESLDNOW_Condition()
{	
	if (Lee_SldPossible == TRUE)
	&& (hero.level >= 10)
	{
		return TRUE;
	};
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_Info_15_01"); //Quiero ser un mercenario.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_Info_08_02"); //Una excelente decisión. No te arrepentirás.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_Info_08_03"); //Dime una cosa: ¿por qué? ¿Por qué te has unido a nosotros y no al Campamento Viejo o a la Hermandad?

	Log_CreateTopic		(GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry			(GE_BecomeMercenary,"Lee me ha dejado unirme a los mercenarios.");
	
	Info_ClearChoices	(Sld_700_Lee_BECOMESLDNOW);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Los demás campamentos no merecen la pena.",Sld_700_Lee_BECOMESLDNOW_NOOTHER);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Quería libertad desde el principio.",Sld_700_Lee_BECOMESLDNOW_FREEDOM);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Más o menos sucedió de ese modo.",Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE);
};
  
FUNC void  Sld_700_Lee_BECOMESLDNOW_NOOTHER()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_15_01"); //Los otros campamentos no merecen la pena.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_08_02"); //Aquí lo único que merece la pena es la esperanza de ser libres. ¡Bienvenido, MERCENARIO!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_FREEDOM()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_15_01"); //Desde el principio he deseado la libertad.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_08_02"); //Recuperaremos nuestra libertad. Bienvenido, MERCENARIO.
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_15_01"); //Las cosas salieron así.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_08_02"); //Espero que las cosas no salgan de manera que seamos prisioneros aquí para siempre. Bienvenido, MERCENARIO.
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################
/*------------------------------------------------------------------------
							SZENE DAMM									
------------------------------------------------------------------------*/

instance Sld_700_Lee_DAMNPAST (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_DAMNPAST_Condition;
	information		= Sld_700_Lee_DAMNPAST_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Sld_700_Lee_DAMNPAST_Condition()
{	
	if (Saturas_BringFoci == 5)
	&& (Npc_GetDistToNpc (hero,self) < 1000)	
	&& (Npc_GetDistToWp (self,"NC_DAM") < 1000) 
	{
		return TRUE;
	};
};
func void  Sld_700_Lee_DAMNPAST_Info()
{
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_01"); //Hubo un tiempo en que llevaba una vida muy diferente.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_02"); //Yo era uno de los generales de este país.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_03"); //Me he pasado toda la vida luchando por mi país.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_04"); //Pero a los nobles no les caía bien, porque el rey escuchaba mis consejos. Y sabían que yo suponía una amenaza para sus negocios sucios.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_05"); //No había contado con su inventiva. Utilizaron a la mujer del rey para atacarme.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_06"); //Se me culpó de su asesinato sin sentido. El rey Rhobar no tuvo elección.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_07"); //Los servicios prestados a mi país me libraron del patíbulo. Pero me quitaron la libertad.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_08"); //Un día seré libre de nuevo. Entonces volveré y me vengaré.
	
	AI_AlignToWP		(self);
	
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_09"); //Me vengaré.
	
	Npc_ExchangeRoutine (self,"START");
	
	var C_NPC Homer;
	Homer = Hlp_GetNpc	(BAU_935_HOMER);
	Npc_ExchangeRoutine	(Homer,"START"); 
	AI_ContinueRoutine	(Homer);
};

//*********************************************************
//						FMTaken									
//*********************************************************

instance  Sld_700_Lee_FMTaken (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  Sld_700_Lee_FMTaken_Condition;
	information	=  Sld_700_Lee_FMTaken_Info;
	permanent	=  1;
	description = "¿Qué piensas de la mina?";
};                       

FUNC int  Sld_700_Lee_FMTaken_Condition()
{
	if	FMTaken
	{
		return TRUE;
	};
};

FUNC VOID  Sld_700_Lee_FMTaken_Info()
{
	AI_Output (other, self,"DIA_Lee_FMTaken_15_00"); //¿Qué piensas de la mina?
	
	if (Lee_freeminereport == 0) 					//SC hat jetzt die Möglichkeit, Lee über die freie Mine zu informieren! ***Björn***
	{
	
		AI_Output (self, other,"DIA_Lee_FMTaken_08_01"); //Han ido demasiado lejos; se arrepentirán.
	
	}
	else
	{
		AI_Output			(hero, self,"Info_Lee_now_freeminefree_15_01"); 	//¡Pero ya no deberían ser ninguna amenaza!
		AI_Output			(self, hero,"Sld_700_Lee_CHANGESIDE_Info_08_02"); 	//Has hecho mucho por nuestro campamento. Me vendría bien un hombre como tú.
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_03"); 		//Gracias. Me marcho.
		AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); 		//¡Un momento!
		AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); 		//Acepta esta runa de magia como muestra de nuestra gratitud por tus grandes hazañas.
		AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); 		//¡Gracias!
		AI_Output			(hero,	self,"Info_Exit_Info_15_01"); 				//Hasta la vista.


		B_LogEntry			(CH4_BannedFromOC,	"He informado a Lee acerca de la acción de limpieza que Gorn y yo hemos llevado a cabo en la Mina Libre. Se ha mostrado muy complacido.");
		
 	   	B_GiveInvItems (self,other, ItArRuneFirestorm, 1);
		B_GiveXP (500);		
		Lee_freeminereport = 0;
	};
};

/*------------------------------------------------------------------------
						WECHSEL VON GRD ZU SLD								
------------------------------------------------------------------------*/
instance  Sld_700_Lee_CHANGESIDE (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_CHANGESIDE_Condition;
	information		= Sld_700_Lee_CHANGESIDE_Info;
	important		= 0;
	permanent		= 0;
	description		= "¡Me han desterrado del Campamento Viejo, y quiero unirme a vosotros!"; 
};

FUNC int  Sld_700_Lee_CHANGESIDE_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_GOTOLEE))
	{
		return TRUE;
	};

};

FUNC void  Sld_700_Lee_CHANGESIDE_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_CHANGESIDE_Info_15_01"); //Me han expulsado del Campamento Viejo; ¡me gustaría unirme a vosotros!
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_02"); //Has hecho mucho por nuestro campamento. Me vendría bien un hombre como tú.
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_03"); //Seré breve. ¡Bienvenido al Campamento Nuevo, MERCENARIO!
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_04"); //Aquí tienes una armadura. Me alegro de tenerte entre nosotros.

	CreateInvItem		(self, SLD_ARMOR_M);
	B_GiveInvItems      (self, hero, SLD_ARMOR_M, 1);
	Npc_GetInvItemBySlot(hero, INV_ARMOR, 2);
	if (Hlp_GetInstanceID(item)==SLD_ARMOR_M)
	{	
		AI_EquipArmor	(hero, item);
	};
	
	Npc_SetTrueGuild	(hero, GIL_SLD);
	hero.guild = GIL_SLD;

	B_LogEntry			(CH4_BannedFromOC,"He cambiado de bando. Después de ser desterrado del Campamento Viejo, me he unido a los mercenarios. ¡Ahora tengo que volver con Saturas!");

	Log_CreateTopic 	(GE_TeacherNC,LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Lee puede enseñarme a combatir con ARMAS DE DOS MANOS. Aparte de eso, puede ayudarme a mejorar mi FUERZA y mi DESTREZA.");
};  

/*------------------------------------------------------------------------
							ARMOR									
------------------------------------------------------------------------*/
instance  Sld_700_Lee_ARMOR (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_ARMOR_Condition;
	information		= Sld_700_Lee_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Necesito una armadura mejor."; 
};

FUNC int  Sld_700_Lee_ARMOR_Condition()
{	
	if  (Npc_GetTrueGuild (hero) == GIL_SLD)
	{
		return TRUE;
	};

};
FUNC void  Sld_700_Lee_ARMOR_Info()
{
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_Info_15_01"); //Necesito una armadura mejor.
	AI_Output				(self, other,"Sld_700_Lee_ARMOR_Info_08_02"); //Primero tendrás que ganártela. Aparte de eso, no son baratas.
	
	Info_ClearChoices	(Sld_700_Lee_ARMOR);
	Info_AddChoice		(Sld_700_Lee_ARMOR,DIALOG_BACK,Sld_700_Lee_ARMOR_BACK);
	Info_AddChoice		(Sld_700_Lee_ARMOR,B_BuildBuyArmorString(NAME_LeeMercs, VALUE_SLD_ARMOR_M) ,Sld_700_Lee_ARMOR_M);
	Info_AddChoice		(Sld_700_Lee_ARMOR,B_BuildBuyArmorString(NAME_LeeHeavyMercs, VALUE_SLD_ARMOR_H),Sld_700_Lee_ARMOR_H);
};  
func void Sld_700_Lee_ARMOR_BACK()
{
	Info_ClearChoices (Sld_700_Lee_ARMOR);
};
func void Sld_700_Lee_ARMOR_M()
{
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_M_Info_08_01"); //Quiero una armadura intermedia.
	if (Kapitel < 3)
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_02"); //No tienes experiencia suficiente para llevar una armadura mejor. Vuelve cuando hayas acumulado más experiencia.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_SLD_ARMOR_M) 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_03"); //Sin mineral tampoco conseguirás una armadura.
	}
	else 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_04"); //Esta armadura es de buena calidad. Protegerá bien tu cuerpo.
		B_GiveInvItems  	(hero, self, ItMinugget,VALUE_SLD_ARMOR_M);
		CreateInvItem		(hero,SLD_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};
func void Sld_700_Lee_ARMOR_H()
{
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_H_Info_08_01"); //Dame una armadura pesada.
	if (Kapitel < 4)
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_02"); //No tienes experiencia suficiente para llevar la armadura pesada. Vuelve cuando hayas acumulado más experiencia.
	}
	else if (Npc_HasItems(hero,ItMinugget) < VALUE_SLD_ARMOR_H) 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_03"); //Sin mineral tampoco conseguirás una armadura.
	}
	else 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_04"); //Este armadura es la mejor que conseguirás en el interior de la Barrera. Puedes creerme cuando te digo que vale el mineral que cuesta.
		B_GiveInvItems  	(hero, self, ItMinugget,VALUE_SLD_ARMOR_H);

		CreateInvItem		(hero,SLD_ARMOR_H);	//SN: ohne B_GiveInvItem, weil sonst Lee nackt dasteht!

		// nur wegen Bildschirmausgabe "1 Gegenstand erhalten"
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};

};
/*------------------------------------------------------------------------
							STR + DEX								
------------------------------------------------------------------------*/
INSTANCE Sld_700_Lee_Teach(C_INFO)
{
	npc			= Sld_700_Lee;
	nr			= 10;
	condition	= Sld_700_Lee_Teach_Condition;
	information	= Sld_700_Lee_Teach_Info;
	permanent	= 1;
	description = "¿Puedes enseñarme algo?";
};                       

FUNC INT Sld_700_Lee_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_SLD)
	  
	{
		return TRUE;
	};
};

FUNC VOID Sld_700_Lee_Teach_Info()
{
	AI_Output(other,self,"Sld_700_Lee_Teach_15_00"); //¿Puedes enseñarme algo?
	AI_Output(self,other,"Sld_700_Lee_Teach_08_01"); //Puedo ayudarte a ser más fuerte y habilidoso.
	
	
	
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_BACK()
{
	
	Info_ClearChoices	(Sld_700_Lee_Teach);
};

func void Sld_700_Lee_Teach_STR_1()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_STR_5()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString( NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_5()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  Sld_700_Lee_ZWEIHAND1 (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_ZWEIHAND1_Condition;
	information		= Sld_700_Lee_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
};

FUNC int  Sld_700_Lee_ZWEIHAND1_Condition()
{	
	if 	( 
			(Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
			&& ((Npc_GetTrueGuild    (hero) == GIL_SLD) || ((Npc_GetTrueGuild(hero)==GIL_KDW) && (Kapitel >= 4))  )	//jetzt auch als Wassermagier im 4. Kapitel möglich ***BJÖRN***
		)
	{
		return TRUE;
	};

};
FUNC void  Sld_700_Lee_ZWEIHAND1_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_ZWEIHAND1_Info_15_01"); //Quiero aprender a manejar una espada de dos manos.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_02"); //De acuerdo; repasemos primero los puntos básicos.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_03"); //Mantén la espada en una posición horizontal. Para atacar a tu oponente con un arma tan pesada vas a necesitar describir un gran arco.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_04"); //Levanta el brazo y bájalo en línea recta. Normalmente basta con eso para derribar al oponente.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_05"); //Utiliza la inercia del arma para volver a levantarla.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_06"); //Las espadas de dos manos son ideales para coordinar mandobles que mantengan a los oponentes a distancia.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_07"); //Con eso debería bastar para empezar. Practica un poco.
	
		Sld_700_Lee_ZWEIHAND1.permanent = 0;
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  Sld_700_Lee_ZWEIHAND2 (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_ZWEIHAND2_Condition;
	information		= Sld_700_Lee_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
};

FUNC int  Sld_700_Lee_ZWEIHAND2_Condition()
{	
	if
		( 
			(Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
			&& ( (Npc_GetTrueGuild    (hero) == GIL_SLD) ||  ((Npc_GetTrueGuild(hero)==GIL_KDW) && (Kapitel >= 4))  )	//jetzt auch als Wassermagier im 4. Kapitel möglich ***BJÖRN***
		)
	{
		return TRUE;
	};

};
FUNC void  Sld_700_Lee_ZWEIHAND2_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_ZWEIHAND2_Info_15_01"); //Quiero aprender más acerca de cómo luchar con una espada de dos manos.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_02"); //Lo primero que necesitas hacer es cambiar tu postura básica. Levanta la espada y ponla vertical, agarra el pomo firmemente con las dos manos y sostenla a un lado de tu cuerpo.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_03"); //Bájala con rapidez y haz girar la espada sobre tu hombro. Ahora tienes la oportunidad de dar un mandoble rápido hacia la derecha.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_04"); //TU oponente no tendrá ninguna posibilidad de atacarte.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_05"); //O baja la espada desde la izquierda en un mandoble hacia delante para obligar a tu enemigo a retroceder.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_06"); //Da un giro para imprimir a tu siguiente ataque la inercia suficiente para abatir a tu oponente.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_07"); //Si con eso no ha bastado, utiliza el impulso restante para volver a blandir la espada.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_08"); //Cuando hayas acabado tu ataque, bloquea a tu oponente y espera la oportunidad de volver a atacar.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_09"); //La clave del éxito es variar tus posturas y cambiar de posición.
	
		Sld_700_Lee_ZWEIHAND2.permanent = 0;
	};
};  
