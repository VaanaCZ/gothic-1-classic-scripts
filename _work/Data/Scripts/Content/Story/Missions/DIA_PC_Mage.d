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
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_00"); //All� vamos.
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
	description = "Estoy buscando al Gran Mago del C�rculo del Fuego.";
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
	AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Busco al Gran Mago del C�rculo del Fuego.
	AI_Output (self, other,"DIA_Milten_Hello_02_01"); //�se es Corristo. �Qu� quieres de �l?
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
		AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Busco al Gran Mago del C�rculo del Fuego.
		AI_Output (self, other,"DIA_Milten_Hello_02_01"); //�se es Corristo. �Qu� quieres de �l?
		AI_Output (other, self,"DIA_Milten_Letter_15_00"); //Traigo una carta para el Gran Mago del C�rculo del Fuego.
		//AI_Output (self, other,"DIA_Milten_Letter_02_01"); //Bist du ein Bote aus der Au�enwelt?
		//AI_Output (other, self,"DIA_Milten_Letter_15_02"); //Ja. Ein Magier gab mir den Brief, kurz bevor sie mich in die Kolonie geworfen haben.
		AI_Output (self, other,"DIA_Milten_Letter_02_03"); //D�jame ver la carta.
		AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Aqu� la tienes.
		B_GiveXP(XP_XardasLetter);
		if		Npc_HasItems(other,ItWr_Fire_Letter_01)
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
		}
		else if	Npc_HasItems(other,ItWr_Fire_Letter_02) 
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
		};
		AI_Output (other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //�Qu� hay de una recompensa?
		AI_Output (self,hero,"Info_Milten_SHSEAL_02_05"); //Ya no hay necesidad de eso.
		//***kopierte AI_outputs ENDE***
	};
	
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_01"); //Nos hemos enterado de tu haza�a en la Vieja Mina. Sin los reptadores, la extracci�n de mineral es mucho menos peligrosa.
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_02"); //Corristo tambi�n est� al corriente de tus proezas. Quiere hablar contigo. Ve a verle.
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
	description = "Tengo una carta para el Gran Mago del C�rculo del Fuego.";
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
	AI_Output			(other, self,"DIA_Milten_Letter_15_00"); //Traigo una carta para el Gran Mago del C�rculo del Fuego.
	AI_Output			(self, other,"DIA_Milten_Letter_02_01"); //�Eres un mensajero del mundo exterior?
	AI_Output			(other, self,"DIA_Milten_Letter_15_02"); //S�. Un mago me dio esta carta poco antes de que me arrojaran a la colonia.
	AI_Output			(self, other,"DIA_Milten_Letter_02_03"); //D�jame ver la carta.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Antes quiero mi recompensa.",DIA_Milten_Letter_NO);
	Info_AddChoice		(DIA_Milten_Letter,"Aqu� est�.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_Give()
{
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Aqu� la tienes.
	B_UseFakeScroll();
	
	B_GiveXP(XP_XardasLetter);
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_03"); //�Esta carta est� dirigida a Xardas!
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_04"); //�Qu� tiene eso de excitante?
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_05"); //Hace mucho que Xardas dej� de ser sirviente de Innos. Nos abandon� hace unos a�os y se pas� a la magia negra.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_06"); //Vive en una torre en medio de las tierras orcas y se concentra en sus estudios.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_07"); //Dijo que seguir�a su propio camino para averiguar qu� fue lo que sali� mal con la Barrera.
	
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_08"); //Esp�rame aqu�. Volver� en un momento.
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
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_01"); //Corristo le dir� a Torres que te la d� en cuanto tenga la carta.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_02"); //Soy un sirviente de Innos; nunca miento. Ahora dame la carta.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Preferir�a dar la carta personalmente a Torres.",DIA_Milten_Letter_NO_AGAIN);
	Info_AddChoice		(DIA_Milten_Letter,"Aqu� est�.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_NO_AGAIN()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_00"); //Prefiero darle la carta a Torres en persona.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_01"); //No voy a poder hacerte desistir de ello, �verdad?
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_02"); //No, primero quiero ver mi recompensa.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_03"); //Bueno. Si es eso lo que quieres. Espera aqu�.

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
		AI_Output (self, other,"DIA_Milten_ComesBack_02_01"); //Pero dice que puedes ir a ver a Torres para que te d� la recompensa habitual.
	}
	else
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_02"); //Corristo estaba radiante de alegr�a. Dijo que puedes ir a ver a Torres y elegir tu recompensa.
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
	description	= "�D�nde puedo encontrar a Torres?";
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
	AI_Output (other, self,"DIA_Milten_WoTorrez_15_00"); //�D�nde puedo encontrar a Torres?
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_01"); //Se pasa el d�a frente al edificio del templo.
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_02"); //De noche est� dentro, como todos los dem�s; pero s�lo los magos pueden entrar en el edificio del templo, as� que s�lo puedes hablar con �l durante el d�a.
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
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_01"); //�Ah! �Espl�ndido! Se la dar� a Corristo.
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
	description = "H�blame de los Magos del Fuego.";
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
	AI_Output (other, self,"DIA_Milten_PERM_15_00"); //Cu�ntame algo de los Magos del Fuego.
	AI_Output (self, other,"DIA_Milten_PERM_02_01"); //El C�rculo del Fuego saca sus poderes de la gracia de Innos. El dios de la luz, la verdad y la justicia vela por nosotros.
	AI_Output (self, other,"DIA_Milten_PERM_02_02"); //Los magos se consideran a s� mismos los elegidos y as� tratan a los dem�s.
	AI_Output (self, other,"DIA_Milten_PERM_02_03"); //Tuve suerte al ser admitido. Corristo me nombr� aprendiz suyo. Lo m�s probable es que lo hiciera para divertirse.
	AI_Output (self, other,"DIA_Milten_PERM_02_04"); //Desde entonces he estado intentando mejorar mis habilidades m�gicas todos los d�as para poder ser admitido en el C�rculo siguiente.
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
	description = "Yo tambi�n quiero convertirme en aprendiz de mago, como t�.";
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
	AI_Output (other, self,"DIA_Milten_WannaMage_15_00"); //Yo tambi�n quiero ser aprendiz de un mago, como t�.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_01"); //Corristo me eligi� porque llev� a cabo una tarea especial para los Magnates del Mineral.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_02"); //Nunca ser�s elegido como aprendiz, a no ser que hagas algo verdaderamente excepcional.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_03"); //Adem�s, debes pertenecer al Campamento Viejo. Dudo que Corristo nombre como aprendiz suyo a un miembro de otro campamento.
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
	
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_01"); //�Saludos! �Mi amigo Lester del campamento del pantano me ha hablado de las haza�as que llevaste a cabo all�!
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_02"); //Estoy impresionado. Te has hecho muy poderoso.
	AI_Output		(hero,self,"Info_Milten_SHWAIT_15_03"); //Lo hago lo mejor que puedo.
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_04"); //Ah, s�. Siempre tan modesto, �verdad?
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
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_02"); //�De verdad? �D�nde?
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_03"); //Cerca del viejo monasterio en ruinas que hay junto al mar. Buscamos tesoros juntos.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_04"); //Estoy seguro de que me lo contar� con todo lujo de detalles cuando volvamos a vernos.
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
	description	= "Lester y yo destruimos el fuerte de la monta�a.";
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
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_01"); //Lester y yo destruimos el fuerte de la monta�a.
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_02"); //Ya me lo ha contado. Parece ser que eres de fiar.
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_03"); //�D�nde os hab�is estado reuniendo hasta ahora?
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_04"); //Oh, por ah�. Nos reunimos en muchos lugares distintos.
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
	description	= "�Qu� est�s haciendo aqu�?";
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
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_01"); //�Qu� haces aqu�?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_02"); //No lejos de aqu� hay un antiqu�simo c�rculo de piedras. En su centro se encuentra la entrada a una c�mara subterr�nea.
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_03"); //�Alg�n tipo de tumba?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_04"); //S�, algo as�.
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_05"); //En esa tumba hay una cosa que me gustar�a obtener.
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
	AI_Output		(hero,self,"Info_Milten_SHME_15_01"); //Estoy buscando un foco de piedra. Debe estar por aqu�.
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
	description	= "�Por qu� no te metes en la tumba y coges lo que buscas?";
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
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_01"); //�Por qu� no bajas a la tumba para obtener lo que andas buscando?
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_02"); //Oh, es una larga historia. Tendr�a que remontarme mucho en el tiempo para explic�rtelo.
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_03"); //Adelante, no tengo ninguna prisa.
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_04"); //�De acuerdo! Tras la creaci�n de la Barrera M�gica que nos tiene prisioneros a todos...
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_05"); //...uno de los magos sell� un artefacto m�gico ah� abajo.
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
	description	= "�Este artefacto es uno de los cinco focos de piedra?";
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
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_01"); //�Este artefacto es uno de los cinco focos de piedra?
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_02"); //�Exactamente! Entonces, �ya conoces la historia de los cinco focos de piedra?
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_03"); //�No me digas que t� tambi�n est�s interesado en los focos!
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_04"); //No. No estoy interesado en los focos de piedra. Lo que busco es un talism�n orco.
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
	description	= "�Se aisl� el artefacto?";
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
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_01"); //�El artefacto fue sellado all�?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_02"); //S�. Est� protegido por un poderoso hechizo. El primer ladr�n de tumbas que intente robar el foco...
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_03"); //...sufrir� una maldici�n y ser� condenado a una eterna muerte en vida en la que tendr� que proteger la tumba de otros ladrones.
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_04"); //�C�mo se puede evitar esa maldici�n?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_05"); //Ya no hay necesidad de eso.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_06"); //Hace algunos a�os, un Magnate del Mineral que andaba cazando orcos por placer fue lo suficientemente descuidado como para entrar en la tumba.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_07"); //Ahora es �l quien protege los tesoros que hay all� abajo.
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
	description	= "�Qu� hay de ese talism�n?";
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
	AI_Output			(hero,self,"Info_Milten_SHTALISMAN_15_01"); //�Y qu� hay del talism�n?
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_02"); //Creo que su anterior propietario lo us� para defenderse de unos orcos furiosos.
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_03"); //Si no me equivoco, el talism�n puede ser de gran utilidad.
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
	description	= "�Deber�amos registrar juntos la tumba!";
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
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_01"); //�Deber�amos ir juntos a la tumba! T� te quedas con el talism�n y yo con el foco de piedra.
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_02"); //De acuerdo, pero hay un problema.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_03"); //�Un problema?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_04"); //S�. El guardi�n que hay en la tumba.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_05"); //�No se le puede cortar en pedacitos?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_06"); //Eso no ser�a nada f�cil. Parece tener gran resistencia frente a los efectos de las armas normales.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_07"); //Deja que lo adivine; ya tienes un plan, �verdad?
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
	description	= "�Cu�ntame!";
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
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_01"); //�Cu�ntame!
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_02"); //Aqu� tengo un pergamino de conjuro con un poderoso sortilegio.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_03"); //Ese conjuro destruir� a todos los muertos vivientes que caigan en �l.
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_04"); //Entonces ser� un juego de ni�os saquear la tumba.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_05"); //Ah, esto... Bueno... �No exactamente! El guardi�n ya no est� solo.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_06"); //Probablemente se trate de otros saqueadores de tumbas posteriores que tuvieron el mismo �xito que �l.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_07"); //Baj� ah� una vez y casi me matan. Un hombre solo no puede hacer mucho all�.
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
	description	= "�Dame el pergamino de conjuro y lo haremos juntos!";
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
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_01"); //�Dame el pergamino de conjuro y lo haremos juntos!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_02"); //Espl�ndido, espl�ndido. �Esperaba que dijeras eso!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_03"); //Pero s�lo tenemos un pergamino de conjuro. ��salo con el guardi�n!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_04"); //Los otros muertos vivientes tambi�n pueden ser derrotados en combate ordinario.
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_05"); //Entiendo. Bueno, �cu�l es el camino que lleva al c�rculo de piedras?
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_06"); //S�gueme.

	Log_CreateTopic		(CH3_Stonehenge,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_RUNNING);
	B_LogEntry		(CH3_Stonehenge,"Me he encontrado con Milten, el Mago del Fuego, cerca del c�rculo de piedras. Me ha dicho que uno de los focos de piedra que busco estaba en una cripta bajo la formaci�n rocosa.");
	B_LogEntry		(CH3_Stonehenge,"Milten me ha dado un pergamino de conjuro para derrotar al guardi�n muerto viviente de la cripta. Iremos juntos al interior de la misma.");
	
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

	AI_Output			(self,hero,"Info_Milten_SHARRIVED_02_01"); //Ya estamos aqu�. Este t�nel conduce directamente a la tumba. 
	AI_Output			(hero,self,"Info_Milten_SHARRIVED_15_02"); //�Entonces vamos a visitar al guardi�n!

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
	description	= "Estoy herido. Por favor, ay�dame.";
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
	AI_Output				(hero,self,"Info_Milten_SHHEAL_15_01"); //Estoy herido. Ay�dame, por favor.

	if (	(Npc_HasItems(self,ItFo_Potion_Health_02) >  0)		)
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_02"); //T�mate esta poci�n de curaci�n.
		B_GiveInvItems	    (self, hero,	ItFo_Potion_Health_02,	1);
	}
	else
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_03"); //No me queda ninguna poci�n de curaci�n.
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
	description	= "�El guardia sigue vivo!";
};

FUNC int Info_Milten_SHRUNNING_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,Info_Milten_SHACCEPT)
	&&	(keeperFound && !Npc_IsDead(other))							// W�chter noch nicht besiegt...
	{
		return TRUE;
	};	
};

func void Info_Milten_SHRUNNING_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHRUNNING_15_01"); 	//�El guardi�n todav�a est� vivo!
	AI_Output			(self,hero,"Info_Milten_SHRUNNING_02_02"); 	//Entonces destr�yelo con el pergamino de conjuro.
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
	description	= "Us� el pergamino de conjuro.";
};

FUNC int Info_Milten_SHSCROLL_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);
	if (	(keeperFound && !Npc_IsDead(other))							// W�chter noch nicht besiegt...
	&&		Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		(Npc_HasItems(hero, ItArScrollDestroyUndead)==0)	
	&&		(Npc_HasItems(hero, ItArRuneDestroyUndead)==0)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSCROLL_15_01"); //Ya he utilizado el pergamino de conjuro... �pero no con el guardi�n!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_02"); //�Esto es una cat�strofe! �Entonces tendr�s que encontrar otra manera de derrotarle!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_03"); //Tal vez puedas adquirir otro pergamino de conjuro o una runa en uno de los campamentos.
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_04"); //Te esperar� aqu�, donde nos vimos por primera vez.

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
	AI_Output			(hero,self,"Info_Milten_SHNEWSCROLL_15_01"); //�Tengo un nuevo pergamino de conjuro de 'Muerte a los Muertos Vivientes'!
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_02"); //Muy bien. Ahora podemos hacerle otra visita al guardi�n.
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_03"); //T� primero; yo te sigo.

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

	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_01"); 	//Pareces haber perdido el inter�s por la tumba.
	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_02"); 	//Si cambias de opini�n, podr�s encontrarme donde nos vimos la �ltima vez.

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
	description = "�Lo intentamos de nuevo con el guardia?";
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

	AI_Output			(hero,self,"Info_Milten_SHCONTINUE_15_01"); //�Nos atrevemos a hacer otro intento con el guardi�n?
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

	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_01"); //Muy bien. Tienes el talism�n.
	AI_Output			(hero,self,"Info_Milten_SHSUCCESS_15_02"); //Aqu� lo tienes. ��ste era el trato!
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_03"); //Gracias, amigo m�o. Nunca olvido a los que me ayudan.
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_04"); //Me vuelvo al Campamento Viejo; tal vez nos encontremos all�.
	
	B_GiveInvItems	(hero,self,	ItMi_OrcTalisman, 1);
	
	B_LogEntry		(CH3_Stonehenge,"Hemos derrotado juntos al GUARDI�N de debajo del c�rculo de piedras. Milten ha cogido su parte del bot�n y regresado al Campamento Viejo.");
	B_LogEntry		(CH3_Stonehenge,"�Saturas estar� satisfecho de que haya encontrado aqu� un foco!");
	
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

	AI_Output			(self,hero,"Info_Milten_OCWARN_02_01"); //Est�n... Est�n todos muertos... Todos MUERTOS. No pude ayudarlos... Yo estaba... No estaba all�... Yo...

	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_02"); //C�lmate, Milten. Ya he visto a Diego en el otro extremo del Campamento.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_03"); //Muy bien, as� que ya lo sabes. �Qu� dijo Diego?
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_04"); //Si puedo encontrar a Gorn y a Lester, les avisar� y les enviar� a vuestro punto de reuni�n.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_05"); //�Buena suerte y ten cuidado!
		B_LogEntry		(CH4_Firemages,"Al igual que Diego, Milten se esconde cerca del Campamento Viejo. A una distancia segura de la entrada principal, el Mago del Fuego avisa a todos los que se acercan all�, para que no caigan en manos de los guardias.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_06"); //C�lmate, Milten. �Qu� es lo que ha ocurrido?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_07"); //Han matado a los Magos del Fuego. A TODOS, excepto a m�, y yo tambi�n estuve cerca de morir.
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_08"); //Ser� mejor que me cuentes la historia completa desde el principio, una cosa tras otra.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_09"); //De acuerdo. Tranquilo, Milten, tranquilo.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_10"); //Todo empez� con el derrumbamiento de la Mina Vieja.
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_11"); //�Que la Mina Vieja SE HA DERRUMBADO?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_12"); //S�. Todo sucedi� con gran rapidez. Nadie consigui� salir de la mina.
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
	description = "�C�mo pudo hundirse la mina?";
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
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_01"); //�C�mo es posible que se derrumbase la mina?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_02"); //No tengo ni idea. Algunos de los cavadores que estaban esperando frente a la entrada dijeron algo de un gran terremoto y una gran nube de polvo que sal�a del t�nel.
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_03"); //�Estabas t� all�?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_04"); //S�. Ah� fue donde me enter� del derrumbamiento.
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
	description = "�Qu� fue lo que dijiste de los Magos del Fuego?";
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
	AI_Output			(hero,self,"Info_Milten_OCKDW_15_01"); //�Qu� es lo que dijiste de los Magos del Fuego?
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_02"); //Lo �nico que s� es que todos fueron asesinados por los Magnates del Mineral poco despu�s del derrumbamiento de la mina.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_03"); //Cuando regres� de nuestra aventura bajo el c�rculo de piedras, los guardias de la puerta me atacaron de repente.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_04"); //Me gritaron palabras como 'traidor' y 'colaborador'. Escap� por los pelos.
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
	description = "�Por qu� querr�an matar a los magos los Magnates del Mineral...?";
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
	AI_Output			(hero,self,"Info_Milten_OCWHY_15_01"); //�Por qu� iban a querer los Magnates del Mineral matar a los magos? No tiene sentido.
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_02"); //Exacto. Los guardias no me dieron oportunidad de preguntar. Desenvainaron sus espadas al instante.
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_03"); //Tal vez Diego sepa algo m�s. �l estaba en el Campamento cuando las cosas se pusieron feas.
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
	description = "Debes esconderte. Lejos de aqu�.";
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
	AI_Output			(hero,self,"Info_Milten_OCYOU_15_01"); //Deber�as esconderte. Muy lejos de aqu�.
	AI_Output			(self,hero,"Info_Milten_OCYOU_02_02"); //No. Diego y yo acordamos vigilar las dos puertas y avisar a nuestros confiados amigos de los otros campamentos.

	if (!Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{	
		AI_Output		(self,hero,"Info_Milten_OCYOU_02_03"); //�Por favor, habla con Diego!
	}
	else
	{
		B_LogEntry		(CH4_Firemages,"Despu�s de que Diego me contara los incre�bles acontecimientos, me he encontrado con Milten frente al Campamento Viejo. Espero que no me pillen.");
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
	description = "�D�nde puedo encontrar a Diego?";
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
	AI_Output			(hero,self,"Info_Milten_OCDIEGO_15_01"); //�D�nde puedo encontrar a Diego?
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_02"); //Est� escondido en la otra punta del Campamento Viejo, cerca de la puerta de atr�s.
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_03"); //�Por favor, habla con �l!

	B_LogEntry			(CH4_Firemages,"Milten me ha alcanzado frente al Campamento Viejo y me ha hablado del derrumbamiento de la Vieja Mina y el asesinato de los Magos del Fuego.");
	B_LogEntry			(CH4_Firemages,"Diego est� en la otra parte del Campamento Viejo, cerca de la puerta posterior. Debo hablar con �l, pues sabe m�s acerca de lo sucedido.");
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

	AI_Output			(self, hero,"Info_Milten_LOADSWORD_02_01"); //Saludos, amigo; hac�a mucho tiempo que no te ve�a.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_02"); //Hola, Milten. Han ocurrido muchas cosas desde la �ltima vez que nos vimos.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_03"); //Me gustar�a cont�rtelo todo, pero ahora mismo no tengo tiempo. Tengo prisa.
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
	description		= "�Milten, necesito tu ayuda!"; 
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
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_01"); //�Milten, necesito tu ayuda!
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_02"); //�Qu� ocurre? �Qu� puedo hacer para ayudarte?
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_03"); //Vayamos a un lugar donde podamos hablar.
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_04"); //De acuerdo. S�gueme.

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

	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_01"); //Ahora dime �qu� es lo que ocurre?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_02"); //Necesito los poderes m�gicos del mont�culo de mineral y creo que no ser�a prudente ped�rselo a los otros Magos del Agua.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_03"); //�Est�s de broma!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_04"); //�ste no es momento para bromas. Hablo totalmente en serio.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_05"); //�He visto a Xardas, el nigromante!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_06"); //�Estoy trabajando a sus �rdenes!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_07"); //�XARDAS? �Empiezas a asustarme!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_08"); //Nadie ha hablado con �l desde que abandon� el Campamento Viejo.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_09"); //�Yo lo he hecho!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_10"); //�Para qu� necesitas los poderes del mont�culo de mineral?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_11"); //Quiero transferirlos a esta espada.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_12"); //�Caramba, menuda arma!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_13"); //�Se llama URIZIEL!
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
	description		= "Xardas me dio este conjuro m�gico."; 
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
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_01"); //�Xardas me dio este conjuro m�gico para llevar a cabo la transferencia!
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_02"); //�Tendr�s que recitarlo mientras junto la espada y el mineral!
	B_UseFakeScroll		();
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_03"); //Mmmm... Mmmm... Parece que no tengo m�s que leer este conjuro...
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_04"); //�Pero nos meteremos en un l�o con Saturas y los otros magos!
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
	description		= "�Tendremos que correr ese riesgo!"; 
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
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_01"); //�Tendremos que correr ese riesgo!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_02"); //�De verdad que es MUY, MUY importante!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_03"); //Importante para TODOS los habitantes de la colonia.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_04"); //No lo comprendo.
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_05"); //�Nos permitir� salir de aqu�! �Tienes que fiarte de m�!
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_06"); //�De acuerdo! Despu�s de todo lo que has hecho por nosotros, conf�o totalmente en ti.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_07"); //Adem�s, parece que Xardas tambi�n conf�a en ti.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_08"); //Re�nete conmigo en el mont�culo de mineral y... �no se lo digas a nadie!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_09"); //�De acuerdo, nos encontraremos en el mont�culo! �Nos vemos all�!
	
	B_LogEntry			(CH5_Uriziel,"He logrado convencer a mi amigo Milten de que me ayude a transferir la energ�a a la espada. Nos reuniremos en la base del mont�culo de mineral de los Magos del Agua.");
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

	AI_Output			(self, hero,"Info_Milten_LSOREHEAP_02_01"); //�Tienes la espada y el conjuro?
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
	description		= "�Ten, toma el conjuro!"; 
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
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_01"); //�Toma, aqu� tienes el conjuro!
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_02"); //�Est�s listo?
	AI_Output			(self, hero,"Info_Milten_LSNOW_02_03"); //Tan listo como cualquiera podr�a estarlo para este plan demencial.
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_04"); //�Entonces hag�moslo!

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

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_01"); //�Hecho!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_02"); //�Incre�ble! �La gema lisa gris ahora da un resplandor azulado!

	AI_EquipBestMeleeWeapon	(hero);
	AI_ReadyMeleeWeapon		(hero);
	AI_PlayAni				(hero, "T_1HSINSPECT");
	AI_RemoveWeapon			(hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_03"); //�Eso es buena se�al! �Los poderes m�gicos del mont�culo de mineral parecen residir ahora en la vieja espada!
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_04"); //Pero parece que nuestra peque�a operaci�n ha atra�do algo de atenci�n.
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_05"); //�Deber�as teleportarte lejos de aqu�!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_06"); //�Y t�?
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_07"); //No te preocupes de m�, ya pensar� en algo. �Ahora, vete!

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
