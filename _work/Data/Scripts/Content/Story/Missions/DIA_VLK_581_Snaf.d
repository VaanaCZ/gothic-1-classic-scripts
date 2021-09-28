// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Snaf_Exit (C_INFO)
{
	npc			= Vlk_581_Snaf;
	nr			= 999;
	condition	= DIA_Snaf_Exit_Condition;
	information	= DIA_Snaf_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Snaf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Snaf_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Snaf_Hello (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Hello_Condition;
	information		= DIA_Snaf_Hello_Info;
	permanent		= 0;
	description		= "¿Qué tal?";
};

FUNC INT DIA_Snaf_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Snaf_Hello_Info()
{
	AI_Output (other, self,"DIA_Snaf_Hello_15_00"); //¿Cómo van las cosas?
	AI_Output (self, other,"DIA_Snaf_Hello_01_01"); //No van mal. Si sabes cocinar bien, tendrás muchos amigos por aquí.
	AI_Output (self, other,"DIA_Snaf_Hello_01_02");	//¿Quieres probar mi guiso de arroz?
	AI_Output (other, self,"DIA_Snaf_Hello_15_03"); //Gracias.
	AI_Output (self, other,"DIA_Snaf_Hello_01_04");	//Podrías hacerme un favor.
	
	CreateInvItem (self,ItFoRice);
	B_GiveInvItems(self,other,ItFoRice,1);
};

// **************************************************
// 				Bring Zutaten
// **************************************************
	var int Snaf_Zutaten; 
	var int Snaf_FreeMBRagout;
// **************************************************

INSTANCE DIA_Snaf_Zutaten (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Zutaten_Condition;
	information		= DIA_Snaf_Zutaten_Info;
	permanent		= 0;
	description		="¿Qué puedo hacer por ti?";
};

FUNC INT DIA_Snaf_Zutaten_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Zutaten_Info()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_15_00"); //¿Qué puedo hacer por ti?
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_01"); //Debes estar acostumbrado a la buena cocina. Tengo una nueva receta; estofado de sabandija de carne a la Snaf con setas y arroz.
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_02"); //Puedes tomar todo lo que quieras, pero todavía me hacen falta 3 sabandijas y algunas setas del infierno; con 5 debería bastar.
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice	 (DIA_Snaf_Zutaten,"¿Quieres que vomite?",DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice	 (DIA_Snaf_Zutaten,"Tiene buena pinta.",DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_KOTZ_15_00"); //¿Quieres hacerme vomitar?
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_01"); //¡No tienes que comértelo, pero podrías intentarlo! Si por casualidad consiguieras esas cosas, acuérdate de mí.
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_02"); //Ya he enviado a alguien, pero todavía no ha vuelto; debe haber desertado al Campamento Nuevo.
	Snaf_Zutaten = LOG_RUNNING;
	
	Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe,"Snaf, el cocinero que vive en el Anillo Exterior del Campamento Viejo, me ha enviado a conseguirle 3 sabandijas de carne y 5 setas del infierno para una nueva receta.");
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_DoIt_15_00"); //Suena bien.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_01"); //Entonces ve y asegúrate de conseguirme esas cosas.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_02"); //El último al que envié todavía no ha vuelto; debe haber desertado al Campamento Nuevo.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
		
    Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe,"Snaf, el cocinero que vive en el Anillo Exterior del Campamento Viejo, me ha enviado a conseguirle 3 sabandijas de carne y 5 setas del infierno para una nueva receta. Puedo quedarme con parte cuando esté terminada.");		
			
	Info_ClearChoices(DIA_Snaf_Zutaten);	
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Snaf_ZutatenSuccess (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_ZutatenSuccess_Condition;
	information		= DIA_Snaf_ZutatenSuccess_Info;
	permanent		= 0;
	description		= "¡Tengo las cosas que querías!";
};

FUNC INT DIA_Snaf_ZutatenSuccess_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Mushroom_01)>=5) && (Npc_HasItems(other,ItAt_Meatbug_01)>=3) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_ZutatenSuccess_Info()
{
	AI_Output (other, self,"DIA_Snaf_ZutatenSuccess_15_00"); //¡Tengo las cosas que querías que te consiguiera!
	AI_Output (self, other,"DIA_Snaf_ZutatenSuccess_01_01"); //Excelente. No tengo más que añadirlas y el guiso estará listo... Espera...
	
	CreateInvItems(other, ItFo_Plants_Mushroom_01, 3);
	B_GiveInvItems(other,self,ItFo_Plants_Mushroom_01,8);//Notwendig zur Anzeige 8 Items übergeben, wird sofort angepasst
	
	Npc_RemoveInvItems(self, ItFo_Plants_Mushroom_01, 8);//Alle Zutaten weg
	Npc_RemoveInvItems(other, ItAt_MeatBug_01, 3);
	
	CreateInvItems(self, ItFoMeatbugragout,3);
	B_GiveInvItems(self, other,ItFoMeatbugragout,3);
	
	Snaf_Zutaten = LOG_SUCCESS;
	
	Log_SetTopicStatus	(CH1_SnafsRecipe, LOG_SUCCESS);
	B_LogEntry			(CH1_SnafsRecipe,"Snaf se ha mostrado muy satisfecho cuando le he entregado los ingredientes.");
	
	if Snaf_FreeMBRagout==TRUE
	{
	    B_LogEntry( CH1_SnafsRecipe,"De ahora en adelante, me dará a diario estofado de sabandija de carne.");
	};
	
	B_GiveXP(100);
	
	AI_StopProcessInfos	(self);
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************
	var int Snaf_RagoutDay;
// **************************************************

INSTANCE DIA_Snaf_AfterSuccess (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_AfterSuccess_Condition;
	information		= DIA_Snaf_AfterSuccess_Info;
	permanent		= 1;
	description		= "Me dijiste que podía comer todo el estofado que quisiese...";
};

FUNC INT DIA_Snaf_AfterSuccess_Condition()
{	
	if ( (Snaf_Zutaten==LOG_SUCCESS) && (Snaf_FreeMBRagout==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_AfterSuccess_Info()
{
 	AI_Output (other, self,"DIA_Snaf_AfterSuccess_15_00"); //Me dijiste que podría tomar todo el que quisiera...
 	
 	if (Snaf_RagoutDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_01"); //Y es verdad. Aquí tienes 3 raciones.
		CreateInvItems(self, ItFoMeatbugragout,3);
		B_GiveInvItems(self, other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_02"); //¡Claro! Pero hoy no queda nada. ¡Vuelve mañana!
	};
};

// **************************************************
// 					Wo Fleischwanzen
// **************************************************

INSTANCE DIA_Snaf_WhereMeatbugs (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 3;
	condition		= DIA_Snaf_WhereMeatbugs_Condition;
	information		= DIA_Snaf_WhereMeatbugs_Info;
	permanent		= 0;
	description		= "¿Dónde puedo encontrar sabandijas de carne?";
};

FUNC INT DIA_Snaf_WhereMeatbugs_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereMeatbugs_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereMeatbugs_15_00"); //¿Dónde puedo encontrar sabandijas de carne?
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_01"); //En cualquier parte en la que haya basura. Deberías encontrar alguna en las cabañas deshabitadas que hay cerca de la muralla de la ciudad.
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_02"); //Que no te confunda su aspecto repelente. Una vez guisadas son muy sabrosas.
	
    B_LogEntry( CH1_SnafsRecipe,"Hay sabandijas de carne cerca de las cabañas abandonadas que hay junto a la muralla del castillo.");			
};

// **************************************************
// 					Where Mushrooms
// **************************************************

INSTANCE DIA_Snaf_WhereMushrooms (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 4;
	condition		= DIA_Snaf_WhereMushrooms_Condition;
	information		= DIA_Snaf_WhereMushrooms_Info;
	permanent		= 0;
	description		= "¿Dónde puedo encontrar setas del infierno?";
};

FUNC INT DIA_Snaf_WhereMushrooms_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereMushrooms_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereMushrooms_15_00"); //¿Dónde puedo encontrar setas del infierno?
	AI_Output (self, other,"DIA_Snaf_WhereMushrooms_01_01"); //Si sales por la puerta sur, es decir, la torre en ruinas, verás una pradera justo delante de ti. Allí crecen setas.
	
	B_LogEntry( CH1_SnafsRecipe,"Pueden encontrarse setas del infierno en la llanura que hay frente a la torre derrumbada de la puerta del sur.");			
};

// **************************************************
// 					Where Nek
// **************************************************

INSTANCE DIA_Snaf_WhereNek (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 5;
	condition		= DIA_Snaf_WhereNek_Condition;
	information		= DIA_Snaf_WhereNek_Info;
	permanent		= 0;
	description		= "¿Quién era el tipo que me mandaste?";
};

FUNC INT DIA_Snaf_WhereNek_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereNek_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereNek_15_00"); //¿A quién enviaste antes de mí?
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_01"); //Se llamaba Nek. No estaba nada contento aquí; creo que ahora se encuentra en el Campamento Nuevo.
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_02"); //Le envié a recoger setas, pero no volvió.
	
	if	(Sly_LostNek != LOG_SUCCESS)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	};
	B_LogEntry			(CH1_LostNek,"Snaf, el cocinero, vio a Nek por última vez cuando fue a recoger setas.");
};







	
	 




