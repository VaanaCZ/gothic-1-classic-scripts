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
	description = "KONIEC";
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
	description		= "Kim jesteœ?"; 
};

FUNC int  Nov_1371_BaalNetbek_CRAZY_Condition()
{
	return TRUE;
};


FUNC void  Nov_1371_BaalNetbek_CRAZY_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_01"); //Kim jesteœ?
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_02"); //Jestem Guru z obozu na bagnie. Moi s³udzy mówi¹ na mnie Baal Netbek.
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_03"); //S³udzy? Nie widzê tu ¿adnej s³u¿by.
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_04"); //Och, ale¿ oni s¹ wszêdzie. Spójrz na drzewa. Jak one tañcz¹!
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_05"); //...Eee, rozumiem. Có¿, chyba pójdê ju¿ dalej...
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_06"); //Zaczekaj, móg³byœ pomóc mi przekszta³ciæ to bagno w ogromn¹ ³¹kê pe³n¹ kwiatów!
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_07"); //Mo¿e zaczniesz beze mnie? Wrócê... nied³ugo.
	AI_TurnAway (hero,self);
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_08"); //Ten cz³owiek raczej mi nie pomo¿e...
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
	description		= "Czeœæ, co s³ychaæ?"; 
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
	AI_Output (other, self,"Nov_1371_BaalNetbek_AGAIN_Info_15_01"); //Czeœæ, co s³ychaæ?
	AI_Output (self, other,"Nov_1371_BaalNetbek_AGAIN_Info_03_02"); //Tylko uwa¿aj, ¿ebyœ nie skrzywdzi³ moich kochanych drzew!
};  
