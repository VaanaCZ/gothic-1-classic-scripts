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
	description = "Привет! Я здесь недавно.";
};                       

FUNC INT DIA_Graham_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Graham_Hello_Info()
{	
	AI_Output (other, self,"DIA_Graham_Hello_15_00"); //Привет! Я здесь недавно.
	AI_Output (self, other,"DIA_Graham_Hello_02_01"); //Меня зовут Грехэм. Я рисую карты. Я тебя раньше не видел... Что тебе нужно?
	
	B_LogEntry( GE_TraderOC, "Рудокоп Грехем продает карты. Его можно найти слева от главных ворот.");
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
	description = "Диего сказал мне, что я могу взять у тебя карту...";
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
	AI_Output (other, self,"DIA_Graham_SellMap_15_00"); //Диего сказал мне, что я могу взять у тебя карту, на которой обозначен путь к Старой шахте.
	AI_Output (self, other,"DIA_Graham_SellMap_02_01"); //Никаких проблем. Только для тебя... 20 кусков руды.
	Info_ClearChoices	(DIA_Graham_SellMap );
	Info_AddChoice		(DIA_Graham_SellMap,"Еще увидимся!"							,DIA_Graham_SellMap_BACK);
	Info_AddChoice		(DIA_Graham_SellMap,"Я куплю у тебя карту. Вот руда."	,DIA_Graham_SellMap_Pay);
	Info_AddChoice		(DIA_Graham_SellMap,"Отдай карту, или я заберу ее сам!"								,DIA_Graham_SellMap_AufsMaul);
	Info_AddChoice		(DIA_Graham_SellMap,"Погоди, Диего сказал мне, что ты дашь мне карту, а не продашь.",DIA_Graham_SellMap_GiveNotSell);
};

func void DIA_Graham_SellMap_BACK()
{
	AI_Output (other, self,"DIA_Graham_SellMap_BACK_15_00"); //Еще увидимся!
	Info_ClearChoices	(DIA_Graham_SellMap );
};

func void DIA_Graham_SellMap_Pay()
{
	AI_Output (other, self,"DIA_Graham_SellMap_Pay_15_00"); //Я куплю у тебя карту. Вот руда.
	if (Npc_HasItems(other, itminugget)>=20)
	{
		AI_Output (self, other,"DIA_Graham_SellMap_Pay_02_01"); //Ладно. Поверь мне, парень, ты бы нигде не достал такую карту за эти деньги.
		B_GiveInvItems (other, self, itminugget, 20);
		B_GiveInvItems (self, other, ItWrOMmap, 1);
		Graham_OMKarteVerkauft = TRUE;
		Info_ClearChoices	(DIA_Graham_SellMap );
	}
	else
	{
		AI_Output (self, other,"DIA_Graham_SellMap_Pay_NoOre_02_00"); //Прежде добудь руду. Поохоться или пособирай грибы, добычу можно продать у нас в лагере.
	};
};

func void DIA_Graham_SellMap_AufsMaul()
{
	AI_Output (other, self,"DIA_Graham_SellMap_AufsMaul_15_00"); //Отдай карту, или я заберу ее сам!
	AI_Output (self, other,"DIA_Graham_SellMap_AufsMaul_02_01"); //Эй, расслабься, дружище! Мне не нужны неприятности. Вот, возьми свою карту и оставь меня в покое.
	B_GiveInvItems(self, other, ItWrOMmap, 1);
	Info_ClearChoices	(DIA_Graham_SellMap );
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Graham_OMKarteErpresst = TRUE;
	AI_StopProcessInfos	(self);
};

func void DIA_Graham_SellMap_GiveNotSell()
{
	AI_Output (other, self,"DIA_Graham_SellMap_GiveNotSell_15_00"); //Погоди, Диего сказал мне, что ты дашь мне карту, а не продашь.
	AI_Output (self, other,"DIA_Graham_SellMap_GiveNotSell_02_01"); //Да мне-то что с того?! Ты хоть представляешь себе, как сложно нарисовать такую карту?
	AI_Output (self, other,"DIA_Graham_SellMap_GiveNotSell_02_02"); //20 - это моя специальная цена для друзей Диего. Обычно я беру 50.
};


INSTANCE DIA_Graham_BuyMaps (C_INFO)
{
	npc			= Vlk_573_Graham;
	nr			= 800;
	condition	= DIA_Graham_BuyMaps_Condition;
	information	= DIA_Graham_BuyMaps_Info;
	permanent	= 1;
	description = "Я хочу купить карту.";
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
	AI_Output (other, self,"DIA_Graham_BuyMaps_15_00"); //Я хочу купить карту.
	AI_Output (self, other,"DIA_Graham_BuyMaps_02_01"); //Конечно... Какая тебе нужна? Чем больше всего на ней изображено, тем дороже она стоит.
};











 
 

 
 
