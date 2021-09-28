//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################

// ************************ EXIT **************************

instance DIA_GUR_1202_CorAngar_Exit (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 999;
	condition	= DIA_GUR_1202_CorAngar_Exit_Condition;
	information	= DIA_GUR_1202_CorAngar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_GUR_1202_CorAngar_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GUR_1202_CorAngar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************	
//		Später Trainer 
// ************************

instance DIA_CorAngar_LaterTrainer (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_LaterTrainer_Condition;
	information	= DIA_CorAngar_LaterTrainer_Info;
	permanent	= 0;
	description = "¿Me adiestrarás?";
};                       

FUNC int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

FUNC VOID DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //¿Me adiestrarás?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Quieres convertirte en un guerrero fuerte, y ahora buscas a alguien que te adiestre.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //Encomiable. Pero no soy el hombre que buscas.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //Yo sólo dedico mi tiempo a aquellos que pertenecen al Círculo Sagrado de los Templarios.
};

// ************************	
//		Wie Templer
// ************************

instance DIA_CorAngar_WieTempler (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_WieTempler_Condition;
	information	= DIA_CorAngar_WieTempler_Info;
	permanent	= 1;
	description = "¿Cómo puedo convertirme en templario?";
};                       

FUNC int DIA_CorAngar_WieTempler_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && (Npc_GetTrueGuild(other) != GIL_TPL) )
	{
		return 1;
	};
};

FUNC VOID DIA_CorAngar_WieTempler_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //¿Cómo puedo convertirme en templario?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //En primer lugar, tendrás que servir como novicio durante un tiempo para demostrar que de verdad crees en el Durmiente.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //Después vuelve a verme, y te adiestraré.
	AI_StopProcessInfos	( self );
};

/////////////////////////////////
/////////////////////////////////
//////// Kapitel 2 //////////////
/////////////////////////////////
/////////////////////////////////

//-------------------------------------------------------------------------
//							STÄRKE UND DEX STEIGERN
//-------------------------------------------------------------------------
INSTANCE GUR_1202_CorAngar_Teach(C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 10;
	condition	= GUR_1202_CorAngar_Teach_Condition;
	information	= GUR_1202_CorAngar_Teach_Info;
	permanent	= 1;
	description = "¿Puedes mejorar mi fuerza y mi destreza?";
};                       

FUNC INT GUR_1202_CorAngar_Teach_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};
};

FUNC VOID GUR_1202_CorAngar_Teach_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //¿Puedes mejorar mi fuerza y mi destreza?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Todo guerrero necesita fuerza y destreza.
	
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_BACK()
{
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
};

func void GUR_1202_CorAngar_Teach_STR_1()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_STR_5()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_1()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_5()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

//--------------------------------------------------------------
// TEMPLER WERDEN
//--------------------------------------------------------------
instance  GUR_1202_CorAngar_WANNABETPL (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WANNABETPL_Condition;
	information		= GUR_1202_CorAngar_WANNABETPL_Info;
	important		= 0;
	permanent		= 1;
	description		= "¡Quiero convertirme en templario!"; 
};

FUNC int  GUR_1202_CorAngar_WANNABETPL_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	&& (Npc_GetTrueGuild (hero) == GIL_NOV)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_WANNABETPL_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //¡Quiero convertirme en templario!
	
	if	(hero.level < 10)
	{ 
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //Aún no estás listo. Puedes unirte a nosotros cuando hayas reunido más experiencia.
	    GUR_1202_CorAngar_WANNABETPL.permanent = 1;
    }
    else if	(hero.level >= 10)
    {
	    AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //Ha llegado la hora de que te unas a nosotros.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Recuerda que un templario no sólo es un buen guerrero y un guardián del campamento. Somos la guardia elegida del Durmiente. Los guardianes del espíritu.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //Usamos tanto la fuerza física como la espiritual. Sólo pueden convertirse en auténticos templarios los que tengan su cuerpo y su espíritu en armonía.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //Me alegro de que consiguieras tantas cosas en tan poco tiempo. Ya estás listo para unirte a nosotros.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Recuerda: un espíritu concentrado y un cuerpo adiestrado pueden resistir cualquier amenaza.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //Ahora ve a ver a Gor Na Toth en el campo de entrenamiento. Él te dará una armadura nueva.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero, GIL_TPL);
		hero.guild = GIL_TPL;

		Log_CreateTopic	(GE_BecomeTemplar,	LOG_NOTE);
		B_LogEntry		(GE_BecomeTemplar,"Hoy, Cor Angar me ha nombrado templario. Gor Na Toth me entregará mi nueva armadura. Suele estar en el campo de entrenamiento.");
		Log_CreateTopic	(GE_TeacherPSI,		LOG_NOTE);
		B_LogEntry		(GE_TeacherPSI,"Cor Angar enseña FUERZA, DESTREZA y combate con armas de DOS MANOS; pero sólo me enseñará este último cuando domine el combate con UNA MANO. Normalmente se le puede encontrar en el campo de entrenamiento del segundo nivel de las pasarelas.");
	};

};

//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND1 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND1_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1,	LPCOST_TALENT_2H_1,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTrueGuild    (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND1_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01"); //Quiero aprender a manejar una espada de dos manos.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02"); //Luchar con armas de dos manos exige cierto nivel de fuerza y destreza.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03"); //Para esgrimir un arma de dos manos, no sólo tendrás que dominar tu cuerpo, sino también tu mente.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04"); //Sólo si dominas mente y cuerpo podrás aprender.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05"); //La clave es la concentración. El cuerpo y la mente se unen en la concentración.

		GUR_1202_CorAngar_ZWEIHAND1.permanent		= 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND2 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND2_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2,	LPCOST_TALENT_2H_2,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND2_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");		//Quiero aprender más cosas de la lucha con armas de dos manos.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02"); //Ya dominas el baile de la espada. Ahora te enseñaré a dominar la pelea.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03"); //Usa tu fuerza espiritual para anticiparte a los movimientos de tu enemigo antes de que ataque.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04"); //Si sabes cómo combate tu enemigo, ya tienes la mitad de la victoria.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05"); //Sé rápido; tus movimientos tendrán que ser sorprendentes y fluidos, y tus golpes fuertes y precisos.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06"); //Aprende a ignorar el dolor. Lo que decidirá el resultado de la lucha es tu fuerza de voluntad.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07"); //Permanece tranquilo. Sólo sobrevivirás a una pelea si luchas tranquilo y concentrado.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08"); //Usa tu talento con prudencia. Y recuerda: si provocas una pelea, morirás en una pelea.

		GUR_1202_CorAngar_ZWEIHAND2.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  

  
  
  
  
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################
 
// **************************************************************************
// 				nach der großen Beschwörung
// **************************************************************************
instance  GUR_1202_CorAngar_SENDS (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_SENDS_Condition;
	information		= GUR_1202_CorAngar_SENDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Ahora qué pasa?"; 
};

FUNC int  GUR_1202_CorAngar_SENDS_Condition()
{	
	if	(Kapitel == 3)
	&&	(CorAngar_GotoOGY == FALSE)
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_SENDS_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //¿Ahora qué pasa?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //La visión era muy imprecisa, y nos trajo más enigmas que respuestas.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //Pero una cosa estaba muy clara: vi un orco en una cueva. Hay un lugar de oración orco, antiguo y abandonado, cerca de aquí.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //Los orcos solían enterrar allí a sus muertos, y por eso llamamos a este conjunto de cuevas 'el cementerio orco'.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //El gurú Baal Lukor ha ido allí con algunos templarios. Tal vez encuentren algo que nos ayude a comprender la visión.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //Necesito que alguien eche un vistazo en aquel lugar y me informe de la situación.
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //¿Por qué no vas tú? ¡Eres el líder de los templarios!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //Mi misión es proteger al Iluminado. Debo quedarme aquí con Y'Berion y protegerlo.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //Has hecho un buen servicio al campamento. Eres en quien más confío.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //Te pido que vayas al cementerio orco y que me informes de lo que han encontrado los templarios.
	
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"¿Qué conseguiré a cambio?",	GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"¡Me pondré en camino ahora mismo!",	GUR_1202_CorAngar_SENDS_KNOW);
};  
func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //¿Qué conseguiré a cambio?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //¿Quieres mineral? Parece que estaba equivocado con respecto a ti. Pero te necesito. Ten, toma 100 pepitas. ¡No te daré más!
	CreateInvItems		(self,ItMiNugget,100);
	B_GiveInvItems      (self, hero, ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //¡Me pondré en camino ahora mismo!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Antes de que te vayas, toma este anillo. ¡Que te proteja en combate!
	
	B_Story_GotoOrcGraveyard();

	CreateInvItem		(self, Schutzring_Geschosse1);
	B_GiveInvItems      (self, hero, Schutzring_Geschosse1, 1);
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
};
	
instance  GUR_1202_CorAngar_WHERE (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WHERE_Condition;
	information		= GUR_1202_CorAngar_WHERE_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Dónde está el cementerio orco?"; 
};

FUNC int  GUR_1202_CorAngar_WHERE_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_SENDS) )
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_WHERE_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WHERE_Info_15_01"); //¿Dónde está el cementerio orco?
	AI_Output			(self, other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //No muy lejos. El novicio Talas conoce el camino. Lo encontrarás en el patio del templo. Te guiará allí.

	B_LogEntry		(CH3_OrcGraveyard,"El novicio Talas va a mostrarme el camino hasta el cementerio orco. Me está esperando en el patio delantero del templo.");
};  

// **************************************************************************
// 				nach dem Ork-Friedhof
// **************************************************************************
instance  GUR_1202_CorAngar_AFTER (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_AFTER_Condition;
	information		= GUR_1202_CorAngar_AFTER_Info;
	important		= 0;
	permanent		= 0;
	description		= "He estado en el cementerio orco."; 
};

FUNC int  GUR_1202_CorAngar_AFTER_Condition()
{
	  
	if   ( BaalLukor_BringParchment == 4 ) 
	{
		return	1;
	};
};

FUNC void  GUR_1202_CorAngar_AFTER_Info()
{
	
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //He estado en el cementerio orco. Allí NO HABÍA NADA. Ni Durmiente, ni señal, ni nada.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //¿Y Baal Lukor y los templarios?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //Han muerto todos.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //¿Muertos? Pero, ¿por qué? ¿Qué ha pasado?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //Todo el sistema de cuevas está lleno de orcos. Han matado a todos los templarios.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Baal Lukor y yo sobrevivimos, pero de repente Baal Lukor se volvió loco.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //Gritó que el Durmiente le había ordenado que me matase, e intentó obedecer esta orden.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //Parece que no soportó no haber encontrado nada.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //No creo que la influencia del Durmiente pueda causar actos tan violentos.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //No puede... No puede... ¡NO VIENE AL CASO!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //Lo más importante es que Baal Lukor no tuvo éxito en su locura.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Y'Berion es nuestra única esperanza.
	 

	B_GiveXP			(XP_ReportToCorAngar);
	B_Story_BackFromOrcGraveyard();
};  
	
// **************************************************************************
// 				MISSION: Find Herb
// **************************************************************************
INSTANCE Info_CorAngar_FindHerb (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Condition;
	information	= Info_CorAngar_FindHerb_Info;
	permanent	= 0;
	important 	= 0;
	description = "¿Cómo le va a Y'Berion?";
};

func INT Info_CorAngar_FindHerb_Condition()
{
	  
	if   ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_AFTER) )
	{
		return	1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Info()
{
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //¿Cómo le va a Y'Berion?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //No despertará por propia voluntad. Y cada vez está más débil. Sé cómo despertarlo, pero necesito tu ayuda.
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //¿Qué quieres que haga?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //Tráeme hierbas medicinales del pantano. ¡Basta con cinco de las más potentes!
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //¡Por favor, date prisa!
	AI_StopProcessInfos	(self);
	CorAngar_FindHerb = LOG_RUNNING;
	
	Log_CreateTopic		(CH3_FindHerbs,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_RUNNING);
	B_LogEntry		(CH3_FindHerbs,"Y'Berion sigue inconsciente. Cor Angar me ha pedido que reúna cinco hierbas medicinales de las más fuertes que hay.");
};

// ---------------------------- FindHerb - WHERE ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_WHERE (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_WHERE_Condition;
	information	= Info_CorAngar_FindHerb_WHERE_Info;
	permanent	= 0;
	important	= 0; 
	description = "¿Dónde puedo encontrar estas plantas?";
};                       

FUNC INT Info_CorAngar_FindHerb_WHERE_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_WHERE_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_WHERE_15_01"); //¿Dónde puedo encontrar estas plantas?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Búscalas en el pantano detrás del campamento. Tendrás que adentrarte bastante, y procura que no te cojan los tiburones de la ciénaga.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_03"); //Y no me hagas perder el tiempo. ¡Vete!
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,"Las hierbas medicinales para Y'Berion crecen en las profundidades del pantano situado tras el campamento de la Hermandad. Sin embargo, allí también están los peligrosos tiburones del pantano. Debo tener los ojos bien abiertos.");
};

// ---------------------------- FindHerb - LOOK ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_LOOK (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_LOOK_Condition;
	information	= Info_CorAngar_FindHerb_LOOK_Info;
	permanent	= 0;
	important	= 0; 
	description = "¿Cómo reconoceré estas hierbas?";
};                       

FUNC INT Info_CorAngar_FindHerb_LOOK_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_LOOK_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_LOOK_15_01"); //¿Cómo reconoceré estas hierbas?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_02"); //Parecen una estrella con ocho hojas verdes y naranjas.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_03"); //Márchate ya.
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,"Las hierbas medicinales parecen una estrella con cuatro hojas verdes y cuatro naranjas.");
};



// ---------------------------- RUNNING ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_Running (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_Running_Condition;
	information	= Info_CorAngar_FindHerb_Running_Info;
	permanent	= 1;
	important	= 0; 
	description = "Aún no he encontrado suficientes hierbas medicinales.";
};                       

FUNC INT Info_CorAngar_FindHerb_Running_Condition()
{
	if	(CorAngar_FindHerb==LOG_RUNNING)
	&&	(Npc_HasItems(other,ItFo_Plants_Herb_03)<5)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_WHERE)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_LOOK)
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Running_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Running_15_01");//Aún no he encontrado suficientes hierbas medicinales.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_02");//Tal vez a Fortuno, el herbolario, le queden algunas.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_03");//Date prisa. Necesito cinco. A Y'Berion no le queda mucho tiempo.
	AI_StopProcessInfos	(self);

	//-------- Fortuno die Kräuter "unterschieben" --------
	if	!Fortuno_HasYBerionHerbs
	{
		var C_NPC	fortuno;
		fortuno = Hlp_GetNpc(Nov_1357_Fortuno);
		CreateInvItems		(fortuno,	ItFo_Plants_Herb_03,	5);	

		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry		(CH3_FindHerbs,"Fortuno, el herbolario de la Hermandad, podría tener tales hierbas medicinales.");
	};
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_CorAngar_FindHerb_Success (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Success_Condition;
	information	= Info_CorAngar_FindHerb_Success_Info;
	permanent	= 0;
	description	= "Tengo las hierbas medicinales para Y'Berion.";
};                       

FUNC INT Info_CorAngar_FindHerb_Success_Condition()
{
	if ( Npc_HasItems ( other, ItFo_Plants_Herb_03 ) >= 5 ) && ( CorAngar_FindHerb == LOG_RUNNING )
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_FindHerb_Success_Info()
{	
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_01"); //Tengo las hierbas medicinales para Y'Berion.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_02"); //Bien hecho. Y'Berion se despertó un rato mientras estabas fuera.
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_03"); //¿Dijo algo?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_04"); //Sí, dijo que el Durmiente no es quien pensamos que es. No debemos intentar despertarlo de nuevo.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_05"); //Todo lo que podemos hacer ahora es esperar que no sea demasiado tarde para Y'Berion.
	Yberion_dead = LOG_RUNNING;

	B_GiveInvItems	(other, self, ItFo_Plants_Herb_03, 5 );
	Npc_RemoveInvItems(self, ItFo_Plants_Herb_03, 5 );
	B_GiveXP  			(XP_FindHerbs);

	CorAngar_FindHerb = LOG_SUCCESS;
	
	B_LogEntry		(CH3_FindHerbs,"Le he entregado a Cor Angar suficientes hierbas medicinales. Ahora sólo cabe esperar que no sea demasiado tarde.");
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_SUCCESS);

	//-------- Versuch YBerion zu heilen... --------
	var C_NPC YBerion; 	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	AI_Wait				(self,	1);
	AI_GotoNpc			(self,	YBerion);
	AI_TurnToNpc		(self,	YBerion);
	AI_PlayAni			(self,	"T_PLUNDER");
	AI_WaitTillEnd		(self,	YBerion);
	//YBerion.attribute[ATR_HITPOINTS] = 0;
	//AI_StartState		(YBerion,	ZS_Dead,	0,	"");

	//-------- ...scheitert. YBerion ist tot --------
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Y'BERION HA MUERTO. ¡Nuestro líder espiritual nos ha dejado!
	AI_TurnToNpc		(self, other);
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //¡Ni siquiera tu rápida ayuda pudo evitar su muerte!
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //¿Y ahora qué, Cor Angar?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //Siempre he confiado en Y'Berion. Poco antes de morir, puso todas sus esperanzas en el plan de fuga de los magos del agua.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Entonces deberíamos apoyar el plan de los magos del agua.
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //Necesitarán el foco y el almanaque. Ambas cosas aún las tiene Cor Kalom.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //¿Dónde está Cor Kalom?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //Se marchó enfurecido con un par de templarios para encontrar el camino hacia el Durmiente.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Maldita sea, ¿y cómo conseguimos el foco?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //Creo que dejó el libro y el foco en su laboratorio. Aquí está la llave del cofre.

	CreateInvItem		(self,			ITKE_PSI_KALOM_01); 
	B_GiveInvItems		(self,	other,	ITKE_PSI_KALOM_01,	1);
};
 
// ------------------------------ TELEPORT ----------------------------------
INSTANCE Info_CorAngar_TELEPORT (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_TELEPORT_Condition;
	information	= Info_CorAngar_TELEPORT_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_CorAngar_TELEPORT_Condition()
{
	if	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success)
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_TELEPORT_Info()
{	
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); //¡Un momento!
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_02"); //¿Sí?
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); //Acepta esta runa de magia como muestra de nuestra gratitud por tus grandes hazañas.
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_04"); //Te permitirá teleportarte deprisa y fácilmente al patio de nuestro templo cuando surja la necesidad.
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); //¡Gracias!

	//-------- Spieler wird losgeschickt --------
	B_Story_SentToNC	();
};
 
