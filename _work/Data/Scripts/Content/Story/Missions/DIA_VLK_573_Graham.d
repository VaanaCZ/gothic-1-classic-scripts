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
	description = "Czeœæ! Jestem tu nowy!";
};                       

FUNC INT DIA_Graham_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Graham_Hello_Info()
{	
	AI_Output (other, self,"DIA_Graham_Hello_15_00"); //Czeœæ! Jestem tu nowy!
	AI_Output (self, other,"DIA_Graham_Hello_02_01"); //Nazywam siê Graham. Rysujê mapy. Chyba siê jeszcze nie widzieliœmy... Czego potrzebujesz?
	
	B_LogEntry( GE_TraderOC,"Kopacz Graham sprzedaje mapy. Mieszka na lewo od g³ównej bramy.");
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
	description = "Przysy³a mnie Diego. Mam dostaæ od ciebie mapê wskazuj¹c¹ drogê do Starej Kopalni.";
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
	AI_Output (other, self,"DIA_Graham_SellMap_15_00"); //Przysy³a mnie Diego. Mam dostaæ od ciebie mapê wskazuj¹c¹ drogê do Starej Kopalni.
	AI_Output (self, other,"DIA_Graham_SellMap_02_01"); //Nie ma sprawy. Jak dla ciebie... tylko 20 bry³ek rudy.
	Info_ClearChoices	(DIA_Graham_SellMap );
	Info_AddChoice		(DIA_Graham_SellMap,"Wrócê póŸniej.",DIA_Graham_SellMap_BACK);
	Info_AddChoice		(DIA_Graham_SellMap,"Dobrze, zap³acê. Oto ruda.",DIA_Graham_SellMap_Pay);
	Info_AddChoice		(DIA_Graham_SellMap,"Daj mi tê mapê, albo sam j¹ sobie wezmê!",DIA_Graham_SellMap_AufsMaul);
	Info_AddChoice		(DIA_Graham_SellMap,"Diego powiedzia³, ¿e masz mi DAÆ tê mapê. Nie zamierzam za ni¹ p³aciæ!",DIA_Graham_SellMap_GiveNotSell);
};

func void DIA_Graham_SellMap_BACK()
{
	AI_Output (other, self,"DIA_Graham_SellMap_BACK_15_00"); //Wrócê póŸniej.
	Info_ClearChoices	(DIA_Graham_SellMap );
};

func void DIA_Graham_SellMap_Pay()
{
	AI_Output (other, self,"DIA_Graham_SellMap_Pay_15_00"); //Dobrze, zap³acê. Oto ruda.
	if (Npc_HasItems(other, itminugget)>=20)
	{
		AI_Output (self, other,"DIA_Graham_SellMap_Pay_02_01"); //Œwietnie. To prawdziwa okazja, mo¿esz mi wierzyæ.
		B_GiveInvItems (other, self, itminugget, 20);
		B_GiveInvItems (self, other, ItWrOMmap, 1);
		Graham_OMKarteVerkauft = TRUE;
		Info_ClearChoices	(DIA_Graham_SellMap );
	}
	else
	{
		AI_Output (self, other,"DIA_Graham_SellMap_Pay_NoOre_02_00"); //Najpierw zdob¹dŸ trochê rudy. Upoluj coœ, albo pozbieraj grzyby. Mo¿esz je sprzedaæ w Obozie.
	};
};

func void DIA_Graham_SellMap_AufsMaul()
{
	AI_Output (other, self,"DIA_Graham_SellMap_AufsMaul_15_00"); //Daj mi tê mapê, albo sam j¹ sobie wezmê!
	AI_Output (self, other,"DIA_Graham_SellMap_AufsMaul_02_01"); //Uspokój siê, stary. Nie chcê tu ¿adnych k³opotów. Masz, weŸ sobie tê mapê i daj mi wreszcie spokój!
	B_GiveInvItems(self, other, ItWrOMmap, 1);
	Info_ClearChoices	(DIA_Graham_SellMap );
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Graham_OMKarteErpresst = TRUE;
	AI_StopProcessInfos	(self);
};

func void DIA_Graham_SellMap_GiveNotSell()
{
	AI_Output (other, self,"DIA_Graham_SellMap_GiveNotSell_15_00"); //Zaraz, Diego powiedzia³, ¿e masz mi DAÆ tê mapê. Nie zamierzam za ni¹ p³aciæ!
	AI_Output (self, other,"DIA_Graham_SellMap_GiveNotSell_02_01"); //A co mnie to obchodzi?! Wiesz ile pracy wymaga sporz¹dzenie takiej mapy?
	AI_Output (self, other,"DIA_Graham_SellMap_GiveNotSell_02_02"); //20 bry³ek to moja specjalna cena dla przyjació³ Diego. Zwykle biorê 50.
};


INSTANCE DIA_Graham_BuyMaps (C_INFO)
{
	npc			= Vlk_573_Graham;
	nr			= 800;
	condition	= DIA_Graham_BuyMaps_Condition;
	information	= DIA_Graham_BuyMaps_Info;
	permanent	= 1;
	description = "Chcia³bym kupiæ mapê.";
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
	AI_Output (other, self,"DIA_Graham_BuyMaps_15_00"); //Chcia³bym kupiæ mapê.
	AI_Output (self, other,"DIA_Graham_BuyMaps_02_01"); //Jasne. Co ciê interesuje? Im wiêcej widaæ na mapie, tym jest dro¿sza.
};











 
 

 
 
