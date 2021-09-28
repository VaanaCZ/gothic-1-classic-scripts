// ************************ EXIT **************************

instance  VLK_585_Aleph_Exit (C_INFO)
{
	npc			=  VLK_585_Aleph;
	nr			=  999;
	condition	=  VLK_585_Aleph_Exit_Condition;
	information	=  VLK_585_Aleph_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_585_Aleph_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_585_Aleph_Exit_Info()
{
	if	!Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH)
	{
		AI_Output (other, self,"VLK_585_Aleph_Exit_Info_15_01"); //Удачи!
		AI_Output (self, other,"VLK_585_Aleph_Exit_Info_05_02"); //Ну, ты знаешь, где меня найти.
	};
	
	AI_StopProcessInfos	( self );

};
// ***************** ALEPH IST EIN FAULPELZ *****************************
instance VLK_585_Aleph_CLEVER (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_CLEVER_Condition;
	information		= VLK_585_Aleph_CLEVER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_585_Aleph_CLEVER_Condition()
{
	return 1;
};

func void  VLK_585_Aleph_CLEVER_Info()
{
	AI_Output (self,other,"VLK_585_Aleph_CLEVER_Info_05_01"); //Хе-хе-хе, стражникам меня никогда не поймать!
};
// ***************** ALEPH ERKLДRT SEINE ARBEITSHALTUNG *****************************

instance  VLK_585_Aleph_GUARDS (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_GUARDS_Condition;
	information		= VLK_585_Aleph_GUARDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "О чем это ты?"; 
};

FUNC int  VLK_585_Aleph_GUARDS_Condition()
{	
	if Npc_KnowsInfo (hero,VLK_585_Aleph_CLEVER) 
	{
		return 1;
	};
};

FUNC void  VLK_585_Aleph_GUARDS_Info()
{
	AI_Output (other, self,"VLK_585_Aleph_GUARDS_Info_15_01"); //О чем это ты?
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_02"); //Я начинаю работать, только когда стражники поблизости, а в остальное время просто болтаюсь без дела.
	AI_Output (other, self,"VLK_585_Aleph_GUARDS_Info_15_03"); //И они ничего не подозревают?
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_04"); //Подозревают, конечно, - ведь я добываю куда меньше руды, чем остальные. Ее всегда не хватает, так что мне приходится вести обмен.
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_05"); //Если умеешь слушать, можно узнать много всего полезного. Вот, например, ты. У тебя есть с собой руда? Скажем, 10 кусков?

	Npc_ExchangeRoutine (self,"BUSY");
	
	var C_Npc Brandick; 				
	Brandick = Hlp_GetNpc(GRD_261_Brandick);
	Npc_ExchangeRoutine (Brandick,"WATCH");
	AI_ContinueRoutine(Brandick);	// TEST!!!
};
// ***************** ALEPH BIETET INFO *****************************

instance VLK_585_Aleph_INFO (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_INFO_Condition;
	information		= VLK_585_Aleph_INFO_Info;
	important		= 0;
	permanent		= 0;
	description		= "(дать 10 кусков руды)";
};

FUNC int  VLK_585_Aleph_INFO_Condition()
{
	if ( Npc_HasItems (hero,ItMinugget) ) >= 10 &&  (Npc_KnowsInfo (hero, VLK_585_Aleph_GUARDS) ) 
	{
		return 1;
	};
};

func void  VLK_585_Aleph_INFO_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_INFO_Info_15_01"); //Ладно, вот тебе 10 кусков.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_02"); //Спасибо. Если ты пройдешь по главной шахте и спустишься вниз по мосткам, вскоре ты увидишь пещеры.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_03"); //Во второй пещере стоит стражник, там же находится старый пресс.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_04"); //Там где-то лежит целебный эликсир. Только будь осторожен и держись подальше от ползунов!
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_05"); //Если тебе что-нибудь понадобится или узнаешь что-то интересное, приходи ко мне. Думаю, мы договоримся...
	
	B_GiveInvItems (hero, other, ItMiNugget,10);
};
// ***************** WIRD ALEPH ANGESCHWДRZT IST ER SAUER*****************************
instance VLK_585_Aleph_ANGRY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_ANGRY_Condition;
	information		= VLK_585_Aleph_ANGRY_Info;
	important		= 1;
	permanent		= 0;
};	

FUNC int  VLK_585_Aleph_ANGRY_Condition()
{
	if ( Npc_KnowsInfo (hero,GRD_261_Brandick_ALEPH) )
	{
		return 1;
	};
};

func void  VLK_585_Aleph_ANGRY_Info()
{
	
	AI_Output (self,other,"VLK_585_Aleph_ANGRY_Info_05_01"); //Ты сдал меня Брендику! Убирайся отсюда!
	
	AI_StopProcessInfos	( self );
	Npc_SetTempAttitude (self,ATT_ANGRY);
};
//***************** LOCKPICKS*****************************
instance VLK_585_Aleph_KEY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_KEY_Condition;
	information		= VLK_585_Aleph_KEY_Info;
	important		= 0;
	permanent		= 0;
	description     = "Узнал чего-нибудь новенькое?";
};
FUNC int  VLK_585_Aleph_KEY_Condition()
{
	if ! ( Npc_KnowsInfo (hero,GRD_261_Brandick_ALEPH) ) &&  ( Npc_KnowsInfo (hero, VLK_585_Aleph_INFO))
	{
		return 1;
	};
};

func void  VLK_585_Aleph_KEY_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_KEY_Info_15_01"); //Узнал чего-нибудь новенькое?
	AI_Output (self,other,"VLK_585_Aleph_KEY_Info_05_02"); //Конечно. А  у тебя есть 10 кусков?
};

//***************** LOCKPICKS*****************************
instance VLK_585_Aleph_GLEN (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_GLEN_Condition;
	information		= VLK_585_Aleph_GLEN_Info;
	important		= 0;
	permanent		= 0;
	description     = "(дать 10 кусков руды)";
};
FUNC int  VLK_585_Aleph_GLEN_Condition()
{
	if ( Npc_HasItems (hero,ItMinugget) ) >= 10 &&  ( Npc_KnowsInfo (hero,VLK_585_Aleph_KEY) )
	{
		return 1;
	};
};

func void  VLK_585_Aleph_GLEN_Info()
{
	
	AI_Output (other,self,"VLK_585_Aleph_GLEN_Info_15_01"); //За них я хочу получить действительно полезную информацию!
	AI_Output (self,other,"VLK_585_Aleph_GLEN_Info_05_02"); //Видишь, здесь полно запертых сундуков. А отмычки можно купить у Глена. Так зовут того рудокопа, что стоит наверху.
	
	B_GiveInvItems (hero, self, ItMinugget,10); 
};
//***************** LAGERSCHUPPENSCHLЬSSEL*****************************
func void B_Aleph_StorageShedKey()
{
	B_LogEntry		(CH2_StorageShed,"Алеф продал мне ключ к сундуку на складе!");
};

instance VLK_585_Aleph_SCHUPPEN (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_SCHUPPEN_Condition;
	information		= VLK_585_Aleph_SCHUPPEN_Info;
	important		= 0;
	permanent		= 0;
	description     = "Тебе что-нибудь известно о ключе от сундуков на складе?";
};
FUNC int  VLK_585_Aleph_SCHUPPEN_Condition()
{
	if ( Npc_KnowsInfo (hero, GRD_271_ULBERT_DRUNK) ) && ( !Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH) )
	{
		return 1;
	};
};

func void  VLK_585_Aleph_SCHUPPEN_Info()
{
	
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_01"); //Тебе что-нибудь известно о том, где можно найти ключ от сундуков на складе?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_02"); //Ну, это зависит...
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_03"); //От того, сколько я смогу заплатить?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_04"); //Ты схватываешь все на лету.
	
	Info_ClearChoices ( VLK_585_Aleph_SCHUPPEN );
	
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,DIALOG_BACK 	   ,VLK_585_Aleph_SCHUPPEN_Back);
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Заплатить 50 кусков руды.",VLK_585_Aleph_SCHUPPEN_50 );
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Заплатить 30 кусков руды.",VLK_585_Aleph_SCHUPPEN_30 );
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"Заплатить 15 кусков руды.",VLK_585_Aleph_SCHUPPEN_15 );
};


func void VLK_585_Aleph_SCHUPPEN_50 ()
{
	
	if (Npc_HasItems (hero, ItMiNugget) >= 50)
	{ 
		AI_Output			(other,self,"VLK_585_Aleph_SCHUPPEN_50_15_01"); //Я думаю, 50 кусков руды будет более чем достаточно.
		AI_Output			(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_02"); //Это даже больше, чем я рассчитывал. Вот, возьми ключ - и еще это кольцо. Оно всегда приносило мне удачу.

		CreateInvItems		(self, ItKe_OM_03,	1);			// nur fьr die korrekte Textausgaben!!!
		B_GiveInvItems      (self, hero, ItKe_OM_03, 2);
		Npc_RemoveInvItem	(hero, ItKe_OM_03);

		Npc_RemoveInvItem	(self, Staerkering);
		CreateInvItem		(hero, Staerkering);

		B_GiveInvItems	    (hero, self, ItMinugget,50);  

		Npc_SetPermAttitude (self, ATT_FRIENDLY ); 
		Info_ClearChoices	(VLK_585_Aleph_SCHUPPEN);
		VLK_585_Aleph_SCHUPPEN.permanent = 0;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_50_05_03"); //Но у тебя нет столько руды!
		VLK_585_Aleph_SCHUPPEN.permanent = 1;
	};
};

func void VLK_585_Aleph_SCHUPPEN_30 ()
{
	
	
	if (Npc_HasItems (hero, ItMiNugget) >= 30)
	{ 
		CreateInvItem		(self, ItKe_OM_03);
		B_GiveInvItems      (self, other, ItKe_OM_03, 1);
		B_GiveInvItems	(hero, self, ItMinugget,30);  
		Info_ClearChoices	(VLK_585_Aleph_SCHUPPEN );
		AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_30_15_01"); //Что скажешь по поводу 30 кусков руды?
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_30_05_02"); //Нормально. Так уж получилось, что ключ у меня как раз с собой.
		VLK_585_Aleph_SCHUPPEN.permanent = 0;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_30_05_03"); //Но у тебя нет столько руды!
		VLK_585_Aleph_SCHUPPEN.permanent = 1;
	}; 
};	
func void VLK_585_Aleph_SCHUPPEN_15 ()
{
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_15_15_01"); //15 кусков руды - вот все, что я могу предложить.
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_15_05_02"); //15 кусков?! Я ничего не знаю ни о каком ключе!
	VLK_585_Aleph_SCHUPPEN.permanent = 0;
};	
func void VLK_585_Aleph_SCHUPPEN_Back ()
{
	Info_ClearChoices	(  VLK_585_Aleph_SCHUPPEN );
	VLK_585_Aleph_SCHUPPEN.permanent = 1;
};

// WENN DER SPIELER ALEPH BEI BRANDICK ANGESCHWДRZT HAT
instance  VLK_585_Aleph_DIRTY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_DIRTY_Condition;
	information		= VLK_585_Aleph_DIRTY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Тебе что-нибудь известно о ключе от сундуков на складе?"; 
};

FUNC int  VLK_585_Aleph_DIRTY_Condition()
{
	if ( Npc_KnowsInfo (hero, GRD_271_ULBERT_DRUNK) ) && ( Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH) )
	{
		return 1;
	};
};


FUNC void  VLK_585_Aleph_DIRTY_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_Info_15_01"); //Тебе что-нибудь известно о том, где можно найти ключ от сундуков на складе?
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_Info_05_02"); //Ну, это зависит...
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_Info_15_03"); //От того, сколько я смогу заплатить?
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_Info_05_04"); //Ты схватываешь все на лету. Я хочу 100 кусков руды.
	
	Info_ClearChoices ( VLK_585_Aleph_DIRTY );
	
	Info_AddChoice ( VLK_585_Aleph_DIRTY,"(заплатить 100 кусков руды)",VLK_585_Aleph_DIRTY_100 );
	Info_AddChoice ( VLK_585_Aleph_DIRTY,"(не платить)",VLK_585_Aleph_DIRTY_NO );
};  
func void VLK_585_Aleph_DIRTY_100()
{
	if Npc_HasItems (hero,ItMinugget)>=100
	{ 
		AI_Output (other,self,"VLK_585_Aleph_DIRTY_100_Info_15_01"); //Ладно, вымогатель. Вот твои 100 кусков.
		AI_Output (self,other,"VLK_585_Aleph_DIRTY_100_Info_05_02"); //Вот это дело, приятель! Держи ключ!
		B_GiveInvItems	(hero, self, ItMinugget,100);
		CreateInvItem		(self, ItKe_OM_03);
		B_GiveInvItems      (self, other, ItKe_OM_03, 1);
		Info_ClearChoices	( VLK_585_Aleph_DIRTY );
		VLK_585_Aleph_DIRTY.permanent = 0;	
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_DIRTY_100_Info_05_03"); //Я что, похож на идиота? 100 кусков, и ни самородком меньше!
		VLK_585_Aleph_DIRTY.permanent = 1;
	};
};
func void VLK_585_Aleph_DIRTY_NO()
{
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_NO_Info_15_01"); //Я не собираюсь выкидывать 100 кусков на ветер!
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_NO_Info_05_02"); //Ну, это же ты меня о чем-то просил...
	VLK_585_Aleph_DIRTY.permanent = 0;	
};
