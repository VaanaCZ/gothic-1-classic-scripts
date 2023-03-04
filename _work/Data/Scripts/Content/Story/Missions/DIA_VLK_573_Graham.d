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
	description = "Salut ! Je suis nouveau ici.";
};                       

FUNC INT DIA_Graham_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Graham_Hello_Info()
{	
	AI_Output (other, self,"DIA_Graham_Hello_15_00"); //Salut ! Je suis nouveau ici.
	AI_Output (self, other,"DIA_Graham_Hello_02_01"); //Je suis Graham. Je dessine des cartes. Je ne t'ai jamais vu avant... Qu'est ce que tu veux ?
	
	B_LogEntry( GE_TraderOC,"Le mineur Graham vend des cartes à gauche de la porte principale.");
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
	description = "Diego m'a envoyé. Il te demande de me donner une carte de la vielle mine.";
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
	AI_Output (other, self,"DIA_Graham_SellMap_15_00"); //Diego m'envoie. Il te demande de me donner une carte avec la route vers la vieille Mine.
	AI_Output (self, other,"DIA_Graham_SellMap_02_01"); //Pas de problème. Pour toi... seulement 20 minerais.
	Info_ClearChoices	(DIA_Graham_SellMap );
	Info_AddChoice		(DIA_Graham_SellMap,"Je reviendrai.",DIA_Graham_SellMap_BACK);
	Info_AddChoice		(DIA_Graham_SellMap,"Je payerai pour la carte. Tiens, prends le minerai.",DIA_Graham_SellMap_Pay);
	Info_AddChoice		(DIA_Graham_SellMap,"Donne-moi la carte ou je la prends !",DIA_Graham_SellMap_AufsMaul);
	Info_AddChoice		(DIA_Graham_SellMap,"Diego a dit que tu devais ME DONNER la carte, pas ME LA VENDRE !",DIA_Graham_SellMap_GiveNotSell);
};

func void DIA_Graham_SellMap_BACK()
{
	AI_Output (other, self,"DIA_Graham_SellMap_BACK_15_00"); //Je reviendrai.
	Info_ClearChoices	(DIA_Graham_SellMap );
};

func void DIA_Graham_SellMap_Pay()
{
	AI_Output (other, self,"DIA_Graham_SellMap_Pay_15_00"); //Je payerai pour la carte. Tiens, prends le minerai.
	if (Npc_HasItems(other, itminugget)>=20)
	{
		AI_Output (self, other,"DIA_Graham_SellMap_Pay_02_01"); //D'accord. Tu n'auras jamais une carte comme celle-la à ce prix - croit moi.
		B_GiveInvItems (other, self, itminugget, 20);
		B_GiveInvItems (self, other, ItWrOMmap, 1);
		Graham_OMKarteVerkauft = TRUE;
		Info_ClearChoices	(DIA_Graham_SellMap );
	}
	else
	{
		AI_Output (self, other,"DIA_Graham_SellMap_Pay_NoOre_02_00"); //Va chercher du minerai d'abord. Chasse des animaux ou cueille des champignons - tu peux vendre des trucs ici dans le Camp.
	};
};

func void DIA_Graham_SellMap_AufsMaul()
{
	AI_Output (other, self,"DIA_Graham_SellMap_AufsMaul_15_00"); //Donne-moi la carte ou je la prends !
	AI_Output (self, other,"DIA_Graham_SellMap_AufsMaul_02_01"); //Hé, reste calme, mec. Je ne veux pas d'ennuis. Voila, prend la carte et laisse moi tranquille !
	B_GiveInvItems(self, other, ItWrOMmap, 1);
	Info_ClearChoices	(DIA_Graham_SellMap );
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Graham_OMKarteErpresst = TRUE;
	AI_StopProcessInfos	(self);
};

func void DIA_Graham_SellMap_GiveNotSell()
{
	AI_Output (other, self,"DIA_Graham_SellMap_GiveNotSell_15_00"); //Attend, Diego a dit que tu devais me DONNER la carte, pas que je devrais la payer.
	AI_Output (self, other,"DIA_Graham_SellMap_GiveNotSell_02_01"); //Mais ça ne m'intéresse pas ! As-tu la moindre idée de la difficulté pour faire une carte comme celle-la ?
	AI_Output (self, other,"DIA_Graham_SellMap_GiveNotSell_02_02"); //20 est mon prix spécial pour les amis de Diego. Normalement je prend 50.
};


INSTANCE DIA_Graham_BuyMaps (C_INFO)
{
	npc			= Vlk_573_Graham;
	nr			= 800;
	condition	= DIA_Graham_BuyMaps_Condition;
	information	= DIA_Graham_BuyMaps_Info;
	permanent	= 1;
	description = "Je voudrais acheter une carte.";
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
	AI_Output (other, self,"DIA_Graham_BuyMaps_15_00"); //Je voudrais acheter une carte.
	AI_Output (self, other,"DIA_Graham_BuyMaps_02_01"); //Bien sur... qu'est ce que tu crois ? Plus tu peux voir du territoire sur la carte, plus elle est chère..
};











 
 

 
 
