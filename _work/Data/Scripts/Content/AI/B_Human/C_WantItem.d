//////////////////////////////////////////////////////////////////////////
//	C_WantItem
//	==========
//	Stellt fest, ob 'item' fьr 'self' interessant genug ist und gibt dann
//	TRUE, andernfalls FALSE zurьck. Die Kriterien sind:
//	->	Item gehцrt Nsc persцnlich (Besitz-Flag!)
//	->	kein Missionsgegenstand
//	->	Rьstung nur, wenn sie der Gilde des NSCs, nicht aber der Gilde des
//		des Kцrpers gehцren
//	->	wertvoll genug
//  ->  Erznugget
//	->	Runen & Scrolls nur fьr Magier interessant
//////////////////////////////////////////////////////////////////////////
func int C_WantItem ()
{
	PrintDebugNpc( PD_ZS_DETAIL, "C_WantItem" );
	var int itemvalue ;			itemvalue 		= item.value;           
	var int levelbewertung;     levelbewertung 	= (self.level)*10; 
	var int selfGuild;			selfGuild		= Npc_GetTrueGuild(self);
	var int bodyGuild;			bodyGuild		= Npc_GetTrueGuild(other);
	var int itemGuild;			itemGuild		= item.ownerguild;
	
	if (Hlp_IsValidItem (item))
	{
		PrintDebugString( PD_ZS_DETAIL, "...'item':", item.name);

		if (Npc_OwnedByNpc(item, self) || Npc_OwnedByGuild(item, selfGuild))
		{
			PrintDebugNpc(PD_ZS_DETAIL, "...'item' gehцrt NSC oder seiner Gilde -> JA!");
			return TRUE;
		};
	
		if 		(item.flags==ITEM_MISSION)
		{
			PrintDebugNpc( PD_ZS_DETAIL, "...'item' ist Missionsgegenstand -> NEIN!");
			return FALSE;
		}
		else if	(
					(item.mainflag	== ITEM_KAT_ARMOR)	&&
					(
						(bodyGuild 	== itemGuild )	||
						(selfGuild 	!= itemGuild )
					)		
				)
		{
			PrintDebugNpc( PD_ZS_DETAIL, "...'item' ist Rьstung und geht micht nichts an -> NEIN!");
			return FALSE;
		}
		else if	((item.mainflag==ITEM_KAT_RUNE)&&(!C_NpcIsMage(self)))
		{
			PrintDebugNpc( PD_ZS_DETAIL, "...'item' ist eine Rune/Scroll und Nsc ist kein Magier -> NEIN!");
			return FALSE;
		}
		else if	(Hlp_IsItem(item,ItMiNugget))
		{
			PrintDebugNpc( PD_ZS_DETAIL, "...'item' ist Erz -> JA!");
			return TRUE;
		}
		else
		{
			PrintDebugInt(PD_ZS_DETAIL, "...itemvalue:", itemvalue);
			PrintDebugInt(PD_ZS_DETAIL, "...levelbewertung:", levelbewertung);
			if ((itemvalue>levelbewertung))
			{
				PrintDebugNpc( PD_ZS_DETAIL, "...'item' ist wertvoll genug um interessant zu sein -> JA!");
				return TRUE;
			}
			else
			{
				PrintDebugNpc( PD_ZS_DETAIL, "...'item' ist zu billig -> NEIN!");
				return FALSE;
			};
		};		
	}
	else
	{
		PrintDebugNpc( PD_ZS_DETAIL, "...'item' ist ungьltig -> NEIN!");
		return FALSE;
	};
};