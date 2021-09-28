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
	description 	= "Привет!";
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
	AI_Output (other, self,"DIA_Guy_Hello_15_00"); //Привет!
	AI_Output (self, other,"DIA_Guy_Hello_03_01"); //М-м? Я тебя раньше не видел. Ты новенький?
	AI_Output (other, self,"DIA_Guy_Hello_15_02"); //Только что прибыл...
	AI_Output (self, other,"DIA_Guy_Hello_03_03"); //Ты уже решил, в каком ты будешь Лагере?
	AI_Output (other, self,"DIA_Guy_Hello_15_04"); //Нет. А что бы ты посоветовал?
	AI_Output (self, other,"DIA_Guy_Hello_03_05"); //Ну, я думаю, у каждого Лагеря есть свои плюсы и минусы.
	AI_Output (self, other,"DIA_Guy_Hello_03_06"); //До тех пор, пока не примешь решение, ты можешь жить здесь - этот дом только что освободился.
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
	description 	= "Что хорошего в Старом Лагере?";
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
	AI_Output (other, self,"DIA_Guy_AdOC_15_00"); //Что хорошего в Старом Лагере?
	AI_Output (self, other,"DIA_Guy_AdOC_03_01"); //Если ты платишь стражникам за защиту, жизнь у тебя будет довольно спокойная: они вытаскивают своих подопечных из всех неприятностей... Ну, почти из всех.
	AI_Output (self, other,"DIA_Guy_AdOC_03_02"); //Помимо этого, здесь ты можешь задешево покупать товары из внешнего мира. В других Лагерях они тебе будут явно не по карману.

	Info_ClearChoices(DIA_Guy_AdOC);
	Info_AddChoice	 (DIA_Guy_AdOC,"Ладно, хватит о Старом Лагере.",DIA_Guy_AdOC_BACK);
	Info_AddChoice	 (DIA_Guy_AdOC,"Что здесь ценится больше всего?",DIA_Guy_AdOC_Warez);
	Info_AddChoice	 (DIA_Guy_AdOC,"А что будет, если двое затеют драку между собой?",DIA_Guy_AdOC_Protection);
};	

func void DIA_Guy_AdOC_BACK()
{
	AI_Output (other, self,"DIA_Guy_AdOC_BACK_15_00"); //Ладно, хватит о Старом Лагере.
	AI_Output (self, other,"DIA_Guy_AdOC_BACK_03_01"); //Лично мне здесь нравится.
	Info_ClearChoices(DIA_Guy_AdOC);
};

func void DIA_Guy_AdOC_Warez()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Warez_15_00"); //Что здесь ценится больше всего?
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_01"); //Все, что приходит из внешнего мира. Хлеб, сыр, бекон... Больше всего ценится вино и пиво - не дрянной рисовый шнапс из Нового Лагеря, а настоящая добрая выпивка.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_02"); //Здесь хорошие цены на оружие, а доспехи ОЧЕНЬ дорогие.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_03"); //После бунта стражники забрали себе доспехи прежних надсмотрщиков.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_04"); //Стражников легко узнать - ведь доспехи продаются только им. Чужак никогда не сможет купить себе хорошую броню.
};

func void DIA_Guy_AdOC_Protection()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Protection_15_00"); //А что будет, если двое из тех, кто платит деньги за защиту, затеют драку между собой?
	AI_Output (self, other,"DIA_Guy_AdOC_Protection_03_01"); //Тогда стражники подождут, пока один не прикончит другого, а затем убьют победителя. Здесь с этим просто.
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
	description 		= "Что хорошего в Новом Лагере?";
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
	AI_Output (other, self,"DIA_Guy_AdNC_15_00"); //Что хорошего в Новом Лагере?
	AI_Output (self, other,"DIA_Guy_AdNC_03_01"); //Если тебе по душе место, где человеку могут перерезать глотку из-за куска хлеба, отправляйся туда.
	AI_Output (self, other,"DIA_Guy_AdNC_03_02"); //Нет, там не так уж плохо. Просто не так, как здесь.
	AI_Output (self, other,"DIA_Guy_AdNC_03_03"); //Здесь Гомез следит за тем, чтобы все было вроде как мирно. В Новом Лагере нет никаких законов.
	AI_Output (self, other,"DIA_Guy_AdNC_03_04"); //Там слушаются только магов Воды - но они обычно слишком заняты: дни и ночи напролет изучают Барьер.
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
	description 		= "Что хорошего в Лагере Сектантов?";
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
	AI_Output (other, self,"DIA_Guy_AdST_15_00"); //Что хорошего в Лагере Сектантов?
	AI_Output (self, other,"DIA_Guy_AdST_03_01"); //Ну, об этом тебе лучше расскажет кто-нибудь из его обитателей.
	AI_Output (self, other,"DIA_Guy_AdST_03_02"); //В нашем Лагере всегда крутятся их послушники, и они с радостью расскажут тебе о своей секте.
	AI_Output (self, other,"DIA_Guy_AdST_03_03"); //Сам я там никогда не бывал, но судя по тому, что говорят, они должны быть очень щедры.
	AI_Output (self, other,"DIA_Guy_AdST_03_04"); //Ни одному из Лагерей этой колонии так не нужны люди, как Лагерю Сектантов.
};

// **************************************************
// 				Welche Hьtte ist meine
// **************************************************

INSTANCE DIA_Guy_MyOwnHut (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 10;
	condition		= DIA_Guy_MyOwnHut_Condition;
	information		= DIA_Guy_MyOwnHut_Info;
	permanent		= 1;
	description 		= "В каком из домов я могу остановиться?";
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
	AI_Output (other, self,"DIA_Guy_MyOwnHut_15_00"); //В каком из домов я могу остановиться?
	AI_PointAt(self, "OCR_HUT_26");
	AI_Output (self, other,"DIA_Guy_MyOwnHut_03_01"); //Вон та хижина с небольшим навесом сейчас пустует.
	AI_StopPointAt(self);
};	
