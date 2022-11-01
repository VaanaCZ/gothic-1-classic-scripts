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
	description = "Zdar! Jsem tady nový.";
};                       

FUNC INT DIA_Graham_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Graham_Hello_Info()
{	
	AI_Output (other, self,"DIA_Graham_Hello_15_00"); //Zdar! Jsem tady nový.
	AI_Output (self, other,"DIA_Graham_Hello_02_01"); //Já jsem Graham, Kreslím mapy. Ještě jsem tě tu neviděl... Co chceš?
	
	B_LogEntry( GE_TraderOC,"Kopáč Graham prodává mapy nalevo od hlavní brány.");
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
	description = "Poslal mě Diego. Žádá, abys mi dal mapu cesty do Starého dolu.";
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
	AI_Output (other, self,"DIA_Graham_SellMap_15_00"); //Poslal mě Diego. Žádá, abys mi dal mapu cesty do Starého dolu.
	AI_Output (self, other,"DIA_Graham_SellMap_02_01"); //Žádný problém. Pro tebe... jen za 20 nugetů.
	Info_ClearChoices	(DIA_Graham_SellMap );
	Info_AddChoice		(DIA_Graham_SellMap,"Ještě přijdu.",DIA_Graham_SellMap_BACK);
	Info_AddChoice		(DIA_Graham_SellMap,"Zaplatím za mapu. Tady, vem si nugety.",DIA_Graham_SellMap_Pay);
	Info_AddChoice		(DIA_Graham_SellMap,"Dej mi tu mapu, nebo si ji vezmu sám!",DIA_Graham_SellMap_AufsMaul);
	Info_AddChoice		(DIA_Graham_SellMap,"Zadrž, Diego řekl, že bys mi měl tu mapu DÁT, ne, že bys mi ji měl prodat.",DIA_Graham_SellMap_GiveNotSell);
};

func void DIA_Graham_SellMap_BACK()
{
	AI_Output (other, self,"DIA_Graham_SellMap_BACK_15_00"); //Ještě přijdu.
	Info_ClearChoices	(DIA_Graham_SellMap );
};

func void DIA_Graham_SellMap_Pay()
{
	AI_Output (other, self,"DIA_Graham_SellMap_Pay_15_00"); //Zaplatím za mapu. Tady, vem si nugety.
	if (Npc_HasItems(other, itminugget)>=20)
	{
		AI_Output (self, other,"DIA_Graham_SellMap_Pay_02_01"); //Dobrá. Takovouhle mapu nikde nedostaneš laciněji - to mi věř.
		B_GiveInvItems (other, self, itminugget, 20);
		B_GiveInvItems (self, other, ItWrOMmap, 1);
		Graham_OMKarteVerkauft = TRUE;
		Info_ClearChoices	(DIA_Graham_SellMap );
	}
	else
	{
		AI_Output (self, other,"DIA_Graham_SellMap_Pay_NoOre_02_00"); //Napřed mi dej nějakou rudu. Ulov zvěř nebo nasbírej houby - tyhle věci můžeš prodat tady v táboře.
	};
};

func void DIA_Graham_SellMap_AufsMaul()
{
	AI_Output (other, self,"DIA_Graham_SellMap_AufsMaul_15_00"); //Dej mi tu mapu nebo si ji vezmu sám!
	AI_Output (self, other,"DIA_Graham_SellMap_AufsMaul_02_01"); //Hej, opatrně, hochu. Nechci problémy. Tady si vezmi tu mapu a dej mi pokoj!
	B_GiveInvItems(self, other, ItWrOMmap, 1);
	Info_ClearChoices	(DIA_Graham_SellMap );
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Graham_OMKarteErpresst = TRUE;
	AI_StopProcessInfos	(self);
};

func void DIA_Graham_SellMap_GiveNotSell()
{
	AI_Output (other, self,"DIA_Graham_SellMap_GiveNotSell_15_00"); //Zadrž, Diego řekl, že bys mi měl tu mapu DÁT, ne, že bys mi ji měl prodat.
	AI_Output (self, other,"DIA_Graham_SellMap_GiveNotSell_02_01"); //To mě ale nezajímá! Máš vůbec představu, jak obtížné je takovouhle mapu sestrojit?
	AI_Output (self, other,"DIA_Graham_SellMap_GiveNotSell_02_02"); //20 je má speciální cena pro Diegovy přátele. Obvykle beru 50.
};


INSTANCE DIA_Graham_BuyMaps (C_INFO)
{
	npc			= Vlk_573_Graham;
	nr			= 800;
	condition	= DIA_Graham_BuyMaps_Condition;
	information	= DIA_Graham_BuyMaps_Info;
	permanent	= 1;
	description = "Chtěl bych koupit mapu.";
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
	AI_Output (other, self,"DIA_Graham_BuyMaps_15_00"); //Chtěl bych koupit mapu.
	AI_Output (self, other,"DIA_Graham_BuyMaps_02_01"); //Jistě... Jakou máš na mysli? Čím více toho na mapě vidíš, tím je dražší.
};











 
 

 
 
