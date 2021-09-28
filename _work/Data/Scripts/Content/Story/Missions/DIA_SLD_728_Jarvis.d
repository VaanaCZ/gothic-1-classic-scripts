// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Jarvis_EXIT (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_EXIT_08_00"); //Hl�dej si z�da!
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						First
// ************************************************************

INSTANCE DIA_Jarvis_First (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_First_Condition;
	information	= DIA_Jarvis_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Jarvis_First_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_First_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_First_08_00"); //M� v �myslu proj�t touhle branou?
	AI_Output (other, self,"DIA_Jarvis_First_15_01"); //M� v �myslu m� zastavit?
	AI_Output (self, other,"DIA_Jarvis_First_08_02"); //Ne, ale m�l bys v�d�t, co t� �ek�. Tady to nen� jako ve Star�m t�bo�e nebo jako u t�ch sekt��sk�ch bl�zn�!
	AI_Output (other, self,"DIA_Jarvis_First_15_03"); //A co m� tu �ek�?
	AI_Output (self, other,"DIA_Jarvis_First_08_04"); //Tady nejsou ��dn� str�ci ani templ��i, kte�� by na tebe dohl�dli. Tady jedn� ka�d� s�m za sebe a jedin�, kdo spolu dr��, jsme my, �old�ci.
};

// ************************************************************
// 						S�ldner
// ************************************************************

INSTANCE DIA_Jarvis_SldInfo (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_SldInfo_Condition;
	information	= DIA_Jarvis_SldInfo_Info;
	permanent	= 0;
	description	= "Co d�laj� �old�ci?";
};                       

FUNC INT DIA_Jarvis_SldInfo_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_SldInfo_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_SldInfo_15_00"); //Co d�laj� �old�ci?
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_01"); //My - my jsme �old�ci m�g� Vody.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_02"); //N� c�l je dostat se odtud. Tvrd� na tom pracujeme a nevid�me v�ci tak snadno jako ti ho�i ze Star�ho t�bora, kte�� si u��vaj� dobr�ch �as� na z�dech sv�ch kop���.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_03"); //V�ichni jdeme za Leem. Je to velk� mu�. Mu�, kter� dr�� tenhle proklat� t�bor pohromad�.
};

// ************************************************************
// 						Magier
// ************************************************************

INSTANCE DIA_Jarvis_Magier (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Magier_Condition;
	information	= DIA_Jarvis_Magier_Info;
	permanent	= 0;
	description	= "Co d�laj� m�gov�?";
};                       

FUNC INT DIA_Jarvis_Magier_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_SldInfo))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Magier_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Magier_15_00"); //Co d�laj� m�gov�?
	AI_Output (self, other,"DIA_Jarvis_Magier_08_01"); //Zkoumaj� magick� vlastnosti rudy, kterou na�i ruda�i vyt�ili v dolu.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_02"); //Co j� v�m, cht�j� vyhodit celou tu zpropadenou rudnou haldu do pov�t��, aby se osvobodili z Bari�ry.
	AI_Output (other, self,"DIA_Jarvis_Magier_15_03"); //To vypad� nebezpe�n�.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_04"); //��kali, abysme se neznepokojovali.
};

// ************************************************************
// 						Erzhaufen
// ************************************************************

INSTANCE DIA_Jarvis_Erzhaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Erzhaufen_Condition;
	information	= DIA_Jarvis_Erzhaufen_Info;
	permanent	= 0;
	description	= "M�te tady velkou rudnou haldu?";
};                       

FUNC INT DIA_Jarvis_Erzhaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Erzhaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Erzhaufen_15_00"); //M�te tady velkou rudnou haldu?
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_01"); //Dalo by se tak ��ci. Mohli bysme za to koupit kr�lovu �enu.
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_02"); //My se ale nestar�me o ��dn� proklat� obchod s rudou s t�m star�m p�prdou. My se chceme ODTUD DOSTAT!
};

// ************************************************************
// 						Wo Haufen
// ************************************************************

INSTANCE DIA_Jarvis_WoHaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_WoHaufen_Condition;
	information	= DIA_Jarvis_WoHaufen_Info;
	permanent	= 0;
	description	= "Kde je rudn� halda?";
};                       

FUNC INT DIA_Jarvis_WoHaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Erzhaufen))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_WoHaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_00"); //Kde je rudn� halda?
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_01"); //Chce� vid�t opravdovou haldu rudy, vi�? Uprost�ed jeskyn� je velk� d�ra, do kter� to v�echno ukl�daj�.
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_02"); //Ale bl�zko se k n� nedostane�, to ti pov�d�m. M�gov� a na�i lid� ji st�e�� ve dne v noci.
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_03"); //Byl jsem zv�dav�.
};

// ************************************************************
// 						Rest
// ************************************************************

INSTANCE DIA_Jarvis_Rest (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_Rest_Condition;
	information	= DIA_Jarvis_Rest_Info;
	permanent	= 0;
	description	= "A co zbytek lid�?";
};                       

FUNC INT DIA_Jarvis_Rest_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Rest_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Rest_15_00"); //A co zbytek lid�?
	AI_Output (self, other,"DIA_Jarvis_Rest_08_01"); //V�echno dareb�ci. Ti se o ten zpropadenej t�bor nestaraj�. Rad�ji bych m�l p�ed branou rolnickou str�.
};

// ************************************************************
// 						PERM
// ************************************************************

INSTANCE DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 10;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= 1;
	description	= "Tak jak to jde?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_PERM_15_00"); //Tak jak to jde?
	AI_Output (self, other,"DIA_Jarvis_PERM_08_01"); //Ruda�i po��d t��. A� budeme m�t dost rudy, tak tu haldu odp�l�me.
};

/*------------------------------------------------------------------------
//							S�LDNERAUFNAHME									//
------------------------------------------------------------------------*/
instance Sld_728_Jarvis_AUFNAHMESOLDIER (C_INFO)
{
	npc				= Sld_728_Jarvis;
	condition		= Sld_728_Jarvis_AUFNAHMESOLDIER_Condition;
	information		= Sld_728_Jarvis_AUFNAHMESOLDIER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Sld_728_Jarvis_AUFNAHMESOLDIER_Condition()
{	
	if ( Npc_GetTrueGuild  (hero) == GIL_ORG) 
	&& ( (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS) )
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  Sld_728_Jarvis_AUFNAHMESOLDIER_Info()
{
	AI_GotoNpc (hero,self); 
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Hej, sly�el jsem, �e jsi v dolech po��dn� zatopil d�ln�m �erv�m.
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Lee by t� byl docela ochotn� p�ijmout za �old�ka. Promluv s n�m.

	self.flags = 0;		// Immortal-Flag l�schen

	Log_CreateTopic (GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry (GE_BecomeMercenary,"M�l bych si promluvit s Leem. Mo�n� mi dovol� p�idat se k �old�k�m.");
};






	


