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
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_02"); //Chc� ci� ostrzec. Id�c dalej wejdziesz na nasze tereny �owieckie.
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
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_01"); //G��wnie na �cierwojady. Da si� je zje��, no i nietrudno je zabi�... Je�li wie si� jak to zrobi�.
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_02"); //Naprawd�? Macie jak�� specjaln� metod�?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_03"); //Zapytaj mojego kumpla, Draxa. Nikt nie wie wi�cej o �cierwojadach ni� on.
};

// **************************************************
//					Warum gef�hrlich
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
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_01"); //Jeste� tu nowy, co? W ca�ej kolonii jest mn�stwo mniej lub bardziej niebezpiecznych miejsc.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_02"); //�cie�ki pomi�dzy obozami s� do�� bezpieczne, ale nawet tam mo�na natkn�� si� na stado wilk�w, kt�re b�d� chcia�y zje�� ci� na kolacj�.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_03"); //Dlatego lepiej nie rusza� si� nigdzie bez odpowiedniego or�a i zbroi.
};

// **************************************************
//					Wo Ausr�stung
// **************************************************

instance  Org_818_Ratford_WoEquipment (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoEquipment_Condition;
	information	= Org_818_Ratford_WoEquipment_Info;
	permanent	= 0;
	description = "Sk�d mog� wzi�� lepsze wyposa�enie?";
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
	AI_Output (other, self,"Org_818_Ratford_WoEquipment_15_00"); //Sk�d mog� wzi�� lepsze wyposa�enie?
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_01"); //Najbli�ej b�dzie pewnie Stary Ob�z. Id� dalej t� sam� �cie�k�, na pewno trafisz.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_02"); //Ale lepsze ceny znajdziesz u nas - w Nowym Obozie. Oczywi�cie pod warunkiem, �e znasz w�a�ciwych ludzi.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_03"); //Kiedy trafisz do Starego Obozu, poszukaj m�czyzny imieniem Mordrag. To jeden z naszych. Za kilka bry�ek rudy mo�na u niego kupi� wiele warto�ciowych rzeczy.
	
	Log_CreateTopic	(GE_TraderOC, LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Szkodnik Mordrag handluje w Starym Obozie r�nymi towarami. Pono� ma bardzo przyst�pne ceny.");
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
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_01"); //Je�li zamierzasz podr�owa� mi�dzy obozami, przyda ci si� mapa z wszystkimi �cie�kami i �lepymi zau�kami.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_02"); //Niekt�re �cie�ki prowadz� do niebezpiecznych kanion�w, gdzie mo�na wpa�� na istoty, na kt�re... lepiej nie wpada�.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_03"); //Pod �adnym pozorem nie w��cz si� w pobli�u starych ruin. Wi�kszo�� z nich pami�ta jeszcze pierwsz� wojn� z Orkami. Niekt�re s� nawet pozosta�o�ciami po ich osiedlach.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_04"); //Cz�sto kr�c� si� tam Orkowie albo jeszcze gorsze poczwary. Na twoim miejscu unika�bym takich miejsc jak ognia. Zw�aszcza noc�.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_05"); //I jeszcze jedna rada - nie wchod� do lasu!
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
	description = "Gdzie mog� zdoby� jak�� map�?";
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
	AI_Output (other, self,"Org_818_Ratford_WoKarte_15_00"); //Gdzie mog� zdoby� jak�� map�?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_01"); //Popytaj ludzi w Starym Obozie. Mieszka tam jeden kartograf. 
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_02"); //Mo�e uda ci si� gwizdn�� mu jak�� map�. Przy okazji m�g�by� zwin�� tak�e jedn� dla mnie!
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice   (Org_818_Ratford_WoKarte,"Je�li uda mi si� zdoby� je bez p�acenia, wezm� ile tylko dam rad� ud�wign��!",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice	 (Org_818_Ratford_WoKarte,"Dlaczego? Jego mapy nie s� na sprzeda�?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //Je�li uda mi si� zdoby� je bez p�acenia, wezm� ile tylko dam rad� ud�wign��!
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //R�wny z ciebie go��! Powiniene� pomy�le� o do��czeniu do Nowego Obozu. Gdyby� kiedy� tam trafi�, pytaj o Laresa. To on zajmuje si� nowymi. Na pewno znajdzie dla ciebie jakie� zaj�cie!
	
	VAR C_NPC Lares; Lares = Hlp_GetNpc(ORG_801_LARES);
	Lares.aivar[AIV_FINDABLE]=TRUE;
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //Dlaczego? Jego mapy nie s� na sprzeda�? 
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //Je�li sta� ci� na tak ogromny wydatek...
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
	description = "Dzi�ki za pomoc.";
};                       

FUNC int  Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Thanks_Info()
{
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_00"); //Dzi�ki za pomoc.
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_01"); //Tylko nie my�l, �e wszyscy tutaj s� tacy mili!
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_02"); //Niewiele mo�na znale�� w kieszeniach Nowego, ale w kolonii s� ludzie, kt�rzy roz�upaliby ci czaszk� za stary kilof.
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_04"); //B�d� o tym pami�ta�.
};











