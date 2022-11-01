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
	description		= "Kim jesteś?"; 
};

FUNC int  Nov_1371_BaalNetbek_CRAZY_Condition()
{
	return TRUE;
};


FUNC void  Nov_1371_BaalNetbek_CRAZY_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_01"); //Kim jesteś?
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_02"); //Jestem Guru z obozu na bagnie. Moi słudzy mówią na mnie Baal Netbek.
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_03"); //Słudzy? Nie widzę tu żadnej służby.
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_04"); //Och, ależ oni są wszędzie. Spójrz na drzewa. Jak one tańczą!
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_05"); //...Eee, rozumiem. Cóż, chyba pójdę już dalej...
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_06"); //Zaczekaj, mógłbyś pomóc mi przekształcić to bagno w ogromną łąkę pełną kwiatów!
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_07"); //Może zaczniesz beze mnie? Wrócę... niedługo.
	AI_TurnAway (hero,self);
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_08"); //Ten człowiek raczej mi nie pomoże...
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
	description		= "Cześć, co słychać?"; 
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
	AI_Output (other, self,"Nov_1371_BaalNetbek_AGAIN_Info_15_01"); //Cześć, co słychać?
	AI_Output (self, other,"Nov_1371_BaalNetbek_AGAIN_Info_03_02"); //Tylko uważaj, żebyś nie skrzywdził moich kochanych drzew!
};  
