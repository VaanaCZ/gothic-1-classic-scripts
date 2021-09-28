// **************************************************
//						 EXIT 
// **************************************************

instance  Org_818_Ratford_Exit (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 999;
	condition	= Org_818_Ratford_Exit_Condition;
	information	= Org_818_Ratford_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_818_Ratford_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					Wrong Way
// **************************************************

instance  Org_818_Ratford_WrongWay (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WrongWay_Condition;
	information	= Org_818_Ratford_WrongWay_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_818_Ratford_WrongWay_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WrongWay_Info()
{
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_00"); //Ehi, tu!
	AI_Output (other, self,"Org_818_Ratford_WrongWay_15_01"); //Cosa vuoi?
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_02"); //Ti avverto: se continui in questo modo, presto entrerai nel nostro territorio di caccia.
};

// **************************************************
//					Was jagt ihr
// **************************************************

instance  Org_818_Ratford_WhatGame (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhatGame_Condition;
	information	= Org_818_Ratford_WhatGame_Info;
	permanent	= 0;
	description = "Cosa cacciate?";
};                       

FUNC int  Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhatGame_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_00"); //Cosa cacciate?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_01"); //Soprattutto saprofagi. Sono molto carnosi e facili da catturare... Quando sai come fare.
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_02"); //Davvero? E come?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_03"); //Chiedi al mio amico Drax: conosce l'argomento più di chiunque altro.
};

// **************************************************
//					Warum gefährlich
// **************************************************

instance  Org_818_Ratford_WhyDangerous (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhyDangerous_Condition;
	information	= Org_818_Ratford_WhyDangerous_Info;
	permanent	= 0;
	description = "Perché questa zona è così pericolosa?";
};                       

FUNC int  Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhyDangerous_15_00"); //Perché questa zona è così pericolosa?
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_01"); //Sei appena arrivato, vero? Nella colonia esistono diverse zone più o meno pericolose.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_02"); //Le strade che collegano i campi sono abbastanza tranquille, ma anche là potresti essere facile preda dei lupi.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_03"); //Perlomeno finché non possiedi un'arma e un'armatura appropriate.
};

// **************************************************
//					Wo Ausrüstung
// **************************************************

instance  Org_818_Ratford_WoEquipment (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoEquipment_Condition;
	information	= Org_818_Ratford_WoEquipment_Info;
	permanent	= 0;
	description = "Dove posso trovare un equipaggiamento migliore?";
};                       

FUNC int  Org_818_Ratford_WoEquipment_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_WoEquipment_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoEquipment_15_00"); //Dove posso trovare un equipaggiamento migliore?
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_01"); //Il posto più vicino è Campo Vecchio. Segui la strada che ti ha portato qui.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_02"); //Ma puoi trovare roba più economica da noi a Campo Nuovo, se conosci la gente giusta.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_03"); //Se vai a Campo Vecchio, chiedi di Mordrag. È uno di noi. Per pochi pezzi di metallo ti venderà della roba buona.
	
	Log_CreateTopic	(GE_TraderOC, LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Dentro Campo Vecchio, Mordrag il ladro vende a buon prezzo ogni sorta di merci.");
};

// **************************************************
//					More Locations
// **************************************************

instance  Org_818_Ratford_MoreLocations (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_MoreLocations_Condition;
	information	= Org_818_Ratford_MoreLocations_Info;
	permanent	= 0;
	description = "Dimmi di più sulle zone della colonia.";
};                       

FUNC int  Org_818_Ratford_MoreLocations_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_MoreLocations_Info()
{
	AI_Output (other, self,"Org_818_Ratford_MoreLocations_15_00"); //Dimmi di più sulle zone della colonia.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_01"); //Se ti sposti da un campo all'altro, hai bisogno di una mappa per distinguere le strade dai vicoli ciechi.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_02"); //Questi spesso conducono a canyon pericolosi, popolati da creature che faresti meglio a evitare.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_03"); //Non entrare nelle antiche rovine. Ce ne sono molte, in giro. La maggior parte è composta da vecchie fortificazioni risalenti alla prima guerra degli orchi. Altre sono dimore abbandonate degli orchi.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_04"); //Spesso queste rovine sono frequentate da orchi o da creature ancora peggiori. Io eviterei di passarci vicino, specialmente la notte.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_05"); //Un ultimo suggerimento: non entrare nella foresta!
};

// **************************************************
//					Wo Karte?
// **************************************************

instance Org_818_Ratford_WoKarte (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoKarte_Condition;
	information	= Org_818_Ratford_WoKarte_Info;
	permanent	= 0;
	description = "Dove trovo una mappa?";
};                       

FUNC int Org_818_Ratford_WoKarte_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC void Org_818_Ratford_WoKarte_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_15_00"); //Dove trovo una mappa?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_01"); //Chiedi alla gente di Campo Vecchio. Lì vive un cartografo.
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_02"); //Forse puoi rubare una delle sue mappe! Se ci riesci, prendine una anche per me!
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice   (Org_818_Ratford_WoKarte,"Se posso prenderle senza pagare, ne porterò il più possibile!",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice	 (Org_818_Ratford_WoKarte,"Perché? Non le vende?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //Se riuscirò a prenderle senza pagare, ne porterò il più possibile!
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //Hai ragione! Dovresti considerare l'idea di venire a Campo Nuovo! In tal caso, chiedi di Lares. È lui che si occupa dei nuovi arrivati e sono sicuro che avrà un lavoro per te!
	
	VAR C_NPC Lares; Lares = Hlp_GetNpc(ORG_801_LARES);
	Lares.aivar[AIV_FINDABLE]=TRUE;
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //Perché? Non le vende? 
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //Se hai abbastanza metallo...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

// **************************************************
//						Danke
// **************************************************

instance  Org_818_Ratford_Thanks (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 888;
	condition	= Org_818_Ratford_Thanks_Condition;
	information	= Org_818_Ratford_Thanks_Info;
	permanent	= 0;
	description = "Grazie per l'aiuto.";
};                       

FUNC int  Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Thanks_Info()
{
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_00"); //Grazie per l'aiuto.
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_01"); //Non pensare che tutti siano amichevoli come me, ragazzo!
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_02"); //Le tasche di un nuovo arrivato non contengono molto, ma alcuni sono pronti a picchiarti anche solo per un piccone.
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_04"); //Lo terrò a mente.
};











