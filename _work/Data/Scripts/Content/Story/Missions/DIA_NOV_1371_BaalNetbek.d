/*------------------------------------------------------------------------
//							EXIT									//
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_Exit (C_INFO)
{
	npc			=  Nov_1371_BaalNetbek;
	nr			=  999;
	condition	=  Nov_1371_BaalNetbek_Exit_Condition;
	information	=  Nov_1371_BaalNetbek_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = "KONEC";
};                       

FUNC int  Nov_1371_BaalNetbek_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Nov_1371_BaalNetbek_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
							GÄRTNER								
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_CRAZY (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= Nov_1371_BaalNetbek_CRAZY_Condition;
	information		= Nov_1371_BaalNetbek_CRAZY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Kdo jsi?"; 
};

FUNC int  Nov_1371_BaalNetbek_CRAZY_Condition()
{
	return TRUE;
};


FUNC void  Nov_1371_BaalNetbek_CRAZY_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_01"); //Kdo jsi?
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_02"); //Jsem Guru, Guru bažin. Moji služebníci mi øíkají Baal Netbek.
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_03"); //Služebníci? Nevidím žádné služebníky!
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_04"); //Jsou všude. Stromy! Vykraèujou si, skáèou a tancujou...
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_05"); //...Och, aha. Dobøe, pak si pùjdu svou cestou...
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_06"); //Poèkej, mùžeš mi pomoci zmìnit tyhle bažiny v obrovskou louku plnou kvìtù!
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_07"); //Dobøe, jen musíš zaèít. Já... vrátím se pozdìji.
	AI_TurnAway (hero,self);
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_08"); //S ním se nikam nedostanu...
	AI_StopProcessInfos	( self );
};  
/*------------------------------------------------------------------------
							AGAIN							
------------------------------------------------------------------------*/

instance  Nov_1371_BaalNetbek_AGAIN (C_INFO)
{
	npc				= Nov_1371_BaalNetbek;
	condition		= Nov_1371_BaalNetbek_AGAIN_Condition;
	information		= Nov_1371_BaalNetbek_AGAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Jak to jde?"; 
};

FUNC int  Nov_1371_BaalNetbek_AGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,Nov_1371_BaalNetbek_CRAZY))
	{
		return TRUE;
	};

};
FUNC void  Nov_1371_BaalNetbek_AGAIN_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_AGAIN_Info_15_01"); //Hej, jak to jde?
	AI_Output (self, other,"Nov_1371_BaalNetbek_AGAIN_Info_03_02"); //Pamatuj, neubližuj mým stromùm!
};  
