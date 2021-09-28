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
	description		= "Na co bych m�l pamatovat, a� budu v dole?"; 
};

FUNC int  VLK_583_Glen_INFO_Condition()
{
	return 1;
};


FUNC void  VLK_583_Glen_INFO_Info()
{
	AI_Output (other, self,"VLK_583_Glen_INFO_Info_15_01"); //Na co bych m�l pamatovat, a� budu v dole?
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_02"); //D�vat si pozor na d�ln� �ervy.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_03"); //��m jde� n�, t�m bl� se k t�m besti�m dost�v�. Ty pra�iv� p��ery p�ich�zej� rovnou z Beliarova kr�lovstv�!
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_04"); //Usly�� hrab�n� a �kr�b�n�. Dr�� se v temnot� a vy�k�vaj� na tebe. Vid�l jsem je zab�jet...
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_05"); //Jsou nemilosrdn� a rychl�. Jestli chce� z�stat na�ivu, nem�l bys chodit dolu. M�l bys odej�t, ne� se ti n�co stane.
};  
// ***************** Infos *****************************

instance  VLK_583_Glen_LOCKPICK (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_LOCKPICK_Condition;
	information	=  VLK_583_Glen_LOCKPICK_Info;
	important	= 0;	
	permanent	= 0;
	description = "Sly�el jsem, �e bych tu dostal pakl��e?";
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
	AI_Output (other, self,"VLK_583_Glen_LOCKPICK_15_01"); //Sly�el jsem, �e bych tu dostal pakl��e?
	AI_Output (self, other,"VLK_583_Glen_LOCKPICK_02_02"); //Jist�, proto�e jsi dost bystr�, kdy� jsi to na�el, tak m��e� n�jak� dostat. 10 nuget� za kus.
	
	
};
// ***************** Infos *****************************

instance  VLK_583_Glen_BUY (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_BUY_Condition;
	information	=  VLK_583_Glen_BUY_Info;
	important	= 0;	
	permanent	= 1;
	description = "(kup pakl��e)";
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
	AI_Output (other, self,"VLK_583_Glen_BUY_Info_15_01"); //Chci koupit pakl��e.
	
	
	
};
