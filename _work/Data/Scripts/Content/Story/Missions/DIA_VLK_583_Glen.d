// ************************ EXIT **************************

instance  VLK_583_Glen_Exit (C_INFO)
{
	npc			=  VLK_583_Glen;
	nr			= 999;
	condition	=  VLK_583_Glen_Exit_Condition;
	information	=  VLK_583_Glen_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_583_Glen_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_583_Glen_Exit_Info()
{
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance   VLK_583_Glen_INFO(C_INFO)
{
	npc				= VLK_583_Glen;
	condition		= VLK_583_Glen_INFO_Condition;
	information		= VLK_583_Glen_INFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Que dois-je garder à l'esprit quand je serai dans la mine ?"; 
};

FUNC int  VLK_583_Glen_INFO_Condition()
{
	return 1;
};


FUNC void  VLK_583_Glen_INFO_Info()
{
	AI_Output (other, self,"VLK_583_Glen_INFO_Info_15_01"); //Que dois-je garder à l'esprit quand je serai dans la mine ?
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_02"); //Attention au Chenilles des mines.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_03"); //Plus bas tu descendra, plus prés tu sera des bêtes. Ces créatures pourries sortent tout droit du royaume de l'enfer !
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_04"); //tu peux les entendre gratter et frotter. Ils sont tapis dans l'ombre, à t'attendre. Je les ai vu tué...
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_05"); //Ils sont sans pitié et rapide. Si tu aimes rester en vie, tu ne devrais pas descendre. Tu devrais y aller avant qu'il ne t'arrive quelque chose.
};  
// ***************** Infos *****************************

instance  VLK_583_Glen_LOCKPICK (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_LOCKPICK_Condition;
	information	=  VLK_583_Glen_LOCKPICK_Info;
	important	= 0;	
	permanent	= 0;
	description = "J'ai entendu dire que je pouvais acheter des passe-partout ici ?";
};                       

FUNC int  VLK_583_Glen_LOCKPICK_Condition()
{
	if ( Npc_KnowsInfo(hero, VLK_585_Aleph_GLEN) )
	{
		return 1;
	};
};

FUNC VOID  VLK_583_Glen_LOCKPICK_Info()
{
	AI_Output (other, self,"VLK_583_Glen_LOCKPICK_15_01"); //J'ai entendu dire que je pouvais acheter des passe-partout ici ?
	AI_Output (self, other,"VLK_583_Glen_LOCKPICK_02_02"); //Hé bien, depuis que tu es assez malin pour faire ça, tu peux en avoir. 10 minerais pièce.
	
	
};
// ***************** Infos *****************************

instance  VLK_583_Glen_BUY (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_BUY_Condition;
	information	=  VLK_583_Glen_BUY_Info;
	important	= 0;	
	permanent	= 1;
	description = "(Acheter des passe-partout)";
	trade		= 1;
};                       

FUNC int  VLK_583_Glen_BUY_Condition()
{	
	if ( Npc_KnowsInfo (hero, VLK_583_Glen_LOCKPICK) )
	{
		return 1;
	};
};
FUNC VOID  VLK_583_Glen_BUY_Info()
{
	AI_Output (other, self,"VLK_583_Glen_BUY_Info_15_01"); //Je voudrais acheter des passe-partout.
	
	
	
};
