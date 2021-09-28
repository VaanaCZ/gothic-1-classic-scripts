// ************************ EXIT **************************

instance  VLK_585_Aleph_Exit (C_INFO)
{
	npc			=  VLK_585_Aleph;
	nr			=  999;
	condition	=  VLK_585_Aleph_Exit_Condition;
	information	=  VLK_585_Aleph_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_585_Aleph_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_585_Aleph_Exit_Info()
{
	if	!Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH)
	{
		AI_Output (other, self,"VLK_585_Aleph_Exit_Info_15_01"); //¡Buena suerte!
		AI_Output (self, other,"VLK_585_Aleph_Exit_Info_05_02"); //Bueno, ya sabes dónde encontrarme.
	};
	
	AI_StopProcessInfos	( self );

};
// ***************** ALEPH IST EIN FAULPELZ *****************************
instance VLK_585_Aleph_CLEVER (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_CLEVER_Condition;
	information		= VLK_585_Aleph_CLEVER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_585_Aleph_CLEVER_Condition()
{
	return 1;
};

func void  VLK_585_Aleph_CLEVER_Info()
{
	AI_Output (self,other,"VLK_585_Aleph_CLEVER_Info_05_01"); //¡Jejejeje; los guardias no me pillarán nunca!
};
// ***************** ALEPH ERKLÄRT SEINE ARBEITSHALTUNG *****************************

instance  VLK_585_Aleph_GUARDS (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_GUARDS_Condition;
	information		= VLK_585_Aleph_GUARDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Qué quieres decir?"; 
};

FUNC int  VLK_585_Aleph_GUARDS_Condition()
{	
	if Npc_KnowsInfo (hero,VLK_585_Aleph_CLEVER) 
	{
		return 1;
	};
};

FUNC void  VLK_585_Aleph_GUARDS_Info()
{
	AI_Output (other, self,"VLK_585_Aleph_GUARDS_Info_15_01"); //¿Qué quieres decir?
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_02"); //Sólo trabajo cuando los guardias están cerca o pueden verme. Si no, me limito a perder el tiempo.
	AI_Output (other, self,"VLK_585_Aleph_GUARDS_Info_15_03"); //¿Y no sospechan nada?
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_04"); //Bueno, claro que extraigo menos mineral que los otros. No siempre es suficiente, así que tengo que hacer algún trapicheo.
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_05"); //Suelo mantener los ojos abiertos, así que me entero de cosas de interés. ¿No llevarás algo de mineral encima, por casualidad? ¿Digamos que unas 10 pepitas?

	Npc_ExchangeRoutine (self,"BUSY");
	
	var C_Npc Brandick; 				
	Brandick = Hlp_GetNpc(GRD_261_Brandick);
	Npc_ExchangeRoutine (Brandick,"WATCH");
	AI_ContinueRoutine(Brandick);	// TEST!!!
};
// ***************** ALEPH BIETET INFO *****************************

instance VLK_585_Aleph_INFO (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_INFO_Condition;
	information		= VLK_585_Aleph_INFO_Info;
	important		= 0;
	permanent		= 0;
	description		= "(Entregar 10 pepitas)";
};

FUNC int  VLK_585_Aleph_INFO_Condition()
{
	if ( Npc_HasItems (hero,ItMinugget) ) >= 10 &&  (Npc_KnowsInfo (hero, VLK_585_Aleph_GUARDS) ) 
	{
		return 1;
	};
};

func void  VLK_585_Aleph_INFO_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_INFO_Info_15_01"); //De acuerdo, aquí tienes 10 pepitas.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_02"); //Gracias. Si vas al pozo principal y bajas por las pasarelas, enseguida llegarás a dos cuevas laterales.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_03"); //En la segunda hay un guardia y también una trituradora vieja.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_04"); //Por ahí debe haber una poción de curación, ¡pero ten cuidado y mantente alerta por si los reptadores!
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_05"); //Y si necesitas u oyes algo, vuelve a verme; seguro que podré serte de ayuda.
	
	B_GiveInvItems (hero, other, ItMiNugget,10);
};
// ***************** WIRD ALEPH ANGESCHWÄRZT IST ER SAUER*****************************
instance VLK_585_Aleph_ANGRY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_ANGRY_Condition;
	information		= VLK_585_Aleph_ANGRY_Info;
	important		= 1;
	permanent		= 0;
};	

FUNC int  VLK_585_Aleph_ANGRY_Condition()
{
	if ( Npc_KnowsInfo (hero,GRD_261_Brandick_ALEPH) )
	{
		return 1;
	};
};

func void  VLK_585_Aleph_ANGRY_Info()
{
	
	AI_Output (self,other,"VLK_585_Aleph_ANGRY_Info_05_01"); //¿Que me has puesto a parir delante de Brandick? ¡Vete por ahí!
	
	AI_StopProcessInfos	( self );
	Npc_SetTempAttitude (self,ATT_ANGRY);
};
//***************** LOCKPICKS*****************************
instance VLK_585_Aleph_KEY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_KEY_Condition;
	information		= VLK_585_Aleph_KEY_Info;
	important		= 0;
	permanent		= 0;
	description     = "¿Tienes más información útil?";
};
FUNC int  VLK_585_Aleph_KEY_Condition()
{
	if ! ( Npc_KnowsInfo (hero,GRD_261_Brandick_ALEPH) ) &&  ( Npc_KnowsInfo (hero, VLK_585_Aleph_INFO))
	{
		return 1;
	};
};

func void  VLK_585_Aleph_KEY_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_KEY_Info_15_01"); //¿Tienes alguna otra información útil?
	AI_Output (self,other,"VLK_585_Aleph_KEY_Info_05_02"); //Claro, ¿tienes 10 pepitas?
};

//***************** LOCKPICKS*****************************
instance VLK_585_Aleph_GLEN (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_GLEN_Condition;
	information		= VLK_585_Aleph_GLEN_Info;
	important		= 0;
	permanent		= 0;
	description     = "(Entregar 10 pepitas)";
};
FUNC int  VLK_585_Aleph_GLEN_Condition()
{
	if ( Npc_HasItems (hero,ItMinugget) ) >= 10 &&  ( Npc_KnowsInfo (hero,VLK_585_Aleph_KEY) )
	{
		return 1;
	};
};

func void  VLK_585_Aleph_GLEN_Info()
{
	
	AI_Output (other,self,"VLK_585_Aleph_GLEN_Info_15_01"); //¡Espero recibir buena información a cambio de mi mineral!
	AI_Output (self,other,"VLK_585_Aleph_GLEN_Info_05_02"); //Aquí hay un montón de cofres cerrados con llave. Glen, el cavador de arriba, podría proporcionarte un par de ganzúas.
	
	B_GiveInvItems (hero, self, ItMinugget,10); 
};
//***************** LAGERSCHUPPENSCHLÜSSEL*****************************
func void B_Aleph_StorageShedKey()
{
	B_LogEntry		(CH2_StorageShed,"¡Aleph me ha vendido la llave de los cofres de la caseta de almacenamiento!");
};

instance VLK_585_Aleph_SCHUPPEN (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_SCHUPPEN_Condition;
	information		= VLK_585_Aleph_SCHUPPEN_Info;
	important		= 0;
	permanent		= 0;
	description     = "¿Sabes algo de la llave de los cofres del almacén?";
};
FUNC int  VLK_585_Aleph_SCHUPPEN_Condition()
{
	if ( Npc_KnowsInfo (hero, GRD_271_ULBERT_DRUNK) ) && ( !Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH) )
	{
		return 1;
	};
};

func void  VLK_585_Aleph_SCHUPPEN_Info()
{
	
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_01"); //¿Sabes algo acerca de la llave de los cofres que hay en la cabaña de almacenamiento?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_02"); //Bueno, eso depende.
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_03"); //¿De cuántas pepitas te pague?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_04"); //Aprendes rápido.
	
	Info_ClearChoices ( VLK_585_Aleph_SCHUPPEN );
	
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,DIALOG_BACK 	   ,VLK_585_Aleph_SCHUPPEN_Back);
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Pagar 50 pepitas.",VLK_585_Aleph_SCHUPPEN_50 );
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Pagar 30 pepitas.",VLK_585_Aleph_SCHUPPEN_30 );
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Pagar 15 pepitas.",VLK_585_Aleph_SCHUPPEN_15 );
};


func void VLK_585_Aleph_SCHUPPEN_50 ()
{
	
	if (Npc_HasItems (hero, ItMiNugget) >= 50)
	{ 
		AI_Output			(other,self,"VLK_585_Aleph_SCHUPPEN_50_15_01"); //¡Por tratarse de ti, debería bastar con 50 pepitas!
		AI_Output			(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_02"); //¡Muy generoso! Aquí tienes la llave. Y llévate este anillo también. A mí siempre me ha traído suerte.

		CreateInvItems		(self, ItKe_OM_03,	1);			// nur für die korrekte Textausgaben!!!
		B_GiveInvItems      (self, hero, ItKe_OM_03, 2);
		Npc_RemoveInvItem	(hero, ItKe_OM_03);

		Npc_RemoveInvItem	(self, Staerkering);
		CreateInvItem		(hero, Staerkering);

		B_GiveInvItems	    (hero, self, ItMinugget,50);  

		Npc_SetPermAttitude (self, ATT_FRIENDLY ); 
		Info_ClearChoices	(VLK_585_Aleph_SCHUPPEN);
		VLK_585_Aleph_SCHUPPEN.permanent = 0;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_50_05_03"); //¡No tienes pepitas suficientes!
		VLK_585_Aleph_SCHUPPEN.permanent = 1;
	};
};

func void VLK_585_Aleph_SCHUPPEN_30 ()
{
	
	
	if (Npc_HasItems (hero, ItMiNugget) >= 30)
	{ 
		CreateInvItem		(self, ItKe_OM_03);
		B_GiveInvItems      (self, other, ItKe_OM_03, 1);
		B_GiveInvItems	(hero, self, ItMinugget,30);  
		Info_ClearChoices	(VLK_585_Aleph_SCHUPPEN );
		AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_30_15_01"); //Con 30 pepitas debería bastar.
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_30_05_02"); //Vale; da la casualidad de que llevo la llave encima.
		VLK_585_Aleph_SCHUPPEN.permanent = 0;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_30_05_03"); //No tienes pepitas suficientes.
		VLK_585_Aleph_SCHUPPEN.permanent = 1;
	}; 
};	
func void VLK_585_Aleph_SCHUPPEN_15 ()
{
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_15_15_01"); //¿Te parecen bien 15 pepitas?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_15_05_02"); //¿15 pepitas? ¡Yo no sé nada de ninguna llave!
	VLK_585_Aleph_SCHUPPEN.permanent = 0;
};	
func void VLK_585_Aleph_SCHUPPEN_Back ()
{
	Info_ClearChoices	(  VLK_585_Aleph_SCHUPPEN );
	VLK_585_Aleph_SCHUPPEN.permanent = 1;
};

// WENN DER SPIELER ALEPH BEI BRANDICK ANGESCHWÄRZT HAT
instance  VLK_585_Aleph_DIRTY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_DIRTY_Condition;
	information		= VLK_585_Aleph_DIRTY_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Sabes algo de la llave de los cofres del almacén?"; 
};

FUNC int  VLK_585_Aleph_DIRTY_Condition()
{
	if ( Npc_KnowsInfo (hero, GRD_271_ULBERT_DRUNK) ) && ( Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH) )
	{
		return 1;
	};
};


FUNC void  VLK_585_Aleph_DIRTY_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_Info_15_01"); //¿Sabes algo acerca de la llave de los cofres que hay en la cabaña de almacenamiento?
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_Info_05_02"); //Bueno, eso depende.
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_Info_15_03"); //¿De cuántas pepitas te pague?
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_Info_05_04"); //Aprendes rápido. Quiero 100 pepitas.
	
	Info_ClearChoices ( VLK_585_Aleph_DIRTY );
	
	Info_AddChoice ( VLK_585_Aleph_DIRTY,"(Pagar 100 pepitas)",VLK_585_Aleph_DIRTY_100 );
	Info_AddChoice ( VLK_585_Aleph_DIRTY,"(No pagar)",VLK_585_Aleph_DIRTY_NO );
};  
func void VLK_585_Aleph_DIRTY_100()
{
	if Npc_HasItems (hero,ItMinugget)>=100
	{ 
		AI_Output (other,self,"VLK_585_Aleph_DIRTY_100_Info_15_01"); //Vale, estafador. Aquí tienes las 100.
		AI_Output (self,other,"VLK_585_Aleph_DIRTY_100_Info_05_02"); //No deberías haberme delatado. Aquí tienes la llave.
		B_GiveInvItems	(hero, self, ItMinugget,100);
		CreateInvItem		(self, ItKe_OM_03);
		B_GiveInvItems      (self, other, ItKe_OM_03, 1);
		Info_ClearChoices	( VLK_585_Aleph_DIRTY );
		VLK_585_Aleph_DIRTY.permanent = 0;	
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_DIRTY_100_Info_05_03"); //¿Es que piensas que soy estúpido o qué? ¡100 pepitas, ni una menos!
		VLK_585_Aleph_DIRTY.permanent = 1;
	};
};
func void VLK_585_Aleph_DIRTY_NO()
{
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_NO_Info_15_01"); //¡No voy a regalarte 100 pepitas!
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_NO_Info_05_02"); //¡Oye, eres tú el que no hace más que ponerse a hablar conmigo!
	VLK_585_Aleph_DIRTY.permanent = 0;	
};
