// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Viran_Exit (C_INFO)
{
	npc			=  Nov_1302_Viran;
	nr			=  999;
	condition	=  DIA_Viran_Exit_Condition;
	information	=  DIA_Viran_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Viran_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was macht ihr hier?
// **************************************************

instance  DIA_Viran_What (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_What_Condition;
	information	= DIA_Viran_What_Info;
	permanent	= 0;
	description	= "Чем ты занимаешься?";
};                       

FUNC int  DIA_Viran_What_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_What_Info()
{
	AI_Output (other, self,"DIA_Viran_What_15_00"); //Чем ты занимаешься?
	AI_Output (self, other,"DIA_Viran_What_07_01"); //Мы собираем болотник. После того как наши братья закончат переработку, его можно будет курить.
	AI_Output (self, other,"DIA_Viran_What_07_02"); //На болоте довольно опасно, но эта трава растет только здесь. Вообще-то, оно и к лучшему.
	AI_Output (other, self,"DIA_Viran_What_15_03"); //Почему?
	AI_Output (self, other,"DIA_Viran_What_07_04"); //Потому что здесь до нее не могут добраться два других Лагеря. Мы единственные в колонии добываем болотник.
	AI_Output (self, other,"DIA_Viran_What_07_05"); //Можно продавать его двум другим Лагерям - и при этом МЫ назначаем цену.
};

// **************************************************
//				Kraut abholen
// **************************************************

instance  DIA_Viran_FetchWeed (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_FetchWeed_Condition;
	information	= DIA_Viran_FetchWeed_Info;
	permanent	= 0;
	description	= "Меня прислал Идол Оран.";
};                       

FUNC int  DIA_Viran_FetchWeed_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_FetchWeed_Info()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_15_00"); //Меня прислал Идол Оран. Я должен отнести дневной сбор Кор Галому.
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_01"); //Думаешь, это так просто, да?
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_02"); //Эдак любой придет и скажет: 'Меня прислал Идол Оран', - а затем - фьюить! - ищи ветра в поле!
	
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Отправляйся к нему и спроси его сам, если не веришь мне!",DIA_Viran_FetchWeed_GotoHim);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Меня на самом деле прислал Идол Оран!",DIA_Viran_FetchWeed_Really);
};
	
func void DIA_Viran_FetchWeed_Really()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_Really_15_00"); //Меня на самом деле прислал Идол Оран!
	AI_Output (self, other,"DIA_Viran_FetchWeed_Really_07_01"); //Конечно.
};

func void DIA_Viran_FetchWeed_GotoHim()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_GotoHim_15_00"); //Отправляйся к нему и спроси его сам, если не веришь мне!
	AI_Output (self, other,"DIA_Viran_FetchWeed_GotoHim_07_01"); //У меня есть идея получше. Ты можешь доказать, что ты - тот, за кого себя выдаешь, если выполнишь для нас кое-какую работу.
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
};

// **************************************************
//				MISSION Bloodflies
// **************************************************
	var int Viran_Bloodflies;
// **************************************************

instance  DIA_Viran_Bloodflies (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Bloodflies_Condition;
	information	= DIA_Viran_Bloodflies_Info;
	permanent	= 0;
	description	= "И что ты хочешь, чтобы я сделал?";
};                       

FUNC int  DIA_Viran_Bloodflies_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Viran_FetchWeed))
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Bloodflies_Info()
{
	AI_Output (other, self,"DIA_Viran_Bloodflies_15_00"); //И что ты хочешь, чтобы я сделал?
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_01"); //Да сущий пустяк. Работать на болоте и так опасно, а тут еще эти чертовы слепни.
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_02"); //Без них было бы куда как легче, понимаешь?
	Viran_Bloodflies = LOG_RUNNING;

	B_LogEntry			(CH1_DeliverWeed,"Вайран даст мне болотник только в том случае, если я убью всех шершней в радиусе 20 шагов.");
};
	
// **************************************************
//				Running / Success
// **************************************************
	var int Viran_BotenDay;
// **************************************************

instance  DIA_Viran_Running (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Running_Condition;
	information	= DIA_Viran_Running_Info;
	permanent	= 1;
	description	= "Я не вижу никаких слепней.";
};                       

FUNC int  DIA_Viran_Running_Condition()
{
	if (Viran_Bloodflies == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Running_Info()
{
	AI_Output (other, self,"DIA_Viran_Running_15_00"); //Я не вижу никаких слепней.
	Npc_PerceiveAll(self);
	if ( Wld_DetectNpc(self,bloodfly,ZS_MM_Rtn_Wusel,-1) && (Npc_GetDistToNpc(self, other)<2000) ) //other = nearest Bloodfly (Instance/ZS/Guild)
	//wenn keine Bloodfly in 40m, dann other noch unverдndert (= hero)
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_00"); //А ты отойди шагов на двадцать!
		AI_Output (self, hero,"DIA_Viran_Running_07_01"); //Не думай, что тебе удастся легко отделаться!
	}
	else
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_02"); //Кажется, жуков больше нет. Хорошая работа!
		AI_Output (self, hero,"DIA_Viran_Running_07_03"); //Любой, кто взялся за нее, либо на нашей стороне, либо полный идиот!
		AI_Output (self, hero,"DIA_Viran_Running_07_04"); //А у идиота не хватит ума, чтобы одурачить меня, ведь так?
		AI_Output (self, hero,"DIA_Viran_Running_07_05"); //Вот, получай дневной сбор и тащи его к Кор Галому.
		AI_Output (self, hero,"DIA_Viran_Running_07_06"); //Если он начнет жаловаться и скажет, что этого недостаточно, предложи ему оторвать задницу от кресла и прийти сюда самому, чтобы посмотреть, как тяжело работается на болотах.
		
		B_GiveInvItems  (self, hero, ItMi_Plants_Swampherb_01, 50);

		if	Npc_KnowsInfo(hero, DIA_Balor_FetchWeed)
		{
			B_LogEntry	(CH1_DeliverWeed,"Вайран отдал мне вторую часть сегодняшнего урожая болотника. Посмотрим, будет ли Кор Галом удовлетворен результатом.");
		}
		else
		{
			B_LogEntry	(CH1_DeliverWeed,"Вайран отдал мне сегодняшний урожай болотника. Не густо. Возможно, где-то здесь есть вторая группа сборщиков.");
		};
		B_GiveXP		(XP_WeedFromViran);
				
		Viran_Bloodflies = LOG_SUCCESS;
		Viran_BotenDay = Wld_GetDay();
	};
	AI_StopProcessInfos (self);
};

// **************************************************
//					PERMANENT
// **************************************************

instance  DIA_Viran_Perm (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Perm_Condition;
	information	= DIA_Viran_Perm_Info;
	permanent	= 1;
	description	= "Как уборка урожая?";
};                       

FUNC int  DIA_Viran_Perm_Condition()
{
	if (Viran_Bloodflies == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Perm_Info()
{
	AI_Output (other, self,"DIA_Viran_Perm_15_00"); //Как уборка урожая?
	AI_Output (self, other,"DIA_Viran_Perm_07_01"); //Да-да, посмейся, посмейся. Уверен, тебе Гуру доверяют работенку получше.
	AI_Output (self, other,"DIA_Viran_Perm_07_02"); //Ну, по крайней мере, мне не приходится горбатиться самому. На то у нас есть 'пехота' - ха, ха, ха.
};

// **************************************************
//					Verarschen
// **************************************************

instance  DIA_Viran_RipOff (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 5;
	condition	= DIA_Viran_RipOff_Condition;
	information	= DIA_Viran_RipOff_Info;
	permanent	= 0;
	description	= "Я снова должен доставить весь сбор к Кор Галому.";
};                       

FUNC int  DIA_Viran_RipOff_Condition()
{
	if ( (Viran_BotenDay<=(Wld_GetDay()-2)) && (Viran_Bloodflies == LOG_SUCCESS) ) //Dann hat der SC auch das erste Kraut bekommen
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_RipOff_Info()
{
	AI_Output (other, self,"DIA_Viran_RipOff_15_00"); //Я снова должен доставить весь сбор к Кор Галому.
	AI_Output (self, other,"DIA_Viran_RipOff_07_01"); //Снова?
	AI_Output (other, self,"DIA_Viran_RipOff_15_02"); //Надеюсь, ты не собираешься попросить меня перебить всех болотожоров в округе, чтобы еще раз доказать тебе мою преданность? У меня не так много времени.
	AI_Output (self, other,"DIA_Viran_RipOff_07_03"); //Ладно, ладно! Забирай эти чертовы сорняки!
	CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
	B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
};








