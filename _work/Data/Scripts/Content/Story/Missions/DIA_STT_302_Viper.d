
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
	description		= "Podobno jesteœ hutnikiem."; 
};

FUNC int  Stt_302_Viper_GREET_Condition()
{
	return 1;
};


FUNC void  Stt_302_Viper_GREET_Info()
{
	AI_Output (other, self,"Stt_302_Viper_GREET_Info_15_01"); //Podobno jesteœ hutnikiem.
	AI_Output (self, other,"Stt_302_Viper_GREET_Info_11_02"); //Widzê, ¿e bystry z ciebie ch³opak.
};  
// ***************************** SCHMELZGESCHICHTE ****************************************//
instance  Stt_302_Viper_MELT (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_MELT_Condition;
	information		= Stt_302_Viper_MELT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Podobno przetapiasz tutaj czêœæ wydobytej rudy."; 
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
	AI_Output (other, self,"Stt_302_Viper_MELT_Info_15_01"); //Podobno przetapiasz tutaj czêœæ wydobytej rudy.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_02"); //Kiedyœ przetapialiœmy tutaj ca³y urobek. Ale Gomezowi i Magom nie bardzo siê to podoba³o.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_03"); //Siedzieli tu tygodniami, badaj¹c rudê i wszystko dooko³a.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_04"); //Wêszyli wszêdzie i wtykali swoje szlachetne nochale w rzeczy, o których nie mieli pojêcia.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_05"); //W koñcu poprzestaliœmy na przetapianiu czêœci urobku. Magowie wiêcej siê tu nie pojawili.
};
// *****************************  ****************************************//
instance  Stt_302_Viper_BUY (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_BUY_Condition;
	information		= Stt_302_Viper_BUY_Info;
	important		= 0;
	permanent		= 1;
	description		= "Mo¿esz mi daæ trochê rudy?"; 
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
	AI_Output (other, self,"Stt_302_Viper_BUY_Info_15_01"); //Mo¿esz mi daæ trochê rudy?
	AI_Output (self, other,"Stt_302_Viper_BUY_Info_11_02"); //Jeœli dasz mi coœ w zamian.
};

