// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Jesse_Exit (C_INFO)
{
	npc			= Vlk_564_Jesse;
	nr			= 999;
	condition	= DIA_Jesse_Exit_Condition;
	information	= DIA_Jesse_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jesse_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Jesse_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Hi
// **************************************************

INSTANCE DIA_Jesse_Hallo (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Hallo_Condition;
	information		= DIA_Jesse_Hallo_Info;
	permanent		= 0;
	description		= "Co słychać?";
};

FUNC INT DIA_Jesse_Hallo_Condition()
{	
	if (!Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jesse_Hallo_15_00"); //Co słychać?
	AI_Output (self, other,"DIA_Jesse_Hallo_03_01"); //Jesteś tu nowy, co? Zapamiętaj sobie, żeby nigdy nie włazić w drogę Strażnikom.
	AI_Output (self, other,"DIA_Jesse_Hallo_03_02"); //Jak zażądają od ciebie pieniędzy - zapłać. Inaczej ściągniesz sobie na głowę połowę Obozu.
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

INSTANCE DIA_Jesse_Warn (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Warn_Condition;
	information		= DIA_Jesse_Warn_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Jesse_Warn_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Herek_Bully)) && (Herek_ProtectionBully==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Warn_Info()
{
	AI_Output (self, other,"DIA_Jesse_Warn_03_00"); //Hej, ty! Słyszałem, że nie chcesz płacić Bloodwynowi za ochronę!
	AI_Output (other, self,"DIA_Jesse_Warn_15_01"); //Czego chcesz?
	AI_Output (self, other,"DIA_Jesse_Warn_03_02"); //Chcę cię ostrzec! Bloodwyn zapłacił paru ludziom, żeby cię załatwili.
	AI_Output (self, other,"DIA_Jesse_Warn_03_03"); //Widziałem, jak rozmawiał z paroma osobami, na przykład z tamtym gościem, Herekiem. Bóg wie, kogo jeszcze wynajął!
	AI_Output (other, self,"DIA_Jesse_Warn_15_04"); //Jeśli chodzi o Hereka, to twoje ostrzeżenie jest nieco spóźnione.
	AI_Output (self, other,"DIA_Jesse_Warn_03_05"); //Na pewno rozmawiał z kimś jeszcze, możesz mi wierzyć. Uważaj na siebie.
};

// **************************************************
// 				MISSION Pay 4 Me
// **************************************************
	
// ************************************************************

INSTANCE DIA_Jesse_Mission (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Mission_Condition;
	information		= DIA_Jesse_Mission_Info;
	permanent		= 0;
	description		= "Dlaczego opowiedziałeś mi o Bloodwynie?";
};

FUNC INT DIA_Jesse_Mission_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Jesse_Mission))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Mission_Info()
{
	AI_Output (other, self,"DIA_Jesse_Mission_15_00"); //Dlaczego opowiedziałeś mi o Bloodwynie?
	AI_Output (self, other,"DIA_Jesse_Mission_03_01"); //Bo za przysługę należy się przysługa. Jesteś mądrym chłopcem. Chyba się rozumiemy?
	AI_Output (self, other,"DIA_Jesse_Mission_03_02"); //JA wyświadczyłem ci właśnie przysługę, więc teraz TWOJA kolej, żeby mi się odwdzięczyć!
	
	Info_ClearChoices	(DIA_Jesse_Mission );
	Info_AddChoice		(DIA_Jesse_Mission,"Nie jestem ci nic winien!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice		(DIA_Jesse_Mission,"Co dokładnie masz na myśli?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output (other, self,"DIA_Jesse_Mission_ForgetIt_15_00"); //Nie jestem ci nic winien!
	AI_Output (self, other,"DIA_Jesse_Mission_ForgetIt_03_01"); //Więc nie mamy o czym mówić!
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
	AI_StopProcessInfos	(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output (other, self,"DIA_Jesse_Mission_What_15_00"); //Co dokładnie masz na myśli?
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_01"); //Nie mam już rudy, a Bloodwyn i mnie zaczyna dobierać się do tyłka.
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_02"); //Pomogłem ci, więc mógłbyś zapłacić za mnie te 10 bryłek, które zalegam, co? Powiedz mu, że to ode mnie!
	Npc_SetTrueGuild(self,GIL_NONE); //KEIN Schutzgeld
	
	Info_AddChoice		(DIA_Jesse_Mission,"Ja, miałbym zapłacić za ciebie? Chyba śnisz!",DIA_Jesse_Mission_NO);
	Info_AddChoice		(DIA_Jesse_Mission,"Zobaczę co się da zrobić.",DIA_Jesse_Mission_YES);
};
//-------------------------------
func void DIA_Jesse_Mission_YES()
{
	AI_Output (other, self,"DIA_Jesse_Mission_YES_15_00"); //Zobaczę co się da zrobić.
	AI_Output (self, other,"DIA_Jesse_Mission_YES_03_01"); //Dzięki, stary! Ocaliłeś mi życie! Daj mi znać, jak już wszystko załatwisz, dobra?
	Jesse_PayForMe = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Jesse_Mission );
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output (other, self,"DIA_Jesse_Mission_NO_15_00"); //Ja, miałbym zapłacić za ciebie? Chyba śnisz!
	AI_Output (self, other,"DIA_Jesse_Mission_NO_03_01"); //Widzę, że myliłem się co do ciebie. W przyszłości nie oczekuj ode mnie pomocy.
	//MUSS SO - Mike
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
};


// **************************************************
// 					RUNNING / SUCCESS
// **************************************************

INSTANCE DIA_Jesse_MisSuccess (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_MisSuccess_Condition;
	information		= DIA_Jesse_MisSuccess_Info;
	permanent		= 0;
	description		= "Zapłaciłem Bloodwynowi!";
};

FUNC INT DIA_Jesse_MisSuccess_Condition()
{	
	if (Jesse_PayForMe == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_MisSuccess_Info()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_15_00"); //Zapłaciłem Bloodwynowi!
	AI_Output (self, other,"DIA_Jesse_MisSuccess_03_01"); //Tak? To świetnie! No to teraz jesteśmy kwita.
	Npc_SetTrueGuild(self,GIL_VLK); //Schutzgeld GEZAHLT
	
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
	Info_AddChoice		(DIA_Jesse_MisSuccess,"COOO??? Wydałem 10 bryłek na cynk o którym i tak już wiedziałem?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice		(DIA_Jesse_MisSuccess,"Dokładnie. Ręka rękę myje.",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //COOO??? Wydałem 10 bryłek na cynk o którym i tak już wiedziałem?
	AI_Output (self, other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Na to wygląda.
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Ok_15_00"); //Dokładnie. Ręka rękę myje.
};

//a) <Herek tot>
//b) Herek wird versuchen, 


/* */
