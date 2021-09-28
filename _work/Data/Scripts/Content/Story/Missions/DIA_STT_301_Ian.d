
// ************************ EXIT **************************

instance  STT_301_IAN_Exit (C_INFO)
{
	npc			=  STT_301_IAN;
	nr			= 999;
	condition	=  STT_301_IAN_Exit_Condition;
	information	=  STT_301_IAN_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_301_IAN_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_301_IAN_Exit_Info()
{
	AI_Output			(other, self,"STT_301_IAN_Exit_Info_15_01"); //Jenom se tu rozhl��m.
	AI_Output			(self, other,"STT_301_IAN_Exit_Info_13_02"); //Ned�lej probl�my.
	
	AI_StopProcessInfos	( self );
};
// ***************** Erstes Treffen *****************************

instance  STT_301_IAN_HI (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_HI_Condition;
	information		= STT_301_IAN_HI_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ty jsi Ian, ��f toho dolu?"; 
};

FUNC int  STT_301_IAN_HI_Condition()
{	
	if ( ! Npc_KnowsInfo (hero,STT_301_IAN_NEST))
	{	
		return TRUE;
	};
};
FUNC void  STT_301_IAN_HI_Info()
{
	AI_Output			(other, self,"STT_301_IAN_HI_Info_15_01"); //Ty jsi Ian, ��f toho dolu?
	AI_Output			(self, other,"STT_301_IAN_HI_Info_13_02"); //Ano, jsem Ian. A tohle je m�j d�l. Ni�eho se nedot�kej a nic nerozbij.
}; 
// ***************** Infos *****************************
instance STT_301_IAN_GOMEZ  (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GOMEZ_Condition;
	information		= STT_301_IAN_GOMEZ_Info;
	important		= 0;
	permanent		= 0;
	description		= "Nen� to Gomez�v d�l?"; 
};

FUNC int  STT_301_IAN_GOMEZ_Condition()
{	
	if Npc_KnowsInfo (hero,STT_301_IAN_HI)
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GOMEZ_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOMEZ_Info_15_01"); //Nen� to Gomez�v d�l?
	AI_Output			(self, other,"STT_301_IAN_GOMEZ_Info_13_02"); //Ano, jist�, �e je to d�l Star�ho t�bora. Ale je tady jedin� ��f - a to jsem j�.
}; 
// ***************** Infos *****************************
instance  STT_301_IAN_ORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_ORE_Condition;
	information		= STT_301_IAN_ORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "M��e� mi ��ci n�co o zdej�� produkci rudy?"; 
};

FUNC int  STT_301_IAN_ORE_Condition()
{
	if Npc_KnowsInfo (hero,STT_301_IAN_GOMEZ)
	{
		return TRUE ;
	};

};
FUNC void  STT_301_IAN_ORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_ORE_Info_15_01"); //M��e� mi ��ci n�co o zdej�� produkci rudy?
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_02"); //T��me ve dne v noci. To znamen� 200 pytl� m�s��n� do skladu a dal��ch 20 pytl� na p�etaven�.
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_03"); //Z rudy, kterou dod�v�me kr�li, se m��ou ukovat stovky ost��.
	
}; 
// ***************** Infos *****************************   
instance  STT_301_IAN_MORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MORE_Condition;
	information		= STT_301_IAN_MORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Sly�el jsem, �e ta ruda m� kouzelnou moc. �ekni mi o tom n�co."; 
};

FUNC int  STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_ORE) ;
};


FUNC void  STT_301_IAN_MORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MORE_Info_15_01"); //Sly�el jsem, �e ta ruda m� kouzelnou moc. �ekni mi o tom n�co.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_02"); //Ta magick� moc dod�v� kovu speci�ln� vlastnosti. Zbran�, kter� jsou z n�j ukov�ny, se nel�mou, jejich ost�� jsou ost�ej�� ne� oby�ejn�.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_03"); //Arm�da vybaven� takov�mi zbran�mi m� rozhoduj�c� p�evahu v boji.
	
};   
// ***************** Infos *****************************  
instance  STT_301_IAN_MAGIC (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MAGIC_Condition;
	information		= STT_301_IAN_MAGIC_Info;
	important		= 0;
	permanent		= 0;
	description		= "�ekni mi v�c o t� rud�."; 
};

FUNC int  STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_MORE) ;
};


FUNC void  STT_301_IAN_MAGIC_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MAGIC_Info_15_01"); //�ekni mi v�c o t� rud�.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_02"); //Nane�t�st� b�hem procesu taven� magick� kouzlo rudy vyprch�v�. V horkovzdu�n�ch tavic�ch pec�ch u Severn�ho mo�e znaj� spr�vnou techniku taven�.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_03"); //Ale zbran� vyroben� z t�hle rudy jsou i bez magick�ho kouzla v�jime�n� trvanliv� a maj� daleko v�t�� ��inek ne� zbran� oby�ejn�.
	
};   
// ***************** Infos *****************************   
instance  STT_301_IAN_MINE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MINE_Condition;
	information		= STT_301_IAN_MINE_Info;
	important		= 0;
	permanent		= 0;
	description		= "�ekni mi n�co o dole."; 
};

FUNC int  STT_301_IAN_MINE_Condition()
{	
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (hero, STT_301_IAN_HI))
	{
		return TRUE;
	};

};
func void  STT_301_IAN_MINE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_01"); //Pov�dej mi o dolu.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_02"); //Jestli se chce� tady porozhl�dnout, mus� b�t opatrn�. V jeskyn�ch jsou d�ln� �ervi. M�l bys rad�ji z�stat v hlavn� �acht�.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_03"); //A nechat templ��e na pokoji. Sice se v�t�inu �asu jen tak proch�zej�, ale kdy� p�ijdou �ervi, jsou to nejlep�� bojovn�ci, jak� v�bec m��eme na na�� stran� m�t.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_04"); //Budu si to pamatovat.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_05"); //Mus�m n�co d�lat. A neru� moje chlapy p�i pr�ci.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_06"); //Jen se tu rozhl��m.
};
/*------------------------------------------------------------------------
					BRING LIST									
------------------------------------------------------------------------*/

instance  STT_301_IAN_WANTLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_WANTLIST_Condition;
	information		= STT_301_IAN_WANTLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "M�m tady opat�it seznam v�c� pro t�bor."; 
};

FUNC int  STT_301_IAN_WANTLIST_Condition()
{
	if (Diego_BringList == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero,Info_Diego_IanPassword)) 
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_WANTLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_WANTLIST_Info_15_01"); //M�m tady opat�it seznam v�c� pro t�bor.
	AI_Output			(self, other,"STT_301_IAN_WANTLIST_Info_13_02"); //To by mohl ��ci ka�d�. Ztra� se.
	 
};  
/*------------------------------------------------------------------------
							LISTE ABHOLEN									
------------------------------------------------------------------------*/

instance  STT_301_IAN_GETLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GETLIST_Condition;
	information		= STT_301_IAN_GETLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Poslal m� Diego. M�m tady opat�it seznam."; 
};

FUNC int  STT_301_IAN_GETLIST_Condition()
{	
	if (Diego_BringList == LOG_RUNNING)
	&& (Npc_KnowsInfo (hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GETLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_01"); //Poslal m� Diego. M�m tady opat�it seznam.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_02"); //Dob�e, tady je seznam. �ekni jim, aby si s dod�vkou posp�ili.
	B_LogEntry  (CH1_BringList,"Ian mi bez probl�m� vydal seznam.");
	B_GiveInvItems	(self,hero,TheList,1);
};  
// **************************************************************************
// 							MISSION BRING MCQ EIER RUNNING , 
//							oder: Ohne Zahnrad keine Eier
// **************************************************************************  
instance  STT_301_IAN_NEST (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NEST_Condition;
	information	=  STT_301_IAN_NEST_Info;
	important	= 0;	
	permanent	= 0;
	description = "Mus� tu n�kde b�t hn�zdo d�ln�ch �erv�.";
};                       

FUNC int  STT_301_IAN_NEST_Condition()
{
	if (CorKalom_BringMCQBalls == LOG_RUNNING)
	&& ( Npc_KnowsInfo (hero,STT_301_IAN_HI) )
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_NEST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_01"); //Mus� tu n�kde b�t hn�zdo d�ln�ch �erv�.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_02"); //Jsou tu z�ejm� tucty jejich hn�zd.
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_03"); //Posly�, pot�ebuju se te� dostat do jejich hn�zda...
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_04"); //Nem�m �as se te� o to starat. Drti�ka p�estala pracovat. P�ed n�kolika hodinami se rozbilo ozuben� kolo.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_05"); //Nem�m potuchy, kde vz�t nov�.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_06"); //Postarej se mi o to ozuben� kolo a j� se pak postar�m o tv�j probl�m.

	B_LogEntry		(CH2_MCEggs,"Ian, velitel dolu, mi nepom��e hledat hn�zdo. M�l bych mu obstarat nov� ozuben� kolo pro jeho rozbitou drti�ku rudy. Zm�nil se o opu�t�n� postrann� �tole, kde bych mohl naj�t starou drti�ku.");

	Ian_gearwheel = LOG_RUNNING;
};
// ******************************MISSION RUNNING********************************************  
instance  STT_301_IAN_GEAR_RUN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_RUN_Condition;
	information	=  STT_301_IAN_GEAR_RUN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ozuben� kolo? Kde si mysl�, �e ho vezmu?";
};                       

FUNC int  STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt	(PD_MISSION, "Ian_gearwheel: ", Ian_gearwheel);
	
	if ((Ian_gearwheel == LOG_RUNNING)
	&&	!Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //Ozuben� kolo? Kde si mysl�, �e ho vezmu?
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //Nem�m p�edstavu. Jsem stejn� bezradn� jako ty!
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //V postrann� �acht� je ale star� porouchan� drti�ka. Mo�n� by se dalo vz�t tam.
};

// ******************************MISSION SUCCESS********************************************  
instance  STT_301_IAN_GEAR_SUC (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_SUC_Condition;
	information	=  STT_301_IAN_GEAR_SUC_Info;
	important	= 0;	
	permanent	= 0;
	description = "M�m to ozuben� kolo.";
};                       

FUNC int  STT_301_IAN_GEAR_SUC_Condition()
{
	if (Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	&& (Ian_gearwheel == LOG_RUNNING)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_SUC_Info()
{
	B_GiveInvItems (hero,self, ItMi_Stuff_Gearwheel_01 ,1);
	Npc_RemoveInvItem (self,ItMi_Stuff_Gearwheel_01);
	
	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP	(XP_BringGearWheel);
	
	var C_Npc Sklave; 				
	Sklave = Hlp_GetNpc	(ORC_2001_SKLAVE);
	Npc_ExchangeRoutine (Sklave,"Stomper");

	AI_Output			(other, self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //M�m to ozuben� kolo.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //Hej, dobr� pr�ce. Mysl�m, �e funguje. No a te� ty, hled� hn�zdo d�ln�ho �erva... hmmm...
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //B� za Asghanem a �ekni mu, aby ti otev�el vrata, aby ses dostal do temn�ch �achet.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //�ekni mu jenom 'V�echno jde dob�e'. T�m bude srozum�n� s t�m, �e jsem ti dal povolen�.

	B_LogEntry		(CH2_MCEggs,"P�inesl jsem Ianovi ozuben� kolo z vy�azen� drti�ky rudy. Ian prohl�sil, �e m�m Asghanovi ��ci V�ECHNO BUDE V PO��DKU. Potom mi otev�e vrata do temn�ch �achet.");
};

// ******************************GOTO ASGHAN********************************************  
instance  STT_301_IAN_GOTOASGHAN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GOTOASGHAN_Condition;
	information	=  STT_301_IAN_GOTOASGHAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Po��d hled�m �erv� hn�zdo.";
};                       

FUNC int  STT_301_IAN_GOTOASGHAN_Condition()
{
	if ((Ian_gearwheel == LOG_SUCCESS)
	&&  (!Npc_KnowsInfo (hero,Grd_263_Asghan_NEST)))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GOTOASGHAN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //Po��d hled�m �erv� hn�zdo.
	AI_Output			(self, other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //U� jsem ti �ekl, abys �el za Asghanem. Je to velitel str��. Najde� ho n�kde na nejni��� �rovni.

	B_LogEntry		(CH2_MCEggs,"Pokud chci naj�t hn�zdo d�ln�ch �erv�, mus�m si nejd��ve promluvit s Asghanem.");
};

//--SPIELER HAT DIE EIER AM START-------------------------
instance  STT_301_IAN_AFTERALL (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_AFTERALL_Condition;
	information	=  STT_301_IAN_AFTERALL_Info;
	important	= 0;	
	permanent	= 0;
	description = "Na�el jsem hn�zdo!";
};                       

FUNC int  STT_301_IAN_AFTERALL_Condition()
{
	if (Npc_HasItems (hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_AFTERALL_Info()
{
	AI_Output			(other, self,"STT_301_IAN_AFTERALL_Info_15_01"); //Na�el jsem hn�zdo!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_02"); //Tak u� tady budeme kone�n� m�t m�r a klid, hahaha!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_03"); //Bez ur�ky. Dobr� pr�ce, hochu!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_04"); //Tady si vezmi basu piv za svoji snahu.
	CreateInvItems		(self, ItFo_OM_Beer_01,6);
	B_GiveInvItems      (self, hero, ItFo_OM_Beer_01,6);
};

//-------NOT ENOUGH EGGS---------------
instance  STT_301_IAN_NOTENOUGH (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NOTENOUGH_Condition;
	information	=  STT_301_IAN_NOTENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "Na�el jsem hn�zdo! A vaj��ka kr�lovny d�ln�ch �erv�!";
};                       

FUNC int  STT_301_IAN_NOTENOUGH_Condition()
{
	if ( Npc_HasItems (hero,ItAt_Crawlerqueen) > 1 )
	&& ( Npc_HasItems (hero,ItAt_Crawlerqueen) < 3 )
	{
		return TRUE;
	};
};
FUNC VOID  STT_301_IAN_NOTENOUGH_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //Na�el jsem hn�zdo! A vaj��ka kr�lovny d�ln�ch �erv�!
	AI_Output			(self, other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //Co�e? Tohle jsou v�echna vaj��ka, co jsi na�el? Nu, co. Uk�zal jsi, �e um� bojovat.
};
