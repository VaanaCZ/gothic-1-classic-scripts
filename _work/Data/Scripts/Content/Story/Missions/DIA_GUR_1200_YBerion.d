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
	AI_Output			(self,	other,"DIA_YBerion_Wache_12_00"); //Co tu robisz? Kto ciê tu wpuœci³? Stra¿!
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
	description = "Witaj, Mistrzu Y'Berionie.";
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
	AI_Output (other, self,"DIA_YBerion_Kennen_15_00"); //Witaj, Mistrzu Y'Berionie.
	AI_Output (self, other,"DIA_YBerion_Kennen_12_01"); //Ach! Przypominam sobie twoj¹ twarz.
	AI_Output (other, self,"DIA_YBerion_Kennen_15_02"); //To niemo¿liwe. Nigdy wczeœniej siê nie spotkaliœmy.
	AI_Output (self, other,"DIA_YBerion_Kennen_12_03"); //Ale myœla³em... Ach, czego sobie ¿yczysz?
};


//############################### KAPITEL 2 ###############################

// ------------------------------ BringFocus ---------------------------
INSTANCE Info_YBerion_BringFocus (C_INFO)
{
	npc			= GUR_1200_Yberion;
	condition	= Info_YBerion_BringFocus_Condition;
	information	= Info_YBerion_BringFocus_Info;
	permanent	= 1;
	description = "S³ysza³em, ¿e czegoœ szukasz.";
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
	AI_Output (other, self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01"); //S³ysza³em, ¿e czegoœ szukasz.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02"); //Zgadza siê. Potrzebujemy magicznego kamienia ogniskuj¹cego.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03"); //Mia³ go dostarczyæ jeden z Nowicjuszy, niejaki Nyras, ale do tej pory nie wróci³.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04"); //Móg³byœ dowiedzieæ siê co siê z nim dzieje!
	
	Info_ClearChoices	(Info_YBerion_BringFocus);
	Info_AddChoice		(Info_YBerion_BringFocus,DIALOG_BACK							,	Info_YBerion_BringFocus_BACK);
	Info_AddChoice		(Info_YBerion_BringFocus,"Przyniosê ci ten kamieñ ogniskuj¹cy!",	Info_YBerion_BringFocus_OK);
	Info_AddChoice		(Info_YBerion_BringFocus,"Gdzie powinienem zacz¹æ poszukiwania?",	Info_YBerion_BringFocus_WO);
	Info_AddChoice		(Info_YBerion_BringFocus,"Dlaczego ten kamieñ jest taki wa¿ny?",	Info_YBerion_BringFocus_FOKUS);
};

func void Info_YBerion_BringFocus_BACK ()
{
	Info_ClearChoices	(Info_YBerion_BringFocus);
};

func void Info_YBerion_BringFocus_OK ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01"); //Przyniosê ci ten kamieñ ogniskuj¹cy!
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02"); //WeŸ tê mapê. Zaznaczono na niej po³o¿enie kamienia.

	B_Story_BringFirstFocus();

	B_LogEntry		(CH2_Focus,"Y'Berion wys³a³ Nyrasa na poszukiwania kamienia ogniskuj¹cego. Niestety, Nowicjusz jeszcze nie powróci³. Guru da³ mi mapê, która wskazuje po³o¿enie artefaktu.");
};

func void Info_YBerion_BringFocus_WO ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01"); //Gdzie powinienem zacz¹æ poszukiwania?
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02"); //Po wyjœciu z Obozu skrêæ w prawo i wejdŸ na strome zbocze. IdŸ przez las, dopóki nie dojdziesz nad brzeg morza. Tam znajdziesz kamieñ ogniskuj¹cy.
};

func void Info_YBerion_BringFocus_FOKUS ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01"); //Dlaczego ten kamieñ jest taki wa¿ny?
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02"); //Ten magiczny artefakt zogniskuje duchow¹ si³ê naszych braci.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03"); //To jeden z piêciu kamieni ogniskuj¹cych, które pos³u¿y³y magom do utworzenia Bariery.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04"); //Jedna z moich wizji objawi³a mi zastosowanie kamienia.
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05"); //To musia³a byæ niezwykle ciekawa wizja.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06"); //Zes³a³ mi j¹ sam Œni¹cy! Dziêki kamieniowi ogniskuj¹cemu bêdziemy mogli nawi¹zaæ z nim kontakt!
};

// ------------------------------ RUNNING ----------------------------------
INSTANCE Info_YBerion_BringFocus_RUNNING (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_BringFocus_RUNNING_Condition;
	information	= Info_YBerion_BringFocus_RUNNING_Info;
	permanent	= 0;
	description	= "Wci¹¿ nie znalaz³em kamienia ogniskuj¹cego.";
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
	AI_Output (other, self,"Info_YBerion_BringFocus_RUNNING_15_01"); //Jeszcze nie znalaz³em kamienia ogniskuj¹cego.
	AI_Output (self, other,"Info_YBerion_BringFocus_RUNNING_12_02"); //Wiêc szukaj dalej. Œni¹cy wska¿e ci drogê.
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_YBerion_BringFocus_Success (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_BringFocus_Success_Condition;
	information	= Info_YBerion_BringFocus_Success_Info;
	permanent	= 0;
	description	= "Znalaz³em kamieñ.";
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
	AI_Output			(other, self,"Info_YBerion_BringFocus_Success_15_01"); //Znalaz³em kamieñ.
	AI_Output			(self, other,"Info_YBerion_BringFocus_Success_12_02"); //Œwietnie. Odda³eœ nam ogromn¹ przys³ugê.
	AI_Output			(self, other,"Info_YBerion_BringFocus_Success_12_03"); //Teraz zanieœ kamieñ Cor Kalomowi. On bêdzie wiedzia³, co z nim zrobiæ.
	if	(Kalom_TalkedTo == FALSE)
	{
		AI_Output		(other, self,"Info_YBerion_BringFocus_Success_15_04"); //Gdzie znajdê tego Cor Kaloma?
		AI_Output		(self, other,"Info_YBerion_BringFocus_Success_12_05"); //Wiêkszoœæ czasu spêdza w laboratorium alchemicznym na wy¿szym poziomie Obozu.
		AI_Output		(self, other,"Info_YBerion_BringFocus_Success_12_06"); //Porozmawiaj z Lesterem. Znajdziesz go przy wejœciu do Obozu. On wska¿e ci drogê.
		B_LogEntry		(CH2_Focus,"Y'Berion kaza³ mi zanieœæ kamieñ ogniskuj¹cy innemu Guru, imieniem Cor Kalom. Ten Kalom spêdza ponoæ ca³e dnie w swoim laboratorium alchemicznym."); 
	}
	else
	{
		B_LogEntry		(CH2_Focus,"Y'Berion kaza³ mi zanieœæ kamieñ ogniskuj¹cy Cor Kalomowi. Có¿ za radoœæ! Znów spotkam tego przemi³ego cz³owieka!");
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
	description	= "Nyras postrada³ zmys³y!";
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
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_01"); //Nyras postrada³ zmys³y!
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_02"); //Twierdzi³, ¿e Œni¹cy objawi³ siê mu w wizji i wybra³ go na swojego jedynego s³ugê!
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_03"); //Potem rzuci³ siê na mnie i próbowa³ mnie zabiæ!
	AI_Output			(self, other,"Info_YBerion_NYRAS_12_04"); //Potêga Œni¹cego jest tak ogromna, ¿e mo¿e przywieœæ nieprzygotowane dusze do szaleñstwa.
	AI_Output			(self, other,"Info_YBerion_NYRAS_12_05"); //Tylko my - Guru, po d³ugich latach medytacji, posiadamy wystarczaj¹c¹ si³ê duchow¹, by móc sprostaæ wyzwaniu, jakim jest wys³uchanie g³osu Œni¹cego!
};

// ------------------------------ BELOHNUNG ----------------------------------
instance  GUR_1200_Yberion_EARN (C_INFO)
{
	npc				= GUR_1200_Yberion;
	condition		= GUR_1200_Yberion_EARN_Condition;
	information		= GUR_1200_Yberion_EARN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chyba nale¿y mi siê jakaœ nagroda?"; 
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
	AI_Output				(other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //Chyba nale¿y mi siê jakaœ nagroda?
	AI_Output				(self, other,"GUR_1200_Yberion_EARN_Info_12_02"); //Jako ¿e nie nale¿ysz do Bractwa, postanowi³em ciê wynagrodziæ.
	AI_Output				(self, other,"GUR_1200_Yberion_EARN_Info_12_03"); //Przyjmij ten amulet jako wyraz mojej wdziêcznoœci.
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
