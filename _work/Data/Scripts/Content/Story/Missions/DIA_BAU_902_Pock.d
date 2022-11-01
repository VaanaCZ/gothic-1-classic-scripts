// ************************************************************
// 			  				   EXIT 
// ************************************************************
	var int Pock_ForgetAll;
// ************************************************************

INSTANCE DIA_Pock_EXIT (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 999;
	condition	= DIA_Pock_EXIT_Condition;
	information	= DIA_Pock_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Pock_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Pock_EXIT_Info()
{	
	Pock_ForgetAll = TRUE;
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Pock_Wasser(C_INFO) // E1
{
	npc			= Bau_902_Pock;
	nr			= 800;
	condition	= Info_Pock_Wasser_Condition;
	information	= Info_Pock_Wasser_Info;
	permanent	= 1;
	description = "Przysyła mnie Lewus. Mam dla ciebie trochę wody.";
};                       

FUNC INT Info_Pock_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Pock_Wasser_Info()
{
	AI_Output(other,self,"Info_Pock_Wasser_15_00"); //Przysyła mnie Lewus. Mam dla ciebie trochę wody.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		AI_Output(self,other,"Info_Pock_Wasser_04_01"); //Dzięki, chłopcze. Piękne dzięki.
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Pock_Wasser_NOWATER_04_00"); //Ale nic ci już nie zostało! Trudno, wezmę trochę od pozostałych.
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Pock_Hello (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_Hello_Condition;
	information	= DIA_Pock_Hello_Info;
	permanent	= 0;
	description	= "Cześć! Jestem tu nowy.";
};                       

FUNC INT DIA_Pock_Hello_Condition()
{
	if (Pock_ForgetAll == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_Hello_Info()
{	
	AI_Output (other, self,"DIA_Pock_Hello_15_00"); //Cześć! Jestem tu nowy.
	AI_Output (self, other,"DIA_Pock_Hello_04_01"); //Miło zobaczyć nową twarz.
	AI_Output (other, self,"DIA_Pock_Hello_15_02"); //Pewnie jesteś tu już od dawna?
	AI_Output (self, other,"DIA_Pock_Hello_04_03"); //Święta racja, chłopcze. Byłem jednym z pierwszych, którzy tu trafili.
};

// ************************************************************
// 						Weißt ne Menge
// ************************************************************

INSTANCE DIA_Pock_KnowMuch (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_KnowMuch_Condition;
	information	= DIA_Pock_KnowMuch_Info;
	permanent	= 0;
	description	= "W takim razie na pewno dużo wiesz o tym miejscu?";
};                       

FUNC INT DIA_Pock_KnowMuch_Condition()
{
	if ( (Pock_ForgetAll==FALSE) && Npc_KnowsInfo(hero,DIA_Pock_Hello) )
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_KnowMuch_Info()
{	
	AI_Output (other, self,"DIA_Pock_KnowMuch_15_00"); //W takim razie na pewno dużo wiesz o tym miejscu?
	AI_Output (self, other,"DIA_Pock_KnowMuch_04_01"); //Co nieco. Większość czasu spędzam tutaj - na polu.
	AI_Output (self, other,"DIA_Pock_KnowMuch_04_02"); //Pewnie dlatego udało mi się tak długo przeżyć. Dostajemy sporo ryżu i trochę gorzałki. Może nie jest to wiele, ale mi wystarczy.
};

// ************************************************************
// 							Warum hier?
// ************************************************************

INSTANCE DIA_Pock_WhyJail (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 2;
	condition	= DIA_Pock_WhyJail_Condition;
	information	= DIA_Pock_WhyJail_Info;
	permanent	= 0;
	description	= "Dlaczego tu trafiłeś?";
};                       

FUNC INT DIA_Pock_WhyJail_Condition()
{
	if ( (Pock_ForgetAll==FALSE) && Npc_KnowsInfo(hero,DIA_Pock_Hello) )
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_WhyJail_Info()
{	
	AI_Output (other, self,"DIA_Pock_WhyJail_15_00"); //Dlaczego tu trafiłeś?
	AI_Output (self, other,"DIA_Pock_WhyJail_04_01"); //Podatki, chłopcze. Podatki! Moja chata była równie pusta jak mój żołądek i po prostu nie mogłem dłużej płacić!
	AI_Output (self, other,"DIA_Pock_WhyJail_04_02"); //No i pewnego dnia schwytali mnie królewscy żołnierze i przywlekli mnie tutaj. Prawdę mówiąc, na zewnątrz wcale nie było mi lepiej. Tutaj przynajmniej nie głoduję.
	AI_Output (self, other,"DIA_Pock_WhyJail_04_03"); //Wcześniej zawsze płaciłem podatki - przez całe życie! Ale dla tego sukinsyna w koronie to nie był żaden argument!
};

// ************************************************************
// 						PERM (Forget)
// ************************************************************

INSTANCE DIA_Pock_ForgotAll (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_ForgotAll_Condition;
	information	= DIA_Pock_ForgotAll_Info;
	permanent	= 1;
	description	= "Wszystko w porządku?";
};                       

FUNC INT DIA_Pock_ForgotAll_Condition()
{
	if (Pock_ForgetAll == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_ForgotAll_Info()
{	
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_00"); //Wszystko w porządku?
	AI_Output (self, other,"DIA_Pock_ForgotAll_04_01"); //Miło zobaczyć nową twarz.
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_02"); //Czekaj! My już kiedyś rozmawialiśmy!
	AI_Output (self, other,"DIA_Pock_ForgotAll_04_03"); //Nie! To niemożliwe. Widzę cię pierwszy raz w życiu!
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_04"); //Jasne...
};

