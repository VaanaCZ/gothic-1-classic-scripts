//****************************************
//					EXIT
//****************************************

INSTANCE DIA_ORG_855_Wolf_Exit (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 999;
	condition	= DIA_ORG_855_Wolf_Exit_Condition;
	information	= DIA_ORG_855_Wolf_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ORG_855_Wolf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_ORG_855_Wolf_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//****************************************
//					Hallo
//****************************************

INSTANCE DIA_Wolf_Hello (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 1;
	condition	= DIA_Wolf_Hello_Condition;
	information	= DIA_Wolf_Hello_Info;
	permanent	= 0;
	description = "¿Quién eres?";
};                       

FUNC INT DIA_Wolf_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Wolf_Hello_Info()
{
	AI_Output			(other, self,"DIA_Wolf_Hello_15_00"); //¿Quién eres?
	AI_Output			(self, other,"DIA_Wolf_Hello_09_01"); //Soy Wolf. Hago armaduras.

	B_LogEntry			(GE_TraderNC,"Wolf suministra armaduras a los bandidos. Suele estar frente a su cabaña en la gran caverna habitable.");
};

//****************************************
//				Bin ORG!
//****************************************

INSTANCE DIA_Wolf_GreetORG (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 1;
	condition	= DIA_Wolf_GreetORG_Condition;
	information	= DIA_Wolf_GreetORG_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Wolf_GreetORG_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Wolf_GreetORG_Info()
{
	AI_Output (self, other,"DIA_Wolf_GreetORG_09_00"); //¡Eh! Ahora eres uno de nosotros, chico.
};

//****************************************
//				TRADE
//****************************************

instance  Org_855_Wolf_TRADE (C_INFO)
{
	npc				= Org_855_Wolf;
	nr				= 800;
	condition		= Org_855_Wolf_TRADE_Condition;
	information		= Org_855_Wolf_TRADE_Info;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  Org_855_Wolf_TRADE_Condition()
{	
	return 1;
};

FUNC void  Org_855_Wolf_TRADE_Info()
{
	AI_Output (other, self,"Org_855_Wolf_TRADE_15_00"); //¿Comercias con alguna otra cosa?
	AI_Output (self, other,"Org_855_Wolf_TRADE_09_01"); //Les compro pieles y pellejos a los cazadores. Si consigues algo así, te lo compraré.
	

};

//****************************************
//				Wo Jäger
//****************************************

instance  Org_855_Wolf_WhereHunter (C_INFO)
{
	npc				= Org_855_Wolf;
	nr				= 900;
	condition		= Org_855_Wolf_WhereHunter_Condition;
	information		= Org_855_Wolf_WhereHunter_Info;
	permanent		= 1;
	description		= "¿Cómo consigo pieles y cueros?"; 
};

FUNC int  Org_855_Wolf_WhereHunter_Condition()
{	
	return 1;
};

FUNC void  Org_855_Wolf_WhereHunter_Info()
{
	AI_Output (other, self,"Org_855_Wolf_WhereHunter_15_00"); //¿Cómo hago para conseguir pieles y pellejos?
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_01"); //En el camino hacia el Campamento Nuevo encontrarás a Aidan. Él puede enseñarte a desollar animales.
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_02"); //Ratford y Drax suelen andar por el norte del Campamento Viejo. De camino hacia la plaza del mercado.
};

//****************************************
//				Sell Armor
//****************************************

INSTANCE DIA_Wolf_SellArmor (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 700;
	condition	= DIA_Wolf_SellArmor_Condition;
	information	= DIA_Wolf_SellArmor_Info;
	permanent	= 1;
	description = "Busco una armadura mejor.";
};                       

FUNC INT DIA_Wolf_SellArmor_Condition()
{
	if ( (Npc_KnowsInfo(hero,DIA_Wolf_Hello)) 
	&& (!Npc_KnowsInfo(hero, Info_Wolf_ARMORFINISHED)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_SellArmor_Info()
{
	AI_Output (other, self,"DIA_Wolf_SellArmor_15_00"); //Ando en busca de una armadura mejor.
	
	if ( (Npc_GetTrueGuild(other)==GIL_ORG) || (Npc_GetTrueGuild(other)==GIL_SLD) )
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_09_01"); //Dado que ahora eres uno de nosotros, puedo venderte una.

		Info_ClearChoices 	(DIA_Wolf_SellArmor);
		Info_Addchoice 		(DIA_Wolf_SellArmor,DIALOG_BACK														,DIA_Wolf_SellArmor_BACK);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfBandits,VALUE_ORG_ARMOR_M),DIA_Wolf_SellArmor_M);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfHeavyBandits,VALUE_ORG_ARMOR_H)		,DIA_Wolf_SellArmor_H);
	}
	else
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00"); //No puedo venderte nada. Lares me mataría si le vendiera una armadura a un forastero.
	};
};

func void DIA_Wolf_SellArmor_BACK()
{
	Info_ClearChoices 	(DIA_Wolf_SellArmor);
};

func void DIA_Wolf_SellArmor_M()
{
	AI_Output (other, self,"DIA_Wolf_SellArmor_M_15_01"); //Quiero una armadura intermedia.
	
	if (Npc_HasItems (hero,ItMinugget)< VALUE_ORG_ARMOR_M)
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_M_09_02"); //Si no tienes mineral, no hay armadura.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_M_09_03"); //Es una buena armadura. No tan buena como la que llevo yo, pero te dará una buena protección.

		B_GiveInvItems		(hero, self,ItMinugget,VALUE_ORG_ARMOR_M);
		
		CreateInvItem		(hero,ORG_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};

func void DIA_Wolf_SellArmor_H()
{
	AI_Output (other,self,"DIA_Wolf_SellArmor_H_15_01"); //¿Puedes venderme una armadura pesada?

	if (Npc_HasItems (hero,ItMinugget) < VALUE_ORG_ARMOR_H) 
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_H_09_02"); //Si no tienes mineral, no hay armadura.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_H_09_03"); //¡Esta armadura te protegerá de cualquier peligro! Yo mismo llevo una igual y he sobrevivido hasta ahora. En gran parte gracias a la armadura.

		B_GiveInvItems		(hero, self, ItMinugget,VALUE_ORG_ARMOR_H);
		
		CreateInvItem 		(hero,ORG_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};

/*------------------------------------------------------------------------
							BOGENSCHIESSEN	DAS ANGEBOT							
------------------------------------------------------------------------*/

instance  ORG_855_Wolf_TRAINOFFER (C_INFO)
{
	npc				= ORG_855_Wolf;
	nr				= 100;
	condition		= ORG_855_Wolf_TRAINOFFER_Condition;
	information		= ORG_855_Wolf_TRAINOFFER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Me gustaría aprender a manejar el arco."; 
};

FUNC int  ORG_855_Wolf_TRAINOFFER_Condition()
{	
	if( Npc_GetTalentSkill (hero,NPC_TALENT_BOW) != 2)
	{
		return TRUE;
	};
};

FUNC void  ORG_855_Wolf_TRAINOFFER_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_01"); //Me gustaría aprender a manejar un arco.
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_02"); //Yo puedo enseñarte. Pero no como un favor. Después de todo, yo también tengo que comer.
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_03"); //¿Cuánto?
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_04"); //Cualquier cosa que te enseñe te costará 50 pepitas. Sin regateo.
	
	Log_CreateTopic   	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Wolf, el bandido, puede enseñarme a usar el ARCO.");
	
};  
/*------------------------------------------------------------------------
						BOGENSCHIESSEN		DIE ERSTE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  ORG_855_Wolf_TRAIN (C_INFO)
{
	npc				= ORG_855_Wolf;
	nr				= 100;
	condition		= ORG_855_Wolf_TRAIN_Condition;
	information		= ORG_855_Wolf_TRAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,50); 
};

FUNC int  ORG_855_Wolf_TRAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_855_Wolf_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		return TRUE;
	};

};
FUNC void  ORG_855_Wolf_TRAIN_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRAIN_Info_15_01"); //Enséñame a utilizar un arco.
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_02"); //Tus dianas dependen de tu destreza. Cuanto más diestro te vuelvas, con mayor precisión darán tus flechas en el blanco.
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_03"); //Tu habilidad condiciona la distancia desde la que disparas a tus blancos. Para convertirte en un buen arquero, deberías mejorar ambas cosas en igual proporción.
			B_GiveInvItems (hero, self, ItMiNugget,50);
		};
	};
};  
/*------------------------------------------------------------------------
						BOGENSCHIESSEN		DIE ZWEITE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  ORG_855_Wolf_TRAINAGAIN (C_INFO)
{
	npc				= ORG_855_Wolf;
	nr				= 100;
	condition		= ORG_855_Wolf_TRAINAGAIN_Condition;
	information		= ORG_855_Wolf_TRAINAGAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= B_BuildLearnString(NAME_LearnBow_2,	LPCOST_TALENT_BOW_2,50); 
};

FUNC int  ORG_855_Wolf_TRAINAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_855_Wolf_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		return TRUE;
	};

};
FUNC void  ORG_855_Wolf_TRAINAGAIN_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01"); //Quiero mejorar mi habilidad con el arco.
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02"); //Ya eres un buen cazador. Ahora adquirirás el conocimiento que te falta.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03"); //Para convertirte en un buen arquero, tienes que tomártelo con más calma.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04"); //Descubre las leyes del ojo, la tensión, la trayectoria y el blanco. Permanece siempre alerta y preparado.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05"); //Ya has conseguido un buen dominio de la técnica. Ahora vete a poner en práctica tus conocimientos y habilidades.
			
			B_GiveInvItems (hero, self, ItMiNugget,50);
		};
	};
}; 
//---------------------------------------------------------------
//     					 DEX
//---------------------------------------------------------------
INSTANCE ORG_855_Wolf_Teach(C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 100;
	condition	= ORG_855_Wolf_Teach_Condition;
	information	= ORG_855_Wolf_Teach_Info;
	permanent	= 1;
	description = "¿Puedes enseñarme algo?";
};                       

FUNC INT ORG_855_Wolf_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GRD)  
	{
		return TRUE;
	};
};

FUNC VOID ORG_855_Wolf_Teach_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00"); //¿Puedes enseñarme algo?
	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01"); //Tu destreza condiciona el éxito de tu cacería.
	
	if (log_wolftrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Wolf, el bandido, puede enseñarme cómo mejorar mi DESTREZA.");
	log_wolftrain = TRUE;
	};
	
	Info_ClearChoices	(ORG_855_Wolf_Teach);
	Info_AddChoice		(ORG_855_Wolf_Teach,DIALOG_BACK									,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_BACK()
{
	
	Info_ClearChoices	(ORG_855_Wolf_Teach);
};
func void ORG_855_Wolf_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(ORG_855_Wolf_Teach);
	Info_AddChoice		(ORG_855_Wolf_Teach,DIALOG_BACK									,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0) ,ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_DEX_5()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(ORG_855_Wolf_Teach);
	Info_AddChoice		(ORG_855_Wolf_Teach,DIALOG_BACK									,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};




//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


//---------------------------------------------------------------------
//	Info GOOD
//---------------------------------------------------------------------
INSTANCE Info_Wolf_GOOD (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_GOOD_Condition;
	information	= Info_Wolf_GOOD_Info;
	important	= 0;	
	permanent	= 0;
	description = "Gorn dijo que querías hablar conmigo urgentemente.";
};                       

FUNC INT Info_Wolf_GOOD_Condition()
{
	if	Gorn_GotoWolf
	{
		return TRUE;
	};
};

func VOID Info_Wolf_GOOD_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_GOOD_15_01"); //Gorn me ha dicho que querías hablar conmigo urgentemente.
	AI_Output 			(self,hero,"Info_Wolf_GOOD_09_02"); //¡Me alegra que te pasaras por aquí antes de irte!
	if (!Npc_KnowsInfo(hero,Info_Gorn_FMCENTRANCE))
	{
		AI_Output 			(hero,self,"Info_Wolf_GOOD_15_03"); //¿Irme dónde?
		AI_Output 			(self,hero,"Info_Wolf_GOOD_09_04"); //Antes de que vayas a visitar la 'Mina No Tan Libre'.
	};
};

//---------------------------------------------------------------------
//	Info SPEAK
//---------------------------------------------------------------------
INSTANCE Info_Wolf_SPEAK (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_SPEAK_Condition;
	information	= Info_Wolf_SPEAK_Info;
	important	= 0;	
	permanent	= 0;
	description = "¿Qué pasa?";
};                       

FUNC INT Info_Wolf_SPEAK_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Wolf_GOOD)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_SPEAK_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_SPEAK_15_01"); //¿Qué ocurre?
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_02"); //Tengo una idea acerca de cómo producir una armadura totalmente nueva.
	AI_Output 			(hero,self,"Info_Wolf_SPEAK_15_03"); //¿Oh? ¿Cómo?
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_04"); //Las placas de armadura de los reptadores son el material más duro que conozco.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_05"); //No me refiero a los pequeños ejemplares inofensivos que se encuentran en la mina enterrada de Gómez.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_06"); //...NOOOO. Esos no. En nuestra mina se encuentra una variedad mucho más peligrosa.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_07"); //¡La armadura de estas bestias es verdaderamente impenetrable!
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_08"); //Si consigues traerme algunas de estas placas de armadura, podría intentar hacer una armadura con ellas.
};

//---------------------------------------------------------------------
//	Info SKIN
//---------------------------------------------------------------------
INSTANCE Info_Wolf_SKIN (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_SKIN_Condition;
	information	= Info_Wolf_SKIN_Info;
	important	= 0;	
	permanent	= 0;
	description = "¿Cómo puedo quitar las placas a estas bestias?";
};                       

FUNC INT Info_Wolf_SKIN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Wolf_SPEAK)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_SKIN_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_01"); //¿Cómo puedo quitar las placas de armadura a esas bestias?
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_02"); //Eso es muy fácil. La placas de la espalda solo están unidas al cuerpo por el borde.
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_03"); //Llévate una navaja y 'corta por la línea de puntos'.
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_04"); //¡Vale, entendido! Voy a ver si puedo encontrar esas placas de armadura.

	Knows_GetMCPlates = TRUE;
	PrintScreen	("Aprender: quitar placas de armadura", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	
	Log_CreateTopic		(CH4_MCPlateArmor,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_RUNNING);
	B_LogEntry			(CH4_MCPlateArmor,"El bandido Wolf del Campamento Nuevo se ha ofrecido a crear una armadura a partir de las placas de los reptadores de la mina. Me ha enseñado a retirar placas de armadura de las criaturas muertas."); 
	
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Conocimientos sobre la extracción de placas: reptador de la mina (guerrero).");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info PROFIT
//---------------------------------------------------------------------
INSTANCE Info_Wolf_PROFIT (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_PROFIT_Condition;
	information	= Info_Wolf_PROFIT_Info;
	important	= 0;	
	permanent	= 0;
	description = "¿Y me lo dices sin querer nada a cambio?";
};                       

FUNC INT Info_Wolf_PROFIT_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Wolf_SPEAK)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_PROFIT_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_PROFIT_15_01"); //¿Y me lo dices sin querer nada para ti a cambio?
	AI_Output 			(self,hero,"Info_Wolf_PROFIT_09_02"); //No exactamente... Si consigo hacer una buena armadura con esas placas, haré... muy deprisa... much... ¡oh, olvídalo!
};

//---------------------------------------------------------------------
//	Info MCPLATESFEW
//---------------------------------------------------------------------
INSTANCE Info_Wolf_MCPLATESFEW (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_MCPLATESFEW_Condition;
	information	= Info_Wolf_MCPLATESFEW_Info;
	important	= 0;	
	permanent	= 0;
	description = "¡He reunido algunas placas de armadura de los reptadores de la mina!";
};                       

FUNC INT Info_Wolf_MCPLATESFEW_Condition()
{
	if	(Knows_GetMCPlates)
	&&	(Npc_HasItems(hero, ItAt_Crawler_02) > 0)
	&&	(Npc_HasItems(hero, ItAt_Crawler_02) < 15)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_MCPLATESFEW_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESFEW_15_01"); //¡He conseguido algunas de esas placas de armadura de los reptadores!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_02"); //¡No son suficientes! ¡Con eso no basta para toda una armadura!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_03"); //¡Tráeme más placas de éstas!
};

//---------------------------------------------------------------------
//	Info MCPLATESENOUGH
//---------------------------------------------------------------------
INSTANCE Info_Wolf_MCPLATESENOUGH (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_MCPLATESENOUGH_Condition;
	information	= Info_Wolf_MCPLATESENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "¡He reunido muchas placas de armadura de los reptadores de la mina.";
};                       

FUNC INT Info_Wolf_MCPLATESENOUGH_Condition()
{
	if	(Knows_GetMCPlates)
	&&	(Npc_HasItems(hero, ItAt_Crawler_02) >= 15)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_MCPLATESENOUGH_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01"); //¡He conseguido un montón de placas de armadura de reptador!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02"); //¡Estupendo! ¡Me pongo a ello de inmediato!
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03"); //¿Cuánto tiempo te llevará?
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04"); //No tengo ni la menor idea. ¡Ésta es una creación totalmente nueva, hombre!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05"); //¡Déjate caer por aquí cuando pases cerca!

	MCPlatesDelivered = TRUE;

	B_LogEntry			(CH4_MCPlateArmor,"Le he entregado a Lob 15 placas de reptadores de la mina. Necesita algún tiempo; se supone que debo volver más tarde.");
	B_GiveXP			(XP_DeliveredMCPlates);
	
	B_GiveInvItems	(hero, self, ItAt_Crawler_02,	15);
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info ARMORINWORK
//---------------------------------------------------------------------
INSTANCE Info_Wolf_ARMORINWORK (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_ARMORINWORK_Condition;
	information	= Info_Wolf_ARMORINWORK_Info;
	important	= 0;	
	permanent	= 1;
	description = "¿Hasta dónde has llegado con la armadura?";
};                       

FUNC INT Info_Wolf_ARMORINWORK_Condition()
{
	if	(MCPlatesDelivered			== TRUE)
	&&	(FreemineOrc_LookingUlumulu	!= LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_ARMORINWORK_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_ARMORINWORK_15_01"); //¿Qué tal va lo de la armadura?
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_02"); //¡Va a llevar algún tiempo, hombre! Estas placas son muy duras. ¡Todavía no he encontrado una manera de unirlas!
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_03"); //¡Dame un poco más de tiempo; lo conseguiré!
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info ARMORFINISHED
//---------------------------------------------------------------------
INSTANCE Info_Wolf_ARMORFINISHED (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_ARMORFINISHED_Condition;
	information	= Info_Wolf_ARMORFINISHED_Info;
	important	= 0;	
	permanent	= 0;
	description = "¿Hasta dónde has llegado con la armadura?";
};                       

FUNC INT Info_Wolf_ARMORFINISHED_Condition()
{
	if	(MCPlatesDelivered			== TRUE)
	&&	(FreemineOrc_LookingUlumulu	== LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_ARMORFINISHED_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_01"); //¿Qué tal va lo de la armadura?
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_02"); //¡Por fin he encontrado una manera de unir estas placas de armadura!
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_03"); //¿Quiere eso decir que la has acabado?
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_04"); //Sí, hombre. Aquí la tienes. Parece mucho más dura que cualquier otra armadura en nuestro campamento.
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_05"); //¡Gracias; estoy en deuda contigo!
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_06"); //¡No te preocupes! ¡Siempre encuentro alguna manera de cubrir gastos!

	B_LogEntry			(CH4_MCPlateArmor,"La armadura está terminada. Un trabajo excelente; la mejor protección de combate que haya visto hasta la fecha.");
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_SUCCESS);

	B_GiveXP			(XP_GorMCPlateArmor);

	CreateInvItem		(self, CRW_ARMOR_H);
	B_GiveInvItems      (self,hero,CRW_ARMOR_H,1);
};

/*------------------------------------------------------------------------
						BOGEN KAUFEN						
------------------------------------------------------------------------*/

instance  Org_855_Wolf_SELLBOW (C_INFO)
{
	npc				= Org_855_Wolf;
	condition		= Org_855_Wolf_SELLBOW_Condition;
	information		= Org_855_Wolf_SELLBOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Dónde puedo conseguir un arco aquí?"; 
};

FUNC int  Org_855_Wolf_SELLBOW_Condition()
{
	return TRUE;
};
FUNC void  Org_855_Wolf_SELLBOW_Info()
{
	AI_Output (other, self,"Org_855_Wolf_SELLBOW_Info_15_01"); //¿Dónde puedo conseguir un arco por aquí?
	AI_Output (self, other,"Org_855_Wolf_SELLBOW_Info_09_02"); //Has venido al lugar apropiado para ello. Ofrezco buena mercancía por buen mineral.
	Log_CreateTopic   	(GE_TraderNC,LOG_NOTE);
	B_LogEntry			(GE_TraderNC,"Wolf, el bandido, comercia con ARCOS.");

};  





