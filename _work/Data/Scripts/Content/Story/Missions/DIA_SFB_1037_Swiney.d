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
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //Jsem nejlepší dùlní inženýr, kterého kdy tahle zpropadená kolonie spatøila, milej zlatej.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //Jsem pøesvìdèený, že by se polovina našich chlapù nemusela nechat zabít padajícími kameny, kdyby nebyla tak stupidní a kopala na správných místech.
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
	description = "Chtìl bych se k vám pøidat jako rudaø!";
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
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //Chtìl bych se k vám pøidat jako rudaø!
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //Tak? Nemysli si ale, že tím získáš nìco zvláštního. Obnáší to tøi porce rýže dennì a nic víc, co bys musel na vlastní oèi vidìt.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //Víš, proè to dìláme? Dìláme to proto, abysme odtud jednoho dne mohli odejít za svobodou.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //To znamená, že se všechna ruda vytìží a pak putuje na velkou rudnou haldu. A jednou za mìsíc dostane každý, kdo tady pracoval, 50 nugetù, aby se mohl zpít do nìmoty.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //To je nejdùležitìjší vìc, kterou bys mìl vìdìt.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //Máš s touhle prací aspoò nìjaké zkušenosti?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer,"Ne.",Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer,"Ano.",Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //Ano.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //Dobrá! Pak víš, na co tu dávat pozor. Tady máš ochranný odìv. Musíš si obstarat svùj vlastní krumpáè. Hodnì úspìchù!
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //Ne.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //Samozøejmì, že ne! Proè poøád já? Dobøe, Poslouchej pozornì. Vezmeš tenhle materiál a položíš ho - sem.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //Když ti spadne magický nuget na nohu a ty pøitom nebudeš na sobì mít ochranný odìv, budeš na doživotí mrzák a budeš mít pro nás jen polovièní hodnotu, než si mìl pøedtím.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //Nìkde tady bude ležet krumpáè.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //Ale moc už toho nevydrží - co se dá dìlat...
	
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
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //Mágové øíkají, že už jí nebude tolik potøeba. Jdi do Nového tábora a prohlédni si haldu.
	AI_StopProcessInfos	(self);
};


