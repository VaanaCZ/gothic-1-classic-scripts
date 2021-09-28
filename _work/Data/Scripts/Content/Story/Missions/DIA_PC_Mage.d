//*********************************************
//					 EXIT
//*********************************************
instance DIA_Milten_EXIT (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 999;
	condition	= DIA_Milten_EXIT_Condition;
	information	= DIA_Milten_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Milten_EXIT_Condition()
{
	return 1;
};

func VOID DIA_Milten_EXIT_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_00"); //Идем.
	}
	else
	{
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_01"); //Увидимся.
	};
	AI_StopProcessInfos	(self);
};

//*********************************************
//					First
//*********************************************

instance DIA_Milten_First (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_First_Condition;
	information	= DIA_Milten_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Milten_First_Condition()
{
	if ( (CorKalom_BringMCQBalls != LOG_SUCCESS) && (!Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE)) )
	&& (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};
};

func VOID DIA_Milten_First_Info()
{
	AI_Output (self, other,"DIA_Milten_First_02_00"); //Ты не должен переступать этот порог до тех пор, пока не получишь разрешение от господина Корристо.
};

//*********************************************
//					 hallo
//*********************************************

instance DIA_Milten_Hello (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_Hello_Condition;
	information	= DIA_Milten_Hello_Info;
	permanent	= 0;
	description = "Я ищу Верховного Мага Круга Огня.";
};                       

FUNC INT DIA_Milten_Hello_Condition()
{
	if (Saturas_BringFoci == FALSE) && (!Npc_KnowsInfo(hero,DIA_Milten_GotoCorristo))
	{
		return 1;
	};
};

func VOID DIA_Milten_Hello_Info()
{
	AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Я ищу Верховного Мага Круга Огня.
	AI_Output (self, other,"DIA_Milten_Hello_02_01"); //Это Корристо. Зачем он тебе нужен?
};

//*********************************************
//					GotoCorristo
//*********************************************
	
instance DIA_Milten_GotoCorristo (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_GotoCorristo_Condition;
	information	= DIA_Milten_GotoCorristo_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Milten_GotoCorristo_Condition()
{
	if  ( (CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE) )
	&&  (Npc_GetTrueGuild (hero) == GIL_STT) 
	{
		return 1;
	};
};

func VOID DIA_Milten_GotoCorristo_Info()
{
	if ( (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) || (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) )
	{
		//***kopierte AI_outputs, falls SC Brief noch hat***
		AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Я ищу Верховного Мага Круга Огня.
		AI_Output (self, other,"DIA_Milten_Hello_02_01"); //Это Корристо. Зачем он тебе нужен?
		AI_Output (other, self,"DIA_Milten_Letter_15_00"); //У меня письмо для Верховного Мага Круга Огня.
		//AI_Output (self, other,"DIA_Milten_Letter_02_01"); //Bist du ein Bote aus der AuЯenwelt?
		//AI_Output (other, self,"DIA_Milten_Letter_15_02"); //Ja. Ein Magier gab mir den Brief, kurz bevor sie mich in die Kolonie geworfen haben.
		AI_Output (self, other,"DIA_Milten_Letter_02_03"); //Покажи мне это письмо.
		AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Вот оно.
		B_GiveXP(XP_XardasLetter);
		if		Npc_HasItems(other,ItWr_Fire_Letter_01)
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
		}
		else if	Npc_HasItems(other,ItWr_Fire_Letter_02) 
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
		};
		AI_Output (other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //А как насчет небольшой награды?
		AI_Output (self,hero,"Info_Milten_SHSEAL_02_05"); //В этом больше нет необходимости.
		//***kopierte AI_outputs ENDE***
	};
	
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_01"); //Мы слышали о твоих подвигах в Старой Шахте. Без ползунов добыча руды идет гораздо спокойнее.
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_02"); //Корристо тоже слышал о тебе. Он хочет поговорить с тобой. Иди к нему.
};

//*********************************************
//				 Got Brief
//*********************************************
	var int milten_HasLetter;
//*********************************************

instance DIA_Milten_Letter (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_Letter_Condition;
	information	= DIA_Milten_Letter_Info;
	permanent	= 0;
	description = "У меня есть письмо Верховному Магу Круга Огня.";
};                       

FUNC INT DIA_Milten_Letter_Condition()
{
	if	( (Npc_KnowsInfo(hero, DIA_Milten_Hello)) && ( (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) || (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) ) )
	&&	(Kapitel < 4) && (Saturas_BringFoci == FALSE)
	{
		return 1;
	};
};

func VOID DIA_Milten_Letter_Info()
{
	AI_Output			(other, self,"DIA_Milten_Letter_15_00"); //У меня письмо для Верховного Мага Круга Огня.
	AI_Output			(self, other,"DIA_Milten_Letter_02_01"); //Ты гонец из Внешнего Мира?
	AI_Output			(other, self,"DIA_Milten_Letter_15_02"); //Да. Один из магов дал мне это письмо, прежде чем меня забросили в колонию.
	AI_Output			(self, other,"DIA_Milten_Letter_02_03"); //Покажи мне это письмо.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Прежде я хочу получить свою награду.",DIA_Milten_Letter_NO);
	Info_AddChoice		(DIA_Milten_Letter,"Вот оно.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_Give()
{
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Вот оно.
	B_UseFakeScroll();
	
	B_GiveXP(XP_XardasLetter);
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_03"); //Это письмо адресовано Ксардасу!
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_04"); //И что в этом такого?
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_05"); //Ксардас оставил служение Инносу много лет назад. Он ушел отсюда и посвятил свою жизнь черной магии.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_06"); //Он живет в башне в центре земель орков и занимается только своими исследованиями. 
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_07"); //Он сказал, что выяснит сам, что пошло не так при возведении Барьера.
	
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_08"); //Жди здесь. Я скоро вернусь.
	AI_StopProcessInfos	(self);
	AI_GotoWP (self, "OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self, "OCC_CHAPEL_ENTRANCE");

	if		Npc_HasItems(other,ItWr_Fire_Letter_01)
	{ 
		B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
	}
	else if	Npc_HasItems(other,ItWr_Fire_Letter_02) 
	{ 
		B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
	};
	milten_HasLetter = TRUE;
	Npc_SetRefuseTalk(self,10);
};

func void DIA_Milten_Letter_NO()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_15_00"); //Прежде я хочу получить свою награду.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_01"); //Корристо прикажет Торрезу выдать ее тебе, как только получит письмо.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_02"); //Я служитель Инноса, я никогда не лгу. Теперь ты можешь отдать мне письмо.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Я бы предпочел сам отдать письмо Торрезу.",DIA_Milten_Letter_NO_AGAIN);
	Info_AddChoice		(DIA_Milten_Letter,"Вот оно.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_NO_AGAIN()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_00"); //Я бы предпочел сам отдать письмо Торрезу.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_01"); //Смогу ли я тебя переубедить?
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_02"); //Нет. Я хочу получить свою награду.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_03"); //Хорошо. Если ты этого хочешь. Жди здесь.

	Info_ClearChoices	(DIA_Milten_Letter);
	AI_StopProcessInfos	(self);

	AI_GotoWP (self, "OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self, "OCC_CHAPEL_ENTRANCE");
	milten_HasLetter = FALSE;
	Npc_SetRefuseTalk(self,10);
};

//*********************************************
//				 Got Brief
//*********************************************

instance DIA_Milten_ComesBack (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_ComesBack_Condition;
	information	= DIA_Milten_ComesBack_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Milten_ComesBack_Condition()
{
	if ( (Npc_KnowsInfo(hero, DIA_Milten_Letter)) && (Npc_RefuseTalk(self) == FALSE) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_ComesBack_Info()
{
	if (milten_HasLetter==FALSE)
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_00"); //Корристо огорчило известие о том, что ты не доверяешь служителям Инноса.
		AI_Output (self, other,"DIA_Milten_ComesBack_02_01"); //Но он позволил тебе встретиться с Торрезом и получить обычную награду.
	}
	else
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_02"); //Корристо был в полном восторге. Он сказал, что ты можешь встретиться с Торрезом и выбрать себе награду.
	};
};

//*********************************************
//			Wo finde ich Torrez?
//*********************************************
	
instance DIA_Milten_WoTorrez (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_WoTorrez_Condition;
	information	= DIA_Milten_WoTorrez_Info;
	permanent	= 0;
	description	= "Где мне искать Торреза?";
};                       

FUNC INT DIA_Milten_WoTorrez_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Milten_ComesBack) && (Saturas_BringFoci == FALSE) )
	{
		return 1;
	};
};

func VOID DIA_Milten_WoTorrez_Info()
{
	AI_Output (other, self,"DIA_Milten_WoTorrez_15_00"); //Где мне искать Торреза?
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_01"); //Весь день он стоит перед храмом.
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_02"); //Ночи же он проводит в своей келье. Поскольку лишь маги могут войти в храм, тебе придется поговорить с ним днем.
};

//*********************************************
//				Noch ein Brief
//*********************************************
	
instance DIA_Milten_NochEinBrief (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 2;
	condition	= DIA_Milten_NochEinBrief_Condition;
	information	= DIA_Milten_NochEinBrief_Info;
	permanent	= 0;
	description = "У меня письмо от магов Воды.";
};                       

FUNC INT DIA_Milten_NochEinBrief_Condition()
{
	if ( (Cronos_Messenger == LOG_RUNNING) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_NochEinBrief_Info()
{
	AI_Output (other, self,"DIA_Milten_NochEinBrief_15_00"); //У меня письмо от магов Воды.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_01"); //А! Очень хорошо! Я передам его Корристо.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_02"); //Когда вернешься в Новый Лагерь, маги Воды вознаградят тебя за труды.
	
	Cronos_Messenger = LOG_SUCCESS;
	B_GiveInvItems (other,self,Cronos_Brief,1);
};

//*********************************************
//					PERM
//*********************************************
	
instance DIA_Milten_PERM (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_PERM_Condition;
	information	= DIA_Milten_PERM_Info;
	permanent	= 0;
	description = "Расскажи мне о магах Огня.";
};                       

FUNC INT DIA_Milten_PERM_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Milten_ComesBack) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_PERM_Info()
{
	AI_Output (other, self,"DIA_Milten_PERM_15_00"); //Расскажи мне о магах Огня.
	AI_Output (self, other,"DIA_Milten_PERM_02_01"); //Круг Огня обретает свою силу с благословения Инноса. Бог света и истины благоволит нам.
	AI_Output (self, other,"DIA_Milten_PERM_02_02"); //Маги считают себя избранными - ну и ко всем остальным относятся соответственно.
	AI_Output (self, other,"DIA_Milten_PERM_02_03"); //Мне повезло, что меня приняли. Корристо сделал меня своим учеником. По-моему, он просто хотел немного развлечься.
	AI_Output (self, other,"DIA_Milten_PERM_02_04"); //С тех пор я ежедневно совершенствую свои магические навыки, чтобы быть допущенным в следующий Круг.
};

//*********************************************
//					WannaMage
//*********************************************
	
instance DIA_Milten_WannaMage (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 2;
	condition	= DIA_Milten_WannaMage_Condition;
	information	= DIA_Milten_WannaMage_Info;
	permanent	= 1;
	description = "Я тоже хочу стать учеником мага, как ты.";
};                       

FUNC INT DIA_Milten_WannaMage_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Milten_PERM) && (CorKalom_BringMCQBalls != LOG_SUCCESS) )
	{
		return 1;
	};
};

func VOID DIA_Milten_WannaMage_Info()
{
	AI_Output (other, self,"DIA_Milten_WannaMage_15_00"); //Я тоже хочу стать учеником мага, как ты.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_01"); //Корристо выбрал меня, потому что я помогал Баронам.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_02"); //До тех пор, пока ты не сделаешь что-нибудь исключительное, он и разговаривать не захочет о твоем обучении.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_03"); //Помимо этого, ты должен принадлежать к Старому Лагерю. Сомневаюсь, что Корристо возьмет себе в ученики человека из другой части колонии.
};





		
	







//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info SHWAIT
//***************************************************************************
instance Info_Milten_SHWAIT (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHWAIT_Condition;
	information	= Info_Milten_SHWAIT_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHWAIT_Condition()
{
	if ( Npc_GetDistToWP ( hero, "OW_PATH_274")<1000)
	{
		return 1;
	};	
};

func void Info_Milten_SHWAIT_Info()
{
	AI_GotoNpc		(self,hero);
	
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_01"); //Приветствую! Мой друг Лестер из Болотного Лагеря рассказал мне о тебе.
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_02"); //Я поражен. Ты стал очень сильным.
	AI_Output		(hero,self,"Info_Milten_SHWAIT_15_03"); //Стараюсь.
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_04"); //Ах, да. Как всегда откровенен, да?
};

//***************************************************************************
//	Info SHGORN
//***************************************************************************
instance Info_Milten_SHGORN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHGORN_Condition;
	information	= Info_Milten_SHGORN_Info;
	important	= 0;
	permanent	= 0;
	description	= "Я видел Горна.";
};

FUNC int Info_Milten_SHGORN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT) && Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHGORN_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_01"); //Я видел Горна.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_02"); //В самом деле? И где?
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_03"); //В разрушенном монастыре у моря. Мы с ним вдвоем обыскивали развалины в поисках сокровищ.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_04"); //Уверен, что он расскажет мне обо всем, когда мы встретимся вновь.
};

//***************************************************************************
//	Info SHLESTER
//***************************************************************************
instance Info_Milten_SHLESTER (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHLESTER_Condition;
	information	= Info_Milten_SHLESTER_Info;
	important	= 0;
	permanent	= 0;
	description	= "Мы с Лестером осмотрели форт в горах.";
};

FUNC int Info_Milten_SHLESTER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT) && Npc_KnowsInfo(hero, PC_Psionic_FINISH))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHLESTER_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_01"); //Мы с Лестером осмотрели форт в горах.
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_02"); //Он говорил мне об этом. Похоже, тебе можно доверять.
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_03"); //Так где же вы четверо уже встречались?
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_04"); //О, здесь и там - в самых разных местах.
};

//***************************************************************************
//	Info SHYOU
//***************************************************************************
instance Info_Milten_SHYOU (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHYOU_Condition;
	information	= Info_Milten_SHYOU_Info;
	important	= 0;
	permanent	= 0;
	description	= "Чем ты занимаешься?";
};

FUNC int Info_Milten_SHYOU_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT))
	{
		return 1;
	};	
};

func void Info_Milten_SHYOU_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_01"); //Что ты здесь делаешь?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_02"); //Неподалеку отсюда находится древнее каменное кольцо, в центре которого есть вход в подземелье.
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_03"); //Что-то вроде склепа?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_04"); //Да, что-то вроде.
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_05"); //Мне нужно кое-что добыть из этого склепа.
};

//***************************************************************************
//	Info SHME
//***************************************************************************
instance Info_Milten_SHME (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHME_Condition;
	information	= Info_Milten_SHME_Info;
	important	= 0;
	permanent	= 0;
	description	= "Я ищу юнитор. ";
};

FUNC int Info_Milten_SHME_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_SHWAIT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	{
		return 1;
	};	
};

func void Info_Milten_SHME_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHME_15_01"); //Я ищу юнитор. Он должен быть где-то здесь.
	AI_Output		(self,hero,"Info_Milten_SHME_02_02"); //Похоже, нам обоим нужно попасть в одно и то же место.
};

//***************************************************************************
//	Info SHPROBLEM
//***************************************************************************
instance Info_Milten_SHPROBLEM (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHPROBLEM_Condition;
	information	= Info_Milten_SHPROBLEM_Info;
	important	= 0;
	permanent	= 0;
	description	= "Почему ты сам не спустишься в этот склеп?";
};

FUNC int Info_Milten_SHPROBLEM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHYOU))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_01"); //Почему ты сам не спустишься в этот склеп и не заберешь то, что тебе нужно?
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_02"); //А, долгая история. Слишком многое придется рассказывать, чтобы объяснить.
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_03"); //Валяй, я не тороплюсь.
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_04"); //Хорошо! После сотворения магического Барьера, поработившего всех нас...
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_05"); //... один из магов укрыл там магический артефакт.
};

//***************************************************************************
//	Info SHFOCUS
//***************************************************************************
instance Info_Milten_SHFOCUS (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHFOCUS_Condition;
	information	= Info_Milten_SHFOCUS_Info;
	important	= 0;
	permanent	= 0;
	description	= "Так это один из пяти камней-юниторов?";
};

FUNC int Info_Milten_SHFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHFOCUS_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_01"); //Так это один из пяти камней-юниторов?
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_02"); //Точно! Так ты уже знаешь историю об этих пяти камнях?
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_03"); //Только не говори мне, что тебе тоже нужен юнитор!
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_04"); //Нет, юнитор мне не нужен, но зато я ищу талисман орков.
};

//***************************************************************************
//	Info SHSEAL
//***************************************************************************
instance Info_Milten_SHSEAL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSEAL_Condition;
	information	= Info_Milten_SHSEAL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Артефакт был замурован в склепе?";
};

FUNC int Info_Milten_SHSEAL_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSEAL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_01"); //Артефакт был замурован в склепе?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_02"); //Да. Его защищает могущественная магия. Первый из воров, кто попытается стянуть юнитор...
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_03"); //... будет проклят и обречен в облике нежити охранять гробницу от других воров... Вечно.
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_04"); //Как обойти это заклятье?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_05"); //В этом больше нет необходимости.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_06"); //Несколько лет назад один из Баронов, развлекавшихся охотой на орков, решил заглянуть в гробницу.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_07"); //И теперь ОН стережет там сокровища.
};

//***************************************************************************
//	Info SHTALISMAN
//***************************************************************************
instance Info_Milten_SHTALISMAN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHTALISMAN_Condition;
	information	= Info_Milten_SHTALISMAN_Info;
	important	= 0;
	permanent	= 0;
	description	= "Что это за талисман?";
};

FUNC int Info_Milten_SHTALISMAN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHFOCUS))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHTALISMAN_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHTALISMAN_15_01"); //Что это за талисман?
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_02"); //Я думаю, последний владелец использовал его для защиты от злобных орков.
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_03"); //Если я прав, этот талисман может оказаться очень полезным.
};

//***************************************************************************
//	Info SHOFFER
//***************************************************************************
instance Info_Milten_SHOFFER (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHOFFER_Condition;
	information	= Info_Milten_SHOFFER_Info;
	important	= 0;
	permanent	= 0;
	description	= "Мы можем осмотреть эту гробницу вместе.";
};

FUNC int Info_Milten_SHOFFER_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHSEAL)
	&&		Npc_KnowsInfo(hero, Info_Milten_SHTALISMAN)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHOFFER_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_01"); //Мы можем осмотреть эту гробницу вместе. Ты заберешь талисман, а я найду юнитор.
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_02"); //Все это хорошо, но есть одна проблема...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_03"); //Проблема?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_04"); //Да. Тот, кто охраняет эту гробницу.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_05"); //Думаю, можно просто порубить его на куски.
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_06"); //Это не так-то просто. Кажется, он не вполне поддается обычному оружию.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_07"); //Но у тебя, как я понимаю, уже есть план.
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_08"); //Х-м... ну... план-то есть, но одному мне не справиться.
};

//***************************************************************************
//	Info SHOFFER2
//***************************************************************************
instance Info_Milten_SHOFFER2 (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHOFFER2_Condition;
	information	= Info_Milten_SHOFFER2_Info;
	important	= 0;
	permanent	= 0;
	description	= "Рассказывай!";
};

FUNC int Info_Milten_SHOFFER2_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHOFFER)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHOFFER2_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_01"); //Рассказывай!
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_02"); //У меня есть свиток с очень мощным заклинанием.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_03"); //Оно способно уничтожить любую нежить.
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_04"); //Но тогда мы запросто сможем осмотреть гробницу!
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_05"); //М-м-м... Ну... Не совсем. С некоторых пор там обитает не только страж.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_06"); //Все те грабители, что были после него... и оказались столь же невезучими.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_07"); //Я уже один раз спускался туда и едва не погиб. Одному там не справиться.
};

//***************************************************************************
//	Info SHACCEPT
//***************************************************************************
instance Info_Milten_SHACCEPT (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHACCEPT_Condition;
	information	= Info_Milten_SHACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description	= "Дай мне этот свиток, и мы пойдем туда вместе!";
};

FUNC int Info_Milten_SHACCEPT_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHOFFER2)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHACCEPT_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_01"); //Дай мне этот свиток, и мы пойдем туда вместе!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_02"); //Хорошо! Я надеялся, что ты это скажешь!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_03"); //Но у нас всего один свиток. Необходимо приберечь его для стража.
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_04"); //С остальной нежитью придется сражаться обычным оружием.
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_05"); //Понятно. Как пройти к кругу камней?
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_06"); //Иди за мной.

	Log_CreateTopic		(CH3_Stonehenge,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_RUNNING);
	B_LogEntry		(CH3_Stonehenge,"Я встретил Мильтена, мага огня, рядом с каменным кругом. Он рассказал, что один из камней-юниторов находится в склепе под этим кругом.");
	B_LogEntry		(CH3_Stonehenge,"Мильтен дал мне свиток, чтобы я смог победить стерегущего склеп умертвия. Мы пойдем в этот склеп вместе.");
	
	CreateInvItem		(self,	ItArScrollDestroyUndead);
	B_GiveInvItems  (self, hero, ItArScrollDestroyUndead, 1);

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine	(self, "SHGuide");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHARRIVED
//***************************************************************************
instance Info_Milten_SHARRIVED (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHARRIVED_Condition;
	information	= Info_Milten_SHARRIVED_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHARRIVED_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHACCEPT) && (Npc_GetDistToWP(hero, "OW_PATH_3_STONES")<500) )
	{
		return TRUE;
	};	
};

func void Info_Milten_SHARRIVED_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHARRIVED_02_01"); //Вот мы и пришли. Этот туннель ведет прямиком в гробницу. 
	AI_Output			(hero,self,"Info_Milten_SHARRIVED_15_02"); //Ну, пойдем нанесем визит стражу!

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine	(self,	"SHFollow");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHHEAL
//***************************************************************************
instance Info_Milten_SHHEAL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHHEAL_Condition;
	information	= Info_Milten_SHHEAL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Я ранен. Помоги мне!";
};

FUNC int Info_Milten_SHHEAL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)
	&&		(hero.attribute[ATR_HITPOINTS] < ((hero.attribute[ATR_HITPOINTS_MAX]*7)/10))
	&&		(Npc_HasItems(hero,ItFo_Potion_Health_02) == 0)								)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHHEAL_Info()
{
	AI_Output				(hero,self,"Info_Milten_SHHEAL_15_01"); //Я ранен. Помоги мне!

	if (	(Npc_HasItems(self,ItFo_Potion_Health_02) >  0)		)
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_02"); //Возьми целебный эликсир.
		B_GiveInvItems	    (self, hero,	ItFo_Potion_Health_02,	1);
	}
	else
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_03"); //У меня больше нет целебных эликсиров.
	};	

	AI_StopProcessInfos		(self);
};

//***************************************************************************
//	Info SHRUNNING
//***************************************************************************
instance Info_Milten_SHRUNNING (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHRUNNING_Condition;
	information	= Info_Milten_SHRUNNING_Info;
	important	= 0;
	permanent	= 1;
	description	= "Страж все еще жив!";
};

FUNC int Info_Milten_SHRUNNING_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,Info_Milten_SHACCEPT)
	&&	(keeperFound && !Npc_IsDead(other))							// Wдchter noch nicht besiegt...
	{
		return TRUE;
	};	
};

func void Info_Milten_SHRUNNING_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHRUNNING_15_01"); 	//Страж все еще жив!
	AI_Output			(self,hero,"Info_Milten_SHRUNNING_02_02"); 	//Так уничтожь его заклинанием!
};

//***************************************************************************
//	Info SHSCROLL
//***************************************************************************
instance Info_Milten_SHSCROLL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSCROLL_Condition;
	information	= Info_Milten_SHSCROLL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Я использовал магический свиток.";
};

FUNC int Info_Milten_SHSCROLL_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);
	if (	(keeperFound && !Npc_IsDead(other))							// Wдchter noch nicht besiegt...
	&&		Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		(Npc_HasItems(hero, ItArScrollDestroyUndead)==0)	
	&&		(Npc_HasItems(hero, ItArRuneDestroyUndead)==0)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSCROLL_15_01"); //Я потратил заклинание - но не на стража!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_02"); //Только не это! Придумай, как еще можно победить его!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_03"); //Может быть мы сможем купить еще один свиток или какую-нибудь руну в одном из Лагерей?
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_04"); //Я буду ждать тебя там, где мы встретились в прошлый раз.

  	self.aivar[AIV_PARTYMEMBER] =	FALSE;

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"SHWait");
};

//***************************************************************************
//	Info SHNEWSCROLL
//***************************************************************************
instance Info_Milten_SHNEWSCROLL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHNEWSCROLL_Condition;
	information	= Info_Milten_SHNEWSCROLL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Я достал еще один свиток с Заклинанием Ужас Мертвых!";
};

FUNC int Info_Milten_SHNEWSCROLL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHSCROLL)
	&&		!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)	
	&&		((Npc_HasItems(hero, ItArScrollDestroyUndead)>0) ||	(Npc_HasItems(hero, ItArRuneDestroyUndead)>0))	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHNEWSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHNEWSCROLL_15_01"); //Я достал еще один свиток с Заклинанием Ужас Мертвых!
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_02"); //Хорошо. Значит, мы можем еще раз наведаться в гости к стражу.
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_03"); //Иди вперед, я пойду за тобой.

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"SHFollow");
};

//***************************************************************************
//	Info SHLEAVE
//***************************************************************************
instance Info_Milten_SHLEAVE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHLEAVE_Condition;
	information	= Info_Milten_SHLEAVE_Info;
	important	= 1;
	permanent	= 1;
};

FUNC int Info_Milten_SHLEAVE_Condition()
{
	if	 Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)		
	&&	(Npc_GetDistToWP(hero, "OW_PATH_3_STONES")>10000)
  	&&	(self.aivar[AIV_PARTYMEMBER] ==	TRUE)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHLEAVE_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_01"); 	//Похоже, гробница тебя больше не интересует.
	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_02"); 	//Если все-таки передумаешь, ты можешь найти меня там, где мы встретились с тобой в прошлый раз.

  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine	(self,	"SHWait");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHCONTINUE
//***************************************************************************
instance Info_Milten_SHCONTINUE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHCONTINUE_Condition;
	information	= Info_Milten_SHCONTINUE_Info;
	important	= 0;
	permanent	= 1;
	description = "Как ты думаешь, стоит нам еще разок наведаться к стражу?";
};

FUNC int Info_Milten_SHCONTINUE_Condition()
{
	if	(self.aivar[AIV_PARTYMEMBER] == FALSE)
	&&	Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)
	&&	(Npc_GetDistToWP(hero, "OW_PATH_3_STONES")<9000)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHCONTINUE_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(hero,self,"Info_Milten_SHCONTINUE_15_01"); //Как ты думаешь, может быть, нам стоит еще разок наведаться к стражу?
	AI_Output			(self,hero,"Info_Milten_SHCONTINUE_02_02"); //Я готов. Иди вперед, я пойду следом.

  	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"SHFollow");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHSUCCESS
//***************************************************************************
instance Info_Milten_SHSUCCESS (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSUCCESS_Condition;
	information	= Info_Milten_SHSUCCESS_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHSUCCESS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHACCEPT) && Npc_HasItems(hero, ItMi_OrcTalisman))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSUCCESS_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_01"); //Хорошо. Теперь у тебя есть талисман.
	AI_Output			(hero,self,"Info_Milten_SHSUCCESS_15_02"); //Вот он, держи. Как мы и договорились.
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_03"); //Спасибо, друг. Я никогда не забываю тех, кто помог мне.
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_04"); //Я возвращаюсь в Старый Лагерь. Может быть, мы там еще встретимся.
	
	B_GiveInvItems	(hero,self,	ItMi_OrcTalisman, 1);
	
	B_LogEntry		(CH3_Stonehenge,"Вместе мы победили стража под кольцом из камней. Мильтен взял свою часть добычи и вернулся в Старый Лагерь.");
	B_LogEntry		(CH3_Stonehenge,"Сатурас будет рад, что я нашел этот юнитор!");
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine	(self, "ReturnToOC");
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info OCWARN
//***************************************************************************
instance Info_Milten_OCWARN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCWARN_Condition;
	information	= Info_Milten_OCWARN_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

func void Info_Milten_OCWARN_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_OCWARN_02_01"); //Они... Они все мертвы... Все МЕРТВЫ. Я не мог им помочь... Я был... Меня там не было... Я...

	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_02"); //Успокойся, Мильтен, я уже встретил Диего на другом конце Лагеря.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_03"); //Тогда ты должен знать... Что сказал Диего?
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_04"); //Если я смогу найти Горна и Лестера, я предупрежу их и отправлю тебе навстречу.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_05"); //Удачи! Будь осторожен!
		B_LogEntry		(CH4_Firemages,"Как и Диего, Мильтен прячется рядом со Старым Лагерем. Маги огня предупреждают заранее всех тех, кто приближается к главным воротам, чтобы они не попали в руки стражников.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_06"); //Успокойся, Мильтен, что случилось?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_07"); //Все маги Огня мертвы! Все, кроме меня, и я тоже был на волосок от смерти.
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_08"); //Лучше расскажи мне все по порядку, с самого начала.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_09"); //Ладно. Спокойно, Мильтен, спокойно...
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_10"); //Все началось с того, что обрушилась Старая Шахта...
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_11"); //Старая Шахта ОБРУШИЛАСЬ???
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_12"); //Да. Все произошло очень быстро. Никто не уцелел.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_13"); //Вход в шахту блокировали стражники.
	};
};

//***************************************************************************
//	Info OCMINE
//***************************************************************************
instance Info_Milten_OCMINE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCMINE_Condition;
	information	= Info_Milten_OCMINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Как могла обрушиться целая шахта?";
};

FUNC int Info_Milten_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCMINE_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_01"); //Как могла обрушиться целая шахта?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_02"); //Понятия не имею. Те из рудокопов, кто был в тот момент у входа, потом говорили, что началось что-то вроде землетрясения, а потом из туннеля вырвалось огромное облако пыли.
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_03"); //Ты был там?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_04"); //Да. Там я и узнал, что шахта обрушилась.
};

//***************************************************************************
//	Info OCKDW
//***************************************************************************
instance Info_Milten_OCKDW (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCKDW_Condition;
	information	= Info_Milten_OCKDW_Info;
	important	= 0;
	permanent	= 0;
	description = "Что ты говорил по поводу магов Огня?";
};

FUNC int Info_Milten_OCKDW_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCKDW_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCKDW_15_01"); //Что ты говорил по поводу магов Огня?
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_02"); //Я знаю только, что вскоре после того, как шахта обрушилась, их всех убили Бароны.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_03"); //Когда я вернулся от гробницы, стражники у ворот внезапно напали на меня.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_04"); //Они называли меня 'предателем'. Мне едва удалось уйти.
};

//***************************************************************************
//	Info OCWHY
//***************************************************************************
instance Info_Milten_OCWHY (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCWHY_Condition;
	information	= Info_Milten_OCWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Зачем Баронам понадобилось убивать магов? Это же глупо...";
};

FUNC int Info_Milten_OCWHY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCKDW))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCWHY_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCWHY_15_01"); //Зачем Баронам понадобилось убивать магов? Это же глупо...
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_02"); //Ты прав. Но у меня не было шанса спросить об этом у стражников. Они сразу же взялись за мечи.
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_03"); //Возможно, Диего что-то знает. Как раз в то время он был в Лагере.
};

//***************************************************************************
//	Info OCYOU
//***************************************************************************
instance Info_Milten_OCYOU (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCYOU_Condition;
	information	= Info_Milten_OCYOU_Info;
	important	= 0;
	permanent	= 0;
	description = "Тебе нужно спрятаться. Где-нибудь подальше отсюда.";
};

FUNC int Info_Milten_OCYOU_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCKDW))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCYOU_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCYOU_15_01"); //Тебе нужно спрятаться. Где-нибудь подальше отсюда.
	AI_Output			(self,hero,"Info_Milten_OCYOU_02_02"); //Нет. Мы с Диего договорились приглядывать за воротами и предупреждать наших друзей из других Лагерей - они ведь ничего не подозревают!

	if (!Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{	
		AI_Output		(self,hero,"Info_Milten_OCYOU_02_03"); //Пожалуйста, поговори с Диего!
	}
	else
	{
		B_LogEntry		(CH4_Firemages,"После того как Диего рассказал мне о произошедшем, я встретил Мильтена перед Старым Лагерем. Надеюсь, их не поймают");
	};
};

//***************************************************************************
//	Info OCDIEGO
//***************************************************************************
instance Info_Milten_OCDIEGO (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCDIEGO_Condition;
	information	= Info_Milten_OCDIEGO_Info;
	important	= 0;
	permanent	= 0;
	description = "Где искать Диего?";
};

FUNC int Info_Milten_OCDIEGO_Condition()
{
	if Npc_KnowsInfo(hero, Info_Milten_OCWHY)
	&& Npc_KnowsInfo(hero, Info_Milten_OCYOU)
	&& !Npc_KnowsInfo(hero, Info_Diego_OCSTORY)
	{
		return TRUE;
	};	
};

func void Info_Milten_OCDIEGO_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCDIEGO_15_01"); //Где искать Диего?
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_02"); //Он скрывается у вторых ворот, на другом конце Лагеря.
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_03"); //Пожалуйста, поговори с ним!

	B_LogEntry			(CH4_Firemages,"Мильтен перехватил меня перед Старым Лагерем и рассказал об обвале Старой Шахты и убийстве магов огня.");
	B_LogEntry			(CH4_Firemages,"Диего остался на другой стороне Старого Лагеря, неподалеку от задних ворот. Надо бы поговорить с ним: он знает больше о том, что случилось.");
};










//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_LOADSWORD_Condition;
	information	= Info_Milten_LOADSWORD_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_LOADSWORD_Condition()
{
	if (LoadSword)
	{
		return TRUE;
	};	
};

func void Info_Milten_LOADSWORD_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LOADSWORD_02_01"); //Приветствую тебя, мой друг. Много воды утекло с тех пор, как мы виделись последний раз.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_02"); //Привет, Мильтен. Да, с тех пор многое изменилось.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_03"); //Я бы с удовольствием рассказал тебе обо всем, но сейчас я спешу - время поджимает.
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD1 (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LOADSWORD1_Condition;
	information		= Info_Milten_LOADSWORD1_Info;
	important		= 0;
	permanent		= 0;
	description		= "Мильтен, мне нужна твоя помощь!"; 
};

FUNC int Info_Milten_LOADSWORD1_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD)
	{
		return 1;
	};	
};

func void Info_Milten_LOADSWORD1_Info()
{
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_01"); //Мильтен, мне нужна твоя помощь!
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_02"); //Что случилось? Чем я могу тебе помочь?
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_03"); //Нам нужно где-то поговорить.
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_04"); //Хорошо. Иди за мной.

	Npc_ExchangeRoutine	(self,	"LSAway");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info LSAWAY
//---------------------------------------------------------------------
instance Info_Milten_LSAWAY (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSAWAY_Condition;
	information		= Info_Milten_LSAWAY_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSAWAY_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD1)
	&&	(Npc_GetDistToWP(hero, "NC_KDW04_IN") < 500)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSAWAY_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_01"); //Теперь рассказывай, что стряслось?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_02"); //Мне нужно воспользоваться силой железной горы, и я не думаю, что мне стоит обращаться с такой просьбой к другим магам Воды.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_03"); //Ты шутишь?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_04"); //Для шуток нет времени. Я серьезен, как никогда.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_05"); //Я виделся с некромантом Ксардасом.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_06"); //Я действую по его приказу.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_07"); //КСАРДАС??? Ты меня пугаешь!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_08"); //Никто не разговаривал с ним с тех самых пор, как он покинул Старый Лагерь.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_09"); //Я виделся с ним!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_10"); //Зачем тебе понадобилась сила железной горы?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_11"); //Я хочу передать ее этому мечу.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_12"); //Ух ты! Вот это клинок!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_13"); //Его имя - УРИЗЕЛЬ!
};


//---------------------------------------------------------------------
//	Info LOADSWORD4
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD4 (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LOADSWORD4_Condition;
	information		= Info_Milten_LOADSWORD4_Info;
	important		= 0;
	permanent		= 0;
	description		= "Это заклинание мне дал Ксардас!"; 
};

FUNC int Info_Milten_LOADSWORD4_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSAWAY)
	{
		return 1;
	};	
};

func void Info_Milten_LOADSWORD4_Info()
{
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_01"); //Ксардас дал мне заклинание для переноса силы.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_02"); //Тебе нужно будет прочесть его, когда я поднесу меч к железной горе.
	B_UseFakeScroll		();
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_03"); //М-мм. М-мм... Ну, если мне нужно только прочесть заклинание...
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_04"); //Но у нас возникнут проблемы с Сатурасом и другими магами!
};







//---------------------------------------------------------------------
//	Info LSRISK
//---------------------------------------------------------------------
instance Info_Milten_LSRISK (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSRISK_Condition;
	information		= Info_Milten_LSRISK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Придется рискнуть!"; 
};

FUNC int Info_Milten_LSRISK_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD4)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSRISK_Info()
{
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_01"); //Придется рискнуть!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_02"); //Это на самом деле ОЧЕНЬ, ОЧЕНЬ важно!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_03"); //Важно для ВСЕХ жителей колонии.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_04"); //Я не понимаю...
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_05"); //Так мы сможем выбраться отсюда! Ты должен мне доверять!
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_06"); //Ну, хорошо. После всего того, что ты для нас сделал, я не могу относиться к тебе иначе как с полным доверием.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_07"); //Помимо этого, похоже, и Ксардас тебе доверяет.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_08"); //Встретимся возле железной горы, и... Никому не говори об этом!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_09"); //Хорошо, я буду ждать тебя у железной горы. До встречи!
	
	B_LogEntry			(CH5_Uriziel,"Я сумел уговорить своего друга Мильтена помочь в передаче энергии мечу. Мы встретимся внизу, у горы руды, принадлежащей магам круга воды.");
	Npc_ExchangeRoutine	(self,	"LSOreHeap");
	B_ExchangeRoutine	(Sld_726_Soeldner,	"loadsword");

	AI_StopProcessInfos	(self);
};


//---------------------------------------------------------------------
//	Info LSOREHEAP
//---------------------------------------------------------------------
instance Info_Milten_LSOREHEAP (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSOREHEAP_Condition;
	information		= Info_Milten_LSOREHEAP_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSOREHEAP_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSRISK )
	&&	(Npc_GetDistToWP(hero, "NC_PATH41") < 500)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSOREHEAP_Info()
{
	//AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LSOREHEAP_02_01"); //Ты принес меч и заклинание?
};
	
//***************************************************************************
//	Info LSNOW
//***************************************************************************
instance Info_Milten_LSNOW (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSNOW_Condition;
	information		= Info_Milten_LSNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Вот, держи заклинание!"; 
};

FUNC int Info_Milten_LSNOW_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSOREHEAP)
	&&	Npc_HasItems (hero, Mythrilklinge01)
	&&	Npc_HasItems (hero, Scroll4Milten)
	&&	(Npc_GetDistToWP(hero, "NC_PATH41") < 1000)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSNOW_Info()
{
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_01"); //Вот, держи заклинание!
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_02"); //Ты готов?
	AI_Output			(self, hero,"Info_Milten_LSNOW_02_03"); //Если только кто-нибудь может быть готов к этому...
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_04"); //Поехали!

	B_GiveInvItems 	(hero, self, Scroll4Milten, 1);	
	B_GiveInvItems 	(hero, self, Mythrilklinge01, 1);	

	StartChaptersSix = TRUE;

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info CHAPTERSIX
//---------------------------------------------------------------------
instance Info_Milten_CHAPTERSIX (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_CHAPTERSIX_Condition;
	information		= Info_Milten_CHAPTERSIX_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_CHAPTERSIX_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSNOW)
	&&	StartChaptersSix
	{
		return TRUE;
	};	
};

func void Info_Milten_CHAPTERSIX_Info()
{
	AI_StopProcessInfos	(self);
	B_Kapitelwechsel	(6);
};
	
//---------------------------------------------------------------------
//	Info LSDONE
//---------------------------------------------------------------------
instance Info_Milten_LSDONE (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSDONE_Condition;
	information		= Info_Milten_LSDONE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSDONE_Condition()
{
	if	(Kapitel == 6)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSDONE_Info()
{
	//AI_GotoNpc				(self, hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_01"); //Готово!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_02"); //Невероятно! Обычный серый камень теперь светится синим!

	AI_EquipBestMeleeWeapon	(hero);
	AI_ReadyMeleeWeapon		(hero);
	AI_PlayAni				(hero, "T_1HSINSPECT");
	AI_RemoveWeapon			(hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_03"); //Похоже, у нас получилось! Магическая сила всей этой руды теперь заключена в одном старом мече.
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_04"); //Но кажется, мы привлекли к себе слишком много внимания.
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_05"); //Тебе придется воспользоваться Заклинанием Портал, для того чтобы убраться отсюда!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_06"); //А как же ты? 
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_07"); //Обо мне не волнуйся, я что-нибудь придумаю. Уходи!

	B_Story_UrizielLoaded	();
	
	AI_StopProcessInfos	(self);
};




//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################
