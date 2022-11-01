
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
	description		= "Podobno jesteś hutnikiem."; 
};

FUNC int  Stt_302_Viper_GREET_Condition()
{
	return 1;
};


FUNC void  Stt_302_Viper_GREET_Info()
{
	AI_Output (other, self,"Stt_302_Viper_GREET_Info_15_01"); //Podobno jesteś hutnikiem.
	AI_Output (self, other,"Stt_302_Viper_GREET_Info_11_02"); //Widzę, że bystry z ciebie chłopak.
};  
// ***************************** SCHMELZGESCHICHTE ****************************************//
instance  Stt_302_Viper_MELT (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_MELT_Condition;
	information		= Stt_302_Viper_MELT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Podobno przetapiasz tutaj część wydobytej rudy."; 
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
	AI_Output (other, self,"Stt_302_Viper_MELT_Info_15_01"); //Podobno przetapiasz tutaj część wydobytej rudy.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_02"); //Kiedyś przetapialiśmy tutaj cały urobek. Ale Gomezowi i Magom nie bardzo się to podobało.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_03"); //Siedzieli tu tygodniami, badając rudę i wszystko dookoła.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_04"); //Węszyli wszędzie i wtykali swoje szlachetne nochale w rzeczy, o których nie mieli pojęcia.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_05"); //W końcu poprzestaliśmy na przetapianiu części urobku. Magowie więcej się tu nie pojawili.
};
// *****************************  ****************************************//
instance  Stt_302_Viper_BUY (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_BUY_Condition;
	information		= Stt_302_Viper_BUY_Info;
	important		= 0;
	permanent		= 1;
	description		= "Możesz mi dać trochę rudy?"; 
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
	AI_Output (other, self,"Stt_302_Viper_BUY_Info_15_01"); //Możesz mi dać trochę rudy?
	AI_Output (self, other,"Stt_302_Viper_BUY_Info_11_02"); //Jeśli dasz mi coś w zamian.
};

