// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Sfb_1001_EXIT(C_INFO)
{
	npc			= SFB_1001_Schuerfer;
	nr			= 999;
	condition	= DIA_Sfb_1001_EXIT_Condition;
	information	= DIA_Sfb_1001_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Sfb_1001_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Sfb_1001_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo - PERM
// ************************************************************

INSTANCE DIA_Sfb_1001_Hello(C_INFO)
{
	npc			= SFB_1001_Schuerfer;
	nr			= 1;
	condition	= DIA_Sfb_1001_Hello_Condition;
	information	= DIA_Sfb_1001_Hello_Info;
	permanent	= 1;
	description = "Hé bien, comment aller à la mine ?";
};                       

FUNC INT DIA_Sfb_1001_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Sfb_1001_Hello_Info()
{	
	AI_Output (other, self,"DIA_Sfb_1001_Hello_15_00"); //Hé bien, comment aller à la mine ?
	AI_Output (self, other,"DIA_Sfb_1001_Hello_02_01"); //Nous en avons fait une grande partie. Encore quelques semaines et nous en aurons assez.
	AI_StopProcessInfos	(self);
};
