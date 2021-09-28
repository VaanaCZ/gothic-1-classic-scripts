// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Swiney_EXIT(C_INFO)
{
	npc			= SfB_1037_Swiney ;
	nr			= 999;
	condition	= Info_Swiney_EXIT_Condition;
	information	= Info_Swiney_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Swiney_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_Swiney_Hello(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Hello_Condition;
	information	= Info_Swiney_Hello_Info;
	permanent	= 0;
	description = "Chi sei?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //Chi sei?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //Sono il miglior ingegnere minerario che questa maledetta colonia abbia mai conosciuto, ragazzo mio.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //Sto attento che la metà dei lavoratori non rimanga schiacciata dai massi cadenti, solo perché è troppo stupida per scavare nei posti giusti.
};

// ************************************************************
// 						Schürfer
// ************************************************************

INSTANCE Info_Swiney_Schuerfer(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Schuerfer_Condition;
	information	= Info_Swiney_Schuerfer_Info;
	permanent	= 0;
	description = "Voglio diventare un tritarocce!";
};                       

FUNC INT Info_Swiney_Schuerfer_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_Schuerfer_Info()
{	
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //Voglio diventare un tritarocce!
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //Davvero? Non credere di ottenere chissà quale beneficio! Hai diritto a tre porzioni di riso al giorno. Tutto il resto devi guadagnartelo.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //Sai perché facciamo questo? Così un giorno potremo andarcene di qui e tornare a essere liberi.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //Questo significa che tutto il metallo estratto si aggiunge al cumulo. Una volta al mese, ogni lavoratore riceve uno stipendio di 50 pezzi.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //Questa è la cosa più importante che devi sapere.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //Hai almeno un po' d'esperienza?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer,"No.",Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer,"Sì.",Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //Sì.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //Bene! Allora sai a cosa stare attento. Ecco la tua veste protettiva: il piccone devi trovartelo da solo. Divertiti!
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //No.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //Certo che no! Perché tocca sempre a me? Va bene, ascolta attentamente. Prendi questa roba e la metti...qui.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //Se un pezzo di metallo ti cade sul piede mentre non indossi la veste protettiva, rimarrai zoppo per tutta la vita e il tuo valore sarà dimezzato.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //Puoi trovare un piccone, da qualche parte qui intorno.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //Ma non sarai capace di farci molto. Beh, chi se ne frega...
	
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE Info_Swiney_PERM(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_PERM_Condition;
	information	= Info_Swiney_PERM_Info;
	permanent	= 1;
	description = "Quanto metallo avete raccolto, finora?";
};                       

FUNC INT Info_Swiney_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Schuerfer)) 
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_PERM_Info()
{	
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //Quanto metallo avete raccolto, finora?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //I maghi dicono che non ne manca molto. Vai a Campo Nuovo e dai un'occhiata al cumulo.
	AI_StopProcessInfos	(self);
};


