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
	description = "Zdar! Jsem tady nov�.";
};                       

FUNC INT DIA_Graham_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Graham_Hello_Info()
{	
	AI_Output (other, self,"DIA_Graham_Hello_15_00"); //Zdar! Jsem tady nov�.
	AI_Output (self, other,"DIA_Graham_Hello_02_01"); //J� jsem Graham, Kresl�m mapy. Je�t� jsem t� tu nevid�l... Co chce�?
	
	B_LogEntry( GE_TraderOC,"Kop�� Graham prod�v� mapy nalevo od hlavn� br�ny.");
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
	description = "Poslal m� Diego. ��d�, abys mi dal mapu cesty do Star�ho dolu.";
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
	AI_Output (other, self,"DIA_Graham_SellMap_15_00"); //Poslal m� Diego. ��d�, abys mi dal mapu cesty do Star�ho dolu.
	AI_Output (self, other,"DIA_Graham_SellMap_02_01"); //��dn� probl�m. Pro tebe... jen za 20 nuget�.
	Info_ClearChoices	(DIA_Graham_SellMap );
	Info_AddChoice		(DIA_Graham_SellMap,"Je�t� p�ijdu.",DIA_Graham_SellMap_BACK);
	Info_AddChoice		(DIA_Graham_SellMap,"Zaplat�m za mapu. Tady, vem si nugety.",DIA_Graham_SellMap_Pay);
	Info_AddChoice		(DIA_Graham_SellMap,"Dej mi tu mapu, nebo si ji vezmu s�m!",DIA_Graham_SellMap_AufsMaul);
	Info_AddChoice		(DIA_Graham_SellMap,"Zadr�, Diego �ekl, �e bys mi m�l tu mapu D�T, ne, �e bys mi ji m�l prodat.",DIA_Graham_SellMap_GiveNotSell);
};

func void DIA_Graham_SellMap_BACK()
{
	AI_Output (other, self,"DIA_Graham_SellMap_BACK_15_00"); //Je�t� p�ijdu.
	Info_ClearChoices	(DIA_Graham_SellMap );
};

func void DIA_Graham_SellMap_Pay()
{
	AI_Output (other, self,"DIA_Graham_SellMap_Pay_15_00"); //Zaplat�m za mapu. Tady, vem si nugety.
	if (Npc_HasItems(other, itminugget)>=20)
	{
		AI_Output (self, other,"DIA_Graham_SellMap_Pay_02_01"); //Dobr�. Takovouhle mapu nikde nedostane� lacin�ji - to mi v��.
		B_GiveInvItems (other, self, itminugget, 20);
		B_GiveInvItems (self, other, ItWrOMmap, 1);
		Graham_OMKarteVerkauft = TRUE;
		Info_ClearChoices	(DIA_Graham_SellMap );
	}
	else
	{
		AI_Output (self, other,"DIA_Graham_SellMap_Pay_NoOre_02_00"); //Nap�ed mi dej n�jakou rudu. Ulov zv�� nebo nasb�rej houby - tyhle v�ci m��e� prodat tady v t�bo�e.
	};
};

func void DIA_Graham_SellMap_AufsMaul()
{
	AI_Output (other, self,"DIA_Graham_SellMap_AufsMaul_15_00"); //Dej mi tu mapu nebo si ji vezmu s�m!
	AI_Output (self, other,"DIA_Graham_SellMap_AufsMaul_02_01"); //Hej, opatrn�, hochu. Nechci probl�my. Tady si vezmi tu mapu a dej mi pokoj!
	B_GiveInvItems(self, other, ItWrOMmap, 1);
	Info_ClearChoices	(DIA_Graham_SellMap );
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Graham_OMKarteErpresst = TRUE;
	AI_StopProcessInfos	(self);
};

func void DIA_Graham_SellMap_GiveNotSell()
{
	AI_Output (other, self,"DIA_Graham_SellMap_GiveNotSell_15_00"); //Zadr�, Diego �ekl, �e bys mi m�l tu mapu D�T, ne, �e bys mi ji m�l prodat.
	AI_Output (self, other,"DIA_Graham_SellMap_GiveNotSell_02_01"); //To m� ale nezaj�m�! M� v�bec p�edstavu, jak obt�n� je takovouhle mapu sestrojit?
	AI_Output (self, other,"DIA_Graham_SellMap_GiveNotSell_02_02"); //20 je m� speci�ln� cena pro Diegovy p��tele. Obvykle beru 50.
};


INSTANCE DIA_Graham_BuyMaps (C_INFO)
{
	npc			= Vlk_573_Graham;
	nr			= 800;
	condition	= DIA_Graham_BuyMaps_Condition;
	information	= DIA_Graham_BuyMaps_Info;
	permanent	= 1;
	description = "Cht�l bych koupit mapu.";
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
	AI_Output (other, self,"DIA_Graham_BuyMaps_15_00"); //Cht�l bych koupit mapu.
	AI_Output (self, other,"DIA_Graham_BuyMaps_02_01"); //Jist�... Jakou m� na mysli? ��m v�ce toho na map� vid�, t�m je dra���.
};











 
 

 
 
