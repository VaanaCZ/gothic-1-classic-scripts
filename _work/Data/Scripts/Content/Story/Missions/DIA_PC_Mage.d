//*********************************************
//					 EXIT
//*********************************************
instance DIA_Milten_EXIT (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 999;
	condition	= DIA_Milten_EXIT_Condition;
	information	= DIA_Milten_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Milten_EXIT_Condition()
{
	return 1;
};

func VOID DIA_Milten_EXIT_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_00"); //Allá vamos.
	}
	else
	{
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_01"); //Hasta luego.
	};
	AI_StopProcessInfos	(self);
};

//*********************************************
//					First
//*********************************************

instance DIA_Milten_First (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_First_Condition;
	information	= DIA_Milten_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Milten_First_Condition()
{
	if ( (CorKalom_BringMCQBalls != LOG_SUCCESS) && (!Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE)) )
	&& (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};
};

func VOID DIA_Milten_First_Info()
{
	AI_Output (self, other,"DIA_Milten_First_02_00"); //No puedes cruzar este umbral hasta que el Maestro Corristo lo permita.
};

//*********************************************
//					 hallo
//*********************************************

instance DIA_Milten_Hello (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_Hello_Condition;
	information	= DIA_Milten_Hello_Info;
	permanent	= 0;
	description = "Estoy buscando al Gran Mago del Círculo del Fuego.";
};                       

FUNC INT DIA_Milten_Hello_Condition()
{
	if (Saturas_BringFoci == FALSE) && (!Npc_KnowsInfo(hero,DIA_Milten_GotoCorristo))
	{
		return 1;
	};
};

func VOID DIA_Milten_Hello_Info()
{
	AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Busco al Gran Mago del Círculo del Fuego.
	AI_Output (self, other,"DIA_Milten_Hello_02_01"); //Ése es Corristo. ¿Qué quieres de él?
};

//*********************************************
//					GotoCorristo
//*********************************************
	
instance DIA_Milten_GotoCorristo (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_GotoCorristo_Condition;
	information	= DIA_Milten_GotoCorristo_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Milten_GotoCorristo_Condition()
{
	if  ( (CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE) )
	&&  (Npc_GetTrueGuild (hero) == GIL_STT) 
	{
		return 1;
	};
};

func VOID DIA_Milten_GotoCorristo_Info()
{
	if ( (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) || (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) )
	{
		//***kopierte AI_outputs, falls SC Brief noch hat***
		AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Busco al Gran Mago del Círculo del Fuego.
		AI_Output (self, other,"DIA_Milten_Hello_02_01"); //Ése es Corristo. ¿Qué quieres de él?
		AI_Output (other, self,"DIA_Milten_Letter_15_00"); //Traigo una carta para el Gran Mago del Círculo del Fuego.
		//AI_Output (self, other,"DIA_Milten_Letter_02_01"); //Bist du ein Bote aus der Außenwelt?
		//AI_Output (other, self,"DIA_Milten_Letter_15_02"); //Ja. Ein Magier gab mir den Brief, kurz bevor sie mich in die Kolonie geworfen haben.
		AI_Output (self, other,"DIA_Milten_Letter_02_03"); //Déjame ver la carta.
		AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Aquí la tienes.
		B_GiveXP(XP_XardasLetter);
		if		Npc_HasItems(other,ItWr_Fire_Letter_01)
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
		}
		else if	Npc_HasItems(other,ItWr_Fire_Letter_02) 
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
		};
		AI_Output (other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //¿Qué hay de una recompensa?
		AI_Output (self,hero,"Info_Milten_SHSEAL_02_05"); //Ya no hay necesidad de eso.
		//***kopierte AI_outputs ENDE***
	};
	
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_01"); //Nos hemos enterado de tu hazaña en la Vieja Mina. Sin los reptadores, la extracción de mineral es mucho menos peligrosa.
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_02"); //Corristo también está al corriente de tus proezas. Quiere hablar contigo. Ve a verle.
};

//*********************************************
//				 Got Brief
//*********************************************
	var int milten_HasLetter;
//*********************************************

instance DIA_Milten_Letter (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_Letter_Condition;
	information	= DIA_Milten_Letter_Info;
	permanent	= 0;
	description = "Tengo una carta para el Gran Mago del Círculo del Fuego.";
};                       

FUNC INT DIA_Milten_Letter_Condition()
{
	if	( (Npc_KnowsInfo(hero, DIA_Milten_Hello)) && ( (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) || (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) ) )
	&&	(Kapitel < 4) && (Saturas_BringFoci == FALSE)
	{
		return 1;
	};
};

func VOID DIA_Milten_Letter_Info()
{
	AI_Output			(other, self,"DIA_Milten_Letter_15_00"); //Traigo una carta para el Gran Mago del Círculo del Fuego.
	AI_Output			(self, other,"DIA_Milten_Letter_02_01"); //¿Eres un mensajero del mundo exterior?
	AI_Output			(other, self,"DIA_Milten_Letter_15_02"); //Sí. Un mago me dio esta carta poco antes de que me arrojaran a la colonia.
	AI_Output			(self, other,"DIA_Milten_Letter_02_03"); //Déjame ver la carta.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Antes quiero mi recompensa.",DIA_Milten_Letter_NO);
	Info_AddChoice		(DIA_Milten_Letter,"Aquí está.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_Give()
{
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Aquí la tienes.
	B_UseFakeScroll();
	
	B_GiveXP(XP_XardasLetter);
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_03"); //¡Esta carta está dirigida a Xardas!
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_04"); //¿Qué tiene eso de excitante?
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_05"); //Hace mucho que Xardas dejó de ser sirviente de Innos. Nos abandonó hace unos años y se pasó a la magia negra.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_06"); //Vive en una torre en medio de las tierras orcas y se concentra en sus estudios.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_07"); //Dijo que seguiría su propio camino para averiguar qué fue lo que salió mal con la Barrera.
	
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_08"); //Espérame aquí. Volveré en un momento.
	AI_StopProcessInfos	(self);
	AI_GotoWP (self, "OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self, "OCC_CHAPEL_ENTRANCE");

	if		Npc_HasItems(other,ItWr_Fire_Letter_01)
	{ 
		B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
	}
	else if	Npc_HasItems(other,ItWr_Fire_Letter_02) 
	{ 
		B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
	};
	milten_HasLetter = TRUE;
	Npc_SetRefuseTalk(self,10);
};

func void DIA_Milten_Letter_NO()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_15_00"); //Primero quiero mi recompensa.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_01"); //Corristo le dirá a Torres que te la dé en cuanto tenga la carta.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_02"); //Soy un sirviente de Innos; nunca miento. Ahora dame la carta.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Preferiría dar la carta personalmente a Torres.",DIA_Milten_Letter_NO_AGAIN);
	Info_AddChoice		(DIA_Milten_Letter,"Aquí está.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_NO_AGAIN()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_00"); //Prefiero darle la carta a Torres en persona.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_01"); //No voy a poder hacerte desistir de ello, ¿verdad?
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_02"); //No, primero quiero ver mi recompensa.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_03"); //Bueno. Si es eso lo que quieres. Espera aquí.

	Info_ClearChoices	(DIA_Milten_Letter);
	AI_StopProcessInfos	(self);

	AI_GotoWP (self, "OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self, "OCC_CHAPEL_ENTRANCE");
	milten_HasLetter = FALSE;
	Npc_SetRefuseTalk(self,10);
};

//*********************************************
//				 Got Brief
//*********************************************

instance DIA_Milten_ComesBack (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_ComesBack_Condition;
	information	= DIA_Milten_ComesBack_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Milten_ComesBack_Condition()
{
	if ( (Npc_KnowsInfo(hero, DIA_Milten_Letter)) && (Npc_RefuseTalk(self) == FALSE) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_ComesBack_Info()
{
	if (milten_HasLetter==FALSE)
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_00"); //A Corristo no le ha agradado que tengas tan poca fe en los que sirven a Innos.
		AI_Output (self, other,"DIA_Milten_ComesBack_02_01"); //Pero dice que puedes ir a ver a Torres para que te dé la recompensa habitual.
	}
	else
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_02"); //Corristo estaba radiante de alegría. Dijo que puedes ir a ver a Torres y elegir tu recompensa.
	};
};

//*********************************************
//			Wo finde ich Torrez?
//*********************************************
	
instance DIA_Milten_WoTorrez (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_WoTorrez_Condition;
	information	= DIA_Milten_WoTorrez_Info;
	permanent	= 0;
	description	= "¿Dónde puedo encontrar a Torres?";
};                       

FUNC INT DIA_Milten_WoTorrez_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Milten_ComesBack) && (Saturas_BringFoci == FALSE) )
	{
		return 1;
	};
};

func VOID DIA_Milten_WoTorrez_Info()
{
	AI_Output (other, self,"DIA_Milten_WoTorrez_15_00"); //¿Dónde puedo encontrar a Torres?
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_01"); //Se pasa el día frente al edificio del templo.
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_02"); //De noche está dentro, como todos los demás; pero sólo los magos pueden entrar en el edificio del templo, así que sólo puedes hablar con él durante el día.
};

//*********************************************
//				Noch ein Brief
//*********************************************
	
instance DIA_Milten_NochEinBrief (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 2;
	condition	= DIA_Milten_NochEinBrief_Condition;
	information	= DIA_Milten_NochEinBrief_Info;
	permanent	= 0;
	description = "Traigo una carta de los Magos del Agua.";
};                       

FUNC INT DIA_Milten_NochEinBrief_Condition()
{
	if ( (Cronos_Messenger == LOG_RUNNING) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_NochEinBrief_Info()
{
	AI_Output (other, self,"DIA_Milten_NochEinBrief_15_00"); //Traigo una carta de parte de los Magos del Agua.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_01"); //¡Ah! ¡Espléndido! Se la daré a Corristo.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_02"); //Cuando vuelvas al Campamento Nuevo, es probable que los Magos del Agua te recompensen por tus esfuerzos.
	
	Cronos_Messenger = LOG_SUCCESS;
	B_GiveInvItems (other,self,Cronos_Brief,1);
};

//*********************************************
//					PERM
//*********************************************
	
instance DIA_Milten_PERM (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_PERM_Condition;
	information	= DIA_Milten_PERM_Info;
	permanent	= 0;
	description = "Háblame de los Magos del Fuego.";
};                       

FUNC INT DIA_Milten_PERM_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Milten_ComesBack) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_PERM_Info()
{
	AI_Output (other, self,"DIA_Milten_PERM_15_00"); //Cuéntame algo de los Magos del Fuego.
	AI_Output (self, other,"DIA_Milten_PERM_02_01"); //El Círculo del Fuego saca sus poderes de la gracia de Innos. El dios de la luz, la verdad y la justicia vela por nosotros.
	AI_Output (self, other,"DIA_Milten_PERM_02_02"); //Los magos se consideran a sí mismos los elegidos y así tratan a los demás.
	AI_Output (self, other,"DIA_Milten_PERM_02_03"); //Tuve suerte al ser admitido. Corristo me nombró aprendiz suyo. Lo más probable es que lo hiciera para divertirse.
	AI_Output (self, other,"DIA_Milten_PERM_02_04"); //Desde entonces he estado intentando mejorar mis habilidades mágicas todos los días para poder ser admitido en el Círculo siguiente.
};

//*********************************************
//					WannaMage
//*********************************************
	
instance DIA_Milten_WannaMage (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 2;
	condition	= DIA_Milten_WannaMage_Condition;
	information	= DIA_Milten_WannaMage_Info;
	permanent	= 1;
	description = "Yo también quiero convertirme en aprendiz de mago, como tú.";
};                       

FUNC INT DIA_Milten_WannaMage_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Milten_PERM) && (CorKalom_BringMCQBalls != LOG_SUCCESS) )
	{
		return 1;
	};
};

func VOID DIA_Milten_WannaMage_Info()
{
	AI_Output (other, self,"DIA_Milten_WannaMage_15_00"); //Yo también quiero ser aprendiz de un mago, como tú.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_01"); //Corristo me eligió porque llevé a cabo una tarea especial para los Magnates del Mineral.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_02"); //Nunca serás elegido como aprendiz, a no ser que hagas algo verdaderamente excepcional.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_03"); //Además, debes pertenecer al Campamento Viejo. Dudo que Corristo nombre como aprendiz suyo a un miembro de otro campamento.
};





		
	







//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info SHWAIT
//***************************************************************************
instance Info_Milten_SHWAIT (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHWAIT_Condition;
	information	= Info_Milten_SHWAIT_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHWAIT_Condition()
{
	if ( Npc_GetDistToWP ( hero, "OW_PATH_274")<1000)
	{
		return 1;
	};	
};

func void Info_Milten_SHWAIT_Info()
{
	AI_GotoNpc		(self,hero);
	
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_01"); //¡Saludos! ¡Mi amigo Lester del campamento del pantano me ha hablado de las hazañas que llevaste a cabo allí!
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_02"); //Estoy impresionado. Te has hecho muy poderoso.
	AI_Output		(hero,self,"Info_Milten_SHWAIT_15_03"); //Lo hago lo mejor que puedo.
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_04"); //Ah, sí. Siempre tan modesto, ¿verdad?
};

//***************************************************************************
//	Info SHGORN
//***************************************************************************
instance Info_Milten_SHGORN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHGORN_Condition;
	information	= Info_Milten_SHGORN_Info;
	important	= 0;
	permanent	= 0;
	description	= "Vi a Gorn.";
};

FUNC int Info_Milten_SHGORN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT) && Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHGORN_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_01"); //He visto a Gorn.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_02"); //¿De verdad? ¿Dónde?
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_03"); //Cerca del viejo monasterio en ruinas que hay junto al mar. Buscamos tesoros juntos.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_04"); //Estoy seguro de que me lo contará con todo lujo de detalles cuando volvamos a vernos.
};

//***************************************************************************
//	Info SHLESTER
//***************************************************************************
instance Info_Milten_SHLESTER (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHLESTER_Condition;
	information	= Info_Milten_SHLESTER_Info;
	important	= 0;
	permanent	= 0;
	description	= "Lester y yo destruimos el fuerte de la montaña.";
};

FUNC int Info_Milten_SHLESTER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT) && Npc_KnowsInfo(hero, PC_Psionic_FINISH))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHLESTER_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_01"); //Lester y yo destruimos el fuerte de la montaña.
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_02"); //Ya me lo ha contado. Parece ser que eres de fiar.
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_03"); //¿Dónde os habéis estado reuniendo hasta ahora?
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_04"); //Oh, por ahí. Nos reunimos en muchos lugares distintos.
};

//***************************************************************************
//	Info SHYOU
//***************************************************************************
instance Info_Milten_SHYOU (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHYOU_Condition;
	information	= Info_Milten_SHYOU_Info;
	important	= 0;
	permanent	= 0;
	description	= "¿Qué estás haciendo aquí?";
};

FUNC int Info_Milten_SHYOU_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT))
	{
		return 1;
	};	
};

func void Info_Milten_SHYOU_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_01"); //¿Qué haces aquí?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_02"); //No lejos de aquí hay un antiquísimo círculo de piedras. En su centro se encuentra la entrada a una cámara subterránea.
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_03"); //¿Algún tipo de tumba?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_04"); //Sí, algo así.
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_05"); //En esa tumba hay una cosa que me gustaría obtener.
};

//***************************************************************************
//	Info SHME
//***************************************************************************
instance Info_Milten_SHME (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHME_Condition;
	information	= Info_Milten_SHME_Info;
	important	= 0;
	permanent	= 0;
	description	= "Busco un foco de piedra.";
};

FUNC int Info_Milten_SHME_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_SHWAIT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	{
		return 1;
	};	
};

func void Info_Milten_SHME_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHME_15_01"); //Estoy buscando un foco de piedra. Debe estar por aquí.
	AI_Output		(self,hero,"Info_Milten_SHME_02_02"); //Entonces parece que ambos buscamos algo en el mismo lugar.
};

//***************************************************************************
//	Info SHPROBLEM
//***************************************************************************
instance Info_Milten_SHPROBLEM (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHPROBLEM_Condition;
	information	= Info_Milten_SHPROBLEM_Info;
	important	= 0;
	permanent	= 0;
	description	= "¿Por qué no te metes en la tumba y coges lo que buscas?";
};

FUNC int Info_Milten_SHPROBLEM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHYOU))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_01"); //¿Por qué no bajas a la tumba para obtener lo que andas buscando?
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_02"); //Oh, es una larga historia. Tendría que remontarme mucho en el tiempo para explicártelo.
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_03"); //Adelante, no tengo ninguna prisa.
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_04"); //¡De acuerdo! Tras la creación de la Barrera Mágica que nos tiene prisioneros a todos...
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_05"); //...uno de los magos selló un artefacto mágico ahí abajo.
};

//***************************************************************************
//	Info SHFOCUS
//***************************************************************************
instance Info_Milten_SHFOCUS (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHFOCUS_Condition;
	information	= Info_Milten_SHFOCUS_Info;
	important	= 0;
	permanent	= 0;
	description	= "¿Este artefacto es uno de los cinco focos de piedra?";
};

FUNC int Info_Milten_SHFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHFOCUS_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_01"); //¿Este artefacto es uno de los cinco focos de piedra?
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_02"); //¡Exactamente! Entonces, ¿ya conoces la historia de los cinco focos de piedra?
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_03"); //¡No me digas que tú también estás interesado en los focos!
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_04"); //No. No estoy interesado en los focos de piedra. Lo que busco es un talismán orco.
};

//***************************************************************************
//	Info SHSEAL
//***************************************************************************
instance Info_Milten_SHSEAL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSEAL_Condition;
	information	= Info_Milten_SHSEAL_Info;
	important	= 0;
	permanent	= 0;
	description	= "¿Se aisló el artefacto?";
};

FUNC int Info_Milten_SHSEAL_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSEAL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_01"); //¿El artefacto fue sellado allí?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_02"); //Sí. Está protegido por un poderoso hechizo. El primer ladrón de tumbas que intente robar el foco...
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_03"); //...sufrirá una maldición y será condenado a una eterna muerte en vida en la que tendrá que proteger la tumba de otros ladrones.
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_04"); //¿Cómo se puede evitar esa maldición?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_05"); //Ya no hay necesidad de eso.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_06"); //Hace algunos años, un Magnate del Mineral que andaba cazando orcos por placer fue lo suficientemente descuidado como para entrar en la tumba.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_07"); //Ahora es él quien protege los tesoros que hay allí abajo.
};

//***************************************************************************
//	Info SHTALISMAN
//***************************************************************************
instance Info_Milten_SHTALISMAN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHTALISMAN_Condition;
	information	= Info_Milten_SHTALISMAN_Info;
	important	= 0;
	permanent	= 0;
	description	= "¿Qué hay de ese talismán?";
};

FUNC int Info_Milten_SHTALISMAN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHFOCUS))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHTALISMAN_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHTALISMAN_15_01"); //¿Y qué hay del talismán?
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_02"); //Creo que su anterior propietario lo usó para defenderse de unos orcos furiosos.
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_03"); //Si no me equivoco, el talismán puede ser de gran utilidad.
};

//***************************************************************************
//	Info SHOFFER
//***************************************************************************
instance Info_Milten_SHOFFER (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHOFFER_Condition;
	information	= Info_Milten_SHOFFER_Info;
	important	= 0;
	permanent	= 0;
	description	= "¡Deberíamos registrar juntos la tumba!";
};

FUNC int Info_Milten_SHOFFER_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHSEAL)
	&&		Npc_KnowsInfo(hero, Info_Milten_SHTALISMAN)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHOFFER_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_01"); //¡Deberíamos ir juntos a la tumba! Tú te quedas con el talismán y yo con el foco de piedra.
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_02"); //De acuerdo, pero hay un problema.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_03"); //¿Un problema?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_04"); //Sí. El guardián que hay en la tumba.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_05"); //¿No se le puede cortar en pedacitos?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_06"); //Eso no sería nada fácil. Parece tener gran resistencia frente a los efectos de las armas normales.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_07"); //Deja que lo adivine; ya tienes un plan, ¿verdad?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_08"); //Esto... Bueno... Tengo un plan, pero no puedo llevarlo a cabo yo solo.
};

//***************************************************************************
//	Info SHOFFER2
//***************************************************************************
instance Info_Milten_SHOFFER2 (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHOFFER2_Condition;
	information	= Info_Milten_SHOFFER2_Info;
	important	= 0;
	permanent	= 0;
	description	= "¡Cuéntame!";
};

FUNC int Info_Milten_SHOFFER2_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHOFFER)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHOFFER2_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_01"); //¡Cuéntame!
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_02"); //Aquí tengo un pergamino de conjuro con un poderoso sortilegio.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_03"); //Ese conjuro destruirá a todos los muertos vivientes que caigan en él.
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_04"); //Entonces será un juego de niños saquear la tumba.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_05"); //Ah, esto... Bueno... ¡No exactamente! El guardián ya no está solo.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_06"); //Probablemente se trate de otros saqueadores de tumbas posteriores que tuvieron el mismo éxito que él.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_07"); //Bajé ahí una vez y casi me matan. Un hombre solo no puede hacer mucho allí.
};

//***************************************************************************
//	Info SHACCEPT
//***************************************************************************
instance Info_Milten_SHACCEPT (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHACCEPT_Condition;
	information	= Info_Milten_SHACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description	= "¡Dame el pergamino de conjuro y lo haremos juntos!";
};

FUNC int Info_Milten_SHACCEPT_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHOFFER2)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHACCEPT_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_01"); //¡Dame el pergamino de conjuro y lo haremos juntos!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_02"); //Espléndido, espléndido. ¡Esperaba que dijeras eso!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_03"); //Pero sólo tenemos un pergamino de conjuro. ¡Úsalo con el guardián!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_04"); //Los otros muertos vivientes también pueden ser derrotados en combate ordinario.
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_05"); //Entiendo. Bueno, ¿cuál es el camino que lleva al círculo de piedras?
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_06"); //Sígueme.

	Log_CreateTopic		(CH3_Stonehenge,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_RUNNING);
	B_LogEntry		(CH3_Stonehenge,"Me he encontrado con Milten, el Mago del Fuego, cerca del círculo de piedras. Me ha dicho que uno de los focos de piedra que busco estaba en una cripta bajo la formación rocosa.");
	B_LogEntry		(CH3_Stonehenge,"Milten me ha dado un pergamino de conjuro para derrotar al guardián muerto viviente de la cripta. Iremos juntos al interior de la misma.");
	
	CreateInvItem		(self,	ItArScrollDestroyUndead);
	B_GiveInvItems  (self, hero, ItArScrollDestroyUndead, 1);

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine	(self, "SHGuide");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHARRIVED
//***************************************************************************
instance Info_Milten_SHARRIVED (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHARRIVED_Condition;
	information	= Info_Milten_SHARRIVED_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHARRIVED_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHACCEPT) && (Npc_GetDistToWP(hero, "OW_PATH_3_STONES")<500) )
	{
		return TRUE;
	};	
};

func void Info_Milten_SHARRIVED_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHARRIVED_02_01"); //Ya estamos aquí. Este túnel conduce directamente a la tumba. 
	AI_Output			(hero,self,"Info_Milten_SHARRIVED_15_02"); //¡Entonces vamos a visitar al guardián!

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine	(self,	"SHFollow");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHHEAL
//***************************************************************************
instance Info_Milten_SHHEAL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHHEAL_Condition;
	information	= Info_Milten_SHHEAL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Estoy herido. Por favor, ayúdame.";
};

FUNC int Info_Milten_SHHEAL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)
	&&		(hero.attribute[ATR_HITPOINTS] < ((hero.attribute[ATR_HITPOINTS_MAX]*7)/10))
	&&		(Npc_HasItems(hero,ItFo_Potion_Health_02) == 0)								)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHHEAL_Info()
{
	AI_Output				(hero,self,"Info_Milten_SHHEAL_15_01"); //Estoy herido. Ayúdame, por favor.

	if (	(Npc_HasItems(self,ItFo_Potion_Health_02) >  0)		)
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_02"); //Tómate esta poción de curación.
		B_GiveInvItems	    (self, hero,	ItFo_Potion_Health_02,	1);
	}
	else
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_03"); //No me queda ninguna poción de curación.
	};	

	AI_StopProcessInfos		(self);
};

//***************************************************************************
//	Info SHRUNNING
//***************************************************************************
instance Info_Milten_SHRUNNING (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHRUNNING_Condition;
	information	= Info_Milten_SHRUNNING_Info;
	important	= 0;
	permanent	= 1;
	description	= "¡El guardia sigue vivo!";
};

FUNC int Info_Milten_SHRUNNING_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,Info_Milten_SHACCEPT)
	&&	(keeperFound && !Npc_IsDead(other))							// Wächter noch nicht besiegt...
	{
		return TRUE;
	};	
};

func void Info_Milten_SHRUNNING_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHRUNNING_15_01"); 	//¡El guardián todavía está vivo!
	AI_Output			(self,hero,"Info_Milten_SHRUNNING_02_02"); 	//Entonces destrúyelo con el pergamino de conjuro.
};

//***************************************************************************
//	Info SHSCROLL
//***************************************************************************
instance Info_Milten_SHSCROLL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSCROLL_Condition;
	information	= Info_Milten_SHSCROLL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Usé el pergamino de conjuro.";
};

FUNC int Info_Milten_SHSCROLL_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);
	if (	(keeperFound && !Npc_IsDead(other))							// Wächter noch nicht besiegt...
	&&		Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		(Npc_HasItems(hero, ItArScrollDestroyUndead)==0)	
	&&		(Npc_HasItems(hero, ItArRuneDestroyUndead)==0)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSCROLL_15_01"); //Ya he utilizado el pergamino de conjuro... ¡pero no con el guardián!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_02"); //¡Esto es una catástrofe! ¡Entonces tendrás que encontrar otra manera de derrotarle!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_03"); //Tal vez puedas adquirir otro pergamino de conjuro o una runa en uno de los campamentos.
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_04"); //Te esperaré aquí, donde nos vimos por primera vez.

  	self.aivar[AIV_PARTYMEMBER] =	FALSE;

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"SHWait");
};

//***************************************************************************
//	Info SHNEWSCROLL
//***************************************************************************
instance Info_Milten_SHNEWSCROLL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHNEWSCROLL_Condition;
	information	= Info_Milten_SHNEWSCROLL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Tengo un nuevo pergamino de 'Muerte a los no-muertos'";
};

FUNC int Info_Milten_SHNEWSCROLL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHSCROLL)
	&&		!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)	
	&&		((Npc_HasItems(hero, ItArScrollDestroyUndead)>0) ||	(Npc_HasItems(hero, ItArRuneDestroyUndead)>0))	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHNEWSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHNEWSCROLL_15_01"); //¡Tengo un nuevo pergamino de conjuro de 'Muerte a los Muertos Vivientes'!
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_02"); //Muy bien. Ahora podemos hacerle otra visita al guardián.
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_03"); //Tú primero; yo te sigo.

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"SHFollow");
};

//***************************************************************************
//	Info SHLEAVE
//***************************************************************************
instance Info_Milten_SHLEAVE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHLEAVE_Condition;
	information	= Info_Milten_SHLEAVE_Info;
	important	= 1;
	permanent	= 1;
};

FUNC int Info_Milten_SHLEAVE_Condition()
{
	if	 Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)		
	&&	(Npc_GetDistToWP(hero, "OW_PATH_3_STONES")>10000)
  	&&	(self.aivar[AIV_PARTYMEMBER] ==	TRUE)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHLEAVE_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_01"); 	//Pareces haber perdido el interés por la tumba.
	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_02"); 	//Si cambias de opinión, podrás encontrarme donde nos vimos la última vez.

  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine	(self,	"SHWait");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHCONTINUE
//***************************************************************************
instance Info_Milten_SHCONTINUE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHCONTINUE_Condition;
	information	= Info_Milten_SHCONTINUE_Info;
	important	= 0;
	permanent	= 1;
	description = "¿Lo intentamos de nuevo con el guardia?";
};

FUNC int Info_Milten_SHCONTINUE_Condition()
{
	if	(self.aivar[AIV_PARTYMEMBER] == FALSE)
	&&	Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)
	&&	(Npc_GetDistToWP(hero, "OW_PATH_3_STONES")<9000)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHCONTINUE_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(hero,self,"Info_Milten_SHCONTINUE_15_01"); //¿Nos atrevemos a hacer otro intento con el guardián?
	AI_Output			(self,hero,"Info_Milten_SHCONTINUE_02_02"); //Estoy listo. Adelante, yo te sigo.

  	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"SHFollow");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHSUCCESS
//***************************************************************************
instance Info_Milten_SHSUCCESS (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSUCCESS_Condition;
	information	= Info_Milten_SHSUCCESS_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHSUCCESS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHACCEPT) && Npc_HasItems(hero, ItMi_OrcTalisman))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSUCCESS_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_01"); //Muy bien. Tienes el talismán.
	AI_Output			(hero,self,"Info_Milten_SHSUCCESS_15_02"); //Aquí lo tienes. ¡Éste era el trato!
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_03"); //Gracias, amigo mío. Nunca olvido a los que me ayudan.
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_04"); //Me vuelvo al Campamento Viejo; tal vez nos encontremos allí.
	
	B_GiveInvItems	(hero,self,	ItMi_OrcTalisman, 1);
	
	B_LogEntry		(CH3_Stonehenge,"Hemos derrotado juntos al GUARDIÁN de debajo del círculo de piedras. Milten ha cogido su parte del botín y regresado al Campamento Viejo.");
	B_LogEntry		(CH3_Stonehenge,"¡Saturas estará satisfecho de que haya encontrado aquí un foco!");
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine	(self, "ReturnToOC");
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info OCWARN
//***************************************************************************
instance Info_Milten_OCWARN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCWARN_Condition;
	information	= Info_Milten_OCWARN_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

func void Info_Milten_OCWARN_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_OCWARN_02_01"); //Están... Están todos muertos... Todos MUERTOS. No pude ayudarlos... Yo estaba... No estaba allí... Yo...

	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_02"); //Cálmate, Milten. Ya he visto a Diego en el otro extremo del Campamento.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_03"); //Muy bien, así que ya lo sabes. ¿Qué dijo Diego?
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_04"); //Si puedo encontrar a Gorn y a Lester, les avisaré y les enviaré a vuestro punto de reunión.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_05"); //¡Buena suerte y ten cuidado!
		B_LogEntry		(CH4_Firemages,"Al igual que Diego, Milten se esconde cerca del Campamento Viejo. A una distancia segura de la entrada principal, el Mago del Fuego avisa a todos los que se acercan allí, para que no caigan en manos de los guardias.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_06"); //Cálmate, Milten. ¿Qué es lo que ha ocurrido?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_07"); //Han matado a los Magos del Fuego. A TODOS, excepto a mí, y yo también estuve cerca de morir.
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_08"); //Será mejor que me cuentes la historia completa desde el principio, una cosa tras otra.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_09"); //De acuerdo. Tranquilo, Milten, tranquilo.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_10"); //Todo empezó con el derrumbamiento de la Mina Vieja.
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_11"); //¿Que la Mina Vieja SE HA DERRUMBADO?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_12"); //Sí. Todo sucedió con gran rapidez. Nadie consiguió salir de la mina.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_13"); //Los guardias bloquearon la entrada.
	};
};

//***************************************************************************
//	Info OCMINE
//***************************************************************************
instance Info_Milten_OCMINE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCMINE_Condition;
	information	= Info_Milten_OCMINE_Info;
	important	= 0;
	permanent	= 0;
	description = "¿Cómo pudo hundirse la mina?";
};

FUNC int Info_Milten_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCMINE_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_01"); //¿Cómo es posible que se derrumbase la mina?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_02"); //No tengo ni idea. Algunos de los cavadores que estaban esperando frente a la entrada dijeron algo de un gran terremoto y una gran nube de polvo que salía del túnel.
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_03"); //¿Estabas tú allí?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_04"); //Sí. Ahí fue donde me enteré del derrumbamiento.
};

//***************************************************************************
//	Info OCKDW
//***************************************************************************
instance Info_Milten_OCKDW (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCKDW_Condition;
	information	= Info_Milten_OCKDW_Info;
	important	= 0;
	permanent	= 0;
	description = "¿Qué fue lo que dijiste de los Magos del Fuego?";
};

FUNC int Info_Milten_OCKDW_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCKDW_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCKDW_15_01"); //¿Qué es lo que dijiste de los Magos del Fuego?
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_02"); //Lo único que sé es que todos fueron asesinados por los Magnates del Mineral poco después del derrumbamiento de la mina.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_03"); //Cuando regresé de nuestra aventura bajo el círculo de piedras, los guardias de la puerta me atacaron de repente.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_04"); //Me gritaron palabras como 'traidor' y 'colaborador'. Escapé por los pelos.
};

//***************************************************************************
//	Info OCWHY
//***************************************************************************
instance Info_Milten_OCWHY (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCWHY_Condition;
	information	= Info_Milten_OCWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "¿Por qué querrían matar a los magos los Magnates del Mineral...?";
};

FUNC int Info_Milten_OCWHY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCKDW))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCWHY_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCWHY_15_01"); //¿Por qué iban a querer los Magnates del Mineral matar a los magos? No tiene sentido.
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_02"); //Exacto. Los guardias no me dieron oportunidad de preguntar. Desenvainaron sus espadas al instante.
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_03"); //Tal vez Diego sepa algo más. Él estaba en el Campamento cuando las cosas se pusieron feas.
};

//***************************************************************************
//	Info OCYOU
//***************************************************************************
instance Info_Milten_OCYOU (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCYOU_Condition;
	information	= Info_Milten_OCYOU_Info;
	important	= 0;
	permanent	= 0;
	description = "Debes esconderte. Lejos de aquí.";
};

FUNC int Info_Milten_OCYOU_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCKDW))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCYOU_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCYOU_15_01"); //Deberías esconderte. Muy lejos de aquí.
	AI_Output			(self,hero,"Info_Milten_OCYOU_02_02"); //No. Diego y yo acordamos vigilar las dos puertas y avisar a nuestros confiados amigos de los otros campamentos.

	if (!Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{	
		AI_Output		(self,hero,"Info_Milten_OCYOU_02_03"); //¡Por favor, habla con Diego!
	}
	else
	{
		B_LogEntry		(CH4_Firemages,"Después de que Diego me contara los increíbles acontecimientos, me he encontrado con Milten frente al Campamento Viejo. Espero que no me pillen.");
	};
};

//***************************************************************************
//	Info OCDIEGO
//***************************************************************************
instance Info_Milten_OCDIEGO (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCDIEGO_Condition;
	information	= Info_Milten_OCDIEGO_Info;
	important	= 0;
	permanent	= 0;
	description = "¿Dónde puedo encontrar a Diego?";
};

FUNC int Info_Milten_OCDIEGO_Condition()
{
	if Npc_KnowsInfo(hero, Info_Milten_OCWHY)
	&& Npc_KnowsInfo(hero, Info_Milten_OCYOU)
	&& !Npc_KnowsInfo(hero, Info_Diego_OCSTORY)
	{
		return TRUE;
	};	
};

func void Info_Milten_OCDIEGO_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCDIEGO_15_01"); //¿Dónde puedo encontrar a Diego?
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_02"); //Está escondido en la otra punta del Campamento Viejo, cerca de la puerta de atrás.
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_03"); //¡Por favor, habla con él!

	B_LogEntry			(CH4_Firemages,"Milten me ha alcanzado frente al Campamento Viejo y me ha hablado del derrumbamiento de la Vieja Mina y el asesinato de los Magos del Fuego.");
	B_LogEntry			(CH4_Firemages,"Diego está en la otra parte del Campamento Viejo, cerca de la puerta posterior. Debo hablar con él, pues sabe más acerca de lo sucedido.");
};










//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_LOADSWORD_Condition;
	information	= Info_Milten_LOADSWORD_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_LOADSWORD_Condition()
{
	if (LoadSword)
	{
		return TRUE;
	};	
};

func void Info_Milten_LOADSWORD_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LOADSWORD_02_01"); //Saludos, amigo; hacía mucho tiempo que no te veía.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_02"); //Hola, Milten. Han ocurrido muchas cosas desde la última vez que nos vimos.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_03"); //Me gustaría contártelo todo, pero ahora mismo no tengo tiempo. Tengo prisa.
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD1 (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LOADSWORD1_Condition;
	information		= Info_Milten_LOADSWORD1_Info;
	important		= 0;
	permanent		= 0;
	description		= "¡Milten, necesito tu ayuda!"; 
};

FUNC int Info_Milten_LOADSWORD1_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD)
	{
		return 1;
	};	
};

func void Info_Milten_LOADSWORD1_Info()
{
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_01"); //¡Milten, necesito tu ayuda!
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_02"); //¿Qué ocurre? ¿Qué puedo hacer para ayudarte?
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_03"); //Vayamos a un lugar donde podamos hablar.
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_04"); //De acuerdo. Sígueme.

	Npc_ExchangeRoutine	(self,	"LSAway");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info LSAWAY
//---------------------------------------------------------------------
instance Info_Milten_LSAWAY (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSAWAY_Condition;
	information		= Info_Milten_LSAWAY_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSAWAY_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD1)
	&&	(Npc_GetDistToWP(hero, "NC_KDW04_IN") < 500)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSAWAY_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_01"); //Ahora dime ¿qué es lo que ocurre?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_02"); //Necesito los poderes mágicos del montículo de mineral y creo que no sería prudente pedírselo a los otros Magos del Agua.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_03"); //¡Estás de broma!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_04"); //Éste no es momento para bromas. Hablo totalmente en serio.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_05"); //¡He visto a Xardas, el nigromante!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_06"); //¡Estoy trabajando a sus órdenes!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_07"); //¿XARDAS? ¡Empiezas a asustarme!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_08"); //Nadie ha hablado con él desde que abandonó el Campamento Viejo.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_09"); //¡Yo lo he hecho!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_10"); //¿Para qué necesitas los poderes del montículo de mineral?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_11"); //Quiero transferirlos a esta espada.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_12"); //¡Caramba, menuda arma!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_13"); //¡Se llama URIZIEL!
};


//---------------------------------------------------------------------
//	Info LOADSWORD4
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD4 (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LOADSWORD4_Condition;
	information		= Info_Milten_LOADSWORD4_Info;
	important		= 0;
	permanent		= 0;
	description		= "Xardas me dio este conjuro mágico."; 
};

FUNC int Info_Milten_LOADSWORD4_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSAWAY)
	{
		return 1;
	};	
};

func void Info_Milten_LOADSWORD4_Info()
{
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_01"); //¡Xardas me dio este conjuro mágico para llevar a cabo la transferencia!
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_02"); //¡Tendrás que recitarlo mientras junto la espada y el mineral!
	B_UseFakeScroll		();
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_03"); //Mmmm... Mmmm... Parece que no tengo más que leer este conjuro...
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_04"); //¡Pero nos meteremos en un lío con Saturas y los otros magos!
};







//---------------------------------------------------------------------
//	Info LSRISK
//---------------------------------------------------------------------
instance Info_Milten_LSRISK (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSRISK_Condition;
	information		= Info_Milten_LSRISK_Info;
	important		= 0;
	permanent		= 0;
	description		= "¡Tendremos que correr ese riesgo!"; 
};

FUNC int Info_Milten_LSRISK_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD4)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSRISK_Info()
{
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_01"); //¡Tendremos que correr ese riesgo!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_02"); //¡De verdad que es MUY, MUY importante!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_03"); //Importante para TODOS los habitantes de la colonia.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_04"); //No lo comprendo.
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_05"); //¡Nos permitirá salir de aquí! ¡Tienes que fiarte de mí!
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_06"); //¡De acuerdo! Después de todo lo que has hecho por nosotros, confío totalmente en ti.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_07"); //Además, parece que Xardas también confía en ti.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_08"); //Reúnete conmigo en el montículo de mineral y... ¡no se lo digas a nadie!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_09"); //¡De acuerdo, nos encontraremos en el montículo! ¡Nos vemos allí!
	
	B_LogEntry			(CH5_Uriziel,"He logrado convencer a mi amigo Milten de que me ayude a transferir la energía a la espada. Nos reuniremos en la base del montículo de mineral de los Magos del Agua.");
	Npc_ExchangeRoutine	(self,	"LSOreHeap");
	B_ExchangeRoutine	(Sld_726_Soeldner,	"loadsword");

	AI_StopProcessInfos	(self);
};


//---------------------------------------------------------------------
//	Info LSOREHEAP
//---------------------------------------------------------------------
instance Info_Milten_LSOREHEAP (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSOREHEAP_Condition;
	information		= Info_Milten_LSOREHEAP_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSOREHEAP_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSRISK )
	&&	(Npc_GetDistToWP(hero, "NC_PATH41") < 500)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSOREHEAP_Info()
{
	//AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LSOREHEAP_02_01"); //¿Tienes la espada y el conjuro?
};
	
//***************************************************************************
//	Info LSNOW
//***************************************************************************
instance Info_Milten_LSNOW (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSNOW_Condition;
	information		= Info_Milten_LSNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "¡Ten, toma el conjuro!"; 
};

FUNC int Info_Milten_LSNOW_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSOREHEAP)
	&&	Npc_HasItems (hero, Mythrilklinge01)
	&&	Npc_HasItems (hero, Scroll4Milten)
	&&	(Npc_GetDistToWP(hero, "NC_PATH41") < 1000)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSNOW_Info()
{
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_01"); //¡Toma, aquí tienes el conjuro!
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_02"); //¿Estás listo?
	AI_Output			(self, hero,"Info_Milten_LSNOW_02_03"); //Tan listo como cualquiera podría estarlo para este plan demencial.
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_04"); //¡Entonces hagámoslo!

	B_GiveInvItems 	(hero, self, Scroll4Milten, 1);	
	B_GiveInvItems 	(hero, self, Mythrilklinge01, 1);	

	StartChaptersSix = TRUE;

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info CHAPTERSIX
//---------------------------------------------------------------------
instance Info_Milten_CHAPTERSIX (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_CHAPTERSIX_Condition;
	information		= Info_Milten_CHAPTERSIX_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_CHAPTERSIX_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSNOW)
	&&	StartChaptersSix
	{
		return TRUE;
	};	
};

func void Info_Milten_CHAPTERSIX_Info()
{
	AI_StopProcessInfos	(self);
	B_Kapitelwechsel	(6);
};
	
//---------------------------------------------------------------------
//	Info LSDONE
//---------------------------------------------------------------------
instance Info_Milten_LSDONE (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSDONE_Condition;
	information		= Info_Milten_LSDONE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSDONE_Condition()
{
	if	(Kapitel == 6)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSDONE_Info()
{
	//AI_GotoNpc				(self, hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_01"); //¡Hecho!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_02"); //¡Increíble! ¡La gema lisa gris ahora da un resplandor azulado!

	AI_EquipBestMeleeWeapon	(hero);
	AI_ReadyMeleeWeapon		(hero);
	AI_PlayAni				(hero, "T_1HSINSPECT");
	AI_RemoveWeapon			(hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_03"); //¡Eso es buena señal! ¡Los poderes mágicos del montículo de mineral parecen residir ahora en la vieja espada!
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_04"); //Pero parece que nuestra pequeña operación ha atraído algo de atención.
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_05"); //¡Deberías teleportarte lejos de aquí!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_06"); //¿Y tú?
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_07"); //No te preocupes de mí, ya pensaré en algo. ¡Ahora, vete!

	B_Story_UrizielLoaded	();
	
	AI_StopProcessInfos	(self);
};




//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################
