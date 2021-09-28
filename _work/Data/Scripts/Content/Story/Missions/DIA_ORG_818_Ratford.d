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
	AI_Output (other, self,"Org_818_Ratford_WrongWay_15_01"); //Co chce�?
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_02"); //Chci t� varovat. Jestli p�jde� d�l touhle cestou, vstoup� na na�i loveckou p�du.
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
	description = "Co tady lov�te?";
};                       

FUNC int  Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhatGame_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_00"); //Co tady lov�te?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_01"); //V�t�inou mrcho�routy. Je z nich spousta masa. Krom� toho, nen� tak t�k� je dostat... Kdy� v�, jak na to.
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_02"); //Opravdu? A jak?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_03"); //Zeptej se tady m�ho p��tele Draxe - v� o tom v�c ne� kdokoliv jin�.
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
	description = "Pro� je ta oblast tak nebezpe�n�?";
};                       

FUNC int  Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhyDangerous_15_00"); //Pro� je ta oblast tak nebezpe�n�?
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_01"); //Pr�v� jsi sem p�i�el, vi�? V kolonii jsou r�zn� oblasti, kter� jsou v�ce nebo m�n� nebezpe�n�.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_02"); //Cesty mezi t�bory jsou docela bezpe�n�. Ale i na nich ti m��ou zk��it cestu n�jac� vlci, kte�� na tebe budou hled�t jako na snadnou ko�ist.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_03"); //A to pr�v� do t� doby, dokud nebude� m�t po��dnou zbra� a zbroj.
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
	description = "Kde dostanu lep�� v�bavu?";
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
	AI_Output (other, self,"Org_818_Ratford_WoEquipment_15_00"); //Kde dostanu lep�� vybaven�?
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_01"); //Nejbl�e to bude ve Star�m t�bo�e. P��mo tahle cesta t� tam dovede.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_02"); //Ale v na�em t�bo�e to dostane� levn�ji. Nov� t�bor - tam potk� ty spr�vn� lidi.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_03"); //Jestli p�jde� do Star�ho t�bora, ptej se po Mordragovi. Je jedn�m z n�s. Za trochu rudy ti prod� to spr�vn� zbo��.
	
	Log_CreateTopic	(GE_TraderOC, LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Bandita Mordrag prod�v� ve Star�m t�bo�e za p�ijateln� ceny ve�ker� zbo��.");
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
	description = "Pov�z mi v�c o oblastech v kolonii.";
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
	AI_Output (other, self,"Org_818_Ratford_MoreLocations_15_00"); //Pov�z mi v�c o oblastech v kolonii.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_01"); //Kdy� cestuje� mezi t�bory, mus� m�t mapu, abys rozpoznal cesty a slep� stezky.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_02"); //Slep� stezky t� �asto dovedou do nebezpe�n�ch ka�on�, kde potk� p��ery, kter�m je lep�� se vyhnout.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_03"); //Nevch�zej do star�ch z��cenin. Je jich tu v okol� spousta. V�t�ina z nich se datuje do �as� prvn� sk�et� v�lky. N�kter� jsou opu�t�n� sk�et� s�dla.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_04"); //V t�chto z��cenin�ch b�vaj� �asto sk�eti - nebo je�t� hor�� p��ery. T�mhle m�st�m bych se vyh�bal, obzvl᚝ v noci.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_05"); //A je�t� jedna rada - necho� do lesa!
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
	description = "Kde dostanu mapu?";
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
	AI_Output (other, self,"Org_818_Ratford_WoKarte_15_00"); //Kde dostanu mapu?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_01"); //Zeptej se lid� ve Star�m t�bo�e, �ije tam jeden kartograf.
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_02"); //Mo�n� se ti poda�� n�jakou z jeho map ukr�st! Jestli se ti to poda��, vezmi tak� jednu pro m�!
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice   (Org_818_Ratford_WoKarte,"Jestli se mi je poda�� vz�t bez placen�, vezmu jich tolik, kolik unesu!",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice	 (Org_818_Ratford_WoKarte,"Pro�? On neprod�v� mapy?",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //Jestli se mi je poda�� vz�t bez placen�, vezmu jich tolik, kolik unesu!
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //L�b� se mi. M�l by ses rozhodnout pro Nov� t�bor! Jestli tam p�jde�, ptej se na Larese. Star� se o nov� p��choz�. Mysl�m, �e pro tebe bude m�t pr�ci!
	
	VAR C_NPC Lares; Lares = Hlp_GetNpc(ORG_801_LARES);
	Lares.aivar[AIV_FINDABLE]=TRUE;
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //Pro�? On neprod�v� mapy? 
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //Jestli m� dost rudy, abys je zaplatil...
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
	description = "D�ky za pomoc.";
};                       

FUNC int  Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Thanks_Info()
{
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_00"); //D�ky za pomoc.
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_01"); //Nemysli si, �e se bude ka�d� chovat tak p��telsky, mladej!
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_02"); //Nov� p��choz� ani nemus� m�t zrovna narvan� kapsy, ale n�kte�� t� zabijou t�eba jenom pro krump��.
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_04"); //Budu si to pamatovat.
};











