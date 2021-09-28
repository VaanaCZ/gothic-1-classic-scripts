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
	description		= "Cosa devo sapere, quando mi trovo in miniera?"; 
};

FUNC int  VLK_583_Glen_INFO_Condition()
{
	return 1;
};


FUNC void  VLK_583_Glen_INFO_Info()
{
	AI_Output (other, self,"VLK_583_Glen_INFO_Info_15_01"); //Cosa devo sapere quando mi trovo in miniera?
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_02"); //Attento ai pidocchi di miniera.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_03"); //Più scendi in profondità, più ti avvicini a quelle dannate bestie. Vengono dritte dal regno di Beliar!
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_04"); //Puoi sentirle grattare e scavare. Restano in agguato nel buio in attesa di una vittima. Io le ho viste uccidere...
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_05"); //Sono rapide e spietate. Se vuoi restare vivo, farai meglio a non scendere. Vattene, prima che ti accada qualcosa.
};  
// ***************** Infos *****************************

instance  VLK_583_Glen_LOCKPICK (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_LOCKPICK_Condition;
	information	=  VLK_583_Glen_LOCKPICK_Info;
	important	= 0;	
	permanent	= 0;
	description = "È vero che qui si possono comprare grimaldelli?";
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
	AI_Output (other, self,"VLK_583_Glen_LOCKPICK_15_01"); //È vero che qui si possono comprare dei grimaldelli?
	AI_Output (self, other,"VLK_583_Glen_LOCKPICK_02_02"); //Visto che sei stato così in gamba da scoprirlo, puoi averne alcuni. 10 pezzi di metallo ognuno.
	
	
};
// ***************** Infos *****************************

instance  VLK_583_Glen_BUY (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_BUY_Condition;
	information	=  VLK_583_Glen_BUY_Info;
	important	= 0;	
	permanent	= 1;
	description = "(compra i grimaldelli)";
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
	AI_Output (other, self,"VLK_583_Glen_BUY_Info_15_01"); //Voglio comprare dei grimaldelli.
	
	
	
};
