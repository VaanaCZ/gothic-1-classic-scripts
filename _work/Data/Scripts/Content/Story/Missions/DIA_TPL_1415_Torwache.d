// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Tpl_1415_Torwache_Exit (C_INFO)
{
	npc			= Tpl_1415_Templer;
	nr			= 999;
	condition	= DIA_Tpl_1415_Torwache_Exit_Condition;
	information	= DIA_Tpl_1415_Torwache_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Tpl_1415_Torwache_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Tpl_1415_Torwache_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Tpl_1415_Torwache_First (C_INFO)
{
	npc				= Tpl_1415_Templer;
	nr				= 2;
	condition		= DIA_Tpl_1415_Torwache_First_Condition;
	information		= DIA_Tpl_1415_Torwache_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Tpl_1415_Torwache_First_Condition()
{	
	if (Kapitel >= 2)
	{
		return FALSE;
	};

	if (Npc_GetDistToWP(other,"PSI_START") > 800)
	{
		Npc_SetRefuseTalk(self,30);
	};
	
	if (Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Tpl_1415_Torwache_First_Info()
{
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_13_00"); //¡Saludos, forastero!
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_13_01"); //Caminas sobre suelo sagrado. Ésta es la hermandad del Durmiente.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_13_02"); //¿Qué es lo que te trae por aquí?
	
	Info_ClearChoices	(DIA_Tpl_1415_Torwache_First);
	Info_AddChoice		(DIA_Tpl_1415_Torwache_First,"Soy nuevo aquí. Quería echar un vistazo a vuestro campamento.",DIA_Tpl_1415_Torwache_First_JustLooking);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_Tpl_1415_Torwache_First,"Quiero unirme a vosotros.",DIA_Tpl_1415_Torwache_First_Join);
	};
};

func void DIA_Tpl_1415_Torwache_First_Join()
{
	AI_Output (other, self,"DIA_Tpl_1415_Torwache_First_Join_15_00"); //He oído que buscáis gente nueva. Quiero unirme a vosotros.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_Join_13_01"); //Entonces sé bienvenido. En la Hermandad hay sitio para cualquiera que quiera ser guiado por el espíritu del Durmiente.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_Join_13_02"); //Si vas realmente en serio, deberías intentar atraer la atención de Baal Namib. Está en el patio que hay justo detrás del portal.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_Join_13_04"); //Pero no puedes dirigirte a él. Espera a que él se dirija a ti.
	Info_ClearChoices	(DIA_Tpl_1415_Torwache_First);
};

func void DIA_Tpl_1415_Torwache_First_JustLooking()
{
	AI_Output (other, self,"DIA_Tpl_1415_Torwache_First_JustLooking_15_00"); //Soy nuevo aquí. Quería echarle un vistazo a vuestro campamento.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_01"); //Aquí los forasteros no son bienvenidos.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_02"); //Pero es importante seguir nuestras reglas. Los forasteros no pueden entrar en ciertas partes.
	Info_ClearChoices	(DIA_Tpl_1415_Torwache_First);
};

// **************************************************
// 				Wie sieht's im Lager aus?
// **************************************************

INSTANCE DIA_Tpl_1415_Torwache_Sit (C_INFO)
{
	npc				= Tpl_1415_Templer;
	nr				= 2;
	condition		= DIA_Tpl_1415_Torwache_Sit_Condition;
	information		= DIA_Tpl_1415_Torwache_Sit_Info;
	permanent		= 1;
	description		= "¿Cómo van las cosas en el Campamento?";
};

FUNC INT DIA_Tpl_1415_Torwache_Sit_Condition()
{	
	return 1;
};

FUNC VOID DIA_Tpl_1415_Torwache_Sit_Info()
{
	AI_Output (other, self,"DIA_Tpl_1415_Torwache_Sit_15_00"); //¿Cómo van las cosas en el Campamento?
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_Sit_13_01"); //Todo está tranquilo. Pasa.
};
/*------------------------------------------------------------------------
//						TEMPLERAUFNAHME							//
------------------------------------------------------------------------*/
instance Tpl_1415_Torwache_TEMPLERAUFNAHME	 (C_INFO)
{
	npc				= Tpl_1415_Templer;
	condition		= Tpl_1415_Torwache_TEMPLERAUFNAHME_Condition;
	information		= Tpl_1415_Torwache_TEMPLERAUFNAHME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Tpl_1415_Torwache_TEMPLERAUFNAHME_Condition()
{	
	if (( Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) 
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS))
	&& ( Npc_GetTrueGuild  (hero) == GIL_NOV)
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  Tpl_1415_Torwache_TEMPLERAUFNAHME_Info()
{
	AI_GotoNpc (hero,self); 
	AI_Output (self, other,"Tpl_1415_Torwache_IMPORTANT_Info_13_01"); //Oye, me he enterado de lo que ha pasado en la mina. ¡Mereces ser aceptado por los templarios!
	AI_Output (self, other,"Tpl_1415_Torwache_IMPORTANT_Info_13_02"); //¡Vete a hablar con Cor Angar!

	Log_CreateTopic (GE_BecomeTemplar,LOG_NOTE);
	B_LogEntry (GE_BecomeTemplar,"Debo hablar con Cor Angar. Quizá él me deje unirme a los templarios.");
};


/*------------------------------------------------------------------------
						Novizenröckchen							
------------------------------------------------------------------------*/

instance  Tpl_1415_Templer_ROCK (C_INFO)
{
	npc				= Tpl_1415_Templer;
	condition		= Tpl_1415_Templer_ROCK_Condition;
	information		= Tpl_1415_Templer_ROCK_Info;
	important		= 0;
	permanent		= 1;
	description		= "Necesito una armadura."; 
};

FUNC int  Tpl_1415_Templer_ROCK_Condition()
{	
	if (Kapitel < 2)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1415_Templer_ROCK_Info()
{
	AI_Output (other, self,"Tpl_1415_Templer_ROCK_Info_15_01"); //Necesito una armadura.
	AI_Output (self, other,"Tpl_1415_Templer_ROCK_Info_13_02"); //Una armadura de templario como la que llevo yo tienes que ganártela. Pero puedes llevar un taparrabos de novicio.
	AI_Output (other, self,"Tpl_1415_Templer_ROCK_Info_15_03"); //Es mejor que nada...
	AI_Output (self, other,"Tpl_1415_Templer_ROCK_Info_13_04"); //¡Pero no te saldrá gratis!

	Info_ClearChoices (Tpl_1415_Templer_ROCK);
	Info_Addchoice (Tpl_1415_Templer_ROCK,DIALOG_BACK,Tpl_1415_Templer_ROCK_BACK);
	Info_Addchoice (Tpl_1415_Templer_ROCK,B_BuildBuyArmorString(NAME_TorwachenPsiRock,VALUE_NOV_ARMOR_L),Tpl_1415_Templer_ROCK_BUY);
};

func void Tpl_1415_Templer_ROCK_BACK()
{
	Info_ClearChoices (Tpl_1415_Templer_ROCK);
};

func void Tpl_1415_Templer_ROCK_BUY()
{
	AI_Output (other, self,"Tpl_1415_Templer_ROCK_BUY_15_01"); //Vale, dame el taparrabos.
	if (Npc_HasItems (hero,ItMiNugget) <  VALUE_NOV_ARMOR_L)
	{
		AI_Output (self, other,"Tpl_1415_Templer_ROCK_BUY_13_02"); //¡Vuelve cuando tengas mineral suficiente!
	}
	else
	{
		AI_Output (self, other,"Tpl_1415_Templer_ROCK_BUY_13_03"); //¡Este trozo de tela puede salvarte la vida!
		B_GiveInvItems (hero, self, ItMinugget, VALUE_NOV_ARMOR_L);
		CreateInvItem (self, NOV_ARMOR_L);
		B_GiveInvItems (self, hero, NOV_ARMOR_L, 1);
		Tpl_1415_Templer_ROCK.permanent = 0;
	};

};










