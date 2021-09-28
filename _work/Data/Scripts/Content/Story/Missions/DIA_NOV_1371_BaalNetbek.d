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
	description = "FIN";
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
	description		= "¿Quién eres?"; 
};

FUNC int  Nov_1371_BaalNetbek_CRAZY_Condition()
{
	return TRUE;
};


FUNC void  Nov_1371_BaalNetbek_CRAZY_Info()
{
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_01"); //¿Quién eres?
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_02"); //Soy el Gurú; el Gurú del pantano. Mis sirvientes me llaman Baal Netbek.
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_03"); //¿Sirvientes? ¡No veo a ningún sirviente!
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_04"); //Están por todas partes. ¡Los árboles! Andan, pegan saltos y bailan...
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_05"); //...Entiendo. Bueno, seguiré mi camino.
	AI_Output (self, other,"Nov_1371_BaalNetbek_CRAZY_Info_03_06"); //¡Espera, podrías ayudarme a convertir este pantano en una extensa pradera llena de flores!
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_07"); //Bueno, empieza tú. Yo... volveré luego.
	AI_TurnAway (hero,self);
	AI_Output (other, self,"Nov_1371_BaalNetbek_CRAZY_Info_15_08"); //No va a serme de ninguna ayuda.
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
	description		= "Eh, ¿qué tal?"; 
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
	AI_Output (other, self,"Nov_1371_BaalNetbek_AGAIN_Info_15_01"); //Oye, ¿cómo va la cosa?
	AI_Output (self, other,"Nov_1371_BaalNetbek_AGAIN_Info_03_02"); //¡Ten cuidado, no hagas daño a mis árboles!
};  
