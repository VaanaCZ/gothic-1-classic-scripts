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
	description		= "Na co bych mìl pamatovat, až budu v dole?"; 
};

FUNC int  VLK_583_Glen_INFO_Condition()
{
	return 1;
};


FUNC void  VLK_583_Glen_INFO_Info()
{
	AI_Output (other, self,"VLK_583_Glen_INFO_Info_15_01"); //Na co bych mìl pamatovat, až budu v dole?
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_02"); //Dávat si pozor na dùlní èervy.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_03"); //Èím jdeš níž, tím blíž se k tìm bestiím dostáváš. Ty prašivé pøíšery pøicházejí rovnou z Beliarova království!
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_04"); //Uslyšíš hrabání a škrábání. Drží se v temnotì a vyèkávají na tebe. Vidìl jsem je zabíjet...
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_05"); //Jsou nemilosrdní a rychlí. Jestli chceš zùstat naživu, nemìl bys chodit dolu. Mìl bys odejít, než se ti nìco stane.
};  
// ***************** Infos *****************************

instance  VLK_583_Glen_LOCKPICK (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_LOCKPICK_Condition;
	information	=  VLK_583_Glen_LOCKPICK_Info;
	important	= 0;	
	permanent	= 0;
	description = "Slyšel jsem, že bych tu dostal paklíèe?";
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
	AI_Output (other, self,"VLK_583_Glen_LOCKPICK_15_01"); //Slyšel jsem, že bych tu dostal paklíèe?
	AI_Output (self, other,"VLK_583_Glen_LOCKPICK_02_02"); //Jistì, protože jsi dost bystrý, když jsi to našel, tak mùžeš nìjaký dostat. 10 nugetù za kus.
	
	
};
// ***************** Infos *****************************

instance  VLK_583_Glen_BUY (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_BUY_Condition;
	information	=  VLK_583_Glen_BUY_Info;
	important	= 0;	
	permanent	= 1;
	description = "(kup paklíèe)";
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
	AI_Output (other, self,"VLK_583_Glen_BUY_Info_15_01"); //Chci koupit paklíèe.
	
	
	
};
