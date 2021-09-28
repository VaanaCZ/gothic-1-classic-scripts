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
	description 	= "Witam!";
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
	AI_Output (other, self,"DIA_Guy_Hello_15_00"); //Witam!
	AI_Output (self, other,"DIA_Guy_Hello_03_01"); //Mhm? Nie widzia³em ciê jeszcze tutaj. Jesteœ nowy, prawda?
	AI_Output (other, self,"DIA_Guy_Hello_15_02"); //Tak, trafi³em tu niedawno...
	AI_Output (self, other,"DIA_Guy_Hello_03_03"); //Zdecydowa³eœ ju¿, do którego obozu do³¹czysz?
	AI_Output (other, self,"DIA_Guy_Hello_15_04"); //Nie. Masz dla mnie jakieœ sugestie?
	AI_Output (self, other,"DIA_Guy_Hello_03_05"); //Có¿, to zale¿y. Ka¿dy obóz ma swoje wady i zalety.
	AI_Output (self, other,"DIA_Guy_Hello_03_06"); //Dopóki nie podejmiesz decyzji, mo¿esz zostaæ tutaj. W³aœnie zwolni³a siê jedna chata.
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
	description 	= "Jakie s¹ zalety Starego Obozu?";
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
	AI_Output (other, self,"DIA_Guy_AdOC_15_00"); //Jakie s¹ zalety Starego Obozu?
	AI_Output (self, other,"DIA_Guy_AdOC_03_01"); //Jeœli zap³acisz Stra¿nikom za ochronê, bêdziesz móg³ ¿yæ we wzglêdnym spokoju. Stra¿nicy pilnuj¹, ¿eby ich ludziom nie dzia³a siê krzywda.
	AI_Output (self, other,"DIA_Guy_AdOC_03_02"); //Poza tym, tylko tutaj dostaniesz towary z zewnêtrznego œwiata po przyzwoitych cenach. W innych obozach zap³acisz za nie fortunê!

	Info_ClearChoices(DIA_Guy_AdOC);
	Info_AddChoice	 (DIA_Guy_AdOC,"Chyba doœæ ju¿ us³ysza³em o Starym Obozie.",DIA_Guy_AdOC_BACK);
	Info_AddChoice	 (DIA_Guy_AdOC,"Jakie towary s¹ tu szczególnie cenne?",DIA_Guy_AdOC_Warez);
	Info_AddChoice	 (DIA_Guy_AdOC,"A co siê dzieje, gdy walczy dwóch ludzi, którzy zap³acili za ochronê?",DIA_Guy_AdOC_Protection);
};	

func void DIA_Guy_AdOC_BACK()
{
	AI_Output (other, self,"DIA_Guy_AdOC_BACK_15_00"); //Chyba doœæ ju¿ us³ysza³em o Starym Obozie.
	AI_Output (self, other,"DIA_Guy_AdOC_BACK_03_01"); //Podoba mi siê tutaj.
	Info_ClearChoices(DIA_Guy_AdOC);
};

func void DIA_Guy_AdOC_Warez()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Warez_15_00"); //Jakie towary s¹ tu szczególnie cenne?
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_01"); //Wszystko, co pochodzi z zewnêtrznego œwiata: chleb, ser, boczek, ale przede wszystkim piwo i wino. W kolonii wytwarza siê tylko tê paskudn¹ ry¿ówkê!
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_02"); //Zawsze mo¿na zarobiæ na broni, a zbroje s¹ NIEZWYKLE kosztowne.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_03"); //Stra¿nicy zdjêli zbroje z zabitych królewskich rycerzy.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_04"); //Zreszt¹ ³atwo ich rozpoznaæ w³aœnie po ich zbroi - tylko Stra¿nicy mog¹ takie nosiæ.
};

func void DIA_Guy_AdOC_Protection()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Protection_15_00"); //A co siê dzieje, gdy walczy dwóch ludzi, którzy zap³acili za ochronê?
	AI_Output (self, other,"DIA_Guy_AdOC_Protection_03_01"); //W takiej sytuacji Stra¿nicy po prostu siê przygl¹daj¹, czekaj¹c a¿ jeden z walcz¹cych zginie. Wtedy zabijaj¹ drugiego!
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
	description 		= "Jakie s¹ zalety Nowego Obozu?";
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
	AI_Output (other, self,"DIA_Guy_AdNC_15_00"); //Jakie s¹ zalety Nowego Obozu?
	AI_Output (self, other,"DIA_Guy_AdNC_03_01"); //Jeœli nie masz nic przeciwko poder¿niêtemu gard³u, mo¿esz tam œmia³o iœæ.
	AI_Output (self, other,"DIA_Guy_AdNC_03_02"); //Nie, nie jest tam a¿ tak Ÿle, ale to zupe³nie inne osiedle.
	AI_Output (self, other,"DIA_Guy_AdNC_03_03"); //Tutaj o wzglêdny porz¹dek troszczy siê Gomez. W Nowym Obozie natomiast pojêcie porz¹dku nie istnieje.
	AI_Output (self, other,"DIA_Guy_AdNC_03_04"); //Jedyni ludzie, którzy maj¹ tam coœ do powiedzenia to Magowie Wody. Ale oni spêdzaj¹ ca³e dnie na badaniu Bariery.
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
	description 		= "A co przemawia za przy³¹czeniem siê do Sekty?";
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
	AI_Output (other, self,"DIA_Guy_AdST_15_00"); //A co przemawia za przy³¹czeniem siê do Sekty?
	AI_Output (self, other,"DIA_Guy_AdST_03_01"); //O to zapytaj ju¿ kogoœ z Obozu Bractwa.
	AI_Output (self, other,"DIA_Guy_AdST_03_02"); //Kilku ich Nowicjuszy zawsze krêci siê po obozie. Jestem pewien, ¿e udziel¹ ci wyczerpuj¹cych informacji.
	AI_Output (self, other,"DIA_Guy_AdST_03_03"); //Osobiœcie nigdy tam nie by³em, ale jeœli wierzyæ we wszystko, co o nich mówi¹, musz¹ byæ bardzo hojni.
	AI_Output (self, other,"DIA_Guy_AdST_03_04"); //Ze wszystkich trzech osiedli chyba naj³atwiej zostaæ cz³onkiem obozu na bagnie.
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
	description 		= "Któr¹ chatê mogê zaj¹æ?";
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
	AI_Output (other, self,"DIA_Guy_MyOwnHut_15_00"); //Któr¹ chatê mogê zaj¹æ?
	AI_PointAt(self, "OCR_HUT_26");
	AI_Output (self, other,"DIA_Guy_MyOwnHut_03_01"); //Tamt¹, z niewielkim baldachimem.
	AI_StopPointAt(self);
};	
