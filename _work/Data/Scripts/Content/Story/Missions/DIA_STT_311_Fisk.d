// **************************************************
//						 EXIT 
// **************************************************

instance  Stt_311_Fisk_Exit (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 999;
	condition	= Stt_311_Fisk_Exit_Condition;
	information	= Stt_311_Fisk_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Stt_311_Fisk_Exit_Condition()
{
	return 1;
};

FUNC VOID  Stt_311_Fisk_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					First
// **************************************************

instance  Stt_311_Fisk_First (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 1;
	condition	= Stt_311_Fisk_First_Condition;
	information	= Stt_311_Fisk_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Stt_311_Fisk_First_Condition()
{
		return 1;
};

FUNC VOID  Stt_311_Fisk_First_Info()
{
	AI_Output		(self, other,"Stt_311_Fisk_First_12_00"); //Witaj! Jestem Fisk. Handluj� najr�niejszym towarem. Gdyby� kiedy� czego� potrzebowa�, zg�o� si� do mnie.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Cie� o imieniu Fisk handluje przer�nymi dobrami, a szczeg�lnie broni�. Znajd� go na targowisku."); 
	
};

// **************************************************
//					Handeln
// **************************************************

instance  Stt_311_Fisk_Trade (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 800;
	condition	= Stt_311_Fisk_Trade_Condition;
	information	= Stt_311_Fisk_Trade_Info;
	permanent	= 1;
	description = "Poka� mi swoje towary.";
	trade		= 1;
};                       

FUNC int  Stt_311_Fisk_Trade_Condition()
{
	return 1;
};

FUNC VOID  Stt_311_Fisk_Trade_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_Trade_15_00"); //Poka� mi swoje towary.
};



instance  Stt_311_Fisk_WhistlersSword (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 801;
	condition	= Stt_311_Fisk_WhistlersSword_Condition;
	information	= Stt_311_Fisk_WhistlersSword_Info;
	permanent	= 1;
	description = "Chcia�bym kupi� miecz. Co�... bogato zdobionego.";
};                       

FUNC int  Stt_311_Fisk_WhistlersSword_Condition()
{
	if ( (Fisk_ForgetSword==FALSE) && (Whistler_BuyMySword == LOG_RUNNING) && (Fisk_SwordSold == FALSE)  )
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_WhistlersSword_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_15_00"); //Chcia�bym kupi� miecz. Ale nie taki zwyk�y. Chcia�bym co�... bogato zdobionego.
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_12_01"); //Mam tu co� w sam raz dla ciebie. Cie�, kt�ry mia� to odebra� wi�cej si� tu nie poka�e.
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_12_02"); //Kosztuje jedyne 110 bry�ek rudy. Zainteresowany?
	Fisk_SCknows110 = TRUE;

	Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
	Info_AddChoice		(Stt_311_Fisk_WhistlersSword,"Mo�e innym razem.",Stt_311_Fisk_WhistlersSword_BACK);
	Info_AddChoice		(Stt_311_Fisk_WhistlersSword,"�wistakowi chcia�e� go sprzeda� za 100...",Stt_311_Fisk_WhistlersSword_Fault);
	Info_AddChoice		(Stt_311_Fisk_WhistlersSword,"Dobrze, wezm� go.",Stt_311_Fisk_WhistlersSword_TakeIt);
};

func void Stt_311_Fisk_WhistlersSword_BACK()
{
	AI_Output (other, self,"Org_826_Mordrag_WhistlersSword_BACK_15_00"); //Mo�e innym razem.
	Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
};

func void Stt_311_Fisk_WhistlersSword_Fault()
{
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_Fault_15_00"); //Przecie� �wistakowi chcia�e� go sprzeda� za 100!
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_Fault_12_01"); //Ach! Chwileczk�... Racja! Ma�o brakowa�o, a sprzeda�bym ci do zbyt tanio. Naturalnie mia�em na my�li 500 bry�ek.
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_Fault_15_02"); //Pi��set?!
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_Fault_12_03"); //Za ma�o? Mo�e wolisz 1000? Te� dobrze. Chocia� wiesz co? Ten miecz nie jest jednak na sprzeda�.
	
	Fisk_ForgetSword = TRUE;
	Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
};

func void Stt_311_Fisk_WhistlersSword_TakeIt()
{
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00"); //Dobrze, wezm� go.
	
	if (Npc_HasItems(other,itminugget) >= 110)
	{
		AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01"); //Trafi�a ci si� nie lada okazja.
		B_GiveInvItems(other, self,itminugget,110);
		CreateInvItem (self,Whistlers_Schwert);
		B_GiveInvItems(self, other,Whistlers_Schwert,1);
		Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
		
		Fisk_SwordSold = TRUE;
	}
	else
	{
		AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_02"); //Obawiam si�, �e masz za ma�o rudy. Zachowam ten miecz dla ciebie, ale lepiej si� pospiesz!
	};
};

// **************************************************
//					Forget Sword
// **************************************************

instance  Stt_311_Fisk_ForgetSword (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 800;
	condition	= Stt_311_Fisk_ForgetSword_Condition;
	information	= Stt_311_Fisk_ForgetSword_Info;
	permanent	= 1;
	description = "Wracaj�c do miecza �wistaka...";
};                       

FUNC int  Stt_311_Fisk_ForgetSword_Condition()
{
	if (Fisk_ForgetSword==TRUE)
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_ForgetSword_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_ForgetSword_15_00"); //Porozmawiajmy jeszcze o mieczu �wistaka.
	AI_Output (self, other,"Stt_311_Fisk_ForgetSword_12_01"); //Powiedz mu, �e nigdy nie dostanie tej broni.
};

// **************************************************
//					MordragKO
// **************************************************
	var int Fisk_GetNewHehler;
// **************************************************

instance  Stt_311_Fisk_MordragKO (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 800;
	condition	= Stt_311_Fisk_MordragKO_Condition;
	information	= Stt_311_Fisk_MordragKO_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Stt_311_Fisk_MordragKO_Condition()
{
	if (MordragKO_HauAb == TRUE)  
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_MordragKO_Info()
{
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_12_00"); //Hej, ty!
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_12_01"); //Mordrag by� jednym z moich najlepszych dostawc�w, ty g�upcze!
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_12_02"); //Je�li chcesz zosta� cz�onkiem tego obozu, na m�j g�os nie masz co liczy�!

	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	Info_AddChoice   (Stt_311_Fisk_MordragKO,"Handlujesz przedmiotami Magnat�w. Thorus ch�tnie si� o tym dowie.",Stt_311_Fisk_MordragKO_Petze);
	Info_AddChoice   (Stt_311_Fisk_MordragKO,"Uspok�j si�! Mo�e mog� ci to jako� wynagrodzi�?",Stt_311_Fisk_MordragKO_Relax);
	Info_AddChoice	 (Stt_311_Fisk_MordragKO,"To poca�uj mnie w ty�ek...",Stt_311_Fisk_MordragKO_FuckOff);
};

func void Stt_311_Fisk_MordragKO_Relax()
{
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_Relax_15_00"); //Uspok�j si�! Mo�e mog� ci to jako� wynagrodzi�?
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_Relax_12_01"); //W�tpi�, �eby ci si� uda�o. No chyba, �e znajdziesz dla mnie nowy kontakt w Nowym Obozie!
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_Relax_15_02"); //Jak ja ci znajd� kogo� takiego?
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_Relax_12_03"); //Przecie� m�wi�em, �e nie wydaje mi si�, �eby uda�o ci si� tego dokona�.
	
	Log_CreateTopic(CH1_FiskNewDealer, LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer, LOG_RUNNING);
	B_LogEntry( CH1_FiskNewDealer,"Fisk, handlarz ze Starego Obozu, chce bym znalaz� mu nowego pasera na miejsce Mordraga.");
	
	Fisk_GetNewHehler = LOG_RUNNING;
};

func void Stt_311_Fisk_MordragKO_FuckOff()
{
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_FuckOff_15_00"); //To poca�uj mnie w ty�ek...
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	
	AI_StopProcessInfos	(self);
};

func void Stt_311_Fisk_MordragKO_Petze()
{
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_Petze_15_00"); //Handlujesz przedmiotami, kt�re nale�a�y do Magnat�w. Za�o�� si�, �e Thorus ch�tnie si� o tym dowie.
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_Petze_12_01"); //Nawet nie pr�buj, kolego!
};

// **************************************************
//					New Hehler
// **************************************************

instance  Stt_311_Fisk_HehlerSuccess (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 10;
	condition	= Stt_311_Fisk_HehlerSuccess_Condition;
	information	= Stt_311_Fisk_HehlerSuccess_Info;
	permanent	= 0;
	description	= "Mam kogo� z Nowego Obozu, kto chce nawi�za� z tob� wsp�prac�.";
};                       

FUNC int  Stt_311_Fisk_HehlerSuccess_Condition()
{
	if ( (Fisk_GetNewHehler==LOG_RUNNING) && (Npc_KnowsInfo(hero,Org_843_Sharky_Fisk)))  
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_HehlerSuccess_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_HehlerSuccess_15_00"); //Znalaz�em kogo� z Nowego Obozu, kto chcia�by nawi�za� z tob� wsp�prac�.
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_01"); //No nie! Kto by pomy�la�. Widz�, �e bardzo ci zale�y na popularno�ci w naszym Obozie...
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_02"); //No i uda�o ci si�! Kogo mi tu przyprowadzi�e�?
	AI_Output (other, self,"Stt_311_Fisk_HehlerSuccess_15_03"); //Nazywa si� Sharky.
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_04"); //Sharky? Jest jeszcze gorszy ni� Mordrag!
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_05"); //Je�li chodzi o Diego... Nie musisz si� ju� o niego martwi�.
	
	Fisk_GetNewHehler = LOG_SUCCESS;
	B_GiveXP(XP_fiskdealer);

	Log_SetTopicStatus(CH1_FiskNewDealer, LOG_SUCCESS);
	B_LogEntry( CH1_FiskNewDealer,"Sharky przejmie teraz dzia�k� Mordraga. Fisk jest zadowolony.");
};
/*------------------------------------------------------------------------
							R�STUNG									
------------------------------------------------------------------------*/

instance  Stt_311_Fisk_ARMOR (C_INFO)
{
	npc				= Stt_311_Fisk;
	condition		= Stt_311_Fisk_ARMOR_Condition;
	information		= Stt_311_Fisk_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "Masz dla mnie jeszcze jak�� zbroj�?"; 
};

FUNC int  Stt_311_Fisk_ARMOR_Condition()
{	
	if (Kapitel < 2)
	&& (Npc_KnowsInfo (hero, Stt_311_Fisk_First))
	{
		return TRUE;
	};

};
FUNC void  Stt_311_Fisk_ARMOR_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_ARMOR_Info_15_01"); //Masz dla mnie jeszcze jak�� zbroj�?
	AI_Output (self, other,"Stt_311_Fisk_ARMOR_Info_12_02"); //C�, my�l�, �e znajd� co�, co ci� zadowoli.
	Info_ClearChoices (Stt_311_Fisk_ARMOR);
	Info_Addchoice (Stt_311_Fisk_ARMOR,DIALOG_BACK,Stt_311_Fisk_ARMOR_BACK);
	Info_Addchoice (Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskLightDiggers,VALUE_VLK_ARMOR_L),Stt_311_Fisk_ARMOR_L);
	Info_Addchoice (Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskDiggers,VALUE_VLK_ARMOR_M),Stt_311_Fisk_ARMOR_M);

};  

func void Stt_311_Fisk_ARMOR_BACK()
{
	Info_ClearChoices (Stt_311_Fisk_ARMOR);
};

func void Stt_311_Fisk_ARMOR_L()
{
	AI_Output (other, self,"Stt_311_Fisk_ARMOR_L_Info_15_01"); //Potrzebuj� lekkich spodni Kopacza.
	
	if (Npc_HasItems (hero,ItMiNugget) <  VALUE_VLK_ARMOR_L)
	{
		AI_Output (self, other,"Stt_311_Fisk_ARMOR_L_Info_12_02"); //Wr��, gdy b�dziesz mia� wystarczaj�co du�o rudy.
	}
	else
	{
		AI_Output		(self,	other,	"Stt_311_Fisk_ARMOR_L_Info_12_03"); //Dobry wyb�r!
		B_GiveInvItems	(hero,	self,	ItMinugget, VALUE_VLK_ARMOR_L);
		CreateInvItem	(self,			VLK_ARMOR_L);
		B_GiveInvItems	(self,	hero,	VLK_ARMOR_L, 1);
	};
};

func void Stt_311_Fisk_ARMOR_M()
{
	AI_Output (other, self,"Stt_311_Fisk_ARMOR_M_Info_15_01"); //Daj mi spodnie Kopacza.
	if (Npc_HasItems (hero,ItMiNugget) <  VALUE_VLK_ARMOR_M)
	{
		AI_Output (self, other,"Stt_311_Fisk_ARMOR_M_Info_12_02"); //Wr��, gdy b�dziesz mia� wystarczaj�co du�o rudy.
	}
	else
	{
		AI_Output		(self, other,"Stt_311_Fisk_ARMOR_M_Info_12_03"); //Dobry wyb�r!
		B_GiveInvItems	(hero, self, ItMinugget, VALUE_VLK_ARMOR_M);
		CreateInvItem	(self, VLK_ARMOR_M);
		B_GiveInvItems	(self,hero, VLK_ARMOR_M, 1);
	};
};







