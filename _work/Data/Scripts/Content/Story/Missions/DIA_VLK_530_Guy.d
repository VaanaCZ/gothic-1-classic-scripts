// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Guy_Exit (C_INFO)
{
	npc			= Vlk_530_Guy;
	nr			= 999;
	condition	= DIA_Guy_Exit_Condition;
	information	= DIA_Guy_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Guy_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Guy_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Guy_Hello (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 2;
	condition		= DIA_Guy_Hello_Condition;
	information		= DIA_Guy_Hello_Info;
	permanent		= 0;
	description 	= "Salve!";
};

FUNC INT DIA_Guy_Hello_Condition()
{	
	if (Kapitel <= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_Hello_Info()
{
	AI_Output (other, self,"DIA_Guy_Hello_15_00"); //Salve!
	AI_Output (self, other,"DIA_Guy_Hello_03_01"); //Mhh? Non ti ho mai visto prima. Sei nuovo, vero?
	AI_Output (other, self,"DIA_Guy_Hello_15_02"); //Sono arrivato da poco...
	AI_Output (self, other,"DIA_Guy_Hello_03_03"); //Hai già deciso a quale campo appartenere?
	AI_Output (other, self,"DIA_Guy_Hello_15_04"); //No. Cosa mi consigli?
	AI_Output (self, other,"DIA_Guy_Hello_03_05"); //Beh, dipende... Ogni campo ha i suoi lati positivi.
	AI_Output (self, other,"DIA_Guy_Hello_03_06"); //Finché non avrai preso una decisione, puoi restare qui. Si è appena liberata una capanna.
};

// **************************************************
// 				Advantages OC
// **************************************************

INSTANCE DIA_Guy_AdOC (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 2;
	condition		= DIA_Guy_AdOC_Condition;
	information		= DIA_Guy_AdOC_Info;
	permanent		= 1;
	description 	= "Quali sono i vantaggi di Campo Vecchio?";
};

FUNC INT DIA_Guy_AdOC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdOC_Info()
{
	AI_Output (other, self,"DIA_Guy_AdOC_15_00"); //Quali sono i vantaggi di Campo Vecchio?
	AI_Output (self, other,"DIA_Guy_AdOC_03_01"); //Se paghi la tassa di protezione alle guardie, puoi condurre un'esistenza tranquilla. Intervengono sempre se uno dei minatori che li sovvenziona viene attaccato.
	AI_Output (self, other,"DIA_Guy_AdOC_03_02"); //Inoltre, solo qui puoi ricevere le merci dal mondo esterno. Negli altri campi è impossibile.

	Info_ClearChoices(DIA_Guy_AdOC);
	Info_AddChoice	 (DIA_Guy_AdOC,"Ora ne so abbastanza di Campo Vecchio.",DIA_Guy_AdOC_BACK);
	Info_AddChoice	 (DIA_Guy_AdOC,"Quali sono le merci preziose, da queste parti?",DIA_Guy_AdOC_Warez);
	Info_AddChoice	 (DIA_Guy_AdOC,"Cosa succede se combattono due persone che pagano la tassa di protezione?",DIA_Guy_AdOC_Protection);
};	

func void DIA_Guy_AdOC_BACK()
{
	AI_Output (other, self,"DIA_Guy_AdOC_BACK_15_00"); //Ora ne so abbastanza di Campo Vecchio.
	AI_Output (self, other,"DIA_Guy_AdOC_BACK_03_01"); //Mi piace questo posto.
	Info_ClearChoices(DIA_Guy_AdOC);
};

func void DIA_Guy_AdOC_Warez()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Warez_15_00"); //Quali sono le merci preziose da queste parti?
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_01"); //Tutto ciò che proviene dal mondo esterno. Pane, formaggio, pancetta... Soprattutto birra e vino di qualità: niente a che vedere con la grappa di riso annacquata di Campo Nuovo!
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_02"); //Le armi sono a buon mercato, mentre le armature costano DAVVERO molto.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_03"); //Le guardie hanno preso le vecchie armature dei secondini, dopo averli uccisi.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_04"); //Le riconosci dalle armature, che vendono solo ad altre guardie. Non riuscirai mai ad averne una, se non diverrai uno di loro.
};

func void DIA_Guy_AdOC_Protection()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Protection_15_00"); //Cosa succede se combattono due persone che pagano la tassa di protezione?
	AI_Output (self, other,"DIA_Guy_AdOC_Protection_03_01"); //Le guardie restano a guardare, finché uno dei due non uccide l'altro. A quel punto, uccidono il vincitore.
};

// **************************************************
// 				Advantages NewCamp
// **************************************************

INSTANCE DIA_Guy_AdNC (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 3;
	condition		= DIA_Guy_AdNC_Condition;
	information		= DIA_Guy_AdNC_Info;
	permanent		= 0;
	description 		= "Quali sono i vantaggi di Campo Nuovo?";
};

FUNC INT DIA_Guy_AdNC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdNC_Info()
{
	AI_Output (other, self,"DIA_Guy_AdNC_15_00"); //Quali sono i vantaggi di Campo Nuovo?
	AI_Output (self, other,"DIA_Guy_AdNC_03_01"); //Se ti piace farti tagliare la gola per un pezzo di pane, quello è il posto che fa per te.
	AI_Output (self, other,"DIA_Guy_AdNC_03_02"); //No, non è così male. Ma è diverso da qui.
	AI_Output (self, other,"DIA_Guy_AdNC_03_03"); //Qui Gomez fa in modo che la vita proceda in maniera abbastanza tranquilla. Campo Nuovo, invece, non ha leggi.
	AI_Output (self, other,"DIA_Guy_AdNC_03_04"); //Gli unici abbastanza potenti da contare qualcosa sono i Maghi dell'Acqua, ma sono troppo impegnati a studiare la Barriera.
};	

// **************************************************
// 				Advantages ST
// **************************************************

INSTANCE DIA_Guy_AdST (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 4;
	condition		= DIA_Guy_AdST_Condition;
	information		= DIA_Guy_AdST_Info;
	permanent		= 0;
	description 		= "Perché dovrei unirmi alla Setta?";
};

FUNC INT DIA_Guy_AdST_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdST_Info()
{
	AI_Output (other, self,"DIA_Guy_AdST_15_00"); //Perché dovrei unirmi alla Setta?
	AI_Output (self, other,"DIA_Guy_AdST_03_01"); //Beh! Farai meglio a chiederlo a uno di loro.
	AI_Output (self, other,"DIA_Guy_AdST_03_02"); //C'è sempre una coppia di novizi, in giro per questo campo. Sono certo che sapranno dirti un sacco di cose.
	AI_Output (self, other,"DIA_Guy_AdST_03_03"); //Io non ci sono mai stato ma, stando a ciò che si dice in giro, devono essere persone molto generose.
	AI_Output (self, other,"DIA_Guy_AdST_03_04"); //Inoltre, la Setta sembra essere il campo più desideroso di accogliere gente nuova.
};

// **************************************************
// 				Welche Hütte ist meine
// **************************************************

INSTANCE DIA_Guy_MyOwnHut (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 10;
	condition		= DIA_Guy_MyOwnHut_Condition;
	information		= DIA_Guy_MyOwnHut_Info;
	permanent		= 1;
	description 		= "Quale capanna posso occupare?";
};

FUNC INT DIA_Guy_MyOwnHut_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_MyOwnHut_Info()
{
	AI_Output (other, self,"DIA_Guy_MyOwnHut_15_00"); //Quale capanna posso occupare?
	AI_PointAt(self, "OCR_HUT_26");
	AI_Output (self, other,"DIA_Guy_MyOwnHut_03_01"); //Quella col piccolo patio, là in fondo, è vuota.
	AI_StopPointAt(self);
};	
