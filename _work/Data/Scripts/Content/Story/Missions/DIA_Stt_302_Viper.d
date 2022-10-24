
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
	description		= "Ты, должно быть, плавильщик."; 
};

FUNC int  Stt_302_Viper_GREET_Condition()
{
	return 1;
};


FUNC void  Stt_302_Viper_GREET_Info()
{
	AI_Output (other, self,"Stt_302_Viper_GREET_Info_15_01"); //Ты, должно быть, плавильщик.
	AI_Output (self, other,"Stt_302_Viper_GREET_Info_11_02"); //А ты умный парень, как я посмотрю. 
};  
// ***************************** SCHMELZGESCHICHTE ****************************************//
instance  Stt_302_Viper_MELT (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_MELT_Condition;
	information		= Stt_302_Viper_MELT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я слышал, что в шахте переплавляется только часть руды."; 
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
	AI_Output (other, self,"Stt_302_Viper_MELT_Info_15_01"); //Я слышал, что в шахте переплавляется только часть руды.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_02"); //Когда-то мы переплавляли всю руду. Но Гомез и маги решили, что так не пойдет.  
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_03"); //Несколько недель они что-то здесь изучали, рассматривали руду и все остальное. 
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_04"); //Они несли всякую чушь и совали свои благородные носы в те вещи, о которых не имели ни малейшего представления.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_05"); //В итоге мы стали переплавлять только часть руды, а маги сюда больше не показывались.
};
// *****************************  ****************************************//
instance  Stt_302_Viper_BUY (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_BUY_Condition;
	information		= Stt_302_Viper_BUY_Info;
	important		= 0;
	permanent		= 1;
	description		= "Ты можешь дать мне руду?"; 
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
	AI_Output (other, self,"Stt_302_Viper_BUY_Info_15_01"); //Ты можешь дать мне руду?
	AI_Output (self, other,"Stt_302_Viper_BUY_Info_11_02"); //Если у тебя есть что-нибудь взамен.
};

