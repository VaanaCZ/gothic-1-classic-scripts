// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Kyle_Exit (C_INFO)
{
	npc			= Vlk_536_Kyle;
	nr			= 999;
	condition	= DIA_Kyle_Exit_Condition;
	information	= DIA_Kyle_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kyle_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kyle_Exit_Info()
{
	Npc_SetRefuseTalk(self,120);	//wegen AUTO-Ansprechen
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Kyle_HutRage (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_HutRage_Condition;
	information		= DIA_Kyle_HutRage_Info;
	permanent		= 1;
	important		= 1;
};

FUNC INT DIA_Kyle_HutRage_Condition()
{	
	if ( (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Kyle_HutRage_Info()
{
	AI_Output (self, other,"DIA_Kyle_HutRage_10_00"); //Kolikr�t v�m budu, vy bastardi, muset opakovat, abyste neproch�zeli moj� chatr��?
};

// **************************************************
// 				Was ist dein Problem?
// **************************************************

INSTANCE DIA_Kyle_Problem (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_Problem_Condition;
	information		= DIA_Kyle_Problem_Info;
	permanent		= 1;
	description		= "Co m� za probl�m?";
};

FUNC INT DIA_Kyle_Problem_Condition()
{	
	return 1;	
};

FUNC VOID DIA_Kyle_Problem_Info()
{
	AI_Output (other, self,"DIA_Kyle_Problem_15_00"); //Co m� za probl�m?
	AI_Output (self, other,"DIA_Kyle_Problem_10_01"); //Nech m� na pokoji, �lov��e! Ka�d� m� tady probl�my se MNOU!
	AI_Output (self, other,"DIA_Kyle_Problem_10_02"); //V�echno za�alo v okam�iku, kdy� jsem stav�l tuhle chatr�.
	AI_Output (self, other,"DIA_Kyle_Problem_10_03"); //��kali: nestav tu chatr� tak bl�zko strouhy.
	AI_Output (self, other,"DIA_Kyle_Problem_10_04"); //Nikdo z t�ch bastard� mi ale ne�ekl, co se stane, kdy� to ud�l�m.
	AI_Output (self, other,"DIA_Kyle_Problem_10_05"); //Kdy� jsem se za p�r dn� vr�til z dolu, byly tam druh� dve�e.
	AI_Output (self, other,"DIA_Kyle_Problem_10_06"); //Ty hajzlov�! Nen�vid�m je! Ani nedok�u ��ci, jak stra�n� je nen�vid�m!
	AI_Output (self, other,"DIA_Kyle_Problem_10_07"); //Te�  ka�d� proch�z� moj� chatr��. Ka�d� idiot.
};

	
	
	
	
	


















