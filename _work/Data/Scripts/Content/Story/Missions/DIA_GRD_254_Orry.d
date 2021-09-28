// **************************************************
// 						 PRE EXIT 
// **************************************************

INSTANCE DIA_Orry_PreExit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_PreExit_Condition;
	information	= DIA_Orry_PreExit_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_PreExit_Condition()
	
	{
		return 1;
	};

FUNC VOID DIA_Orry_PreExit_Info()
{
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //Cerca di arrivare a Campo Vecchio tutto intero!
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Orry_Exit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_Exit_Condition;
	information	= DIA_Orry_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_Exit_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orry_PreExit))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Wache
// **************************************************

INSTANCE DIA_Orry_GuardGate (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_GuardGate_Condition;
	information		= DIA_Orry_GuardGate_Info;
	permanent		= 0;
	description		= "Cosa stai facendo?"; 
};

FUNC INT DIA_Orry_GuardGate_Condition()
{	
	if (Kapitel <= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_GuardGate_Info()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //Cosa fai?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Mi assicuro che nessuno si avvicini al mercato, soprattutto i tagliagole di Campo Nuovo.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //Tu sei il tipo nuovo che è arrivato oggi, vero?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //Sono io.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //Allora farai meglio a stare attento a quelli di Campo Nuovo!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //Io lavoro a Campo Vecchio, come tutti gli altri che hai visto al mercato.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //Hai già parlato con Diego?
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"No.",DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"Sì.",DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //No.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //Allora fallo! È lui che si occupa dei nuovi arrivati.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //Sa molte cose sulla colonia, che possono essere importanti per i novellini come te.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //Sì, l'ho fatto.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //Bene. Allora sai come vanno le cose da queste parti.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

// **************************************************
// 					New Camp
// **************************************************

INSTANCE DIA_Orry_NewCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 1;
	condition		= DIA_Orry_NewCamp_Condition;
	information		= DIA_Orry_NewCamp_Info;
	permanent		= 0;
	description		= "Perché devo guardarmi da quelli di Campo Nuovo?"; 
};

FUNC INT DIA_Orry_NewCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_NewCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //Perché devo guardarmi da quelli di Campo Nuovo?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //Paragonato a Campo Nuovo, Campo Vecchio è un tranquillo luogo di riposo.
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //Campo Nuovo non riceve rifornimenti dal mondo esterno. La maggior parte dei ladri ruba ciò di cui ha bisogno.
};

// **************************************************
// 					Old Camp
// **************************************************

INSTANCE DIA_Orry_OldCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_OldCamp_Condition;
	information		= DIA_Orry_OldCamp_Info;
	permanent		= 0;
	description		= "E a Campo Vecchio?"; 
};

FUNC INT DIA_Orry_OldCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_OldCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_OldCamp_15_00"); //E a Campo Vecchio?
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //I baroni delle miniere tengono tutto sotto controllo. Dopo di loro vengono le guardie, quindi le Ombre. I minatori sono il gradino più basso della scala sociale.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //I nuovi arrivati iniziano come minatori. Se vuoi migliorare la tua posizione, devi prima essere accolto fra le Ombre.
};

// **************************************************
// 					Shore
// **************************************************

INSTANCE DIA_Orry_Shore (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Shore_Condition;
	information		= DIA_Orry_Shore_Info;
	permanent		= 0;
	description		= "Quando sono arrivato, un tizio mi ha dato un pugno in faccia."; 
};

FUNC INT DIA_Orry_Shore_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Shore_Info()
{
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //Quando sono arrivato, un tizio mi ha dato un pugno in faccia.
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //Tutti i nuovi arrivati lo ricevono. Si chiama 'regola del padrino'.
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //Oh. Siete tutti così, a Campo Vecchio?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //Abbiamo i nostri idioti. Comunque non ti toccheranno, se pagherai la tassa di protezione.
};

// **************************************************
// 					Frau
// **************************************************

INSTANCE DIA_Orry_Woman (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Woman_Condition;
	information		= DIA_Orry_Woman_Info;
	permanent		= 0;
	description		= "Ho visto una donna che veniva trasportata giù insieme alle merci."; 
};

FUNC INT DIA_Orry_Woman_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Woman_Info()
{
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //Ho visto una donna che veniva trasportata giù insieme alle merci.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //Già! I baroni delle miniere possono avere tutto ciò che vogliono.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //Vuoi dire che il Re scambia le donne col metallo?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //Ovviamente si tratta di criminali prigioniere. Se Gomez non le avesse richieste, sarebbero sedute in qualche segreta... o peggio.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //Non so cosa sia peggio...
};

// **************************************************
// 					Waffe
// **************************************************

INSTANCE DIA_Orry_Waffe (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Waffe_Condition;
	information		= DIA_Orry_Waffe_Info;
	permanent		= 0;
	description		= "Sto cercando un'arma..."; 
};

FUNC INT DIA_Orry_Waffe_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Waffe_Info()
{
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //Sto cercando un'arma...
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //Dovrebbero essercene di vecchie, nella miniera abbandonata in fondo al canyon.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //Non iniziare una guerra con un piccone come arma! Quegli affari sono lenti e pesanti.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //Un combattente inesperto non dovrebbe mai usarli, se non in caso d'emergenza.
	
};



