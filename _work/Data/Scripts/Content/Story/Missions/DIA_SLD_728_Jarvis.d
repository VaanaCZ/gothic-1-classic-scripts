// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Jarvis_EXIT (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_EXIT_08_00"); //Attento alle spalle!
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						First
// ************************************************************

INSTANCE DIA_Jarvis_First (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_First_Condition;
	information	= DIA_Jarvis_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Jarvis_First_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_First_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_First_08_00"); //Vuoi attraversare il cancello?
	AI_Output (other, self,"DIA_Jarvis_First_15_01"); //Hai intenzione di fermarmi?
	AI_Output (self, other,"DIA_Jarvis_First_08_02"); //No, ma fari meglio a sapere cosa ti aspetta. Qui non è come a Campo Vecchio e neppure alla Setta!
	AI_Output (other, self,"DIA_Jarvis_First_15_03"); //Cosa devo aspettarmi, allora?
	AI_Output (self, other,"DIA_Jarvis_First_08_04"); //Non ci sono guardie né templari a sorvegliarti. Ognuno sta per conto suo, gli unici che formano un gruppo sono i mercenari.
};

// ************************************************************
// 						Söldner
// ************************************************************

INSTANCE DIA_Jarvis_SldInfo (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_SldInfo_Condition;
	information	= DIA_Jarvis_SldInfo_Info;
	permanent	= 0;
	description	= "Cosa fanno questi mercenari?";
};                       

FUNC INT DIA_Jarvis_SldInfo_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_SldInfo_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_SldInfo_15_00"); //Cosa fanno questi mercenari?
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_01"); //Noi... Noi siamo i mercenari dei Maghi dell'Acqua.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_02"); //Il nostro scopo è andarcene di qui. Lavoriamo sodo e non ci comportiamo come quelli di Campo Vecchio, che fanno la bella vita alle spalle dei minatori.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_03"); //Seguiamo tutti Lee. È un grand'uomo: l'unico che riesca a tenere insieme questo dannato capo.
};

// ************************************************************
// 						Magier
// ************************************************************

INSTANCE DIA_Jarvis_Magier (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Magier_Condition;
	information	= DIA_Jarvis_Magier_Info;
	permanent	= 0;
	description	= "Cosa fanno i maghi?";
};                       

FUNC INT DIA_Jarvis_Magier_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_SldInfo))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Magier_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Magier_15_00"); //Cosa fanno i maghi?
	AI_Output (self, other,"DIA_Jarvis_Magier_08_01"); //Studiano le proprietà magiche del metallo, estratto dai tritarocce nella miniera.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_02"); //Per quanto ne so, vogliono far saltare in aria l'intero cumulo di metallo e liberarci dalla Barriera.
	AI_Output (other, self,"DIA_Jarvis_Magier_15_03"); //Sembra pericoloso.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_04"); //Loro dicono che non dobbiamo preoccuparci.
};

// ************************************************************
// 						Erzhaufen
// ************************************************************

INSTANCE DIA_Jarvis_Erzhaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Erzhaufen_Condition;
	information	= DIA_Jarvis_Erzhaufen_Info;
	permanent	= 0;
	description	= "Avete una grande scorta di metallo?";
};                       

FUNC INT DIA_Jarvis_Erzhaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Erzhaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Erzhaufen_15_00"); //Avete un gran cumulo di metallo?
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_01"); //Puoi dirlo forte! Potremmo comprarci la moglie del Re!
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_02"); //Ma non ce ne frega nulla di scambiare il metallo con quel vecchio babbione. Noi vogliamo ANDARCENE DA QUI!
};

// ************************************************************
// 						Wo Haufen
// ************************************************************

INSTANCE DIA_Jarvis_WoHaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_WoHaufen_Condition;
	information	= DIA_Jarvis_WoHaufen_Info;
	permanent	= 0;
	description	= "Dov'è cumulala scorta di metallo?";
};                       

FUNC INT DIA_Jarvis_WoHaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Erzhaufen))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_WoHaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_00"); //Dov'è il cumulo di metallo?
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_01"); //Vuoi vederlo, vero? In mezzo alla caverna c'è un buco. È lì che gettano tutto il metallo.
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_02"); //Ma ti avverto: non puoi avvicinarti. Il metallo è sorvegliato giorno e notte dai maghi e dai nostri uomini.
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_03"); //Ero solo curioso.
};

// ************************************************************
// 						Rest
// ************************************************************

INSTANCE DIA_Jarvis_Rest (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_Rest_Condition;
	information	= DIA_Jarvis_Rest_Info;
	permanent	= 0;
	description	= "Che mi dici dell'altra gente?";
};                       

FUNC INT DIA_Jarvis_Rest_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Rest_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Rest_15_00"); //Che mi dici dell'altra gente?
	AI_Output (self, other,"DIA_Jarvis_Rest_08_01"); //Tutti imbroglioni. Non gliene frega nulla del campo. Farei prima a far sorvegliare l'ingresso principale ai contadini.
};

// ************************************************************
// 						PERM
// ************************************************************

INSTANCE DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 10;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= 1;
	description	= "Come vanno le cose, al momento?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_PERM_15_00"); //Come vanno le cose, al momento?
	AI_Output (self, other,"DIA_Jarvis_PERM_08_01"); //I tritarocce stanno ancora raccogliendo metallo. Quando ne avremo abbastanza, faremo esplodere il cumulo.
};

/*------------------------------------------------------------------------
//							SÖLDNERAUFNAHME									//
------------------------------------------------------------------------*/
instance Sld_728_Jarvis_AUFNAHMESOLDIER (C_INFO)
{
	npc				= Sld_728_Jarvis;
	condition		= Sld_728_Jarvis_AUFNAHMESOLDIER_Condition;
	information		= Sld_728_Jarvis_AUFNAHMESOLDIER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Sld_728_Jarvis_AUFNAHMESOLDIER_Condition()
{	
	if ( Npc_GetTrueGuild  (hero) == GIL_ORG) 
	&& ( (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS) )
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  Sld_728_Jarvis_AUFNAHMESOLDIER_Info()
{
	AI_GotoNpc (hero,self); 
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Ehi! Ho sentito dire che hai dato del filo da torcere ai pidocchi di miniera!
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Lee dovrebbe essersi d'accordo ad accettarti fra i mercenari. Vai a parlargli.

	self.flags = 0;		// Immortal-Flag löschen

	Log_CreateTopic (GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry (GE_BecomeMercenary,"Devo parlare con Lee. Forse mi permetterà d'unirmi ai mercenari.");
};






	


