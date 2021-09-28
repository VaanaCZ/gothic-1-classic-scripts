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
	AI_Output			(self,	other,"DIA_YBerion_Wache_12_00"); //Co tady dìláš? Kdo tì sem pustil? Stráže!
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
	description = "Buï pozdraven, mistøe Y´Berione.";
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
	AI_Output (other, self,"DIA_YBerion_Kennen_15_00"); //Buï pozdraven, mistøe Y´Berione.
	AI_Output (self, other,"DIA_YBerion_Kennen_12_01"); //Ach! Tuhle tváø znám!
	AI_Output (other, self,"DIA_YBerion_Kennen_15_02"); //Vylouèeno. Nikdy jsme se nevidìli.
	AI_Output (self, other,"DIA_YBerion_Kennen_12_03"); //Ale pøece... Dobøe - co chceš?
};


//############################### KAPITEL 2 ###############################

// ------------------------------ BringFocus ---------------------------
INSTANCE Info_YBerion_BringFocus (C_INFO)
{
	npc			= GUR_1200_Yberion;
	condition	= Info_YBerion_BringFocus_Condition;
	information	= Info_YBerion_BringFocus_Info;
	permanent	= 1;
	description = "Slyšel jsem, že nìco hledáš.";
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
	AI_Output (other, self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01"); //Slyšel jsem, že nìco hledáš.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02"); //To je pravda. Potøebujeme kouzelné ohnisko.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03"); //Poslali jsme novice Nyrase, aby ho pøinesl. Ještì se ale nevrátil.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04"); //Mohl bys pro mì vypátrat, co se stalo.
	
	Info_ClearChoices	(Info_YBerion_BringFocus);
	Info_AddChoice		(Info_YBerion_BringFocus,DIALOG_BACK							,	Info_YBerion_BringFocus_BACK);
	Info_AddChoice		(Info_YBerion_BringFocus,"Pøinesu to ohnisko zpátky!",	Info_YBerion_BringFocus_OK);
	Info_AddChoice		(Info_YBerion_BringFocus,"Kde mám zaèít pátrat?",	Info_YBerion_BringFocus_WO);
	Info_AddChoice		(Info_YBerion_BringFocus,"Proè je to ohnisko tak dùležité?",	Info_YBerion_BringFocus_FOKUS);
};

func void Info_YBerion_BringFocus_BACK ()
{
	Info_ClearChoices	(Info_YBerion_BringFocus);
};

func void Info_YBerion_BringFocus_OK ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01"); //Pøinesu to ohnisko zpátky!
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02"); //Vem si tuhle mapu! Je na ní vyznaèena poloha ohniska.

	B_Story_BringFirstFocus();

	B_LogEntry		(CH2_Focus,"Y´Berion vyslal novice Nyrase, aby pøinesl magické ohnisko, ten se však ještì nevrátil. Guru mi dal mapu s vyznaèenou cestou k ohnisku.");
};

func void Info_YBerion_BringFocus_WO ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01"); //Kde mám zaèít pátrat?
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02"); //Vyjdi z tábora, dej se doprava a pak nahoru na vysoký útes. Pak pokraèuj lesem, dokud neuvidíš moøe. Tam to ohnisko najdeš.
};

func void Info_YBerion_BringFocus_FOKUS ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01"); //Proè je to ohnisko tak dùležité?
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02"); //Je to magický pøedmìt, který soustøeïuje naši duchovní sílu.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03"); //Je to jeden z pìti ohniskových kamenù, které použili mágové ke vztyèení Bariéry.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04"); //V jedné vidinì jsem vidìl, jak využíváme sílu toho ohniska.
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05"); //To byla docela zajímavá vidina.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06"); //Moje vidina byla znamením od Spáèe. Mùžeme k nìmu dojít pomocí toho ohniska!
};

// ------------------------------ RUNNING ----------------------------------
INSTANCE Info_YBerion_BringFocus_RUNNING (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_BringFocus_RUNNING_Condition;
	information	= Info_YBerion_BringFocus_RUNNING_Info;
	permanent	= 0;
	description	= "Poøád to ohnisko nemùžu najít.";
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
	AI_Output (other, self,"Info_YBerion_BringFocus_RUNNING_15_01"); //Poøád to ohnisko nemùžu najít.
	AI_Output (self, other,"Info_YBerion_BringFocus_RUNNING_12_02"); //Tak hledej. Spáè tì povede.
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_YBerion_BringFocus_Success (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_BringFocus_Success_Condition;
	information	= Info_YBerion_BringFocus_Success_Info;
	permanent	= 0;
	description	= "Našel jsem to ohnisko.";
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
	AI_Output			(other, self,"Info_YBerion_BringFocus_Success_15_01"); //Našel jsem to ohnisko.
	AI_Output			(self, other,"Info_YBerion_BringFocus_Success_12_02"); //Výbornì. Nesmírnì jsi nám pomohl.
	AI_Output			(self, other,"Info_YBerion_BringFocus_Success_12_03"); //Teï dej to ohnisko zpátky Corovi Kalomovi. Ten ví, co je tøeba udìlat.
	if	(Kalom_TalkedTo == FALSE)
	{
		AI_Output		(other, self,"Info_YBerion_BringFocus_Success_15_04"); //Kde najdu toho Cora Kaloma?
		AI_Output		(self, other,"Info_YBerion_BringFocus_Success_12_05"); //Vìtšinu èasu tráví ve své alchymistické dílnì v horní sekci mùstkù.
		AI_Output		(self, other,"Info_YBerion_BringFocus_Success_12_06"); //Zeptej se u vchodu do tábora Lestera... ten èasto provádí nováèky po táboru.
		B_LogEntry		(CH2_Focus,"Y´Berion mi øekl, abych to ohnisko pøedal dalšímu guru jménem Cor Kalom. Cor Kalom tráví celé dny ve své alchymistické dílnì."); 
	}
	else
	{
		B_LogEntry		(CH2_Focus,"Y´Berion mi øekl, abych to ohnisko pøedal  Cor Kalomovi. Jaké potìšení, shledat se zase s tím pøíjemným chlapíkem.");
	};

	Tpl_1406_Templer.aivar[AIV_PASSGATE] = TRUE;		//Türwache vor dem Labor

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
	description	= "Novic Nyras zešílel!";
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
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_01"); //Novic Nyras zešílel!
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_02"); //Øíkal, že mluvil se Spáèem, který si ho zvolil za svého pomocníka!
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_03"); //Pak mì napadl a pokusil se mì zabít!
	AI_Output			(self, other,"Info_YBerion_NYRAS_12_04"); //Spáèova moc je tak nesmírná, že nepøipravené duše pøivede k zoufalství!
	AI_Output			(self, other,"Info_YBerion_NYRAS_12_05"); //Jenom my, Guru, jsme léty strávenými v meditacích dosáhli takové duchovní síly, která dokáže unést sílu hlasu všemohoucího Spáèe!
};

// ------------------------------ BELOHNUNG ----------------------------------
instance  GUR_1200_Yberion_EARN (C_INFO)
{
	npc				= GUR_1200_Yberion;
	condition		= GUR_1200_Yberion_EARN_Condition;
	information		= GUR_1200_Yberion_EARN_Info;
	important		= 0;
	permanent		= 0;
	description		= "A co takhle nìjaká odmìna?"; 
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
	AI_Output				(other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //A co takhle nìjakou odmìnu?
	AI_Output				(self, other,"GUR_1200_Yberion_EARN_Info_12_02"); //Protože nejsi èlenem našeho Bratrstva, odmìním tì.
	AI_Output				(self, other,"GUR_1200_Yberion_EARN_Info_12_03"); //Vezmi si tento amulet na znamení mé vdìènosti.
	CreateInvItem	    (self, Schutzamulett_Feuer);
	B_GiveInvItems	    (self, hero, Schutzamulett_Feuer, 1);
};  



//############################### KAPITEL 3 ###############################
//SPIELER HAT DIE HEILKRÄUTER ZU COR ANGAR GEBRACHT
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
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_01"); //Das Ende...der Schläfer...ich sah...IHN!
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_02"); //Wer...?...du bist es, gut. Hör mir zu....
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_03"); //Du darfst den Schläfer nicht wecken,... die Wassermagier, ...
	AI_Output (other, self,"GUR_1200_Yberion_LASTWORDS_Info_15_04"); //Was ist mit den Wassermagiern?
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_05"); //Du musst zu den Wassermagiern gehen. Sie werden es schaffen, hier rauszukommen.
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_06"); //Der Schläfer...Ich sah ihn. Er ist ein ...ein ....Dämon!
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_07"); //Wenn du die Barriere noch immer vernichten willst,... geh zum Neuen Lager. Berichte ihnen vom Fokus. Sag ihnen...
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_08"); //...sag ihnen das wir herausgefunden haben, wie sich die Foki aufladen lassen, sie sollen...sollen die Barriere vernichten......ihr müsst ....
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_09"); //...das Böse....darf nicht erwachen .... 
	
	
	
};  
// ------------------------------  ----------------------------------
*/
