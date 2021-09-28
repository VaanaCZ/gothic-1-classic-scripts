// **************************************************
// 					Pre - EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_MuteExit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_MuteExit_Condition;
	information	= DIA_BaalTondral_MuteExit_Info;
	permanent	= 0;
	description = "Nic ne��kej";
};                       

FUNC INT DIA_BaalTondral_MuteExit_Condition()
{
	if (!Npc_KnowsInfo (hero,DIA_BaalTondral_YouTalked))
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_MuteExit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_Exit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_Exit_Condition;
	information	= DIA_BaalTondral_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalTondral_Exit_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_BaalTondral_MuteExit) || Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked) )
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Fanatic Teacher
// **************************************************

INSTANCE DIA_BaalTondral_FanaticTeacher (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_FanaticTeacher_Condition;
	information	= DIA_BaalTondral_FanaticTeacher_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_BaalTondral_FanaticTeacher_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_FanaticTeacher_Info()
{
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Nevypad� na n�koho, kdo se podrobil otroctv� Rudobaron�.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //Vypad� sp�e jako hleda� - n�kdo, kdo hled� pravou v�ru. Nec�t� ve sv�m t�le ohe�, kter� t� v noci udr�uje v bd�losti?
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_02"); //Aha, pochybuje� o tom, �e to, co se ti Rudobaronovi otroci pokou�ej� ��ci, je pravdiv� a od�vodn�n�. Ty tak� v�, pro� o tom pochybuje�. Proto�e l�ou!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_03"); //S takov�mi l�emi se pokou�ej� ovl�dat slab� du�e. Tvoje du�e je ale siln�j�� ne� jejich l�i!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Nepoci�uje� ka�dodenn� touhu po svobod�? Nec�t� ji st�le siln�ji? Prov�z� tvou du�i. Nech ji p�sobit!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_05"); //V�, co se d�je, kdy� se to sna�� zapudit? Pop�r� svoj� du�i, pop�r� sebe sama! Nenech strach, aby panoval tv�mu �ivotu!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Osvobo� se. Pochop! Sp�� PROCITNE. Osvobod� t� a v�echny ty pochybova�n� nev�rce zatrat�.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Jako smet�, kter� spl�chne d隝, zmiz� z tohoto sv�ta. Budou b�dovat, na��kat a k�t se, ale bude u� p��li� pozd�.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Pak zaplat� sv�j dluh. Zaplat� vlastn� krv�. A sv�mi �ivoty.
};

// **************************************************
// 				Du hast mich angesprochen
// **************************************************

INSTANCE DIA_BaalTondral_YouTalked (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_YouTalked_Condition;
	information	= DIA_BaalTondral_YouTalked_Info;
	permanent	= 0;
	description = "Hej! Te� si mluvil ke mn�. Znamen� to, �e j� te� sm�m mluvit k tob�?";
};                       

FUNC INT DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_YouTalked_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_YouTalked_15_00"); //Hej! Te� si mluvil ke mn�. Znamen� to, �e j� te� m�m mluvit k tob�?
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_01"); //Vid�m, �e ses ji� s�il s na��m ��dem. To je dob�e.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_02"); //C�t�m tvou velkou duchovn� s�lu! Brzy se bude� moci p�ipojit k na�� komunit�.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_03"); //Mluvil jsem k tob�, proto�e jsem ti cht�l d�t p��le�itost, abys dok�zal svou oddanost.
};

// **************************************************
// 				Loyalit�t beweisen
// **************************************************
	var int BaalTondral_GetNewGuy;
// **************************************************

INSTANCE DIA_BaalTondral_Loyality (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_Loyality_Condition;
	information	= DIA_BaalTondral_Loyality_Info;
	permanent	= 0;
	description = "Jak m��u dok�zat svou oddanost?";
};                       

FUNC INT DIA_BaalTondral_Loyality_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Loyality_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_Loyality_15_00"); //Jak m��u dok�zat svou oddanost?
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_01"); //P�edev��m pot�ebujeme nov� du�e, kter� by se p�idaly k na�� komunit�.
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_02"); //T�m, �e do na�eho t�bora p�ivede� jednoho nebo v�ce mu��, dok�e�, �e jsi ochoten na�� komunit� prokazovat dobr� slu�by.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Baal Tondral m� vyslal do Star�ho t�bora, abych naverboval pro Bratrstvo nov� lidi. Douf�m, �e to bude dobr� p��le�itost, jak se mu dostat do p��zn�!");

	BaalTondral_GetNewGuy = LOG_RUNNING;
};

// **************************************************
// 				Wo finde ich neuen Mann
// **************************************************

INSTANCE DIA_BaalTondral_NewMember (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember_Condition;
	information	= DIA_BaalTondral_NewMember_Info;
	permanent	= 1;
	description = "Kde m�m hledat nov� �leny do Bratrstva?";
};                       

FUNC INT DIA_BaalTondral_NewMember_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember_15_00"); //Kde m�m hledat nov� �leny do Bratrstva?
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_01"); //Takov�m dobr�m m�stem je Star� t�bor, proto�e lid� tam jsou ji� p�esyceni strachem a l�emi. Pot�ebuj� n�jak�m zp�sobem pomoci.
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_02"); //V Nov�m t�bo�e bys nejsp� �sp�n� nebyl. Mu�i, kte�� tam �ij�, jsou barba�i.
};

// **************************************************
// 			Wieso braucht ihr so dringend Neue
// **************************************************

INSTANCE DIA_BaalTondral_NewMember2 (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember2_Condition;
	information	= DIA_BaalTondral_NewMember2_Info;
	permanent	= 0;
	description = "Pro� tak moc pot�ebujete nov� �leny?";
};                       

FUNC INT DIA_BaalTondral_NewMember2_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember2_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember2_15_00"); //Pro� tak moc pot�ebuje� nov� �leny?
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_01"); //Sp�� promluvil k na�emu mistrovi a sd�lil mu, �e m� pro n�s d�le�itou zpr�vu.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_02"); //Nepoda�ilo se mu v�ak nashrom�dit dostate�nou s�lu. Proto pot�ebujeme VLASTN� s�lu, abysme se s n�m dok�zali spojit.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_03"); //Proto�e p�ipravujeme velk� vz�v�n�, pravd�podobnost �sp�chu se zv��� s po�tem z��astn�n�ch mu��.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_04"); //Jestli se chce� o tom dozv�d�t v�c, jdi do velk�ho dvora naproti chr�mov�mu vrchu. Neru� ale na�eho mistra p�i meditac�ch!
};

// **************************************************
// 					DUSTY SUCCESS
// **************************************************

INSTANCE DIA_BaalTondral_DustySuccess (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_DustySuccess_Condition;
	information	= DIA_BaalTondral_DustySuccess_Info;
	permanent	= 0;
	description = "Je tady n�kdo, mist�e, kdo by se cht�l s v�mi sezn�mit.";
};                       

FUNC INT DIA_BaalTondral_DustySuccess_Condition()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	if ( (BaalTondral_GetNewGuy == LOG_RUNNING) && (Npc_GetDistToNpc(self,dusty)<1000) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_DustySuccess_Info()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_00"); //Je tady n�kdo, mist�e, kdo by se cht�l s v�mi sezn�mit.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_01"); //Koho jsi p�ivedl? Je toho hoden?
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_02"); //Ur�it� bude pot�ebovat va�e duchovn� veden�, mist�e.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_03"); //Velmi dob�e. Ode dne�ka bude jedn�m z m�ch ��k�.
	//------------------------------------------------------------------	
	AI_TurnToNpc		(self, dusty);
	AI_TurnToNpc		(dusty,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_DustySuccess_13_04"); //Bude� za mnou chodit ka�d� den do m� ch��e a naslouchat m�m slov�m. Tv� du�e pak bude zachr�n�na.

	//AI_Output			(dusty,other,"DIA_BaalTondral_DustySuccess_03_05"); //Hei�t das, ich bin dabei - einfach so?
	//AI_TurnToNpc		(other,dusty);
	//AI_Output			(other,NULL,"DIA_BaalTondral_DustySuccess_15_06"); //Sieht so aus. Tu einfach, was der Meister dir sagt.

	//---- Dusty vom SC l�sen ----
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;	// Immortal l�schen
	dusty.guild = GIL_NOV;
	Npc_SetTrueGuild	(dusty, GIL_NOV);
	B_ExchangeRoutine	(Vlk_524_Dusty,"PREPARERITUAL");
	
	BaalTondral_GetNewGuy = LOG_SUCCESS;
	B_LogEntry			(CH1_RecruitDusty,"Dusty je te� u�n�m Baala Tondrala. Splnil jsem sv�j �kol.");
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_SUCCESS);
	B_GiveXP			(XP_DeliveredDusty);
};

// **************************************************
// 					zu Kalom
// **************************************************

INSTANCE DIA_BaalTondral_SendToKalom (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_SendToKalom_Condition;
	information	= DIA_BaalTondral_SendToKalom_Info;
	permanent	= 0;
	description = "Mist�e! Cht�l bych se p�idat k Bratrstvu! Pot�ebuji tvou p��mluvu.";
};                       

FUNC INT DIA_BaalTondral_SendToKalom_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_SendToKalom_Info()
{
	AI_Output 		(other, self,"DIA_BaalTondral_SendToKalom_15_00"); //Mist�e! Cht�l bych se p�idat k Bratrstvu! Pot�ebuji tvou p��mluvu.
	AI_TurnToNpc	(self, other);
	AI_Output 		(self, other,"DIA_BaalTondral_SendToKalom_13_01"); //Prok�zal jsi svou zp�sobilost. Jdi za Corem Kalomem a obl�kni roucho.

	B_LogEntry(CH1_JoinPsi,"Baal Tondral rozhodl, �e jsem hoden nosit roucho novice!");
};








