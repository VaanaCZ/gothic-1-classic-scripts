
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
	description		= "Dov�d�l jsem se, �e jsi tavi�."; 
};

FUNC int  Stt_302_Viper_GREET_Condition()
{
	return 1;
};


FUNC void  Stt_302_Viper_GREET_Info()
{
	AI_Output (other, self,"Stt_302_Viper_GREET_Info_15_01"); //Dov�d�l jsem se, �e jsi tavi�.
	AI_Output (self, other,"Stt_302_Viper_GREET_Info_11_02"); //To jsi ale bystr� hoch.
};  
// ***************************** SCHMELZGESCHICHTE ****************************************//
instance  Stt_302_Viper_MELT (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_MELT_Condition;
	information		= Stt_302_Viper_MELT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Dov�d�l jsem se, �e tav� jenom malou ��st rudy."; 
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
	AI_Output (other, self,"Stt_302_Viper_MELT_Info_15_01"); //Dov�d�l jsem se, �e tav� jenom malou ��st rudy.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_02"); //P�ed n�jakou dobu jsme za�ali tavit o hodn� m�n�. Gomez a jeho m�gov� z toho ale nem�li moc radost.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_03"); //Cel� t�dny se tady potloukali, aby zkou�eli rudu a tak.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_04"); //Mleli o tom a strkali svoje n�bl nosy do v�c�, o kter�ch nem�li ani p�edstavu.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_05"); //Nakonec jsme p�etavili jenom ��st rudy. M�gov� u� nikdy znovu nep�i�li.
};
// *****************************  ****************************************//
instance  Stt_302_Viper_BUY (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_BUY_Condition;
	information		= Stt_302_Viper_BUY_Info;
	important		= 0;
	permanent		= 1;
	description		= "M��e� mi d�t rudu?"; 
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
	AI_Output (other, self,"Stt_302_Viper_BUY_Info_15_01"); //M��e� mi d�t rudu?
	AI_Output (self, other,"Stt_302_Viper_BUY_Info_11_02"); //Kdy� mi d� n�jak� zbo��.
};

