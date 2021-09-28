// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Nyras_Exit (C_INFO)
{
	npc			=  Nov_1303_Nyras;
	nr			=  999;
	condition	=  DIA_Nyras_Exit_Condition;
	information	=  DIA_Nyras_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Nyras_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Nyras_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hi
// **************************************************

instance DIA_Nyras_Hallo (C_INFO)
{
	npc				= Nov_1303_Nyras;
	nr				= 1;
	condition		= DIA_Nyras_Hallo_Condition;
	information		= DIA_Nyras_Hallo_Info;
	permanent		= 0;
	description		= "Привет! Я здесь новенький.";
};

FUNC int  DIA_Nyras_Hallo_Condition()
{
	if	(Kapitel <= 1)
	{
		return TRUE;
	};
};
func void  DIA_Nyras_Hallo_Info()
{
	AI_Output			(other, self,"DIA_Nyras_Hallo_15_00"); //Привет! Я здесь новенький!
	AI_Output			(self, other,"DIA_Nyras_Hallo_03_01"); //Да пребудет с тобой Спящий, незнакомец!
};

// **************************************************
//						Ort
// **************************************************

instance DIA_Nyras_Ort (C_INFO)
{
	npc				= Nov_1303_Nyras;
	nr				= 1;
	condition		= DIA_Nyras_Ort_Condition;
	information		= DIA_Nyras_Ort_Info;
	permanent		= 0;
	description		= "Расскажи мне об этом месте.";
};

FUNC int  DIA_Nyras_Ort_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Nyras_Hallo))
	&&	(Kapitel <= 1)
	{
		return 1;
	};
};

func void  DIA_Nyras_Ort_Info()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_15_00"); //Расскажи мне об этом месте.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_01"); //Ну... Гуру здесь самые главные. Они несут народу слово Спящего и передают новичкам мудрость нашего господина.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_02"); //Разумеется, сам он не смог бы поговорить с каждым лично.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_03"); //Но иногда он собирает нас во дворе храма, дабы донести до нас священное слово Спящего.
	
	Info_ClearChoices 	(DIA_Nyras_Ort);
	Info_Addchoice 		(DIA_Nyras_Ort,"Поведай мне о священных словах великого Спящего.",DIA_Nyras_Ort_Holy);
	Info_Addchoice 		(DIA_Nyras_Ort,"И что он говорит?",DIA_Nyras_Ort_Casual);
};

func void DIA_Nyras_Ort_Casual()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Casual_15_00"); //И что он говорит?
	AI_Output			(self, other,"DIA_Nyras_Ort_Casual_03_01"); //Спящий указывает нам путь, но язычникам, вроде тебя, этого не понять!
	Info_ClearChoices 	(DIA_Nyras_Ort);
};

func void DIA_Nyras_Ort_Holy()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Holy_15_00"); //Поведай мне о священных словах великого Спящего.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_01"); //ОН говорит, что мы вновь должны обрести свободу.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_02"); //По словам Ю`Бериона, Спящий укажет нам путь, как только мы будем в состоянии услышать его.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_03"); //Ю`Берион готовит Великую Церемонию, в ходе которой вместе со своими лучшими учениками он призовет Спящего.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_04"); //Ему помогает Кор Галом - алхимик, который готовит эликсир, способный погрузить нас в транс.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_05"); //Лишь в этом состоянии мы можем понимать мысли Спящего - да еще во сне.
	Info_ClearChoices 	(DIA_Nyras_Ort);
};

// ***************************************************
//						
// ***************************************************








///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
////////////////////		Bring Fokus 1		///////////////////////////
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

// ***************************** BEGRЬЯUNG ****************************************//

instance Nov_1303_Nyras_GREET (C_INFO)
{
	npc				= Nov_1303_Nyras;
	condition		= Nov_1303_Nyras_GREET_Condition;
	information		= Nov_1303_Nyras_GREET_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Nov_1303_Nyras_GREET_Condition()
{
	if ( YBerion_BringFocus == LOG_RUNNING )
	{
		return 1;
	};
};
func void  Nov_1303_Nyras_GREET_Info()
{
	AI_Output			(self,other ,"Nov_1303_Nyras_GREET_Info_03_00"); //Убирайся! Тебе нечего здесь делать!
};
// ***************************** INFOS ****************************************//

instance  Nov_1303_Nyras_LEAVE (C_INFO)
{
	npc				= Nov_1303_Nyras;
	condition		= Nov_1303_Nyras_LEAVE_Condition;
	information		= Nov_1303_Nyras_LEAVE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я ищу юнитор."; 
};

FUNC int  Nov_1303_Nyras_LEAVE_Condition()
{	
	if ( Npc_KnowsInfo (hero,Nov_1303_Nyras_GREET))
	{
		return 1;
	};
};
FUNC void  Nov_1303_Nyras_LEAVE_Info()
{
	AI_Output			(other, self,"Nov_1303_Nyras_LEAVE_Info_15_01"); //Я ищу юнитор.
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_02"); //К сожалению, ты опоздал. Я уже нашел его!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_03"); //И знаешь - я решил оставить его себе!!!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_04"); //Спящий говорил со мной прошлой ночью - и он избрал меня своим единственным последователем!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_05"); //Теперь я служу только Спящему. Никаких больше Гуру и Стражей!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_06"); //ТОЛЬКО Я!!! ОДИН!!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_07"); //УМРИ!!!

	B_LogEntry		(CH2_Focus,"Нирас ополоумел. Он захотел оставить юнитор себе и в ярости напал на меня.");

	Npc_SetPermAttitude (self,ATT_HOSTILE);
	AI_StopProcessInfos	(self);
		
};  
  
