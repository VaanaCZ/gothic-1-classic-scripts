// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Swiney_EXIT(C_INFO)
{
	npc			= SfB_1037_Swiney ;
	nr			= 999;
	condition	= Info_Swiney_EXIT_Condition;
	information	= Info_Swiney_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Swiney_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_Swiney_Hello(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Hello_Condition;
	information	= Info_Swiney_Hello_Info;
	permanent	= 0;
	description = "Kdo jsi?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //Kdo jsi?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //Jsem nejlepší důlní inženýr, kterého kdy tahle zpropadená kolonie spatřila, milej zlatej.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //Jsem přesvědčený, že by se polovina našich chlapů nemusela nechat zabít padajícími kameny, kdyby nebyla tak stupidní a kopala na správných místech.
};

// ************************************************************
// 						Schürfer
// ************************************************************

INSTANCE Info_Swiney_Schuerfer(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Schuerfer_Condition;
	information	= Info_Swiney_Schuerfer_Info;
	permanent	= 0;
	description = "Chtěl bych se k vám přidat jako rudař!";
};                       

FUNC INT Info_Swiney_Schuerfer_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_Schuerfer_Info()
{	
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //Chtěl bych se k vám přidat jako rudař!
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //Tak? Nemysli si ale, že tím získáš něco zvláštního. Obnáší to tři porce rýže denně a nic víc, co bys musel na vlastní oči vidět.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //Víš, proč to děláme? Děláme to proto, abysme odtud jednoho dne mohli odejít za svobodou.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //To znamená, že se všechna ruda vytěží a pak putuje na velkou rudnou haldu. A jednou za měsíc dostane každý, kdo tady pracoval, 50 nugetů, aby se mohl zpít do němoty.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //To je nejdůležitější věc, kterou bys měl vědět.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //Máš s touhle prací aspoň nějaké zkušenosti?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer,"Ne.",Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer,"Ano.",Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //Ano.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //Dobrá! Pak víš, na co tu dávat pozor. Tady máš ochranný oděv. Musíš si obstarat svůj vlastní krumpáč. Hodně úspěchů!
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //Ne.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //Samozřejmě, že ne! Proč pořád já? Dobře, Poslouchej pozorně. Vezmeš tenhle materiál a položíš ho - sem.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //Když ti spadne magický nuget na nohu a ty přitom nebudeš na sobě mít ochranný oděv, budeš na doživotí mrzák a budeš mít pro nás jen poloviční hodnotu, než si měl předtím.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //Někde tady bude ležet krumpáč.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //Ale moc už toho nevydrží - co se dá dělat...
	
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE Info_Swiney_PERM(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_PERM_Condition;
	information	= Info_Swiney_PERM_Info;
	permanent	= 1;
	description = "Kolik rudy jste už nahromadili?";
};                       

FUNC INT Info_Swiney_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Schuerfer)) 
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_PERM_Info()
{	
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //Kolik rudy jste už nahromadili?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //Mágové říkají, že už jí nebude tolik potřeba. Jdi do Nového tábora a prohlédni si haldu.
	AI_StopProcessInfos	(self);
};


