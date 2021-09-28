//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################

// ************************ EXIT **************************

instance DIA_GUR_1202_CorAngar_Exit (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 999;
	condition	= DIA_GUR_1202_CorAngar_Exit_Condition;
	information	= DIA_GUR_1202_CorAngar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_GUR_1202_CorAngar_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GUR_1202_CorAngar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************	
//		Sp�ter Trainer 
// ************************

instance DIA_CorAngar_LaterTrainer (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_LaterTrainer_Condition;
	information	= DIA_CorAngar_LaterTrainer_Info;
	permanent	= 0;
	description = "Bude� m� cvi�it?";
};                       

FUNC int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

FUNC VOID DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //Bude� m� cvi�it?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Chce� se st�t siln�m bojovn�kem, tak�e hled� n�koho, kdo t� bude cvi�it.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //To je chv�lyhodn�. J� ale nejsem ten, koho pot�ebuje�.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //Sv�j �as v�nuji jen p��slu�n�k�m Svat�ho templ��sk�ho kruhu.
};

// ************************	
//		Wie Templer
// ************************

instance DIA_CorAngar_WieTempler (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_WieTempler_Condition;
	information	= DIA_CorAngar_WieTempler_Info;
	permanent	= 1;
	description = "Jak se m��u st�t templ��em?";
};                       

FUNC int DIA_CorAngar_WieTempler_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && (Npc_GetTrueGuild(other) != GIL_TPL) )
	{
		return 1;
	};
};

FUNC VOID DIA_CorAngar_WieTempler_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //Jak se m��u st�t templ��em?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //Zaprv�, mus� slou�it jako novic do t� doby, ne� dok�e�, �e up��mn� v��� ve Sp��e.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //Pak se ke mn� vr�t� a j� ti d�m pokyny.
	AI_StopProcessInfos	( self );
};

/////////////////////////////////
/////////////////////////////////
//////// Kapitel 2 //////////////
/////////////////////////////////
/////////////////////////////////

//-------------------------------------------------------------------------
//							ST�RKE UND DEX STEIGERN
//-------------------------------------------------------------------------
INSTANCE GUR_1202_CorAngar_Teach(C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 10;
	condition	= GUR_1202_CorAngar_Teach_Condition;
	information	= GUR_1202_CorAngar_Teach_Info;
	permanent	= 1;
	description = "M��e� cvi�it moj� s�lu a obratnost?";
};                       

FUNC INT GUR_1202_CorAngar_Teach_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};
};

FUNC VOID GUR_1202_CorAngar_Teach_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //M��e� cvi�it moj� s�lu a obratnost?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Ka�d� bojovn�k mus� b�t siln� a obratn�.
	
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_BACK()
{
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
};

func void GUR_1202_CorAngar_Teach_STR_1()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_STR_5()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_1()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_5()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

//--------------------------------------------------------------
// TEMPLER WERDEN
//--------------------------------------------------------------
instance  GUR_1202_CorAngar_WANNABETPL (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WANNABETPL_Condition;
	information		= GUR_1202_CorAngar_WANNABETPL_Info;
	important		= 0;
	permanent		= 1;
	description		= "Chci se st�t templ��em!"; 
};

FUNC int  GUR_1202_CorAngar_WANNABETPL_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	&& (Npc_GetTrueGuild (hero) == GIL_NOV)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_WANNABETPL_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //Chci se st�t templ��em!
	
	if	(hero.level < 10)
	{ 
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //Nejsi je�t� p�ipraven. M��e� se k n�m p�ipojit, jakmile z�sk� v�c zku�enost�.
	    GUR_1202_CorAngar_WANNABETPL.permanent = 1;
    }
    else if	(hero.level >= 10)
    {
	    AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //Nade�el �as, aby ses k n�m p�idal.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Pamatuj, �e templ�� nen� jen dobr�m bojovn�kem a str�cem t�bora. Jsme vyvolen� str�ci Sp��e. Str�ci ducha.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //Pou��v�me jak fyzickou, tak duchovn� s�lu. Jen ti, jejich� t�la i du�e spl�vaj� v jednot�, jsou prav� templ��i.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //Jsem opravdu pot�en, �e jsi do�el tak daleko v tak kr�tk� dob�. Nyn� jsi p�ipraven se k n�m p�idat.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Zapamatuj si: soust�ed�n� du�e a tr�novan� t�lo odolaj� ka�d� hrozb�.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //Te� jdi na cvi�i�t� za Gorem Na Tothem. D� ti novou zbroj.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero, GIL_TPL);
		hero.guild = GIL_TPL;

		Log_CreateTopic	(GE_BecomeTemplar,	LOG_NOTE);
		B_LogEntry		(GE_BecomeTemplar,"Dnes m� Cor Kalom pasoval na templ��e. Gor Na Toth mi p�ed� moji novou zbroj. Obvykle b�v� na cvi�i�ti.");
		Log_CreateTopic	(GE_TeacherPSI,		LOG_NOTE);
		B_LogEntry		(GE_TeacherPSI,"Cor Angar cvi�� S�LU, OBRATNOST a boj s OBOURU�N�MI ZBRAN�MI. Bude m� u�it a� tehdy, kdy� se stanu mistrem boje s JEDNORU�N�MI ZBRAN�MI. Obvykle b�v� na cvi�i�ti v druh� �rovni m�stk�.");
	};

};

//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND1 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND1_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1,	LPCOST_TALENT_2H_1,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTrueGuild    (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND1_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01"); //Chci se nau�it zach�zet s obouru�n�m me�em.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02"); //Boj s obouru�n�m me�em vy�aduje ur�itou s�lu a obratnost.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03"); //Abys dok�zal zach�zet s obouru�n�m me�em, mus� b�t nejen p�nem sv�ho t�la, ale zrovna tak sv� mysli.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04"); //Jedin� kdy� se stane� p�nem sv�ho t�la i mysli z�rove�, m��e� se nau�it um�n� boje.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05"); //Kl��em �sp�chu je soust�ed�n�. Soust�ed�n� jednota t�la a mysli.

		GUR_1202_CorAngar_ZWEIHAND1.permanent		= 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND2 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND2_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2,	LPCOST_TALENT_2H_2,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND2_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");		//Chci se nau�it v�c o boji s obouru�n�mi zbran�mi.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02"); //Te� ovl�d� tanec s ost��m. Nau��m t�, jak se st�t mistrem v boji.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03"); //Pou�ij duchovn� s�lu k tomu, abys vy�etl protivn�k�v pohyb, je�t� ne� za�to��.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04"); //Znalost protivn�kovy taktiky boje je polovi�n� v�t�zstv�.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05"); //Bu� rychl�, tvoje �toky mus� b�t p�ekvapuj�c� a plynul�, �dery p�esn� a tvrd�.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06"); //Nau� se nevn�mat bolest. V�sledek z�pasu v�dy nakonec rozhodne s�la tvoj� v�le.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07"); //Z�sta� klidn�. P�e�ije� jen tehdy, kdy� se pust� do boje s klidem a soust�ed�n�m.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08"); //Vyu��vej sv� um�n� obez�etn�. A zapamatuj si: vyprovokovat boj znamen� tot�, co v n�m zem��t.

		GUR_1202_CorAngar_ZWEIHAND2.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  

  
  
  
  
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################
 
// **************************************************************************
// 				nach der gro�en Beschw�rung
// **************************************************************************
instance  GUR_1202_CorAngar_SENDS (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_SENDS_Condition;
	information		= GUR_1202_CorAngar_SENDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak to dopadlo?"; 
};

FUNC int  GUR_1202_CorAngar_SENDS_Condition()
{	
	if	(Kapitel == 3)
	&&	(CorAngar_GotoOGY == FALSE)
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_SENDS_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //Jak to dopadlo?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //Vidina byla p��li� nejasn�. P�inesla n�m v�c h�danek ne� odpov�d�.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //Jedna v�c je v�ak docela jasn�: vid�l jsem jednoho sk�eta v jeskyni. Nedaleko je jedna star� opu�t�n� jeskyn� sk�et�, kterou  pou��vali pro bohoslu�by.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //Sk�eti tam poh�b�vali sv� mrtv�, proto tomu syst�mu jeskyn� ��k�me Sk�et� h�bitov.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //Guru Baal Lukor tam ode�el s n�kolika templ��i. Mo�n� tam najdeme n�co, co by n�m pomohlo porozum�t t� vidin�.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //Pot�ebuji, aby se tam n�kdo porozhl�dl a dal mi zpr�vu o stavu v�c�.
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //Pro� tam nejde� s�m? Jsi p�ece v�dce templ���!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //M�j �kol je chr�nit Osv�cen�ho. Mus�m tu z�stat s Y�Berionem a st�e�it ho.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //Odvedl jsi t�boru dobr� slu�by. V���m ti v�c ne� komukoliv jin�mu odtud.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //Chci t� po��dat, abys �el do Sk�et�ho h�bitova a podal mi zpr�vu, co tam templ��i na�li.
	
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Co dostanu za odm�nu?",	GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Ihned se vyd�m na cestu!",	GUR_1202_CorAngar_SENDS_KNOW);
};  
func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //Co dostanu za odm�nu?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //Chce� rudu? Vid�m, �e jsem se v tob� zm�lil. Ale pot�ebuju t�. Tady je 100 nuget�. V�c u� nedostane�!
	CreateInvItems		(self,ItMiNugget,100);
	B_GiveInvItems      (self, hero, ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //Ihned se vyd�m na cestu!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Je�t� ne� odejde�, vem si tenhle prsten. A� t� ochr�n� v boji!
	
	B_Story_GotoOrcGraveyard();

	CreateInvItem		(self, Schutzring_Geschosse1);
	B_GiveInvItems      (self, hero, Schutzring_Geschosse1, 1);
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
};
	
instance  GUR_1202_CorAngar_WHERE (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WHERE_Condition;
	information		= GUR_1202_CorAngar_WHERE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Kde je Sk�et� h�bitov?"; 
};

FUNC int  GUR_1202_CorAngar_WHERE_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_SENDS) )
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_WHERE_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WHERE_Info_15_01"); //Kde je Sk�et� h�bitov?
	AI_Output			(self, other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //Nedaleko odtud. Novic Talas zn� cestu. Najde� ho na dvo�e u chr�mu. Dovede t� tam.

	B_LogEntry		(CH3_OrcGraveyard,"Novic Talas mi uk�e cestu k sk�et�mu h�bitovu. Po�k� na m� na n�dvo�� chr�mu.");
};  

// **************************************************************************
// 				nach dem Ork-Friedhof
// **************************************************************************
instance  GUR_1202_CorAngar_AFTER (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_AFTER_Condition;
	information		= GUR_1202_CorAngar_AFTER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Byl jsem na Sk�et�m h�bitov�. Nen� TAM NIC. ��dn� Sp��, ��dn� znamen�, prost� nic."; 
};

FUNC int  GUR_1202_CorAngar_AFTER_Condition()
{
	  
	if   ( BaalLukor_BringParchment == 4 ) 
	{
		return	1;
	};
};

FUNC void  GUR_1202_CorAngar_AFTER_Info()
{
	
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //Byl jsem na Sk�et�m h�bitov�. Nen� TAM NIC. ��dn� Sp��, ��dn� znamen�, prost� nic.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //A co Baal Lukor a templ��i?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //Jsou mrtv�.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //Mrtv�? Ale pro�? Jak se to stalo?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //Cel� jeskynn� syst�m se hem�� sk�ety. Zabili v�echny templ��e.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Baal Lukor a j� jsme p�e�ili, ale Lukor znenad�n� ze��lel.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //Vyk�ikoval, �e mu Sp�� na��dil, aby m� zabil, a chystal se sv�j rozkaz splnit.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //Vypadalo to, �e se nem��e sm��it s t�m, �e nic nena�el.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //Nem��u uv��it, �e by Sp���v vliv mohl v�st k takov�mhle n�siln�m �in�m.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //To nem��e b�t... nem��e b�t... JEN TAK!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //Nejd�le�it�j�� ale je, �e se to Baalu Lukorovi v jeho ��lenstv� nepoda�ilo.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Y�Berion je te� na�e jedin� nad�je.
	 

	B_GiveXP			(XP_ReportToCorAngar);
	B_Story_BackFromOrcGraveyard();
};  
	
// **************************************************************************
// 				MISSION: Find Herb
// **************************************************************************
INSTANCE Info_CorAngar_FindHerb (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Condition;
	information	= Info_CorAngar_FindHerb_Info;
	permanent	= 0;
	important 	= 0;
	description = "Co je s Y�Berionem?";
};

func INT Info_CorAngar_FindHerb_Condition()
{
	  
	if   ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_AFTER) )
	{
		return	1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Info()
{
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //Co je s Y�Berionem?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //Nedok�e se s�m probudit. Je st�le slab�� a slab��. V�m, jak ho probudit, ale pot�ebuji tvou pomoc.
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //Co m�m ud�lat?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //P�ines mi z ba�in l��iv� byliny. P�t nejsiln�j��ch druh� by m�lo sta�it!
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //Pros�m rychle!
	AI_StopProcessInfos	(self);
	CorAngar_FindHerb = LOG_RUNNING;
	
	Log_CreateTopic		(CH3_FindHerbs,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_RUNNING);
	B_LogEntry		(CH3_FindHerbs,"Y�Berion je st�le v bezv�dom�. Cor Angar m� po��dal, abych nasb�ral p�t nejsiln�j��ch l��iv�ch bylin.");
};

// ---------------------------- FindHerb - WHERE ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_WHERE (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_WHERE_Condition;
	information	= Info_CorAngar_FindHerb_WHERE_Info;
	permanent	= 0;
	important	= 0; 
	description = "Kde najdu ty byliny?";
};                       

FUNC INT Info_CorAngar_FindHerb_WHERE_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_WHERE_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_WHERE_15_01"); //Kde najdu ty byliny?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Hledej je v ba�in�ch za t�borem. Mus� pro n� j�t hluboko do mo��lu, ale d�vej pozor, a� t� nedostanou mo��lov� �raloci.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_03"); //A te� u� m� nezdr�uj. B�!
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,"L��iv� byliny na l�k pro Y�Beriona rostou hluboko v ba�in�ch za t�borem Bratrstva. Jsou tam tak� nebezpe�n� mo��lov� �raloci. Mus�m m�t o�i na stopk�ch.");
};

// ---------------------------- FindHerb - LOOK ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_LOOK (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_LOOK_Condition;
	information	= Info_CorAngar_FindHerb_LOOK_Info;
	permanent	= 0;
	important	= 0; 
	description = "Jak ty byliny pozn�m?";
};                       

FUNC INT Info_CorAngar_FindHerb_LOOK_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_LOOK_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_LOOK_15_01"); //Jak ty byliny pozn�m?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_02"); //Vypadaj� jako hv�zdy s osmi zelen�mi a oran�ov�mi c�py.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_03"); //A te� se vydej na cestu.
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,"L��iv� byliny vypadaj� jako hv�zdice s �ty�mi zelen�mi a �ty�mi oran�ov�mi okv�tn�mi l�stky.");
};



// ---------------------------- RUNNING ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_Running (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_Running_Condition;
	information	= Info_CorAngar_FindHerb_Running_Info;
	permanent	= 1;
	important	= 0; 
	description = "Je�t� jsem nena�el l��iv�ch bylin dost.";
};                       

FUNC INT Info_CorAngar_FindHerb_Running_Condition()
{
	if	(CorAngar_FindHerb==LOG_RUNNING)
	&&	(Npc_HasItems(other,ItFo_Plants_Herb_03)<5)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_WHERE)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_LOOK)
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Running_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Running_15_01");//Je�t� jsem nena�el l��iv�ch bylin dost.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_02");//Mo�n� m� n�jak� na sklad� Fortuno, obchodn�k bylinami.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_03");//Posp�. Pot�ebuji jich p�t. Y�Berion ztratil p��li� �asu.
	AI_StopProcessInfos	(self);

	//-------- Fortuno die Kr�uter "unterschieben" --------
	if	!Fortuno_HasYBerionHerbs
	{
		var C_NPC	fortuno;
		fortuno = Hlp_GetNpc(Nov_1357_Fortuno);
		CreateInvItems		(fortuno,	ItFo_Plants_Herb_03,	5);	

		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry		(CH3_FindHerbs,"Fortuno, obchodn�k s bylinkami z Bratrstva, by takov� byliny mohl m�t.");
	};
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_CorAngar_FindHerb_Success (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Success_Condition;
	information	= Info_CorAngar_FindHerb_Success_Info;
	permanent	= 0;
	description	= "M�m l��iv� byliny pro Y�Beriona.";
};                       

FUNC INT Info_CorAngar_FindHerb_Success_Condition()
{
	if ( Npc_HasItems ( other, ItFo_Plants_Herb_03 ) >= 5 ) && ( CorAngar_FindHerb == LOG_RUNNING )
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_FindHerb_Success_Info()
{	
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_01"); //M�m l��iv� byliny pro Y�Beriona.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_02"); //V�born�. Zat�mco jsi byl pry�, Y�Berion na chvilku procitl.
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_03"); //��kal n�co?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_04"); //Ano, ��kal, �e Sp�� nen� to, co si mysl�me. Nesm�me se ho znovu pokou�et probudit.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_05"); //V�e, co te� m��eme d�lat, je doufat, �e pro Y�Beriona nen� je�t� moc pozd�.
	Yberion_dead = LOG_RUNNING;

	B_GiveInvItems	(other, self, ItFo_Plants_Herb_03, 5 );
	Npc_RemoveInvItems(self, ItFo_Plants_Herb_03, 5 );
	B_GiveXP  			(XP_FindHerbs);

	CorAngar_FindHerb = LOG_SUCCESS;
	
	B_LogEntry		(CH3_FindHerbs,"Dodal jsem Coru Angarovi dostatek l��iv�ch bylin. Te� m��eme jen doufat, �e nebylo p��li� pozd�.");
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_SUCCESS);

	//-------- Versuch YBerion zu heilen... --------
	var C_NPC YBerion; 	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	AI_Wait				(self,	1);
	AI_GotoNpc			(self,	YBerion);
	AI_TurnToNpc		(self,	YBerion);
	AI_PlayAni			(self,	"T_PLUNDER");
	AI_WaitTillEnd		(self,	YBerion);
	//YBerion.attribute[ATR_HITPOINTS] = 0;
	//AI_StartState		(YBerion,	ZS_Dead,	0,	"");

	//-------- ...scheitert. YBerion ist tot --------
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Y�BERION JE MRTEV. N� duchovn� v�dce n�s opustil.
	AI_TurnToNpc		(self, other);
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //Ani tvoje rychl� pomoc ho nesta�ila zachr�nit.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //A co te�, Cor Angare?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //V�dycky jsem Y�Berionovi v��il. Kr�tce p�ed svou smrt� up�nal v�echny sv� nad�je na pl�n �t�ku m�g� Vody.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Pak bychom m�li m�g�m Vody s jejich pl�nem pomoci.
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //Pot�ebuj� ohnisko a almanach. Ob� v�ci jsou st�le majetkem Cora Kaloma.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //Kde je Cor Kalom?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //V hn�vu se vydal s n�kolika templ��i svou vlastn� cestou ke Sp��ovi.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Sakra, jak te� to ohnisko dostaneme?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //Douf�m, �e to ohnisko i almanach nechal ve sv� d�ln�. Tady je kl�� k t� truhle.

	CreateInvItem		(self,			ITKE_PSI_KALOM_01); 
	B_GiveInvItems		(self,	other,	ITKE_PSI_KALOM_01,	1);
};
 
// ------------------------------ TELEPORT ----------------------------------
INSTANCE Info_CorAngar_TELEPORT (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_TELEPORT_Condition;
	information	= Info_CorAngar_TELEPORT_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_CorAngar_TELEPORT_Condition()
{
	if	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success)
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_TELEPORT_Info()
{	
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); //Je�t� moment!
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_02"); //Ano?
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); //Vem si tuhle magickou runu jako vyj�d�en� na�eho vd�ku za tvoje velk� �iny.
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_04"); //Pom��e ti snadno a rychle se p�en�st do chr�mov�ho dvora, kdykoliv to bude� pot�ebovat.
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); //D�kuju!

	//-------- Spieler wird losgeschickt --------
	B_Story_SentToNC	();
};
 
