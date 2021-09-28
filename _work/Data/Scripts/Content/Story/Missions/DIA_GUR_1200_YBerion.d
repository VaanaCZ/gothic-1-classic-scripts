// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Yberion_EXIT(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 999;
	condition	= Info_Yberion_EXIT_Condition;
	information	= Info_Yberion_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Yberion_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Yberion_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//############################### KAPITEL 1 ###############################


INSTANCE DIA_YBerion_Wache(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= DIA_YBerion_Wache_Condition;
	information	= DIA_YBerion_Wache_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_YBerion_Wache_Condition()
{
	if (Kapitel == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_YBerion_Wache_Info()
{	
	AI_Output			(self,	other,"DIA_YBerion_Wache_12_00"); //Co tady d�l�? Kdo t� sem pustil? Str�e!
	B_IntruderAlert		(self,	other);
	AI_StopProcessInfos	(self);
};

//############################### Kennen? ###############################

INSTANCE DIA_YBerion_Kennen(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= DIA_YBerion_Kennen_Condition;
	information	= DIA_YBerion_Kennen_Info;
	permanent	= 0;
	description = "Bu� pozdraven, mist�e Y�Berione.";
};                       

FUNC INT DIA_YBerion_Kennen_Condition()
{
	if (Kapitel == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_YBerion_Kennen_Info()
{	
	AI_Output (other, self,"DIA_YBerion_Kennen_15_00"); //Bu� pozdraven, mist�e Y�Berione.
	AI_Output (self, other,"DIA_YBerion_Kennen_12_01"); //Ach! Tuhle tv�� zn�m!
	AI_Output (other, self,"DIA_YBerion_Kennen_15_02"); //Vylou�eno. Nikdy jsme se nevid�li.
	AI_Output (self, other,"DIA_YBerion_Kennen_12_03"); //Ale p�ece... Dob�e - co chce�?
};


//############################### KAPITEL 2 ###############################

// ------------------------------ BringFocus ---------------------------
INSTANCE Info_YBerion_BringFocus (C_INFO)
{
	npc			= GUR_1200_Yberion;
	condition	= Info_YBerion_BringFocus_Condition;
	information	= Info_YBerion_BringFocus_Info;
	permanent	= 1;
	description = "Sly�el jsem, �e n�co hled�.";
};


FUNC INT Info_YBerion_BringFocus_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_YBerion_Kennen)	)
	&&	(Npc_GetTrueGuild(hero) != GIL_NONE		)
	&& 	(YBerion_BringFocus		!= LOG_RUNNING	)
	&& 	(YBerion_BringFocus		!= LOG_SUCCESS	)
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_BringFocus_Info()
{
	AI_Output (other, self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01"); //Sly�el jsem, �e n�co hled�.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02"); //To je pravda. Pot�ebujeme kouzeln� ohnisko.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03"); //Poslali jsme novice Nyrase, aby ho p�inesl. Je�t� se ale nevr�til.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04"); //Mohl bys pro m� vyp�trat, co se stalo.
	
	Info_ClearChoices	(Info_YBerion_BringFocus);
	Info_AddChoice		(Info_YBerion_BringFocus,DIALOG_BACK							,	Info_YBerion_BringFocus_BACK);
	Info_AddChoice		(Info_YBerion_BringFocus,"P�inesu to ohnisko zp�tky!",	Info_YBerion_BringFocus_OK);
	Info_AddChoice		(Info_YBerion_BringFocus,"Kde m�m za��t p�trat?",	Info_YBerion_BringFocus_WO);
	Info_AddChoice		(Info_YBerion_BringFocus,"Pro� je to ohnisko tak d�le�it�?",	Info_YBerion_BringFocus_FOKUS);
};

func void Info_YBerion_BringFocus_BACK ()
{
	Info_ClearChoices	(Info_YBerion_BringFocus);
};

func void Info_YBerion_BringFocus_OK ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01"); //P�inesu to ohnisko zp�tky!
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02"); //Vem si tuhle mapu! Je na n� vyzna�ena poloha ohniska.

	B_Story_BringFirstFocus();

	B_LogEntry		(CH2_Focus,"Y�Berion vyslal novice Nyrase, aby p�inesl magick� ohnisko, ten se v�ak je�t� nevr�til. Guru mi dal mapu s vyzna�enou cestou k ohnisku.");
};

func void Info_YBerion_BringFocus_WO ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01"); //Kde m�m za��t p�trat?
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02"); //Vyjdi z t�bora, dej se doprava a pak nahoru na vysok� �tes. Pak pokra�uj lesem, dokud neuvid� mo�e. Tam to ohnisko najde�.
};

func void Info_YBerion_BringFocus_FOKUS ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01"); //Pro� je to ohnisko tak d�le�it�?
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02"); //Je to magick� p�edm�t, kter� soust�e�uje na�i duchovn� s�lu.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03"); //Je to jeden z p�ti ohniskov�ch kamen�, kter� pou�ili m�gov� ke vzty�en� Bari�ry.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04"); //V jedn� vidin� jsem vid�l, jak vyu��v�me s�lu toho ohniska.
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05"); //To byla docela zaj�mav� vidina.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06"); //Moje vidina byla znamen�m od Sp��e. M��eme k n�mu doj�t pomoc� toho ohniska!
};

// ------------------------------ RUNNING ----------------------------------
INSTANCE Info_YBerion_BringFocus_RUNNING (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_BringFocus_RUNNING_Condition;
	information	= Info_YBerion_BringFocus_RUNNING_Info;
	permanent	= 0;
	description	= "Po��d to ohnisko nem��u naj�t.";
};                       

FUNC INT Info_YBerion_BringFocus_RUNNING_Condition()
{
	if  ( YBerion_BringFocus == LOG_RUNNING ) && ( !Npc_HasItems ( hero, Focus_1 ))
	{
		return TRUE;
	};
};

FUNC VOID Info_YBerion_BringFocus_RUNNING_Info()
{	
	AI_Output (other, self,"Info_YBerion_BringFocus_RUNNING_15_01"); //Po��d to ohnisko nem��u naj�t.
	AI_Output (self, other,"Info_YBerion_BringFocus_RUNNING_12_02"); //Tak hledej. Sp�� t� povede.
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_YBerion_BringFocus_Success (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_BringFocus_Success_Condition;
	information	= Info_YBerion_BringFocus_Success_Info;
	permanent	= 0;
	description	= "Na�el jsem to ohnisko.";
};                       

FUNC INT Info_YBerion_BringFocus_Success_Condition()
{
	if  ( YBerion_BringFocus == LOG_RUNNING ) && ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_BringFocus_Success_Info()
{	
	AI_Output			(other, self,"Info_YBerion_BringFocus_Success_15_01"); //Na�el jsem to ohnisko.
	AI_Output			(self, other,"Info_YBerion_BringFocus_Success_12_02"); //V�born�. Nesm�rn� jsi n�m pomohl.
	AI_Output			(self, other,"Info_YBerion_BringFocus_Success_12_03"); //Te� dej to ohnisko zp�tky Corovi Kalomovi. Ten v�, co je t�eba ud�lat.
	if	(Kalom_TalkedTo == FALSE)
	{
		AI_Output		(other, self,"Info_YBerion_BringFocus_Success_15_04"); //Kde najdu toho Cora Kaloma?
		AI_Output		(self, other,"Info_YBerion_BringFocus_Success_12_05"); //V�t�inu �asu tr�v� ve sv� alchymistick� d�ln� v horn� sekci m�stk�.
		AI_Output		(self, other,"Info_YBerion_BringFocus_Success_12_06"); //Zeptej se u vchodu do t�bora Lestera... ten �asto prov�d� nov��ky po t�boru.
		B_LogEntry		(CH2_Focus,"Y�Berion mi �ekl, abych to ohnisko p�edal dal��mu guru jm�nem Cor Kalom. Cor Kalom tr�v� cel� dny ve sv� alchymistick� d�ln�."); 
	}
	else
	{
		B_LogEntry		(CH2_Focus,"Y�Berion mi �ekl, abych to ohnisko p�edal  Cor Kalomovi. Jak� pot�en�, shledat se zase s t�m p��jemn�m chlap�kem.");
	};

	Tpl_1406_Templer.aivar[AIV_PASSGATE] = TRUE;		//T�rwache vor dem Labor

	YBerion_BringFocus = LOG_SUCCESS;
	B_GiveXP			(XP_BringFocusToYBerion);
};

// ------------------------------ NYRAS ----------------------------------
INSTANCE Info_YBerion_NYRAS (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_NYRAS_Condition;
	information	= Info_YBerion_NYRAS_Info;
	permanent	= 0;
	description	= "Novic Nyras ze��lel!";
};                       

FUNC INT Info_YBerion_NYRAS_Condition()
{
	if  ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_NYRAS_Info()
{	
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_01"); //Novic Nyras ze��lel!
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_02"); //��kal, �e mluvil se Sp��em, kter� si ho zvolil za sv�ho pomocn�ka!
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_03"); //Pak m� napadl a pokusil se m� zab�t!
	AI_Output			(self, other,"Info_YBerion_NYRAS_12_04"); //Sp��ova moc je tak nesm�rn�, �e nep�ipraven� du�e p�ivede k zoufalstv�!
	AI_Output			(self, other,"Info_YBerion_NYRAS_12_05"); //Jenom my, Guru, jsme l�ty str�ven�mi v meditac�ch dos�hli takov� duchovn� s�ly, kter� dok�e un�st s�lu hlasu v�emohouc�ho Sp��e!
};

// ------------------------------ BELOHNUNG ----------------------------------
instance  GUR_1200_Yberion_EARN (C_INFO)
{
	npc				= GUR_1200_Yberion;
	condition		= GUR_1200_Yberion_EARN_Condition;
	information		= GUR_1200_Yberion_EARN_Info;
	important		= 0;
	permanent		= 0;
	description		= "A co takhle n�jak� odm�na?"; 
};

FUNC int  GUR_1200_Yberion_EARN_Condition()
{	
	if ( YBerion_BringFocus == LOG_SUCCESS) && ( Npc_GetTrueGuild (hero)!= GIL_NOV ) && ( C_IsChapter(2) )
	{
		return 1;
	};

};
FUNC void  GUR_1200_Yberion_EARN_Info()
{
	AI_Output				(other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //A co takhle n�jakou odm�nu?
	AI_Output				(self, other,"GUR_1200_Yberion_EARN_Info_12_02"); //Proto�e nejsi �lenem na�eho Bratrstva, odm�n�m t�.
	AI_Output				(self, other,"GUR_1200_Yberion_EARN_Info_12_03"); //Vezmi si tento amulet na znamen� m� vd��nosti.
	CreateInvItem	    (self, Schutzamulett_Feuer);
	B_GiveInvItems	    (self, hero, Schutzamulett_Feuer, 1);
};  



//############################### KAPITEL 3 ###############################
//SPIELER HAT DIE HEILKR�UTER ZU COR ANGAR GEBRACHT
//YBERION WACHT AUF UND STIRBT
/*
instance GUR_1200_Yberion_LASTWORDS (C_INFO)
{
	npc				= GUR_1200_Yberion;
	condition		= GUR_1200_Yberion_LASTWORDS_Condition;
	information		= GUR_1200_Yberion_LASTWORDS_Info;
	important		= 1;
	permanent		= 0;

};

FUNC int GUR_1200_Yberion_LASTWORDS_Condition()
{	
	if ( Npc_KnowsInfo (hero,Info_CorAngar_FindHerb_Success))
	{
		return 1;
	};

};
FUNC void  GUR_1200_Yberion_LASTWORDS_Info()
{
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_01"); //Das Ende...der Schl�fer...ich sah...IHN!
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_02"); //Wer...?...du bist es, gut. H�r mir zu....
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_03"); //Du darfst den Schl�fer nicht wecken,... die Wassermagier, ...
	AI_Output (other, self,"GUR_1200_Yberion_LASTWORDS_Info_15_04"); //Was ist mit den Wassermagiern?
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_05"); //Du musst zu den Wassermagiern gehen. Sie werden es schaffen, hier rauszukommen.
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_06"); //Der Schl�fer...Ich sah ihn. Er ist ein ...ein ....D�mon!
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_07"); //Wenn du die Barriere noch immer vernichten willst,... geh zum Neuen Lager. Berichte ihnen vom Fokus. Sag ihnen...
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_08"); //...sag ihnen das wir herausgefunden haben, wie sich die Foki aufladen lassen, sie sollen...sollen die Barriere vernichten......ihr m�sst ....
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_09"); //...das B�se....darf nicht erwachen .... 
	
	
	
};  
// ------------------------------  ----------------------------------
*/
