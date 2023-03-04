// **********************************************
// Standard	Voice Module
// **********************************************

// Diese Klasse	kann beliebig von den Skriptern	erweitert um
// "VAR	STRING xxxx" erweitert werden, diese können	dann in	den
// einzelnen SVM - Instanzen initialisiert werden.


CLASS C_SVM
{
// SC hat Waffe oder Magie gezogen oder zielt auf NSC
	VAR	STRING	StopMagic;					// NSC  sieht wie in seiner Nähe gezaubert wird -> er fordert auf, damit aufzuhören!
	VAR	STRING	ISaidStopMagic;				// NSC hat bereits mit $StopMagic gewarnt und greift nun an	(nachdem er	diesen Satz	gesagt hat;	WICHTIG: dies ist KEINE	letzte Warnung,	sonder sofort Angriff!)

	var string	WeaponDown				;	//ZS_AssessFighter: SC steht mit gezogener Waffe vor NSC -> NSC ist NEUTRAL zu SC	-> (herausfordernd,	bei	Pünten-Stimme etwas	unsicher, trotzdem kernig)
	var string	ISaidWeaponDown			;	//Kommt nachdem der SC $WeaponDown ignoriert hat!

	VAR	STRING	WatchYourAim;				// ein FRIENDLY-SC zielt mit einer Fernkampfwaffe auf den NSC .	'Paß auf! Ziel woanders	hin!' B_Orc_AssessThreat hat das auch noch
	var string	WatchYourAimAngry		;	// SC zielt mit einer Fernkampfwaffe auf den Angry-NSC. (genervte Auffordern, damit	aufzuhören)
	VAR	STRING	WhatAreYouDoing;			// NSC wird von einem FRIENDLY-SC/NSC geschlagen

// SC hat Waffe weggesteckt, NSC beendet Kampf
	VAR	STRING	LetsForgetOurLittleFight;	//Friede, kann direkt kommen ( Wenn freundliche kämpfen und der Spieler die Waffe wegsteckt) oder als Reaction über das news-Gedächtnis, sollte daher Zeitneutral sein (--> nicht wie jetzt lass uns den Streit von letztens vergessen

// NSC hat Gegner aus den Augen verloren
	VAR	STRING	Strange			;			// 1. NSC wird attackiert -> rennt mit gezogener Waffe zum Angreifer ->	kann ihn plötzlich nicht mehr entdecken	-> (muttering to himself)
											// 2. NSC sieht	einen Mord -> rennt	mit	gezogener Waffe	zum	Mörder -> kann ihn plötzlich nicht mehr	entdecken

// NSC greift an!
	var string	DieMonster				;	// NSC greift Monster an -> "Aus dir mach ich Gulasch, Drecksvieh!"
	var string	DieMOrtalEnemy;				// Der Nsc greift an, da er durch die Story permanent Hostile ist, d.h. die Lager sind in Blutfehde

	VAR	STRING	NowWait;					// NSC hat den SC früher noch NICHT besiegt -> SC greift den NSC an -> "Na warte!"
	VAR	STRING	YouStillNotHaveEnough	;	// NSC hat den SC früher besiegt ->	SC greift den NSC an -> "Hast du immer noch nicht genug?!"

	var	string	YouAskedForIt			;	// 1. SC hat eine Aufforderung ignoriert: den Raum zu verlassen, ein Item zurückzugeben, seine Waffe wegzustecken -> "Wer nicht hören will muß fühlen..."
	var string	NowWaitIntruder			;	// SC hat einen bewachten Durchgang durchbrochen...

	var	string	IWillTeachYouRespectForForeignProperty;	// 1. SC benutzt ein Besitz-Mob(Tür,Fallgitter-Drehkreuz,Kiste,...) und	wird ohne Vorwarnung attackiert
											// 2. SC trägt Waffe des NSCs -> NSC ist stärker und holt sie sich mit Gewalt wieder ->	vorher dieser Spruch

	VAR	STRING	DirtyThief;					// 1. NSC ertappt den (schwächeren)	SC mit den Fingern in den eigenen Taschen
											// 2. NSC sieht	wie	der	(schwächere) SC	etwas nimmt, daß ihm gehört	(z.B. Waffe	auf	den	Tisch)
											// 3. NSC sieht	feindlichen, schwächeren SC, der ihn vorher	mal	beklaut	hat	und	sagt ihm diesen	Spruch,	bevor er angreift "Da hab ich Dich also	wieder,	Du dreckiger Dieb"
											// 4. Nsc ist in einen Raum eingedrungen

	var string	YouAttackedMyCharge		;	// SC/NSC greift einen Schützling einer NSC-Wache an -> Wache attackiert den Angreifer danach
	var string	YouKilledOneOfUs;			// NSC erblickt feindlichen SC, der einen Freund des NSCs getötet hat -> Angriff!

// im Kampf
	VAR	STRING	Dead			;			// Tödlich verletzt
	VAR	STRING	Aargh_1			;			// Treffer kassiert im Kampf	
	VAR	STRING	Aargh_2			;			// Treffer kassiert im Kampf	
	VAR	STRING	Aargh_3			;			// Treffer kassiert im Kampf	

	var string	Berzerk			;			// Wahnsinnsschrei im Zustand der Raserei!

// SC hat NSC niedergeschlagen oder bedroht
	VAR	STRING	YoullBeSorryForThis;		// NSC wurde durch SC/aNSC besiegt und wacht aus der Ohnmacht wieder auf: 'Das wird	Dir	noch leidtun!'

	VAR	STRING	YesYes			;			// 1. NSC wurde	im Kampf besiegt ->	erwacht	wieder ist aber	schächer als sein Kontrahent
											// 2. SC zieht Waffe oder nähert sich mit Waffe und NSC ist schwächer als SC
// NSC flieht
	var string	ShitWhatAMonster		;	// NSC flieht vor zu starkem Monster -> "Scheiße, was ein Höllenvieh. Nichts wie weg!"
	VAR	STRING	Help;						// NSC flieht vor Gegner, Babe Nsc flieht vor Spieler, Orcs haben das auch
	var	STRING	WeWillMeetAgain;			// NSC flieht vor Gegner, ist aber eigentlich Stärker als er, ist aber trotzdem besiegt worden

// SC wurde von NSC besiegt und wird geplündert
	VAR	STRING	NeverTryThatAgain	;		// NSC hat Gegner besiegt -> ("Versuch das NIE wieder!!")
	var string	ITakeYourWeapon;			// NSC plündert bewußtlosen SC/aNSC. Während er sich bückt, um nach der vom Besiegten fallengelassenen Waffe zu greifen sagt er diesen Spruch.
	VAR	STRING	ITookYourOre	;			// NSC plündert bewußtlosen SC/aNSC. Nachdem er sich einen Teil des Erzes genommen hat, sagt er diesen Spruch.
	var string	ShitNoOre		;			// NSC ärgert sich darüber, daß er beim Durchsuchen eines bewußtlosen/toten Körpers kein Erz gefunden hat!

// NSC verwarnt SC
	VAR	STRING	HandsOff;					// SC manipuliert ein MOB (Drehkreuz, Truhe, Tür) und ein befreundeter bzw. gildengleicher NSC sieht das...
	VAR	STRING	GetOutOfHere		;		// NSC erwischt	schwächeren	SC in seiner Hütte -> ("Raus hier")	(SC	soll aus Raum gehen)
	var	string	YouViolatedForbiddenTerritory		;	// SC wird beim Betreten eines verbotenen Portalraums erwischt -> Warnung!

	var	STRING	YouWannaFoolMe;				// SC schnappt NSC ein Item vor der Nase weg und wird mit $GiveItToMe aufgefordert es zurückzugeben -> SC gibt ein falsches Item an den NSC -> 'Willst Du mich verarschen'

	VAR	STRING	WhatsThisSupposedToBe	;	// 1. SC schleicht vor den Augen des NSCs -> "Was schleichst Du	hier rum?" (besser als "Was	soll das denn werden", weil	besseres Feedback!)
											// 2. SC bewegt	sich hinter	einer Wache	-> diese dreht sich	um und sagt	dann
	var string	WhyAreYouInHere			;	//im ZS_ClearRoom / SC steht in verbotenem Portalraum	-> schwächerer NSC fragt
	var string	WhatDidYouInThere		;	// Wache sieht Sc aus einer Hütte rauskommen und verwarnt ihn, ohne das ein Angriff folgt

	VAR	STRING	WiseMove;					// 1. NSC wurde	gewarnt, seine Waffe wegzustecken ($RemoveYourWeapon) -> SC	befolgt	dies und steckt	die	Waffe weg
											// 2. SC steht in verbotenem Raum und wird mit $GetOutOfHere aufgefordert, rauszugehen -> SC befolgt die Aufforderung
											// 3. SC hat NSC ein Item vor der Nase weggeschnappt und wurde mit $GiveItToMe aufgefordert	es zurückzugeben ->	SC gehorcht

// NSC alarmiert/warnt andere NSCs vor SC
	VAR	STRING	Alarm;						// Wache alarmiert die Sichtung	eines permanent	HOSTILE	SC/aNSC	"Alaaaaaaarm!!!!!"
											// Nicht Wache sieht wie ein Portalraum betreten wird, der einer Gilde zugeordnet ist und ruft die Wachen
											// Gemüse (NpcWorker) ruft Wachen nach einem Diebstahl/beobachteten Diebstahl etc.
	var string	IntruderAlert;				// SC hat einen bewachten Durchgang durchbrochen und die Wache alarmiert alle umstehenden
	VAR	STRING	BehindYou;					// NSC sieht, wie ein anderer NSC vom SC bestohlen wird	und	warnt das Opfer

// NSC beobachtet Kampf
	var	string	TheresAFight	;			// NSC entdeckt	einen Kampf	und	will zuschauen (ZS_WatchFight) -> vorher ein Spruch	wie	"Hey da	drüben gibt's einen	Kampf"
	VAR	STRING	HeyHeyHey;					// Hintergrund anfeuern	beim Beobachten	eines Kampfes: 'Hau	ihm	aufs Maul!'	(kommt alle	paar Sekunden!)
	VAR	STRING	CheerFight;					// NSC ist im Zustand WatchFight: Neutraler	Kämpfer	schlägt irgendeinen Typen. '5 Erz auf den Dicken'
	VAR	STRING	CheerFriend;				// NSC ist im Zustand WatchFight: Freund landet	einen Treffer. 'Immer in die Fresse!'
	VAR	STRING	Ooh;						// NSC ist im Zustand WatchFight: Freund kriegt	aufs Maul. 'Mist - das tat weh.'
	var	STRING	YeahWellDone;				// NSC sieht, wie SC/aNSC, zu dem er ANGRY/HOSTILE ist getötet wird. 'Gut gemacht, das hat sie Sau verdient.'

// NSC-Gegner flieht
	VAR	STRING	RunCoward;					// 1. Der NSC befindet sich	im Zustand WatchFight -> einer der Kämpfer haut	ab
											// 2. Der Gegner des NSCs flieht
	var	string	HeDefeatedHim	;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC besiegt 	(WICHTIG: dies ist der normale Ausgang!)
	var	string	HeDeservedIt	;			// NSC sieht wie ein SC/aNSC, zu dem er	ANGRY/HOSTILE steht, besiegt wird -> ("DAS hat er verdient!")
	var	string	HeKilledHim		;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC tötet	(WICHTIG: dies ist ein Skandal, niemand wird normalerweise	in einer "Schlägerei" getötet)
	var	string	ItWasAGoodFight	;			// NSC sieht wie ein FRIENDLY/NEUTRAL-SC/aNSC einen	anderen	besiegt

	VAR	STRING	Awake			;			// NSC wacht aus dem Zustand Sleep wieder auf (Aufwachen, räkeln)

// Grüße
	VAR	STRING	FriendlyGreetings;			// 1. Am Anfang	eines Dialoges, wenn NSC FRIENDLY/NEUTRAL zum SC,  2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	ALGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC aus Altem Lager und FRIENDLY/NEUTRAL ('Für Gomez'), 2. Wenn sie sich unterwegs begegnen.
	var	STRING	MageGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC beide Magier und FRIENDLY/NEUTRAL, 2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	SectGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC aus Psi-Camp und FRIENDLY/NEUTRAL	zum	SC ('Erwache. Der Schläfer erwache.') 2. Wenn sie sich unterwegs begegnen.

	var string	ThereHeIs;					// NSC zeigt SC wo ein anderer NSC steht nach dem der SC gefragt hat: "Da drüben ist er"

// Lehrer-Kommentare
	var string	NoLearnNoPoints			;	// NSC-Lehrer verbietet Steigerung - keine Lernpunkte!
	var string	NoLearnOverMax			;	// NSC-Lehrer verbietet Attribut-Steigerung über 100
	var string	NoLearnYouAlreadyKnow	;	// Du mußt erst Fortgeschritten sein, bevor du ein Meister werden kannst!
	var string	NoLearnYoureBetter		;	// Du bist jetzt schon besser!

// NSC spricht SC an
	VAR	STRING	HeyYou;						// z.B. Wache, die den SC im Räumen erwischt, wo er nicht hin darf sagt HeyYou, und geht dann zum SC

// NSC will nicht reden
	VAR	STRING	NotNow;						// NSC / Babe wird vom SC angesprochen,	lehnt aber ein Gespräch	ab.

// SC zu nah
	VAR	STRING	WhatDoYouWant;				// SC rückt NSC zu dicht auf die Pelle -> "Kann ich was für Dich tun?"
	VAR	STRING	ISaidWhatDoYouWant;			// NSC hat $WhatDoYouWant gesagt, aber der SC hat nicht reagiert -> "Was willst Du?"
// SC im Weg
	VAR	STRING	MakeWay;					// SC steht	schwächerem NSC im Weg	-> Aufforderung, Platz zu	machen
	VAR	STRING	OutOfMyWay;					// SC steht stärkerem NSC (Magier, Erzbaron) im Weg -> aggressive Aufforderung, Platz zu machen
	VAR	STRING	YouDeafOrWhat;				// SC folgt	nicht der Aufforderung des stärkeren NSCs	-> letzte Warnung, danach Angriff

// SC spricht NSC an, der ihn besiegt hat
	VAR	STRING	LookingForTroubleAgain;		//Erster Satz eines Dialoges, nachdem der NSC und der SC gekämpft haben (entweder wurde der SC besiegt oder es gab keinen klaren Ausgang des Kampfes)

// NSC ist schwächer...
	var string	LookAway;					// Eingeschüchterter NSC guckt weg bei bedrohlichen Situationen
	VAR	STRING	OkayKeepIt;					// SC trägt	Waffe des schächeren NSCs -> NSCs verlangt die Waffe zurück	($GiveItToMe) -> SC	bedroht	NSC	-> ("Okay, okay, du	kannst das Ding	behalten..." zurückweichen)
	VAR	STRING	WhatsThat;					// Verwandelter SC wird vor den Augen des NSCs wieder zum Menschen (Erschreckter Ausruf) Nsc wird aus dem MagicSleep wieder wach und wundert sich...

	VAR	STRING	ThatsMyWeapon;				// SC trägt	eine Waffe,	die	dem	NSC	gehört -> Folge: ZS_GetBackBelongings
	VAR	STRING	GiveItToMe;					// 1. SC trägt Waffe des NSCs -> NSC ist schwächer (also kein Kampf) ->	"Gib sie mir wieder"
	VAR	STRING	YouCanKeeptheCrap;			// 1. SC trägt Waffe des schwächeren NSCs ->	NSCs verlangt die Waffe	zurück ($GiveItToMe) ->	SC geht	einfach	weg	-> ("Behalt	das	Scheiß-Ding	doch!)
											// 2. NSC will ein Item	aufheben und wird von einem	stärkeren NSC gewarnt, der das auch	tun	will ->	unser NSC weicht zurück

	VAR	STRING	TheyKilledMyFriend;			// NSC Täter - NSC zu Opfer freundlich, zu Täter freundlich oder neutral

	var	string	YouDisturbedMySlumber;		// NSC wurde vom SC	mittelsanft	aus	dem	Schlaf gerissen	(z.B. durch	Ansprechen)

// Angry NSCs kommentieren SC-Aktionen
	VAR	STRING	SuckerGotSome;				// Angry NSC hat gehört, daß der SC umgehauen wurde. "Das Dich jemand umgehauen hat, geschieht Dir Recht!"

	VAR	STRING	SuckerDefeatedEBr;			// Du hast einen	EBR	besiegt. Er war wirklich beeindruckt!
	VAR	STRING	SuckerDefeatedGur;			// Du hast einen	GUR	niedergeschlagen,	Du bist	ein	toter Mann
	VAR	STRING	SuckerDefeatedMage;			// (News) - im Stil von SuckerDefeatedXY

	var string	SuckerDefeatedNOV_Guard;	// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist ANGRY zu Spieler
	var string	SuckerDefeatedVLK_Guard;	// Der Spieler hat einen Schützling der Wache niedergeschlagen
	var string	YouDefeatedMyComrade;		// Wache stellt fest, das sie gesehen/gehört hat, daß ich eine andere Wache umgehauen habe
	var string	YouDefeatedNOV_Guard;		// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist NEUTRAL/FRIENDLY zu Spieler
	var string	YouDefeatedVLK_Guard;		// Der Spieler hat einen Buddler umgehauen, Wache spricht den Spieler an, Wache ist NEUTRAL/FRIENDLY zu Spieler
	VAR	STRING	YouStoleFromMe;				// Du Sau hast mich beklaut

//Wichtige Person (Lehrer, Auftraggeber?), hat davon gehört, daß Du Mist gebaut hat...
// FIXME: damit das so benutzt werden kann müssen noch Anpassungen in der B_ReactToMemory.d gemacht werden
	VAR	STRING	YouStoleFromUs;				// eigene oder befreundete Gilde beklaut.
	VAR	STRING	YouStoleFromEBr;			// Erzbarone beklaut.
	VAR	STRING	YouStoleFromGur;			// Gurus beklaut.
	VAR	STRING	StoleFromMage;				// Magier beklaut.

	VAR	STRING	YouKilledMyFriend;			// jemand aus eigener oder befreundeter Gilde getötet
	var	STRING	YouKilledEBr;				// Erzbaron getötet
	VAR	STRING	YouKilledGur;				// Guru getötet
	VAR	STRING	YouKilledMage;				// Guru getötet

	VAR	STRING	YouKilledOCfolk;			// Gardist, Schatten oder Buddler getötet.
	VAR	STRING	YouKilledNCfolk;			// Söldner, Organisator, Schürfer oder Bauer getötet
	VAR	STRING	YouKilledPSIfolk;			// Templer oder Novize getötet

	VAR	STRING	GetThingsRight;				//SC hat Mist gebaut. NSC sagt, "Das wieder hinzubiegen wird nicht einfach!"

	VAR	STRING	YouDefeatedMeWell;			//Zu SC	freundlich/neutral:	Du hast	mich ganz schön	geplättet

// Ambient-Unterhaltungen zwischen zwei NSCs (gemurmelte Wortfetzen, die zufällig zu "Dialogen" zusammengewürfelt werden...
	VAR	STRING	Smalltalk01;				// ...wenn Du meinst...
	VAR	STRING	Smalltalk02;				// ...kann schon sein...
	VAR	STRING	Smalltalk03;				// ...war nicht besonders schlau....
	VAR	STRING	Smalltalk04;				// ...ich halt mich da lieber raus...
	VAR	STRING	Smalltalk05;				// ...das ist wirklich nicht mein Problem...
	VAR	STRING	Smalltalk06;				// ...war doch klar, daß das Ärger gibt...
	VAR	STRING	Smalltalk07;				// ...aber behalt's für Dich, muß nicht gleich jeder wissen...
	VAR	STRING	Smalltalk08;				// ...das passiert mir nicht nochmal...
	VAR	STRING	Smalltalk09;				// ...an der Gechichte muß wohl doch was dran sein...
	VAR	STRING	Smalltalk10;				// ...man muß eben aufpassen was man rumerzählt...
	VAR	STRING	Smalltalk11;				// ...solange ich damit nichts zu tun habe...
	VAR	STRING	Smalltalk12;				// ...man darf auch nicht alles glauben, was man hört...
	VAR	STRING	Smalltalk13;				// ...in seiner Haut will ich trotzdem nicht stecken...
	VAR	STRING	Smalltalk14;				// ...immer wieder die selbe Leier...
	VAR	STRING	Smalltalk15;				// ...manche lernen eben garnichts dazu...
	VAR	STRING	Smalltalk16;				// ...früher wäre das ganz anders gelaufen...
	VAR	STRING	Smalltalk17;				// ...gequatscht wird viel...
	VAR	STRING	Smalltalk18;				// ...ich hör nicht mehr auf das Gefasel...
	VAR	STRING	Smalltalk19;				// ...verlaß Dich auf jemanden und Du bist verlassen, das ist eben so...
	VAR	STRING	Smalltalk20;				// ...ich glaube kaum, daß sich daran was ändern wird...
	VAR	STRING	Smalltalk21;				// ...wahrscheinlich hast Du recht...
	VAR	STRING	Smalltalk22;				// ...erstmal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird...
	VAR	STRING	Smalltalk23;				// ...ich dachte, das wäre schon lange geklärt, aber das ist wohl nicht so...
	VAR	STRING	Smalltalk24;				// ...laß uns lieber über was anderes reden...
	VAR	STRING	Om;							// Ommm (Meditation)

// SC Dialog
	var string	SC_HeyTurnAround;			//SC: Hey du! (Nsc ansprechen, steht mit Rücken zu dir)                                   
	var string	SC_HeyWaitASecond;			//SC: Warte mal! (Nsc im vorgeigehen anhalten)                                            
	var string DoesntWork;				
	var string PickBroke;				
	var string NeedKey;					
	var string NoMorePicks;				
	var string InvFull;					

};


instance SVM_0 (C_SVM)				// wird nur intern gebraucht...
{

};


// ********************************
// 		Die SVM-Instanzen		(ToDo: News noch überarbeiten wie in Prototypen)
// ********************************

// Die einzelnen Instanzen der SVMs
// Diese müssen	immer "SVM_x" heissen, wobei x die VoiceNummer ist.

instance SVM_1 (C_SVM)	//Malocher (Volk, Schürfer)	Nörgler, Alkoholiker, schimpft über	alles - zieht Kraft aus seinem Hass

{
	StopMagic					=	"SVM_1_StopMagic"					;//Arrête cette sorcellerie !
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Veux-tu te battre ? Arrête ça !!!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Range cette arme !
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Éloigne cette arme !!
	WatchYourAim				=	"SVM_1_WatchYourAim"				;//Abaisse ta garde !!
	WatchYourAimAngry			=	"SVM_1_WatchYourAimAngry"			;//Si tu veux des ennuies, vise-moi juste encore une fois !
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Attention ! essaye encore et je te tranche la gorge.
	LetsForgetOurLittleFight	=	"SVM_1_LetsForgetOurLittleFight"	;//Oublions ce petit argument, d'accord ?
	Strange						=	"SVM_1_Strange"						;//Va t'en, sale mécréant !
	DieMonster					=	"SVM_1_DieMonster"					;//Maudit fils de chienne !
	DieMortalEnemy				=	"SVM_1_DieMortalEnemy"				;//Maintenant tu es fais !
	NowWait						=	"SVM_1_NowWait"						;//Maintenant tu vas payer...
	YouStillNotHaveEnough		=	"SVM_1_YouStillNotHaveEnough"		;//Il semble que tu vas souffrir !
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//C'est toi qui l'a cherché !
	NowWaitIntruder				= 	"SVM_1_NowWaitIntruder"				;//Maintenant je vais être sûr qu'ils vont te mettre en pièces.
	IWillTeachYouRespectForForeignProperty	=	"SVM_1_IWillTeachYouRespectForForeignProperty"	;//Je t'avais averti de rester loin de mes affaires !
	DirtyThief					=	"SVM_1_DirtyThief"					;//JE vais t'avoir, sale voleur !
	YouAttackedMyCharge			=	"SVM_1_YouAttackedMyCharge"			;//Personne ne se moque de mes hommes !
	YouKilledOneOfUs			=	"SVM_1_YouKilledOneOfUs"			;//Tu as mit KO un de nous. Je vais TE mettre KO !
	Dead						=	"SVM_1_Dead"						;//Aaaaaargl!
	Aargh_1						=	"SVM_1_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_1_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_1_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_1_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_1_YoullBeSorryForThis"			;//Tu le regretteras !
	YesYes						=	"SVM_1_YesYes"						;//Ne panique pas ! Tu as gagné !
	ShitWhatAMonster			=	"SVM_1_ShitWhatAMonster"			;//Merde ! Cours aussi vite que possible !
	Help						=	"SVM_1_Help"						;//Malédiction !
	WeWillMeetAgain				=	"SVM_1_WeWillMeetAgain"				;//Nous nous retrouverons !
	NeverTryThatAgain			=	"SVM_1_NeverTryThatAgain"			;//Essaye encore et tu le regretteras.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Belle arme ! Donne la moi !
	ITookYourOre				=	"SVM_1_ITookYourOre"				;//Merci pour le minerai, héro !
	ShitNoOre					=	"SVM_1_ShitNoOre"					;//Pauvre débris, tu n'a même pas de minerai sur toi !
	HandsOff					=	"SVM_1_HandsOff"					;//Hé, bas les pattes !
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Fais toi une balafre !
	YouViolatedForbiddenTerritory=	"SVM_1_YouViolatedForbiddenTerritory";//Hé ! Comment es-tu arrivé ici ?
	YouWannaFoolMe				=	"SVM_1_YouWannaFoolMe"				;//Tu me prends pour un demeuré ?
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Hé, toi ! Qu'est-ce que tu fouines par là ?
	WhyAreYouInHere				=	"SVM_1_WhyYouAreInHere"				;//Sort de ma cabane ou j'appelle les gardes !
	WhatDidYouInThere			=	"SVM_1_WhatDidYouInThere"			;//Tu n'as rien à faire ici ! Dégage !
	WiseMove					=	"SVM_1_WiseMove"					;//Sage garçon !
	Alarm						=	"SVM_1_Alarm"						;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_1_IntruderAlert"				;//ALERTE !!! INTRUS !!!
	BehindYou					=	"SVM_1_BehindYou"					;//Derrière toi !
	TheresAFight				=	"SVM_1_TheresAFight"				;//Ah, un combat !
	HeyHeyHey					=	"SVM_1_HeyHeyHey"					;//Plus fort !
	CheerFight					=	"SVM_1_CheerFight"					;//Tu combats comme une femme !
	CheerFriend					=	"SVM_1_CheerFriend"					;//Fini le !!
	Ooh							=	"SVM_1_Ooh"							;//Riposte !
	YeahWellDone				=	"SVM_1_YeahWellDone"				;//Montre-lui !
	RunCoward					=	"SVM_1_RunCoward"					;//Revient, mon grand !
	HeDefeatedHim				=	"SVM_1_HeDefeatedHim"				;//Il en a eu assez !
	HeDeservedIt				=	"SVM_1_HeDeservedIt"				;//Fait-lui voir !
	HeKilledHim					=	"SVM_1_HeKilledHim"					;//Pourquoi tu l'as tué ? Toi aussi tu le mérites !
	ItWasAGoodFight				=	"SVM_1_ItWasAGoodFight"				;//Beau combat !
	Awake						=	"SVM_1_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_1_FriendlyGreetings"			;//Bonjour
	ALGreetings					=	"SVM_1_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_1_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_1_SectGreetings"				;//Éveille-toi !
	ThereHeIs					= 	"SVM_1_ThereHeIs"					;//Il est là.
	NoLearnNoPoints				= 	"SVM_1_NoLearnNoPoints"				;//Revient dés que tu as plus d'expérience.
	NoLearnOverMax				= 	"SVM_1_NoLearnOverMax"				;//Tu es à la limite de tes possibilités. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_1_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un spécialiste avant de devenir un maître !
	NoLearnYoureBetter			=	"SVM_1_NoLearnYoureBetter"			;//Tu es déjà meilleur maintenant !
	HeyYou						=	"SVM_1_HeyYou"						;//Hé, toi !
	NotNow						=	"SVM_1_NotNow"						;//Pas maintenant !
	WhatDoYouWant				=	"SVM_1_WhatDoYouWant"				;//Qu'est-ce que tu veux ?
	ISaidWhatDoYouWant			=	"SVM_1_ISaidWhatDoYouWant"			;//Je peux faire quelque chose pour toi ?!
	MakeWay						=	"SVM_1_MakeWay"						;//Laisse-moi passer !
	OutOfMyWay					=	"SVM_1_OutOfMyWay"					;//Hors de mon chemin, mon gars !
	YouDeafOrWhat				=	"SVM_1_YouDeafOrWhat"				;//Es-tu sourd ? BOUGE TOI !!
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//De nouveau à la recherche d'ennuies ?
	LookAway					=	"SVM_1_LookAway"					;//Uhhhhh ! Je n'ai rien vu !
	OkayKeepIt					=	"SVM_1_OkayKeepIt"					;//D'accord, d'accord ! Garde-le !
	WhatsThat					=	"SVM_1_WhatsThat"					;//Qu'est-ce que c'était ?
	ThatsMyWeapon				=	"SVM_1_ThatsMyWeapon"				;//Tu cours alentour avec MON arme !
	GiveItToMe					=	"SVM_1_GiveItToMe"					;//Donne moi ça !
	YouCanKeeptheCrap			=	"SVM_1_YouCanKeeptheCrap"			;//Alors garde-la ! Je n'en ai pas besoin de toute façon !
	TheyKilledMyFriend			=	"SVM_1_TheyKilledMyFriend"			;//Ils ont eu un de nos hommes. Si j'attrape ce pourceau...
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//Enfer, pourquoi me réveilles-tu ?
	SuckerGotSome				=	"SVM_1_SuckerGotSome"				;//Qu'est ce que tu fais ? Sers toi en bien !
	SuckerDefeatedEBr			=	"SVM_1_SuckerDefeatedEBr"			;//Tu as frappé le Baron du minerai ! Tu l'a rendu fou !
	SuckerDefeatedGur			=	"SVM_1_SuckerDefeatedGur"			;//Tu as frappé un Sage. Il semble que tu attires les problèmes comme un aimant !
	SuckerDefeatedMage			=	"SVM_1_SuckerDefeatedMage"			;//Être victorieux contre un magicien est vraiment une idée idiote !
	SuckerDefeatedNov_Guard		= 	"SVM_1_SuckerDefeatedNov_Guard"		;//Tu ne peux pas juste te balader et taper les novices !
	SuckerDefeatedVlk_Guard		= 	"SVM_1_SuckerDefeatedVlk_Guard"		;//Laisse mes hommes tranquille !
	YouDefeatedMyComrade		=	"SVM_1_YouDefeatedMyComrade"		;//Tu as frappé mon ami...
	YouDefeatedNOV_Guard		=	"SVM_1_YouDefeatedNOV_Guard"		;//Ce que tu fais ne peut être toléré ici !
	YouDefeatedVLK_Guard		=	"SVM_1_YouDefeatedVLK_Guard"		;//Si tu frappes quelqu'un sous ma protection tu en subiras les conséquences !
	YouStoleFromMe				=	"SVM_1_YouStoleFromMe"				;//Tu m'as volé, ordure ! Ne recommence plus !
	YouStoleFromUs				=	"SVM_1_YouStoleFromUs"				;//Nous voulons nos affaires ! Rend les nous !
	YouStoleFromEBr				=	"SVM_1_YouStoleFromEBr"				;//Tu as volé le Baron du minerai ! Pourquoi diable as-tu fais ça ?
	YouStoleFromGur				=	"SVM_1_YouStoleFromGur"				;//Tu as volé les Sages ? Quelle idiotie qu'il t'ont prit sur le faite.
	StoleFromMage				=	"SVM_1_StoleFromMage"				;//Tu as volé les magiciens ! Quelle idée vraiment stupide !
	YouKilledMyFriend			=	"SVM_1_YouKilledMyFriend"			;//Un de nous est mort et tu as a voir quelque chose la dedans ! Fait la moindre erreur et tu es fais !
	YouKilledEBr				=	"SVM_1_YouKilledEBr"				;//Tu as tué le Baron du Minerai ! Mécréant, es-tu complètement fou !?
	YouKilledGur				=	"SVM_1_YouKilledGur"				;//Tu as tué un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_1_YouKilledMage"				;//Tu as tué un magicien ! Comment imagines-tu expliquer ça ?
	YouKilledOCfolk				=	"SVM_1_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom fut prononcé en rapport avec cet acte...
	YouKilledNCfolk				=	"SVM_1_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il apparaît que tu es impliqué !
	YouKilledPSIfolk			=	"SVM_1_YouKilledPSIfolk"			;//La Confrérie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_1_GetThingsRight"				;//ça ne fut pas facile de sortir de là !
	YouDefeatedMeWell			=	"SVM_1_YouDefeatedMeWell"			;//Ce fut un combat équitable ! Tu m'a vraiment flanqué une raclée !
	Smalltalk01					=	"SVM_1_Smalltalk01"					;// ... la pire merde ...
	Smalltalk02					=	"SVM_1_Smalltalk02"					;// ... peut-être, mais qui s'en soucie ? ...
	Smalltalk03					=	"SVM_1_Smalltalk03"					;// ... totalement idiot ...
	Smalltalk04					=	"SVM_1_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_1_Smalltalk05"					;// ... ce n'est vraiment pas mon problème ...
	Smalltalk06					=	"SVM_1_Smalltalk06"					;// ... c'était évident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_1_Smalltalk07"					;// ... pourquoi cela arrive t'il encore et encore ? ...
	Smalltalk08					=	"SVM_1_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_1_Smalltalk09"					;// ... il doit y avoir quelque chose derrière cette histoire après tout ...
	Smalltalk10					=	"SVM_1_Smalltalk10"					;// ... ne parle pas tant, ouais, ouais, ouais ...
	Smalltalk11					=	"SVM_1_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqué ...
	Smalltalk12					=	"SVM_1_Smalltalk12"					;// ... tu ne devrais pas croire n'importe quoi ...
	Smalltalk13					=	"SVM_1_Smalltalk13"					;// ... je n'aimerais pas être dans ses bottes ...
	Smalltalk14					=	"SVM_1_Smalltalk14"					;// ... toujours la vieille même histoire ...
	Smalltalk15					=	"SVM_1_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_1_Smalltalk16"					;// ... il fut un temps où les choses se seraient passées autrement ...
	Smalltalk17					=	"SVM_1_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_1_Smalltalk18"					;// ... je n'écoute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_1_Smalltalk19"					;// ... tu cherches la bagarre et tu la trouves, c'est logique ...
	Smalltalk20					=	"SVM_1_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_1_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_1_Smalltalk22"					;// ... Attends. Il vaut mieux ne pas se précipiter ...
	Smalltalk23					=	"SVM_1_Smalltalk23"					;// ... je pensais que c'était de l'histoire ancienne ...
	Smalltalk24					=	"SVM_1_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_1_Om"							;//Ommm
};


//SVM_2	// Misstrauisch (Volk, Bauern, Novizen, MILTEN) Misstrauisch. Defensiv. Angst in was reingezogen zu werden. Klug. Nov: Glauben durch Einschüchterung

instance SVM_2 (C_SVM)				// Misstrauisch
{
	StopMagic					=	"SVM_2_StopMagic"					;//Pas de sorcellerie !
	ISaidStopMagic				=	"SVM_2_ISaidStopMagic"				;//HÉ ! J'ai dit pas de magie !
	WeaponDown					=	"SVM_2_WeaponDown"					;//Dis donc, range ce truc !
	ISaidWeaponDown				=	"SVM_2_ISaidWeaponDown"				;//Rengaine cette arme !
	WatchYourAim				=	"SVM_2_WatchYourAim"				;//Regarde ce que tu vises !
	WatchYourAimAngry			=	"SVM_2_WatchYourAimAngry"			;//Si tu continues à me viser, je vais le prendre personnellement !
	WhatAreYouDoing				=	"SVM_2_WhatAreYouDoing"				;//Hé, c'est pour quoi faire ??
	LetsForgetOurLittleFight	=	"SVM_2_LetsForgetOurLittleFight"	;//Oublions ça, d'accord ?
	Strange						=	"SVM_2_Strange"						;//Étrange ! Où est-il parti ?!
	DieMonster					=	"SVM_2_DieMonster"					;//Un autre !
	DieMortalEnemy				=	"SVM_2_DieMortalEnemy"				;//J'ai bien peur de devoir t'éliminer !
	NowWait						=	"SVM_2_NowWait"						;//C'est ta propre faute !
	YouStillNotHaveEnough		=	"SVM_2_YouStillNotHaveEnough"		;//Tu n'en as pas eu assez ?
	YouAskedForIt				=	"SVM_2_YouAskedForIt"				;//Si c'est ce que tu veux vraiment !
	NowWaitIntruder				= 	"SVM_2_NowWaitIntruder"				;//Tu sais que tu n'as rien à faire ici !
	IWillTeachYouRespectForForeignProperty	=	"SVM_2_IWillTeachYouRespectForForeignProperty"	;//Pourquoi joue-tu avec les choses qui ne sont pas les tiennes ?!
	DirtyThief					=	"SVM_2_DirtyThief"					;//Tu m'as volé ! Je ne l'oublierai pas !
	YouAttackedMyCharge			=	"SVM_2_YouAttackedMyCharge"			;//Personne n'attaque mes hommes !
	YouKilledOneOfUs			=	"SVM_2_YouKilledOneOfUs"			;//Tu as tué l'un d'eux ! Tu dois payer pour cela !
	Dead						=	"SVM_2_Dead"						;//Aaargl
	Aargh_1						=	"SVM_2_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_2_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_2_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_2_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_2_YoullBeSorryForThis"			;//Tu le regretteras !
	YesYes						=	"SVM_2_YesYes"						;//Doucement, doucement, tu as gagné !
	ShitWhatAMonster			=	"SVM_2_ShitWhatAMonster"			;//Je - ehm - juste un peu d'aide !
	Help						=	"SVM_2_Help"						;//Je n'ai pas le temps, j'ai des choses à faire !
	WeWillMeetAgain				=	"SVM_2_WeWillMeetAgain"				;//Je suis sûr que nous nous rencontrerons de nouveau !
	NeverTryThatAgain			=	"SVM_2_NeverTryThatAgain"			;//N'essaye pas de nouveau !
	ITakeYourWeapon				=	"SVM_2_ITakeYourWeapon"				;//Je prendrai cette arme !
	ITookYourOre				=	"SVM_2_ITookYourOre"				;//Tu n'as pas besoin de tout ce minerai de toute façon !
	ShitNoOre					=	"SVM_2_ShitNoOre"					;//Tu n'as pas de minerai ? Ce n'est pas ton jour de chance aujourd'hui !
	HandsOff					=	"SVM_2_HandsOff"					;//Lâche ça !
	GetOutOfHere				=	"SVM_2_GetOutOfHere"				;//Sorte d'ici !
	YouViolatedForbiddenTerritory=	"SVM_2_YouViolatedForbiddenTerritory";//Hé ! Comment es-tu arrivé ici ?
	YouWannaFoolMe				=	"SVM_2_YouWannaFoolMe"				;//Ce n'est pas très intelligent de me prendre pour un imbécile !
	WhatsThisSupposedToBe		=	"SVM_2_WhatsThisSupposedToBe"		;//Pourquoi fouines-tu par ici ?
	WhyAreYouInHere				=	"SVM_2_WhyYouAreInHere"				;//Sort de ma cabane ou j'appelle les gardes !
	WhatDidYouInThere			=	"SVM_2_WhatDidYouInThere"			;//Sort de ces cabanes !
	WiseMove					=	"SVM_2_WiseMove"					;//Bonne décision !
	Alarm						=	"SVM_2_Alarm"						;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_2_IntruderAlert"				;//ALERTE !!
	BehindYou					=	"SVM_2_BehindYou"					;//Derrière toi !
	TheresAFight				=	"SVM_2_TheresAFight"				;//Ah, un combat !
	HeyHeyHey					=	"SVM_2_HeyHeyHey"					;//Est-ce tout !
	CheerFight					=	"SVM_2_CheerFight"					;//Réveille-toi, lambin !
	CheerFriend					=	"SVM_2_CheerFriend"					;//Bon Coup !
	Ooh							=	"SVM_2_Ooh"							;//ça doit faire mal !
	YeahWellDone				=	"SVM_2_YeahWellDone"				;//Il bouge toujours .
	RunCoward					=	"SVM_2_RunCoward"					;//Reste ici !
	HeDefeatedHim				=	"SVM_2_HeDefeatedHim"				;//Il en a eu assez !
	HeDeservedIt				=	"SVM_2_HeDeservedIt"				;//Il l'a mérité !
	HeKilledHim					=	"SVM_2_HeKilledHim"					;//Tu l'as tué ! C'était nécessaire ?
	ItWasAGoodFight				=	"SVM_2_ItWasAGoodFight"				;//C'était un bon combat, juste trop court !
	Awake						=	"SVM_2_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_2_FriendlyGreetings"			;//Bonjour.
	ALGreetings					=	"SVM_2_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_2_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_2_SectGreetings"				;//Éveille-toi !
	ThereHeIs					= 	"SVM_2_ThereHeIs"					;//Par ici.
	NoLearnNoPoints				= 	"SVM_2_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'expérience.
	NoLearnOverMax				= 	"SVM_2_NoLearnOverMax"				;//Tu es à la limite de tes possibilités. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_2_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un spécialiste avant de devenir un maître !
	NoLearnYoureBetter			=	"SVM_2_NoLearnYoureBetter"			;//Tu es déjà meilleur maintenant !
	HeyYou						=	"SVM_2_HeyYou"						;//Hé, toi !
	NotNow						=	"SVM_2_NotNow"						;//Pas maintenant.
	WhatDoYouWant				=	"SVM_2_WhatDoYouWant"				;//Qu'est-ce que tu veux ?
	ISaidWhatDoYouWant			=	"SVM_2_ISaidWhatDoYouWant"			;//Puis-je faire quelque chose pour toi ?
	MakeWay						=	"SVM_2_MakeWay"						;//Laisse-moi passer !
	OutOfMyWay					=	"SVM_2_OutOfMyWay"					;//Hors de mon chemin !
	YouDeafOrWhat				=	"SVM_2_YouDeafOrWhat"				;//Fait toi rare ou je t'écrase !
	LookingForTroubleAgain		=	"SVM_2_LookingForTroubleAgain"		;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_2_LookAway"					;//Je n'ai RIEN vu ! AUCUN problème !
	OkayKeepIt					=	"SVM_2_OkayKeepIt"					;//D'accord ! C'est à toi !
	WhatsThat					=	"SVM_2_WhatsThat"					;//Hé ? Que ?
	ThatsMyWeapon				=	"SVM_2_ThatsMyWeapon"				;//Cela ressemble à mon arme ce que tu portes !
	GiveItToMe					=	"SVM_2_GiveItToMe"					;//Aller, donne-la-moi !
	YouCanKeeptheCrap			=	"SVM_2_YouCanKeeptheCrap"			;//Je n'en aurai pas besoin de toute façon !
	TheyKilledMyFriend			=	"SVM_2_TheyKilledMyFriend"			;//Quelqu'un a tué l'un de nous.Si nous l'attrapons il es fait !
	YouDisturbedMySlumber		=	"SVM_2_YouDisturbedMySlumber"		;//Pourquoi m'as-tu réveillé ?
	SuckerGotSome				=	"SVM_2_SuckerGotSome"				;//Tu as été battu ! Je dois l'admettre, j'aime ça !
	SuckerDefeatedEBr			=	"SVM_2_SuckerDefeatedEBr"			;//Tu as battu le Baron du minerai !
	SuckerDefeatedGur			=	"SVM_2_SuckerDefeatedGur"			;//Battre un Sage ! Je ne sais pas si c'est courageux ou fou !
	SuckerDefeatedMage			=	"SVM_2_SuckerDefeatedMage"			;//Gagner contre un magicien... Tu dois être brave !
	SuckerDefeatedNov_Guard		= 	"SVM_2_SuckerDefeatedNov_Guard"		;//Je m'assure qu'il y a de l'ordre ici !
	SuckerDefeatedVlk_Guard		= 	"SVM_2_SuckerDefeatedVlk_Guard"		;//Dans tous les cas ! Si tu frappes un mineur, tu auras des ennuis !
	YouDefeatedMyComrade		=	"SVM_2_YouDefeatedMyComrade"		;//Tu as frappé un de mes amis !
	YouDefeatedNOV_Guard		=	"SVM_2_YouDefeatedNOV_Guard"		;//Laisse les novices tranquilles !
	YouDefeatedVLK_Guard		=	"SVM_2_YouDefeatedVLK_Guard"		;//Ne pas taper mes hommes ! Compris ?
	YouStoleFromMe				=	"SVM_2_YouStoleFromMe"				;//Pourquoi m'as-tu volé ?
	YouStoleFromUs				=	"SVM_2_YouStoleFromUs"				;//Tu as pris quelque chose qui nous appartient. Nous voudrions le reprendre !
	YouStoleFromEBr				=	"SVM_2_YouStoleFromEBr"				;//Mec ! Tu as volé le Baron du minerai ! Ils seront fou de rage !
	YouStoleFromGur				=	"SVM_2_YouStoleFromGur"				;//Tu as volé les Sages ! Tu as de la chance de pas t'être fait attraper !
	StoleFromMage				=	"SVM_2_StoleFromMage"				;//Les magiciens n'aiment pas les gens qui fouinent autour de leurs affaires !
	YouKilledMyFriend			=	"SVM_2_YouKilledMyFriend"			;//Tu as un de nos hommes sur la conscience. Une autre petite erreur et c'est ton tour !
	YouKilledEBr				=	"SVM_2_YouKilledEBr"				;//Tu as tué le Baron du Minerai ! Mécréant, es-tu complètement fou !?
	YouKilledGur				=	"SVM_2_YouKilledGur"				;//Tu as tué un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_2_YouKilledMage"				;//Tu as tué un magicien ! Comment imagines-tu expliquer ça ?
	YouKilledOCfolk				=	"SVM_2_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom a été mentionné en rapport à cette affaire...
	YouKilledNCfolk				=	"SVM_2_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il apparaît que tu es impliqué !
	YouKilledPSIfolk			=	"SVM_2_YouKilledPSIfolk"			;//La Confrérie compte un croyant de moins, et tu l'as sur la conscience !
	GetThingsRight				=	"SVM_2_GetThingsRight"				;//Sais-tu a quel point c'est difficile ?!
	YouDefeatedMeWell			=	"SVM_2_YouDefeatedMeWell"			;//D'accord, tu m'as battu. C'était un beau combat ! Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_2_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_2_Smalltalk02"					;// ... peut-être ...
	Smalltalk03					=	"SVM_2_Smalltalk03"					;// ... ce n'était pas très malin ...
	Smalltalk04					=	"SVM_2_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_2_Smalltalk05"					;// ... ce n'est vraiment pas mon problème ...
	Smalltalk06					=	"SVM_2_Smalltalk06"					;// ... c'était évident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_2_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_2_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_2_Smalltalk09"					;// ... il doit y avoir quelque chose derrière cette histoire après tout ...
	Smalltalk10					=	"SVM_2_Smalltalk10"					;// ... tu dois faire attention à ce que tu dis ...
	Smalltalk11					=	"SVM_2_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqué ...
	Smalltalk12					=	"SVM_2_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_2_Smalltalk13"					;// ... je n'aimerais pas être dans ses bottes ...
	Smalltalk14					=	"SVM_2_Smalltalk14"					;// ... toujours la vieille même histoire ...
	Smalltalk15					=	"SVM_2_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_2_Smalltalk16"					;// ... il fut un temps où les choses se seraient passées autrement ...
	Smalltalk17					=	"SVM_2_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_2_Smalltalk18"					;// ... je n'écoute plus toutes ces rumeurs ...
	Smalltalk19					=	"SVM_2_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_2_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_2_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_2_Smalltalk22"					;// ... attends. Il ne faut pas se précipiter ...
	Smalltalk23					=	"SVM_2_Smalltalk23"					;// ... je pensais que c'était de l'histoire ancienne ...
	Smalltalk24					=	"SVM_2_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_2_Om"							;// Ommm
};




instance SVM_3 (C_SVM)				 // Depressiv (Resigniert. Menschliches Gemüse. "Ich schau noch´n bisschen an die Decke.." , "Wir sind eh alle verloren..." Nov:Glauben an Drogen
{
	StopMagic					=	"SVM_3_StopMagic"					;//Arrête cette magie !
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"				;//Arrête cette magie maintenant.
	WeaponDown					=	"SVM_3_WeaponDown"					;//Range cette arme !
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"				;//Je vais me mettre de mauvaise humeur si tu continue à te balader avec cette arme !!
	WatchYourAim				=	"SVM_3_WatchYourAim"				;//Pourquoi me vises-tu ?
	WatchYourAimAngry			=	"SVM_3_WatchYourAimAngry"			;//Put the weapon down or I will get ugly!
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"				;//Hééééé ! C'est pour quoi faire ??
	LetsForgetOurLittleFight	=	"SVM_3_LetsForgetOurLittleFight"	;//Bon d'accord, considérons cet argument comme un malentendu.
	Strange						=	"SVM_3_Strange"						;//Il est parti, il a disparu ?!
	DieMonster					=	"SVM_3_DieMonster"					;//Sale chien. Tu ne me dérangera pas plus longtemps !
	DieMortalEnemy				=	"SVM_3_DieMortalEnemy"				;//tu va bientôt rejoindre les vers de terre !
	NowWait						=	"SVM_3_NowWait"						;//Il semble que je dois devenir plus clair !
	YouStillNotHaveEnough		=	"SVM_3_YouStillNotHaveEnough"		;//Apparemment tu n'en as pas eu assez !
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Tu l'a cherché !
	NowWaitIntruder				= 	"SVM_3_NowWaitIntruder"				;//Tu n'as rien a faire ici ! Maintenant je dois te corriger !
	IWillTeachYouRespectForForeignProperty	=	"SVM_3_IWillTeachYouRespectForForeignProperty"	;//Supposons que je dois te couper les doigts, c'est apparemment le seul langage que tu comprends !
	DirtyThief					=	"SVM_3_DirtyThief"					;//Tu m'as volé ! J'y crois pas !
	YouAttackedMyCharge			=	"SVM_3_YouAttackedMyCharge"			;//Tu ne peux pas taper tous les gens que tu croises, ici !
	YouKilledOneOfUs			=	"SVM_3_YouKilledOneOfUs"			;//Tu as tué un des nôtres ! C'est ta dernière erreur !
	Dead						=	"SVM_3_Dead"						;//Aaargl
	Aargh_1						=	"SVM_3_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_3_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_3_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_3_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_3_YoullBeSorryForThis"			;//Tu le regretteras !
	YesYes						=	"SVM_3_YesYes"						;//Tu as gagné ! D'accord !
	ShitWhatAMonster			=	"SVM_3_ShitWhatAMonster"			;//Merde ! Cours aussi vite que possible !
	Help						=	"SVM_3_Help"						;//Je dois y aller !
	WeWillMeetAgain				=	"SVM_3_WeWillMeetAgain"				;//Nous nous retrouverons !
	NeverTryThatAgain			=	"SVM_3_NeverTryThatAgain"			;//Ne refais plus jamais ça !
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"				;//Merci pour l'arme !
	ITookYourOre				=	"SVM_3_ITookYourOre"				;//Je vais juste te prendre ton minerai !
	ShitNoOre					=	"SVM_3_ShitNoOre"					;//Pas de minerai ? C'est triste, mec, très triste !
	HandsOff					=	"SVM_3_HandsOff"					;//Lâche ça !
	GetOutOfHere				=	"SVM_3_GetOutOfHere"				;//Dégage !
	YouViolatedForbiddenTerritory=	"SVM_3_YouViolatedForbiddenTerritory";//Hé ! D'où sors-tu ?
	YouWannaFoolMe				=	"SVM_3_YouWannaFoolMe"				;//Je ne suis pas aussi stupide que tu le crois !
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"		;//Arrête de fouiner par ici !
	WhyAreYouInHere				=	"SVM_3_WhyYouAreInHere"				;//Sort de ma cabane ou j'appelle les gardes !
	WhatDidYouInThere			=	"SVM_3_WhatDidYouInThere"			;//Que fais-tu ? Si je t'attrape, tu es fait !
	WiseMove					=	"SVM_3_WiseMove"					;//Bien, tu sais ce qui est bon pour toi !
	Alarm						=	"SVM_3_Alarm"						;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_3_IntruderAlert"				;//ALERTE !!
	BehindYou					=	"SVM_3_BehindYou"					;//Attention !
	TheresAFight				=	"SVM_3_TheresAFight"				;//Un combat !
	HeyHeyHey					=	"SVM_3_HeyHeyHey"					;//Tape-le !
	CheerFight					=	"SVM_3_CheerFight"					;//Qu'essayes-tu de faire ?
	CheerFriend					=	"SVM_3_CheerFriend"					;//Bon Coup !
	Ooh							=	"SVM_3_Ooh"							;//Ooooh !
	YeahWellDone				=	"SVM_3_YeahWellDone"				;//Oui ! Bien joué !
	RunCoward					=	"SVM_3_RunCoward"					;//Il s'échappe !
	HeDefeatedHim				=	"SVM_3_HeDefeatedHim"				;//Il s'est échappé !
	HeDeservedIt				=	"SVM_3_HeDeservedIt"				;//C'est ce que tu as mérité !
	HeKilledHim					=	"SVM_3_HeKilledHim"					;//Il ne bouge plus. Tu l'a tué.
	ItWasAGoodFight				=	"SVM_3_ItWasAGoodFight"				;//Rien d'autre que se battre ...
	Awake						=	"SVM_3_Awake"						;//Un nouveau jour et rien n'a changé ...
	FriendlyGreetings			=	"SVM_3_FriendlyGreetings"			;//Hé, mec.
	ALGreetings					=	"SVM_3_ALGreetings"					;//Pour Gomez, ouais, ouais.
	MageGreetings				=	"SVM_3_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_3_SectGreetings"				;//Éveille-toi !
	ThereHeIs					= 	"SVM_3_ThereHeIs"					;//Il est là.
	NoLearnNoPoints				= 	"SVM_3_NoLearnNoPoints"				;//Tu n'as pas assez d'expérience. Je ne peux pas t'enseigner ça !
	NoLearnOverMax				= 	"SVM_3_NoLearnOverMax"				;//Tu es à la limite de tes possibilités. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_3_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un spécialiste avant de devenir un maître !
	NoLearnYoureBetter			=	"SVM_3_NoLearnYoureBetter"			;//Tu es déjà meilleur maintenant !
	HeyYou						=	"SVM_3_HeyYou"						;//Hé, toi !
	NotNow						=	"SVM_3_NotNow"						;//Pas maintenant !
	WhatDoYouWant				=	"SVM_3_WhatDoYouWant"				;//Tu veux quelque chose ?
	ISaidWhatDoYouWant			=	"SVM_3_ISaidWhatDoYouWant"			;//Puis-je faire quelque chose pour toi ?
	MakeWay						=	"SVM_3_MakeWay"						;//Laisse-moi passer !
	OutOfMyWay					=	"SVM_3_OutOfMyWay"					;//Hors de mon chemin, mon gars !
	YouDeafOrWhat				=	"SVM_3_YouDeafOrWhat"				;//Combien de fois ? Laisse-moi passer !
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"		;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_3_LookAway"					;//Je n'ai RIEN vu ! Je ne suis même pas là !
	OkayKeepIt					=	"SVM_3_OkayKeepIt"					;//D'accord, d'accord, garde-la !
	WhatsThat					=	"SVM_3_WhatsThat"					;//Qu'est-ce que c'était ?
	ThatsMyWeapon				=	"SVM_3_ThatsMyWeapon"				;//Tu as mon arme !
	GiveItToMe					=	"SVM_3_GiveItToMe"					;//Rend-la moi !
	YouCanKeeptheCrap			=	"SVM_3_YouCanKeeptheCrap"			;//Quoique tu dises ! Je n'en ai plus besoin.
	TheyKilledMyFriend			=	"SVM_3_TheyKilledMyFriend"			;//Ils ont tué un des nôtres. Personne ne sortira vivant d'ici...
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"		;//Pourquoi m'as-tu tiré de mes rêves ?
	SuckerGotSome				=	"SVM_3_SuckerGotSome"				;//Tire des leçons de tes défaites !
	SuckerDefeatedEBr			=	"SVM_3_SuckerDefeatedEBr"			;//Tu as vaincu le Baron du minerai ! Tu es dans la merde !
	SuckerDefeatedGur			=	"SVM_3_SuckerDefeatedGur"			;//Tu as tué un des Sages. Ils en tiendront compte contre toi !
	SuckerDefeatedMage			=	"SVM_3_SuckerDefeatedMage"			;//Vaincre un magicien signifie de gros ennuies !
	SuckerDefeatedNov_Guard		= 	"SVM_3_SuckerDefeatedNov_Guard"		;//La prochaine fois tu laissera les novices tranquilles !
	SuckerDefeatedVlk_Guard		= 	"SVM_3_SuckerDefeatedVlk_Guard"		;//Si tu frappes un mineur, je devrais faire la même chose avec toi !
	YouDefeatedMyComrade		=	"SVM_3_YouDefeatedMyComrade"		;//Tu as tapé un de mes amis !
	YouDefeatedNOV_Guard		=	"SVM_3_YouDefeatedNOV_Guard"		;//Les novices sont sous ma protection ! Laisse-les tranquilles !
	YouDefeatedVLK_Guard		=	"SVM_3_YouDefeatedVLK_Guard"		;//Les mineurs me payent pour ne pas avoir d'ennuies ! Je ferais en sorte que ça reste comme ça !
	YouStoleFromMe				=	"SVM_3_YouStoleFromMe"				;//Tu m'as volé, sale brigand !
	YouStoleFromUs				=	"SVM_3_YouStoleFromUs"				;//Tu nous as pris des choses. Tu ferais mieux de les rendre.
	YouStoleFromEBr				=	"SVM_3_YouStoleFromEBr"				;//Mec ! Tu as volé le Baron du minerai ! Ils seront fou de rage !
	YouStoleFromGur				=	"SVM_3_YouStoleFromGur"				;//Tu as volé les Sages ! C'est idiot qu'ils t'ont attrapé.
	StoleFromMage				=	"SVM_3_StoleFromMage"				;//Tu dois être plus rapide pour voler un magicien !
	YouKilledMyFriend			=	"SVM_3_YouKilledMyFriend"			;//Tu as un de nos hommes sur la conscience. Une petite erreur de plus et c'est ton tour !
	YouKilledEBr				=	"SVM_3_YouKilledEBr"				;//Tu as tué le Baron du Minerai ! Mécréant, es-tu complètement fou !?
	YouKilledGur				=	"SVM_3_YouKilledGur"				;//Tu as tué un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_3_YouKilledMage"				;//Tu as tué un magicien ! Comment expliques-tu ça ?
	YouKilledOCfolk				=	"SVM_3_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom a été mentionné en rapport à cette affaire ...
	YouKilledNCfolk				=	"SVM_3_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il apparaît que tu es impliqué !
	YouKilledPSIfolk			=	"SVM_3_YouKilledPSIfolk"			;//La Confrérie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_3_GetThingsRight"				;//ça ne fut pas facile de sortir de là !
	YouDefeatedMeWell			=	"SVM_3_YouDefeatedMeWell"			;//Ce fut un bon combat ! Ce n'est pas grave si tu m'as battu !
	Smalltalk01					=	"SVM_3_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_3_Smalltalk02"					;// ... peut-être ...
	Smalltalk03					=	"SVM_3_Smalltalk03"					;// ... ce n'était pas très malin ...
	Smalltalk04					=	"SVM_3_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_3_Smalltalk05"					;// ... ce n'est vraiment pas mon problème ...
	Smalltalk06					=	"SVM_3_Smalltalk06"					;// ... c'était évident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_3_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_3_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_3_Smalltalk09"					;// ... il doit y avoir quelque chose derrière cette histoire après tout ...
	Smalltalk10					=	"SVM_3_Smalltalk10"					;// ... tu dois faire attention à ce que tu dis ...
	Smalltalk11					=	"SVM_3_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqué ...
	Smalltalk12					=	"SVM_3_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_3_Smalltalk13"					;// ... je n'aimerais pas être dans ses bottes ...
	Smalltalk14					=	"SVM_3_Smalltalk14"					;// ... toujours la vieille même histoire ...
	Smalltalk15					=	"SVM_3_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_3_Smalltalk16"					;// ... il fut un temps où les choses se seraient passées autrement ...
	Smalltalk17					=	"SVM_3_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_3_Smalltalk18"					;// ... je n'écoute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_3_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_3_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_3_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_3_Smalltalk22"					;// ... Attends. Il vaut mieux ne pas se précipiter ...
	Smalltalk23					=	"SVM_3_Smalltalk23"					;// ... je pensais que c'était de l'histoire ancienne ...
	Smalltalk24					=	"SVM_3_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_3_Om"							;// Ommm
};


instance SVM_4 (C_SVM)				// Alter Sack,  (Torrez, KDF-Magier, alte Buddler....), alter Hase. Kann Grünschnäbeln noch was zeigen
{
	StopMagic					=	"SVM_4_StopMagic"					;//Arrête cette magie !
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"				;//Tu ferais mieux de suivre mes conseils et d'arrêter cette magie !
	WeaponDown					=	"SVM_4_WeaponDown"					;//Range ton arme si tu ne veux pas d'ennuies !
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"				;//Maintenant range cette arme !
	WatchYourAim				=	"SVM_4_WatchYourAim"				;//Tu devrais faire attention où tu pointes cette arme !
	WatchYourAimAngry			=	"SVM_4_WatchYourAimAngry"			;//Si tu n'arrête pas je vais te prendre ton jouet !
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"				;//Hé là-bas! Je te surveille !
	LetsForgetOurLittleFight	=	"SVM_4_LetsForgetOurLittleFight"	;//Oublions notre querelle !
	Strange						=	"SVM_4_Strange"						;//Sort de là ! Montre-toi !
	DieMonster					=	"SVM_4_DieMonster"					;//La quantité que tu tue n'est pas importante, ils arrivent !
	DieMortalEnemy				=	"SVM_4_DieMortalEnemy"				;//Tu ne vivras pas plus vieux !
	NowWait						=	"SVM_4_NowWait"						;//Je vais t'apprendre à m'ennuyer ...
	YouStillNotHaveEnough		=	"SVM_4_YouStillNotHaveEnough"		;//Tu n'en as pas eu assez ?
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Tu l'as cherché !
	NowWaitIntruder				= 	"SVM_4_NowWaitIntruder"				;//C'est vraiment stupide de ta part d'être venu ici !!
	IWillTeachYouRespectForForeignProperty	=	"SVM_4_IWillTeachYouRespectForForeignProperty"	;//Tu ne peux rester impunie !
	DirtyThief					=	"SVM_4_DirtyThief"					;//Tu as osé me voler !
	YouAttackedMyCharge			=	"SVM_4_YouAttackedMyCharge"			;//Nous chercher des noises ne va rien t'apporter de bon.
	YouKilledOneOfUs			=	"SVM_4_YouKilledOneOfUs"			;//Tu as tué un des notres ! Oeil pour oeil !
	Dead						=	"SVM_4_Dead"						;//Aaargl
	Aargh_1						=	"SVM_4_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_4_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_4_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_4_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_4_YoullBeSorryForThis"			;//Tu vas le regretter !
	YesYes						=	"SVM_4_YesYes"						;//Du calme, tu as gagné !
	ShitWhatAMonster			=	"SVM_4_ShitWhatAMonster"			;//Partons d'ici rapidement !
	Help						=	"SVM_4_Help"						;//Je deviens trop vieux pour ça !
	WeWillMeetAgain				=	"SVM_4_WeWillMeetAgain"				;//Je n'oublierais pas ça !
	NeverTryThatAgain			=	"SVM_4_NeverTryThatAgain"			;//Ne recommence plus ça !
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"				;//Je ferais mieux de prendre cette arme avec moi !
	ITookYourOre				=	"SVM_4_ITookYourOre"				;//Je prendrai plus soins de ton minerai que toi !
	ShitNoOre					=	"SVM_4_ShitNoOre"					;//Même pas la moindre petite pépite de minerai.
	HandsOff					=	"SVM_4_HandsOff"					;//Lâche ça !
	GetOutOfHere				=	"SVM_4_GetOutOfHere"				;//Fais toi une balafre !
	YouViolatedForbiddenTerritory=	"SVM_4_YouViolatedForbiddenTerritory";//Tu n'as rien à faire ici !
	YouWannaFoolMe				=	"SVM_4_YouWannaFoolMe"				;//Je ne suis pas d'humeur à ces plaisanteries !
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"		;//Hé, toi ! Qu'est-ce que tu fouines ?
	WhyAreYouInHere				=	"SVM_4_WhyYouAreInHere"				;//Sort de là ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_4_WhatDidYouInThere"			;//Qu'est ce que tu faisais ici ?
	WiseMove					=	"SVM_4_WiseMove"					;//Tu as eu de la chance.
	Alarm						=	"SVM_4_Alarm"						;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_4_IntruderAlert"				;//UN INTRU !!!
	BehindYou					=	"SVM_4_BehindYou"					;//Derrière toi !
	TheresAFight				=	"SVM_4_TheresAFight"				;//Encore un autre combat.
	HeyHeyHey					=	"SVM_4_HeyHeyHey"					;//Plus fort !
	CheerFight					=	"SVM_4_CheerFight"					;//C'est tout ce que tu peux faire ?!
	CheerFriend					=	"SVM_4_CheerFriend"					;//Montre-lui !
	Ooh							=	"SVM_4_Ooh"							;//Contre attaque !
	YeahWellDone				=	"SVM_4_YeahWellDone"				;//Bien joué !
	RunCoward					=	"SVM_4_RunCoward"					;//Ce lâche s'enfuit !
	HeDefeatedHim				=	"SVM_4_HeDefeatedHim"				;//Quand j'étais jeune, les gens étaient costauds !
	HeDeservedIt				=	"SVM_4_HeDeservedIt"				;//C'est notre propre faute !
	HeKilledHim					=	"SVM_4_HeKilledHim"					;//Tu l'as tué ! Grossière erreur !
	ItWasAGoodFight				=	"SVM_4_ItWasAGoodFight"				;//A l'époque, les combats étaient meilleurs.
	Awake						=	"SVM_4_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_4_FriendlyGreetings"			;//Salutations.
	ALGreetings					=	"SVM_4_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_4_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_4_SectGreetings"				;//Éveille-toi !
	ThereHeIs					= 	"SVM_4_ThereHeIs"					;//Tu le trouveras par là !
	NoLearnNoPoints				= 	"SVM_4_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'expérience.
	NoLearnOverMax				= 	"SVM_4_NoLearnOverMax"				;//Tu es à la limite de tes possibilités. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_4_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un spécialiste avant de devenir un maître !
	NoLearnYoureBetter			=	"SVM_4_NoLearnYoureBetter"			;//Tu vaut mieux que ça !
	HeyYou						=	"SVM_4_HeyYou"						;//Hé toi !
	NotNow						=	"SVM_4_NotNow"						;//Pas maintenant.
	WhatDoYouWant				=	"SVM_4_WhatDoYouWant"				;//Qu'est-ce que tu veux ?
	ISaidWhatDoYouWant			=	"SVM_4_ISaidWhatDoYouWant"			;//Tu veux quelque chose ?
	MakeWay						=	"SVM_4_MakeWay"						;//Laisse moi passer.
	OutOfMyWay					=	"SVM_4_OutOfMyWay"					;//Hors de mon chemin !
	YouDeafOrWhat				=	"SVM_4_YouDeafOrWhat"				;//Hors de mon chemin ou tu vas le regretter !
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"		;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_4_LookAway"					;//Ne pas voir le démon, ne pas entendre le démon, ne pas parler au démon ...
	OkayKeepIt					=	"SVM_4_OkayKeepIt"					;//Garde-la !
	WhatsThat					=	"SVM_4_WhatsThat"					;//Qu'est-ce que c'était ?
	ThatsMyWeapon				=	"SVM_4_ThatsMyWeapon"				;//Sois gentil et rend moi mon arme !
	GiveItToMe					=	"SVM_4_GiveItToMe"					;//Aller, donne-la-moi !
	YouCanKeeptheCrap			=	"SVM_4_YouCanKeeptheCrap"			;//Bon ! Je suis content de m'en être débarrassée !
	TheyKilledMyFriend			=	"SVM_4_TheyKilledMyFriend"			;//Si je trouve celui qui a tué un des notres ...
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"		;//Tu déranges mon repos !
	SuckerGotSome				=	"SVM_4_SuckerGotSome"				;//Tu es battu ! Tu ferais mieux de voir ailleurs si tu y es !
	SuckerDefeatedEBr			=	"SVM_4_SuckerDefeatedEBr"			;//Tu as battu le Baron du minerai !
	SuckerDefeatedGur			=	"SVM_4_SuckerDefeatedGur"			;//Tu as vaincu un des Sages. Je suis impressionné. Mais ne recommence plus jamais ça.
	SuckerDefeatedMage			=	"SVM_4_SuckerDefeatedMage"			;//Gagner contre un magicien... Tu dois être brave !
	SuckerDefeatedNov_Guard		= 	"SVM_4_SuckerDefeatedNov_Guard"		;//Tu dois être malade d'avoir frappé un novice comme ça.
	SuckerDefeatedVlk_Guard		= 	"SVM_4_SuckerDefeatedVlk_Guard"		;//Que crois-tu faire, taper un mineur ?
	YouDefeatedMyComrade		=	"SVM_4_YouDefeatedMyComrade"		;//Tu t'es embrouillé avec un de mes amis ! C'est risqué !
	YouDefeatedNOV_Guard		=	"SVM_4_YouDefeatedNOV_Guard"		;//Pose encore tes mains sur un novice et tu le regrettera !
	YouDefeatedVLK_Guard		=	"SVM_4_YouDefeatedVLK_Guard"		;//Tu es trop brave, touché à un protégé peut être très dangereux pour toi.
	YouStoleFromMe				=	"SVM_4_YouStoleFromMe"				;//Laisse mes affaires tranquilles, compris ?
	YouStoleFromUs				=	"SVM_4_YouStoleFromUs"				;//Tu as pris quelque chose à nous. Rend le nous !
	YouStoleFromEBr				=	"SVM_4_YouStoleFromEBr"				;//Mec ! Tu as volé le Baron du minerai ! Ils seront fou de rage !
	YouStoleFromGur				=	"SVM_4_YouStoleFromGur"				;//Tu as volé les Sages ! Au moins tu ne t'es pas fait attrapé !
	StoleFromMage				=	"SVM_4_StoleFromMage"				;//Les magiciens n'aiment pas les gens qui fouinent autour de leurs affaires !
	YouKilledMyFriend			=	"SVM_4_YouKilledMyFriend"			;//Tu as un de nos hommes sur la conscience. Une petite erreur de plus et c'est ton tour !
	YouKilledEBr				=	"SVM_4_YouKilledEBr"				;//Tu as tué le Baron du Minerai ! Mécréant, es-tu complètement fou !?
	YouKilledGur				=	"SVM_4_YouKilledGur"				;//Tu as tué un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_4_YouKilledMage"				;//Tu as tué un magicien ! Comment imagines-tu expliquer ça ?
	YouKilledOCfolk				=	"SVM_4_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom a été mentionné en rapport à cette affaire ...
	YouKilledNCfolk				=	"SVM_4_YouKilledNCfolk"				;//Il y a une autre cabane de libre dans le Nouveau Camp, et il semble que tu es impliqué !
	YouKilledPSIfolk			=	"SVM_4_YouKilledPSIfolk"			;//La Confrérie compte un croyant de moins, et tu l'as sur la conscience !
	GetThingsRight				=	"SVM_4_GetThingsRight"				;//ça ne fut pas facile de sortir de là !
	YouDefeatedMeWell			=	"SVM_4_YouDefeatedMeWell"			;//Tu m'as donné du fil à retordre. Ce fut un bon combat. Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_4_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_4_Smalltalk02"					;// ... peut-être ...
	Smalltalk03					=	"SVM_4_Smalltalk03"					;// ... ce n'était pas très malin ...
	Smalltalk04					=	"SVM_4_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_4_Smalltalk05"					;// ... ce n'est vraiment pas mon problème ...
	Smalltalk06					=	"SVM_4_Smalltalk06"					;// ... c'était évident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_4_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_4_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_4_Smalltalk09"					;// ... il doit y avoir quelque chose derrière cette histoire après tout ...
	Smalltalk10					=	"SVM_4_Smalltalk10"					;// ... tu dois faire attention à ce que tu dis ...
	Smalltalk11					=	"SVM_4_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqué ...
	Smalltalk12					=	"SVM_4_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_4_Smalltalk13"					;// ... je n'aimerais pas être dans ses bottes ...
	Smalltalk14					=	"SVM_4_Smalltalk14"					;// ... toujours la vieille même histoire ...
	Smalltalk15					=	"SVM_4_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_4_Smalltalk16"					;// ... il fut un temps où les choses se seraient passées autrement ...
	Smalltalk17					=	"SVM_4_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_4_Smalltalk18"					;// ... je n'écoute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_4_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_4_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_4_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_4_Smalltalk22"					;// ... attends. Il ne faut pas se précipiter ...
	Smalltalk23					=	"SVM_4_Smalltalk23"					;// ... je pensais que c'était de l'histoire ancienne ...
	Smalltalk24					=	"SVM_4_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_4_Om"							;//Ommm
};


instance SVM_5 (C_SVM)				//Lebenskünstler, offen, Fröhlich. humorvoller Verarscher. Auch: Fauler Verpisser. Selbstbewußt, wortgewandt, charismatisch. (Lester)
{
	StopMagic					=	"SVM_5_StopMagic"					;//Tu ferais mieux arrêter cette magie !
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Quand je dis 'arrête cette magie', tu le fais !
	WeaponDown					=	"SVM_5_WeaponDown"					;//Que veux-tu faire avec cette arme, mec !
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Dis donc, range ce truc !
	WatchYourAim				=	"SVM_5_WatchYourAim"				;//Tu me vises, espèce de crapule !
	WatchYourAimAngry			=	"SVM_5_WatchYourAimAngry"			;//Si tu arrête pas ça, je m'exercerai sur toi !
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//Hé, t'es aveugle ou quoi ?
	LetsForgetOurLittleFight	=	"SVM_5_LetsForgetOurLittleFight"	;//Oublions ce petit argument, d'accord ?
	Strange						=	"SVM_5_Strange"						;//Mais il était là il y a un instant !? Étrange !
	DieMonster					=	"SVM_5_DieMonster"					;//C'est ton tour maintenant, salopard !
	DieMortalEnemy				=	"SVM_5_DieMortalEnemy"				;//C'est jour de paye !
	NowWait						=	"SVM_5_NowWait"						;//Tu as demandé une raclée urgente !
	YouStillNotHaveEnough		=	"SVM_5_YouStillNotHaveEnough"		;//Tu n'en as pas eu assez ?
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//D'accord, tu l'as cherché !
	NowWaitIntruder				= 	"SVM_5_NowWaitIntruder"				;//Ils vont te jeter dehors !
	IWillTeachYouRespectForForeignProperty	=	"SVM_5_IWillTeachYouRespectForForeignProperty"	;//Je t'ai prévenu. Si tu touches à mes affaires, tu vas avoir des ennuis !
	DirtyThief					=	"SVM_5_DirtyThief"					;//Voleur ! Je vais t'apprendre les bonnes manières !
	YouAttackedMyCharge			=	"SVM_5_YouAttackedMyCharge"			;//Personne ne frappe mes hommes sans être désolé après !
	YouKilledOneOfUs			=	"SVM_5_YouKilledOneOfUs"			;//Tu as tué un de mes hommes. Maintenant je vais TE tuer !
	Dead						=	"SVM_5_Dead"					;//Aaargl
	Aargh_1						=	"SVM_5_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_5_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_5_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_5_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_5_YoullBeSorryForThis"			;//Tu le regretteras !
	YesYes						=	"SVM_5_YesYes"						;//Tranquille ! Tu as gagné.
	ShitWhatAMonster			=	"SVM_5_ShitWhatAMonster"			;//Il est trop fort pour moi !
	Help						=	"SVM_5_Help"						;//Malédiction !
	WeWillMeetAgain				=	"SVM_5_WeWillMeetAgain"				;//La prochaine fois, ce sera différent !
	NeverTryThatAgain			=	"SVM_5_NeverTryThatAgain"			;//N'essaye pas de nouveau !
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//J'aime cette arme !
	ITookYourOre				=	"SVM_5_ITookYourOre"				;//Je ferais en sorte que ton minerai soit bien investi !
	ShitNoOre					=	"SVM_5_ShitNoOre"					;//Pas de chance ! Pas de minerai !
	HandsOff					=	"SVM_5_HandsOff"					;//Lâche ça !
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Sorte d'ici !
	YouViolatedForbiddenTerritory=	"SVM_5_YouViolatedForbiddenTerritory";//Hé ! D'où sors-tu ?
	YouWannaFoolMe				=	"SVM_5_YouWannaFoolMe"				;//Bonne blague !
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Qu'est-ce que tu fouines ?
	WhyAreYouInHere				=	"SVM_5_WhyYouAreInHere"				;//Hors d'ici ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_5_WhatDidYouInThere"			;//Tu n'as rien a faire ici !
	WiseMove					=	"SVM_5_WiseMove"					;//Tu apprends vite !
	Alarm						=	"SVM_5_Alarm"						;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_5_IntruderAlert"				;//ALERTE !!!!
	BehindYou					=	"SVM_5_BehindYou"					;//Hé, Là !
	TheresAFight				=	"SVM_5_TheresAFight"				;//Un combat !
	HeyHeyHey					=	"SVM_5_HeyHeyHey"					;//Frappez-le !
	CheerFight					=	"SVM_5_CheerFight"					;//Bien !
	CheerFriend					=	"SVM_5_CheerFriend"					;//Frappez-le encore maintenant !
	Ooh							=	"SVM_5_Ooh"							;//Attention !
	YeahWellDone				=	"SVM_5_YeahWellDone"				;//C'était juste !
	RunCoward					=	"SVM_5_RunCoward"					;//Ce gars se faufile !
	HeDefeatedHim				=	"SVM_5_HeDefeatedHim"				;//Bon gagnant, je dirai !
	HeDeservedIt				=	"SVM_5_HeDeservedIt"				;//Il l'a mérité !
	HeKilledHim					=	"SVM_5_HeKilledHim"					;//Tu tue les gens. Tu vas avoir des ennuis !
	ItWasAGoodFight				=	"SVM_5_ItWasAGoodFight"				;//Quel combat !
	Awake						=	"SVM_5_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_5_FriendlyGreetings"			;//Bonjour, ami !
	ALGreetings					=	"SVM_5_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_5_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_5_SectGreetings"				;//Éveille-toi !
	ThereHeIs					= 	"SVM_5_ThereHeIs"					;//Par ici.
	NoLearnNoPoints				= 	"SVM_5_NoLearnNoPoints"				;//Je ne peux t'apprendre rien du tout car tu es trop inexpérimenté.
	NoLearnOverMax				= 	"SVM_5_NoLearnOverMax"				;//Tu es à la limite de tes possibilités. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_5_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un spécialiste avant de devenir un maître !
	NoLearnYoureBetter			=	"SVM_5_NoLearnYoureBetter"			;//Tu es déjà meilleur maintenant !
	HeyYou						=	"SVM_5_HeyYou"						;//Hé, toi !
	NotNow						=	"SVM_5_NotNow"						;//Pas maintenant.
	WhatDoYouWant				=	"SVM_5_WhatDoYouWant"				;//Puis-je t'aider ?
	ISaidWhatDoYouWant			=	"SVM_5_ISaidWhatDoYouWant"			;//Qu'est-ce que tu veux ?
	MakeWay						=	"SVM_5_MakeWay"						;//Laisse moi passer.
	OutOfMyWay					=	"SVM_5_OutOfMyWay"					;//Aller, je veux passer !
	YouDeafOrWhat				=	"SVM_5_YouDeafOrWhat"				;//Es-tu idiot ou cherches-tu les ennuis ?
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_5_LookAway"					;//Je n'ai RIEN vu... Pourquoi, que c'est t'il passé ?
	OkayKeepIt					=	"SVM_5_OkayKeepIt"					;//D'accord, garde-la !
	WhatsThat					=	"SVM_5_WhatsThat"					;//Qu'est-ce que c'était ?
	ThatsMyWeapon				=	"SVM_5_ThatsMyWeapon"				;//Je préférerai reprendre mon arme !
	GiveItToMe					=	"SVM_5_GiveItToMe"					;//Donne la moi !
	YouCanKeeptheCrap			=	"SVM_5_YouCanKeeptheCrap"			;//Hmm, ce n'est pas si mauvais ! J'en veux plus !
	TheyKilledMyFriend			=	"SVM_5_TheyKilledMyFriend"			;//Ils ont eu un de nos hommes. Si j'attrape ce pourceau...
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//Hé, c'est pour quoi faire ? Pourquoi me réveilles-tu ?
	SuckerGotSome				=	"SVM_5_SuckerGotSome"				;//Hé ? Ton verre est poli ? Sert-toi en bien !
	SuckerDefeatedEBr			=	"SVM_5_SuckerDefeatedEBr"			;//Tu as vaincu Baron du minerai. Il a été impressionné !
	SuckerDefeatedGur			=	"SVM_5_SuckerDefeatedGur"			;//Tu as vaincu un des Sages. Je suis impressionné. Mais ne recommence plus jamais ça.
	SuckerDefeatedMage			=	"SVM_5_SuckerDefeatedMage"			;//Gagner contre un magicien... Tu dois être brave !
	SuckerDefeatedNov_Guard		= 	"SVM_5_SuckerDefeatedNov_Guard"		;//Tu dois être malade d'avoir frappé un novice comme ça.
	SuckerDefeatedVlk_Guard		= 	"SVM_5_SuckerDefeatedVlk_Guard"		;//Que crois-tu faire, taper un mineur ?
	YouDefeatedMyComrade		=	"SVM_5_YouDefeatedMyComrade"		;//Tu as frappé mon ami, pourquoi faire ?
	YouDefeatedNOV_Guard		=	"SVM_5_YouDefeatedNOV_Guard"		;//Pose encore tes mains sur un novice et tu le regrettera !
	YouDefeatedVLK_Guard		=	"SVM_5_YouDefeatedVLK_Guard"		;//Tu es trop courageux, toucher à un de mes protégés peut être très dangereux.
	YouStoleFromMe				=	"SVM_5_YouStoleFromMe"				;//Tu oses revenir ici, sale voleur ?
	YouStoleFromUs				=	"SVM_5_YouStoleFromUs"				;//Tu nous as pris des choses. Tu ferais mieux de les rendre.
	YouStoleFromEBr				=	"SVM_5_YouStoleFromEBr"				;//Mec ! Tu as volé le Baron du minerai ! Ils seront fou de rage !
	YouStoleFromGur				=	"SVM_5_YouStoleFromGur"				;//Tu as volé les Sages ! Au moins tu ne t'es pas fait attrapé !
	StoleFromMage				=	"SVM_5_StoleFromMage"				;//Les magiciens n'aiment pas les gens qui fouinent autour de leurs affaires !
	YouKilledMyFriend			=	"SVM_5_YouKilledMyFriend"			;//Tu as un de nos hommes sur la conscience. Une petite erreur de plus et c'est ton tour !
	YouKilledEBr				=	"SVM_5_YouKilledEBr"				;//Tu as tué le Baron du Minerai ! Mécréant, es-tu complètement fou !?
	YouKilledGur				=	"SVM_5_YouKilledGur"				;//Tu as tué un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_5_YouKilledMage"				;//Tu as tué un magicien ! Comment expliques-tu ça ?
	YouKilledOCfolk				=	"SVM_5_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom fut prononcé en rapport avec cet acte...
	YouKilledNCfolk				=	"SVM_5_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il apparaît que tu es impliqué !
	YouKilledPSIfolk			=	"SVM_5_YouKilledPSIfolk"			;//La Confrérie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_5_GetThingsRight"				;//ça ne fut pas facile de sortir de là !
	YouDefeatedMeWell			=	"SVM_5_YouDefeatedMeWell"			;//Tu m'as donné du fil à retordre. Ce fut un bon combat. Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_5_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_5_Smalltalk02"					;// ... peut-être ...
	Smalltalk03					=	"SVM_5_Smalltalk03"					;// ... ce n'était pas très malin ...
	Smalltalk04					=	"SVM_5_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_5_Smalltalk05"					;// ... ce n'est pas vraiment mon problème ...
	Smalltalk06					=	"SVM_5_Smalltalk06"					;// ... c'était évident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_5_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_5_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_5_Smalltalk09"					;// ... il doit y avoir quelque chose derrière cette histoire après tout ...
	Smalltalk10					=	"SVM_5_Smalltalk10"					;// ... tu dois faire attention à ce que tu dis ...
	Smalltalk11					=	"SVM_5_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqué ...
	Smalltalk12					=	"SVM_5_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_5_Smalltalk13"					;// ... je n'aimerais pas être dans ses bottes ...
	Smalltalk14					=	"SVM_5_Smalltalk14"					;// ... toujours la vieille même histoire ...
	Smalltalk15					=	"SVM_5_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_5_Smalltalk16"					;// ... il fut un temps où les choses se seraient passées autrement ...
	Smalltalk17					=	"SVM_5_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_5_Smalltalk18"					;// ... je n'écoute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_5_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_5_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_5_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_5_Smalltalk22"					;// ... Attends. Il vaut mieux ne pas se précipiter ...
	Smalltalk23					=	"SVM_5_Smalltalk23"					;// ... je pensais que c'était de l'histoire ancienne ...
	Smalltalk24					=	"SVM_5_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_5_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_6 (C_SVM)				//Raufbold	(Will saufen und raufen	(Matrose) Alkoholiker. Grölt viel)
{
	StopMagic					=	"SVM_6_StopMagic"					;//Arrête cette sorcellerie !
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"				;//Arrête cette magie ! De suite !!
	WeaponDown					=	"SVM_6_WeaponDown"					;//Éloigne cette arme !
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"				;//Tu veux que je te corrige ? Éloigne cette arme !!!
	WatchYourAim				=	"SVM_6_WatchYourAim"				;//Abaisse cette chose ou tu auras des ennuis !
	WatchYourAimAngry			=	"SVM_6_WatchYourAimAngry"			;//Laisse cette arme pointée sur moi si tu veux que je mette une raclée !
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"				;//Hé! Attention !
	LetsForgetOurLittleFight	=	"SVM_6_LetsForgetOurLittleFight"	;//Hé, mec ! Oublions cet incident d'accord ?
	Strange						=	"SVM_6_Strange"						;//Sort de là ! Montre-toi !
	DieMonster					=	"SVM_6_DieMonster"					;//Je vais te transformer en viande hachée, sale porc !
	DieMortalEnemy				=	"SVM_6_DieMortalEnemy"				;//Maintenant tu es fais !
	NowWait						=	"SVM_6_NowWait"						;//Maintenant tu vas payer...
	YouStillNotHaveEnough		=	"SVM_6_YouStillNotHaveEnough"		;//Il semble que tu vas souffrir !
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Tu l'as cherché !
	NowWaitIntruder				= 	"SVM_6_NowWaitIntruder"				;//Maintenant je vais te découper !
	IWillTeachYouRespectForForeignProperty	=	"SVM_6_IWillTeachYouRespectForForeignProperty"	;//Je t'ai prévenu. Si tu touches à mes affaires, tu vas avoir des ennuis !
	DirtyThief					=	"SVM_6_DirtyThief"					;//Voleur ! Je vais t'achever !
	YouAttackedMyCharge			=	"SVM_6_YouAttackedMyCharge"			;//Personne n'attaque mes hommes !
	YouKilledOneOfUs			=	"SVM_6_YouKilledOneOfUs"			;//Tu as tué un de mes hommes. Maintenant je vais TE tuer !
	Dead						=	"SVM_6_Dead"						;//Aaargl
	Aargh_1						=	"SVM_6_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_6_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_6_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_6_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_6_YoullBeSorryForThis"			;//Tu le regretteras !
	YesYes						=	"SVM_6_YesYes"						;//D'accord, d'accord ! Pas de panique ! Tu as gagné.
	ShitWhatAMonster			=	"SVM_6_ShitWhatAMonster"			;//Enfer, Quel brute ! Sortez de là !
	Help						=	"SVM_6_Help"						;//Malédiction !
	WeWillMeetAgain				=	"SVM_6_WeWillMeetAgain"				;//Tu apprendras à me connaître !!
	NeverTryThatAgain			=	"SVM_6_NeverTryThatAgain"			;//Essaye encore et tu le regretteras.
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"				;//Cette arme a l'air commode !
	ITookYourOre				=	"SVM_6_ITookYourOre"				;//Merci pour le minerai, je boirai à ta santé !
	ShitNoOre					=	"SVM_6_ShitNoOre"					;//Merde, il n'a pas de minerai sur lui...
	HandsOff					=	"SVM_6_HandsOff"					;//Lâche ça !
	GetOutOfHere				=	"SVM_6_GetOutOfHere"				;//Sorte d'ici !
	YouViolatedForbiddenTerritory=	"SVM_6_YouViolatedForbiddenTerritory";//Hé ! D'où sors-tu ?
	YouWannaFoolMe				=	"SVM_6_YouWannaFoolMe"				;//Ouais, tu me crois stupide ?
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"		;//Hé ! Que fouilles-tu ?
	WhyAreYouInHere				=	"SVM_6_WhyYouAreInHere"				;//Sors ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_6_WhatDidYouInThere"			;//Qu'est ce que tu faisais ici ?
	WiseMove					=	"SVM_6_WiseMove"					;//C'est chanceux !
	Alarm						=	"SVM_6_Alarm"						;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_6_IntruderAlert"				;//ALERTE !!! INTRUS !!!
	BehindYou					=	"SVM_6_BehindYou"					;//Derrière toi !
	TheresAFight				=	"SVM_6_TheresAFight"				;//Ah, un combat !
	HeyHeyHey					=	"SVM_6_HeyHeyHey"					;//Plus fort !
	CheerFight					=	"SVM_6_CheerFight"					;//Tu combats comme une femme !
	CheerFriend					=	"SVM_6_CheerFriend"					;//Fini le !!
	Ooh							=	"SVM_6_Ooh"							;//Ne t'amuse pas avec lui ! Tranche lui la gorge !
	YeahWellDone				=	"SVM_6_YeahWellDone"				;//Maintenant achève-le. Oui, il bouge encore !
	RunCoward					=	"SVM_6_RunCoward"					;//Lâche, revient !
	HeDefeatedHim				=	"SVM_6_HeDefeatedHim"				;//Il en a eu assez !
	HeDeservedIt				=	"SVM_6_HeDeservedIt"				;//Fait-lui voir !
	HeKilledHim					=	"SVM_6_HeKilledHim"					;//Tu es aussi bien mort ! ça t'apprendra à tuer les gens.
	ItWasAGoodFight				=	"SVM_6_ItWasAGoodFight"				;//Ha  ha ! Tu lui as montré !
	Awake						=	"SVM_6_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_6_FriendlyGreetings"			;//Bonjour.
	ALGreetings					=	"SVM_6_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_6_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_6_SectGreetings"				;//Éveille-toi !
	ThereHeIs					= 	"SVM_6_ThereHeIs"					;//Il est là.
	NoLearnNoPoints				= 	"SVM_6_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'expérience.
	NoLearnOverMax				= 	"SVM_6_NoLearnOverMax"				;//Tu es à la limite de tes possibilités. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_6_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un spécialiste avant de devenir un maître !
	NoLearnYoureBetter			=	"SVM_6_NoLearnYoureBetter"			;//Tu es déjà meilleur maintenant !
	HeyYou						=	"SVM_6_HeyYou"						;//Hé, toi !
	NotNow						=	"SVM_6_NotNow"						;//Pas maintenant.
	WhatDoYouWant				=	"SVM_6_WhatDoYouWant"				;//Qu'est-ce que tu veux ?
	ISaidWhatDoYouWant			=	"SVM_6_ISaidWhatDoYouWant"			;//Tu veux quelque chose ?
	MakeWay						=	"SVM_6_MakeWay"						;//Laisse-moi passer !
	OutOfMyWay					=	"SVM_6_OutOfMyWay"					;//Aller, bouge !
	YouDeafOrWhat				=	"SVM_6_YouDeafOrWhat"				;//Recule ! Ou souhaites-tu que je te tape la tête ?
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"		;//Tu cherches encore des ennuis ?
	LookAway					=	"SVM_6_LookAway"					;//Je n'ai rien vu ! vraiment !
	OkayKeepIt					=	"SVM_6_OkayKeepIt"					;//D'accord d'accord, garde les affaires !
	WhatsThat					=	"SVM_6_WhatsThat"					;//Qu'est-ce que c'était ?
	ThatsMyWeapon				=	"SVM_6_ThatsMyWeapon"				;//Rend-moi juste mon arme, bouffon !
	GiveItToMe					=	"SVM_6_GiveItToMe"					;//Rend-moi la, mec !
	YouCanKeeptheCrap			=	"SVM_6_YouCanKeeptheCrap"			;//Pas grave ! Je n'en ai plus besoin de toute façon !
	TheyKilledMyFriend			=	"SVM_6_TheyKilledMyFriend"			;//Ils ont eu un de nos hommes. Si j'attrape ce pourceau...
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"		;//Enfer, pourquoi me réveilles-tu ?
	SuckerGotSome				=	"SVM_6_SuckerGotSome"				;//Tu as aimé ta défaite ? rappelles-toi en bien !
	SuckerDefeatedEBr			=	"SVM_6_SuckerDefeatedEBr"			;//Tu as frappé le Baron du minerai ! Tu l'a rendu fou !
	SuckerDefeatedGur			=	"SVM_6_SuckerDefeatedGur"			;//Tu as frappé un Sage. Il semble que tu attires les problèmes comme un aimant !
	SuckerDefeatedMage			=	"SVM_6_SuckerDefeatedMage"			;//Etre victorieux contre un magicien est vraiment une idée idiote !
	SuckerDefeatedNov_Guard		= 	"SVM_6_SuckerDefeatedNov_Guard"		;//Tu ne peux pas juste te balader et taper les novices !
	SuckerDefeatedVlk_Guard		= 	"SVM_6_SuckerDefeatedVlk_Guard"		;//Laisse mes hommes tranquille !
	YouDefeatedMyComrade		=	"SVM_6_YouDefeatedMyComrade"		;//Tu as frappé un de mes amis !
	YouDefeatedNOV_Guard		=	"SVM_6_YouDefeatedNOV_Guard"		;//Ce que tu fais ne peut être toléré ici !
	YouDefeatedVLK_Guard		=	"SVM_6_YouDefeatedVLK_Guard"		;//Si tu frappes quelqu'un sous ma protection tu en subiras les conséquences !
	YouStoleFromMe				=	"SVM_6_YouStoleFromMe"				;//Salopard, tu m'as volé ! Ne recommence plus !
	YouStoleFromUs				=	"SVM_6_YouStoleFromUs"				;//Nous voulons nos affaires ! Rend-les nous !
	YouStoleFromEBr				=	"SVM_6_YouStoleFromEBr"				;//Tu as volé le Baron du minerai ! Pourquoi diable as-tu fais ça ?
	YouStoleFromGur				=	"SVM_6_YouStoleFromGur"				;//Tu as volé les Sages ? Quelle idiotie qu'il t'ont prit sur le faite.
	StoleFromMage				=	"SVM_6_StoleFromMage"				;//Tu as volé des magiciens ! Une idée idiote !
	YouKilledMyFriend			=	"SVM_6_YouKilledMyFriend"			;//Un de nos hommes est mort et tu es impliqué. Une petite erreur de plus et c'est ton tour !
	YouKilledEBr				=	"SVM_6_YouKilledEBr"				;//Tu as tué le Baron du Minerai ! Mécréant, es-tu complètement fou !?
	YouKilledGur				=	"SVM_6_YouKilledGur"				;//Tu as tué un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_6_YouKilledMage"				;//Tu as tué un magicien ! Comment expliques-tu ça ?
	YouKilledOCfolk				=	"SVM_6_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom a été mentionné en rapport à cette affaire ...
	YouKilledNCfolk				=	"SVM_6_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il apparaît que tu es impliqué !
	YouKilledPSIfolk			=	"SVM_6_YouKilledPSIfolk"			;//La Confrérie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_6_GetThingsRight"				;//ça ne fut pas facile de sortir de là !
	YouDefeatedMeWell			=	"SVM_6_YouDefeatedMeWell"			;//D'accord, tu m'as battu. C'était un beau combat ! Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_6_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_6_Smalltalk02"					;// ... peut-être ...
	Smalltalk03					=	"SVM_6_Smalltalk03"					;// ... ce n'était pas très malin ...
	Smalltalk04					=	"SVM_6_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_6_Smalltalk05"					;// ... ce n'est vraiment pas mon problème ...
	Smalltalk06					=	"SVM_6_Smalltalk06"					;// ... c'était évident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_6_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_6_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_6_Smalltalk09"					;// ... il doit y avoir quelque chose derrière cette histoire après tout ...
	Smalltalk10					=	"SVM_6_Smalltalk10"					;// ... tu dois faire attention à ce que tu dis ...
	Smalltalk11					=	"SVM_6_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqué ...
	Smalltalk12					=	"SVM_6_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_6_Smalltalk13"					;// ... je n'aimerais pas être dans ses bottes ...
	Smalltalk14					=	"SVM_6_Smalltalk14"					;// ... toujours la vieille même histoire ...
	Smalltalk15					=	"SVM_6_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_6_Smalltalk16"					;// ... il fut un temps où les choses se seraient passées autrement ...
	Smalltalk17					=	"SVM_6_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_6_Smalltalk18"					;// ... n'écoute pas les rumeurs ...
	Smalltalk19					=	"SVM_6_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_6_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_6_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_6_Smalltalk22"					;// ... attends. Il ne faut pas se précipiter ...
	Smalltalk23					=	"SVM_6_Smalltalk23"					;// ... je pensais que c'était de l'histoire ancienne ...
	Smalltalk24					=	"SVM_6_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_6_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_7 (C_SVM)				//Freak, Aggressiv. Spielt mit seiner Macht. Sadist. Org: Abschaum, den im AL keiner wollte. Nov (selten): Durchgeknallter Abschaum.
{
	StopMagic					=	"SVM_7_StopMagic"					;//Éloigne ça ! Éloigne ça !!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"				;//Éloigne cette magie, éloigne la !!
	WeaponDown					=	"SVM_7_WeaponDown"					;//Éloigne cette arme, éloigne la !
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"				;//Je suis sérieux ! Va t'en avec ça !
	WatchYourAim				=	"SVM_7_WatchYourAim"				;//Me vises-tu ? Attention !
	WatchYourAimAngry			=	"SVM_7_WatchYourAimAngry"			;//Tu crois que tu peux m'intimider ? Réfléchi encore !
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"				;//Je m'en souviendrai ! Attention !
	LetsForgetOurLittleFight	=	"SVM_7_LetsForgetOurLittleFight"	;//Oublions ça, d'accord ?
	Strange						=	"SVM_7_Strange"						;//Où est-il passé ? ça ne se peut ! C'est impossible !!
	DieMonster					=	"SVM_7_DieMonster"					;//Je t'aurai, ordure !
	DieMortalEnemy				=	"SVM_7_DieMortalEnemy"				;//Et voilà ! C'est ton tour maintenant ! Pas de pitié !
	NowWait						=	"SVM_7_NowWait"						;//Finalement tu m'as donné raison !
	YouStillNotHaveEnough		=	"SVM_7_YouStillNotHaveEnough"		;//Tu ne veux pas recommencer, n'est-ce pas ?
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Du sang ! Ton sang !!
	NowWaitIntruder				= 	"SVM_7_NowWaitIntruder"				;//Je vais te découper en morceau !
	IWillTeachYouRespectForForeignProperty	=	"SVM_7_IWillTeachYouRespectForForeignProperty"	;//Je devrais t'arracher les doigts !
	DirtyThief					=	"SVM_7_DirtyThief"					;//Sale voleur ! Je veux te voir souffrir !
	YouAttackedMyCharge			=	"SVM_7_YouAttackedMyCharge"			;//Personne de frappe personne ici à part moi !
	YouKilledOneOfUs			=	"SVM_7_YouKilledOneOfUs"			;//Tu as tué un des notres !
	Dead						=	"SVM_7_Dead"						;//Aaargl
	Aargh_1						=	"SVM_7_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_7_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_7_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_7_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_7_YoullBeSorryForThis"			;//Tu n'aura pas assez de temps pour être désolé !
	YesYes						=	"SVM_7_YesYes"						;//D'accord, d'accord !
	ShitWhatAMonster			=	"SVM_7_ShitWhatAMonster"			;//Je n'ai pas la bonne arme. Nous nous rencontrerons à nouveau ...
	Help						=	"SVM_7_Help"						;//Malédiction !
	WeWillMeetAgain				=	"SVM_7_WeWillMeetAgain"				;//Je te retrouverai !
	NeverTryThatAgain			=	"SVM_7_NeverTryThatAgain"			;//Plus jamais ça !
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"				;//Je garde cette arme !
	ITookYourOre				=	"SVM_7_ITookYourOre"				;//Je préférerai te tuer, mais le minerai n'est pas mal non plus !
	ShitNoOre					=	"SVM_7_ShitNoOre"					;//Pas de minerai ? Tu sers à rien mec !
	HandsOff					=	"SVM_7_HandsOff"					;//Lâche ça !
	GetOutOfHere				=	"SVM_7_GetOutOfHere"				;//Arrête ! Sors de là !
	YouViolatedForbiddenTerritory=	"SVM_7_YouViolatedForbiddenTerritory";//Comment es-tu venu ici ?
	YouWannaFoolMe				=	"SVM_7_YouWannaFoolMe"				;//Tu aimes vraiment avoir un avantage sur moi, n'est-ce pas ?
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"		;//Hé, toi ! Qu'est-ce que tu fouines par là ?
	WhyAreYouInHere				=	"SVM_7_WhyYouAreInHere"				;//Fait toi petit ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_7_WhatDidYouInThere"			;//Tu n'as rien a faire ici !
	WiseMove					=	"SVM_7_WiseMove"					;//Tu as de la chance ! Mais j'aurai aimer te refaire le portrait !
	Alarm						=	"SVM_7_Alarm"						;//Gardes, par ici !
	IntruderAlert				= 	"SVM_7_IntruderAlert"				;//ALERTE !!
	BehindYou					=	"SVM_7_BehindYou"					;//Derrière toi !
	TheresAFight				=	"SVM_7_TheresAFight"				;//Un combat !
	HeyHeyHey					=	"SVM_7_HeyHeyHey"					;//Plus fort !
	CheerFight					=	"SVM_7_CheerFight"					;//Je veux voir du sang !
	CheerFriend					=	"SVM_7_CheerFriend"					;//Écrasez-le !!
	Ooh							=	"SVM_7_Ooh"							;//Contre-attaquez, bande d'idiot !
	YeahWellDone				=	"SVM_7_YeahWellDone"				;//Yeaah !!!
	RunCoward					=	"SVM_7_RunCoward"					;//Rentre chez ta mère !!
	HeDefeatedHim				=	"SVM_7_HeDefeatedHim"				;//Il en a eu assez !
	HeDeservedIt				=	"SVM_7_HeDeservedIt"				;//C'est notre propre faute !
	HeKilledHim					=	"SVM_7_HeKilledHim"					;//C'est du suicide de tué quelqu'un devant témoin.
	ItWasAGoodFight				=	"SVM_7_ItWasAGoodFight"				;//Beau combat !
	Awake						=	"SVM_7_Awake"						;//C'est l'heure de se lever de nouveau !
	FriendlyGreetings			=	"SVM_7_FriendlyGreetings"			;//Bonjour
	ALGreetings					=	"SVM_7_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_7_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_7_SectGreetings"				;//Éveille-toi !
	ThereHeIs					= 	"SVM_7_ThereHeIs"					;//Es-tu aveugle ? Par ici !
	NoLearnNoPoints				= 	"SVM_7_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'expérience.
	NoLearnOverMax				= 	"SVM_7_NoLearnOverMax"				;//Tu es à la limite de tes possibilités. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_7_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un spécialiste avant de devenir un maître !
	NoLearnYoureBetter			=	"SVM_7_NoLearnYoureBetter"			;//Tu es déjà meilleur maintenant !
	HeyYou						=	"SVM_7_HeyYou"						;//Hé, toi !
	NotNow						=	"SVM_7_NotNow"						;//Pas maintenant !
	WhatDoYouWant				=	"SVM_7_WhatDoYouWant"				;//Que veux-tu de moi ?
	ISaidWhatDoYouWant			=	"SVM_7_ISaidWhatDoYouWant"			;//Je peux faire quelque chose pour toi ?!
	MakeWay						=	"SVM_7_MakeWay"						;//Laisse moi passer.
	OutOfMyWay					=	"SVM_7_OutOfMyWay"					;//Hors de mon chemin !
	YouDeafOrWhat				=	"SVM_7_YouDeafOrWhat"				;//Tu cherches des ennuis ? Sors d'ici !
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"		;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_7_LookAway"					;//Je n'ai RIEN vu !
	OkayKeepIt					=	"SVM_7_OkayKeepIt"					;//D'accord, d'accord ! Garde-le !
	WhatsThat					=	"SVM_7_WhatsThat"					;//Qu'est-ce que c'était ?
	ThatsMyWeapon				=	"SVM_7_ThatsMyWeapon"				;//Rend moi mon arme !
	GiveItToMe					=	"SVM_7_GiveItToMe"					;//Rend-la moi !
	YouCanKeeptheCrap			=	"SVM_7_YouCanKeeptheCrap"			;//D'accord ! Garde-la ! Je trouverai une autre solution !
	TheyKilledMyFriend			=	"SVM_7_TheyKilledMyFriend"			;//Un des notres est mort ! Vengeance !
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"		;//Pourquoi m'as-tu réveillé ?
	SuckerGotSome				=	"SVM_7_SuckerGotSome"				;//Tire des leçons de tes défaites !
	SuckerDefeatedEBr			=	"SVM_7_SuckerDefeatedEBr"			;//Tu as frappé le Baron du minerai ! Tu l'a rendu fou !
	SuckerDefeatedGur			=	"SVM_7_SuckerDefeatedGur"			;//Tu as frappé un Sage. Tu attires les ennuis comme un aimant !
	SuckerDefeatedMage			=	"SVM_7_SuckerDefeatedMage"			;//Etre victorieux contre un magicien est vraiment une idée idiote !
	SuckerDefeatedNov_Guard		= 	"SVM_7_SuckerDefeatedNov_Guard"		;//Alors tu es celui qui a frappé les novices !
	SuckerDefeatedVlk_Guard		= 	"SVM_7_SuckerDefeatedVlk_Guard"		;//Laisse mes hommes tranquille !
	YouDefeatedMyComrade		=	"SVM_7_YouDefeatedMyComrade"		;//Tu as tapé la mauvaise personne ! Nous allons souffrir ensemble !
	YouDefeatedNOV_Guard		=	"SVM_7_YouDefeatedNOV_Guard"		;//Ce que tu fais ne peut être toléré ici !
	YouDefeatedVLK_Guard		=	"SVM_7_YouDefeatedVLK_Guard"		;//Si tu frappes quelqu'un sous ma protection tu en subiras les conséquences !
	YouStoleFromMe				=	"SVM_7_YouStoleFromMe"				;//Salopard, tu m'as volé! Ne recommence plus ça !
	YouStoleFromUs				=	"SVM_7_YouStoleFromUs"				;//Nous voulons nos affaires ! Rend les nous !
	YouStoleFromEBr				=	"SVM_7_YouStoleFromEBr"				;//Tu as volé le Baron du minerai ! Pourquoi diable as-tu fais ça ?
	YouStoleFromGur				=	"SVM_7_YouStoleFromGur"				;//Tu as volé les Sages ? Quelle idiotie qu'il t'ont prit sur le faite.
	StoleFromMage				=	"SVM_7_StoleFromMage"				;//Tu as volé les magiciens ! Une idée véritablement ignoble !
	YouKilledMyFriend			=	"SVM_7_YouKilledMyFriend"			;//Un de nos hommes est mort et tu es impliqué. Une petite erreur de plus et c'est ton tour !
	YouKilledEBr				=	"SVM_7_YouKilledEBr"				;//Tu as tué le Baron du minerai ! Mec, tu es complètement malade !
	YouKilledGur				=	"SVM_7_YouKilledGur"				;//Tu as tué un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_7_YouKilledMage"				;//Tu as tué un magicien ! Comment imagines-tu expliquer ça ?
	YouKilledOCfolk				=	"SVM_7_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom fut prononcé en rapport avec cet acte...
	YouKilledNCfolk				=	"SVM_7_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il apparaît que tu es impliqué !
	YouKilledPSIfolk			=	"SVM_7_YouKilledPSIfolk"			;//La Confrérie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_7_GetThingsRight"				;//ça ne fut pas facile de sortir de là !
	YouDefeatedMeWell			=	"SVM_7_YouDefeatedMeWell"			;//D'accord, tu m'as battu. C'était un beau combat ! Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_7_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_7_Smalltalk02"					;// ... peut-être ...
	Smalltalk03					=	"SVM_7_Smalltalk03"					;// ... ce n'était pas très malin ...
	Smalltalk04					=	"SVM_7_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_7_Smalltalk05"					;// ... ce n'est pas vraiment mon problème ...
	Smalltalk06					=	"SVM_7_Smalltalk06"					;// ... C'est normal qu'il trouve les ennuis ...
	Smalltalk07					=	"SVM_7_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_7_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_7_Smalltalk09"					;// ... il doit y avoir quelque chose derrière cette histoire après tout ...
	Smalltalk10					=	"SVM_7_Smalltalk10"					;// ... tu dois faire attention à ce que tu dis ...
	Smalltalk11					=	"SVM_7_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqué ...
	Smalltalk12					=	"SVM_7_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_7_Smalltalk13"					;// ... je n'aimerais pas être dans ses bottes ...
	Smalltalk14					=	"SVM_7_Smalltalk14"					;// ... toujours la vieille même histoire ...
	Smalltalk15					=	"SVM_7_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_7_Smalltalk16"					;// ... il fut un temps où les choses se seraient passées autrement ...
	Smalltalk17					=	"SVM_7_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_7_Smalltalk18"					;// ... je n'écoute plus toutes ces rumeurs ...
	Smalltalk19					=	"SVM_7_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_7_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_7_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_7_Smalltalk22"					;// ... hé bien, attends. Ne te précipite pas ...
	Smalltalk23					=	"SVM_7_Smalltalk23"					;// ... je pensais que c'était de l'histoire ancienne ...
	Smalltalk24					=	"SVM_7_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_7_Om"							;//Ommm
};

//////////////////////////////////////////
instance SVM_8 (C_SVM)				// Elite-Garde. Ultra-cool. Pflichtbewusst, ernst, nüchtern! Klare Stimme
{
	StopMagic					=	"SVM_8_StopMagic"					;//n'essaie pas de sorcellerie sur moi !
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"				;//Arrête, j'ai dit ! Une fois !
	WeaponDown					=	"SVM_8_WeaponDown"					;//Range cette arme !
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"				;//Éloigne ça de moi ou tu es fais !
	WatchYourAim				=	"SVM_8_WatchYourAim"				;//Range cette arme, idiot !
	WatchYourAimAngry			=	"SVM_8_WatchYourAimAngry"			;//Tu oses me viser ?
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"				;//Attention !
	LetsForgetOurLittleFight	=	"SVM_8_LetsForgetOurLittleFight"	;//D'accord, oublions cela.
	Strange						=	"SVM_8_Strange"						;//Sors de là ! Je sais que tu m'entends !
	DieMonster					=	"SVM_8_DieMonster"					;//Maudites créatures !
	DieMortalEnemy				=	"SVM_8_DieMortalEnemy"				;//Maintenant tu vas mourir. Ne le prend pas personnellement !
	NowWait						=	"SVM_8_NowWait"						;//Sale vermine, tu m'attaques MOI ! Attend un peu ...
	YouStillNotHaveEnough		=	"SVM_8_YouStillNotHaveEnough"		;//Je ne t'ai pas fait mordre la poussière une fois ? Alors reprend ça ...
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Si tu n'écoutes pas, tu vas au moins sentir !
	NowWaitIntruder				= 	"SVM_8_NowWaitIntruder"				;//Tu oses venir par ici ? Attend une seconde !
	IWillTeachYouRespectForForeignProperty	=	"SVM_8_IWillTeachYouRespectForForeignProperty"	;//Suppose que je doive briser tes doigts !
	DirtyThief					=	"SVM_8_DirtyThief"					;//Tu n'aurais pas dû voler ça !
	YouAttackedMyCharge			=	"SVM_8_YouAttackedMyCharge"			;//Personne ne frappe mes hommes sans être désolé après !
	YouKilledOneOfUs			=	"SVM_8_YouKilledOneOfUs"			;//Tuer un des autres sera ta dernière erreur !
	Dead						=	"SVM_8_Dead"						;//Aaargl
	Aargh_1						=	"SVM_8_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_8_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_8_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_8_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_8_YoullBeSorryForThis"			;//Tu vas vraiment être désolé de ça !
	YesYes						=	"SVM_8_YesYes"						;//Doucement. Tout va bien !
	ShitWhatAMonster			=	"SVM_8_ShitWhatAMonster"			;//Je préférerai plutôt observer cette bête à distance !
	Help						=	"SVM_8_Help"						;//Vite, dehors !
	WeWillMeetAgain				=	"SVM_8_WeWillMeetAgain"				;//Nous nous retrouverons !
	NeverTryThatAgain			=	"SVM_8_NeverTryThatAgain"			;//Recommence ça et tu es mort !
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"				;//J'aime cette arme !
	ITookYourOre				=	"SVM_8_ITookYourOre"				;//Je crois que tu ne m'as pas encore payais de taxe de minerai !
	ShitNoOre					=	"SVM_8_ShitNoOre"					;//Évidemment, un perdant tel que toi ne vas pas avoir de minerai !
	HandsOff					=	"SVM_8_HandsOff"					;//Lâche ça !
	GetOutOfHere				=	"SVM_8_GetOutOfHere"				;//Sorte d'ici !
	YouViolatedForbiddenTerritory=	"SVM_8_YouViolatedForbiddenTerritory";//Hé, comment es-tu entré ici ?
	YouWannaFoolMe				=	"SVM_8_YouWannaFoolMe"				;//Tu es vraiment un futé petit salopard, n'est-ce pas ?
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"		;//Hé, toi ! Qu'est-ce que tu fouines ?
	WhyAreYouInHere				=	"SVM_8_WhyYouAreInHere"				;//Fait toi petit ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_8_WhatDidYouInThere"			;//Qu'est ce que tu faisais ici ?
	WiseMove					=	"SVM_8_WiseMove"					;//Tu as eu de la chance.
	Alarm						=	"SVM_8_Alarm"						;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_8_IntruderAlert"				;//ALERTE !!! INTRUS !!!
	BehindYou					=	"SVM_8_BehindYou"					;//Derrière toi !
	TheresAFight				=	"SVM_8_TheresAFight"				;//Allons voir qui se bat !
	HeyHeyHey					=	"SVM_8_HeyHeyHey"					;//Plus fort !
	CheerFight					=	"SVM_8_CheerFight"					;//Oui ! allez, viens !
	CheerFriend					=	"SVM_8_CheerFriend"					;//Bien ! Ne te relâche pas !
	Ooh							=	"SVM_8_Ooh"							;//Te laisse pas faire ! Crache lui dessus !
	YeahWellDone				=	"SVM_8_YeahWellDone"				;//Oui, montre lui. Il bouge encore !
	RunCoward					=	"SVM_8_RunCoward"					;//Ne te remontre plus jamais ici !
	HeDefeatedHim				=	"SVM_8_HeDefeatedHim"				;//Quel combat ennuyeux !
	HeDeservedIt				=	"SVM_8_HeDeservedIt"				;//Fait-lui voir !
	HeKilledHim					=	"SVM_8_HeKilledHim"					;//Ce n'était pas nécessaire. Tu devras en subir les conséquences.
	ItWasAGoodFight				=	"SVM_8_ItWasAGoodFight"				;//Ce fut un beau combat !
	Awake						=	"SVM_8_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_8_FriendlyGreetings"			;//Bonjour.
	ALGreetings					=	"SVM_8_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_8_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_8_SectGreetings"				;//Éveille-toi !
	ThereHeIs					= 	"SVM_8_ThereHeIs"					;//Il est là.
	NoLearnNoPoints				= 	"SVM_8_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'expérience.
	NoLearnOverMax				= 	"SVM_8_NoLearnOverMax"				;//Tu es à la limite de tes possibilités. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_8_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un spécialiste avant de devenir un maître !
	NoLearnYoureBetter			=	"SVM_8_NoLearnYoureBetter"			;//Tu es déjà meilleur maintenant !
	HeyYou						=	"SVM_8_HeyYou"						;//Hé, toi !
	NotNow						=	"SVM_8_NotNow"						;//Pas maintenant.
	WhatDoYouWant				=	"SVM_8_WhatDoYouWant"				;//Qu'est-ce que tu veux ?
	ISaidWhatDoYouWant			=	"SVM_8_ISaidWhatDoYouWant"			;//Puis-je faire quelque chose pour toi ?
	MakeWay						=	"SVM_8_MakeWay"						;//Je peux passer ?
	OutOfMyWay					=	"SVM_8_OutOfMyWay"					;//Écarte toi !
	YouDeafOrWhat				=	"SVM_8_YouDeafOrWhat"				;//Tu veux que je te frappe la tête ? Sors de là !
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"		;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_8_LookAway"					;//Ahem ... Une très belle vue !
	OkayKeepIt					=	"SVM_8_OkayKeepIt"					;//Bien ! C'est à toi.
	WhatsThat					=	"SVM_8_WhatsThat"					;//Hé ? Qu'est ce que c'était ?
	ThatsMyWeapon				=	"SVM_8_ThatsMyWeapon"				;//Tu portes mon arme ...?
	GiveItToMe					=	"SVM_8_GiveItToMe"					;//Rend la moi ! une fois !
	YouCanKeeptheCrap			=	"SVM_8_YouCanKeeptheCrap"			;//Garde-la, je n'en pas besoin.
	TheyKilledMyFriend			=	"SVM_8_TheyKilledMyFriend"			;//Ils ont eu un de nos hommes. Si j'attrape ce pourceau...
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"		;//Ca va ?
	SuckerGotSome				=	"SVM_8_SuckerGotSome"				;//Hé ? Ton verre est poli ? Sert-toi en bien !
	SuckerDefeatedEBr			=	"SVM_8_SuckerDefeatedEBr"			;//Tu as vaincu Baron du minerai. Il a été impressionné !
	SuckerDefeatedGur			=	"SVM_8_SuckerDefeatedGur"			;//Tu as vaincu un des Sages. Je suis impressionné. Mais ne recommence plus jamais ça.
	SuckerDefeatedMage			=	"SVM_8_SuckerDefeatedMage"			;//Gagner contre un magicien... Tu dois être brave !
	SuckerDefeatedNov_Guard		= 	"SVM_8_SuckerDefeatedNov_Guard"		;//Tu sais que les novices sont sous ma protection. Et néanmoins tu les as frappé quand même ?
	SuckerDefeatedVlk_Guard		= 	"SVM_8_SuckerDefeatedVlk_Guard"		;//Si tu touches au mineurs, tu auras affaire à moi !
	YouDefeatedMyComrade		=	"SVM_8_YouDefeatedMyComrade"		;//Tu ne devrais pas chercher des histoires à mes amis.
	YouDefeatedNOV_Guard		=	"SVM_8_YouDefeatedNOV_Guard"		;//Pose encore tes mains sur un novice et tu le regrettera !
	YouDefeatedVLK_Guard		=	"SVM_8_YouDefeatedVLK_Guard"		;//Si tu attaques un de mes protégés, ça peut te coûter cher.
	YouStoleFromMe				=	"SVM_8_YouStoleFromMe"				;//Tu oses revenir ici, sale voleur ?
	YouStoleFromUs				=	"SVM_8_YouStoleFromUs"				;//Tu nous as pris des choses. Tu ferais mieux de les rendre.
	YouStoleFromEBr				=	"SVM_8_YouStoleFromEBr"				;//Mec ! Tu as volé du minerai au Baron ! Ils vont être furieux !
	YouStoleFromGur				=	"SVM_8_YouStoleFromGur"				;//Tu as soulagé les Sages de plusieurs objets, n'est-ce pas ?
	StoleFromMage				=	"SVM_8_StoleFromMage"				;//Tu as soulagé les magiciens de plusieurs objets, n'est-ce pas ?
	YouKilledMyFriend			=	"SVM_8_YouKilledMyFriend"			;//Tu as un de nos hommes sur la conscience. Une petite erreur de plus et c'est ton tour !
	YouKilledEBr				=	"SVM_8_YouKilledEBr"				;//Tu as tué le Baron du Minerai ! Mécréant, es-tu complètement fou !?
	YouKilledGur				=	"SVM_8_YouKilledGur"				;//Tu as tué un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_8_YouKilledMage"				;//Tu as tué un magicien ! Comment expliques-tu ça ?
	YouKilledOCfolk				=	"SVM_8_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom fut prononcé en rapport avec cet acte...
	YouKilledNCfolk				=	"SVM_8_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il apparaît que tu es impliqué !
	YouKilledPSIfolk			=	"SVM_8_YouKilledPSIfolk"			;//La Confrérie compte un croyant de moins, et tu l'as sur la conscience !
	GetThingsRight				=	"SVM_8_GetThingsRight"				;//ça ne fut pas facile de sortir de là !
	YouDefeatedMeWell			=	"SVM_8_YouDefeatedMeWell"			;//Tu m'as donné du fil à retordre. Ce fut un bon combat. Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_8_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_8_Smalltalk02"					;// ... peut-être ...
	Smalltalk03					=	"SVM_8_Smalltalk03"					;// ... ce n'était pas très malin ...
	Smalltalk04					=	"SVM_8_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_8_Smalltalk05"					;// ... ce n'est vraiment pas mon problème ...
	Smalltalk06					=	"SVM_8_Smalltalk06"					;// ... il est clair qu'il allait avoir des ennuis ...
	Smalltalk07					=	"SVM_8_Smalltalk07"					;// ... garde le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_8_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_8_Smalltalk09"					;// ... il doit y avoir quelque chose derrière cette histoire après tout ...
	Smalltalk10					=	"SVM_8_Smalltalk10"					;// ... tu dois faire attention à ce que tu dis ...
	Smalltalk11					=	"SVM_8_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqué ...
	Smalltalk12					=	"SVM_8_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_8_Smalltalk13"					;// ... je n'aimerais pas être dans ses bottes ...
	Smalltalk14					=	"SVM_8_Smalltalk14"					;// ... toujours la vieille même histoire ...
	Smalltalk15					=	"SVM_8_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_8_Smalltalk16"					;// ... il fut un temps où les choses se seraient passées autrement ...
	Smalltalk17					=	"SVM_8_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_8_Smalltalk18"					;// ... je n'écoute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_8_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_8_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_8_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_8_Smalltalk22"					;// ... Attends. Il vaut mieux ne pas se précipiter ...
	Smalltalk23					=	"SVM_8_Smalltalk23"					;// ... Ah, je pensais que c'était réglé depuis longtemps ...
	Smalltalk24					=	"SVM_8_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_8_Om"							;//Ommm
};


instance SVM_9 (C_SVM)				// brummig		   gemütlicher Hüne, Besonnen, Brummiger Bär, Einfacher	Mensch
{
	StopMagic					=	"SVM_9_StopMagic"					;//Je ne veux pas de magie chez moi !
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"				;//Arrête, j'ai dit ! Une fois !
	WeaponDown					=	"SVM_9_WeaponDown"					;//Envisages-tu de m'attaquer ?
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"				;//Tu veux que je te casse la figure ou tu vas ranger ça ?
	WatchYourAim				=	"SVM_9_WatchYourAim"				;//Regarde ce que tu vises !
	WatchYourAimAngry			=	"SVM_9_WatchYourAimAngry"			;//Éloigne ça !
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"				;//Hé! Attention !
	LetsForgetOurLittleFight	=	"SVM_9_LetsForgetOurLittleFight"	;//ça ne me gênera pas d'oublier ceci ...
	Strange						=	"SVM_9_Strange"						;//Montre toi. Je sais que tu peux m'entendre !
	DieMonster					=	"SVM_9_DieMonster"					;//Ces bêtes sont vraiment répugnantes !
	DieMortalEnemy				=	"SVM_9_DieMortalEnemy"				;//Maintenant tu es fais !
	NowWait						=	"SVM_9_NowWait"						;//Maintenant tu vas me connaître !
	YouStillNotHaveEnough		=	"SVM_9_YouStillNotHaveEnough"		;//Tu insistes !
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Si tu n'écoutes pas, tu vas au moins sentir !
	NowWaitIntruder				= 	"SVM_9_NowWaitIntruder"				;//Maintenant je te tiens, intrus !
	IWillTeachYouRespectForForeignProperty	=	"SVM_9_IWillTeachYouRespectForForeignProperty"	;//Je t'ai prévenu. Toucher à mes affaires signifie des ennuis !
	DirtyThief					=	"SVM_9_DirtyThief"					;//Voleur ! Je vais t'achever !
	YouAttackedMyCharge			=	"SVM_9_YouAttackedMyCharge"			;//Personne n'attaque mes hommes !
	YouKilledOneOfUs			=	"SVM_9_YouKilledOneOfUs"			;//Tu as tué un de mes hommes. Maintenant je vais TE tuer !
	Dead						=	"SVM_9_Dead"						;//Aargh, aargh
	Aargh_1						=	"SVM_9_Aargh_1"						;//Oaargh, aargh, oorgh
	Aargh_2						=	"SVM_9_Aargh_2"						;//Aargh, oorgh
	Aargh_3						=	"SVM_9_Aargh_3"						;//Oorgh, aargh
	Berzerk						=	"SVM_9_Berzerk"						;//AAARRGGGHHH !!!
	YoullBeSorryForThis			=	"SVM_9_YoullBeSorryForThis"			;//Tu es déjà mort, mais tu ne le sais pas encore.
	YesYes						=	"SVM_9_YesYes"						;//Doucement. Tout va bien !
	ShitWhatAMonster			=	"SVM_9_ShitWhatAMonster"			;//Merde, quelle bestiole !
	Help						=	"SVM_9_Help"						;//Vite, dehors !
	WeWillMeetAgain				=	"SVM_9_WeWillMeetAgain"				;//On se retrouvera.
	NeverTryThatAgain			=	"SVM_9_NeverTryThatAgain"			;//La prochaine fois je te tuerai !
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"				;//Cette arme est maintenant à moi !
	ITookYourOre				=	"SVM_9_ITookYourOre"				;//Du minerai ! Hé bien, c'est mieux que rien !
	ShitNoOre					=	"SVM_9_ShitNoOre"					;//Il n'a même pas du minerai sur lui !
	HandsOff					=	"SVM_9_HandsOff"					;//Bat les pattes, mec !
	GetOutOfHere				=	"SVM_9_GetOutOfHere"				;//Sorte d'ici !
	YouViolatedForbiddenTerritory=	"SVM_9_YouViolatedForbiddenTerritory";//Que fais-tu ici ?
	YouWannaFoolMe				=	"SVM_9_YouWannaFoolMe"				;//Tu me prends pour un abruti ?
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"		;//Hé, toi ! Qu'est-ce que tu fouines par là ?
	WhyAreYouInHere				=	"SVM_9_WhyYouAreInHere"				;//Sors ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_9_WhatDidYouInThere"			;//Qu'est ce que tu faisais ici ?
	WiseMove					=	"SVM_9_WiseMove"					;//Petit futé pourri !
	Alarm						=	"SVM_9_Alarm"						;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_9_IntruderAlert"				;//ALERTE !!! INTRUS !!!
	BehindYou					=	"SVM_9_BehindYou"					;//Derrière toi !
	TheresAFight				=	"SVM_9_TheresAFight"				;//Voyons s'ils sont bons ...
	HeyHeyHey					=	"SVM_9_HeyHeyHey"					;//Attention !
	CheerFight					=	"SVM_9_CheerFight"					;//Oui ! allez, viens !
	CheerFriend					=	"SVM_9_CheerFriend"					;//Bien !
	Ooh							=	"SVM_9_Ooh"							;//Oh, bien joué !
	YeahWellDone				=	"SVM_9_YeahWellDone"				;//Merveilleux contrôle, mon gars !
	RunCoward					=	"SVM_9_RunCoward"					;//Ne te remontre plus jamais ici !
	HeDefeatedHim				=	"SVM_9_HeDefeatedHim"				;//Le combat a été résolu.
	HeDeservedIt				=	"SVM_9_HeDeservedIt"				;//C'est notre propre faute !
	HeKilledHim					=	"SVM_9_HeKilledHim"					;//Ce n'était pas nécessaire. Tu devras en subir les conséquences.
	ItWasAGoodFight				=	"SVM_9_ItWasAGoodFight"				;//Ce fut un beau combat !
	Awake						=	"SVM_9_Awake"						;//Yawn
	FriendlyGreetings			=	"SVM_9_FriendlyGreetings"			;//Bonjour.
	ALGreetings					=	"SVM_9_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_9_MageGreetings"				;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_9_SectGreetings"				;//Éveille-toi !
	ThereHeIs					= 	"SVM_13_ThereHeIs"					;//Es-tu aveugle ? Par ici !
	NoLearnNoPoints				= 	"SVM_9_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'expérience.
	NoLearnOverMax				= 	"SVM_9_NoLearnOverMax"				;//Tu es à la limite de tes possibilités. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_9_NoLearnYouAlreadyKnow"		;//Tu as besoin de devenir un spécialiste avant de devenir un maître !
	NoLearnYoureBetter			=	"SVM_9_NoLearnYoureBetter"			;//Tu es déjà meilleur maintenant !
	HeyYou						=	"SVM_9_HeyYou"						;//Hé, toi !
	NotNow						=	"SVM_9_NotNow"						;//Pas maintenant.
	WhatDoYouWant				=	"SVM_9_WhatDoYouWant"				;//Qu'est-ce que tu veux ?
	ISaidWhatDoYouWant			=	"SVM_9_ISaidWhatDoYouWant"			;//Puis-je t'aider ?
	MakeWay						=	"SVM_9_MakeWay"						;//Laisse-moi passer !
	OutOfMyWay					=	"SVM_9_OutOfMyWay"					;//Écarte toi !
	YouDeafOrWhat				=	"SVM_9_YouDeafOrWhat"				;//Allez, hors de mon chemin !
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"		;//Encore des ennuis ? Pourquoi toujours moi ?
	LookAway					=	"SVM_9_LookAway"					;//Oh ouais ! Beau temps aujourd'hui !
	OkayKeepIt					=	"SVM_9_OkayKeepIt"					;//Bien ! C'est à toi.
	WhatsThat					=	"SVM_9_WhatsThat"					;//Qu'est-ce que c'était ?
	ThatsMyWeapon				=	"SVM_9_ThatsMyWeapon"				;//Je compte jusqu'à trois, après je viens chercher mon arme.
	GiveItToMe					=	"SVM_9_GiveItToMe"					;//Rend la moi ! une fois !
	YouCanKeeptheCrap			=	"SVM_9_YouCanKeeptheCrap"			;//Garde-la, je n'en pas besoin.
	TheyKilledMyFriend			=	"SVM_9_TheyKilledMyFriend"			;//Ils ont eu un de nos hommes. Si j'attrape ce pourceau...
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"		;//Ca va ?
	SuckerGotSome				=	"SVM_9_SuckerGotSome"				;//Hé ? Ton verre est poli ? Sert-toi en bien !
	SuckerDefeatedEBr			=	"SVM_9_SuckerDefeatedEBr"			;//Tu as vaincu Baron du minerai. Il a été impressionné !
	SuckerDefeatedGur			=	"SVM_9_SuckerDefeatedGur"			;//Tu as vaincu un des Sages. Je suis impressionné. Mais ne recommence plus jamais ça.
	SuckerDefeatedMage			=	"SVM_9_SuckerDefeatedMage"			;//Gagner contre un magicien... Tu dois être brave !
	SuckerDefeatedNov_Guard		= 	"SVM_9_SuckerDefeatedNov_Guard"		;//Tu dois être malade pour frapper un novice.
	SuckerDefeatedVlk_Guard		= 	"SVM_9_SuckerDefeatedVlk_Guard"		;//Que crois-tu faire, taper un mineur ?
	YouDefeatedMyComrade		=	"SVM_9_YouDefeatedMyComrade"		;//Tu a tapé mon ami, pourquoi ?
	YouDefeatedNOV_Guard		=	"SVM_9_YouDefeatedNOV_Guard"		;//Pose encore tes mains sur un novice et tu le regrettera !
	YouDefeatedVLK_Guard		=	"SVM_9_YouDefeatedVLK_Guard"		;//Tu es trop courageux, toucher à un de mes protégés peut être très dangereux.
	YouStoleFromMe				=	"SVM_9_YouStoleFromMe"				;//Tu oses revenir ici, sale voleur ?
	YouStoleFromUs				=	"SVM_9_YouStoleFromUs"				;//Voler nos gens est la pire erreur à faire ! Tu vas être désolé !
	YouStoleFromEBr				=	"SVM_9_YouStoleFromEBr"				;//Mec ! Tu as volé le Baron du minerai ! Ils seront fou de rage !
	YouStoleFromGur				=	"SVM_9_YouStoleFromGur"				;//Tu as soulagé les Sages de plusieurs objets, n'est-ce pas ?
	StoleFromMage				=	"SVM_9_StoleFromMage"				;//Tu as soulagé les magiciens de plusieurs objets, n'est-ce pas ?
	YouKilledMyFriend			=	"SVM_9_YouKilledMyFriend"			;//Tu as un de nos hommes sur la conscience. Une petite erreur de plus et c'est ton tour !
	YouKilledEBr				=	"SVM_9_YouKilledEBr"				;//Tu as tué le Baron du Minerai ! Mécréant, es-tu complètement fou !?
	YouKilledGur				=	"SVM_9_YouKilledGur"				;//Tu as tué un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_9_YouKilledMage"				;//Tu as tué un magicien ! Comment imagines-tu expliquer ça ?
	YouKilledOCfolk				=	"SVM_9_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom fut prononcé en rapport avec cet acte...
	YouKilledNCfolk				=	"SVM_9_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il apparaît que tu es impliqué !
	YouKilledPSIfolk			=	"SVM_9_YouKilledPSIfolk"			;//La Confrérie compte un croyant de moins, et tu l'as sur la conscience !
	GetThingsRight				=	"SVM_9_GetThingsRight"				;//ça ne fut pas facile de sortir de là !
	YouDefeatedMeWell			=	"SVM_9_YouDefeatedMeWell"			;//Un bon combat. Ton entraînement a été utile.
	Smalltalk01					=	"SVM_9_Smalltalk01"					;// ... oui, si tu le crois ...
	Smalltalk02					=	"SVM_9_Smalltalk02"					;// ... peut-être ...
	Smalltalk03					=	"SVM_9_Smalltalk03"					;// ... ce n'était pas très malin ...
	Smalltalk04					=	"SVM_9_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_9_Smalltalk05"					;// ... ce n'est vraiment pas mon problème ...
	Smalltalk06					=	"SVM_9_Smalltalk06"					;// ... c'était évident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_9_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_9_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_9_Smalltalk09"					;// ... il doit y avoir quelque chose derrière cette histoire après tout ...
	Smalltalk10					=	"SVM_9_Smalltalk10"					;// ... tu dois faire attention à ce que tu dis ...
	Smalltalk11					=	"SVM_9_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqué ...
	Smalltalk12					=	"SVM_9_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_9_Smalltalk13"					;// ... je n'aimerais pas être dans ses bottes ...
	Smalltalk14					=	"SVM_9_Smalltalk14"					;// ... toujours la vieille même histoire ...
	Smalltalk15					=	"SVM_9_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_9_Smalltalk16"					;// ... il fut un temps où les choses se seraient passées autrement ...
	Smalltalk17					=	"SVM_9_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_9_Smalltalk18"					;// ... Je n'écoute plus ces rumeurs ...
	Smalltalk19					=	"SVM_9_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_9_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_9_Smalltalk21"					;// ... ouais, tu as probablement raison ...
	Smalltalk22					=	"SVM_9_Smalltalk22"					;// ... Attends. Il vaut mieux ne pas se précipiter ...
	Smalltalk23					=	"SVM_9_Smalltalk23"					;// ... je pensais que c'était de l'histoire ancienne ...
	Smalltalk24					=	"SVM_9_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_9_Om"							;// Ommm   
};



instance SVM_10	(C_SVM)				// Schlau, verschlagen,	heimlich, Zwielichtig, zynisch,	intrigant Dealer (RAVEN, KALOM)
{
	StopMagic					=	"SVM_10_StopMagic"						;//Arrête cette sorcellerie !
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"					;//Arrête une fois pour toute !!!
	WeaponDown					=	"SVM_10_WeaponDown"						;//Range cette arme !
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"				;//Que crois-tu faire ? Tu me cherches ?
	WatchYourAim				=	"SVM_10_WatchYourAim"					;//Range cette arme ou tu vas être désolé !
	WatchYourAimAngry			=	"SVM_10_WatchYourAimAngry"				;//Si tu veux des ennuis, continue de me viser !
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"				;//Hé ! Attention ! Une de plus et tu es fais !
	LetsForgetOurLittleFight	=	"SVM_10_LetsForgetOurLittleFight"		;//Hé, mec ! Oublions ça, d'accord ?
	Strange						=	"SVM_10_Strange"						;//Sort de là ! Montre-toi !
	DieMonster					=	"SVM_10_DieMonster"						;//Sales bêtes !
	DieMortalEnemy				=	"SVM_10_DieMortalEnemy"					;//Maintenant tu es fais !
	NowWait						=	"SVM_10_NowWait"						;//C'est jour de paye !
	YouStillNotHaveEnough		=	"SVM_10_YouStillNotHaveEnough"			;//On dirait que tu veux être frappé !
	YouAskedForIt				=	"SVM_10_YouAskedForIt"					;//C'est toi qui l'a cherché !
	NowWaitIntruder				= 	"SVM_10_NowWaitIntruder"				;//Maintenant je te tiens, intrus !
	IWillTeachYouRespectForForeignProperty	=	"SVM_10_IWillTeachYouRespectForForeignProperty"	;//Je t'ai prévenu. Si tu touches à mes affaires, tu vas avoir des ennuis !
	DirtyThief					=	"SVM_10_DirtyThief"						;//Voleur ! Je vais t'achever !
	YouAttackedMyCharge			=	"SVM_10_YouAttackedMyCharge"			;//Personne n'attaque mes hommes !
	YouKilledOneOfUs			=	"SVM_10_YouKilledOneOfUs"				;//Tu as tué un de mes hommes. Maintenant je vais TE tuer !
	Dead						=	"SVM_10_Dead"							;//Aaargl
	Aargh_1						=	"SVM_10_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_10_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_10_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_10_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_10_YoullBeSorryForThis"			;//Tu vas le sentir passer ! Salopard !
	YesYes						=	"SVM_10_YesYes"							;//Ouais, ouais ! Ne panique pas ! Tu as gagné.
	ShitWhatAMonster			=	"SVM_10_ShitWhatAMonster"				;//Quel monstre, court aussi vite que possible !
	Help						=	"SVM_10_Help"							;//Retraite !
	WeWillMeetAgain				=	"SVM_10_WeWillMeetAgain"				;//Tu apprendras à me connaître !!
	NeverTryThatAgain			=	"SVM_10_NeverTryThatAgain"				;//Essaye encore et tu le regretteras.
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"				;//Cette arme est maintenant à moi !
	ITookYourOre				=	"SVM_10_ITookYourOre"					;//Je vais juste prendre un peu de ton minerai !
	ShitNoOre					=	"SVM_10_ShitNoOre"						;//Pas de minerai, enfer !
	HandsOff					=	"SVM_10_HandsOff"						;//Sale rat ! Enlève tes mains !
	GetOutOfHere				=	"SVM_10_GetOutOfHere"					;//Sorte d'ici !
	YouViolatedForbiddenTerritory=	"SVM_10_YouViolatedForbiddenTerritory"	;//Hé ! D'où sors-tu ?
	YouWannaFoolMe				=	"SVM_10_YouWannaFoolMe"					;//Tu dois vraiment penser que je suis stupide !
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"			;//Hé, toi ! Qu'est-ce que tu fouines par là ?
	WhyAreYouInHere				=	"SVM_10_WhyYouAreInHere"				;//Sors ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_10_WhatDidYouInThere"				;//Qu'est ce que tu faisais ici ?
	WiseMove					=	"SVM_10_WiseMove"						;//Tu as eu de la chance.
	Alarm						=	"SVM_10_Alarm"							;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_10_IntruderAlert"					;//ALERTE !!! INTRUS !!!
	BehindYou					=	"SVM_10_BehindYou"						;//Derrière toi !
	TheresAFight				=	"SVM_10_TheresAFight"					;//Ah, un combat !
	HeyHeyHey					=	"SVM_10_HeyHeyHey"						;//Plus fort !
	CheerFight					=	"SVM_10_CheerFight"						;//Pas de pitié !
	CheerFriend					=	"SVM_10_CheerFriend"					;//Fini le !!
	Ooh							=	"SVM_10_Ooh"							;//Ne me cherche pas !
	YeahWellDone				=	"SVM_10_YeahWellDone"					;//Frappe le à la figure !
	RunCoward					=	"SVM_10_RunCoward"						;//Lâche, revient !
	HeDefeatedHim				=	"SVM_10_HeDefeatedHim"					;//Une petite brise et il tombera tout seul.
	HeDeservedIt				=	"SVM_10_HeDeservedIt"					;//Fait-lui voir !
	HeKilledHim					=	"SVM_10_HeKilledHim"					;//Tu es aussi bien mort ! ça t'apprendra à tuer les gens.
	ItWasAGoodFight				=	"SVM_10_ItWasAGoodFight"				;//Tu lui a donné une bonne leçon !
	Awake						=	"SVM_10_Awake"							;//Yawn
	FriendlyGreetings			=	"SVM_10_FriendlyGreetings"				;//Bonjour.
	ALGreetings					=	"SVM_10_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_10_MageGreetings"					;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_10_SectGreetings"					;//Éveille-toi !
	ThereHeIs					= 	"SVM_10_ThereHeIs"						;//Il est là.
	NoLearnNoPoints				= 	"SVM_10_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'expérience.
	NoLearnOverMax				= 	"SVM_10_NoLearnOverMax"					;//Tu es à la limite de tes possibilités. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_10_NoLearnYouAlreadyKnow"			;//Tu as besoin de devenir un spécialiste avant de devenir un maître !
	NoLearnYoureBetter			=	"SVM_10_NoLearnYoureBetter"				;//Tu es déjà meilleur maintenant !
	HeyYou						=	"SVM_10_HeyYou"							;//Hé, toi !
	NotNow						=	"SVM_10_NotNow"							;//Pas maintenant.
	WhatDoYouWant				=	"SVM_10_WhatDoYouWant"					;//Qu'est-ce que tu veux ?
	ISaidWhatDoYouWant			=	"SVM_10_ISaidWhatDoYouWant"				;//Puis-je t'aider ?
	MakeWay						=	"SVM_10_MakeWay"						;//Laisse moi passer.
	OutOfMyWay					=	"SVM_10_OutOfMyWay"						;//Hors de mon chemin !
	YouDeafOrWhat				=	"SVM_10_YouDeafOrWhat"					;//Tu veux que je te frappe la tête ? Sors de là !
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"			;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_10_LookAway"						;//Je ne suis pas vraiment ici ...
	OkayKeepIt					=	"SVM_10_OkayKeepIt"						;//Garde les !
	WhatsThat					=	"SVM_10_WhatsThat"						;//Qu'est-ce que c'était ?
	ThatsMyWeapon				=	"SVM_10_ThatsMyWeapon"					;//Rend moi mon arme !
	GiveItToMe					=	"SVM_10_GiveItToMe"						;//Rend-la moi !
	YouCanKeeptheCrap			=	"SVM_10_YouCanKeeptheCrap"				;//Prend la. Je n'en ai pas besoin.
	TheyKilledMyFriend			=	"SVM_10_TheyKilledMyFriend"				;//Ils ont eu un de nos hommes. ça me rend très en colère !
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"			;//Pourquoi m'as-tu réveillé ?
	SuckerGotSome				=	"SVM_10_SuckerGotSome"					;//Hé ? Ton verre est poli ? Sert-toi en bien !
	SuckerDefeatedEBr			=	"SVM_10_SuckerDefeatedEBr"				;//Tu as frappé un Baron du minerai !
	SuckerDefeatedGur			=	"SVM_10_SuckerDefeatedGur"				;//Tu as vaincu un des Sages.
	SuckerDefeatedMage			=	"SVM_10_SuckerDefeatedMage"				;//Gagner contre un magicien ...
	SuckerDefeatedNov_Guard		= 	"SVM_10_SuckerDefeatedNov_Guard"		;//Tu devrais te renseigner sur les personnes que tu attaques, avant de frapper des novices !
	SuckerDefeatedVlk_Guard		= 	"SVM_10_SuckerDefeatedVlk_Guard"		;//J'ai besoin de maintenir l'ordre ici ! Laisse mes gens tranquilles !
	YouDefeatedMyComrade		=	"SVM_10_YouDefeatedMyComrade"			;//Tu as tabassé mon ami.
	YouDefeatedNOV_Guard		=	"SVM_10_YouDefeatedNOV_Guard"			;//Pose encore tes mains sur un novice et tu le regrettera !
	YouDefeatedVLK_Guard		=	"SVM_10_YouDefeatedVLK_Guard"			;//Toucher à un de mes protégés va te coûter cher.
	YouStoleFromMe				=	"SVM_10_YouStoleFromMe"					;//N'essaye plus ça, voleur !
	YouStoleFromUs				=	"SVM_10_YouStoleFromUs"					;//Tu nous as pris des choses. Tu ferais mieux de les rendre.
	YouStoleFromEBr				=	"SVM_10_YouStoleFromEBr"				;//Mec ! Tu as volé le minerai des Barons ! Ils seront furieux !
	YouStoleFromGur				=	"SVM_10_YouStoleFromGur"				;//Tu as soulagé les Sages de plusieurs choses. Ce n'est pas très malin de se faire attraper en faisant cela !
	StoleFromMage				=	"SVM_10_StoleFromMage"					;//Tu as soulagé les magiciens de plusieurs objets, n'est-ce pas ?
	YouKilledMyFriend			=	"SVM_10_YouKilledMyFriend"				;//Tu as un de nos hommes sur la conscience. Une autre petite erreur et c'est ton tour !
	YouKilledEBr				=	"SVM_10_YouKilledEBr"					;//Tu as tué le Baron du Minerai ! Mécréant, es-tu complètement fou !?
	YouKilledGur				=	"SVM_10_YouKilledGur"					;//Tu as tué un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_10_YouKilledMage"					;//Tu as tué un magicien ! Comment expliques-tu ça ?
	YouKilledOCfolk				=	"SVM_10_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom a été mentionné en rapport à cette affaire ...
	YouKilledNCfolk				=	"SVM_10_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il apparaît que tu es impliqué !
	YouKilledPSIfolk			=	"SVM_10_YouKilledPSIfolk"				;//La Confrérie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_10_GetThingsRight"					;//ça ne fut pas facile de sortir de là !
	YouDefeatedMeWell			=	"SVM_10_YouDefeatedMeWell"				;//Félicitations ! Tu as gagné. Ce fut un bon combat.
	Smalltalk01					=	"SVM_10_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_10_Smalltalk02"					;// ... peut-être ...
	Smalltalk03					=	"SVM_10_Smalltalk03"					;// ... ce n'était pas très malin ...
	Smalltalk04					=	"SVM_10_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_10_Smalltalk05"					;// ... ce n'est vraiment pas mon problème ...
	Smalltalk06					=	"SVM_10_Smalltalk06"					;// ... c'était évident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_10_Smalltalk07"					;// ... mais garde le pour toi, les gens n'ont pas besoin de savoir.
	Smalltalk08					=	"SVM_10_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_10_Smalltalk09"					;// ... il doit y avoir quelque chose derrière cette histoire après tout ...
	Smalltalk10					=	"SVM_10_Smalltalk10"					;// ... tu devrais faire attention à qui tu parles ...
	Smalltalk11					=	"SVM_10_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqué ...
	Smalltalk12					=	"SVM_10_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_10_Smalltalk13"					;// ... je n'aimerais pas être dans ses bottes ...
	Smalltalk14					=	"SVM_10_Smalltalk14"					;// ... toujours la vieille même histoire ...
	Smalltalk15					=	"SVM_10_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_10_Smalltalk16"					;// ... il fut un temps où les choses se seraient passées autrement ...
	Smalltalk17					=	"SVM_10_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_10_Smalltalk18"					;// ... je n'écoute plus tes sornettes désormais ...
	Smalltalk19					=	"SVM_10_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_10_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_10_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_10_Smalltalk22"					;// ... Attends. Il vaut mieux ne pas se précipiter ...
	Smalltalk23					=	"SVM_10_Smalltalk23"					;// ... je pensais que c'était de l'histoire ancienne ...
	Smalltalk24					=	"SVM_10_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_10_Om"							;//Ommm
};



//////////////////////////////////////////
instance SVM_11	(C_SVM)				//Profi				Ruhig, abgezockt, Vernünftig aberknallhart
{
	StopMagic					=	"SVM_11_StopMagic"						;//n'essaie pas de sorcellerie sur moi !
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"					;//Arrête, j'ai dit ! Une fois !
	WeaponDown					=	"SVM_11_WeaponDown"						;//Si tu cherches les ennuis tu n'as qu'à venir !
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Éloigne ça de moi ou tu es fais !
	WatchYourAim				=	"SVM_11_WatchYourAim"					;//Pose ce truc !
	WatchYourAimAngry			=	"SVM_11_WatchYourAimAngry"				;//Alors tu me cherches ? Tu es sûr ?
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//Qu'est-ce que tu fais ! Arrête ça !
	LetsForgetOurLittleFight	=	"SVM_11_LetsForgetOurLittleFight"		;//D'accord, oublions cela.
	Strange						=	"SVM_11_Strange"						;//Mmh ! Enfer ! Où est-il passé ?
	DieMonster					=	"SVM_11_DieMonster"						;//Ils mourront s'ils restent sur mon chemin !
	DieMortalEnemy				=	"SVM_11_DieMortalEnemy"					;//Si tu te fais des ennemis tu dois être capable de les maintenir. Meurt.
	NowWait						=	"SVM_11_NowWait"						;//Tu n'aurais pas dû faire ça !
	YouStillNotHaveEnough		=	"SVM_11_YouStillNotHaveEnough"			;//Je ne t'ai pas fait mordre la poussière une fois ? Alors reprend ça ...
	YouAskedForIt				=	"SVM_11_YouAskedForIt"					;//Si tu n'écoutes pas, tu vas le regretter !
	NowWaitIntruder				= 	"SVM_11_NowWaitIntruder"				;//Hé intrus. Maintenant tu vas avoir ta leçon !
	IWillTeachYouRespectForForeignProperty	=	"SVM_11_IWillTeachYouRespectForForeignProperty"	;//Suppose que je doive briser tes doigts !
	DirtyThief					=	"SVM_11_DirtyThief"						;//Volé n'est pas louable !
	YouAttackedMyCharge			=	"SVM_11_YouAttackedMyCharge"			;//Tu causes des soucis dans ma zone ! Maintenant je vais en finir !
	YouKilledOneOfUs			=	"SVM_11_YouKilledOneOfUs"				;//Tuer un des autres sera ta dernière erreur !
	Dead						=	"SVM_11_Dead"							;//Aaargl
	Aargh_1						=	"SVM_11_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_11_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_11_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_11_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_11_YoullBeSorryForThis"			;//Tu n'aurais pas dû faire ça !
	YesYes						=	"SVM_11_YesYes"							;//D'accord, d'accord ! Tu as gagné !
	ShitWhatAMonster			=	"SVM_11_ShitWhatAMonster"				;//Il est trop fort pour moi !
	Help						=	"SVM_11_Help"							;//Retraite !
	WeWillMeetAgain				=	"SVM_11_WeWillMeetAgain"				;//Voilà les conséquences, mon gars !
	NeverTryThatAgain			=	"SVM_11_NeverTryThatAgain"				;//N'essaye pas de nouveau !
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Je prendrai plus soins de ton arme que toi !
	ITookYourOre				=	"SVM_11_ITookYourOre"					;//C'est gentil de me laisser un peu de minerai !
	ShitNoOre					=	"SVM_11_ShitNoOre"						;//Rien, pas de minerai !
	HandsOff					=	"SVM_11_HandsOff"						;//Enlève tes sales pattes !
	GetOutOfHere				=	"SVM_11_GetOutOfHere"					;//Hors d'ici ou je vais te faire courir !
	YouViolatedForbiddenTerritory=	"SVM_11_YouViolatedForbiddenTerritory"	;//Hé, comment es-tu entré ici ?
	YouWannaFoolMe				=	"SVM_11_YouWannaFoolMe"					;//Pas avec moi, mon gars !
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"			;//Qu'est ce que c'est supposé être ?
	WhyAreYouInHere				=	"SVM_11_WhyYouAreInHere"				;//C'est ma cabane. Dehors ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_11_WhatDidYouInThere"				;//Que fais-tu là ? Ouste avant que je m'énerve !
	WiseMove					=	"SVM_11_WiseMove"						;//Bien ! Ne recommence plus !
	Alarm						=	"SVM_11_Alarm"							;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_11_IntruderAlert"					;//ALERTE !!! INTRUS !!!
	BehindYou					=	"SVM_11_BehindYou"						;//Derrière toi !
	TheresAFight				=	"SVM_11_TheresAFight"					;//Voyons qui va gagner cette fois !
	HeyHeyHey					=	"SVM_11_HeyHeyHey"						;//Allez, vas-y !
	CheerFight					=	"SVM_11_CheerFight"						;//Arrête de jouer !
	CheerFriend					=	"SVM_11_CheerFriend"					;//Oh allez, tu peux le battre, non ?
	Ooh							=	"SVM_11_Ooh"							;//Ouh ! Pas si bien que ça !
	YeahWellDone				=	"SVM_11_YeahWellDone"					;//Mmh ! Pas mal.
	RunCoward					=	"SVM_11_RunCoward"						;//Ne te remontre plus jamais ici !
	HeDefeatedHim				=	"SVM_11_HeDefeatedHim"					;//Joli coup !
	HeDeservedIt				=	"SVM_11_HeDeservedIt"					;//ça ne fait rien ! Il en est digne !
	HeKilledHim					=	"SVM_11_HeKilledHim"					;//Tu l'a tué ! ça signifie de gros problèmes !
	ItWasAGoodFight				=	"SVM_11_ItWasAGoodFight"				;//Bien joué ! Une belle performance !
	Awake						=	"SVM_11_Awake"							;//Yawn
	FriendlyGreetings			=	"SVM_11_FriendlyGreetings"				;//Bonjour.
	ALGreetings					=	"SVM_11_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_11_MageGreetings"					;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_11_SectGreetings"					;//Éveille-toi !
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Es-tu aveugle ? Par ici !
	NoLearnNoPoints				= 	"SVM_11_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'expérience.
	NoLearnOverMax				= 	"SVM_11_NoLearnOverMax"					;//Tu es à la limite de tes possibilités. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_11_NoLearnYouAlreadyKnow"			;//Tu as besoin de devenir un spécialiste avant de devenir un maître !
	NoLearnYoureBetter			=	"SVM_11_NoLearnYoureBetter"				;//Tu vaut mieux que ça !
	HeyYou						=	"SVM_11_HeyYou"							;//Hé, toi !
	NotNow						=	"SVM_11_NotNow"							;//Pas maintenant.
	WhatDoYouWant				=	"SVM_11_WhatDoYouWant"					;//Qu'est-ce que tu veux ?
	ISaidWhatDoYouWant			=	"SVM_11_ISaidWhatDoYouWant"				;//Puis-je faire quelque chose pour toi ?
	MakeWay						=	"SVM_11_MakeWay"						;//Je peux passer ?
	OutOfMyWay					=	"SVM_11_OutOfMyWay"						;//Écarte toi !
	YouDeafOrWhat				=	"SVM_11_YouDeafOrWhat"					;//Tu veux que je te frappe la tête ? Sors de là !
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"			;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_11_LookAway"						;//Je ne veux pas être mêlé à ça !
	OkayKeepIt					=	"SVM_11_OkayKeepIt"						;//Bien ! C'est à toi.
	WhatsThat					=	"SVM_11_WhatsThat"						;//Qu'est-ce que c'était ?
	ThatsMyWeapon				=	"SVM_11_ThatsMyWeapon"					;//Tu portes mon arme ... ?
	GiveItToMe					=	"SVM_11_GiveItToMe"						;//Aller, donne-la-moi !
	YouCanKeeptheCrap			=	"SVM_11_YouCanKeeptheCrap"				;//Garde-la, je n'en pas besoin.
	TheyKilledMyFriend			=	"SVM_11_TheyKilledMyFriend"				;//Ils ont eu un de nos hommes. Si j'attrape ce pourceau...
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"			;//Qu'est-ce qui se passe, de toute façon ?
	SuckerGotSome				=	"SVM_11_SuckerGotSome"					;//Qu'est ce que tu fais ? Sers toi en bien !
	SuckerDefeatedEBr			=	"SVM_11_SuckerDefeatedEBr"				;//Tu as battu un des Barons du minerai. C'était impressionnant, mais stupide. très stupide en fait.
	SuckerDefeatedGur			=	"SVM_11_SuckerDefeatedGur"				;//Tu as vaincu un des Sages.
	SuckerDefeatedMage			=	"SVM_11_SuckerDefeatedMage"				;//Gagner contre un magicien ... n'est pas exactement malin !
	SuckerDefeatedNov_Guard		= 	"SVM_11_SuckerDefeatedNov_Guard"		;//Je protège les gens ici, tu en as frappé un ...
	SuckerDefeatedVlk_Guard		= 	"SVM_11_SuckerDefeatedVlk_Guard"		;//Si tu touches au mineurs, tu auras affaire à moi !
	YouDefeatedMyComrade		=	"SVM_11_YouDefeatedMyComrade"			;//Quiconque frappe mes hommes me frappe moi.
	YouDefeatedNOV_Guard		=	"SVM_11_YouDefeatedNOV_Guard"			;//Pose encore tes mains sur un novice et tu le regrettera !
	YouDefeatedVLK_Guard		=	"SVM_11_YouDefeatedVLK_Guard"			;//Attaqué mes protégés peux-te coûter ta tête.
	YouStoleFromMe				=	"SVM_11_YouStoleFromMe"					;//Tu oses revenir ici, sale voleur ?
	YouStoleFromUs				=	"SVM_11_YouStoleFromUs"					;//Tu as des affaires qui nous appartienne. Tu ferais mieux de les rendre.
	YouStoleFromEBr				=	"SVM_11_YouStoleFromEBr"				;//Mec ! Tu as volé du minerai au Baron ! Ils vont être furieux !
	YouStoleFromGur				=	"SVM_11_YouStoleFromGur"				;//Tu as soulagé les Sages de plusieurs objets, n'est-ce pas ?
	StoleFromMage				=	"SVM_11_StoleFromMage"					;//Tu as soulagé les magiciens de plusieurs objets, n'est-ce pas ?
	YouKilledMyFriend			=	"SVM_11_YouKilledMyFriend"				;//Tu as violé les règles numéro 1 ! Pas de meurtre !
	YouKilledEBr				=	"SVM_11_YouKilledEBr"					;//Tu as tué le Baron du Minerai ! Mécréant, es-tu complètement fou !?
	YouKilledGur				=	"SVM_11_YouKilledGur"					;//Tu as tué un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_11_YouKilledMage"					;//Tu as tué un magicien ! Comment expliques-tu ça ?
	YouKilledOCfolk				=	"SVM_11_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom a été mentionné en rapport à cette affaire ...
	YouKilledNCfolk				=	"SVM_11_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il apparaît que tu es impliqué !
	YouKilledPSIfolk			=	"SVM_11_YouKilledPSIfolk"				;//La Confrérie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_11_GetThingsRight"					;//ça ne fut pas facile de sortir de là !
	YouDefeatedMeWell			=	"SVM_11_YouDefeatedMeWell"				;//C'était un beau combat. Je sentirai la douleur pendant plusieurs jours. Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_11_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_11_Smalltalk02"					;// ... peut-être ...
	Smalltalk03					=	"SVM_11_Smalltalk03"					;// ... ce n'était pas très malin ...
	Smalltalk04					=	"SVM_11_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_11_Smalltalk05"					;// ... ce n'est vraiment pas mon problème ...
	Smalltalk06					=	"SVM_11_Smalltalk06"					;// ... c'était évident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_11_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_11_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_11_Smalltalk09"					;// ... il doit y avoir du vrai dans cette histoire après tout...
	Smalltalk10					=	"SVM_11_Smalltalk10"					;// ... tu dois faire attention à ce que tu dis ...
	Smalltalk11					=	"SVM_11_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqué …Je
	Smalltalk12					=	"SVM_11_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_11_Smalltalk13"					;// ... je ne voudrais pas être à sa place car il
	Smalltalk14					=	"SVM_11_Smalltalk14"					;// ... c'est la même histoire tout le temps …Je
	Smalltalk15					=	"SVM_11_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_11_Smalltalk16"					;// ... Hé bien, autrefois ça ne se serait pas passé comme ça ...
	Smalltalk17					=	"SVM_11_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_11_Smalltalk18"					;// ... je n'écoute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_11_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_11_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_11_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_11_Smalltalk22"					;// ... Attends. Il vaut mieux ne pas se précipiter ...
	Smalltalk23					=	"SVM_11_Smalltalk23"					;// ... je pensais que c'était de l'histoire ancienne ...
	Smalltalk24					=	"SVM_11_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_11_Om"								;//Ommm
};


instance SVM_12	(C_SVM)		//Bazaar-Händler		Nach außen freundlich,jovial,Innen hinterhältig, raffgierig
{
	StopMagic					=	"SVM_12_StopMagic"						;//Arrête cette magie !
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"					;//Quand je dis 'arrête cette magie', tu le fais !
	WeaponDown					=	"SVM_12_WeaponDown"						;//Que veux-tu faire avec cette arme, mec !
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"				;//Pose ce truc !
	WatchYourAim				=	"SVM_12_WatchYourAim"					;//Tu es en train de me viser !
	WatchYourAimAngry			=	"SVM_12_WatchYourAimAngry"				;//Si tu te t'arrêtes pas tu vas avoir des ennuis !
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"				;//Hé, t'es aveugle ou quoi ?
	LetsForgetOurLittleFight	=	"SVM_12_LetsForgetOurLittleFight"		;//Oublions ce petit argument, d'accord ?
	Strange						=	"SVM_12_Strange"						;//Mais il était juste ici à l'instant !? Étrange !
	DieMonster					=	"SVM_12_DieMonster"						;//Ton heure est venue, salopard !!
	DieMortalEnemy				=	"SVM_12_DieMortalEnemy"					;//C'est jour de paye !
	NowWait						=	"SVM_12_NowWait"						;//Tu veux vraiment te battre !
	YouStillNotHaveEnough		=	"SVM_12_YouStillNotHaveEnough"			;//Tu n'en as pas eu assez ?
	YouAskedForIt				=	"SVM_12_YouAskedForIt"					;//D'accord, tu l'a cherché !
	NowWaitIntruder				= 	"SVM_12_NowWaitIntruder"				;//Ils vont te jeter dehors !
	IWillTeachYouRespectForForeignProperty	=	"SVM_12_IWillTeachYouRespectForForeignProperty"	;//Je t'ai prévenu. Si tu touches à mes affaires, tu vas avoir des ennuis !
	DirtyThief					=	"SVM_12_DirtyThief"						;//Voleur ! Je vais t'apprendre les bonnes manières !
	YouAttackedMyCharge			=	"SVM_12_YouAttackedMyCharge"			;//Personne ne frappe mes hommes sans être désolé après !
	YouKilledOneOfUs			=	"SVM_12_YouKilledOneOfUs"				;//Tu as tué un de mes hommes. Maintenant je vais TE tuer !
	Dead						=	"SVM_12_Dead"							;//Aaargl
	Aargh_1						=	"SVM_12_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_12_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_12_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_12_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_12_YoullBeSorryForThis"			;//Tu le regretteras !
	YesYes						=	"SVM_12_YesYes"							;//Tranquille ! Tu as gagné.
	ShitWhatAMonster			=	"SVM_12_ShitWhatAMonster"				;//C'est trop pour moi, j'arrête !
	Help						=	"SVM_12_Help"							;//Malédiction !
	WeWillMeetAgain				=	"SVM_12_WeWillMeetAgain"				;//La prochaine fois, ce sera différent !
	NeverTryThatAgain			=	"SVM_12_NeverTryThatAgain"				;//N'essaye pas de nouveau !
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"				;//J'aime cette arme !
	ITookYourOre				=	"SVM_12_ITookYourOre"					;//Je ferais en sorte que ton minerai soit bien investi !
	ShitNoOre					=	"SVM_12_ShitNoOre"						;//Enfer ! Pas de minerai !
	HandsOff					=	"SVM_12_HandsOff"						;//Lâche ça !
	GetOutOfHere				=	"SVM_12_GetOutOfHere"					;//Sorte d'ici !
	YouViolatedForbiddenTerritory=	"SVM_12_YouViolatedForbiddenTerritory";//Hé ! D'où sors-tu ?
	YouWannaFoolMe				=	"SVM_12_YouWannaFoolMe"					;//Tu me crois stupide ?!
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"			;//Où te faufiles-tu comme ça ?
	WhyAreYouInHere				=	"SVM_12_WhyYouAreInHere"				;//Hors d'ici ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_12_WhatDidYouInThere"				;//Tu n'as rien a faire ici !
	WiseMove					=	"SVM_12_WiseMove"						;//Tu apprends vite !
	Alarm						=	"SVM_12_Alarm"							;//Gardes ! Par ici !
	IntruderAlert				= 	"SVM_12_IntruderAlert"					;//ALERTE !!!!
	BehindYou					=	"SVM_12_BehindYou"						;//Hé la !
	TheresAFight				=	"SVM_12_TheresAFight"					;//Un combat !
	HeyHeyHey					=	"SVM_12_HeyHeyHey"						;//Frappez-le !
	CheerFight					=	"SVM_12_CheerFight"						;//Bien !
	CheerFriend					=	"SVM_12_CheerFriend"					;//Frappez-le encore maintenant !
	Ooh							=	"SVM_12_Ooh"							;//Attention !
	YeahWellDone				=	"SVM_12_YeahWellDone"					;//C'était juste !
	RunCoward					=	"SVM_12_RunCoward"						;//Ce gars se faufile !
	HeDefeatedHim				=	"SVM_12_HeDefeatedHim"					;//Bon gagnant, je dirai !
	HeDeservedIt				=	"SVM_12_HeDeservedIt"					;//Il l'a mérité !
	HeKilledHim					=	"SVM_12_HeKilledHim"					;//Tu tue les gens. Tu vas avoir des ennuis !
	ItWasAGoodFight				=	"SVM_12_ItWasAGoodFight"				;//Quel combat !
	Awake						=	"SVM_12_Awake"							;//Yawn
	FriendlyGreetings			=	"SVM_12_FriendlyGreetings"				;//Bonjour, ami !
	ALGreetings					=	"SVM_12_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_12_MageGreetings"					;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_12_SectGreetings"					;//Éveille-toi !
	ThereHeIs					= 	"SVM_12_ThereHeIs"						;//Par ici.
	NoLearnNoPoints				= 	"SVM_12_NoLearnNoPoints"				;//Je ne peux t'apprendre rien du tout car tu es trop inexpérimenté.
	NoLearnOverMax				= 	"SVM_12_NoLearnOverMax"					;//Tu es à la limite de tes possibilités. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_12_NoLearnYouAlreadyKnow"			;//Tu as besoin de devenir un spécialiste avant de devenir un maître !
	NoLearnYoureBetter			=	"SVM_12_NoLearnYoureBetter"				;//Tu es déjà meilleur maintenant !
	HeyYou						=	"SVM_12_HeyYou"							;//Hé, toi !
	NotNow						=	"SVM_12_NotNow"							;//Pas maintenant.
	WhatDoYouWant				=	"SVM_12_WhatDoYouWant"					;//Puis-je t'aider ?
	ISaidWhatDoYouWant			=	"SVM_12_ISaidWhatDoYouWant"				;//Qu'est-ce que tu veux ?
	MakeWay						=	"SVM_12_MakeWay"						;//Laisse moi passer.
	OutOfMyWay					=	"SVM_12_OutOfMyWay"						;//Allez, laisse-moi passer !
	YouDeafOrWhat				=	"SVM_12_YouDeafOrWhat"					;//Es-tu idiot ou cherches-tu les ennuis ?
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"			;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_12_LookAway"						;//Quelque chose est arrivé ? Je n'ai RIEN vu ...
	OkayKeepIt					=	"SVM_12_OkayKeepIt"						;//D'accord, garde-la !
	WhatsThat					=	"SVM_12_WhatsThat"						;//Qu'est-ce que c'était ?
	ThatsMyWeapon				=	"SVM_12_ThatsMyWeapon"					;//J'aimerai vraiment avoir mon arme !
	GiveItToMe					=	"SVM_12_GiveItToMe"						;//Donne la moi !
	YouCanKeeptheCrap			=	"SVM_12_YouCanKeeptheCrap"				;//Hmm, ce n'est pas si mauvais ! J'en veux plus !
	TheyKilledMyFriend			=	"SVM_12_TheyKilledMyFriend"				;//Ils ont eu un de nos hommes. Si j'attrape ce pourceau...
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"			;//Hm, quoi ? Pourquoi me réveilles-tu ?
	SuckerGotSome				=	"SVM_12_SuckerGotSome"					;//Hé ? Ton verre est poli ? Sert-toi en bien !
	SuckerDefeatedEBr			=	"SVM_12_SuckerDefeatedEBr"				;//Tu as vaincu Baron du minerai. Il a été impressionné !
	SuckerDefeatedGur			=	"SVM_12_SuckerDefeatedGur"				;//Tu as vaincu un des Sages. Je suis impressionné. Mais ne recommence plus jamais ça.
	SuckerDefeatedMage			=	"SVM_12_SuckerDefeatedMage"				;//Gagner contre un magicien... Tu dois être brave !
	SuckerDefeatedNov_Guard		= 	"SVM_12_SuckerDefeatedNov_Guard"		;//Tu dois être malade d'avoir frappé un novice comme ça.
	SuckerDefeatedVlk_Guard		= 	"SVM_12_SuckerDefeatedVlk_Guard"		;//Que crois-tu faire, taper un mineur ?
	YouDefeatedMyComrade		=	"SVM_12_YouDefeatedMyComrade"			;//Tu a tapé mon ami, pourquoi ?
	YouDefeatedNOV_Guard		=	"SVM_12_YouDefeatedNOV_Guard"			;//Pose encore tes mains sur un novice et tu le regrettera !
	YouDefeatedVLK_Guard		=	"SVM_12_YouDefeatedVLK_Guard"			;//Tu es trop courageux, toucher à un de mes protégés peut être très dangereux.
	YouStoleFromMe				=	"SVM_12_YouStoleFromMe"					;//Tu oses revenir ici, sale voleur ?
	YouStoleFromUs				=	"SVM_12_YouStoleFromUs"					;//Tu nous as pris des choses. Tu ferais mieux de les rendre.
	YouStoleFromEBr				=	"SVM_12_YouStoleFromEBr"				;//Mec ! Tu as volé le Baron du minerai ! Ils seront fou de rage !
	YouStoleFromGur				=	"SVM_12_YouStoleFromGur"				;//Tu as volé les Sages ? Tu ne t'es pas fait attrapé au moins !
	StoleFromMage				=	"SVM_12_StoleFromMage"					;//Les magiciens n'aiment pas les gens qui fouinent autour de leurs affaires !
	YouKilledMyFriend			=	"SVM_12_YouKilledMyFriend"				;//Tu as un de nos hommes sur la conscience. Une autre petite erreur et c'est ton tour !
	YouKilledEBr				=	"SVM_12_YouKilledEBr"					;//Tu as tué un Baron du minerai ? Mec, es-tu complètement fou !?
	YouKilledGur				=	"SVM_12_YouKilledGur"					;//Tu as tué un Sage ? Mon gars, Je le crois pas !
	YouKilledMage				=	"SVM_12_YouKilledMage"					;//Tu as tué un magicien ! Comment expliques-tu ça ?
	YouKilledOCfolk				=	"SVM_12_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom fut prononcé en rapport avec cet acte...
	YouKilledNCfolk				=	"SVM_12_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il apparaît que tu es impliqué !
	YouKilledPSIfolk			=	"SVM_12_YouKilledPSIfolk"				;//La Confrérie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_12_GetThingsRight"					;//ça ne fut pas facile de sortir de là !
	YouDefeatedMeWell			=	"SVM_12_YouDefeatedMeWell"				;//D'accord, tu m'as battu. C'était un beau combat ! Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_12_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_12_Smalltalk02"					;// ... peut-être ...
	Smalltalk03					=	"SVM_12_Smalltalk03"					;// ... ce n'était pas très malin ...
	Smalltalk04					=	"SVM_12_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_12_Smalltalk05"					;// ... ce n'est vraiment pas mon problème ...
	Smalltalk06					=	"SVM_12_Smalltalk06"					;// ... c'était évident qu'il aurait encore des ennuis ...
	Smalltalk07					=	"SVM_12_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_12_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_12_Smalltalk09"					;// ... il doit y avoir quelque chose derrière cette histoire après tout ...
	Smalltalk10					=	"SVM_12_Smalltalk10"					;// ... tu dois faire attention à ce que tu dis ...
	Smalltalk11					=	"SVM_12_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqué ...
	Smalltalk12					=	"SVM_12_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_12_Smalltalk13"					;// ... je n'aimerais pas être dans ses bottes ...
	Smalltalk14					=	"SVM_12_Smalltalk14"					;// ... toujours la vieille même histoire ...
	Smalltalk15					=	"SVM_12_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_12_Smalltalk16"					;// ... il fut un temps où les choses se seraient passées autrement ...
	Smalltalk17					=	"SVM_12_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_12_Smalltalk18"					;// ... je n'écoute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_12_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_12_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_12_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_12_Smalltalk22"					;// ... attends. Il ne faut pas se précipiter ...
	Smalltalk23					=	"SVM_12_Smalltalk23"					;// ... je pensais que c'était de l'histoire ancienne ...
	Smalltalk24					=	"SVM_12_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_12_Om"							;//Ommm
};


instance SVM_13	(C_SVM)					// Fanatiker	Agressiv, übereifrig, Ähnlich wie Stimme7Freak,	aber klarer, Ruhm-und-Ehre-Typ,	Nov: Glauben an	Y´berion blind,	Mitläufer
{
	StopMagic					=	"SVM_13_StopMagic"						;//Arrête ta sorcellerie !
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"					;//Éloigne-toi, éloigne-TOI !!
	WeaponDown					=	"SVM_13_WeaponDown"						;//Range cette arme !
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"				;//Rengaine cette arme !
	WatchYourAim				=	"SVM_13_WatchYourAim"					;//Me vises-tu ? Attention !
	WatchYourAimAngry			=	"SVM_13_WatchYourAimAngry"				;//Tu es en train de signer ton arrêt de mort. Tu ferais mieux de viser autre chose !
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"				;//En quoi ça aide ?!
	LetsForgetOurLittleFight	=	"SVM_13_LetsForgetOurLittleFight"		;//Oublions cet argument, d'accord ?
	Strange						=	"SVM_13_Strange"						;//Où est-il passé ? ça ne se peut !
	DieMonster					=	"SVM_13_DieMonster"						;//Cette nuit nous allons avoir de la viande !
	DieMortalEnemy				=	"SVM_13_DieMortalEnemy"					;//C'est ton tour maintenant ! Pas de pitié !
	NowWait						=	"SVM_13_NowWait"						;//C'est une bonne cachette ...
	YouStillNotHaveEnough		=	"SVM_13_YouStillNotHaveEnough"			;//Tu ne veux plus essayer, n'est-ce pas ?
	YouAskedForIt				=	"SVM_13_YouAskedForIt"					;//Tu l'as cherché !
	NowWaitIntruder				= 	"SVM_13_NowWaitIntruder"				;//Maintenant tu es fait, intrus !
	IWillTeachYouRespectForForeignProperty	=	"SVM_13_IWillTeachYouRespctForForeignProperty"	;//Je devrais t'arracher les doigts !
	DirtyThief					=	"SVM_13_DirtyThief"						;//Sale voleur ! Je vais te couper les mains ...
	YouAttackedMyCharge			=	"SVM_13_YouAttackedMyCharge"			;//Ici il n'y a que moi qui tape sur les autres !
	YouKilledOneOfUs			=	"SVM_13_YouKilledOneOfUs"				;//Tu as tué un des notres !
	Dead						=	"SVM_13_Dead"							;//Aaargl
	Aargh_1						=	"SVM_13_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_13_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_13_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_13_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_13_YoullBeSorryForThis"			;//Tu n'aura pas assez de temps pour être désolé !
	YesYes						=	"SVM_13_YesYes"							;//Pas de problème, il n'y a pas de problème !
	ShitWhatAMonster			=	"SVM_13_ShitWhatAMonster"				;//Je n'ai pas la bonne arme. Nous nous rencontrerons à nouveau ...
	Help						=	"SVM_13_Help"							;//Woooooaaahhh ! Décampons !
	WeWillMeetAgain				=	"SVM_13_WeWillMeetAgain"				;//On se retrouvera !
	NeverTryThatAgain			=	"SVM_13_NeverTryThatAgain"				;//La prochaine fois je te tuerai !
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"				;//Belle arme ! C'est la tienne ? Non ? D'accord !
	ITookYourOre				=	"SVM_13_ITookYourOre"					;//Je suppose que tu n'as rien contre le fait que je garde un peu de minerai.
	ShitNoOre					=	"SVM_13_ShitNoOre"						;//Tu n'as même pas de minerai dans tes poches !
	HandsOff					=	"SVM_13_HandsOff"						;//Sale rat ! Bat les pattes ! Je vais te la donner !
	GetOutOfHere				=	"SVM_13_GetOutOfHere"					;//Arrête ! Sors de là !
	YouViolatedForbiddenTerritory=	"SVM_13_YouViolatedForbiddenTerritory"	;//Bref, Que fais-tu ici ?
	YouWannaFoolMe				=	"SVM_13_YouWannaFoolMe"					;//Tu essayes vraiment de me mettre hors de moi !
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"			;//Hé, toi ! Qu'est-ce que tu fouines par là ?
	WhyAreYouInHere				=	"SVM_13_WhyYouAreInHere"				;//Que fais-tu ici ? Ouste, ou appelle les gardes !
	WhatDidYouInThere			=	"SVM_13_WhatDidYouInThere"				;//Tu n'as rien a faire ici !
	WiseMove					=	"SVM_13_WiseMove"						;//Tu as de la chance ! Mais j'aurai aimer te refaire le portrait !
	Alarm						=	"SVM_13_Alarm"							;//Gardes, par ici !
	IntruderAlert				= 	"SVM_13_IntruderAlert"					;//ALERTE !!
	BehindYou					=	"SVM_13_BehindYou"						;//Derrière toi !
	TheresAFight				=	"SVM_13_TheresAFight"					;//Voyons qui va mordre la poussière.
	HeyHeyHey					=	"SVM_13_HeyHeyHey"						;//Ouais, encore !
	CheerFight					=	"SVM_13_CheerFight"						;//Je vaux voir du sang !
	CheerFriend					=	"SVM_13_CheerFriend"					;//Écrasez-le !!
	Ooh							=	"SVM_13_Ooh"							;//Contre-attaquez, bande d'idiot !
	YeahWellDone				=	"SVM_13_YeahWellDone"					;//Yeaah !!!
	RunCoward					=	"SVM_13_RunCoward"						;//Ouais, la ferme !
	HeDefeatedHim				=	"SVM_13_HeDefeatedHim"					;//Triste performance ! Une petite brise et il s'écroule.
	HeDeservedIt				=	"SVM_13_HeDeservedIt"					;//Pah, montre-lui !
	HeKilledHim					=	"SVM_13_HeKilledHim"					;//C'est du suicide de tué quelqu'un devant témoin.
	ItWasAGoodFight				=	"SVM_13_ItWasAGoodFight"				;//Beau combat !
	Awake						=	"SVM_13_Awake"							;//Yawn
	FriendlyGreetings			=	"SVM_13_FriendlyGreetings"				;//Tout va bien ?
	ALGreetings					=	"SVM_13_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_13_MageGreetings"					;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_13_SectGreetings"					;//Éveille-toi !
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Es-tu aveugle ? Par ici !
	NoLearnNoPoints				= 	"SVM_13_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'expérience.
	NoLearnOverMax				= 	"SVM_13_NoLearnOverMax"					;//Tu es à la limite de tes possibilités. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_13_NoLearnYouAlreadyKnow"			;//Tu as besoin de devenir un spécialiste avant de devenir un maître !
	NoLearnYoureBetter			=	"SVM_13_NoLearnYoureBetter"				;//Tu es déjà meilleur maintenant !
	HeyYou						=	"SVM_13_HeyYou"							;//Hé, toi !
	NotNow						=	"SVM_13_NotNow"							;//Pas maintenant !
	WhatDoYouWant				=	"SVM_13_WhatDoYouWant"					;//Que veux-tu de moi ?
	ISaidWhatDoYouWant			=	"SVM_13_ISaidWhatDoYouWant"				;//Je peux faire quelque chose pour toi ?!
	MakeWay						=	"SVM_13_MakeWay"						;//Laisse moi passer.
	OutOfMyWay					=	"SVM_13_OutOfMyWay"						;//Hors de mon chemin !
	YouDeafOrWhat				=	"SVM_13_YouDeafOrWhat"					;//Tu cherches les ennuis ? Hors d'ici !
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"			;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_13_LookAway"						;//Je n'ai RIEN vu !
	OkayKeepIt					=	"SVM_13_OkayKeepIt"						;//Doucement. C'est à toi.
	WhatsThat					=	"SVM_13_WhatsThat"						;//Qu'est-ce que c'était ?
	ThatsMyWeapon				=	"SVM_13_ThatsMyWeapon"					;//Rend moi mon arme !
	GiveItToMe					=	"SVM_13_GiveItToMe"						;//Rend-la moi !
	YouCanKeeptheCrap			=	"SVM_13_YouCanKeeptheCrap"				;//D'accord ! Garde-la ! Je trouverai une autre solution !
	TheyKilledMyFriend			=	"SVM_13_TheyKilledMyFriend"				;//Un des notres est mort ! Vengeance !
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"			;//Pourquoi m'as-tu réveillé ?
	SuckerGotSome				=	"SVM_13_SuckerGotSome"					;//Tire des leçons de tes défaites !
	SuckerDefeatedEBr			=	"SVM_13_SuckerDefeatedEBr"				;//Tu as frappé le Baron du minerai ! Tu l'a rendu fou !
	SuckerDefeatedGur			=	"SVM_13_SuckerDefeatedGur"				;//Tu as frappé un Sage. Il semble que tu attires les problèmes comme un aimant !
	SuckerDefeatedMage			=	"SVM_13_SuckerDefeatedMage"				;//Être victorieux contre un magicien est vraiment une idée idiote !
	SuckerDefeatedNov_Guard		= 	"SVM_13_SuckerDefeatedNov_Guard"		;//Alors tu es celui qui a frappé les novices !
	SuckerDefeatedVlk_Guard		= 	"SVM_13_SuckerDefeatedVlk_Guard"		;//Laisse mes hommes tranquille !
	YouDefeatedMyComrade		=	"SVM_13_YouDefeatedMyComrade"			;//Ce n'est pas une bonne idée de venir ici.
	YouDefeatedNOV_Guard		=	"SVM_13_YouDefeatedNOV_Guard"			;//Ce que tu fais ne peut être toléré ici !
	YouDefeatedVLK_Guard		=	"SVM_13_YouDefeatedVLK_Guard"			;//Si tu frappes quelqu'un sous ma protection tu en subiras les conséquences !
	YouStoleFromMe				=	"SVM_13_YouStoleFromMe"					;//Tu m'as volé ! Ne recommence plus !
	YouStoleFromUs				=	"SVM_13_YouStoleFromUs"					;//Nous voulons nos affaires ! Rend les nous !
	YouStoleFromEBr				=	"SVM_13_YouStoleFromEBr"				;//Tu as volé le Baron du minerai ! Pourquoi diable as-tu fais ça ?
	YouStoleFromGur				=	"SVM_13_YouStoleFromGur"				;//Tu as volé les Sages ? Quelle idiotie qu'il t'ont prit sur le faite.
	StoleFromMage				=	"SVM_13_StoleFromMage"					;//Tu as volé des magiciens ! Une idée idiote !
	YouKilledMyFriend			=	"SVM_13_YouKilledMyFriend"				;//L'un d'entre nous est mort et tu es impliqué ! Encore une petite erreur et tu es fais !
	YouKilledEBr				=	"SVM_13_YouKilledEBr"					;//Tu as tué le Baron du Minerai ! Mécréant, es-tu complètement fou !?
	YouKilledGur				=	"SVM_13_YouKilledGur"					;//Tu as tué un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_13_YouKilledMage"					;//Tu as tué un magicien ! Comment imagines-tu expliquer ça ?
	YouKilledOCfolk				=	"SVM_13_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom fut prononcé en rapport avec cet acte...
	YouKilledNCfolk				=	"SVM_13_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il apparaît que tu es impliqué !
	YouKilledPSIfolk			=	"SVM_13_YouKilledPSIfolk"				;//La Confrérie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_13_GetThingsRight"					;//ça ne fut pas facile de sortir de là !
	YouDefeatedMeWell			=	"SVM_13_YouDefeatedMeWell"				;//Tu m'as donné du fil à retordre. Ce fut un bon combat. Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_13_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_13_Smalltalk02"					;// ... peut-être ...
	Smalltalk03					=	"SVM_13_Smalltalk03"					;// ... ce n'était pas très malin ...
	Smalltalk04					=	"SVM_13_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_13_Smalltalk05"					;// ... ce n'est vraiment pas mon problème ...
	Smalltalk06					=	"SVM_13_Smalltalk06"					;// ... il est évident que ça ne pouvait que mal tourné ...
	Smalltalk07					=	"SVM_13_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_13_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_13_Smalltalk09"					;// ... il doit y avoir quelque chose derrière cette histoire après tout ...
	Smalltalk10					=	"SVM_13_Smalltalk10"					;// ... tu dois faire attention à ce que tu dis ...
	Smalltalk11					=	"SVM_13_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqué ...
	Smalltalk12					=	"SVM_13_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_13_Smalltalk13"					;// ... je n'aimerais pas être dans ses bottes ...
	Smalltalk14					=	"SVM_13_Smalltalk14"					;// ... toujours la vieille même histoire ...
	Smalltalk15					=	"SVM_13_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_13_Smalltalk16"					;// ... il fut un temps où ça se serait passé différemment ...
	Smalltalk17					=	"SVM_13_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_13_Smalltalk18"					;// ... je n'écoute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_13_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_13_Smalltalk20"					;// ... je doute que cela change jamais ...
	Smalltalk21					=	"SVM_13_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_13_Smalltalk22"					;// ... Attends. Il vaut mieux ne pas se précipiter ...
	Smalltalk23					=	"SVM_13_Smalltalk23"					;// ... je pensais que c'était de l'histoire ancienne ...
	Smalltalk24					=	"SVM_13_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_13_Om"							;//Ommm
};



//////////////////////////////////////////
instance SVM_14	(C_SVM)				// Xardas(DMB),Corristo,Erzähler	alt	arrogant, gebildet
{
	StopMagic					=	"SVM_14_StopMagic"						;//Arrête cette magie !
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"					;//Tu m'as entendu : Arrête ta sorcellerie !
	WeaponDown					=	"SVM_14_WeaponDown"						;//Qu'est-ce que tu veux avec cette arme ?
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Range cette arme !
	WatchYourAim				=	"SVM_14_WatchYourAim"					;//Tu es en train de me viser !
	WatchYourAimAngry			=	"SVM_14_WatchYourAimAngry"				;//Veux-tu arrêter de me viser ?!
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Attention !
	LetsForgetOurLittleFight	=	"SVM_14_LetsForgetOurLittleFight"		;//Oublions nos divergences d'opinion !
	Strange						=	"SVM_14_Strange"						;//Un bon tour, il vient juste de disparaître !
	DieMonster					=	"SVM_14_DieMonster"						;//Les dommage d'une créature.
	DieMortalEnemy				=	"SVM_14_DieMortalEnemy"					;//Je dois te tuer ... Rien de personnel, tu comprends !
	NowWait						=	"SVM_14_NowWait"						;//Assez pour l'instant !
	YouStillNotHaveEnough		=	"SVM_14_YouStillNotHaveEnough"			;//Tu ne veux pas d'ennuis à nouveau, n'est-ce pas ?
	YouAskedForIt				=	"SVM_14_YouAskedForIt"					;//Tu l'as cherché !
	NowWaitIntruder				= 	"SVM_14_NowWaitIntruder"				;//Tu n'as pas été invité !
	IWillTeachYouRespectForForeignProperty	=	"SVM_14_IWillTeachYouRespectForForeignProperty"	;//Mes affaires ne sont pas à toi !
	DirtyThief					=	"SVM_14_DirtyThief"						;//Tu m'as pris quelque chose ! Maintenant tu vas payer pour ça !
	YouAttackedMyCharge			=	"SVM_14_YouAttackedMyCharge"			;//Tu as besoin d'apprendre les règles !
	YouKilledOneOfUs			=	"SVM_14_YouKilledOneOfUs"				;//Tu as tué quelqu'un !
	Dead						=	"SVM_14_Dead"							;//Aaargl
	Aargh_1						=	"SVM_14_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_14_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_14_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_14_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_14_YoullBeSorryForThis"			;//Tu vas le regretter !
	YesYes						=	"SVM_14_YesYes"							;//D'accord, d'accord !
	ShitWhatAMonster			=	"SVM_14_ShitWhatAMonster"				;//Je ne veux pas relever ce défi maintenant !
	Help						=	"SVM_14_Help"							;//J'ai besoin de retourner à mes affaires !
	WeWillMeetAgain				=	"SVM_14_WeWillMeetAgain"				;//Je suis sûr que nous nous rencontrerons de nouveau !
	NeverTryThatAgain			=	"SVM_14_NeverTryThatAgain"				;//tu ferais mieux de ne plus faire ça !
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Je prendrai cette arme !
	ITookYourOre				=	"SVM_14_ITookYourOre"					;//Le minerai est très utile, c'est sûr !
	ShitNoOre					=	"SVM_14_ShitNoOre"						;//Tu n'as pas de minerai !
	HandsOff					=	"SVM_14_HandsOff"						;//Lâche ça !
	GetOutOfHere				=	"SVM_14_GetOutOfHere"					;//Sorte d'ici !
	YouViolatedForbiddenTerritory=	"SVM_14_YouViolatedForbiddenTerritory"	;//Comment es-tu venu ici ?
	YouWannaFoolMe				=	"SVM_14_YouWannaFoolMe"					;//Tu dois plaisanter !
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"			;//Qu'est-ce que tu fouines ?
	WhyAreYouInHere				=	"SVM_14_WhyYouAreInHere"				;//Pars avant que j'appelle les gardes !
	WhatDidYouInThere			=	"SVM_14_WhatDidYouInThere"				;//Tu n'as rien à faire ici ! Compris ?
	WiseMove					=	"SVM_14_WiseMove"						;//Sage décision !
	Alarm						=	"SVM_14_Alarm"							;//Gardes, par ici, là !
	IntruderAlert				= 	"SVM_14_IntruderAlert"					;//UN INTRU !!!
	BehindYou					=	"SVM_14_BehindYou"						;//Derrière toi !
	TheresAFight				=	"SVM_14_TheresAFight"					;//Un combat !
	HeyHeyHey					=	"SVM_14_HeyHeyHey"						;//Hmm.
	CheerFight					=	"SVM_14_CheerFight"						;//Inefficace !
	CheerFriend					=	"SVM_14_CheerFriend"					;//Quel acharnement !
	Ooh							=	"SVM_14_Ooh"							;//C'était douloureux !
	YeahWellDone				=	"SVM_14_YeahWellDone"					;//C'est une manière de faire ...
	RunCoward					=	"SVM_14_RunCoward"						;//Il a appris quelque chose !
	HeDefeatedHim				=	"SVM_14_HeDefeatedHim"					;//C'est fait.
	HeDeservedIt				=	"SVM_14_HeDeservedIt"					;//Fait-lui voir !
	HeKilledHim					=	"SVM_14_HeKilledHim"					;//Ce n'était pas nécessaire de le tuer, tu vas avoir de ennuis maintenant !
	ItWasAGoodFight				=	"SVM_14_ItWasAGoodFight"				;//Ces combats m'ennuient !
	Awake						=	"SVM_14_Awake"							;//Je dormais ?
	FriendlyGreetings			=	"SVM_14_FriendlyGreetings"				;//Salutations.
	ALGreetings					=	"SVM_14_ALGreetings"					;//Pour Gomez !
	MageGreetings				=	"SVM_14_MageGreetings"					;//Pour l'honneur de la Magie !
	SectGreetings				=	"SVM_14_SectGreetings"					;//Éveille-toi !
	ThereHeIs					= 	"SVM_14_ThereHeIs"						;//Il est là.
	NoLearnNoPoints				= 	"SVM_14_NoLearnNoPoints"				;//Je ne peux rien t'apprendre. Tu n'as pas assez d'expérience.
	NoLearnOverMax				= 	"SVM_14_NoLearnOverMax"					;//Tu es à la limite de tes possibilités. Tu devrais apprendre d'autres choses.
	NoLearnYouAlreadyKnow		=	"SVM_14_NoLearnYouAlreadyKnow"			;//Tu dois devenir expérimenté avant de devenir Maître !
	NoLearnYoureBetter			=	"SVM_14_NoLearnYoureBetter"				;//Tu es déjà meilleur maintenant !
	HeyYou						=	"SVM_14_HeyYou"							;//Hé, toi !
	NotNow						=	"SVM_14_NotNow"							;//Pas maintenant.
	WhatDoYouWant				=	"SVM_14_WhatDoYouWant"					;//Qu'est-ce que je peux faire pour toi ?
	ISaidWhatDoYouWant			=	"SVM_14_ISaidWhatDoYouWant"				;//Puis-je t'aider ?
	MakeWay						=	"SVM_14_MakeWay"						;//Écarte toi !
	OutOfMyWay					=	"SVM_14_OutOfMyWay"						;//Laisse moi passer.
	YouDeafOrWhat				=	"SVM_14_YouDeafOrWhat"					;//Maintenant fais-toi une balafre !
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"			;//Tu cherches des ennuis de nouveau ?
	LookAway					=	"SVM_14_LookAway"						;//Je ne suis pas intéressé !
	OkayKeepIt					=	"SVM_14_OkayKeepIt"						;//Garde-la !
	WhatsThat					=	"SVM_14_WhatsThat"						;//Qu'est-ce que c'était ?
	ThatsMyWeapon				=	"SVM_14_ThatsMyWeapon"					;//Rend moi mon arme !
	GiveItToMe					=	"SVM_14_GiveItToMe"						;//Rend-la moi !
	YouCanKeeptheCrap			=	"SVM_14_YouCanKeeptheCrap"				;//D'accord. Je n'en veux plus !
	TheyKilledMyFriend			=	"SVM_14_TheyKilledMyFriend"				;//Un des notres à été tué. Nous trouverons le coupable ...
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"			;//Tu déranges mon étude !
	SuckerGotSome				=	"SVM_14_SuckerGotSome"					;//Tu as des problèmes, j'ai entendu dire !
	SuckerDefeatedEBr			=	"SVM_14_SuckerDefeatedEBr"				;//Tu as vaincu Baron du minerai. Il a été impressionné !
	SuckerDefeatedGur			=	"SVM_14_SuckerDefeatedGur"				;//Tu as battu un des Sages. Je suis impressionné.
	SuckerDefeatedMage			=	"SVM_14_SuckerDefeatedMage"				;//Gagner contre un magicien ...
	SuckerDefeatedNov_Guard		= 	"SVM_14_SuckerDefeatedNov_Guard"		;//Tu sais que les novices sont sous ma protection. Et néanmoins tu les as frappé quand même ?
	SuckerDefeatedVlk_Guard		= 	"SVM_14_SuckerDefeatedVlk_Guard"		;//Si tu touches au mineurs, tu auras affaire à moi !
	YouDefeatedMyComrade		=	"SVM_14_YouDefeatedMyComrade"			;//Tu ne devrais pas chercher des histoires à mes amis.
	YouDefeatedNOV_Guard		=	"SVM_14_YouDefeatedNOV_Guard"			;//Pose encore tes mains sur un novice et tu le regrettera !
	YouDefeatedVLK_Guard		=	"SVM_14_YouDefeatedVLK_Guard"			;//Si tu attaques un de mes protégés, ça peut te coûter cher.
	YouStoleFromMe				=	"SVM_14_YouStoleFromMe"					;//Comment oses-tu revenir ici, sale voleur ?
	YouStoleFromUs				=	"SVM_14_YouStoleFromUs"					;//Tu as pris des affaires qui nous appartienne. Tu ferais mieux de les rendre.
	YouStoleFromEBr				=	"SVM_14_YouStoleFromEBr"				;//Mec ! Tu as volé le Baron du minerai ! Ils seront fou de rage !
	YouStoleFromGur				=	"SVM_14_YouStoleFromGur"				;//Tu as soulagé les Sages de plusieurs choses.
	StoleFromMage				=	"SVM_14_StoleFromMage"					;//Tu as soulagé les magiciens de plusieurs choses.
	YouKilledMyFriend			=	"SVM_14_YouKilledMyFriend"				;//Tu as tué un des notres. Encore une autre petite erreur et ton compte est bon !
	YouKilledEBr				=	"SVM_14_YouKilledEBr"					;//Tu as tué le Baron du Minerai ! Mécréant, es-tu complètement fou !?
	YouKilledGur				=	"SVM_14_YouKilledGur"					;//Tu as tué un Sage ! je ne peux pas le croire !
	YouKilledMage				=	"SVM_14_YouKilledMage"					;//Tu as tué un magicien ! Comment imagines-tu expliquer ça ?
	YouKilledOCfolk				=	"SVM_14_YouKilledOCfolk"				;//Un membre du Vieux Camp est mort, et ton nom fut prononcé en rapport avec cet acte...
	YouKilledNCfolk				=	"SVM_14_YouKilledNCfolk"				;//Le Nouveau Camp a souffert de perte tragique, et il apparaît que tu es impliqué !
	YouKilledPSIfolk			=	"SVM_14_YouKilledPSIfolk"				;//La Confrérie compte un croyant en moins, et tu dois porter sa sur ta conscience !
	GetThingsRight				=	"SVM_14_GetThingsRight"					;//ça ne fut pas facile de sortir de là !
	YouDefeatedMeWell			=	"SVM_14_YouDefeatedMeWell"				;//D'accord, tu m'as battu. C'était un beau combat ! Mais maintenant c'est fini !
	Smalltalk01					=	"SVM_14_Smalltalk01"					;// ... si tu le crois ...
	Smalltalk02					=	"SVM_14_Smalltalk02"					;// ... peut-être ...
	Smalltalk03					=	"SVM_14_Smalltalk03"					;// ... ce n'était pas très malin ...
	Smalltalk04					=	"SVM_14_Smalltalk04"					;// ... Je ferais mieux de le garder pour moi ...
	Smalltalk05					=	"SVM_14_Smalltalk05"					;// ... ce n'est vraiment pas mon problème ...
	Smalltalk06					=	"SVM_14_Smalltalk06"					;// ... il est évident que ça ne pouvait que mal tourné ...
	Smalltalk07					=	"SVM_14_Smalltalk07"					;// ... mais garde-le pour toi, les gens n'ont pas besoin de le savoir.
	Smalltalk08					=	"SVM_14_Smalltalk08"					;// ... cela ne se reproduira plus ...
	Smalltalk09					=	"SVM_14_Smalltalk09"					;// ... il doit y avoir quelque chose derrière cette histoire après tout ...
	Smalltalk10					=	"SVM_14_Smalltalk10"					;// ... tu dois faire attention à ce que tu dis ...
	Smalltalk11					=	"SVM_14_Smalltalk11"					;// ... aussi longtemps que je ne suis pas impliqué ...
	Smalltalk12					=	"SVM_14_Smalltalk12"					;// ... tu ne devrais pas croire tout ce que tu entends ...
	Smalltalk13					=	"SVM_14_Smalltalk13"					;// ... je n'aimerais pas être dans ses bottes ...
	Smalltalk14					=	"SVM_14_Smalltalk14"					;// ... toujours la vieille même histoire ...
	Smalltalk15					=	"SVM_14_Smalltalk15"					;// ... certaine personne n'apprenne jamais ...
	Smalltalk16					=	"SVM_14_Smalltalk16"					;// ... il fut un temps où ça se serait passé différemment ...
	Smalltalk17					=	"SVM_14_Smalltalk17"					;// ... les gens parlent toujours ...
	Smalltalk18					=	"SVM_14_Smalltalk18"					;// ... je n'écoute plus toutes les vantardises ...
	Smalltalk19					=	"SVM_14_Smalltalk19"					;// ... si tu cherches des noises, tu en trouveras, logique ...
	Smalltalk20					=	"SVM_14_Smalltalk20"					;// ... je doute que ça change un jour ...
	Smalltalk21					=	"SVM_14_Smalltalk21"					;// ... tu as probablement raison ...
	Smalltalk22					=	"SVM_14_Smalltalk22"					;// ... attends. Il ne faut pas se précipiter ...
	Smalltalk23					=	"SVM_14_Smalltalk23"					;// ... je croyais que c'était fini ...
	Smalltalk24					=	"SVM_14_Smalltalk24"					;// ... parlons d'autre chose ...
	Om							= 	"SVM_14_Om"							;//Ommm
};


//////////////////////////////////////////
INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Hé, toi !
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Attend !

	SectGreetings			=	"SVM_15_SectGreetings"				;//Éveille-toi !
	ALGreetings				=	"SVM_15_ALGreetings"				;//Pour Gomez !
	MageGreetings			=	"SVM_15_MageGreetings"				;//Salutations !
	FriendlyGreetings		=	"SVM_15_FriendlyGreetings"			;//Salut !
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaargl
	Awake					=	"SVM_15_Awake"						;//Bâillement !
	DoesntWork				= 	"SVM_15_DoesntWork"					;//Ne marche pas.
	PickBroke				= 	"SVM_15_PickBroke"					;// Hmm, cassé.
	NeedKey					= 	"SVM_15_NeedKey"					;// J'ai besoin d'une clé pour ça ...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;// Plus de clé squelette ...
	InvFull					= 	"SVM_15_InvFull"					;// Je ne peux porter plus.
};

//////////////////////////////////////////
INSTANCE SVM_16	(C_SVM)				// Stimmbeschreibung	:		Babes halt!!!!!
{
	NotNow						=	"SVM_16_NotNow"			;	//Part ! Tu n'es pas supposé me parler !
	Help						=	"SVM_16_Help"			;	//Hurlement !
	Aargh_1						=	"SVM_16_Aargh_1"		;	//Aargh
	Aargh_2						=	"SVM_16_Aargh_2"		;	//Aargh
	Aargh_3						=	"SVM_16_Aargh_3"		;	//Aargh
	Dead						=	"SVM_16_Dead"			;	//Aaargl
};

//////////////////////////////////////////
INSTANCE SVM_17	(C_SVM)							//Ork-Stimme (alle SVMs werden auf wenige guturalen, unverständlichen Laute umgeleitet)
												//Die Dialoge mit dem verbannten Ork-Shamanen im Kastell und dem Ork-Sklaven in der Freien Mine laufen auch
												//über Stimme 17, sind aber in halbwegsverständlichem orkisch-deutsch
												//Das hier überall vergebene SVM_17_OrcSound01 wird noch durch 9 weitere Variationen ergänzt

// FIXME: mehr Varianten!?
{
	StopMagic					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	ISaidStopMagic				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WeaponDown					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
/*
	ISaidWeaponDown				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	WatchYourAim				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WatchYourAimAngry			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WhatAreYouDoing				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	LetsForgetOurLittleFight	=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	Strange						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	DieMonster					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	DieMortalEnemy				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	NowWait						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	YouStillNotHaveEnough		=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouAskedForIt				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	NowWaitIntruder				= 	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	DirtyThief					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouAttackedMyCharge			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouKilledOneOfUs			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	Dead						=	"SVM_17_Dead"				;//Aaaarglll....
	Aargh_1						=	"SVM_17_Aargh_1"			;//Aargh!
	Aargh_2						=	"SVM_17_Aargh_2"			;//Aargh!
	Aargh_3						=	"SVM_17_Aargh_3"			;//Aargh!
	Berzerk						=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YoullBeSorryForThis			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	ShitWhatAMonster			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	Help						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WeWillMeetAgain				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	NeverTryThatAgain			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	ITakeYourWeapon				=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	ITookYourOre				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	ShitNoOre					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	HandsOff					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	GetOutOfHere				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouViolatedForbiddenTerritory=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WhatsThisSupposedToBe		=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WhyAreYouInHere				=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WhatDidYouInThere			=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	WiseMove					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	Alarm						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	IntruderAlert				= 	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	BehindYou					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	CheerFight					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	CheerFriend					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	Ooh							=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	HeDefeatedHim				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	HeKilledHim					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	Awake						=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	FriendlyGreetings			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	HeyYou						=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	NotNow						=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WhatDoYouWant				=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	ISaidWhatDoYouWant			=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	MakeWay						=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	OutOfMyWay					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	YouDeafOrWhat				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	LookingForTroubleAgain		=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	GiveItToMe					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouDisturbedMySlumber		=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouStoleFromMe				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouStoleFromUs				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouKilledMyFriend			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
*/

};



// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	18;




