// ************************ EXIT **************************

instance  STT_335_Santino_Exit (C_INFO)
{
	npc			=  STT_335_Santino;
	nr			=  999;
	condition	=  STT_335_Santino_Exit_Condition;
	information	=  STT_335_Santino_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_335_Santino_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_335_Santino_Exit_Info()
{
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  STT_335_Santino_BUY (C_INFO)
{
	npc				= STT_335_Santino;
	condition		= STT_335_Santino_BUY_Condition;
	information		= STT_335_Santino_BUY_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	Trade			= 1;
};

FUNC int  STT_335_Santino_BUY_Condition()
{
	return 1;
};


FUNC void  STT_335_Santino_BUY_Info()
{
	AI_Output (other, self,"STT_335_Santino_BUY_Info_15_01"); //Mog� co� od ciebie kupi�?
	AI_Output (self, other,"STT_335_Santino_BUY_Info_07_02"); //Mam tu wszystko, czego m�g�by� zapragn��. To czego NIE MAM, i tak by ci si� nie przyda�o.
	
};  
