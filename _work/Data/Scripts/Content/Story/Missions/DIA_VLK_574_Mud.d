// **************************************************
var int Mud_Nerve;
const int NerveSec = 30;
var int Mud_NerveRealized;
// **************************************************

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Mud_Exit (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Exit_Condition;
	information	= DIA_Mud_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Mud_Exit_Condition()
{
	//if (Npc_KnowsInfo(hero, DIA_Mud_FirstEXIT))
	//{
		return 1;
	//};
};

FUNC VOID DIA_Mud_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						First + EXIT
// **************************************************

INSTANCE DIA_Mud_FirstEXIT (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 1;
	condition	= DIA_Mud_FirstEXIT_Condition;
	information	= DIA_Mud_FirstEXIT_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Mud_FirstEXIT_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID DIA_Mud_FirstEXIT_Info()
{
	AI_Output (self, other,"DIA_Mud_FirstEXIT_07_00"); //Эй, парень! Ты новенький? Я тебя раньше не видел.
	AI_Output (self, other,"DIA_Mud_FirstEXIT_07_01"); //Я пройду с тобой немного, ладно? Уверен, тебе сейчас нужен друг.
	Info_ClearChoices(DIA_Mud_FirstEXIT);
	Info_AddChoice	 (DIA_Mud_FirstEXIT,"Проваливай!",DIA_Mud_FirstEXIT_Verpiss);
	Info_AddChoice	 (DIA_Mud_FirstEXIT,"Почему бы и нет? Идем!",DIA_Mud_FirstEXIT_Komm);
};

func void DIA_Mud_FirstEXIT_Verpiss()
{
	AI_Output (other, self,"DIA_Mud_FirstEXIT_Verpiss_15_00"); //Проваливай!
	AI_Output (self, other,"DIA_Mud_FirstEXIT_Verpiss_07_01"); //А ты сегодня не в настроении... Но я лучше пойду с тобой...
	Info_ClearChoices(DIA_Mud_FirstEXIT);
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"FOLLOW");
};

func void DIA_Mud_FirstEXIT_Komm()
{
	AI_Output (other, self,"DIA_Mud_FirstEXIT_Komm_15_00"); //Почему бы и нет? Идем!
	AI_Output (self, other,"DIA_Mud_FirstEXIT_Komm_07_01"); //Здорово! По дороге мы сможем поговорить.
	Info_ClearChoices(DIA_Mud_FirstEXIT);
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"FOLLOW");
};

// **************************************************
// 					Shut Up!
// **************************************************

INSTANCE DIA_Mud_ShutUp (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 3;
	condition	= DIA_Mud_ShutUp_Condition;
	information	= DIA_Mud_ShutUp_Info;
	permanent	= 1;
	description	= "Ты НЕ МОГ БЫ заткнуться - хотя бы на минуту?";
};                       

FUNC INT DIA_Mud_ShutUp_Condition()
{
	
	if (Mud_NerveRealized == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Mud_ShutUp_Info()
{
	AI_Output (other, self,"DIA_Mud_ShutUp_15_00"); //Ты НЕ МОГ БЫ заткнуться - хотя бы на минуту?
	AI_Output (self, other,"DIA_Mud_ShutUp_07_01"); //Конечно.
	Npc_SetRefuseTalk(self, 300);
};

// **************************************************
// 					VerpiЯ dich
// **************************************************

INSTANCE DIA_Mud_GetLost (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 2;
	condition	= DIA_Mud_GetLost_Condition;
	information	= DIA_Mud_GetLost_Info;
	permanent	= 1;
	description	= "Проваливай!";
};                       

FUNC INT DIA_Mud_GetLost_Condition()
{
	return 1;
};

FUNC VOID DIA_Mud_GetLost_Info()
{
	AI_Output (other, self,"DIA_Mud_GetLost_15_00"); //Проваливай!
	AI_Output (self, other,"DIA_Mud_GetLost_07_01"); //Хочешь немного побыть один? Я понимаю... Я буду неподалеку.
};

// **************************************************
// 					DEFEATED
// **************************************************

INSTANCE DIA_Mud_Defeated (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 1;
	condition	= DIA_Mud_Defeated_Condition;
	information	= DIA_Mud_Defeated_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Defeated_Condition()
{
	if (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Mud_Defeated_Info()
{
	AI_Output (self, other,"DIA_Mud_GetLost_07_00"); //Эй, парень, ты ударил меня! Это еще за что?
	AI_Output (other, self,"DIA_Mud_GetLost_15_01"); //Через секунду я врежу тебе еще раз! Ты меня уже достал!
	AI_Output (self, other,"DIA_Mud_GetLost_07_02"); //Ты больной придурок! Я больше не хочу тебя видеть.
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************
// 						 Nerve 0 
// **************************************************

INSTANCE DIA_Mud_Nerve_0 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_0_Condition;
	information	= DIA_Mud_Nerve_0_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_0_Condition()
{
	if ( (Mud_Nerve==0) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_0_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_0_07_00"); //Скажи, а куда мы идем? Или это будет сюрприз? Я люблю сюрпризы.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 1;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 1 
// **************************************************

INSTANCE DIA_Mud_Nerve_1 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_1_Condition;
	information	= DIA_Mud_Nerve_1_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_1_Condition()
{
	if ( (Mud_Nerve==1) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_1_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_1_07_00"); //Не обращай на меня внимания. Я всегда буду с тобой, не волнуйся.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 2;
	Mud_NerveRealized = TRUE;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 2 
// **************************************************

INSTANCE DIA_Mud_Nerve_2 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_2_Condition;
	information	= DIA_Mud_Nerve_2_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_2_Condition()
{
	if ( (Mud_Nerve==2) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_2_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_2_07_00"); //Куда мы идем?  У тебя есть какой-нибудь план?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 3;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 3
// **************************************************

INSTANCE DIA_Mud_Nerve_3 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_3_Condition;
	information	= DIA_Mud_Nerve_3_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_3_Condition()
{
	if ( (Mud_Nerve==3) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_3_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_3_07_00"); //Ты ищешь тихое место? Где мы сможем поговорить и все такое?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 4;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 4
// **************************************************

INSTANCE DIA_Mud_Nerve_4 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_4_Condition;
	information	= DIA_Mud_Nerve_4_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_4_Condition()
{
	if ( (Mud_Nerve==4) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_4_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_4_07_00"); //Может быть мы ходим кругами? То есть я не знаю, куда ты хочешь прийти...
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 5;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 5
// **************************************************

INSTANCE DIA_Mud_Nerve_5 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_5_Condition;
	information	= DIA_Mud_Nerve_5_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_5_Condition()
{
	if ( (Mud_Nerve==5) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_5_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_5_07_00"); //Это было здорово. Спасибо, что взял меня с собой. Нужно будет повторить эту прогулку - у меня сегодня еще масса свободного времени.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 6;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 6
// **************************************************

INSTANCE DIA_Mud_Nerve_6 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_6_Condition;
	information	= DIA_Mud_Nerve_6_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_6_Condition()
{
	if ( (Mud_Nerve==6) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_6_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_6_07_00"); //Я уже привык к тебе. Мне с тобой хорошо. А тебе как? Да, кстати, где ты спишь? Можешь оставаться у меня, нет проблем.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 7;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 7
// **************************************************

INSTANCE DIA_Mud_Nerve_7 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_7_Condition;
	information	= DIA_Mud_Nerve_7_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_7_Condition()
{
	if ( (Mud_Nerve==7) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_7_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_7_07_00"); //Кстати, почему ты здесь оказался? Ты вообще любишь животных? Не все их любят, и поэтому меня зашвырнули сюда.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 8;
	AI_StopProcessInfos	( self );
};


// **************************************************
// 						 Nerve 8
// **************************************************

INSTANCE DIA_Mud_Nerve_8 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_8_Condition;
	information	= DIA_Mud_Nerve_8_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_8_Condition()
{
	if ( (Mud_Nerve==8) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_8_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_8_07_00"); //Есть здесь такие типы - они постоянно пытаются избить меня. Они из Нового Лагеря. Настоящие головорезы. В следующий раз я скажу им, что мы с тобой теперь друзья. Это должно их напугать.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 9;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 9
// **************************************************

INSTANCE DIA_Mud_Nerve_9 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_9_Condition;
	information	= DIA_Mud_Nerve_9_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_9_Condition()
{
	if ( (Mud_Nerve==9) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_9_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_9_07_00"); //Эти ублюдки из Нового Лагеря будут в шоке, когда узнают, что у меня появился защитник. Они обделаются от страха. Это должно быть здорово. Обычно для них убить человека - что муху прихлопнуть, но теперь они дважды подумают.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 10;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 10
// **************************************************

INSTANCE DIA_Mud_Nerve_10 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_10_Condition;
	information	= DIA_Mud_Nerve_10_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_10_Condition()
{
	if ( (Mud_Nerve==10) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_10_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_10_07_00"); //Знаешь что? Я помогу тебе. Я замолвлю за тебя словечко, и может быть, тебя примут в Лагерь. Тогда мы сможем видеться каждый день.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 11;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 11
// **************************************************

INSTANCE DIA_Mud_Nerve_11 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_11_Condition;
	information	= DIA_Mud_Nerve_11_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_11_Condition()
{
	if ( (Mud_Nerve==11) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_11_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_11_07_00"); //Здесь многие считают меня придурком. Но ты бы не стал общаться с придурком, правда? Они увидят нас и поймут, что были неправы.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 12;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 12
// **************************************************

INSTANCE DIA_Mud_Nerve_12 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_12_Condition;
	information	= DIA_Mud_Nerve_12_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_12_Condition()
{
	if ( (Mud_Nerve==12) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_12_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_12_07_00"); //Ты - мой лучший друг. Остальные только и думают, как избавиться от меня. Я тебе очень благодарен.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 13;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 13
// **************************************************

INSTANCE DIA_Mud_Nerve_13 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_13_Condition;
	information	= DIA_Mud_Nerve_13_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_13_Condition()
{
	if ( (Mud_Nerve==13) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_13_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_13_07_00"); //Слушай, меня уже начинает утомлять эта прогулка. Может быть, мы поищем какое-нибудь тихое местечко и немного передохнем?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 14;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 14
// **************************************************

INSTANCE DIA_Mud_Nerve_14 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_14_Condition;
	information	= DIA_Mud_Nerve_14_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_14_Condition()
{
	if ( (Mud_Nerve==14) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_14_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_14_07_00"); //Ты для меня как старший брат. У меня никогда не было старшего брата. И младшего тоже не было. Я был не нужен своим родителям. Но для них это было тяжело, я уверен.
	AI_Output (other, self,"DIA_Mud_Nerve_14_15_01"); //Я тоже так думаю.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 15;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 15
// **************************************************

INSTANCE DIA_Mud_Nerve_15 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_15_Condition;
	information	= DIA_Mud_Nerve_15_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_15_Condition()
{
	if ( (Mud_Nerve==15) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_15_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_15_07_00"); //Ты сам откуда? Ты, должно быть, рад найти человека, который тебя действительно понимает. Я из Хориниса. Ты был там когда-нибудь? Впрочем, это не имеет значения.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 16;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 16
// **************************************************

INSTANCE DIA_Mud_Nerve_16 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_16_Condition;
	information	= DIA_Mud_Nerve_16_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_16_Condition()
{
	if ( (Mud_Nerve==16) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_16_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_16_07_00"); //У тебя нет ничего поесть? Я для тебя вроде как гость, так что ты можешь угостить меня чем-нибудь. Так должен поступать хороший хозяин. Этому меня научили мои друзья из Хориниса. Они любили меня.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 17;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 17
// **************************************************

INSTANCE DIA_Mud_Nerve_17 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_17_Condition;
	information	= DIA_Mud_Nerve_17_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_17_Condition()
{
	if ( (Mud_Nerve==17) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_17_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_17_07_00"); //Как ты думаешь, к нам кто-нибудь заглянет? Наверное, нет, потому что они знают: теперь им отсюда так просто не уйти!
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 18;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 18
// **************************************************

INSTANCE DIA_Mud_Nerve_18 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_18_Condition;
	information	= DIA_Mud_Nerve_18_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_18_Condition()
{
	if ( (Mud_Nerve==18) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_18_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_18_07_00"); //Теперь, когда ты со мной, мы покажем этим ублюдкам! Который уже год они измываются надо мной! Только бы их встретить!
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 19;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 19
// **************************************************

INSTANCE DIA_Mud_Nerve_19 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_19_Condition;
	information	= DIA_Mud_Nerve_19_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_19_Condition()
{
	if ( (Mud_Nerve==19) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_19_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_19_07_00"); //Мы с тобой одна команда. Мы можем править всем Старым Лагерем. Бароны нам теперь не помеха. Счас, я продумаю план.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 0;
	AI_StopProcessInfos	( self );
};
