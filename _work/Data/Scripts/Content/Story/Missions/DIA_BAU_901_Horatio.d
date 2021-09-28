// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Horatio_EXIT (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 999;
	condition	= DIA_Horatio_EXIT_Condition;
	information	= DIA_Horatio_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Horatio_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Horatio_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Wasser
// ************************************************************

INSTANCE Info_Horatio_Wasser(C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 800;
	condition	= Info_Horatio_Wasser_Condition;
	information	= Info_Horatio_Wasser_Info;
	permanent	= 1;
	description = "Lefty m� poslal. P�inesl jsem ti trochu vody.";
};                       

FUNC INT Info_Horatio_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Horatio_Wasser_Info()
{
	AI_Output(other,self,"Info_Horatio_Wasser_15_00"); //Poslal m� Lefty. P�inesl jsem trochu vody.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Horatio_Wasser_09_01"); //D�ky, p��teli! Je�t� chv�li a za�al bych p�t bahno!
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Horatio_Wasser_NOWATER_09_00"); //U� nic nezbylo. Vezmu si trochu od ostatn�ch.
	};
};

// ************************************************************
// 						Hallo
// ************************************************************
	var int horatio_trouble;
// ************************************************************

INSTANCE DIA_Horatio_Hello (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_Hello_Condition;
	information	= DIA_Horatio_Hello_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Horatio_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Horatio_Hello_Info()
{	
	AI_GotoNpc	(self, hero);

	AI_Output (self, other,"DIA_Horatio_Hello_09_00"); //Co tady d�l�? Hled� probl�my?
	
	Info_ClearChoices(DIA_Horatio_Hello );
	Info_AddChoice	 (DIA_Horatio_Hello,"Probl�my? S k�m? S n�jak�m roln�kem?",DIA_Horatio_Hello_PissOff);
	Info_AddChoice	 (DIA_Horatio_Hello,"Hej, kl�dek! Jsem tady nov�.",DIA_Horatio_Hello_BeCool);
};

func void DIA_Horatio_Hello_BeCool()
{
	AI_Output (other, self,"DIA_Horatio_Hello_BeCool_15_00"); //Hej, kl�dek! Jsem tady nov�.
	AI_Output (self, other,"DIA_Horatio_Hello_BeCool_09_01"); //Ha... P�ipad� mi v po��dku... Jeden nikdy nev�. Po��d p�ich�zej� nov� chlapi.
	Info_ClearChoices(DIA_Horatio_Hello );
};

func void DIA_Horatio_Hello_PissOff()
{
	AI_Output (other, self,"DIA_Horatio_Hello_PissOff_15_00"); //Probl�my? S k�m? S n�jak�m roln�kem?
	AI_Output (self, other,"DIA_Horatio_Hello_PissOff_09_01"); //�e pracuju na pol�ch je�t� neznamen�, �e se nedok�u ubr�nit takov�m chlap�k�m, jako jsi ty.
	AI_Output (self, other,"DIA_Horatio_Hello_PissOff_09_02"); //Tak poj�, jestli chce� m�t probl�my!
	horatio_trouble = TRUE;
	
	Info_ClearChoices(DIA_Horatio_Hello);
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						SORRY (PERM)
// ************************************************************

INSTANCE DIA_Horatio_SORRY (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_SORRY_Condition;
	information	= DIA_Horatio_SORRY_Info;
	permanent	= 1;
	description = "Je mi l�to toho, co jsem �ekl o roln�c�ch.";
};                       

FUNC INT DIA_Horatio_SORRY_Condition()
{
	if (horatio_trouble == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_SORRY_Info()
{	
	AI_Output (other, self,"DIA_Horatio_SORRY_15_00"); //Je mi l�to toho, co jsem �ekl o roln�c�ch.
	AI_Output (self, other,"DIA_Horatio_SORRY_09_01"); //M�l bys nap�ed myslet, hochu!
};

// ************************************************************
// 					Horatios Story
// ************************************************************

INSTANCE DIA_Horatio_Story (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_Story_Condition;
	information	= DIA_Horatio_Story_Info;
	permanent	= 0;
	description = "Co d�l� chlap jako ty mezi roln�kama?";
};                       

FUNC INT DIA_Horatio_Story_Condition()
{
	if ( (horatio_trouble==FALSE) && (Npc_KnowsInfo(hero,DIA_Horatio_Hello)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_Story_Info()
{	
	AI_Output (other, self,"DIA_Horatio_Story_15_00"); //Co d�l� chlap jako ty mezi roln�kama?
	AI_Output (self, other,"DIA_Horatio_Story_09_01"); //Lee m� o to po��dal. Ale u� se neperu - s v�jimkou sebeobrany.
	AI_Output (self, other,"DIA_Horatio_Story_09_02"); //Jednou jsem zabil jednoho chlap�ka, a to jednou bylo a� moc. To je d�vod, pro� m� poslali do t�hle zpropaden� kolonie - takov� je z�kon.
	AI_Output (other, self,"DIA_Horatio_Story_15_03"); //Jak se to stalo?
	AI_Output (self, other,"DIA_Horatio_Story_09_04"); //Byla to oby�ejn� hospodsk� rva�ka. Necht�l jsem toho kluka zab�t, jenom jsem ho pra�til moc siln�.
	AI_Output (self, other,"DIA_Horatio_Story_09_05"); //Byl jsem tehdy kov��. Nev�d�l jsem, jakou m�m vlastn� s�lu...
};

// ************************************************************
// 						Warum hier?
// ************************************************************

INSTANCE DIA_Horatio_WhyHere (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_WhyHere_Condition;
	information	= DIA_Horatio_WhyHere_Info;
	permanent	= 0;
	description = "Pro� ses dal k TOMUHLE t�boru?";
};                       

FUNC INT DIA_Horatio_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_WhyHere_Info()
{	
	AI_Output (other, self,"DIA_Horatio_WhyHere_15_00"); //Pro� ses dal k TOMUHLE t�boru?
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_01"); //Jedno ti �eknu: jedin� dal�� mo�nost byla d�t se k t�m sekt��sk�m bl�zn�m. Ale j� nem�m nejmen�� chu� nechat si od jejich Guru vym�t mozek.
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_02"); //Ve Star�m t�bo�e jsem m�l spoustu probl�m� se str�emi, ale u �old�k� a bandit� jsem m�l aspo� n�jak� respekt.
	AI_Output (other, self,"DIA_Horatio_WhyHere_15_03"); //M�li z tebe strach...
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_04"); //Mo�n�. Ale ka�dop�dn� jsem na�el svoje m�sto tady a ty bys m�l zkusit to sam�.
};

// ************************************************************
// 						Bitte STR
// ************************************************************
	var int horatio_StrFree;
// ************************************************************

INSTANCE DIA_Horatio_PleaseTeachSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_PleaseTeachSTR_Condition;
	information	= DIA_Horatio_PleaseTeachSTR_Info;
	permanent	= 0;
	description = "Nau�� m�, jak se st�t tak siln�m jako jsi ty?";
};                       

FUNC INT DIA_Horatio_PleaseTeachSTR_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_PleaseTeachSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_15_00"); //Nau�� m�, jak se st�t tak siln�m jako jsi ty?
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_09_01"); //I kdybych mohl - JAK bys pak svoji s�lu vyu�il?
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
	var C_NPC ricelord; ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if	Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio)
	{
		Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"Mohl bych pak vy��dit R��ov�ho Lorda a jeho tlupu!",DIA_Horatio_PleaseTeachSTR_Ricelord);
	}
	else
	{
		Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"Dobr� ot�zka. Budu o tom p�em��let...",DIA_Horatio_PleaseTeachSTR_BACK);
	};
	Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"Sebeobrana!",DIA_Horatio_PleaseTeachSTR_Defend);
	Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR,"Nau�il bych ty bastardy, jak se mnou maj� spr�vn� mluvit!",DIA_Horatio_PleaseTeachSTR_Attack);

	Log_CreateTopic		(CH1_HoratiosTeachings,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_HoratiosTeachings, LOG_RUNNING);
	B_LogEntry			(CH1_HoratiosTeachings,"Horatio, roln�k z r��ov�ch pol� Nov�ho t�bora, m� m��e nau�it, jak siln�ji ude�it. N�jak v�ak nem��u naj�t spr�vnou odpov�� na jeho ot�zku PRO�.");
};

func void DIA_Horatio_PleaseTeachSTR_Attack()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Attack_15_00"); //Nau�il bych ty bastardy, jak se mnou maj� spr�vn� mluvit!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Attack_09_01"); //P�edt�m bys m�l v�d�t, �e ses s�m stal jedn�m z t�ch bastard�... Ne, sire, na to t� p�ipravovat nebudu.
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

func void DIA_Horatio_PleaseTeachSTR_Defend()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Defend_15_00"); //Sebeobrana!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Defend_09_01"); //To chce rychlost, ne s�lu. Mysl�, �e rozb�t n�komu lebku, je lep��, ne� sjednat m�r?
};

func void DIA_Horatio_PleaseTeachSTR_BACK()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_BACK_15_00"); //Dobr� ot�zka. Budu o tom p�em��let...
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

func void DIA_Horatio_PleaseTeachSTR_Ricelord()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Ricelord_15_00"); //Mohl bych pak vy��dit R��ov�ho Lorda a jeho tlupu!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Ricelord_09_01"); //Hmm... Nebyl bys prvn�, kdo se o to pokusil.
	horatio_StrFree = TRUE;
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

// ************************************************************
// 						Nachgedacht (STR)
// ************************************************************

INSTANCE DIA_Horatio_ThoughtSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_ThoughtSTR_Condition;
	information	= DIA_Horatio_ThoughtSTR_Info;
	permanent	= 1;
	description = "Cel� jsem si to je�t� promyslel...";
};                       

FUNC INT DIA_Horatio_ThoughtSTR_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Horatio_PleaseTeachSTR) && (horatio_StrFree == FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_ThoughtSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_15_00"); //Cel� jsem si to je�t� promyslel...
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_09_01"); //No a? Vymyslel jsi n�co lep��ho?
	
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
	Info_AddChoice	 (DIA_Horatio_ThoughtSTR,"Ne.",DIA_Horatio_ThoughtSTR_NoIdea);
	
	var C_NPC ricelord; ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if	Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio)
	{
		Info_AddChoice	 (DIA_Horatio_ThoughtSTR,"Ano. Chci b�t schopen dostat R��ov�ho Lorda a jeho tlupu! ",DIA_Horatio_ThoughtSTR_Ricelord);
	};
};

func void DIA_Horatio_ThoughtSTR_NoIdea()
{
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_NoIdea_15_00"); //Ne.
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_NoIdea_09_01"); //Myslel jsem si to.
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
};

func void DIA_Horatio_ThoughtSTR_Ricelord()
{
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_Ricelord_15_00"); //Ano. Chci b�t schopen dostat R��ov�ho Lorda a jeho tlupu!
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_Ricelord_09_01"); //Hmm... Nebyl bys prvn�, kdo se o to pokusil.
	horatio_StrFree = TRUE;
	
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
};

// ************************************************************
//					Will Ricelord k�pfen
// ************************************************************

func void DIA_Horatio_HelpSTR_LEARN_NOW()
{
	if (other.attribute[ATR_STRENGTH]<=(100-5))
	{
		other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 5;
		PrintScreen	("S�la +5", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		other.attribute[ATR_STRENGTH] = 100; 
		PrintScreen	("S�la: 100", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
				
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_00"); //Pokud chce� ude�it plnou silou, mus� zn�t spr�vnou taktiku.To je prvn� v�c, kterou se jako kov�� nau��.
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_01"); //Nau� se rozm�chnout celou rukou, od ramene po z�p�st�.
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_02"); //��m l�p to zvl�dne�, t�m siln�j�� bude r�na. Rychle t� to vy�erp�.
};

//--------------------------------------------------------------

INSTANCE DIA_Horatio_HelpSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_HelpSTR_Condition;
	information	= DIA_Horatio_HelpSTR_Info;
	permanent	= 0;
	description = "PORAZ�M R��ov�ho Lorda a jeho tlupu - kdy� mi pom��e�!";
};                       

FUNC INT DIA_Horatio_HelpSTR_Condition()
{
	if (horatio_StrFree == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_HelpSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_HelpSTR_15_00"); //PORAZ�M R��ov�ho Lorda a jeho tlupu - kdy� mi pom��e�!
	AI_Output (self, other,"DIA_Horatio_HelpSTR_09_01"); //Dob�e! P��sahal jsem, �e u� na nikoho neza�to��m, ale nikdy jsem ne�ekl, �e to nenau��m n�koho, kdo to ud�l�!
	AI_Output (other, self,"DIA_Horatio_HelpSTR_15_02"); //Jsem jedno ucho!
	DIA_Horatio_HelpSTR_LEARN_NOW();

	Log_SetTopicStatus	(CH1_HoratiosTeachings, LOG_SUCCESS);
	B_LogEntry			(CH1_HoratiosTeachings,"Horatio m� nau�il, jak v boji pou��vat s�lu a jak siln�ji ude�it. Ryz� du�e, tenhle chlap�k.");
};

// ************************************************************
// 							Thanks (PERM)
// ************************************************************

INSTANCE DIA_Horatio_Thanks (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_Thanks_Condition;
	information	= DIA_Horatio_Thanks_Info;
	permanent	= 1;
	description = "D�ky za tvou pomoc!";
};                       

FUNC INT DIA_Horatio_Thanks_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_HelpSTR))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_Thanks_Info()
{	
	AI_Output (other, self,"DIA_Horatio_Thanks_15_00"); //D�ky za tvou pomoc!
	AI_Output (self, other,"DIA_Horatio_Thanks_09_01"); //Pou�ij sv� um�n� pro dobro v�ci a pro NIC JIN�HO.
};



