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
	AI_Output (self, other,"DIA_Guy_Hello_03_01"); //Hmm? Ještì jsem tì tu nevidìl, jsi tady nový, že jo?
	AI_Output (other, self,"DIA_Guy_Hello_15_02"); //Nedávno jsem pøišel.
	AI_Output (self, other,"DIA_Guy_Hello_03_03"); //Už ses rozhodl, ke kterému táboru se pøidáš?
	AI_Output (other, self,"DIA_Guy_Hello_15_04"); //Ne, co myslíš?
	AI_Output (self, other,"DIA_Guy_Hello_03_05"); //No, to záleží - každý tábor má své výhody, øekl bych.
	AI_Output (self, other,"DIA_Guy_Hello_03_06"); //Dokud se nerozhodneš, mùžeš zùstat tady - jedna chatrè se právì uvolnila.
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
	description 	= "Jaké jsou výhody Starého tábora?";
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
	AI_Output (other, self,"DIA_Guy_AdOC_15_00"); //Jaké jsou výhody Starého tábora?
	AI_Output (self, other,"DIA_Guy_AdOC_03_01"); //Když platíš strážím peníze za ochranu, mùžeš tu mít klidný život. Když nìkdo napadne platícího kopáèe, tak zasáhnou.
	AI_Output (self, other,"DIA_Guy_AdOC_03_02"); //Kromì toho mùžeš sehnat levné zboží z vnìjšího svìta jedinì tady. Tyhle vìci jsou v ostatních táborech nedostupné.

	Info_ClearChoices(DIA_Guy_AdOC);
	Info_AddChoice	 (DIA_Guy_AdOC,"Myslím, že jsem o Starém táboøe slyšel dost.",DIA_Guy_AdOC_BACK);
	Info_AddChoice	 (DIA_Guy_AdOC,"Jaké zboží je tu obzvláš vzácné?",DIA_Guy_AdOC_Warez);
	Info_AddChoice	 (DIA_Guy_AdOC,"A co když se do sebe pustí dva lidé, kteøí oba platí peníze za ochranu?",DIA_Guy_AdOC_Protection);
};	

func void DIA_Guy_AdOC_BACK()
{
	AI_Output (other, self,"DIA_Guy_AdOC_BACK_15_00"); //Myslím, že jsem o Starém táboøe slyšel dost.
	AI_Output (self, other,"DIA_Guy_AdOC_BACK_03_01"); //Líbí se mi tady.
	Info_ClearChoices(DIA_Guy_AdOC);
};

func void DIA_Guy_AdOC_Warez()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Warez_15_00"); //Jaké zboží je tu obzvláš vzácné?
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_01"); //Všechno z vnìjšího svìta. Chleba, sýr, slanina a pøedevším pivo a víno - ne laciná rýžová pálenka z Nového tábora, ale opravdu kvalitní zboží.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_02"); //Také tu dostaneš dobré ceny za zbranì a DOOPRAVDY drahá je tu zbroj.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_03"); //Stráže nosí starou zbroj po vìzních, které zabily.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_04"); //Podle této zbroje je mùžeš bezpeènì poznat, protože ji zase prodávají výhradnì jiným strážcùm. Jako nezasvìcenec bys tuhle zbroj nemìl nikdy nosit.
};

func void DIA_Guy_AdOC_Protection()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Protection_15_00"); //A co když se do sebe pustí dva lidé, kteøí oba platí peníze za ochranu?
	AI_Output (self, other,"DIA_Guy_AdOC_Protection_03_01"); //Pak je stráže sledují, dokud jeden nezabije druhého. Potom zabijou toho druhého.
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
	description 		= "Jaké jsou výhody Nového tábora?";
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
	AI_Output (other, self,"DIA_Guy_AdNC_15_00"); //Jaké jsou výhody Nového tábora?
	AI_Output (self, other,"DIA_Guy_AdNC_03_01"); //Jestli se chceš nechat podøezat kvùli bochníku chleba, tak tam bìž!
	AI_Output (self, other,"DIA_Guy_AdNC_03_02"); //Ne - není to tak zlé. Ale jiné než tady.
	AI_Output (self, other,"DIA_Guy_AdNC_03_03"); //Tady se stará o jakýsi mír Gomez, zatímco v Novém táboøe vládne bezpráví.
	AI_Output (self, other,"DIA_Guy_AdNC_03_04"); //Jediný, kdo tam má opravdu moc, jsou mágové Vody, ale ti jsou pøíliš zamìstnaní studiem Bariéry.
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
	description 		= "Proè bych se mìl pøidat k té sektì?";
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
	AI_Output (other, self,"DIA_Guy_AdST_15_00"); //Proè bych se mìl pøidat k té sektì?
	AI_Output (self, other,"DIA_Guy_AdST_03_01"); //No, radìji se zeptej nìkoho ze Sektovního tábora.
	AI_Output (self, other,"DIA_Guy_AdST_03_02"); //V táboøe je vždycky pár novicù, kteøí ti bezpochyby øeknou o sektì spoustu vìcí.
	AI_Output (self, other,"DIA_Guy_AdST_03_03"); //Já sám jsem tam nikdy nebyl. Ale podle všeho, co se proslýchá, musejí být opravdu velkorysí.
	AI_Output (self, other,"DIA_Guy_AdST_03_04"); //Žádný z tøech táborù, jak se zdá, nepotøebuje tolik nových lidí jako Sektovní tábor.
};

// **************************************************
// 				Welche Hütte ist meine
// **************************************************

INSTANCE DIA_Guy_MyOwnHut (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 10;
	condition		= DIA_Guy_MyOwnHut_Condition;
	information		= DIA_Guy_MyOwnHut_Info;
	permanent		= 1;
	description 		= "Kterou chatrè bych si mohl zabrat?";
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
	AI_Output (other, self,"DIA_Guy_MyOwnHut_15_00"); //Kterou chatrè bych si mohl zabrat?
	AI_PointAt(self, "OCR_HUT_26");
	AI_Output (self, other,"DIA_Guy_MyOwnHut_03_01"); //Támhleta chatrè s malým pøístøeškem je prázdná.
	AI_StopPointAt(self);
};	
