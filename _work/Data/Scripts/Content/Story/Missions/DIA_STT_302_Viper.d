
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
	description		= "J'ai entendu dire que tu es le fondeur."; 
};

FUNC int  Stt_302_Viper_GREET_Condition()
{
	return 1;
};


FUNC void  Stt_302_Viper_GREET_Info()
{
	AI_Output (other, self,"Stt_302_Viper_GREET_Info_15_01"); //J'ai entendu dire que tu es le fondeur.
	AI_Output (self, other,"Stt_302_Viper_GREET_Info_11_02"); //Tu es un garçon futé en effet.
};  
// ***************************** SCHMELZGESCHICHTE ****************************************//
instance  Stt_302_Viper_MELT (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_MELT_Condition;
	information		= Stt_302_Viper_MELT_Info;
	important		= 0;
	permanent		= 0;
	description		= "J'ai entendu dire que tu faisais seulement fondre une partie du minerai."; 
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
	AI_Output (other, self,"Stt_302_Viper_MELT_Info_15_01"); //J'ai entendu dire que tu faisais seulement fondre une partie du minerai.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_02"); //Fut un temps nous avions l'habitude de fondre le tas en bas. Mais ça ne plaisait pas trop à Gomez et aux Mages.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_03"); //Ils ont traîné ici pendant des semaines pour examiner le minerai et tout le reste.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_04"); //Ils ont traficoté et ont fourré leur nez dans des choses dont ils n'avaient aucune idée.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_05"); //Finalement nous n'avons seulement fondu qu'une partie du minerai. Les Mages ne sont jamais revenus ici.
};
// *****************************  ****************************************//
instance  Stt_302_Viper_BUY (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_BUY_Condition;
	information		= Stt_302_Viper_BUY_Info;
	important		= 0;
	permanent		= 1;
	description		= "Peux-tu me donner du minerai ?"; 
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
	AI_Output (other, self,"Stt_302_Viper_BUY_Info_15_01"); //Peux-tu me donner du minerai ?
	AI_Output (self, other,"Stt_302_Viper_BUY_Info_11_02"); //Si tu peux me donner des marchandises.
};

