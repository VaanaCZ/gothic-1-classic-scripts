// **************************************************
//						 EXIT 
// **************************************************

instance  Org_818_Ratford_Exit (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 999;
	condition	= Org_818_Ratford_Exit_Condition;
	information	= Org_818_Ratford_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_818_Ratford_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					Wrong Way
// **************************************************

instance  Org_818_Ratford_WrongWay (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WrongWay_Condition;
	information	= Org_818_Ratford_WrongWay_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_818_Ratford_WrongWay_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WrongWay_Info()
{
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_00"); //Hej, ty!
	AI_Output (other, self,"Org_818_Ratford_WrongWay_15_01"); //Czego chcesz?
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_02"); //Chcê ciê ostrzec. Id¹c dalej wejdziesz na nasze tereny ³owieckie.
};

// **************************************************
//					Was jagt ihr
// **************************************************

instance  Org_818_Ratford_WhatGame (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhatGame_Condition;
	information	= Org_818_Ratford_WhatGame_Info;
	permanent	= 0;
	description = "Na co polujecie?";
};                       

FUNC int  Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhatGame_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_00"); //Na co polujecie?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_01"); //G³ównie na œcierwojady. Da siê je zjeœæ, no i nietrudno je zabiæ... Jeœli wie siê jak to zrobiæ.
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_02"); //Naprawdê? Macie jak¹œ specjaln¹ metodê?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_03"); //Zapytaj mojego kumpla, Draxa. Nikt nie wie wiêcej o œcierwojadach ni¿ on.
};

// **************************************************
//					Warum gefährlich
// **************************************************

instance  Org_818_Ratford_WhyDangerous (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhyDangerous_Condition;
	information	= Org_818_Ratford_WhyDangerous_Info;
	permanent	= 0;
	description = "Dlaczego ten teren jest tak niebezpieczny?";
};                       

FUNC int  Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhyDangerous_15_00"); //Dlaczego ten teren jest tak niebezpieczny?
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_01"); //Jesteœ tu nowy, co? W ca³ej kolonii jest mnóstwo mniej lub bardziej niebezpiecznych miejsc.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_02"); //Œcie¿ki pomiêdzy obozami s¹ doœæ bezpieczne, ale nawet tam mo¿na natkn¹æ siê na stado wilków, które bêd¹ chcia³y zjeœæ ciê na kolacjê.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_03"); //Dlatego lepiej nie ruszaæ siê nigdzie bez odpowiedniego orê¿a i zbroi.
};

// **************************************************
//					Wo Ausrüstung
// **************************************************

instance  Org_818_Ratford_WoEquipment (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoEquipment_Condition;
	information	= Org_818_Ratford_WoEquipment_Info;
	permanent	= 0;
	description = "Sk¹d mogê wzi¹æ lepsze wyposa¿enie?";
};                       

FUNC int  Org_818_Ratford_WoEquipment_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_WoEquipment_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoEquipment_15_00"); //Sk¹d mogê wzi¹æ lepsze wyposa¿enie?
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_01"); //Najbli¿ej bêdzie pewnie Stary Obóz. IdŸ dalej t¹ sam¹ œcie¿k¹, na pewno trafisz.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_02"); //Ale lepsze ceny znajdziesz u nas - w Nowym Obozie. Oczywiœcie pod warunkiem, ¿e znasz w³aœciwych ludzi.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_03"); //Kiedy trafisz do Starego Obozu, poszukaj mê¿czyzny imieniem Mordrag. To jeden z naszych. Za kilka bry³ek rudy mo¿na u niego kupiæ wiele wartoœciowych rzeczy.
	
	Log_CreateTopic	(GE_TraderOC, LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Szkodnik Mordrag handluje w Starym Obozie ró¿nymi towarami. Ponoæ ma bardzo przystêpne ceny.");
};

// **************************************************
//					More Locations
// **************************************************

instance  Org_818_Ratford_MoreLocations (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_MoreLocations_Condition;
	information	= Org_818_Ratford_MoreLocations_Info;
	permanent	= 0;
	description = "Opowiedz mi jeszcze o kolonii.";
};                       

FUNC int  Org_818_Ratford_MoreLocations_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_MoreLocations_Info()
{
	AI_Output (other, self,"Org_818_Ratford_MoreLocations_15_00"); //Opowiedz mi jeszcze o kolonii.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_01"); //Jeœli zamierzasz podró¿owaæ miêdzy obozami, przyda ci siê mapa z wszystkimi œcie¿kami i œlepymi zau³kami.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_02"); //Niektóre œcie¿ki prowadz¹ do niebezpiecznych kanionów, gdzie mo¿na wpaœæ na istoty, na które... lepiej nie wpadaæ.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_03"); //Pod ¿adnym pozorem nie w³ócz siê w pobli¿u starych ruin. Wiêkszoœæ z nich pamiêta jeszcze pierwsz¹ wojnê z Orkami. Niektóre s¹ nawet pozosta³oœciami po ich osiedlach.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_04"); //Czêsto krêc¹ siê tam Orkowie albo jeszcze gorsze poczwary. Na twoim miejscu unika³bym takich miejsc jak ognia. Zw³aszcza noc¹.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_05"); //I jeszcze jedna rada - nie wchodŸ do lasu!
};

// **************************************************
//					Wo Karte?
// **************************************************

instance Org_818_Ratford_WoKarte (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoKarte_Condition;
	information	= Org_818_Ratford_WoKarte_Info;
	permanent	= 0;
	description = "Gdzie mogê zdobyæ jak¹œ mapê?";
};                       

FUNC int Org_818_Ratford_WoKarte_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC void Org_818_Ratford_WoKarte_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_15_00"); //Gdzie mogê zdobyæ jak¹œ mapê?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_01"); //Popytaj ludzi w Starym Obozie. Mieszka tam jeden kartograf. 
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_02"); //Mo¿e uda ci siê gwizdn¹æ mu jak¹œ mapê. Przy okazji móg³byœ zwin¹æ tak¿e jedn¹ dla mnie!
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice   (Org_818_Ratford_WoKarte,"Jeœli uda mi siê zdobyæ je bez p³acenia, wezmê ile tylko dam radê udŸwign¹æ!",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice	 (Org_818_Ratford_WoKarte,"Dlaczego? Jego mapy nie s¹ na sprzeda¿?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //Jeœli uda mi siê zdobyæ je bez p³acenia, wezmê ile tylko dam radê udŸwign¹æ!
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //Równy z ciebie goœæ! Powinieneœ pomyœleæ o do³¹czeniu do Nowego Obozu. Gdybyœ kiedyœ tam trafi³, pytaj o Laresa. To on zajmuje siê nowymi. Na pewno znajdzie dla ciebie jakieœ zajêcie!
	
	VAR C_NPC Lares; Lares = Hlp_GetNpc(ORG_801_LARES);
	Lares.aivar[AIV_FINDABLE]=TRUE;
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //Dlaczego? Jego mapy nie s¹ na sprzeda¿? 
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //Jeœli staæ ciê na tak ogromny wydatek...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

// **************************************************
//						Danke
// **************************************************

instance  Org_818_Ratford_Thanks (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 888;
	condition	= Org_818_Ratford_Thanks_Condition;
	information	= Org_818_Ratford_Thanks_Info;
	permanent	= 0;
	description = "Dziêki za pomoc.";
};                       

FUNC int  Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Thanks_Info()
{
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_00"); //Dziêki za pomoc.
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_01"); //Tylko nie myœl, ¿e wszyscy tutaj s¹ tacy mili!
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_02"); //Niewiele mo¿na znaleŸæ w kieszeniach Nowego, ale w kolonii s¹ ludzie, którzy roz³upaliby ci czaszkê za stary kilof.
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_04"); //Bêdê o tym pamiêta³.
};











