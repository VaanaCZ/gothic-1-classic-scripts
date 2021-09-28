//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################
instance  Info_Xardas_OT (C_INFO)
{
	npc				= Kdf_406_OTXardas;
	condition		= Info_Xardas_OT_Condition;
	information		= Info_Xardas_OT_Info;
	important		= 1;
	permanent		= 0; 
};

FUNC int  Info_Xardas_OT_Condition()
{	
	if (Npc_GetDistToWP(self, "TPL_331") < 1000)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OT_Info()
{
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //Nem�me moc �asu, tak poslouchej bedliv�!
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //Jak jsi...
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //Sp�� nen� daleko. Musel jsem pou��t v�echny sv� s�ly, abych se sem dostal.
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //P�elo�il jsem Sk�et� proroctv� a objevil tajemstv� p�ti srdc�.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //P�t srdc� kn��, kter� jsi porazil, je ulo�eno v p�ti relikvi���ch.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //Tyto relikvi��e se daj� otev��t, ale jen starobyl� ost��, kter� kn�� nosili u sebe, mohou po�kodit srdce.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //Ty mus� ta srdce probodnout p�ti ost��mi. Jedin� tak bude� moci odstranit Sp��e z tohoto sv�ta.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //Rozum�m!
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //Posp�, procitnut� arcid�mona se bl��, pomaten� Cor Kalom se sv�mi zbloudil�mi ��ky je tu.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //Shrom�dili se ve Sp��ov� s�le.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //U� jsem krv�cel dost! Te� m� nikdo nezastav�!
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //Sp��ova moc s�l� a s�l�, nedok�u...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //Co se ti stalo?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //J�... mus�m...

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,"Nade�el �as. Mus�m b�t v t�sn� bl�zkosti m�sta Sp��ova odpo�inku. Znenad�n� se objevil Xardas a dal mi pokyny k boji. V relikvi��i je p�t srdc� nemrtv�ch sk�et�ch �aman�, kter� mus�m prokl�t p�ti �epelemi, kter� m�m p�i sob�. To je jedin� zp�sob, jak porazit Sp��e. Vypad� to prost�...");
	
	AI_StopProcessInfos	(self);
};		
