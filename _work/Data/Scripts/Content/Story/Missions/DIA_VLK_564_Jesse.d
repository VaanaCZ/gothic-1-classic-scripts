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
	description		= "Co s�ycha�?";
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
	AI_Output (other, self,"DIA_Jesse_Hallo_15_00"); //Co s�ycha�?
	AI_Output (self, other,"DIA_Jesse_Hallo_03_01"); //Jeste� tu nowy, co? Zapami�taj sobie, �eby nigdy nie w�azi� w drog� Stra�nikom.
	AI_Output (self, other,"DIA_Jesse_Hallo_03_02"); //Jak za��daj� od ciebie pieni�dzy - zap�a�. Inaczej �ci�gniesz sobie na g�ow� po�ow� Obozu.
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
	AI_Output (self, other,"DIA_Jesse_Warn_03_00"); //Hej, ty! S�ysza�em, �e nie chcesz p�aci� Bloodwynowi za ochron�!
	AI_Output (other, self,"DIA_Jesse_Warn_15_01"); //Czego chcesz?
	AI_Output (self, other,"DIA_Jesse_Warn_03_02"); //Chc� ci� ostrzec! Bloodwyn zap�aci� paru ludziom, �eby ci� za�atwili.
	AI_Output (self, other,"DIA_Jesse_Warn_03_03"); //Widzia�em, jak rozmawia� z paroma osobami, na przyk�ad z tamtym go�ciem, Herekiem. B�g wie, kogo jeszcze wynaj��!
	AI_Output (other, self,"DIA_Jesse_Warn_15_04"); //Je�li chodzi o Hereka, to twoje ostrze�enie jest nieco sp�nione.
	AI_Output (self, other,"DIA_Jesse_Warn_03_05"); //Na pewno rozmawia� z kim� jeszcze, mo�esz mi wierzy�. Uwa�aj na siebie.
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
	description		= "Dlaczego opowiedzia�e� mi o Bloodwynie?";
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
	AI_Output (other, self,"DIA_Jesse_Mission_15_00"); //Dlaczego opowiedzia�e� mi o Bloodwynie?
	AI_Output (self, other,"DIA_Jesse_Mission_03_01"); //Bo za przys�ug� nale�y si� przys�uga. Jeste� m�drym ch�opcem. Chyba si� rozumiemy?
	AI_Output (self, other,"DIA_Jesse_Mission_03_02"); //JA wy�wiadczy�em ci w�a�nie przys�ug�, wi�c teraz TWOJA kolej, �eby mi si� odwdzi�czy�!
	
	Info_ClearChoices	(DIA_Jesse_Mission );
	Info_AddChoice		(DIA_Jesse_Mission,"Nie jestem ci nic winien!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice		(DIA_Jesse_Mission,"Co dok�adnie masz na my�li?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output (other, self,"DIA_Jesse_Mission_ForgetIt_15_00"); //Nie jestem ci nic winien!
	AI_Output (self, other,"DIA_Jesse_Mission_ForgetIt_03_01"); //Wi�c nie mamy o czym m�wi�!
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
	AI_StopProcessInfos	(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output (other, self,"DIA_Jesse_Mission_What_15_00"); //Co dok�adnie masz na my�li?
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_01"); //Nie mam ju� rudy, a Bloodwyn i mnie zaczyna dobiera� si� do ty�ka.
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_02"); //Pomog�em ci, wi�c m�g�by� zap�aci� za mnie te 10 bry�ek, kt�re zalegam, co? Powiedz mu, �e to ode mnie!
	Npc_SetTrueGuild(self,GIL_NONE); //KEIN Schutzgeld
	
	Info_AddChoice		(DIA_Jesse_Mission,"Ja, mia�bym zap�aci� za ciebie? Chyba �nisz!",DIA_Jesse_Mission_NO);
	Info_AddChoice		(DIA_Jesse_Mission,"Zobacz� co si� da zrobi�.",DIA_Jesse_Mission_YES);
};
//-------------------------------
func void DIA_Jesse_Mission_YES()
{
	AI_Output (other, self,"DIA_Jesse_Mission_YES_15_00"); //Zobacz� co si� da zrobi�.
	AI_Output (self, other,"DIA_Jesse_Mission_YES_03_01"); //Dzi�ki, stary! Ocali�e� mi �ycie! Daj mi zna�, jak ju� wszystko za�atwisz, dobra?
	Jesse_PayForMe = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Jesse_Mission );
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output (other, self,"DIA_Jesse_Mission_NO_15_00"); //Ja, mia�bym zap�aci� za ciebie? Chyba �nisz!
	AI_Output (self, other,"DIA_Jesse_Mission_NO_03_01"); //Widz�, �e myli�em si� co do ciebie. W przysz�o�ci nie oczekuj ode mnie pomocy.
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
	description		= "Zap�aci�em Bloodwynowi!";
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
	AI_Output (other, self,"DIA_Jesse_MisSuccess_15_00"); //Zap�aci�em Bloodwynowi!
	AI_Output (self, other,"DIA_Jesse_MisSuccess_03_01"); //Tak? To �wietnie! No to teraz jeste�my kwita.
	Npc_SetTrueGuild(self,GIL_VLK); //Schutzgeld GEZAHLT
	
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
	Info_AddChoice		(DIA_Jesse_MisSuccess,"COOO??? Wyda�em 10 bry�ek na cynk o kt�rym i tak ju� wiedzia�em?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice		(DIA_Jesse_MisSuccess,"Dok�adnie. R�ka r�k� myje.",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //COOO??? Wyda�em 10 bry�ek na cynk o kt�rym i tak ju� wiedzia�em?
	AI_Output (self, other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Na to wygl�da.
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Ok_15_00"); //Dok�adnie. R�ka r�k� myje.
};

//a) <Herek tot>
//b) Herek wird versuchen, 


/* */
