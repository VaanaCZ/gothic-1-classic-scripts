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
	description		= "Come va?";
};

FUNC INT DIA_Snaf_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Snaf_Hello_Info()
{
	AI_Output (other, self,"DIA_Snaf_Hello_15_00"); //Come va?
	AI_Output (self, other,"DIA_Snaf_Hello_01_01"); //Non male. Se sai cucinare, hai un sacco di amici.
	AI_Output (self, other,"DIA_Snaf_Hello_01_02");	//Vuoi un po' di riso bollito?
	AI_Output (other, self,"DIA_Snaf_Hello_15_03"); //Grazie.
	AI_Output (self, other,"DIA_Snaf_Hello_01_04");	//Puoi farmi un favore?
	
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
	description		="Cosa posso fare per te?";
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
	AI_Output (other, self,"DIA_Snaf_Zutaten_15_00"); //Cosa posso fare per te?
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_01"); //Devi essere una buona forchetta. Ho inventato una nuova ricetta: ragù di scarafaggio 'à la Snaf', con riso e funghi.
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_02"); //Puoi averne quanto ne vuoi, ma ho bisogno di altri 3 scarafaggi e alcuni funghi del demonio: 5 possono bastare.
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice	 (DIA_Snaf_Zutaten,"Vuoi farmi vomitare?",DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice	 (DIA_Snaf_Zutaten,"Suona bene.",DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_KOTZ_15_00"); //Vuoi farmi vomitare?
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_01"); //Non devi per forza mangiarlo, però potresti provarci! Se ti capita di avere in mano ciò che ti ho chiesto, pensa a me.
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_02"); //Ho già mandato qualcuno, ma non è mai tornato: deve essere passato a Campo Nuovo.
	Snaf_Zutaten = LOG_RUNNING;
	
	Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe,"Snaf, il cuoco che vive nell'anello esterno di Campo Vecchio, mi ha inviato a cercare 3 scarafaggi e 5 funghi del demonio per una nuova ricetta.");
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_DoIt_15_00"); //Suona bene.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_01"); //Allora vai a cercarmi le cose che ti ho chiesto.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_02"); //L'ultimo che ho mandato non è mai tornato: deve essere passato a Campo Nuovo.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
		
    Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe,"Snaf, il cuoco che vive nell'anello esterno di Campo Vecchio, mi ha inviato a cercare 3 scarafaggi e 5 funghi del demonio per una nuova ricetta. Quando sarà pronta, potrò averne un po'.");		
			
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
	description		= "Ho le cose che mi hai chiesto!";
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
	AI_Output (other, self,"DIA_Snaf_ZutatenSuccess_15_00"); //Ho le cose che mi hai chiesto!
	AI_Output (self, other,"DIA_Snaf_ZutatenSuccess_01_01"); //Ottimo! Ora devo solo aggiungerle e il bollito sarà pronto... Aspetta...
	
	CreateInvItems(other, ItFo_Plants_Mushroom_01, 3);
	B_GiveInvItems(other,self,ItFo_Plants_Mushroom_01,8);//Notwendig zur Anzeige 8 Items übergeben, wird sofort angepasst
	
	Npc_RemoveInvItems(self, ItFo_Plants_Mushroom_01, 8);//Alle Zutaten weg
	Npc_RemoveInvItems(other, ItAt_MeatBug_01, 3);
	
	CreateInvItems(self, ItFoMeatbugragout,3);
	B_GiveInvItems(self, other,ItFoMeatbugragout,3);
	
	Snaf_Zutaten = LOG_SUCCESS;
	
	Log_SetTopicStatus	(CH1_SnafsRecipe, LOG_SUCCESS);
	B_LogEntry			(CH1_SnafsRecipe,"Snaf sembrava molto contento, quando gli ho consegnato gli ingredienti per la ricetta.");
	
	if Snaf_FreeMBRagout==TRUE
	{
	    B_LogEntry( CH1_SnafsRecipe,"D'ora in poi, potrò avere del ragù di scarafaggio tutti i giorni.");
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
	description		= "Mi avevi detto che avrei potuto averne quanto ne volevo...";
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
 	AI_Output (other, self,"DIA_Snaf_AfterSuccess_15_00"); //Mi hai detto che avrei potuto averne quanto ne volevo...
 	
 	if (Snaf_RagoutDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_01"); //È vero. Ecco, prendine 3 porzioni.
		CreateInvItems(self, ItFoMeatbugragout,3);
		B_GiveInvItems(self, other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_02"); //Certo! Ma oggi non ce n'è più. Torna domani!
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
	description		= "Dove trovo gli scarafaggi?";
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
	AI_Output (other, self,"DIA_Snaf_WhereMeatbugs_15_00"); //Dove trovo gli scarafaggi?
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_01"); //Ovunque ci sia della spazzatura lasciata in giro. Dovrebbero essercene parecchi nelle capanne vuote, vicino alle mura del castello.
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_02"); //Non farti ingannare dall'aspetto. Sono ottimi, una volta cotti.
	
    B_LogEntry( CH1_SnafsRecipe,"Alcuni scarafaggi si trovano vicino alle capanne abbandonate, dalle parti delle mura del castello.");			
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
	description		= "Dove trovo i funghi del demonio?";
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
	AI_Output (other, self,"DIA_Snaf_WhereMushrooms_15_00"); //Dove trovo i funghi del demonio?
	AI_Output (self, other,"DIA_Snaf_WhereMushrooms_01_01"); //Esci dal cancello sud, la torre crollata. Vedrai una pianura di fronte a te. Lì crescono i funghi.
	
	B_LogEntry( CH1_SnafsRecipe,"I funghi del demonio si trovano nella pianura, di fronte alla torre crollata del cancello sud.");			
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
	description		= "Chi era il tizio che hai inviato prima di me?";
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
	AI_Output (other, self,"DIA_Snaf_WhereNek_15_00"); //Chi era il tizio che hai mandato prima di me?
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_01"); //Si chiamava Nek. Non era felice di stare qui, credo sia passato a Campo Nuovo.
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_02"); //L'ho mandato a raccogliere funghi, ma non è più tornato...
	
	if	(Sly_LostNek != LOG_SUCCESS)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	};
	B_LogEntry			(CH1_LostNek,"Snaf il cuoco è stato l'ultimo ad aver visto Nek: l'ha inviato in cerca di funghi.");
};







	
	 




