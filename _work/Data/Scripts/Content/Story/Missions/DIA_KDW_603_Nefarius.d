// **************************** 
//				EXIT 
// ****************************

instance  Info_Nefarius_EXIT (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	999;
	condition	=	Info_Nefarius_EXIT_Condition;
	information	=	Info_Nefarius_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Nefarius_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************** 
//			Hallo 
// ****************************

instance  Info_Nefarius_Hallo (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_Hallo_Condition;
	information	=	Info_Nefarius_Hallo_Info;
	permanent	=	0;
	description =	"Kim jesteœ?";
};                       

FUNC int  Info_Nefarius_Hallo_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_Hallo_Info()
{
	AI_Output (other, self,"Info_Nefarius_Hallo_15_00"); //Kim jesteœ?
	AI_Output (self, other,"Info_Nefarius_Hallo_04_01"); //Nazywam siê Nefarius. Mag Krêgu Wody.
};

// **************************** 
//			Wo Saturas
// ****************************

instance  Info_Nefarius_WoSaturas (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	2;
	condition	=	Info_Nefarius_WoSaturas_Condition;
	information	=	Info_Nefarius_WoSaturas_Info;
	permanent	=	0;
	description =	"Gdzie mogê znaleŸæ Saturasa?";
};                       

FUNC int  Info_Nefarius_WoSaturas_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_WoSaturas_Info()
{
	AI_Output (other, self,"Info_Nefarius_WoSaturas_15_00"); //Gdzie mogê znaleŸæ Saturasa?
	AI_Output (self, other,"Info_Nefarius_WoSaturas_04_01"); //Poszukaj za t¹ wielk¹, okr¹g³¹ bram¹.
};

// **************************** 
//			WannaMage
// ****************************

instance  Info_Nefarius_WannaMage (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_WannaMage_Condition;
	information	=	Info_Nefarius_WannaMage_Info;
	permanent	=	0;
	description =	"Chcia³bym zostaæ Magiem Krêgu Wody.";
};                       

FUNC int  Info_Nefarius_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Hallo))
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_WannaMage_Info()
{
	AI_Output (other, self,"Info_Nefarius_WannaMage_15_00"); //Chcia³bym zostaæ Magiem Krêgu Wody.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_01"); //Nie tak szybko, mój ch³opcze!
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_02"); //Nie przyjmujemy do naszego grona byle kogo. Najpierw musisz siê wykazaæ czymœ niezwyk³ym.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_03"); //Potem czeka ciê okres próbny.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_04"); //Je¿eli powa¿nie myœlisz o zostaniu Magiem Wody, do³¹cz najpierw do Najemników. W ten sposób bêdziesz móg³ nam udowodniæ swoj¹ wartoœæ.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_05"); //Kto wie, mo¿e pewnego dnia uda ci siê nas przekonaæ...
};

// **************************** 
//			NowReady
// ****************************

instance  Info_Nefarius_NowReady (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_NowReady_Condition;
	information	=	Info_Nefarius_NowReady_Info;
	permanent	=	1;
	description =	"Czy jestem ju¿ gotów, by zostaæ Magiem Wody?";
};                       

FUNC int  Info_Nefarius_NowReady_Condition()
{
	if	( !FMTaken && Npc_KnowsInfo(hero, Info_Nefarius_WannaMage) && (Npc_GetTrueGuild(hero)!=GIL_KDW) )
	{
		return 1;
	};	
};

FUNC VOID  Info_Nefarius_NowReady_Info()
{
	AI_Output (other, self,"Info_Nefarius_NowReady_15_00"); //Czy jestem ju¿ gotów, by zostaæ Magiem Wody?
	
	if (Npc_GetTrueGuild (hero) != GIL_SLD) 
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_01"); //Najpierw zaci¹gnij siê do Najemników, potem - zobaczymy...
	}
	else
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_02"); //Jak widzê, zosta³eœ jednym z Najemników. Dobrze, bardzo dobrze!
		AI_Output (self, other,"Info_Nefarius_NowReady_04_03"); //Czekaj teraz cierpliwie na swoj¹ szansê...
	};
};

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
///////////////		Kapitel 4				//////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

// **************************** 
//			OCNews
// ****************************

instance  Info_Nefarius_OCNews (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_OCNews_Condition;
	information	=	Info_Nefarius_OCNews_Info;
	permanent	=	0;
	important	= 	1;
};                       

FUNC int  Info_Nefarius_OCNews_Condition()
{
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID  Info_Nefarius_OCNews_Info()
{
	AI_Output (self, other,"Info_Nefarius_OCNews_04_00"); //S¹ jakieœ wieœci od naszych przyjació³ ze Starego Obozu?
	AI_Output (other, self,"Info_Nefarius_OCNews_15_01"); //Gomez kaza³ wymordowaæ wszystkich Magów Ognia!
	AI_Output (self, other,"Info_Nefarius_OCNews_04_02"); //Nie! Durny barbarzyñca! Uprzedza³em Corristo - Gomezowi od pocz¹tku nie mo¿na by³o ufaæ! Musisz donieœæ o tym Saturasowi!
	if (Npc_GetTrueGuild(hero)==GIL_SLD)
	{
		AI_Output (self, other,"Info_Nefarius_OCNews_04_03"); //Czekaj!
		AI_Output (self, other,"Info_Nefarius_OCNews_04_04"); //Narazi³eœ siê dla nas na nie lada niebezpieczeñstwa.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_05"); //Jesteœ ju¿ chyba godzien, by nosiæ szaty Maga Wody.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_06"); //A teraz spiesz do Saturasa! Nie traæ czasu!
	};
	AI_StopProcessInfos	(self);
};
