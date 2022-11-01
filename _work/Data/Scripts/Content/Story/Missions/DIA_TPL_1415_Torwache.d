// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Tpl_1415_Torwache_Exit (C_INFO)
{
	npc			= Tpl_1415_Templer;
	nr			= 999;
	condition	= DIA_Tpl_1415_Torwache_Exit_Condition;
	information	= DIA_Tpl_1415_Torwache_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Tpl_1415_Torwache_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Tpl_1415_Torwache_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Tpl_1415_Torwache_First (C_INFO)
{
	npc				= Tpl_1415_Templer;
	nr				= 2;
	condition		= DIA_Tpl_1415_Torwache_First_Condition;
	information		= DIA_Tpl_1415_Torwache_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Tpl_1415_Torwache_First_Condition()
{	
	if (Kapitel >= 2)
	{
		return FALSE;
	};

	if (Npc_GetDistToWP(other,"PSI_START") > 800)
	{
		Npc_SetRefuseTalk(self,30);
	};
	
	if (Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Tpl_1415_Torwache_First_Info()
{
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_13_00"); //Witaj, nieznajomy!
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_13_01"); //Stąpasz po świętej ziemi. Jesteś w obozie Bractwa Śniącego!
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_13_02"); //Co cię tu sprowadza?
	
	Info_ClearChoices	(DIA_Tpl_1415_Torwache_First);
	Info_AddChoice		(DIA_Tpl_1415_Torwache_First,"Jestem tu nowy. Chciałbym rozejrzeć się trochę po waszym obozie.",DIA_Tpl_1415_Torwache_First_JustLooking);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_Tpl_1415_Torwache_First,"Chcę do was dołączyć.",DIA_Tpl_1415_Torwache_First_Join);
	};
};

func void DIA_Tpl_1415_Torwache_First_Join()
{
	AI_Output (other, self,"DIA_Tpl_1415_Torwache_First_Join_15_00"); //Słyszałem, że szukacie nowych członków. Chciałbym do was dołączyć.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_Join_13_01"); //Zatem bądź pozdrowiony. Bractwo Śniącego chętnie wita wszystkich, którzy wyrzekli się drogi zła i chcą żyć wedle nauk Śniącego.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_Join_13_02"); //Jeśli naprawdę chcesz zostać jednym z nas, spróbuj zwrócić na siebie uwagę Baal Namiba. Znajdziesz go na placu, tuż za bramą.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_Join_13_04"); //Ale nie wolno ci odezwać się do niego. Zaczekaj, aż on zwróci się do ciebie.
	Info_ClearChoices	(DIA_Tpl_1415_Torwache_First);
};

func void DIA_Tpl_1415_Torwache_First_JustLooking()
{
	AI_Output (other, self,"DIA_Tpl_1415_Torwache_First_JustLooking_15_00"); //Jestem tu nowy. Chciałbym rozejrzeć się trochę po waszym obozie.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_01"); //Zatem wejdź. Będziesz tu mile widzianym gościem.
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_First_JustLooking_13_02"); //Tylko staraj się przestrzegać naszych zasad. W Obozie są miejsca, do których obcy nie mają wstępu.
	Info_ClearChoices	(DIA_Tpl_1415_Torwache_First);
};

// **************************************************
// 				Wie sieht's im Lager aus?
// **************************************************

INSTANCE DIA_Tpl_1415_Torwache_Sit (C_INFO)
{
	npc				= Tpl_1415_Templer;
	nr				= 2;
	condition		= DIA_Tpl_1415_Torwache_Sit_Condition;
	information		= DIA_Tpl_1415_Torwache_Sit_Info;
	permanent		= 1;
	description		= "Co słychać w Obozie?";
};

FUNC INT DIA_Tpl_1415_Torwache_Sit_Condition()
{	
	return 1;
};

FUNC VOID DIA_Tpl_1415_Torwache_Sit_Info()
{
	AI_Output (other, self,"DIA_Tpl_1415_Torwache_Sit_15_00"); //Co słychać w Obozie?
	AI_Output (self, other,"DIA_Tpl_1415_Torwache_Sit_13_01"); //Wszystko w porządku. Możesz śmiało wejść do środka.
};
/*------------------------------------------------------------------------
//						TEMPLERAUFNAHME							//
------------------------------------------------------------------------*/
instance Tpl_1415_Torwache_TEMPLERAUFNAHME	 (C_INFO)
{
	npc				= Tpl_1415_Templer;
	condition		= Tpl_1415_Torwache_TEMPLERAUFNAHME_Condition;
	information		= Tpl_1415_Torwache_TEMPLERAUFNAHME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Tpl_1415_Torwache_TEMPLERAUFNAHME_Condition()
{	
	if (( Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) 
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS))
	&& ( Npc_GetTrueGuild  (hero) == GIL_NOV)
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  Tpl_1415_Torwache_TEMPLERAUFNAHME_Info()
{
	AI_GotoNpc (hero,self); 
	AI_Output (self, other,"Tpl_1415_Torwache_IMPORTANT_Info_13_01"); //Słyszałem, co się wydarzyło w kopalni. Dobra robota. Zasłużyłeś na przyjęcie w poczet Świątynnej Straży!
	AI_Output (self, other,"Tpl_1415_Torwache_IMPORTANT_Info_13_02"); //Porozmawiaj koniecznie z Cor Angarem!

	Log_CreateTopic (GE_BecomeTemplar,LOG_NOTE);
	B_LogEntry (GE_BecomeTemplar,"Powinienem porozmawiać z Cor Angarem. Może pozwoli mi zostać Świątynnym Strażnikiem.");
};


/*------------------------------------------------------------------------
						Novizenröckchen							
------------------------------------------------------------------------*/

instance  Tpl_1415_Templer_ROCK (C_INFO)
{
	npc				= Tpl_1415_Templer;
	condition		= Tpl_1415_Templer_ROCK_Condition;
	information		= Tpl_1415_Templer_ROCK_Info;
	important		= 0;
	permanent		= 1;
	description		= "Potrzebuję jakiegoś pancerza."; 
};

FUNC int  Tpl_1415_Templer_ROCK_Condition()
{	
	if (Kapitel < 2)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1415_Templer_ROCK_Info()
{
	AI_Output (other, self,"Tpl_1415_Templer_ROCK_Info_15_01"); //Potrzebuję jakiegoś pancerza.
	AI_Output (self, other,"Tpl_1415_Templer_ROCK_Info_13_02"); //Musiałbyś zasłużyć sobie na zbroję Świątynnej Straży, taką jak ta, którą noszę. Ale na początek wystarczy ci szata Nowicjusza.
	AI_Output (other, self,"Tpl_1415_Templer_ROCK_Info_15_03"); //Lepszy rydz niż nic...
	AI_Output (self, other,"Tpl_1415_Templer_ROCK_Info_13_04"); //Oczywiście nie otrzymasz jej za darmo!

	Info_ClearChoices (Tpl_1415_Templer_ROCK);
	Info_Addchoice (Tpl_1415_Templer_ROCK,DIALOG_BACK,Tpl_1415_Templer_ROCK_BACK);
	Info_Addchoice (Tpl_1415_Templer_ROCK,B_BuildBuyArmorString(NAME_TorwachenPsiRock,VALUE_NOV_ARMOR_L),Tpl_1415_Templer_ROCK_BUY);
};

func void Tpl_1415_Templer_ROCK_BACK()
{
	Info_ClearChoices (Tpl_1415_Templer_ROCK);
};

func void Tpl_1415_Templer_ROCK_BUY()
{
	AI_Output (other, self,"Tpl_1415_Templer_ROCK_BUY_15_01"); //Niech będzie, wezmę tę szatę.
	if (Npc_HasItems (hero,ItMiNugget) <  VALUE_NOV_ARMOR_L)
	{
		AI_Output (self, other,"Tpl_1415_Templer_ROCK_BUY_13_02"); //Wróć, gdy będziesz miał wystarczająco dużo rudy.
	}
	else
	{
		AI_Output (self, other,"Tpl_1415_Templer_ROCK_BUY_13_03"); //Ta szata może ocalić ci życie!
		B_GiveInvItems (hero, self, ItMinugget, VALUE_NOV_ARMOR_L);
		CreateInvItem (self, NOV_ARMOR_L);
		B_GiveInvItems (self, hero, NOV_ARMOR_L, 1);
		Tpl_1415_Templer_ROCK.permanent = 0;
	};

};










