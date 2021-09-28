// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Huno_Exit (C_INFO)
{
	npc			= Vlk_538_Huno;
	nr			= 999;
	condition	= DIA_Huno_Exit_Condition;
	information	= DIA_Huno_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Huno_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//	Info YouKnowYourJob
// **************************************************
INSTANCE DIA_Huno_YouKnowYourJob (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_YouKnowYourJob_Condition;
	information		= DIA_Huno_YouKnowYourJob_Info;
	permanent		= 0;
	important		= 0;
	description		= "Sembra che tu sappia ciò che fai.";
};

FUNC INT DIA_Huno_YouKnowYourJob_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output (other,self,"DIA_Huno_YouKnowYourJob_15_00"); //Sembra che tu sappia ciò che fai.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Nessuno si è ancora lamentato.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_02"); //In ogni caso, sarebbe una cattiva idea. Qui, ogni idiota ha bisogno di una spada e sono io a fornirgliela.
};


// **************************************************
//	Info HowLong
// **************************************************
INSTANCE DIA_Huno_HowLong (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowLong_Condition;
	information		= DIA_Huno_HowLong_Info;
	permanent		= 0;
	important		= 0;
	description		= "Quanto ci metti a creare una lama di metallo?";
};

FUNC INT DIA_Huno_HowLong_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowLong_Info()
{
	AI_Output (other,self,"DIA_Huno_HowLong_15_00"); //Quanto ci metti a creare una lama di metallo?
	AI_Output (self,other,"DIA_Huno_HowLong_09_01"); //Dipende. Sono velocissimo con le spade semplici.
	AI_Output (self,other,"DIA_Huno_HowLong_09_02"); //Sempre che il prezzo sia sufficiente a motivarmi, ovviamente.
	AI_Output (self,other,"DIA_Huno_HowLong_09_03"); //Quell'idiota di Whistler di solito deve aspettare di più degli altri.
	AI_Output (other,self,"DIA_Huno_HowLong_15_04"); //Perché? Non paga abbastanza?
	AI_Output (self,other,"DIA_Huno_HowLong_09_05"); //Al contrario! Mi ha dato 150 pezzi di metallo per l'ultima spada.
	AI_Output (self,other,"DIA_Huno_HowLong_09_06"); //Gli piacciono le decorazioni e tutta quella roba da ragazzine. Ovviamente, sono cose che costano care.
	AI_Output (self,other,"DIA_Huno_HowLong_09_07"); //Ehi! Non sei per niente un tipo curioso, eh amico?
};

// **************************************************
//	Info HowsYourBusiness
// **************************************************
INSTANCE DIA_Huno_HowsYourBusiness (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowsYourBusiness_Condition;
	information		= DIA_Huno_HowsYourBusiness_Info;
	permanent		= 1;
	important		= 0;
	description		= "Ehi, fabbro, come vanno gli affari?";
};

FUNC INT DIA_Huno_HowsYourBusiness_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Ehi, fabbro, come vanno gli affari?
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_01"); //Perché lo vuoi sapere?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_02"); //Potrei avere un'ordinazione per te.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_03"); //Davvero? Cosa?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_04"); //Ci penserò su.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_05"); //Torna quando ti servirà davvero qualcosa e non farmi innervosire.
};

// **************************************************
//	Info LEARNSMITH
// **************************************************
var int	Huno_LearnSmith;
// **************************************************

INSTANCE DIA_Huno_LEARNSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_LEARNSMITH_Condition;
	information		= DIA_Huno_LEARNSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "Mi piacerebbe lavorare qui.";
};

FUNC INT DIA_Huno_LEARNSMITH_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_LEARNSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_00"); //Mi piacerebbe lavorare qui.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_01"); //Oh! Non credere di poter creare delle grosse lame!
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_02"); //Cosa devo fare?
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_03"); //D'accordo. Prendi l'acciaio e tienilo sul fuoco.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_04"); //Ora devi stendere l'acciaio incandescente sull'incudine.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_05"); //Quando hai finito, immergi la lama bollente nell'acqua per raffreddarla.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_06"); //Infine, devi affilare la lama sulla mola.
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_07"); //Capisco.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_08"); //Comunque, hai bisogno di alcuni oggetti che io posso venderti.

	Huno_LearnSmith = TRUE;
};

// **************************************************
//	Info BUYSMITH
// **************************************************
INSTANCE DIA_Huno_BUYSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_BUYSMITH_Condition;
	information		= DIA_Huno_BUYSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "Voglio comprare l'equipaggiamento da fabbro!";
	trade			= 1;
};

FUNC INT DIA_Huno_BUYSMITH_Condition()
{	
	if	(Huno_LearnSmith == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_BUYSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_BUYSMITH_15_00"); //Voglio comprare l'equipaggiamento da fabbro!

	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
};


