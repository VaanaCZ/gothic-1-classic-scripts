
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
	description		= "я слышал, что ты плавильщик."; 
};

FUNC int  Stt_302_Viper_GREET_Condition()
{
	return 1;
};


FUNC void  Stt_302_Viper_GREET_Info()
{
	AI_Output (other, self,"Stt_302_Viper_GREET_Info_15_01"); //я слышал, что ты плавильщик.
	AI_Output (self, other,"Stt_302_Viper_GREET_Info_11_02"); //“ы умный парень однако.
};  
// ***************************** SCHMELZGESCHICHTE ****************************************//
instance  Stt_302_Viper_MELT (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_MELT_Condition;
	information		= Stt_302_Viper_MELT_Info;
	important		= 0;
	permanent		= 0;
	description		= "√овор€т, что вы переплавл€ете только часть руды."; 
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
	AI_Output (other, self,"Stt_302_Viper_MELT_Info_15_01"); //√овор€т, что вы переплавл€ете только часть руды.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_02"); // огда-то мы переплавл€ли всю добычу. Ќо √омезу и магам это было не слишком-то по душе.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_03"); //ќни шл€лись здесь недел€ми: осматривали руду и все остальное.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_04"); //Ќесли вс€кую чушь и совали свои благородные носы в такие дела, о каких они и представлени€ не имеют. 
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_05"); //“еперь, в итоге, мы переплавл€ем только часть руды, а маги сюда больше не приход€т.
};
// *****************************  ****************************************//
instance  Stt_302_Viper_BUY (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_BUY_Condition;
	information		= Stt_302_Viper_BUY_Info;
	important		= 0;
	permanent		= 1;
	description		= "“ы можешь дать мне немного руды?"; 
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
	AI_Output (other, self,"Stt_302_Viper_BUY_Info_15_01"); //“ы можешь дать мне немного руды?
	AI_Output (self, other,"Stt_302_Viper_BUY_Info_11_02"); //≈сли у теб€ есть какой-нибудь товар на продажу.
};

