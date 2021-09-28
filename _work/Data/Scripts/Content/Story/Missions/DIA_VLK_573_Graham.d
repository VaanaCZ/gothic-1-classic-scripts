// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Graham_EXIT(C_INFO)
{
	npc			= Vlk_573_Graham;
	nr			= 999;
	condition	= Info_Graham_EXIT_Condition;
	information	= Info_Graham_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Graham_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Graham_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Was machst du?
// ************************************************************

INSTANCE DIA_Graham_Hello (C_INFO)
{
	npc			= Vlk_573_Graham;
	nr			= 3;
	condition	= DIA_Graham_Hello_Condition;
	information	= DIA_Graham_Hello_Info;
	permanent	= 0;
	description = "�Hola! �Soy nuevo aqu�!";
};                       

FUNC INT DIA_Graham_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Graham_Hello_Info()
{	
	AI_Output (other, self,"DIA_Graham_Hello_15_00"); //�Hola! Soy nuevo aqu�.
	AI_Output (self, other,"DIA_Graham_Hello_02_01"); //Yo soy Graham. Hago mapas. Nunca te hab�a visto por aqu�... �Qu� quieres?
	
	B_LogEntry( GE_TraderOC,"El cavador Graham vende mapas a la izquierda de la puerta principal.");
};

// ************************************************************
// 						Sell Map
// ************************************************************
	var int Graham_OMKarteVerkauft;
	var int Graham_OMKarteErpresst;
// ************************************************************

INSTANCE DIA_Graham_SellMap (C_INFO)
{
	npc			= Vlk_573_Graham;
	nr			= 3;
	condition	= DIA_Graham_SellMap_Condition;
	information	= DIA_Graham_SellMap_Info;
	permanent	= 1;
	description = "Me manda Diego. Dice que me des un mapa de la Vieja Mina.";
};                       

FUNC INT DIA_Graham_SellMap_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Graham_Hello) && Npc_KnowsInfo(hero,Info_Diego_MapToOldMine) && (Graham_OMKarteVerkauft==FALSE) && (Graham_OMKarteErpresst==FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Graham_SellMap_Info()
{	
	AI_Output (other, self,"DIA_Graham_SellMap_15_00"); //Vengo de parte de Diego. Te pide que me des un mapa con el camino hasta la Vieja Mina.
	AI_Output (self, other,"DIA_Graham_SellMap_02_01"); //No hay problema. Para ti ser�n 20 pepitas.
	Info_ClearChoices	(DIA_Graham_SellMap );
	Info_AddChoice		(DIA_Graham_SellMap,"Lo devolver�.",DIA_Graham_SellMap_BACK);
	Info_AddChoice		(DIA_Graham_SellMap,"Pagar� por el mapa. Ten, qu�date con el mineral.",DIA_Graham_SellMap_Pay);
	Info_AddChoice		(DIA_Graham_SellMap,"�Dame el mapa o te lo quitar�!",DIA_Graham_SellMap_AufsMaul);
	Info_AddChoice		(DIA_Graham_SellMap,"�Espera, Diego dijo que me DIERAS el mapa, no que me lo VENDIERAS!",DIA_Graham_SellMap_GiveNotSell);
};

func void DIA_Graham_SellMap_BACK()
{
	AI_Output (other, self,"DIA_Graham_SellMap_BACK_15_00"); //Volver�.
	Info_ClearChoices	(DIA_Graham_SellMap );
};

func void DIA_Graham_SellMap_Pay()
{
	AI_Output (other, self,"DIA_Graham_SellMap_Pay_15_00"); //Te pago por el mapa. Aqu� tienes el mineral.
	if (Npc_HasItems(other, itminugget)>=20)
	{
		AI_Output (self, other,"DIA_Graham_SellMap_Pay_02_01"); //Bien. No encontrar�s un mapa mejor y m�s barato que �ste; puedes creerme.
		B_GiveInvItems (other, self, itminugget, 20);
		B_GiveInvItems (self, other, ItWrOMmap, 1);
		Graham_OMKarteVerkauft = TRUE;
		Info_ClearChoices	(DIA_Graham_SellMap );
	}
	else
	{
		AI_Output (self, other,"DIA_Graham_SellMap_Pay_NoOre_02_00"); //Primero vete a conseguir algo de mineral. Caza animales o recoge setas; luego podr�s venderlo aqu�, en el Campamento.
	};
};

func void DIA_Graham_SellMap_AufsMaul()
{
	AI_Output (other, self,"DIA_Graham_SellMap_AufsMaul_15_00"); //�Dame el mapa o me lo llevo a las malas!
	AI_Output (self, other,"DIA_Graham_SellMap_AufsMaul_02_01"); //Eh, tranquilo, hombre. No quiero problemas. �Aqu� tienes el mapa, ll�vatelo y d�jame en paz!
	B_GiveInvItems(self, other, ItWrOMmap, 1);
	Info_ClearChoices	(DIA_Graham_SellMap );
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Graham_OMKarteErpresst = TRUE;
	AI_StopProcessInfos	(self);
};

func void DIA_Graham_SellMap_GiveNotSell()
{
	AI_Output (other, self,"DIA_Graham_SellMap_GiveNotSell_15_00"); //Un momento; Diego dijo que me dieras el mapa, no que me lo vendieras.
	AI_Output (self, other,"DIA_Graham_SellMap_GiveNotSell_02_01"); //�Pero no me interesa! �Sabes lo dif�cil que es hacer un mapa como �ste?
	AI_Output (self, other,"DIA_Graham_SellMap_GiveNotSell_02_02"); //20 pepitas es mi precio especial para amigos de Diego. Normalmente cobro 50.
};


INSTANCE DIA_Graham_BuyMaps (C_INFO)
{
	npc			= Vlk_573_Graham;
	nr			= 800;
	condition	= DIA_Graham_BuyMaps_Condition;
	information	= DIA_Graham_BuyMaps_Info;
	permanent	= 1;
	description = "Me gustar�a comprar un mapa.";
	Trade 		= 1;
};                       

FUNC INT DIA_Graham_BuyMaps_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Graham_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Graham_BuyMaps_Info()
{	
	AI_Output (other, self,"DIA_Graham_BuyMaps_15_00"); //Querr�a comprar un mapa.
	AI_Output (self, other,"DIA_Graham_BuyMaps_02_01"); //Claro... �Qu� ten�as pensado? Cuantas m�s cosas puedas ver en el mapa, m�s cuesta.
};











 
 

 
 
