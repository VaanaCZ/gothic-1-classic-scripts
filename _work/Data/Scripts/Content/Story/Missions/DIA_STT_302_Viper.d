
// ************************ EXIT **************************

instance  Stt_302_Viper_Exit (C_INFO)
{
	npc			=  Stt_302_Viper;
	nr			=  999;
	condition	=  Stt_302_Viper_Exit_Condition;
	information	=  Stt_302_Viper_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  Stt_302_Viper_Exit_Condition()
{
	return 1;
};

FUNC VOID  Stt_302_Viper_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  Stt_302_Viper_GREET (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_GREET_Condition;
	information		= Stt_302_Viper_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ho sentito dire che sei il fonditore."; 
};

FUNC int  Stt_302_Viper_GREET_Condition()
{
	return 1;
};


FUNC void  Stt_302_Viper_GREET_Info()
{
	AI_Output (other, self,"Stt_302_Viper_GREET_Info_15_01"); //Ho sentito dire che sei il fonditore.
	AI_Output (self, other,"Stt_302_Viper_GREET_Info_11_02"); //Sei un ragazzo sveglio.
};  
// ***************************** SCHMELZGESCHICHTE ****************************************//
instance  Stt_302_Viper_MELT (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_MELT_Condition;
	information		= Stt_302_Viper_MELT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Dicono che fondi solo una parte del metallo."; 
};

FUNC int  Stt_302_Viper_MELT_Condition()
{	
	if Npc_KnowsInfo (hero,Stt_302_Viper_GREET) && Npc_KnowsInfo (hero,Grd_260_Drake_Mine_Mehr) 
	{
		return 1;
	};

};
FUNC void  Stt_302_Viper_MELT_Info()
{
	AI_Output (other, self,"Stt_302_Viper_MELT_Info_15_01"); //Dicono che fondi solo una parte del metallo.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_02"); //Tempo addietro, mi occupavo di tutto il carico, però Gomez e i maghi non erano molto contenti.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_03"); //Sono rimasti qui settimane intere per esaminare il metallo e tutto il resto.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_04"); //Armeggiavano e infilavano i nobili nasi in faccende di cui non avevano la più pallida idea.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_05"); //Alla fine, abbiamo iniziato a fondere solo parte del metallo. I maghi non sono più tornati.
};
// *****************************  ****************************************//
instance  Stt_302_Viper_BUY (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_BUY_Condition;
	information		= Stt_302_Viper_BUY_Info;
	important		= 0;
	permanent		= 1;
	description		= "Puoi darmi del metallo?"; 
	trade           = 1;
};

FUNC int  Stt_302_Viper_BUY_Condition()
{	
	if Npc_KnowsInfo (hero,Stt_302_Viper_GREET)
	{ 
		return 1;
	};

};
FUNC void  Stt_302_Viper_BUY_Info()
{
	AI_Output (other, self,"Stt_302_Viper_BUY_Info_15_01"); //Puoi darmi del metallo?
	AI_Output (self, other,"Stt_302_Viper_BUY_Info_11_02"); //Se hai delle merci in cambio.
};

