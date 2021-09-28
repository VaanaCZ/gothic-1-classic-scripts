// **************************************************
//						 EXIT 
// **************************************************

instance  Stt_311_Fisk_Exit (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 999;
	condition	= Stt_311_Fisk_Exit_Condition;
	information	= Stt_311_Fisk_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Stt_311_Fisk_Exit_Condition()
{
	return 1;
};

FUNC VOID  Stt_311_Fisk_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					First
// **************************************************

instance  Stt_311_Fisk_First (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 1;
	condition	= Stt_311_Fisk_First_Condition;
	information	= Stt_311_Fisk_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Stt_311_Fisk_First_Condition()
{
		return 1;
};

FUNC VOID  Stt_311_Fisk_First_Info()
{
	AI_Output		(self, other,"Stt_311_Fisk_First_12_00"); //¡Eh, hombre! Soy Fisk. Vendo todo tipo de cosas. Si necesitaras algo, éste es el lugar apropiado.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Fisk, la Sombra, comercia con todo tipo de artículos, especialmente ARMAS. Suele estar en el mercado."); 
	
};

// **************************************************
//					Handeln
// **************************************************

instance  Stt_311_Fisk_Trade (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 800;
	condition	= Stt_311_Fisk_Trade_Condition;
	information	= Stt_311_Fisk_Trade_Info;
	permanent	= 1;
	description = "Muéstrame tus mercancías.";
	trade		= 1;
};                       

FUNC int  Stt_311_Fisk_Trade_Condition()
{
	return 1;
};

FUNC VOID  Stt_311_Fisk_Trade_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_Trade_15_00"); //Déjame ver tus mercancías.
};



instance  Stt_311_Fisk_WhistlersSword (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 801;
	condition	= Stt_311_Fisk_WhistlersSword_Condition;
	information	= Stt_311_Fisk_WhistlersSword_Info;
	permanent	= 1;
	description = "Me gustaría comprar una espada. Querría algo más ornamental... ";
};                       

FUNC int  Stt_311_Fisk_WhistlersSword_Condition()
{
	if ( (Fisk_ForgetSword==FALSE) && (Whistler_BuyMySword == LOG_RUNNING) && (Fisk_SwordSold == FALSE)  )
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_WhistlersSword_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_15_00"); //Me gustaría comprar una espada. Pero no una cualquiera. Quiero algo más ornamental.
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_12_01"); //Tengo una que va a gustarte. El miembro de las Sombras que quería recogerla no va a volver a por ella.
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_12_02"); //Cuesta 110 pepitas. ¿Te interesa?
	Fisk_SCknows110 = TRUE;

	Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
	Info_AddChoice		(Stt_311_Fisk_WhistlersSword,"Tal vez luego.",Stt_311_Fisk_WhistlersSword_BACK);
	Info_AddChoice		(Stt_311_Fisk_WhistlersSword,"Querías vendérsela a Whistler por cien...",Stt_311_Fisk_WhistlersSword_Fault);
	Info_AddChoice		(Stt_311_Fisk_WhistlersSword,"Sí, me la quedo.",Stt_311_Fisk_WhistlersSword_TakeIt);
};

func void Stt_311_Fisk_WhistlersSword_BACK()
{
	AI_Output (other, self,"Org_826_Mordrag_WhistlersSword_BACK_15_00"); //Tal vez más tarde.
	Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
};

func void Stt_311_Fisk_WhistlersSword_Fault()
{
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_Fault_15_00"); //A Whistler se la vendías por cien pepitas.
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_Fault_12_01"); //¡Ah! Un momento... Ah, sí. ¡Casi te cobro de menos! Por supuesto, quise decir 500.
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_Fault_15_02"); //¿Quinientas?
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_Fault_12_03"); //¿Demasiado poco? ¿Prefieres 1000? Por mí, estupendo. Bueno, ahora que lo pienso... ¡prefiero quedármela!
	
	Fisk_ForgetSword = TRUE;
	Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
};

func void Stt_311_Fisk_WhistlersSword_TakeIt()
{
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00"); //Sí, me la llevo.
	
	if (Npc_HasItems(other,itminugget) >= 110)
	{
		AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01"); //¡Es una buena compra!
		B_GiveInvItems(other, self,itminugget,110);
		CreateInvItem (self,Whistlers_Schwert);
		B_GiveInvItems(self, other,Whistlers_Schwert,1);
		Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
		
		Fisk_SwordSold = TRUE;
	}
	else
	{
		AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_02"); //Me temo que no tienes mineral suficiente. Te guardaré la espada un tiempo, ¡pero no tardes demasiado!
	};
};

// **************************************************
//					Forget Sword
// **************************************************

instance  Stt_311_Fisk_ForgetSword (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 800;
	condition	= Stt_311_Fisk_ForgetSword_Condition;
	information	= Stt_311_Fisk_ForgetSword_Info;
	permanent	= 1;
	description = "Acerca de la espada de Whistler...";
};                       

FUNC int  Stt_311_Fisk_ForgetSword_Condition()
{
	if (Fisk_ForgetSword==TRUE)
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_ForgetSword_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_ForgetSword_15_00"); //Sigamos hablando de la espada de Whistler.
	AI_Output (self, other,"Stt_311_Fisk_ForgetSword_12_01"); //Puedes irte a decirle que nunca tendrá su espada.
};

// **************************************************
//					MordragKO
// **************************************************
	var int Fisk_GetNewHehler;
// **************************************************

instance  Stt_311_Fisk_MordragKO (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 800;
	condition	= Stt_311_Fisk_MordragKO_Condition;
	information	= Stt_311_Fisk_MordragKO_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Stt_311_Fisk_MordragKO_Condition()
{
	if (MordragKO_HauAb == TRUE)  
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_MordragKO_Info()
{
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_12_00"); //¡Eh, tú!
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_12_01"); //¡Mordrag era uno de mis proveedores más importantes, idiota!
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_12_02"); //¡Si quieres unirte a este campamento, lo tendrás difícil para que YO te vote!

	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	Info_AddChoice   (Stt_311_Fisk_MordragKO,"¡Vendes las pertenencias de los Magnates! A Thorus le interesará saberlo...",Stt_311_Fisk_MordragKO_Petze);
	Info_AddChoice   (Stt_311_Fisk_MordragKO,"¡Tranquilo! Tal vez pueda ofrecer alguna compensación, ¿no?",Stt_311_Fisk_MordragKO_Relax);
	Info_AddChoice	 (Stt_311_Fisk_MordragKO,"¡Entonces vete a la mierda!",Stt_311_Fisk_MordragKO_FuckOff);
};

func void Stt_311_Fisk_MordragKO_Relax()
{
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_Relax_15_00"); //¡Calma! Tal vez pueda compensarte por ello, ¿no?
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_Relax_12_01"); //No sé cómo ibas a hacerlo. ¡A no ser que me consiguieras a otro perista en el Campamento Nuevo!
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_Relax_15_02"); //¿Cómo puedo encontrar yo a alguien así?
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_Relax_12_03"); //Ya te he dicho que no creo que vayas a estar nunca en paz conmigo.
	
	Log_CreateTopic(CH1_FiskNewDealer, LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer, LOG_RUNNING);
	B_LogEntry( CH1_FiskNewDealer,"Después de haber vapuleado a Mordrag, el comerciante Fisk del mercado del Campamento Viejo quiere que le encuentre un nuevo perista.");
	
	Fisk_GetNewHehler = LOG_RUNNING;
};

func void Stt_311_Fisk_MordragKO_FuckOff()
{
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_FuckOff_15_00"); //¡Entonces bésame el culo!
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	
	AI_StopProcessInfos	(self);
};

func void Stt_311_Fisk_MordragKO_Petze()
{
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_Petze_15_00"); //Estás vendiendo cosas que pertenecen a los Magnates del Mineral. A Thorus le parecerá interesante.
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_Petze_12_01"); //¡Ni lo intentes, amigo!
};

// **************************************************
//					New Hehler
// **************************************************

instance  Stt_311_Fisk_HehlerSuccess (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 10;
	condition	= Stt_311_Fisk_HehlerSuccess_Condition;
	information	= Stt_311_Fisk_HehlerSuccess_Info;
	permanent	= 0;
	description	= "Tengo a alguien del Campamento Nuevo que quiere meterse en el negocio...";
};                       

FUNC int  Stt_311_Fisk_HehlerSuccess_Condition()
{
	if ( (Fisk_GetNewHehler==LOG_RUNNING) && (Npc_KnowsInfo(hero,Org_843_Sharky_Fisk)))  
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_HehlerSuccess_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_HehlerSuccess_15_00"); //He encontrado a alguien del Campamento Nuevo que quiere hacer negocios contigo.
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_01"); //¡No! Vaya, ¿quién iba a pensarlo? Parece que estás intentando hacerte popular por estos pagos.
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_02"); //¡Y parece que lo has conseguido! ¿Quién es?
	AI_Output (other, self,"Stt_311_Fisk_HehlerSuccess_15_03"); //Se llama Sharky.
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_04"); //¿Sharky? Es incluso peor que Mordrag.
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_05"); //En cuanto a Diego... Ya no necesitas preocuparte de eso.
	
	Fisk_GetNewHehler = LOG_SUCCESS;
	B_GiveXP(XP_fiskdealer);

	Log_SetTopicStatus(CH1_FiskNewDealer, LOG_SUCCESS);
	B_LogEntry( CH1_FiskNewDealer,"Fisk está contento, pues Sharky se hará cargo del negocio de Mordrag.");
};
/*------------------------------------------------------------------------
							RÜSTUNG									
------------------------------------------------------------------------*/

instance  Stt_311_Fisk_ARMOR (C_INFO)
{
	npc				= Stt_311_Fisk;
	condition		= Stt_311_Fisk_ARMOR_Condition;
	information		= Stt_311_Fisk_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "¿También tienes una armadura para mí?"; 
};

FUNC int  Stt_311_Fisk_ARMOR_Condition()
{	
	if (Kapitel < 2)
	&& (Npc_KnowsInfo (hero, Stt_311_Fisk_First))
	{
		return TRUE;
	};

};
FUNC void  Stt_311_Fisk_ARMOR_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_ARMOR_Info_15_01"); //¿Me has conseguido una armadura?
	AI_Output (self, other,"Stt_311_Fisk_ARMOR_Info_12_02"); //Bueno, estoy seguro de poder complacerte.
	Info_ClearChoices (Stt_311_Fisk_ARMOR);
	Info_Addchoice (Stt_311_Fisk_ARMOR,DIALOG_BACK,Stt_311_Fisk_ARMOR_BACK);
	Info_Addchoice (Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskLightDiggers,VALUE_VLK_ARMOR_L),Stt_311_Fisk_ARMOR_L);
	Info_Addchoice (Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskDiggers,VALUE_VLK_ARMOR_M),Stt_311_Fisk_ARMOR_M);

};  

func void Stt_311_Fisk_ARMOR_BACK()
{
	Info_ClearChoices (Stt_311_Fisk_ARMOR);
};

func void Stt_311_Fisk_ARMOR_L()
{
	AI_Output (other, self,"Stt_311_Fisk_ARMOR_L_Info_15_01"); //Dame los pantalones ligeros de cavador.
	
	if (Npc_HasItems (hero,ItMiNugget) <  VALUE_VLK_ARMOR_L)
	{
		AI_Output (self, other,"Stt_311_Fisk_ARMOR_L_Info_12_02"); //¡Vuelve a verme cuando tengas el mineral suficiente!
	}
	else
	{
		AI_Output		(self,	other,	"Stt_311_Fisk_ARMOR_L_Info_12_03"); //¡Sabia elección!
		B_GiveInvItems	(hero,	self,	ItMinugget, VALUE_VLK_ARMOR_L);
		CreateInvItem	(self,			VLK_ARMOR_L);
		B_GiveInvItems	(self,	hero,	VLK_ARMOR_L, 1);
	};
};

func void Stt_311_Fisk_ARMOR_M()
{
	AI_Output (other, self,"Stt_311_Fisk_ARMOR_M_Info_15_01"); //Dame los pantalones de cavador.
	if (Npc_HasItems (hero,ItMiNugget) <  VALUE_VLK_ARMOR_M)
	{
		AI_Output (self, other,"Stt_311_Fisk_ARMOR_M_Info_12_02"); //¡Vuelve a verme cuando tengas el mineral suficiente!
	}
	else
	{
		AI_Output		(self, other,"Stt_311_Fisk_ARMOR_M_Info_12_03"); //¡Sabia elección!
		B_GiveInvItems	(hero, self, ItMinugget, VALUE_VLK_ARMOR_M);
		CreateInvItem	(self, VLK_ARMOR_M);
		B_GiveInvItems	(self,hero, VLK_ARMOR_M, 1);
	};
};







