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
	AI_Output (self, other,"DIA_Guy_Hello_03_01"); //Хм? Раньше я тебя здесь не видел. Ты новенький?
	AI_Output (other, self,"DIA_Guy_Hello_15_02"); //Я прибыл сюда недавно...
	AI_Output (self, other,"DIA_Guy_Hello_03_03"); //Уже решил, к какому лагерю лучше присоединиться?
	AI_Output (other, self,"DIA_Guy_Hello_15_04"); //Нет, а ты можешь что-то посоветовать?
	AI_Output (self, other,"DIA_Guy_Hello_03_05"); //Все лагеря разные, каждый может предложить что-то свое.
	AI_Output (self, other,"DIA_Guy_Hello_03_06"); //Пока ты не решил, в каком лагере останешься, ты можешь пожить в этой хижине. Она недавно освободилась.
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
	description 	= "Каковы преимущества Старого лагеря?";
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
	AI_Output (other, self,"DIA_Guy_AdOC_15_00"); //Каковы преимущества Старого лагеря?
	AI_Output (self, other,"DIA_Guy_AdOC_03_01"); //Если ты будешь платить стражникам, они будут помогать тебе, защищать от всяческих неприятностей. Они быстро разбираются с теми, кто решил напасть на одного из их подопечных.
	AI_Output (self, other,"DIA_Guy_AdOC_03_02"); //Кроме того, в нашем лагере товары из внешнего мира стоят не так дорого, как в других лагерях.

	Info_ClearChoices(DIA_Guy_AdOC);
	Info_AddChoice	 (DIA_Guy_AdOC, "Ладно, о Старом лагере я уже кое-что знаю..." ,DIA_Guy_AdOC_BACK);
	Info_AddChoice	 (DIA_Guy_AdOC, "Какие товары считаются здесь самыми ценными?"			,DIA_Guy_AdOC_Warez);
	Info_AddChoice	 (DIA_Guy_AdOC, "А что, если двое, которых защищают, подерутся между собой?"			,DIA_Guy_AdOC_Protection);
};	

func void DIA_Guy_AdOC_BACK()
{
	AI_Output (other, self,"DIA_Guy_AdOC_BACK_15_00"); //Ладно, о Старом лагере я уже кое-что знаю...
	AI_Output (self, other,"DIA_Guy_AdOC_BACK_03_01"); //Лично мне здесь нравится.
	Info_ClearChoices(DIA_Guy_AdOC);
};

func void DIA_Guy_AdOC_Warez()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Warez_15_00"); //Какие товары считаются здесь самыми ценными?
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_01"); //Все товары из внешнего мира: хлеб, сыр, ветчина и, конечно же, пиво и вино - настоящая выпивка, в отличие от рисового шнапса, дешевого пойла из Нового лагеря.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_02"); //Оружие у нас продают по хорошей цене, а вот доспехи очень дорогие.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_03"); //Стражники забрали себе все пригодные доспехи, которые раньше носили убитые ими тюремщики.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_04"); //Такие доспехи стали их отличительным знаком, ведь их кому попало не продают. Чужаку их точно не видать.
};

func void DIA_Guy_AdOC_Protection()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Protection_15_00"); //А что произойдет, если два человека, которые отдают руду за защиту, подерутся между собой?
	AI_Output (self, other,"DIA_Guy_AdOC_Protection_03_01"); //Стражники не будут вмешиваться в драку. Они просто подождут чем все закончится и потом накажут нарушителей.
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
	description 		= "Каковы преимущества Нового лагеря?";
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
	AI_Output (other, self,"DIA_Guy_AdNC_15_00"); //Каковы преимущества Нового лагеря?
	AI_Output (self, other,"DIA_Guy_AdNC_03_01"); //Если тебе нравится жить там, где каждый может убить тебя из-за куска хлеба, то тебе там самое место.
	AI_Output (self, other,"DIA_Guy_AdNC_03_02"); //Нет, конечно, там не так уж плохо. Хотя и не так, как здесь.
	AI_Output (self, other,"DIA_Guy_AdNC_03_03"); //В нашем лагере Гомез старается следить за порядком. А там нет никаких законов.
	AI_Output (self, other,"DIA_Guy_AdNC_03_04"); //Маги Воды могли бы наладить там жизнь, но они не хотят заниматься чужими проблемами, все свое время они исследуют Барьер.
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
	description 		= "А что ты можешь рассказать мне о лагере Сектантов?";
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
	AI_Output (other, self,"DIA_Guy_AdST_15_00"); //А что ты можешь рассказать мне о Лагере сектантов?
	AI_Output (self, other,"DIA_Guy_AdST_03_01"); //Спроси лучше об этом тех, кто оттуда приходит.
	AI_Output (self, other,"DIA_Guy_AdST_03_02"); //В нашем лагере всегда можно найти пару их послушников, они-то и смогут рассказать тебе о своем лагере.
	AI_Output (self, other,"DIA_Guy_AdST_03_03"); //Сам я никогда там не был. Но у нас говорят, что они очень щедры.
	AI_Output (self, other,"DIA_Guy_AdST_03_04"); //Им постоянно нужны новые люди, и они переманивают их из других лагерей.
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
	description 		= "Здесь есть пустой дом, в котором я могу переночевать?";
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
	AI_Output (other, self,"DIA_Guy_MyOwnHut_15_00"); //Здесь есть пустой дом, в котором я могу переночевать?
	AI_PointAt(self, "OCR_HUT_26");
	AI_Output (self, other,"DIA_Guy_MyOwnHut_03_01"); //Вон там наверху есть дом с небольшим навесом, и он никем не занят.
	AI_StopPointAt(self);
};	
