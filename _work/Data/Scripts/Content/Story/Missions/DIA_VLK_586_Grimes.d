// ************************ EXIT **************************

instance VLK_586_Grimes_Exit (C_INFO)
{
	npc			= VLK_586_Grimes;
	nr			= 999;
	condition	= VLK_586_Grimes_Exit_Condition;
	information	= VLK_586_Grimes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_586_Grimes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_586_Grimes_Exit_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_Exit_Info_15_01"); //Buona fortuna.
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //Anche a te, ragazzo. Anche a te...
	
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  VLK_586_Grimes_STORY (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_STORY_Condition;
	information		= VLK_586_Grimes_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Sei qui da molto?"; 
};

FUNC int  VLK_586_Grimes_STORY_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_FIRST) )  
	{
		return 1;
	};

};


FUNC void  VLK_586_Grimes_STORY_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_STORY_Info_15_01"); //Sei qui da molto?
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //Almeno 10 anni. Credimi: ho imparato molto, quaggiù.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //Mi sono trovato in grossi pericoli e sono sempre riuscito a sopravvivere.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //Ai vecchi tempi, quando lavoravamo nella miniera abbandonata che ora è deserta, a un certo punto sono crollati i piloni di sostegno e...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //Ma queste sono vecchie storie...
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Devi aver sentito parlare di diversi piani di fuga."; 
};

FUNC int  VLK_586_Grimes_KNOW_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_STORY) )  
	{
		return 1;
	};

};
FUNC void  VLK_586_Grimes_KNOW_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //Devi aver sentito parlare di diversi piani di fuga.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //Ascolta, ragazzo: so che vuoi andartene di qui, ma scordatelo.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //Farai meglio a smettere di pensare alla fuga. Ho visto le facce di quelli che hanno tentato di uscire dalla Barriera.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //Non commettere il loro stesso errore. La Barriera ferma chiunque.
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //Non voglio passare i prossimi dieci anni a scavare in miniera!
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //Non è detto. Forse diventerai un pezzo grosso, chi può dirlo.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //Anche se farai molta strada, non importa quanta, alla fine la Barriera ti fermerà sempre.
};

instance VLK_586_Grimes_FIRST (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_FIRST_Condition;
	information		= VLK_586_Grimes_FIRST_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_586_Grimes_FIRST_Condition()
{
	return 1;
};

func void  VLK_586_Grimes_FIRST_Info()
{
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //Una faccia nuova! Hai mai estratto metallo, ragazzo?
};  
