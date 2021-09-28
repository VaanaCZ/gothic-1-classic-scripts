// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Guy_Exit (C_INFO)
{
	npc			= Vlk_530_Guy;
	nr			= 999;
	condition	= DIA_Guy_Exit_Condition;
	information	= DIA_Guy_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Guy_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Guy_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Guy_Hello (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 2;
	condition		= DIA_Guy_Hello_Condition;
	information		= DIA_Guy_Hello_Info;
	permanent		= 0;
	description 	= "Nazdar!";
};

FUNC INT DIA_Guy_Hello_Condition()
{	
	if (Kapitel <= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_Hello_Info()
{
	AI_Output (other, self,"DIA_Guy_Hello_15_00"); //Nazdar!
	AI_Output (self, other,"DIA_Guy_Hello_03_01"); //Hmm? Je�t� jsem t� tu nevid�l, jsi tady nov�, �e jo?
	AI_Output (other, self,"DIA_Guy_Hello_15_02"); //Ned�vno jsem p�i�el.
	AI_Output (self, other,"DIA_Guy_Hello_03_03"); //U� ses rozhodl, ke kter�mu t�boru se p�id�?
	AI_Output (other, self,"DIA_Guy_Hello_15_04"); //Ne, co mysl�?
	AI_Output (self, other,"DIA_Guy_Hello_03_05"); //No, to z�le�� - ka�d� t�bor m� sv� v�hody, �ekl bych.
	AI_Output (self, other,"DIA_Guy_Hello_03_06"); //Dokud se nerozhodne�, m��e� z�stat tady - jedna chatr� se pr�v� uvolnila.
};

// **************************************************
// 				Advantages OC
// **************************************************

INSTANCE DIA_Guy_AdOC (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 2;
	condition		= DIA_Guy_AdOC_Condition;
	information		= DIA_Guy_AdOC_Info;
	permanent		= 1;
	description 	= "Jak� jsou v�hody Star�ho t�bora?";
};

FUNC INT DIA_Guy_AdOC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdOC_Info()
{
	AI_Output (other, self,"DIA_Guy_AdOC_15_00"); //Jak� jsou v�hody Star�ho t�bora?
	AI_Output (self, other,"DIA_Guy_AdOC_03_01"); //Kdy� plat� str��m pen�ze za ochranu, m��e� tu m�t klidn� �ivot. Kdy� n�kdo napadne plat�c�ho kop��e, tak zas�hnou.
	AI_Output (self, other,"DIA_Guy_AdOC_03_02"); //Krom� toho m��e� sehnat levn� zbo�� z vn�j��ho sv�ta jedin� tady. Tyhle v�ci jsou v ostatn�ch t�borech nedostupn�.

	Info_ClearChoices(DIA_Guy_AdOC);
	Info_AddChoice	 (DIA_Guy_AdOC,"Mysl�m, �e jsem o Star�m t�bo�e sly�el dost.",DIA_Guy_AdOC_BACK);
	Info_AddChoice	 (DIA_Guy_AdOC,"Jak� zbo�� je tu obzvl᚝ vz�cn�?",DIA_Guy_AdOC_Warez);
	Info_AddChoice	 (DIA_Guy_AdOC,"A co kdy� se do sebe pust� dva lid�, kte�� oba plat� pen�ze za ochranu?",DIA_Guy_AdOC_Protection);
};	

func void DIA_Guy_AdOC_BACK()
{
	AI_Output (other, self,"DIA_Guy_AdOC_BACK_15_00"); //Mysl�m, �e jsem o Star�m t�bo�e sly�el dost.
	AI_Output (self, other,"DIA_Guy_AdOC_BACK_03_01"); //L�b� se mi tady.
	Info_ClearChoices(DIA_Guy_AdOC);
};

func void DIA_Guy_AdOC_Warez()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Warez_15_00"); //Jak� zbo�� je tu obzvl᚝ vz�cn�?
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_01"); //V�echno z vn�j��ho sv�ta. Chleba, s�r, slanina a p�edev��m pivo a v�no - ne lacin� r��ov� p�lenka z Nov�ho t�bora, ale opravdu kvalitn� zbo��.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_02"); //Tak� tu dostane� dobr� ceny za zbran� a DOOPRAVDY drah� je tu zbroj.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_03"); //Str�e nos� starou zbroj po v�zn�ch, kter� zabily.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_04"); //Podle t�to zbroje je m��e� bezpe�n� poznat, proto�e ji zase prod�vaj� v�hradn� jin�m str�c�m. Jako nezasv�cenec bys tuhle zbroj nem�l nikdy nosit.
};

func void DIA_Guy_AdOC_Protection()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Protection_15_00"); //A co kdy� se do sebe pust� dva lid�, kte�� oba plat� pen�ze za ochranu?
	AI_Output (self, other,"DIA_Guy_AdOC_Protection_03_01"); //Pak je str�e sleduj�, dokud jeden nezabije druh�ho. Potom zabijou toho druh�ho.
};

// **************************************************
// 				Advantages NewCamp
// **************************************************

INSTANCE DIA_Guy_AdNC (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 3;
	condition		= DIA_Guy_AdNC_Condition;
	information		= DIA_Guy_AdNC_Info;
	permanent		= 0;
	description 		= "Jak� jsou v�hody Nov�ho t�bora?";
};

FUNC INT DIA_Guy_AdNC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdNC_Info()
{
	AI_Output (other, self,"DIA_Guy_AdNC_15_00"); //Jak� jsou v�hody Nov�ho t�bora?
	AI_Output (self, other,"DIA_Guy_AdNC_03_01"); //Jestli se chce� nechat pod�ezat kv�li bochn�ku chleba, tak tam b�!
	AI_Output (self, other,"DIA_Guy_AdNC_03_02"); //Ne - nen� to tak zl�. Ale jin� ne� tady.
	AI_Output (self, other,"DIA_Guy_AdNC_03_03"); //Tady se star� o jak�si m�r Gomez, zat�mco v Nov�m t�bo�e vl�dne bezpr�v�.
	AI_Output (self, other,"DIA_Guy_AdNC_03_04"); //Jedin�, kdo tam m� opravdu moc, jsou m�gov� Vody, ale ti jsou p��li� zam�stnan� studiem Bari�ry.
};	

// **************************************************
// 				Advantages ST
// **************************************************

INSTANCE DIA_Guy_AdST (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 4;
	condition		= DIA_Guy_AdST_Condition;
	information		= DIA_Guy_AdST_Info;
	permanent		= 0;
	description 		= "Pro� bych se m�l p�idat k t� sekt�?";
};

FUNC INT DIA_Guy_AdST_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdST_Info()
{
	AI_Output (other, self,"DIA_Guy_AdST_15_00"); //Pro� bych se m�l p�idat k t� sekt�?
	AI_Output (self, other,"DIA_Guy_AdST_03_01"); //No, rad�ji se zeptej n�koho ze Sektovn�ho t�bora.
	AI_Output (self, other,"DIA_Guy_AdST_03_02"); //V t�bo�e je v�dycky p�r novic�, kte�� ti bezpochyby �eknou o sekt� spoustu v�c�.
	AI_Output (self, other,"DIA_Guy_AdST_03_03"); //J� s�m jsem tam nikdy nebyl. Ale podle v�eho, co se prosl�ch�, musej� b�t opravdu velkorys�.
	AI_Output (self, other,"DIA_Guy_AdST_03_04"); //��dn� z t�ech t�bor�, jak se zd�, nepot�ebuje tolik nov�ch lid� jako Sektovn� t�bor.
};

// **************************************************
// 				Welche H�tte ist meine
// **************************************************

INSTANCE DIA_Guy_MyOwnHut (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 10;
	condition		= DIA_Guy_MyOwnHut_Condition;
	information		= DIA_Guy_MyOwnHut_Info;
	permanent		= 1;
	description 		= "Kterou chatr� bych si mohl zabrat?";
};

FUNC INT DIA_Guy_MyOwnHut_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_MyOwnHut_Info()
{
	AI_Output (other, self,"DIA_Guy_MyOwnHut_15_00"); //Kterou chatr� bych si mohl zabrat?
	AI_PointAt(self, "OCR_HUT_26");
	AI_Output (self, other,"DIA_Guy_MyOwnHut_03_01"); //T�mhleta chatr� s mal�m p��st�e�kem je pr�zdn�.
	AI_StopPointAt(self);
};	
