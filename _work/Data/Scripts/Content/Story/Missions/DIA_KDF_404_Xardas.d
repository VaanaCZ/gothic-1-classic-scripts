//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_Xardas_EXIT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	nr			= 999;
	condition	= Info_Xardas_EXIT_Condition;
	information	= Info_Xardas_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Xardas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Xardas_EXIT_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneFireball))
	{
		CreateInvItem (self, ItArRuneFireball);
	};
	if (Npc_HasItems (self,ItArScrollSummonDemon)<1)
	{
		CreateInvItems (self, ItArScrollSummonDemon,2);
	};

};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DISTURB
//---------------------------------------------------------------------
instance  Info_Xardas_DISTURB (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DISTURB_Condition;
	information	= Info_Xardas_DISTURB_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_Xardas_DISTURB_Condition()
{	
	if	/*(FindGolemHearts == 4)
	&&	*/!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_DISTURB_Info()
{
	B_WhirlAround	(self, hero);
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_01"); //КТО ПОСМЕЛ ОТВЛЕЧЬ МЕНЯ ОТ МОИХ ИССЛЕДОВАНИЙ?
	AI_Output 		(hero, self,"Info_Xardas_DISTURB_15_02"); //Меня зовут...
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_03"); //Я не желаю знать твое имя. Это несущественно.
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_04"); //Куда важнее то, что за долгие годы ты - первый, кто сумел разгадать загадки моего голема.
}; 

//---------------------------------------------------------------------
//	Info OTHERS
//---------------------------------------------------------------------
instance  Info_Xardas_OTHERS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_OTHERS_Condition;
	information	= Info_Xardas_OTHERS_Info;
	important	= 0;
	permanent	= 0;
	description = "А были и другие?";
};

FUNC int  Info_Xardas_OTHERS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_OTHERS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_01"); //А были и другие?
	AI_Output 		(self, hero,"Info_Xardas_OTHERS_14_02"); //Их было немного, и когда они надоедали мне, я знакомил их со своими сверхъестественными созданиями.
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_03"); //Похоже, ты ценишь свое уединение.
}; 

//---------------------------------------------------------------------
//	Info SATURAS
//---------------------------------------------------------------------
instance  Info_Xardas_SATURAS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SATURAS_Condition;
	information	= Info_Xardas_SATURAS_Info;
	important	= 0;
	permanent	= 0;
	description = "Меня прислал Сатурас. Нам нужна твоя помощь!";
};

FUNC int  Info_Xardas_SATURAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SATURAS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_01"); //Меня прислал Сатурас. Нам нужна твоя помощь!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_02"); //Маги Воды хотят использовать свои запасы руды...
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_03"); //Решение кроется не в ЭТОМ!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_04"); //Не в этом?
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_05"); //НЕТ!
}; 

//---------------------------------------------------------------------
//	Info KDW
//---------------------------------------------------------------------
instance  Info_Xardas_KDW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_KDW_Condition;
	information	= Info_Xardas_KDW_Info;
	important	= 0;
	permanent	= 0;
	description = "Все маги Огня мертвы!";
};

FUNC int  Info_Xardas_KDW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};
};

FUNC void  Info_Xardas_KDW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_01"); //Все маги Огня мертвы.
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_02"); //Их убил Гомез.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_03"); //Это меня не удивляет. Тупые мясники-варвары в замке - им нельзя было доверять. 
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_04"); //Помогая Гомезу захватить власть, Корристо и остальные сами сунули голову в петлю.
}; 

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance  Info_Xardas_SLEEPER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SLEEPER_Condition;
	information	= Info_Xardas_SLEEPER_Info;
	important	= 0;
	permanent	= 0;
	description = "Говорят, что `Спящий` на самом деле является злым демоном.";
};

FUNC int  Info_Xardas_SLEEPER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SLEEPER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_01"); //Говорят, что так называемый 'Спящий' на самом деле является злым демоном.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_02"); //Это выяснили члены болотного Братства.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_03"); //Маги Воды уверены, что вся колония находится под угрозой.
	AI_Output 		(self, hero,"Info_Xardas_SLEEPER_14_04"); //Эта опасность больше, чем может себе представить любой, кто находится внутри Барьера. 
}; 

//---------------------------------------------------------------------
//	Info DANGER
//---------------------------------------------------------------------
instance  Info_Xardas_DANGER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DANGER_Condition;
	information	= Info_Xardas_DANGER_Info;
	important	= 0;
	permanent	= 0;
	description = "Если взрыв железной горы не предотвратит угрозу...";
};

FUNC int  Info_Xardas_DANGER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_SLEEPER)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SATURAS)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_DANGER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_01"); //Если взрыв железной горы не предотвратит угрозу...
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_02"); //... Забудь о руде! Она не в силах обрушить Барьер.
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_03"); //Если бы Корристо и Сатурас не тратили свое время на решение пустых и никчемных вопросов все эти годы, сейчас они бы знали то же, что и я.
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_04"); //Что именно?
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_05"); //Ни один из двенадцати магов не прекращал ломать голову над вопросом, почему они не в состоянии контролировать Барьер и почему он разросся до таких гигантских размеров.
};

//---------------------------------------------------------------------
//	Info BARRIER
//---------------------------------------------------------------------
instance  Info_Xardas_BARRIER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_BARRIER_Condition;
	information	= Info_Xardas_BARRIER_Info;
	important	= 0;
	permanent	= 0;
	description = "И ты нашел ответ?";
};

FUNC int  Info_Xardas_BARRIER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DANGER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_BARRIER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_01"); //И ты нашел ответ? 
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_02"); //Ну, ясно одно: ответ находится под городом орков.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_03"); //Город орков?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_04"); //Орки - вовсе не звери, как думает большинство людей. Их культура насчитывает столько же лет, сколько и человеческая.
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_05"); //Несколько веков назад пять орков-шаманов призвали древнего демона, в надежде, что он поможет им победить всех врагов.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_06"); //Этот демон - это и есть Спящий?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_07"); //Это имя орки дали ему намного позже. Но я не скажу тебе, почему они его так прозвали и почему сейчас это сверхъестественное создание внушает им такой ужас.
}; 

//---------------------------------------------------------------------
//	Info EVENT
//---------------------------------------------------------------------
instance  Info_Xardas_EVENT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENT_Condition;
	information	= Info_Xardas_EVENT_Info;
	important	= 0;
	permanent	= 0;
	description = "Почему?";
};

FUNC int  Info_Xardas_EVENT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_BARRIER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_01"); //Не скажешь? Но почему?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_02"); //Я думаю, что ты можешь быть... НЕТ, для того чтобы убедиться в этом окончательно, я дам тебе одно задание.
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_03"); //Какое?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_04"); //Слушай внимательно. Орки изгнали одного шамана из города.
}; 

//---------------------------------------------------------------------
//	Info EVENTWHY
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHY (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHY_Condition;
	information	= Info_Xardas_EVENTWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "За что они изгнали его?";
};

FUNC int  Info_Xardas_EVENTWHY_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHY_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHY_15_01"); //За что они изгнали его?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHY_14_02"); //Когда один из моих демонов пытал оркского воина, тот уже умирал и был не в состоянии ответить на этот вопрос.
}; 

//---------------------------------------------------------------------
//	Info EVENTHOW
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTHOW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTHOW_Condition;
	information	= Info_Xardas_EVENTHOW_Info;
	important	= 0;
	permanent	= 0;
	description = "Какое отношение этот шаман имеет к моему заданию?";
};

FUNC int  Info_Xardas_EVENTHOW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTHOW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_01"); //Какое отношение этот шаман имеет к моему заданию?
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_02"); //Он расскажет тебе вторую часть истории о Спящем.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_03"); //Едва ли шаман орков захочет говорить со мной!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_04"); //Ты хочешь, чтобы я помог тебе, или нет?
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_05"); //Вообще-то, да, но...
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_06"); //Тогда больше никогда не подвергай сомнению мои слова!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_07"); //Найди шамана. Он не слишком ладит со своими сородичами из города орков, так что, возможно, он выслушает незванного гостя, прежде чем превратить его в живой факел.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_08"); //Звучит обнадеживающе!
}; 

//---------------------------------------------------------------------
//	Info EVENTWHERE
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHERE (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHERE_Condition;
	information	= Info_Xardas_EVENTWHERE_Info;
	important	= 0;
	permanent	= 0;
	description = "Где живет этот изгнанный шаман?";
};

FUNC int  Info_Xardas_EVENTWHERE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHERE_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_01"); //Где живет этот изгнанный шаман?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_02"); //Отправляйся на восток, к старой крепости. Ты не заблудишься - она стоит на вершине горы, и ее видно издалека.
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_03"); //В нее можно зайти?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_04"); //На самом деле, от старой крепости остались лишь обломки стен. Она была разрушена еще несколько десятилетий назад.
}; 

//---------------------------------------------------------------------
//	Info ACCEPT
//---------------------------------------------------------------------
instance  Info_Xardas_ACCEPT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_ACCEPT_Condition;
	information	= Info_Xardas_ACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description = "Я добьюсь ответов от этого шамана!";
};

FUNC int  Info_Xardas_ACCEPT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHY)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTHOW)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHERE)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_ACCEPT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_ACCEPT_15_01"); //Я добьюсь ответов от этого шамана!
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_02"); //Мой слуга уже отдал тебе Руну Телепортации. В любой момент она перенесет тебя в пентаграмму, которая находится в нижнем зале.
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_03"); //У тебя не будет проблем с возвращением.

	B_Story_CordsPost();		// Falls Spieler Gorn am Wassermagier-Pentragramm nicht angesprochen hat!
	B_Story_FindOrcShaman();
	
	AI_StopProcessInfos(self);
}; 
/*------------------------------------------------------------------------
						SCROLLS UND RUNEN VERKAUFEN							
------------------------------------------------------------------------*/

instance  Kdf_404_Xardas_SELLMAGICSTUFF (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information		= Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important		= 0;
	permanent		= 1;
	trade			= 1;
	description		= "Я хочу постигать суть магии."; 
	
};

FUNC int  Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{	
	if ( Npc_KnowsInfo(hero, Info_Xardas_ACCEPT))
	{
		return TRUE;
	};

};
FUNC void  Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
	AI_Output (other, self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //Я хочу постигать суть магии.
};

//---------------------------------------------------------------------
//	Info RETURN
//---------------------------------------------------------------------
instance  Info_Xardas_RETURN (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_RETURN_Condition;
	information	= Info_Xardas_RETURN_Info;
	important	= 0;
	permanent	= 0;
	description = "Я добился ответов от шамана орков!";
};

FUNC int  Info_Xardas_RETURN_Condition()
{	
	if	UrShak_SpokeOfUluMulu
	&&	!EnteredTemple
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_RETURN_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_01"); //Я добился ответов от шамана орков!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_02"); //Ну, так говори же!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_03"); //Пять шаманов призвали Спящего и выстроили для него подземный храм, вход в который находится в городе орков.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_04"); //Все верно.
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_05"); //Но демоны не знают благодарности - и Спящий вырвал их сердца и обрек строителей храма на вечное служение ему в облике нежити.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_06"); //Хорошо, очень хорошо!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_07"); //Орки запечатали храм и начали приносить жертвы, дабы умиротворить демона.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_08"); //Нашел ли ты путь ко входу в храм?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_09"); //Да, есть орк, который...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_10"); //Избавь меня от подробностей! Отправляйся в подземный храм! Там сокрыт наш единственный шанс уничтожить Барьер!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_11"); //Но я не понимаю!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_12"); //Не ты ли взывал ко мне о помощи, желая уничтожить Барьер?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_13"); //Это так, но...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_14"); //ТАК ИДИ ЖЕ! Мы и так уже потратили впустую немало времени! Отправляйся в подземный храм и найди там ответ!

	B_Story_ReturnedFromUrShak();
}; 

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info FOUNDTEMPLE
//---------------------------------------------------------------------
instance  Info_Xardas_FOUNDTEMPLE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FOUNDTEMPLE_Condition;
	information		= Info_Xardas_FOUNDTEMPLE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я нашел путь в подземный храм!"; 
};

FUNC int  Info_Xardas_FOUNDTEMPLE_Condition()
{	
	if (EnteredTemple)
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_FOUNDTEMPLE_Info()
{
	AI_Output (other, self,"Info_Xardas_FOUNDTEMPLE_15_01"); //Я нашел путь в подземный храм!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_02"); //ТЕБЕ УДАЛОСЬ... Это невероятно!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_03"); //Сила твоя растет, и уже сейчас с тобой не может сравниться ни один из живущих в плену Барьера.
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_04"); //Быть может, именно о тебе говорят оркские пророчества!
};

//---------------------------------------------------------------------
//	Info PROPHECY
//---------------------------------------------------------------------
instance  Info_Xardas_PROPHECY (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_PROPHECY_Condition;
	information		= Info_Xardas_PROPHECY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Пророчества? Какие пророчества?"; 
};

FUNC int  Info_Xardas_PROPHECY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Xardas_FOUNDTEMPLE))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_PROPHECY_Info()
{
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_01"); //Пророчества? Какие пророчества?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_02"); //В древних книгах орков, написанных вскоре после того как был запечатан подземный храм, упоминается 'Священный Враг'.
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_03"); //Священный враг?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_04"); //Человек, который придет, чтобы навсегда избавить этот мир от Спящего!
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_05"); //И обо мне говорят древние пророчества??? Ты, должно быть, ошибся!
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_06"); //Может быть... А может быть и нет!
};

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD_Condition;
	information		= Info_Xardas_LOADSWORD_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я нашел этот странный меч."; 
};

FUNC int  Info_Xardas_LOADSWORD_Condition()
{	
	if ( Npc_HasItems ( hero, Mythrilklinge ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD_Info()
{
	AI_Output				(other, self,"Info_Xardas_LOADSWORD_15_01"); //Я нашел этот странный меч.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_02"); //Покажи мне его.

	CreateInvItem 			(self, Mythrilklinge01);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);

	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_03"); //Как интересно... На нем выбито слово 'УРИЗЕЛЬ'.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_04"); //Я слышал об этом мече. Он пришел из тех дней, которые принято называть зарей человечества.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_05"); //Меч этот выкован из неведомого металла, и в древних книгах нет ни строчки о его создателях.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_06"); //Говорят, что он обладает невероятной силой, но я даже не чувствую в нем магии. 
	
	Npc_RemoveInvItem 		(hero, Mythrilklinge);	
	CreateInvItem 			(hero, Mythrilklinge01);
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD01 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD01_Condition;
	information		= Info_Xardas_LOADSWORD01_Info;
	important		= 0;
	permanent		= 0;
	description		= "УРИЗЕЛЬ обладает невероятной силой?"; 
};

FUNC int  Info_Xardas_LOADSWORD01_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD ))
	{			
		return TRUE;
	};	
};


FUNC void  Info_Xardas_LOADSWORD01_Info()
{
	Npc_RemoveInvItem 	(self, Mythrilklinge01);

	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_01"); //УРИЗЕЛЬ обладает невероятной силой?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_02"); //Встречаются упоминания о том, что меч этот без труда пронзает любые доспехи и разрушает самые мощные защитные заклинания.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_03"); //Как могло оружие такой силы попасть в лапы орков?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_04"); //Утверждают, что орки забрали его у могучего воина. Не зная, как владеть таким мечом, они просто спрятали его!
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_05"); //Но спрятали недостаточно хорошо!
};

//---------------------------------------------------------------------
//	Info LOADSWORD02
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD02 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD02_Condition;
	information		= Info_Xardas_LOADSWORD02_Info;
	important		= 0;
	permanent		= 0;
	description		= "Можно ли вернуть былую силу этого оружия?"; 
};

FUNC int  Info_Xardas_LOADSWORD02_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD01 ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD02_Info()
{
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_01"); //Можно ли вернуть былую силу этого оружия?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_02"); //Для этого тебе понадобится очень сильный источник магической энергии.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_03"); //Такой, что способен разрушить даже магический Барьер?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_04"); //Примерно такой...
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_05"); //Помимо этого тебе потребуется довольно необычное заклинание для переноса энергии.
	AI_Output			(self, other,"Info_Xardas_LOADSWORD02_14_06"); //Через некоторое время я подготовлю его для тебя.

	B_Story_ShowedUrizielToXardas();
};


//---------------------------------------------------------------------
//	Info BETTERARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_BETTERARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_BETTERARMOR_Condition;
	information		= Info_Xardas_BETTERARMOR_Info;
	important		= 0;
	permanent		= 0;
	description		= "А я тем временем поищу себе доспехи получше!"; 
};

FUNC int  Info_Xardas_BETTERARMOR_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD02))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_BETTERARMOR_Info()
{
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_01"); //А я тем временем поищу себе доспехи получше!

	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if (armorInstance == CRW_ARMOR_H)
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_02"); //В подземном храме эту кольчугу из панцирей ползунов дырявили слишком часто.
	}
	else if (armorInstance == KDW_ARMOR_H) || (armorInstance == KDW_ARMOR_L)		
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_03"); //Эта голубая рвань не слишком хорошо защищала меня в подземном храме. 
	}
	else
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_04"); //Нежить буквально изрешетила мои старые доспехи.
	};
	
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_05"); //Ты должен будешь пойти в мою старую башню.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_06"); //Твою старую башню?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_07"); //После землетрясения она оказалась на дне одного из восточных озер. Шпиль до сих пор торчит из воды.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_08"); //А внутри по-прежнему есть несколько ценных артефактов. Я ни разу не пытался вернуть их. 
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_09"); //Как я туда попаду?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_10"); //Я не был там после землетрясения, так что вход тебе придется искать самому.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_11"); //Но возьми этот ключ. Им ты сможешь открыть сундук, в котором я хранил несколько чрезвычайно редких магических вещиц.

	B_Story_ExploreSunkenTower();
};


//---------------------------------------------------------------------
//	Info OREARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_OREARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_OREARMOR_Condition;
	information		= Info_Xardas_OREARMOR_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Info_Xardas_OREARMOR_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OREARMOR_Info()
{
	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if	(armorInstance == ORE_ARMOR_M)
	||	(armorInstance == ORE_ARMOR_H)
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_01"); //Я вижу на тебе железные доспехи.
	}
	else
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_02"); //Я вижу, ты нашел железные доспехи.
	};
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_03"); //Я нашел его в одном из старых сундуков в затонувшей башне.
	AI_Output		(self, other,"Info_Xardas_OREARMOR_14_04"); //Когда-то он принадлежал тому же воину, который сражался против орков с УРИЗЕЛЕМ в руках.
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_05"); //Надеюсь, он принесет мне больше удачи, чем своему прежнему хозяину.
};

//---------------------------------------------------------------------
//	Info FORMULA 
//---------------------------------------------------------------------
instance  Info_Xardas_FORMULA (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FORMULA_Condition;
	information		= Info_Xardas_FORMULA_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ты подготовил заклинание, для возвращения силы УРИЗЕЛЯ?";
};

FUNC int  Info_Xardas_FORMULA_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	||	Npc_HasItems(hero, ItArRuneTeleport1)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_FORMULA_Info()
{
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_01"); //Ты подготовил заклинание, для того чтобы вернуть былую силу УРИЗЕЛЯ?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_02"); //Оно готово. Но ты не сможешь воспользоваться им.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_03"); //Почему?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_04"); //Его должен произносить маг, пока ты будешь касаться мечом источника магической энергии.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_05"); //Что ж, придется позвать кого-нибудь на помощь.
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_06"); //Возьми заклинание и верни былую силу этого меча. Она тебе потребуется!

	B_Story_LoadSword();
};

//---------------------------------------------------------------------
//	Info ALTRUNE 
//---------------------------------------------------------------------
instance  Info_Xardas_ALTRUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_ALTRUNE_Condition;
	information		= Info_Xardas_ALTRUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Но я же маг! Мне нелего будет управляться с мечом!";
};

FUNC int  Info_Xardas_ALTRUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_FORMULA)
	&&	((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB))
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_ALTRUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_ALTRUNE_15_01"); //Но я же маг! Мне нелего будет управляться с мечом!
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_02"); //Есть один способ...
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_03"); //Но прежде восстанови силу меча - и затем возвращайся!
};


//---------------------------------------------------------------------
//	Info SWORDLOADED
//---------------------------------------------------------------------
instance  Info_Xardas_SWORDLOADED (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_SWORDLOADED_Condition;
	information		= Info_Xardas_SWORDLOADED_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я восстановил УРИЗЕЛЬ!"; 
};

FUNC int  Info_Xardas_SWORDLOADED_Condition()
{	
	if  Npc_HasItems(hero,Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_SWORDLOADED_Info()
{
	AI_Output		(other, self,"Info_Xardas_SWORDLOADED_15_01"); //Я восстановил УРИЗЕЛЬ!
	AI_Output		(self, other,"Info_Xardas_SWORDLOADED_14_02"); //Невероятно: меч вновь обрел былую силу! Теперь в твоих руках действительно мощное оружие! 

	Wld_InsertItem			(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");	//Unblutige Lцsung fьrґs Ich-brauch-Orc-Statue-Massaker ***Bjцrn***

};

//---------------------------------------------------------------------
//	Info MAKERUNE
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNE_Condition;
	information		= Info_Xardas_MAKERUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ты говорил, что даже маг сможет воспользоваться этим мечом."; 
};

FUNC int  Info_Xardas_MAKERUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_ALTRUNE)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SWORDLOADED)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_01"); //Ты говорил, что даже маг сможет воспользоваться этим мечом.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_02"); //Присмотрись к нему повнимательнее. Видишь этот синий камень в основании клинка?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_03"); //В нем заключена вся магическая сила УРИЗЕЛЯ.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_04"); //Если забрать его оттуда, я смогу создать магическую руну с теми же свойствами.
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_05"); //Сделать из меча магическую руну?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_06"); //В бою сила ее не уступит силе УРИЗЕЛЯ!
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_07"); //Но помни: лишь магу Шестого Круга посвящения под силу будет управиться с этой могущественной руной!
};

//---------------------------------------------------------------------
//	Info MAKERUNEDOIT
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNEDOIT (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNEDOIT_Condition;
	information		= Info_Xardas_MAKERUNEDOIT_Info;
	important		= 0;
	permanent		= 1;
	description		= "Возьми камень из УРИЗЕЛЯ!"; 
};

FUNC int  Info_Xardas_MAKERUNEDOIT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_MAKERUNE)
	&&	Npc_HasItems (hero,	Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNEDOIT_Info()
{
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_01"); //Возьми камень из УРИЗЕЛЯ!
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	{
		AI_Output		(self, other,"Info_Xardas_MAKERUNEDOIT_14_02"); //Но ты еще не прошел Шестой Круг магии!
	};
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_03"); //Это твое окончательное решение. Ты действительно хочешь, чтобы я забрал этот камень?

	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"ДА, сделай это!",	Info_Xardas_MAKERUNE_YES);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"НЕТ, не делай этого!",	Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_04"); //ДА, сделай это!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_05"); //Как пожелаешь... Вот, возьми пустой меч и руну!

	Npc_RemoveInvItem 	(hero, Mythrilklinge02);
	CreateInvItems 		(self, UrizielRune, 2);	
	B_GiveInvItems      (self, hero, UrizielRune, 2);// Wegen Ausgabe "2 Items ьbergeben", wird direkt angeglichen
	Npc_RemoveInvItem	(hero, UrizielRune);
	CreateInvItem		(hero, Mythrilklinge03);
	B_LogEntry			(CH5_Uriziel,"Ксардас удалил магический камень из меча УРИЗЕЛЯ. Теперь сила меча заключена в магической руне несказанной мощи.");
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_SUCCESS);
};	

func void Info_Xardas_MAKERUNE_NO ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_06"); //НЕТ, не делай этого!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_07"); //Как пожелаешь. Магическая сила останется в этом мече!
};	
	

//---------------------------------------------------------------------
//	Info LOADSWORD9 --> SC kann DMB werden
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD09 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD09_Condition;
	information		= Info_Xardas_LOADSWORD09_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,0); 
};

FUNC int  Info_Xardas_LOADSWORD09_Condition()
{	
	if (EnteredTemple)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{			
		return TRUE;
	};	
};
func void  Info_Xardas_LOADSWORD09_Info()
{
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//Ты научишь меня?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //Я подниму тебя в Шестой Круг магии.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //Заметь, в Шестой Круг могут вступить лишь самые могущественные из магов. Он предназначен для тех, чья жизнь - это знак.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //Твой знак - в объединении стихий.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //Шестой Круг позволит тебе использовать магию любой руны.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //И не забудь: не захватывать силу, но быть ее источником.
			
			CreateInvItem 		(hero, DMB_ARMOR_M);		// SN: kann nicht mit B_GiveInvItem() ьbergeben werden, da Xardas sonst nackt dasteht!
			AI_EquipBestArmor	(hero);

			//Fakeitem fьr Bildschirmausgabe
			CreateInvItem		(self,			ItAmArrow);
			B_GiveInvItems		(self, hero,	ItAmArrow, 1);
			Npc_RemoveInvItem	(hero,			ItAmArrow);

			hero.guild 	= GIL_DMB;	
			Npc_SetTrueGuild	( hero, GIL_DMB );	
			Info_Xardas_LOADSWORD09.permanent = 0;
			AI_StopProcessInfos	( self );
		};
	}
	else 
	{
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//Не сейчас. У тебя есть все навыки, но ты еще недостаточно опытен. Пусть сначала с тобой позанимается Сатурас.
		
		AI_StopProcessInfos	( self );
	};
};

	
