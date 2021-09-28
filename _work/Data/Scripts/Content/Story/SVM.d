// **********************************************
// Standard	Voice Module
// **********************************************

// Diese Klasse	kann beliebig von den Skriptern	erweitert um
// "VAR	STRING xxxx" erweitert werden, diese kцnnen	dann in	den
// einzelnen SVM - Instanzen initialisiert werden.


CLASS C_SVM
{
// SC hat Waffe oder Magie gezogen oder zielt auf NSC
	VAR	STRING	StopMagic;					// NSC  sieht wie in seiner Nдhe gezaubert wird -> er fordert auf, damit aufzuhцren!
	VAR	STRING	ISaidStopMagic;				// NSC hat bereits mit $StopMagic gewarnt und greift nun an	(nachdem er	diesen Satz	gesagt hat;	WICHTIG: dies ist KEINE	letzte Warnung,	sonder sofort Angriff!)

	var string	WeaponDown				;	//ZS_AssessFighter: SC steht mit gezogener Waffe vor NSC -> NSC ist NEUTRAL zu SC	-> (herausfordernd,	bei	Pьnten-Stimme etwas	unsicher, trotzdem kernig)
	var string	ISaidWeaponDown			;	//Kommt nachdem der SC $WeaponDown ignoriert hat!

	VAR	STRING	WatchYourAim;				// ein FRIENDLY-SC zielt mit einer Fernkampfwaffe auf den NSC .	'PaЯ auf! Ziel woanders	hin!' B_Orc_AssessThreat hat das auch noch
	var string	WatchYourAimAngry		;	// SC zielt mit einer Fernkampfwaffe auf den Angry-NSC. (genervte Auffordern, damit	aufzuhцren)
	VAR	STRING	WhatAreYouDoing;			// NSC wird von einem FRIENDLY-SC/NSC geschlagen

// SC hat Waffe weggesteckt, NSC beendet Kampf
	VAR	STRING	LetsForgetOurLittleFight;	//Friede, kann direkt kommen ( Wenn freundliche kдmpfen und der Spieler die Waffe wegsteckt) oder als Reaction ьber das news-Gedдchtnis, sollte daher Zeitneutral sein (--> nicht wie jetzt lass uns den Streit von letztens vergessen

// NSC hat Gegner aus den Augen verloren
	VAR	STRING	Strange			;			// 1. NSC wird attackiert -> rennt mit gezogener Waffe zum Angreifer ->	kann ihn plцtzlich nicht mehr entdecken	-> (muttering to himself)
											// 2. NSC sieht	einen Mord -> rennt	mit	gezogener Waffe	zum	Mцrder -> kann ihn plцtzlich nicht mehr	entdecken

// NSC greift an!
	var string	DieMonster				;	// NSC greift Monster an -> "Aus dir mach ich Gulasch, Drecksvieh!"
	var string	DieMOrtalEnemy;				// Der Nsc greift an, da er durch die Story permanent Hostile ist, d.h. die Lager sind in Blutfehde

	VAR	STRING	NowWait;					// NSC hat den SC frьher noch NICHT besiegt -> SC greift den NSC an -> "Na warte!"
	VAR	STRING	YouStillNotHaveEnough	;	// NSC hat den SC frьher besiegt ->	SC greift den NSC an -> "Hast du immer noch nicht genug?!"

	var	string	YouAskedForIt			;	// 1. SC hat eine Aufforderung ignoriert: den Raum zu verlassen, ein Item zurьckzugeben, seine Waffe wegzustecken -> "Wer nicht hцren will muЯ fьhlen..."
	var string	NowWaitIntruder			;	// SC hat einen bewachten Durchgang durchbrochen...

	var	string	IWillTeachYouRespectForForeignProperty;	// 1. SC benutzt ein Besitz-Mob(Tьr,Fallgitter-Drehkreuz,Kiste,...) und	wird ohne Vorwarnung attackiert
											// 2. SC trдgt Waffe des NSCs -> NSC ist stдrker und holt sie sich mit Gewalt wieder ->	vorher dieser Spruch

	VAR	STRING	DirtyThief;					// 1. NSC ertappt den (schwдcheren)	SC mit den Fingern in den eigenen Taschen
											// 2. NSC sieht	wie	der	(schwдchere) SC	etwas nimmt, daЯ ihm gehцrt	(z.B. Waffe	auf	den	Tisch)
											// 3. NSC sieht	feindlichen, schwдcheren SC, der ihn vorher	mal	beklaut	hat	und	sagt ihm diesen	Spruch,	bevor er angreift "Da hab ich Dich also	wieder,	Du dreckiger Dieb"
											// 4. Nsc ist in einen Raum eingedrungen

	var string	YouAttackedMyCharge		;	// SC/NSC greift einen Schьtzling einer NSC-Wache an -> Wache attackiert den Angreifer danach
	var string	YouKilledOneOfUs;			// NSC erblickt feindlichen SC, der einen Freund des NSCs getцtet hat -> Angriff!

// im Kampf
	VAR	STRING	Dead			;			// Tцdlich verletzt
	VAR	STRING	Aargh_1			;			// Treffer kassiert im Kampf	
	VAR	STRING	Aargh_2			;			// Treffer kassiert im Kampf	
	VAR	STRING	Aargh_3			;			// Treffer kassiert im Kampf	

	var string	Berzerk			;			// Wahnsinnsschrei im Zustand der Raserei!

// SC hat NSC niedergeschlagen oder bedroht
	VAR	STRING	YoullBeSorryForThis;		// NSC wurde durch SC/aNSC besiegt und wacht aus der Ohnmacht wieder auf: 'Das wird	Dir	noch leidtun!'

	VAR	STRING	YesYes			;			// 1. NSC wurde	im Kampf besiegt ->	erwacht	wieder ist aber	schдcher als sein Kontrahent
											// 2. SC zieht Waffe oder nдhert sich mit Waffe und NSC ist schwдcher als SC
// NSC flieht
	var string	ShitWhatAMonster		;	// NSC flieht vor zu starkem Monster -> "ScheiЯe, was ein Hцllenvieh. Nichts wie weg!"
	VAR	STRING	Help;						// NSC flieht vor Gegner, Babe Nsc flieht vor Spieler, Orcs haben das auch
	var	STRING	WeWillMeetAgain;			// NSC flieht vor Gegner, ist aber eigentlich Stдrker als er, ist aber trotzdem besiegt worden

// SC wurde von NSC besiegt und wird geplьndert
	VAR	STRING	NeverTryThatAgain	;		// NSC hat Gegner besiegt -> ("Versuch das NIE wieder!!")
	var string	ITakeYourWeapon;			// NSC plьndert bewuЯtlosen SC/aNSC. Wдhrend er sich bьckt, um nach der vom Besiegten fallengelassenen Waffe zu greifen sagt er diesen Spruch.
	VAR	STRING	ITookYourOre	;			// NSC plьndert bewuЯtlosen SC/aNSC. Nachdem er sich einen Teil des Erzes genommen hat, sagt er diesen Spruch.
	var string	ShitNoOre		;			// NSC дrgert sich darьber, daЯ er beim Durchsuchen eines bewuЯtlosen/toten Kцrpers kein Erz gefunden hat!

// NSC verwarnt SC
	VAR	STRING	HandsOff;					// SC manipuliert ein MOB (Drehkreuz, Truhe, Tьr) und ein befreundeter bzw. gildengleicher NSC sieht das...
	VAR	STRING	GetOutOfHere		;		// NSC erwischt	schwдcheren	SC in seiner Hьtte -> ("Raus hier")	(SC	soll aus Raum gehen)
	var	string	YouViolatedForbiddenTerritory		;	// SC wird beim Betreten eines verbotenen Portalraums erwischt -> Warnung!

	var	STRING	YouWannaFoolMe;				// SC schnappt NSC ein Item vor der Nase weg und wird mit $GiveItToMe aufgefordert es zurьckzugeben -> SC gibt ein falsches Item an den NSC -> 'Willst Du mich verarschen'

	VAR	STRING	WhatsThisSupposedToBe	;	// 1. SC schleicht vor den Augen des NSCs -> "Was schleichst Du	hier rum?" (besser als "Was	soll das denn werden", weil	besseres Feedback!)
											// 2. SC bewegt	sich hinter	einer Wache	-> diese dreht sich	um und sagt	dann
	var string	WhyAreYouInHere			;	//im ZS_ClearRoom / SC steht in verbotenem Portalraum	-> schwдcherer NSC fragt
	var string	WhatDidYouInThere		;	// Wache sieht Sc aus einer Hьtte rauskommen und verwarnt ihn, ohne das ein Angriff folgt

	VAR	STRING	WiseMove;					// 1. NSC wurde	gewarnt, seine Waffe wegzustecken ($RemoveYourWeapon) -> SC	befolgt	dies und steckt	die	Waffe weg
											// 2. SC steht in verbotenem Raum und wird mit $GetOutOfHere aufgefordert, rauszugehen -> SC befolgt die Aufforderung
											// 3. SC hat NSC ein Item vor der Nase weggeschnappt und wurde mit $GiveItToMe aufgefordert	es zurьckzugeben ->	SC gehorcht

// NSC alarmiert/warnt andere NSCs vor SC
	VAR	STRING	Alarm;						// Wache alarmiert die Sichtung	eines permanent	HOSTILE	SC/aNSC	"Alaaaaaaarm!!!!!"
											// Nicht Wache sieht wie ein Portalraum betreten wird, der einer Gilde zugeordnet ist und ruft die Wachen
											// Gemьse (NpcWorker) ruft Wachen nach einem Diebstahl/beobachteten Diebstahl etc.
	var string	IntruderAlert;				// SC hat einen bewachten Durchgang durchbrochen und die Wache alarmiert alle umstehenden
	VAR	STRING	BehindYou;					// NSC sieht, wie ein anderer NSC vom SC bestohlen wird	und	warnt das Opfer

// NSC beobachtet Kampf
	var	string	TheresAFight	;			// NSC entdeckt	einen Kampf	und	will zuschauen (ZS_WatchFight) -> vorher ein Spruch	wie	"Hey da	drьben gibt's einen	Kampf"
	VAR	STRING	HeyHeyHey;					// Hintergrund anfeuern	beim Beobachten	eines Kampfes: 'Hau	ihm	aufs Maul!'	(kommt alle	paar Sekunden!)
	VAR	STRING	CheerFight;					// NSC ist im Zustand WatchFight: Neutraler	Kдmpfer	schlдgt irgendeinen Typen. '5 Erz auf den Dicken'
	VAR	STRING	CheerFriend;				// NSC ist im Zustand WatchFight: Freund landet	einen Treffer. 'Immer in die Fresse!'
	VAR	STRING	Ooh;						// NSC ist im Zustand WatchFight: Freund kriegt	aufs Maul. 'Mist - das tat weh.'
	var	STRING	YeahWellDone;				// NSC sieht, wie SC/aNSC, zu dem er ANGRY/HOSTILE ist getцtet wird. 'Gut gemacht, das hat sie Sau verdient.'

// NSC-Gegner flieht
	VAR	STRING	RunCoward;					// 1. Der NSC befindet sich	im Zustand WatchFight -> einer der Kдmpfer haut	ab
											// 2. Der Gegner des NSCs flieht
	var	string	HeDefeatedHim	;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC besiegt 	(WICHTIG: dies ist der normale Ausgang!)
	var	string	HeDeservedIt	;			// NSC sieht wie ein SC/aNSC, zu dem er	ANGRY/HOSTILE steht, besiegt wird -> ("DAS hat er verdient!")
	var	string	HeKilledHim		;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC tцtet	(WICHTIG: dies ist ein Skandal, niemand wird normalerweise	in einer "Schlдgerei" getцtet)
	var	string	ItWasAGoodFight	;			// NSC sieht wie ein FRIENDLY/NEUTRAL-SC/aNSC einen	anderen	besiegt

	VAR	STRING	Awake			;			// NSC wacht aus dem Zustand Sleep wieder auf (Aufwachen, rдkeln)

// GrьЯe
	VAR	STRING	FriendlyGreetings;			// 1. Am Anfang	eines Dialoges, wenn NSC FRIENDLY/NEUTRAL zum SC,  2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	ALGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC aus Altem Lager und FRIENDLY/NEUTRAL ('Fьr Gomez'), 2. Wenn sie sich unterwegs begegnen.
	var	STRING	MageGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC beide Magier und FRIENDLY/NEUTRAL, 2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	SectGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC aus Psi-Camp und FRIENDLY/NEUTRAL	zum	SC ('Erwache. Der Schlдfer erwache.') 2. Wenn sie sich unterwegs begegnen.

	var string	ThereHeIs;					// NSC zeigt SC wo ein anderer NSC steht nach dem der SC gefragt hat: "Da drьben ist er"

// Lehrer-Kommentare
	var string	NoLearnNoPoints			;	// NSC-Lehrer verbietet Steigerung - keine Lernpunkte!
	var string	NoLearnOverMax			;	// NSC-Lehrer verbietet Attribut-Steigerung ьber 100
	var string	NoLearnYouAlreadyKnow	;	// Du muЯt erst Fortgeschritten sein, bevor du ein Meister werden kannst!
	var string	NoLearnYoureBetter		;	// Du bist jetzt schon besser!

// NSC spricht SC an
	VAR	STRING	HeyYou;						// z.B. Wache, die den SC im Rдumen erwischt, wo er nicht hin darf sagt HeyYou, und geht dann zum SC

// NSC will nicht reden
	VAR	STRING	NotNow;						// NSC / Babe wird vom SC angesprochen,	lehnt aber ein Gesprдch	ab.

// SC zu nah
	VAR	STRING	WhatDoYouWant;				// SC rьckt NSC zu dicht auf die Pelle -> "Kann ich was fьr Dich tun?"
	VAR	STRING	ISaidWhatDoYouWant;			// NSC hat $WhatDoYouWant gesagt, aber der SC hat nicht reagiert -> "Was willst Du?"
// SC im Weg
	VAR	STRING	MakeWay;					// SC steht	schwдcherem NSC im Weg	-> Aufforderung, Platz zu	machen
	VAR	STRING	OutOfMyWay;					// SC steht stдrkerem NSC (Magier, Erzbaron) im Weg -> aggressive Aufforderung, Platz zu machen
	VAR	STRING	YouDeafOrWhat;				// SC folgt	nicht der Aufforderung des stдrkeren NSCs	-> letzte Warnung, danach Angriff

// SC spricht NSC an, der ihn besiegt hat
	VAR	STRING	LookingForTroubleAgain;		//Erster Satz eines Dialoges, nachdem der NSC und der SC gekдmpft haben (entweder wurde der SC besiegt oder es gab keinen klaren Ausgang des Kampfes)

// NSC ist schwдcher...
	var string	LookAway;					// Eingeschьchterter NSC guckt weg bei bedrohlichen Situationen
	VAR	STRING	OkayKeepIt;					// SC trдgt	Waffe des schдcheren NSCs -> NSCs verlangt die Waffe zurьck	($GiveItToMe) -> SC	bedroht	NSC	-> ("Okay, okay, du	kannst das Ding	behalten..." zurьckweichen)
	VAR	STRING	WhatsThat;					// Verwandelter SC wird vor den Augen des NSCs wieder zum Menschen (Erschreckter Ausruf) Nsc wird aus dem MagicSleep wieder wach und wundert sich...

	VAR	STRING	ThatsMyWeapon;				// SC trдgt	eine Waffe,	die	dem	NSC	gehцrt -> Folge: ZS_GetBackBelongings
	VAR	STRING	GiveItToMe;					// 1. SC trдgt Waffe des NSCs -> NSC ist schwдcher (also kein Kampf) ->	"Gib sie mir wieder"
	VAR	STRING	YouCanKeeptheCrap;			// 1. SC trдgt Waffe des schwдcheren NSCs ->	NSCs verlangt die Waffe	zurьck ($GiveItToMe) ->	SC geht	einfach	weg	-> ("Behalt	das	ScheiЯ-Ding	doch!)
											// 2. NSC will ein Item	aufheben und wird von einem	stдrkeren NSC gewarnt, der das auch	tun	will ->	unser NSC weicht zurьck

	VAR	STRING	TheyKilledMyFriend;			// NSC Tдter - NSC zu Opfer freundlich, zu Tдter freundlich oder neutral

	var	string	YouDisturbedMySlumber;		// NSC wurde vom SC	mittelsanft	aus	dem	Schlaf gerissen	(z.B. durch	Ansprechen)

// Angry NSCs kommentieren SC-Aktionen
	VAR	STRING	SuckerGotSome;				// Angry NSC hat gehцrt, daЯ der SC umgehauen wurde. "Das Dich jemand umgehauen hat, geschieht Dir Recht!"

	VAR	STRING	SuckerDefeatedEBr;			// Du hast einen	EBR	besiegt. Er war wirklich beeindruckt!
	VAR	STRING	SuckerDefeatedGur;			// Du hast einen	GUR	niedergeschlagen,	Du bist	ein	toter Mann
	VAR	STRING	SuckerDefeatedMage;			// (News) - im Stil von SuckerDefeatedXY

	var string	SuckerDefeatedNOV_Guard;	// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist ANGRY zu Spieler
	var string	SuckerDefeatedVLK_Guard;	// Der Spieler hat einen Schьtzling der Wache niedergeschlagen
	var string	YouDefeatedMyComrade;		// Wache stellt fest, das sie gesehen/gehцrt hat, daЯ ich eine andere Wache umgehauen habe
	var string	YouDefeatedNOV_Guard;		// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist NEUTRAL/FRIENDLY zu Spieler
	var string	YouDefeatedVLK_Guard;		// Der Spieler hat einen Buddler umgehauen, Wache spricht den Spieler an, Wache ist NEUTRAL/FRIENDLY zu Spieler
	VAR	STRING	YouStoleFromMe;				// Du Sau hast mich beklaut

//Wichtige Person (Lehrer, Auftraggeber?), hat davon gehцrt, daЯ Du Mist gebaut hat...
// FIXME: damit das so benutzt werden kann mьssen noch Anpassungen in der B_ReactToMemory.d gemacht werden
	VAR	STRING	YouStoleFromUs;				// eigene oder befreundete Gilde beklaut.
	VAR	STRING	YouStoleFromEBr;			// Erzbarone beklaut.
	VAR	STRING	YouStoleFromGur;			// Gurus beklaut.
	VAR	STRING	StoleFromMage;				// Magier beklaut.

	VAR	STRING	YouKilledMyFriend;			// jemand aus eigener oder befreundeter Gilde getцtet
	var	STRING	YouKilledEBr;				// Erzbaron getцtet
	VAR	STRING	YouKilledGur;				// Guru getцtet
	VAR	STRING	YouKilledMage;				// Guru getцtet

	VAR	STRING	YouKilledOCfolk;			// Gardist, Schatten oder Buddler getцtet.
	VAR	STRING	YouKilledNCfolk;			// Sцldner, Organisator, Schьrfer oder Bauer getцtet
	VAR	STRING	YouKilledPSIfolk;			// Templer oder Novize getцtet

	VAR	STRING	GetThingsRight;				//SC hat Mist gebaut. NSC sagt, "Das wieder hinzubiegen wird nicht einfach!"

	VAR	STRING	YouDefeatedMeWell;			//Zu SC	freundlich/neutral:	Du hast	mich ganz schцn	geplдttet

// Ambient-Unterhaltungen zwischen zwei NSCs (gemurmelte Wortfetzen, die zufдllig zu "Dialogen" zusammengewьrfelt werden...
	VAR	STRING	Smalltalk01;				// ...wenn Du meinst...
	VAR	STRING	Smalltalk02;				// ...kann schon sein...
	VAR	STRING	Smalltalk03;				// ...war nicht besonders schlau....
	VAR	STRING	Smalltalk04;				// ...ich halt mich da lieber raus...
	VAR	STRING	Smalltalk05;				// ...das ist wirklich nicht mein Problem...
	VAR	STRING	Smalltalk06;				// ...war doch klar, daЯ das Дrger gibt...
	VAR	STRING	Smalltalk07;				// ...aber behalt's fьr Dich, muЯ nicht gleich jeder wissen...
	VAR	STRING	Smalltalk08;				// ...das passiert mir nicht nochmal...
	VAR	STRING	Smalltalk09;				// ...an der Gechichte muЯ wohl doch was dran sein...
	VAR	STRING	Smalltalk10;				// ...man muЯ eben aufpassen was man rumerzдhlt...
	VAR	STRING	Smalltalk11;				// ...solange ich damit nichts zu tun habe...
	VAR	STRING	Smalltalk12;				// ...man darf auch nicht alles glauben, was man hцrt...
	VAR	STRING	Smalltalk13;				// ...in seiner Haut will ich trotzdem nicht stecken...
	VAR	STRING	Smalltalk14;				// ...immer wieder die selbe Leier...
	VAR	STRING	Smalltalk15;				// ...manche lernen eben garnichts dazu...
	VAR	STRING	Smalltalk16;				// ...frьher wдre das ganz anders gelaufen...
	VAR	STRING	Smalltalk17;				// ...gequatscht wird viel...
	VAR	STRING	Smalltalk18;				// ...ich hцr nicht mehr auf das Gefasel...
	VAR	STRING	Smalltalk19;				// ...verlaЯ Dich auf jemanden und Du bist verlassen, das ist eben so...
	VAR	STRING	Smalltalk20;				// ...ich glaube kaum, daЯ sich daran was дndern wird...
	VAR	STRING	Smalltalk21;				// ...wahrscheinlich hast Du recht...
	VAR	STRING	Smalltalk22;				// ...erstmal abwarten. Es wird nichts so heiЯ gegessen, wie es gekocht wird...
	VAR	STRING	Smalltalk23;				// ...ich dachte, das wдre schon lange geklдrt, aber das ist wohl nicht so...
	VAR	STRING	Smalltalk24;				// ...laЯ uns lieber ьber was anderes reden...
	VAR	STRING	Om;							// Оммм... (Meditation)

// SC Dialog
	var string	SC_HeyTurnAround;			//SC: Hey du! (Nsc ansprechen, steht mit Rьcken zu dir)                                   
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
// 		Die SVM-Instanzen		(ToDo: News noch ьberarbeiten wie in Prototypen)
// ********************************

// Die einzelnen Instanzen der SVMs
// Diese mьssen	immer "SVM_x" heissen, wobei x die VoiceNummer ist.

instance SVM_1 (C_SVM)	//Malocher (Volk, Schьrfer)	Nцrgler, Alkoholiker, schimpft ьber	alles - zieht Kraft aus seinem Hass

{
	StopMagic					=	"SVM_1_StopMagic"					;//Эй, никакой магии!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Хочешь получить? Прекрати немедленно!!!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Опусти оружие!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Немедленно убери оружие!
	WatchYourAim				=	"SVM_1_WatchYourAim"				;//Убери это!
	WatchYourAimAngry			=	"SVM_1_WatchYourAimAngry"			;//Если хочешь получить в морду, прицелься в меня еще раз.
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Поосторожней! Еще один раз, и я основательно начищу тебе морду.
	LetsForgetOurLittleFight	=	"SVM_1_LetsForgetOurLittleFight"	;//Забудем об этом, ладно?
	Strange						=	"SVM_1_Strange"						;//Убирайся, ублюдок!
	DieMonster					=	"SVM_1_DieMonster"					;//Сукин сын!
	DieMortalEnemy				=	"SVM_1_DieMortalEnemy"				;//Конец тебе, парень!
	NowWait						=	"SVM_1_NowWait"						;//Теперь ты точно схлопочешь...
	YouStillNotHaveEnough		=	"SVM_1_YouStillNotHaveEnough"		;//Похоже, ты нарываешься!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//Сам напросился!
	NowWaitIntruder				= 	"SVM_1_NowWaitIntruder"				;//Тебя унесут отсюда по частям.
	IWillTeachYouRespectForForeignProperty	=	"SVM_1_IWillTeachYouRespectForForeignProperty"	;//Я уже предупреждал тебя: держись подальше от моих вещей!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Я прикончу тебя, вор!
	YouAttackedMyCharge			=	"SVM_1_YouAttackedMyCharge"			;//Никто не смеет обижать моих друзей!
	YouKilledOneOfUs			=	"SVM_1_YouKilledOneOfUs"			;//Ты ударил одного из наших. Теперь я ударю тебя!
	Dead						=	"SVM_1_Dead"						;//Аааааарг!!
	Aargh_1						=	"SVM_1_Aargh_1"						;//Ааргх!
	Aargh_2						=	"SVM_1_Aargh_2"						;//Ааргх!
	Aargh_3						=	"SVM_1_Aargh_3"						;//Ааргх!
	Berzerk						=	"SVM_1_Berzerk"						;//УУАААРРГГГХХХ!!!
	YoullBeSorryForThis			=	"SVM_1_YoullBeSorryForThis"			;//Об этом ты пожалеешь!
	YesYes						=	"SVM_1_YesYes"						;//Без паники! Ты победил!
	ShitWhatAMonster			=	"SVM_1_ShitWhatAMonster"			;//Черт! Уноси ноги!
	Help						=	"SVM_1_Help"						;//Проклятье!
	WeWillMeetAgain				=	"SVM_1_WeWillMeetAgain"				;//Мы еще встретимся!
	NeverTryThatAgain			=	"SVM_1_NeverTryThatAgain"			;//Еще раз, и ты об этом пожалеешь.
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Хорошее оружие! Давай сюда!
	ITookYourOre				=	"SVM_1_ITookYourOre"				;//Спасибо за руду, герой!
	ShitNoOre					=	"SVM_1_ShitNoOre"					;//Жалкий ублюдок, у тебя даже руды нет!
	HandsOff					=	"SVM_1_HandsOff"					;//Убери руки!
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Исчезни отсюда!
	YouViolatedForbiddenTerritory=	"SVM_1_YouViolatedForbiddenTerritory";//Эй! Как ты сюда попал?
	YouWannaFoolMe				=	"SVM_1_YouWannaFoolMe"				;//Ты думаешь, я тупой?
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Эй, ты! Что ты здесь шляешься?
	WhyAreYouInHere				=	"SVM_1_WhyYouAreInHere"				;//Убирайся из моего дома, или я позову стражу!
	WhatDidYouInThere			=	"SVM_1_WhatDidYouInThere"			;//Тебе здесь нечего делать. Пошел вон!
	WiseMove					=	"SVM_1_WiseMove"					;//Умный мальчик!
	Alarm						=	"SVM_1_Alarm"						;//Стража! Сюда!
	IntruderAlert				= 	"SVM_1_IntruderAlert"				;//ТРЕВОГА!!! ЧУЖОЙ!!!
	BehindYou					=	"SVM_1_BehindYou"					;//Сзади!
	TheresAFight				=	"SVM_1_TheresAFight"				;//А, драка!
	HeyHeyHey					=	"SVM_1_HeyHeyHey"					;//Сильнее!
	CheerFight					=	"SVM_1_CheerFight"					;//Ты дерешься как баба!
	CheerFriend					=	"SVM_1_CheerFriend"					;//Прикончи его!
	Ooh							=	"SVM_1_Ooh"							;//Бей в ответ!
	YeahWellDone				=	"SVM_1_YeahWellDone"				;//Врежь ему!
	RunCoward					=	"SVM_1_RunCoward"					;//Вернись, трус!
	HeDefeatedHim				=	"SVM_1_HeDefeatedHim"				;//Ему хватит!
	HeDeservedIt				=	"SVM_1_HeDeservedIt"				;//Поделом ему!
	HeKilledHim					=	"SVM_1_HeKilledHim"					;//Зачем ты убил его? Теперь ты покойник!
	ItWasAGoodFight				=	"SVM_1_ItWasAGoodFight"				;//Хороший бой!
	Awake						=	"SVM_1_Awake"						;//[зевок]
	FriendlyGreetings			=	"SVM_1_FriendlyGreetings"			;//Привет.
	ALGreetings					=	"SVM_1_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_1_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_1_SectGreetings"				;//Проснись!
	ThereHeIs					= 	"SVM_1_ThereHeIs"					;//Он здесь.
	NoLearnNoPoints				= 	"SVM_1_NoLearnNoPoints"				;//Возвращайся, когда поднаберешься опыта.
	NoLearnOverMax				= 	"SVM_1_NoLearnOverMax"				;//Ты на пределе своих возможностей. Тебе нужно научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_1_NoLearnYouAlreadyKnow"		;//Тебе нужно набраться опыта, прежде чем ты сможешь стать мастером.
	NoLearnYoureBetter			=	"SVM_1_NoLearnYoureBetter"			;//Уже лучше!
	HeyYou						=	"SVM_1_HeyYou"						;//Эй, ты! 
	NotNow						=	"SVM_1_NotNow"						;//Не сейчас!
	WhatDoYouWant				=	"SVM_1_WhatDoYouWant"				;//Что тебе нужно?
	ISaidWhatDoYouWant			=	"SVM_1_ISaidWhatDoYouWant"			;//Что-нибудь нужно?!
	MakeWay						=	"SVM_1_MakeWay"						;//Дай мне пройти!
	OutOfMyWay					=	"SVM_1_OutOfMyWay"					;//С дороги, парень!
	YouDeafOrWhat				=	"SVM_1_YouDeafOrWhat"				;//Ты оглох? ДВИГАЙСЯ!
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//Снова ищешь неприятностей?
	LookAway					=	"SVM_1_LookAway"					;//Уххххх! Я ничего не видел!
	OkayKeepIt					=	"SVM_1_OkayKeepIt"					;//Ладно, ладно! Оставь себе!
	WhatsThat					=	"SVM_1_WhatsThat"					;//Что это было?
	ThatsMyWeapon				=	"SVM_1_ThatsMyWeapon"				;//У тебя в руках МОЕ оружие!
	GiveItToMe					=	"SVM_1_GiveItToMe"					;//Отдай мне это!
	YouCanKeeptheCrap			=	"SVM_1_YouCanKeeptheCrap"			;//Возьми себе. Мне это все равно не пригодится.
	TheyKilledMyFriend			=	"SVM_1_TheyKilledMyFriend"			;//Убили одного из наших. Если я доберусь до этого наглеца...
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//Проклятье, зачем ты меня разбудил?
	SuckerGotSome				=	"SVM_1_SuckerGotSome"				;//Получил взбучку? Это послужит тебе уроком!
	SuckerDefeatedEBr			=	"SVM_1_SuckerDefeatedEBr"			;//Ты ударил Барона! Он так зол на тебя!
	SuckerDefeatedGur			=	"SVM_1_SuckerDefeatedGur"			;//Ты ударил Гуру. У тебя талант находить неприятности!
	SuckerDefeatedMage			=	"SVM_1_SuckerDefeatedMage"			;//Дурацкая идея - пытаться победить мага!
	SuckerDefeatedNov_Guard		= 	"SVM_1_SuckerDefeatedNov_Guard"		;//Ты думаешь, можно просто так обижать новичков?!
	SuckerDefeatedVlk_Guard		= 	"SVM_1_SuckerDefeatedVlk_Guard"		;//Оставь моих ребят!
	YouDefeatedMyComrade		=	"SVM_1_YouDefeatedMyComrade"		;//Ты ударил моего приятеля...
	YouDefeatedNOV_Guard		=	"SVM_1_YouDefeatedNOV_Guard"		;//Ты доставляешь кучу проблем. Думаешь, я это буду терпеть?
	YouDefeatedVLK_Guard		=	"SVM_1_YouDefeatedVLK_Guard"		;//Тронешь кого-нибудь, кто находится под моей защитой, - заработаешь кучу неприятностей!
	YouStoleFromMe				=	"SVM_1_YouStoleFromMe"				;//Засранец, ты воруешь у меня! Больше не возращайся!
	YouStoleFromUs				=	"SVM_1_YouStoleFromUs"				;//Верни наши вещи! Быстро!
	YouStoleFromEBr				=	"SVM_1_YouStoleFromEBr"				;//Ты воруешь у Баронов! Какого черта?
	YouStoleFromGur				=	"SVM_1_YouStoleFromGur"				;//Воруешь у Гуру? Какая жалость, что тебя раскрыли, правда?
	StoleFromMage				=	"SVM_1_StoleFromMage"				;//Воровать у магов - дурацкая идея!
	YouKilledMyFriend			=	"SVM_1_YouKilledMyFriend"			;//Один из наших людей погиб, и ты причастен к этому. Один неверный шаг, и ты - покойник!
	YouKilledEBr				=	"SVM_1_YouKilledEBr"				;//Ты убил Барона! Парень, ты окончательно спятил?!
	YouKilledGur				=	"SVM_1_YouKilledGur"				;//Ты убил Гуру! Я просто не верю!
	YouKilledMage				=	"SVM_1_YouKilledMage"				;//Ты убил мага! Как ты собираешься объяснить это?
	YouKilledOCfolk				=	"SVM_1_YouKilledOCfolk"				;//Погиб человек из Старого Лагеря, и твое имя связывают с этим убийством...
	YouKilledNCfolk				=	"SVM_1_YouKilledNCfolk"				;//Новый Лагерь понес тяжелую утрату, и, похоже, ты причастен к этому!
	YouKilledPSIfolk			=	"SVM_1_YouKilledPSIfolk"			;//Братство потеряло одного из своих членов, и эта жизнь на твоей совести!
	GetThingsRight				=	"SVM_1_GetThingsRight"				;//Тебе будет нелегко оправдаться!
	YouDefeatedMeWell			=	"SVM_1_YouDefeatedMeWell"			;//Это был честный бой! Ты набил мне морду, парень!
	Smalltalk01					=	"SVM_1_Smalltalk01"					;// ...самое дерьмовое...
	Smalltalk02					=	"SVM_1_Smalltalk02"					;// ...может быть, но кого это волнует?...
	Smalltalk03					=	"SVM_1_Smalltalk03"					;// ...полная чушь...
	Smalltalk04					=	"SVM_1_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_1_Smalltalk05"					;// ...это точно не моя проблема...
	Smalltalk06					=	"SVM_1_Smalltalk06"					;// ...похоже, назревает проблема...
	Smalltalk07					=	"SVM_1_Smalltalk07"					;// ...почему это случается снова и снова?...
	Smalltalk08					=	"SVM_1_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_1_Smalltalk09"					;// ...что-то не так в этой истории...
	Smalltalk10					=	"SVM_1_Smalltalk10"					;// ...не трепи языком, да, да...
	Smalltalk11					=	"SVM_1_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_1_Smalltalk12"					;// ...ты не должен верить всему...
	Smalltalk13					=	"SVM_1_Smalltalk13"					;// ...не хотел бы я оказаться на его месте...
	Smalltalk14					=	"SVM_1_Smalltalk14"					;// ...каждый раз одна и та же история...
	Smalltalk15					=	"SVM_1_Smalltalk15"					;// ...некоторых людей ничего не учит...
	Smalltalk16					=	"SVM_1_Smalltalk16"					;// ...были времена, когда все было совсем по-другому...
	Smalltalk17					=	"SVM_1_Smalltalk17"					;// ...люди всегда болтают...
	Smalltalk18					=	"SVM_1_Smalltalk18"					;// ...я больше не слушаю всякую трепотню...
	Smalltalk19					=	"SVM_1_Smalltalk19"					;// ...веришь кому-то - и в результате попадаешь в неприятности, так всегда и бывает...
	Smalltalk20					=	"SVM_1_Smalltalk20"					;// ...я сомневаюсь, что это когда-нибудь изменится...
	Smalltalk21					=	"SVM_1_Smalltalk21"					;// ...скорее всего, ты прав...
	Smalltalk22					=	"SVM_1_Smalltalk22"					;// ...держись. Лучше ни во что не ввязываться сгоряча...
	Smalltalk23					=	"SVM_1_Smalltalk23"					;// ...я думал, это выяснили еще очень давно...
	Smalltalk24					=	"SVM_1_Smalltalk24"					;// ...давай поговорим о чем-нибудь еще...
	Om							= 	"SVM_1_Om"							;//Оммм...
};


//SVM_2	// Misstrauisch (Volk, Bauern, Novizen, MILTEN) Misstrauisch. Defensiv. Angst in was reingezogen zu werden. Klug. Nov: Glauben durch Einschьchterung

instance SVM_2 (C_SVM)				// Misstrauisch
{
	StopMagic					=	"SVM_2_StopMagic"					;//Никакого волшебства!
	ISaidStopMagic				=	"SVM_2_ISaidStopMagic"				;//ЭЙ! Я сказал, никакой магии!
	WeaponDown					=	"SVM_2_WeaponDown"					;//Давай, убирай это!
	ISaidWeaponDown				=	"SVM_2_ISaidWeaponDown"				;//Убери оружие!
	WatchYourAim				=	"SVM_2_WatchYourAim"				;//Смотри, куда целишься!
	WatchYourAimAngry			=	"SVM_2_WatchYourAimAngry"			;//Если ты и дальше собираешься целиться в меня, я могу это неправильно понять!
	WhatAreYouDoing				=	"SVM_2_WhatAreYouDoing"				;//Эй, для чего это?
	LetsForgetOurLittleFight	=	"SVM_2_LetsForgetOurLittleFight"	;//Забудем об этом, ладно?
	Strange						=	"SVM_2_Strange"						;//Странно! Куда он пошел?!
	DieMonster					=	"SVM_2_DieMonster"					;//Еще один!
	DieMortalEnemy				=	"SVM_2_DieMortalEnemy"				;//Боюсь, мне придется убить тебя!
	NowWait						=	"SVM_2_NowWait"						;//Это твоя вина!
	YouStillNotHaveEnough		=	"SVM_2_YouStillNotHaveEnough"		;//Тебе что - мало?
	YouAskedForIt				=	"SVM_2_YouAskedForIt"				;//Ну, если ты этого хочешь...
	NowWaitIntruder				= 	"SVM_2_NowWaitIntruder"				;//Ты знаешь, что тебе нечего здесь делать!
	IWillTeachYouRespectForForeignProperty	=	"SVM_2_IWillTeachYouRespectForForeignProperty"	;//Почему ты шляешься с чужими вещами?!
	DirtyThief					=	"SVM_2_DirtyThief"					;//Ты обокрал меня! Я это запомню!
	YouAttackedMyCharge			=	"SVM_2_YouAttackedMyCharge"			;//Никто не смеет обижать моих друзей!
	YouKilledOneOfUs			=	"SVM_2_YouKilledOneOfUs"			;//Ты убил одного из наших! Ты за это заплатишь!
	Dead						=	"SVM_2_Dead"						;//Аааргл!
	Aargh_1						=	"SVM_2_Aargh_1"						;//Ааарг!
	Aargh_2						=	"SVM_2_Aargh_2"						;//Ааарг!
	Aargh_3						=	"SVM_2_Aargh_3"						;//Ааарг!
	Berzerk						=	"SVM_2_Berzerk"						;//УУАААРРГГГХХХ!!!
	YoullBeSorryForThis			=	"SVM_2_YoullBeSorryForThis"			;//Ты об этом пожалеешь!
	YesYes						=	"SVM_2_YesYes"						;//Тихо, тихо, ты победил!
	ShitWhatAMonster			=	"SVM_2_ShitWhatAMonster"			;//Я - гхм - мне просто нужна была помощь!
	Help						=	"SVM_2_Help"						;//У меня нет времени - дела!
	WeWillMeetAgain				=	"SVM_2_WeWillMeetAgain"				;//Уверен, мы еще встретимся!
	NeverTryThatAgain			=	"SVM_2_NeverTryThatAgain"			;//Больше не делай этого!
	ITakeYourWeapon				=	"SVM_2_ITakeYourWeapon"				;//Я возьму это!
	ITookYourOre				=	"SVM_2_ITookYourOre"				;//В любом случае, эта руда тебе уже не пригодится!
	ShitNoOre					=	"SVM_2_ShitNoOre"					;//У тебя совсем нет руды? Неудачный день, приятель!
	HandsOff					=	"SVM_2_HandsOff"					;//Убери руки!
	GetOutOfHere				=	"SVM_2_GetOutOfHere"				;//Убирайся отсюда!
	YouViolatedForbiddenTerritory=	"SVM_2_YouViolatedForbiddenTerritory";//Эй! Как ты сюда попал?
	YouWannaFoolMe				=	"SVM_2_YouWannaFoolMe"				;//Ты думаешь - я идиот?!
	WhatsThisSupposedToBe		=	"SVM_2_WhatsThisSupposedToBe"		;//Что ты здесь шляешься?
	WhyAreYouInHere				=	"SVM_2_WhyYouAreInHere"				;//Убирайся из моего дома, или я позову стражу!
	WhatDidYouInThere			=	"SVM_2_WhatDidYouInThere"			;//Держись подальше от домов!
	WiseMove					=	"SVM_2_WiseMove"					;//Правильное решение!
	Alarm						=	"SVM_2_Alarm"						;//Стража! Сюда!
	IntruderAlert				= 	"SVM_2_IntruderAlert"				;//ТРЕВОГА!!!
	BehindYou					=	"SVM_2_BehindYou"					;//Сзади!
	TheresAFight				=	"SVM_2_TheresAFight"				;//А, драка!
	HeyHeyHey					=	"SVM_2_HeyHeyHey"					;//И это все?!
	CheerFight					=	"SVM_2_CheerFight"					;//Просыпайся, копуша!
	CheerFriend					=	"SVM_2_CheerFriend"					;//Хороший удар!
	Ooh							=	"SVM_2_Ooh"							;//Больно!
	YeahWellDone				=	"SVM_2_YeahWellDone"				;//Он все еще двигается!
	RunCoward					=	"SVM_2_RunCoward"					;//Оставайся здесь, слабак!
	HeDefeatedHim				=	"SVM_2_HeDefeatedHim"				;//Хватит с него!
	HeDeservedIt				=	"SVM_2_HeDeservedIt"				;//Он это заслужил!
	HeKilledHim					=	"SVM_2_HeKilledHim"					;//Ты убил его! Это что, было так необходимо?
	ItWasAGoodFight				=	"SVM_2_ItWasAGoodFight"				;//Хороший бой, только слишком короткий!
	Awake						=	"SVM_2_Awake"						;//[зевок]
	FriendlyGreetings			=	"SVM_2_FriendlyGreetings"			;//Привет.
	ALGreetings					=	"SVM_2_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_2_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_2_SectGreetings"				;//Проснись!
	ThereHeIs					= 	"SVM_2_ThereHeIs"					;//Сюда.
	NoLearnNoPoints				= 	"SVM_2_NoLearnNoPoints"				;//Я не могу учить тебя. Тебе нехватает опыта.
	NoLearnOverMax				= 	"SVM_2_NoLearnOverMax"				;//Ты на пределе своих возможностей. Тебе нужно научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_2_NoLearnYouAlreadyKnow"		;//Тебе нужно набраться опыта, прежде чем ты сможешь стать мастером.
	NoLearnYoureBetter			=	"SVM_2_NoLearnYoureBetter"			;//Уже лучше!
	HeyYou						=	"SVM_2_HeyYou"						;//Эй, ты!
	NotNow						=	"SVM_2_NotNow"						;//Не сейчас.
	WhatDoYouWant				=	"SVM_2_WhatDoYouWant"				;//Что тебе нужно?
	ISaidWhatDoYouWant			=	"SVM_2_ISaidWhatDoYouWant"			;//Что я могу для тебя сделать?
	MakeWay						=	"SVM_2_MakeWay"						;//Дай мне пройти!
	OutOfMyWay					=	"SVM_2_OutOfMyWay"					;//С дороги!
	YouDeafOrWhat				=	"SVM_2_YouDeafOrWhat"				;//Исчезни, или я займусь тобой!
	LookingForTroubleAgain		=	"SVM_2_LookingForTroubleAgain"		;//Снова ищешь неприятностей?
	LookAway					=	"SVM_2_LookAway"					;//Я НИЧЕГО не видел! НИКАКИХ проблем!
	OkayKeepIt					=	"SVM_2_OkayKeepIt"					;//Ладно! Забирай!
	WhatsThat					=	"SVM_2_WhatsThat"					;//Эй? Что?
	ThatsMyWeapon				=	"SVM_2_ThatsMyWeapon"				;//Похоже, ты разгуливаешь с моим оружием!
	GiveItToMe					=	"SVM_2_GiveItToMe"					;//Давай, давай сюда!
	YouCanKeeptheCrap			=	"SVM_2_YouCanKeeptheCrap"			;//Мне это все равно не нужно!
	TheyKilledMyFriend			=	"SVM_2_TheyKilledMyFriend"			;//Убили одного из наших! Если найдем того, кто это сделал, ему не поздоровится!
	YouDisturbedMySlumber		=	"SVM_2_YouDisturbedMySlumber"		;//Зачем ты меня поднял?
	SuckerGotSome				=	"SVM_2_SuckerGotSome"				;//Получил? Должен признаться, мне это нравится!
	SuckerDefeatedEBr			=	"SVM_2_SuckerDefeatedEBr"			;//Ты победил Барона!
	SuckerDefeatedGur			=	"SVM_2_SuckerDefeatedGur"			;//Ты победил Гуру! Даже не знаю, чего в этом больше - храбрости или безумия!
	SuckerDefeatedMage			=	"SVM_2_SuckerDefeatedMage"			;//Победить мага... ты, должно быть, храбрый парень!
	SuckerDefeatedNov_Guard		= 	"SVM_2_SuckerDefeatedNov_Guard"		;//Я здесь слежу за порядком!
	SuckerDefeatedVlk_Guard		= 	"SVM_2_SuckerDefeatedVlk_Guard"		;//Мне плевать, из-за чего это произошло! Ты ударил рудокопа, и у тебя проблемы, парень!
	YouDefeatedMyComrade		=	"SVM_2_YouDefeatedMyComrade"		;//Ты ударил моего друга!
	YouDefeatedNOV_Guard		=	"SVM_2_YouDefeatedNOV_Guard"		;//Оставь новичков в покое!
	YouDefeatedVLK_Guard		=	"SVM_2_YouDefeatedVLK_Guard"		;//Ты не трогаешь моих парней! Усек?
	YouStoleFromMe				=	"SVM_2_YouStoleFromMe"				;//Зачем ты обокрал меня?
	YouStoleFromUs				=	"SVM_2_YouStoleFromUs"				;//У тебя есть что-то, что принадлежит нам. Лучше бы тебе вернуть это назад!
	YouStoleFromEBr				=	"SVM_2_YouStoleFromEBr"				;//Парень! Ты обокрал Баронов! Они будут в ярости!
	YouStoleFromGur				=	"SVM_2_YouStoleFromGur"				;//Ты обокрал Гуру! Тебе повезло, что тебя не поймали!
	StoleFromMage				=	"SVM_2_StoleFromMage"				;//Маги не очень любят, когда кто-то роется в их вещах!
	YouKilledMyFriend			=	"SVM_2_YouKilledMyFriend"			;//Жизнь одного из наших людей на твоей совести. Еще один неверный шаг, и ты будешь следующим!
	YouKilledEBr				=	"SVM_2_YouKilledEBr"				;//Ты убил Барона! Парень, ты окончательно спятил?!
	YouKilledGur				=	"SVM_2_YouKilledGur"				;//Ты убил Гуру! Я глазам своим не верю!
	YouKilledMage				=	"SVM_2_YouKilledMage"				;//Ты убил мага! Как ты собираешься объяснить это?
	YouKilledOCfolk				=	"SVM_2_YouKilledOCfolk"				;//Убит человек из Старого Лагеря, и кое-кто связывает тебя с этим убийством...
	YouKilledNCfolk				=	"SVM_2_YouKilledNCfolk"				;//Новый Лагерь понес тяжелую утрату, и, похоже, ты причастен к этому!
	YouKilledPSIfolk			=	"SVM_2_YouKilledPSIfolk"			;//Братство потеряло одного из своих членов, и эта жизнь на твоей совести!
	GetThingsRight				=	"SVM_2_GetThingsRight"				;//Тебе будет нелегко оправдаться!
	YouDefeatedMeWell			=	"SVM_2_YouDefeatedMeWell"			;//Да, ты победил. Это был хороший бой - но сейчас он окончен!
	Smalltalk01					=	"SVM_2_Smalltalk01"					;// ...если ты думаешь...
	Smalltalk02					=	"SVM_2_Smalltalk02"					;// ...может быть...
	Smalltalk03					=	"SVM_2_Smalltalk03"					;// ...это было не слишком умно...
	Smalltalk04					=	"SVM_2_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_2_Smalltalk05"					;// ...это точно не моя проблема...
	Smalltalk06					=	"SVM_2_Smalltalk06"					;// ...похоже, назревает проблема...
	Smalltalk07					=	"SVM_2_Smalltalk07"					;// ...держи это при себе, людям необязательно знать об этом.
	Smalltalk08					=	"SVM_2_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_2_Smalltalk09"					;// ...что-то не так в этой истории...
	Smalltalk10					=	"SVM_2_Smalltalk10"					;// ...ты должен следить за тем, что говоришь людям...
	Smalltalk11					=	"SVM_2_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_2_Smalltalk12"					;// ...ты не должен верить всему...
	Smalltalk13					=	"SVM_2_Smalltalk13"					;// ...не хотел бы я оказаться на его месте...
	Smalltalk14					=	"SVM_2_Smalltalk14"					;// ...каждый раз одна и та же история...
	Smalltalk15					=	"SVM_2_Smalltalk15"					;// ...некоторых людей ничего не учит...
	Smalltalk16					=	"SVM_2_Smalltalk16"					;// ...были времена, когда все было совсем по-другому...
	Smalltalk17					=	"SVM_2_Smalltalk17"					;// ...люди всегда болтают...
	Smalltalk18					=	"SVM_2_Smalltalk18"					;// ...я больше не слушаю всякую трепотню...
	Smalltalk19					=	"SVM_2_Smalltalk19"					;// ...веришь кому-то - и в результате попадаешь в неприятности, так всегда и бывает...
	Smalltalk20					=	"SVM_2_Smalltalk20"					;// ...я сомневаюсь, что это когда-нибудь изменится...
	Smalltalk21					=	"SVM_2_Smalltalk21"					;// ...скорее всего, ты прав...
	Smalltalk22					=	"SVM_2_Smalltalk22"					;// ...держись. Лучше ни во что не встревать с горяча...
	Smalltalk23					=	"SVM_2_Smalltalk23"					;// ...я думал, это выяснили еще очень давно...
	Smalltalk24					=	"SVM_2_Smalltalk24"					;// ...давай поговорим о чем-нибудь еще...
	Om							= 	"SVM_2_Om"							;// Оммм...
};




instance SVM_3 (C_SVM)				 // Depressiv (Resigniert. Menschliches Gemьse. "Ich schau nochґn bisschen an die Decke.." , "Wir sind eh alle verloren..." Nov:Glauben an Drogen
{
	StopMagic					=	"SVM_3_StopMagic"					;//Перестань колдовать!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"				;//Перестань колдовать - немедленно!
	WeaponDown					=	"SVM_3_WeaponDown"					;//Опусти оружие!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"				;//У меня резко испортится настроение, если ты будешь шляться здесь с этим оружием!
	WatchYourAim				=	"SVM_3_WatchYourAim"				;//Почему ты в меня целишься?
	WatchYourAimAngry			=	"SVM_3_WatchYourAimAngry"			;//Убери оружие, или я рассержусь!
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"				;//Эээээээй! Это еще зачем???
	LetsForgetOurLittleFight	=	"SVM_3_LetsForgetOurLittleFight"	;//Ладно, будем считать, что мы не поняли друг друга.
	Strange						=	"SVM_3_Strange"						;//Он исчез, просто исчез?!
	DieMonster					=	"SVM_3_DieMonster"					;//Ну, мерзкая рожа, больше ты меня не побеспокоишь!
	DieMortalEnemy				=	"SVM_3_DieMortalEnemy"				;//Я покончу с тобой!
	NowWait						=	"SVM_3_NowWait"						;//Похоже, мне следует выражаться еще яснее!
	YouStillNotHaveEnough		=	"SVM_3_YouStillNotHaveEnough"		;//Похоже, этого тебе было мало!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Сам напросился!
	NowWaitIntruder				= 	"SVM_3_NowWaitIntruder"				;//Тебе здесь нечего делать. Теперь я должен вбить это в твою пустую башку!
	IWillTeachYouRespectForForeignProperty	=	"SVM_3_IWillTeachYouRespectForForeignProperty"	;//Похоже, стоит сломать тебе пару пальцев - так тебе будет понятней.
	DirtyThief					=	"SVM_3_DirtyThief"					;//Ты вор! Глазам своим не верю!
	YouAttackedMyCharge			=	"SVM_3_YouAttackedMyCharge"			;//Эй, нельзя бить каждого встречного!
	YouKilledOneOfUs			=	"SVM_3_YouKilledOneOfUs"			;//Ты убил одного из наших! Это твоя последняя ошибка!
	Dead						=	"SVM_3_Dead"						;//Аааггл!
	Aargh_1						=	"SVM_3_Aargh_1"						;//Ааргх!
	Aargh_2						=	"SVM_3_Aargh_2"						;//Ааргх!
	Aargh_3						=	"SVM_3_Aargh_3"						;//Ааргх!
	Berzerk						=	"SVM_3_Berzerk"						;//УУАААРРГГГХХХ!!!
	YoullBeSorryForThis			=	"SVM_3_YoullBeSorryForThis"			;//Ты об этом пожалеешь!
	YesYes						=	"SVM_3_YesYes"						;//Ладно, ладно, ты победил!
	ShitWhatAMonster			=	"SVM_3_ShitWhatAMonster"			;//Черт! Беги отсюда!
	Help						=	"SVM_3_Help"						;//Я должен идти!
	WeWillMeetAgain				=	"SVM_3_WeWillMeetAgain"				;//Мы еще встретимся!
	NeverTryThatAgain			=	"SVM_3_NeverTryThatAgain"			;//Больше так не делай!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"				;//Спасибо за оружие!
	ITookYourOre				=	"SVM_3_ITookYourOre"				;//Я просто возьму у тебя немного руды!
	ShitNoOre					=	"SVM_3_ShitNoOre"					;//Нет руды? Хреново, парень, совсем хреново!
	HandsOff					=	"SVM_3_HandsOff"					;//Убери руки!
	GetOutOfHere				=	"SVM_3_GetOutOfHere"				;//Пошел вон!
	YouViolatedForbiddenTerritory=	"SVM_3_YouViolatedForbiddenTerritory";//Эй! Откуда ты?
	YouWannaFoolMe				=	"SVM_3_YouWannaFoolMe"				;//Я не настолько глуп, как ты думаешь!
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"		;//Перестань здесь шляться!
	WhyAreYouInHere				=	"SVM_3_WhyYouAreInHere"				;//Исчезни из моего дома, или я позову стражу!
	WhatDidYouInThere			=	"SVM_3_WhatDidYouInThere"			;//Что ты делаешь? Если я поймаю тебя, тебе конец!
	WiseMove					=	"SVM_3_WiseMove"					;//Ты сам напросился!
	Alarm						=	"SVM_3_Alarm"						;//Стража! Сюда!
	IntruderAlert				= 	"SVM_3_IntruderAlert"				;//ТРЕВОГА!!!
	BehindYou					=	"SVM_3_BehindYou"					;//Берегись!
	TheresAFight				=	"SVM_3_TheresAFight"				;//Драка!
	HeyHeyHey					=	"SVM_3_HeyHeyHey"					;//Врежь ему!
	CheerFight					=	"SVM_3_CheerFight"					;//Что ты пытаешься сделать?
	CheerFriend					=	"SVM_3_CheerFriend"					;//Хороший удар!
	Ooh							=	"SVM_3_Ooh"							;//Оооох!
	YeahWellDone				=	"SVM_3_YeahWellDone"				;//Да! Отлично!
	RunCoward					=	"SVM_3_RunCoward"					;//Он удирает!
	HeDefeatedHim				=	"SVM_3_HeDefeatedHim"				;//Он прикончил его!
	HeDeservedIt				=	"SVM_3_HeDeservedIt"				;//Это успокоит его на какое-то время!
	HeKilledHim					=	"SVM_3_HeKilledHim"					;//Готов. Ты убил его.
	ItWasAGoodFight				=	"SVM_3_ItWasAGoodFight"				;//Сплошные драки...
	Awake						=	"SVM_3_Awake"						;//Ничего не меняется...
	FriendlyGreetings			=	"SVM_3_FriendlyGreetings"			;//Эй, парень.
	ALGreetings					=	"SVM_3_ALGreetings"					;//За Гомеза, да, да.
	MageGreetings				=	"SVM_3_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_3_SectGreetings"				;//Просыпайся!
	ThereHeIs					= 	"SVM_3_ThereHeIs"					;//Он здесь.
	NoLearnNoPoints				= 	"SVM_3_NoLearnNoPoints"				;//Тебе нехватает опыта. Я не могу научить тебя этому!
	NoLearnOverMax				= 	"SVM_3_NoLearnOverMax"				;//Ты на пределе своих возможностей. Тебе нужно научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_3_NoLearnYouAlreadyKnow"		;//Прежде чем стать мастером, ты должен набраться опыта! 
	NoLearnYoureBetter			=	"SVM_3_NoLearnYoureBetter"			;//Уже лучше!
	HeyYou						=	"SVM_3_HeyYou"						;//Эй, ты!
	NotNow						=	"SVM_3_NotNow"						;//Не сейчас!
	WhatDoYouWant				=	"SVM_3_WhatDoYouWant"				;//Что-то ищешь?
	ISaidWhatDoYouWant			=	"SVM_3_ISaidWhatDoYouWant"			;//Могу я что-нибудь для тебя сделать?
	MakeWay						=	"SVM_3_MakeWay"						;//Дай мне пройти!
	OutOfMyWay					=	"SVM_3_OutOfMyWay"					;//С дороги, парень!
	YouDeafOrWhat				=	"SVM_3_YouDeafOrWhat"				;//Сколько раз говорить?! Дай мне пройти!
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"		;//Снова ищешь неприятностей?
	LookAway					=	"SVM_3_LookAway"					;//Я НИЧЕГО не видел! И вообще меня здесь не было!
	OkayKeepIt					=	"SVM_3_OkayKeepIt"					;//Ладно, ладно, возьми!
	WhatsThat					=	"SVM_3_WhatsThat"					;//Что это было?
	ThatsMyWeapon				=	"SVM_3_ThatsMyWeapon"				;//У тебя мое оружие!
	GiveItToMe					=	"SVM_3_GiveItToMe"					;//Отдай!
	YouCanKeeptheCrap			=	"SVM_3_YouCanKeeptheCrap"			;//Как скажешь! Мне это все равно не нужно.
	TheyKilledMyFriend			=	"SVM_3_TheyKilledMyFriend"			;//Они убили еще одного. Никто из нас не уйдет отсюда живым...
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"		;//Ты не дал мне досмотреть такой сон. Что нужно?
	SuckerGotSome				=	"SVM_3_SuckerGotSome"				;//Это послужит тебе хорошим уроком!
	SuckerDefeatedEBr			=	"SVM_3_SuckerDefeatedEBr"			;//Ты победил Барона! Ищешь неприятностей, да?
	SuckerDefeatedGur			=	"SVM_3_SuckerDefeatedGur"			;//Ты победил одного из Гуру. Это они тебе припомнят!
	SuckerDefeatedMage			=	"SVM_3_SuckerDefeatedMage"			;//Победить мага - значит, нажить себе большие неприятности!
	SuckerDefeatedNov_Guard		= 	"SVM_3_SuckerDefeatedNov_Guard"		;//Следующй раз подумаешь, прежде чем задирать новичков!
	SuckerDefeatedVlk_Guard		= 	"SVM_3_SuckerDefeatedVlk_Guard"		;//Если ты ударишь рудокопа, я сделаю то же самое с тобой!
	YouDefeatedMyComrade		=	"SVM_3_YouDefeatedMyComrade"		;//Ты ударил одного из моих друзей!
	YouDefeatedNOV_Guard		=	"SVM_3_YouDefeatedNOV_Guard"		;//Новички здесь под моей защитой! Оставь их!
	YouDefeatedVLK_Guard		=	"SVM_3_YouDefeatedVLK_Guard"		;//Рудокопы платят мне за защиту - и я действительно защищаю их!
	YouStoleFromMe				=	"SVM_3_YouStoleFromMe"				;//Ты обокрал меня, грязный воришка!
	YouStoleFromUs				=	"SVM_3_YouStoleFromUs"				;//У тебя есть что-то, что принадлежит нам. Лучше бы тебе вернуть это назад!
	YouStoleFromEBr				=	"SVM_3_YouStoleFromEBr"				;//Парень! Ты обокрал Баронов! Они будут в ярости!
	YouStoleFromGur				=	"SVM_3_YouStoleFromGur"				;//Ты обокрал Гуру, и они тебя раскрыли - вот жалость!
	StoleFromMage				=	"SVM_3_StoleFromMage"				;//Ты должен быть куда более ловким, чтобы обокрасть мага!
	YouKilledMyFriend			=	"SVM_3_YouKilledMyFriend"			;//На твоей совести жизнь одного из наших людей. Еще одна ошибка, и ты будешь следующим!
	YouKilledEBr				=	"SVM_3_YouKilledEBr"				;//Ты убил Барона! Парень, ты окончательно спятил?!
	YouKilledGur				=	"SVM_3_YouKilledGur"				;//Ты убил Гуру! Я глазам своим не верю!
	YouKilledMage				=	"SVM_3_YouKilledMage"				;//Ты убил мага! Как ты собираешься объяснить это?
	YouKilledOCfolk				=	"SVM_3_YouKilledOCfolk"				;//Убит человек из Старого Лагеря, и кое-кто связывает тебя с этим убийством...
	YouKilledNCfolk				=	"SVM_3_YouKilledNCfolk"				;//Новый Лагерь понес тяжелую утрату, и, похоже, ты причастен к этому!
	YouKilledPSIfolk			=	"SVM_3_YouKilledPSIfolk"			;//Братство потеряло одного из своих членов, и эта жизнь на твоей совести!
	GetThingsRight				=	"SVM_3_GetThingsRight"				;//Тебе будет нелегко оправдаться!
	YouDefeatedMeWell			=	"SVM_3_YouDefeatedMeWell"			;//Хоть ты и одержал верх, это был честный бой!
	Smalltalk01					=	"SVM_3_Smalltalk01"					;// ...если ты думаешь...
	Smalltalk02					=	"SVM_3_Smalltalk02"					;// ...может быть...
	Smalltalk03					=	"SVM_3_Smalltalk03"					;// ...это было не слишком умно...
	Smalltalk04					=	"SVM_3_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_3_Smalltalk05"					;// ...это точно не моя проблема...
	Smalltalk06					=	"SVM_3_Smalltalk06"					;// ...похоже, назревает проблема...
	Smalltalk07					=	"SVM_3_Smalltalk07"					;// ...держи это при себе, людям необязательно знать об этом.
	Smalltalk08					=	"SVM_3_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_3_Smalltalk09"					;// ...что-то не то в этой истории...
	Smalltalk10					=	"SVM_3_Smalltalk10"					;// ...ты должен следить за тем, что говоришь людям...
	Smalltalk11					=	"SVM_3_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_3_Smalltalk12"					;// ...ты не должен верить всему...
	Smalltalk13					=	"SVM_3_Smalltalk13"					;// ...не хотел бы я оказаться на его месте...
	Smalltalk14					=	"SVM_3_Smalltalk14"					;// ...каждый раз одна и та же история...
	Smalltalk15					=	"SVM_3_Smalltalk15"					;// ...некоторых людей ничего не учит...
	Smalltalk16					=	"SVM_3_Smalltalk16"					;// ...были времена, когда все было совсем по-другому...
	Smalltalk17					=	"SVM_3_Smalltalk17"					;// ...люди всегда болтают...
	Smalltalk18					=	"SVM_3_Smalltalk18"					;// ...я больше не слушаю всякую трепотню...
	Smalltalk19					=	"SVM_3_Smalltalk19"					;// ...веришь кому-то - и в результате попадаешь в неприятности, так всегда и бывает...
	Smalltalk20					=	"SVM_3_Smalltalk20"					;// ...я сомневаюсь, что это когда-нибудь изменится...
	Smalltalk21					=	"SVM_3_Smalltalk21"					;// ...скорее всего, ты прав...
	Smalltalk22					=	"SVM_3_Smalltalk22"					;// ...держись. Лучше ни на что не натыкаться...
	Smalltalk23					=	"SVM_3_Smalltalk23"					;// ...я думал, это выяснили еще очень давно...
	Smalltalk24					=	"SVM_3_Smalltalk24"					;// ...давай поговорим о чем-нибудь еще...
	Om							= 	"SVM_3_Om"							;// Оммм...
};


instance SVM_4 (C_SVM)				// Alter Sack,  (Torrez, KDF-Magier, alte Buddler....), alter Hase. Kann Grьnschnдbeln noch was zeigen
{
	StopMagic					=	"SVM_4_StopMagic"					;//Перестань колдовать!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"				;//Послушайся моего совета и перестань колдовать!
	WeaponDown					=	"SVM_4_WeaponDown"					;//Если не хочешь неприятностей, убери оружие!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"				;//Убери оружие - немедленно!
	WatchYourAim				=	"SVM_4_WatchYourAim"				;//Не направляй его на меня!
	WatchYourAimAngry			=	"SVM_4_WatchYourAimAngry"			;//Если не прекратишь, я отниму у тебя эту игрушку!
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"				;//Эй, там! Смотри что делаешь!
	LetsForgetOurLittleFight	=	"SVM_4_LetsForgetOurLittleFight"	;//Забудем об этом!
	Strange						=	"SVM_4_Strange"						;//Выходи! Покажи себя!
	DieMonster					=	"SVM_4_DieMonster"					;//Не важно, скольких ты убьешь, - их будет все больше и больше!
	DieMortalEnemy				=	"SVM_4_DieMortalEnemy"				;//Да, тебе не суждено стать старше!
	NowWait						=	"SVM_4_NowWait"						;//Я научу тебя не связываться со мной...
	YouStillNotHaveEnough		=	"SVM_4_YouStillNotHaveEnough"		;//Тебе мало?
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Сам напросился!
	NowWaitIntruder				= 	"SVM_4_NowWaitIntruder"				;//Забираться сюда было очень глупо!
	IWillTeachYouRespectForForeignProperty	=	"SVM_4_IWillTeachYouRespectForForeignProperty"	;//Ты не можешь безнаказанно шляться здесь!
	DirtyThief					=	"SVM_4_DirtyThief"					;//Ты посмел обокрасть меня?!
	YouAttackedMyCharge			=	"SVM_4_YouAttackedMyCharge"			;//Нарываться на неприятности с нами - это не пойдет тебе на пользу.
	YouKilledOneOfUs			=	"SVM_4_YouKilledOneOfUs"			;//Ты убил одного из наших! Глаз за глаз!
	Dead						=	"SVM_4_Dead"						;//Аааргл!
	Aargh_1						=	"SVM_4_Aargh_1"						;//Ааргх!
	Aargh_2						=	"SVM_4_Aargh_2"						;//Ааргх!
	Aargh_3						=	"SVM_4_Aargh_3"						;//Ааргх!
	Berzerk						=	"SVM_4_Berzerk"						;//УУАААРРГГГХХХ!!!
	YoullBeSorryForThis			=	"SVM_4_YoullBeSorryForThis"			;//Ты об этом пожалеешь!
	YesYes						=	"SVM_4_YesYes"						;//Не волнуйся, ты победил!
	ShitWhatAMonster			=	"SVM_4_ShitWhatAMonster"			;//Сматываемся отсюда, быстро!
	Help						=	"SVM_4_Help"						;//Я слишком стар для всего этого!
	WeWillMeetAgain				=	"SVM_4_WeWillMeetAgain"				;//Я запомню это!
	NeverTryThatAgain			=	"SVM_4_NeverTryThatAgain"			;//Больше этого не делай!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"				;//Пожалуй, я заберу это оружие!
	ITookYourOre				=	"SVM_4_ITookYourOre"				;//Не волнуйся: когда с тобой будет покончено, я позабочусь о твоей руде!
	ShitNoOre					=	"SVM_4_ShitNoOre"					;//Нет даже дрянного куска руды...
	HandsOff					=	"SVM_4_HandsOff"					;//Убери руки!
	GetOutOfHere				=	"SVM_4_GetOutOfHere"				;//Исчезни!
	YouViolatedForbiddenTerritory=	"SVM_4_YouViolatedForbiddenTerritory";//Тебе здесь нечего делать!
	YouWannaFoolMe				=	"SVM_4_YouWannaFoolMe"				;//У меня нет настроения шутить с тобой!
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"		;//Эй, ты! Что ты здесь шляешься?
	WhyAreYouInHere				=	"SVM_4_WhyYouAreInHere"				;//Убирайся или я позову стражу!
	WhatDidYouInThere			=	"SVM_4_WhatDidYouInThere"			;//Что ты там делаешь?
	WiseMove					=	"SVM_4_WiseMove"					;//Тебе еще повезло.
	Alarm						=	"SVM_4_Alarm"						;//Стража! Сюда!
	IntruderAlert				= 	"SVM_4_IntruderAlert"				;//ЧУЖОЙ!!!
	BehindYou					=	"SVM_4_BehindYou"					;//Сзади!
	TheresAFight				=	"SVM_4_TheresAFight"				;//Снова драка.
	HeyHeyHey					=	"SVM_4_HeyHeyHey"					;//Сильнее!
	CheerFight					=	"SVM_4_CheerFight"					;//И это все, на что ты способен?!
	CheerFriend					=	"SVM_4_CheerFriend"					;//Врежь ему!
	Ooh							=	"SVM_4_Ooh"							;//Бей в ответ!
	YeahWellDone				=	"SVM_4_YeahWellDone"				;//Хорошо!
	RunCoward					=	"SVM_4_RunCoward"					;//Этот трус убегает!
	HeDefeatedHim				=	"SVM_4_HeDefeatedHim"				;//Во времена моей молодости люди были покрепче!
	HeDeservedIt				=	"SVM_4_HeDeservedIt"				;//Это твоя вина!
	HeKilledHim					=	"SVM_4_HeKilledHim"					;//Ты убил его! Это была большая ошибка!
	ItWasAGoodFight				=	"SVM_4_ItWasAGoodFight"				;//В давние времена сражения были не чета теперешним.
	Awake						=	"SVM_4_Awake"						;//[зевок]
	FriendlyGreetings			=	"SVM_4_FriendlyGreetings"			;//Приветствую.
	ALGreetings					=	"SVM_4_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_4_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_4_SectGreetings"				;//Проснись!
	ThereHeIs					= 	"SVM_4_ThereHeIs"					;//Он там!
	NoLearnNoPoints				= 	"SVM_4_NoLearnNoPoints"				;//Я ничему не могу научить тебя. Тебе нехватает опыта. 
	NoLearnOverMax				= 	"SVM_4_NoLearnOverMax"				;//Ты на пределе своих возможностей. Тебе нужно научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_4_NoLearnYouAlreadyKnow"		;//Прежде чем стать мастером, ты должен набраться опыта! 
	NoLearnYoureBetter			=	"SVM_4_NoLearnYoureBetter"			;//Уже лучше!
	HeyYou						=	"SVM_4_HeyYou"						;//Эй, ты!
	NotNow						=	"SVM_4_NotNow"						;//Не сейчас!
	WhatDoYouWant				=	"SVM_4_WhatDoYouWant"				;//Что ты хочешь?
	ISaidWhatDoYouWant			=	"SVM_4_ISaidWhatDoYouWant"			;//Тебе что-нибудь нужно?
	MakeWay						=	"SVM_4_MakeWay"						;//Дай мне пройти!
	OutOfMyWay					=	"SVM_4_OutOfMyWay"					;//С дороги!
	YouDeafOrWhat				=	"SVM_4_YouDeafOrWhat"				;//С дороги, или ты пожалеешь!
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"		;//Снова ищешь неприятностей?
	LookAway					=	"SVM_4_LookAway"					;//Ничего не видел, ничего не слышал и никому ничего не скажу...
	OkayKeepIt					=	"SVM_4_OkayKeepIt"					;//Возьми себе!
	WhatsThat					=	"SVM_4_WhatsThat"					;//Что это было?
	ThatsMyWeapon				=	"SVM_4_ThatsMyWeapon"				;//Будь хорошим мальчиком и верни мое оружие!
	GiveItToMe					=	"SVM_4_GiveItToMe"					;//Ну, дай сюда!
	YouCanKeeptheCrap			=	"SVM_4_YouCanKeeptheCrap"			;//Нет-нет! Я рад избавиться от этого!
	TheyKilledMyFriend			=	"SVM_4_TheyKilledMyFriend"			;//Если я узнаю, кто убил одного из наших...
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"		;//Ты потревожил мой сон!
	SuckerGotSome				=	"SVM_4_SuckerGotSome"				;//Не везет, а? Но тебе нужна была хорошая трепка!
	SuckerDefeatedEBr			=	"SVM_4_SuckerDefeatedEBr"			;//Ты победил Барона! 
	SuckerDefeatedGur			=	"SVM_4_SuckerDefeatedGur"			;//Ты победил одного из Гуру. Впечатляет. Но даже не пытайся сделать это еще раз!
	SuckerDefeatedMage			=	"SVM_4_SuckerDefeatedMage"			;//Победить мага... ты, должно быть, храбрый парень!
	SuckerDefeatedNov_Guard		= 	"SVM_4_SuckerDefeatedNov_Guard"		;//Нужно быть полным придурком, чтобы драться с новичками!
	SuckerDefeatedVlk_Guard		= 	"SVM_4_SuckerDefeatedVlk_Guard"		;//Думаешь, тебе позволено бить рудокопов?
	YouDefeatedMyComrade		=	"SVM_4_YouDefeatedMyComrade"		;//Ты ударил одного из моих друзей! Рискуешь, парень!
	YouDefeatedNOV_Guard		=	"SVM_4_YouDefeatedNOV_Guard"		;//Еще раз обидишь новичка, и ты об этом крупно пожалеешь!
	YouDefeatedVLK_Guard		=	"SVM_4_YouDefeatedVLK_Guard"		;//Может быть ты и храбр, но обижать людей, которые находятся под чьей-нибудь защитой, все равно опасно.
	YouStoleFromMe				=	"SVM_4_YouStoleFromMe"				;//Убери руки от моих вещей, понял?
	YouStoleFromUs				=	"SVM_4_YouStoleFromUs"				;//У тебя есть что-то, что принадлежит нам. Верни наши вещи!
	YouStoleFromEBr				=	"SVM_4_YouStoleFromEBr"				;//Парень! Ты обокрал Баронов! Они будут в ярости!
	YouStoleFromGur				=	"SVM_4_YouStoleFromGur"				;//Ты обокрал Гуру! Ну уж по крайней мере тебе не стоило попадаться!
	StoleFromMage				=	"SVM_4_StoleFromMage"				;//Маги не очень любят, когда кто-то роется в их вещах!
	YouKilledMyFriend			=	"SVM_4_YouKilledMyFriend"			;//На твоей совести жизнь одного из наших людей. Еще одна ошибка, и ты будешь следующим!
	YouKilledEBr				=	"SVM_4_YouKilledEBr"				;//Ты убил Барона! Парень, ты окончательно спятил?!
	YouKilledGur				=	"SVM_4_YouKilledGur"				;//Ты убил Гуру! Я глазам своим не верю!
	YouKilledMage				=	"SVM_4_YouKilledMage"				;//Ты убил мага! Как ты собираешься объяснить это?
	YouKilledOCfolk				=	"SVM_4_YouKilledOCfolk"				;//Убит человек из Старого Лагеря, и кое-кто связывает тебя с этим убийством...
	YouKilledNCfolk				=	"SVM_4_YouKilledNCfolk"				;//Новый Лагерь понес тяжелую утрату, и, похоже, ты причастен к этому!
	YouKilledPSIfolk			=	"SVM_4_YouKilledPSIfolk"			;//Братство потеряло одного из своих членов, и эта жизнь на твоей совести!
	GetThingsRight				=	"SVM_4_GetThingsRight"				;//Тебе будет нелегко оправдаться!
	YouDefeatedMeWell			=	"SVM_4_YouDefeatedMeWell"			;//Ты задал мне хорошую трепку, парень. Это был неплохой бой, но теперь он окончен!
	Smalltalk01					=	"SVM_4_Smalltalk01"					;// ...если ты думаешь...
	Smalltalk02					=	"SVM_4_Smalltalk02"					;// ...может быть...
	Smalltalk03					=	"SVM_4_Smalltalk03"					;// ...это было не слишком умно...
	Smalltalk04					=	"SVM_4_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_4_Smalltalk05"					;// ...это точно не моя проблема...
	Smalltalk06					=	"SVM_4_Smalltalk06"					;// ...похоже, назревает проблема...
	Smalltalk07					=	"SVM_4_Smalltalk07"					;// ...держи это при себе, людям необязательно знать об этом.
	Smalltalk08					=	"SVM_4_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_4_Smalltalk09"					;// ...что-то не то в этой истории...
	Smalltalk10					=	"SVM_4_Smalltalk10"					;// ...ты должен следить за тем, что говоришь людям...
	Smalltalk11					=	"SVM_4_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_4_Smalltalk12"					;// ...ты не должен верить всему...
	Smalltalk13					=	"SVM_4_Smalltalk13"					;// ...не хотел бы я оказаться на его месте...
	Smalltalk14					=	"SVM_4_Smalltalk14"					;// ...каждый раз одна и та же история...
	Smalltalk15					=	"SVM_4_Smalltalk15"					;// ...некоторых людей ничего не учит...
	Smalltalk16					=	"SVM_4_Smalltalk16"					;// ...были времена, когда все было совсем по-другому...
	Smalltalk17					=	"SVM_4_Smalltalk17"					;// ...люди всегда болтают...
	Smalltalk18					=	"SVM_4_Smalltalk18"					;// ...я больше не слушаю всякую трепотню...
	Smalltalk19					=	"SVM_4_Smalltalk19"					;// ...веришь кому-то - и в результате попадаешь в неприятности, так всегда и бывает...
	Smalltalk20					=	"SVM_4_Smalltalk20"					;// ...я сомневаюсь, что это когда-нибудь изменится...
	Smalltalk21					=	"SVM_4_Smalltalk21"					;// ...скорее всего, ты прав...
	Smalltalk22					=	"SVM_4_Smalltalk22"					;// ...держись. Лучше ни на что не натыкаться...
	Smalltalk23					=	"SVM_4_Smalltalk23"					;// ...я думал, это выяснили еще очень давно...
	Smalltalk24					=	"SVM_4_Smalltalk24"					;// ...давай поговорим о чем-нибудь еще...
	Om							= 	"SVM_4_Om"							;//Оммм...
};


instance SVM_5 (C_SVM)				//Lebenskьnstler, offen, Frцhlich. humorvoller Verarscher. Auch: Fauler Verpisser. SelbstbewuЯt, wortgewandt, charismatisch. (Lester)
{
	StopMagic					=	"SVM_5_StopMagic"					;//Перестань колдовать!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Кажется, я сказал: 'Перестань колдовать!'
	WeaponDown					=	"SVM_5_WeaponDown"					;//Что ты собираешься делать с оружем, парень?
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Давай, убирай его!
	WatchYourAim				=	"SVM_5_WatchYourAim"				;//Ты целишься в меня, клоун!
	WatchYourAimAngry			=	"SVM_5_WatchYourAimAngry"			;//Если не прекратишь, я тоже потренируюсь на тебе!
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//Эй, ты слепой или как?
	LetsForgetOurLittleFight	=	"SVM_5_LetsForgetOurLittleFight"	;//Забудем об этом, ладно?
	Strange						=	"SVM_5_Strange"						;//Но он был здесь секунду назад!? Странно! 
	DieMonster					=	"SVM_5_DieMonster"					;//Твоя очередь, ублюдок!
	DieMortalEnemy				=	"SVM_5_DieMortalEnemy"				;//Пришло время расплаты!
	NowWait						=	"SVM_5_NowWait"						;//Ты напрашиваешься на хорошую взбучку!
	YouStillNotHaveEnough		=	"SVM_5_YouStillNotHaveEnough"		;//Тебе все еще мало?
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Ну, ты сам напросился!
	NowWaitIntruder				= 	"SVM_5_NowWaitIntruder"				;//Тебя должны вынести отсюда!
	IWillTeachYouRespectForForeignProperty	=	"SVM_5_IWillTeachYouRespectForForeignProperty"	;//Я предупредил тебя. Дотронешься до моих вещей, и будет худо!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Вор! Я научу тебя хорошим манерам!
	YouAttackedMyCharge			=	"SVM_5_YouAttackedMyCharge"			;//Все, кто обижал моих друзей, потом сильно раскаивались в этом!
	YouKilledOneOfUs			=	"SVM_5_YouKilledOneOfUs"			;//Ты убил одного из моих людей. Теперь я убью ТЕБЯ!
	Dead						=	"SVM_5_Dead"					;//Аааргл!
	Aargh_1						=	"SVM_5_Aargh_1"						;//Ааарг!
	Aargh_2						=	"SVM_5_Aargh_2"						;//Ааарг!
	Aargh_3						=	"SVM_5_Aargh_3"						;//Ааарг!
	Berzerk						=	"SVM_5_Berzerk"						;//УУАААРРГГГХХХ!!!
	YoullBeSorryForThis			=	"SVM_5_YoullBeSorryForThis"			;//Ты об этом пожалеешь!
	YesYes						=	"SVM_5_YesYes"						;//Спокойно! Ты победил.
	ShitWhatAMonster			=	"SVM_5_ShitWhatAMonster"			;//Этот мне не по зубам!
	Help						=	"SVM_5_Help"						;//Черт!
	WeWillMeetAgain				=	"SVM_5_WeWillMeetAgain"				;//Поговорим в следующий раз!
	NeverTryThatAgain			=	"SVM_5_NeverTryThatAgain"			;//Больше не делай этого!
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Мне нравится это оружие!
	ITookYourOre				=	"SVM_5_ITookYourOre"				;//Я постараюсь с пользой потратить твою руду!
	ShitNoOre					=	"SVM_5_ShitNoOre"					;//Неудачно. Руды нет!
	HandsOff					=	"SVM_5_HandsOff"					;//Убери руки!
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Убирайся отсюда!
	YouViolatedForbiddenTerritory=	"SVM_5_YouViolatedForbiddenTerritory";//Эй! Откуда ты?
	YouWannaFoolMe				=	"SVM_5_YouWannaFoolMe"				;//Хорошая шутка!
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Что ты здесь шляешься?
	WhyAreYouInHere				=	"SVM_5_WhyYouAreInHere"				;//Убирайся отсюда, или я позову стражу!
	WhatDidYouInThere			=	"SVM_5_WhatDidYouInThere"			;//Тебе здесь нечего делать!
	WiseMove					=	"SVM_5_WiseMove"					;//Ты быстро учишься!
	Alarm						=	"SVM_5_Alarm"						;//Стража! Сюда!
	IntruderAlert				= 	"SVM_5_IntruderAlert"				;//ТРЕВОГА!!!
	BehindYou					=	"SVM_5_BehindYou"					;//Эй, смотри!
	TheresAFight				=	"SVM_5_TheresAFight"				;//Драка!
	HeyHeyHey					=	"SVM_5_HeyHeyHey"					;//Как тебе это?!
	CheerFight					=	"SVM_5_CheerFight"					;//Хорошо!
	CheerFriend					=	"SVM_5_CheerFriend"					;//Врежь ему еще разок!
	Ooh							=	"SVM_5_Ooh"							;//Осторожней!
	YeahWellDone				=	"SVM_5_YeahWellDone"				;//Как раз вовремя!
	RunCoward					=	"SVM_5_RunCoward"					;//Парень удирает!
	HeDefeatedHim				=	"SVM_5_HeDefeatedHim"				;//Я бы сказал, чистая победа!
	HeDeservedIt				=	"SVM_5_HeDeservedIt"				;//Он это заслужил!
	HeKilledHim					=	"SVM_5_HeKilledHim"					;//Ты убиваешь людей. Теперь у тебя большие неприятности!
	ItWasAGoodFight				=	"SVM_5_ItWasAGoodFight"				;//Что за бой!
	Awake						=	"SVM_5_Awake"						;//[зевок]
	FriendlyGreetings			=	"SVM_5_FriendlyGreetings"			;//Привет, друг!
	ALGreetings					=	"SVM_5_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_5_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_5_SectGreetings"				;//Проснись!
	ThereHeIs					= 	"SVM_5_ThereHeIs"					;//Сюда.
	NoLearnNoPoints				= 	"SVM_5_NoLearnNoPoints"				;//Я не могу учить тебя, ты слишком неопытен.
	NoLearnOverMax				= 	"SVM_5_NoLearnOverMax"				;//Ты на пределе своих возможностей. Тебе нужно научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_5_NoLearnYouAlreadyKnow"		;//Тебе нужно набраться опыта, прежде чем ты сможешь стать мастером.
	NoLearnYoureBetter			=	"SVM_5_NoLearnYoureBetter"			;//Уже лучше!
	HeyYou						=	"SVM_5_HeyYou"						;//Эй, ты!
	NotNow						=	"SVM_5_NotNow"						;//Не сейчас.
	WhatDoYouWant				=	"SVM_5_WhatDoYouWant"				;//Тебе помочь?
	ISaidWhatDoYouWant			=	"SVM_5_ISaidWhatDoYouWant"			;//Что ты хочешь?
	MakeWay						=	"SVM_5_MakeWay"						;//Дай мне пройти!
	OutOfMyWay					=	"SVM_5_OutOfMyWay"					;//Ну же, мне нужно пройти!
	YouDeafOrWhat				=	"SVM_5_YouDeafOrWhat"				;//Ты глухой или ищешь неприятностей?
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//Снова ищешь неприятностей?
	LookAway					=	"SVM_5_LookAway"					;//Я НИЧЕГО не видел... И вообще, что произошло?
	OkayKeepIt					=	"SVM_5_OkayKeepIt"					;//Ладно, забирай это!
	WhatsThat					=	"SVM_5_WhatsThat"					;//Что это было?
	ThatsMyWeapon				=	"SVM_5_ThatsMyWeapon"				;//Я хочу получить назад свое оружие!
	GiveItToMe					=	"SVM_5_GiveItToMe"					;//Давай сюда!
	YouCanKeeptheCrap			=	"SVM_5_YouCanKeeptheCrap"			;//Ну, не так уж плохо! У меня есть еще!
	TheyKilledMyFriend			=	"SVM_5_TheyKilledMyFriend"			;//Убили одного из наших! Если я доберусь до этого наглеца...
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//Эй, это еще зачем? Зачем ты меня разбудил?
	SuckerGotSome				=	"SVM_5_SuckerGotSome"				;//А? Получил в морду? Это послужит тебе уроком!
	SuckerDefeatedEBr			=	"SVM_5_SuckerDefeatedEBr"			;//Ты ударил Барона. Это его впечатлило, да еще как!
	SuckerDefeatedGur			=	"SVM_5_SuckerDefeatedGur"			;//Ты победил одного из Гуру! Впечатляет. Но даже не пытайся сделать это еще раз.
	SuckerDefeatedMage			=	"SVM_5_SuckerDefeatedMage"			;//Победить мага... ты, должно быть, храбрый парень!
	SuckerDefeatedNov_Guard		= 	"SVM_5_SuckerDefeatedNov_Guard"		;//Только идиот будет драться с новичками!
	SuckerDefeatedVlk_Guard		= 	"SVM_5_SuckerDefeatedVlk_Guard"		;//Думаешь, тебе позволено бить рудокопов?
	YouDefeatedMyComrade		=	"SVM_5_YouDefeatedMyComrade"		;//Ты ударил моего друга - какого черта?!
	YouDefeatedNOV_Guard		=	"SVM_5_YouDefeatedNOV_Guard"		;//Еще раз обидишь новичка, и ты пожалеешь!
	YouDefeatedVLK_Guard		=	"SVM_5_YouDefeatedVLK_Guard"		;//Ты храбрый парень, но никому не позволено обижать тех, кого я защищаю.
	YouStoleFromMe				=	"SVM_5_YouStoleFromMe"				;//Как ты посмел появиться здесь, грязный воришка?
	YouStoleFromUs				=	"SVM_5_YouStoleFromUs"				;//У тебя есть что-то, что принадлежит нам. Лучше бы тебе вернуть это назад!
	YouStoleFromEBr				=	"SVM_5_YouStoleFromEBr"				;//Парень! Ты обокрал Баронов! Они будут в ярости!
	YouStoleFromGur				=	"SVM_5_YouStoleFromGur"				;//Ты обокрал Гуру! Тебе не стоило попадаться на этом!
	StoleFromMage				=	"SVM_5_StoleFromMage"				;//Маги не любят тех, кто роется в их вещах!
	YouKilledMyFriend			=	"SVM_5_YouKilledMyFriend"			;//Жизнь одного из наших людей на твоей совести. Еще одна ошибка, и настанет твоя очередь!
	YouKilledEBr				=	"SVM_5_YouKilledEBr"				;//Ты убил Барона! Парень, ты окончательно спятил?!
	YouKilledGur				=	"SVM_5_YouKilledGur"				;//Ты убил Гуру! Я глазам своим не верю!
	YouKilledMage				=	"SVM_5_YouKilledMage"				;//Ты убил мага! Как ты собираешься объяснить это?
	YouKilledOCfolk				=	"SVM_5_YouKilledOCfolk"				;//Убит человек из Старого Лагеря, и кое-кто связывает тебя с этим убийством...
	YouKilledNCfolk				=	"SVM_5_YouKilledNCfolk"				;//Новый Лагерь понес тяжелую утрату, и, похоже, ты причастен к этому!
	YouKilledPSIfolk			=	"SVM_5_YouKilledPSIfolk"			;//Братство потеряло одного из своих членов, и эта жизнь на твоей совести!
	GetThingsRight				=	"SVM_5_GetThingsRight"				;//Тебе будет нелегко оправдаться!
	YouDefeatedMeWell			=	"SVM_5_YouDefeatedMeWell"			;//Ты задал мне хорошу трепку, парень. Это был хороший бой, но сейчас он окончен!
	Smalltalk01					=	"SVM_5_Smalltalk01"					;// ...если ты думаешь...
	Smalltalk02					=	"SVM_5_Smalltalk02"					;// ...может быть...
	Smalltalk03					=	"SVM_5_Smalltalk03"					;// ...это было не слишком умно...
	Smalltalk04					=	"SVM_5_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_5_Smalltalk05"					;// ...это точно не моя проблема...
	Smalltalk06					=	"SVM_5_Smalltalk06"					;// ...похоже, назревает проблема...
	Smalltalk07					=	"SVM_5_Smalltalk07"					;// ...держи это при себе, людям необязательно знать об этом.
	Smalltalk08					=	"SVM_5_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_5_Smalltalk09"					;// ...что-то не то в этой истории...
	Smalltalk10					=	"SVM_5_Smalltalk10"					;// ...ты должен следить за тем, что говоришь людям...
	Smalltalk11					=	"SVM_5_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_5_Smalltalk12"					;// ...ты не должен верить всему...
	Smalltalk13					=	"SVM_5_Smalltalk13"					;// ...не хотел бы я оказаться на его месте...
	Smalltalk14					=	"SVM_5_Smalltalk14"					;// ...каждый раз одна и та же история...
	Smalltalk15					=	"SVM_5_Smalltalk15"					;// ...некоторых людей ничего не учит...
	Smalltalk16					=	"SVM_5_Smalltalk16"					;// ...были времена, когда все было совсем по-другому...
	Smalltalk17					=	"SVM_5_Smalltalk17"					;// ...люди всегда болтают...
	Smalltalk18					=	"SVM_5_Smalltalk18"					;// ...я больше не слушаю всякую трепотню...
	Smalltalk19					=	"SVM_5_Smalltalk19"					;// ...веришь кому-то - и в результате попадаешь в неприятности, так всегда и бывает...
	Smalltalk20					=	"SVM_5_Smalltalk20"					;// ...я сомневаюсь, что это когда-нибудь изменится...
	Smalltalk21					=	"SVM_5_Smalltalk21"					;// ...скорее всего, ты прав...
	Smalltalk22					=	"SVM_5_Smalltalk22"					;// ...держись. Лучше ни на что не натыкаться...
	Smalltalk23					=	"SVM_5_Smalltalk23"					;// ...я думал, это выяснили еще очень давно...
	Smalltalk24					=	"SVM_5_Smalltalk24"					;// ...давай поговорим о чем-нибудь еще...
	Om							= 	"SVM_5_Om"							;//Оммм...
};

//////////////////////////////////////////
instance SVM_6 (C_SVM)				//Raufbold	(Will saufen und raufen	(Matrose) Alkoholiker. Grцlt viel)
{
	StopMagic					=	"SVM_6_StopMagic"					;//Перестань колдовать!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"				;//Прекрати колдовать! Немедленно!
	WeaponDown					=	"SVM_6_WeaponDown"					;//Убери это чертово оружие!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"				;//Ищешь неприятностей? Немедленно убери это!!!
	WatchYourAim				=	"SVM_6_WatchYourAim"				;//Опусти оружие, или ты пожалеешь!
	WatchYourAimAngry			=	"SVM_6_WatchYourAimAngry"			;//Продолжай целиться в меня, и я начищу тебе рыло!
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"				;//Эй! Смотри, что делаешь!
	LetsForgetOurLittleFight	=	"SVM_6_LetsForgetOurLittleFight"	;//Эй, парень! Забудем об этом, ладно?
	Strange						=	"SVM_6_Strange"						;//Выходи! Покажи себя!
	DieMonster					=	"SVM_6_DieMonster"					;//Я пущу тебя на мясо, свинья!
	DieMortalEnemy				=	"SVM_6_DieMortalEnemy"				;//Пришло время расплаты!
	NowWait						=	"SVM_6_NowWait"						;//Теперь ты точно получишь...
	YouStillNotHaveEnough		=	"SVM_6_YouStillNotHaveEnough"		;//Похоже, ты хочешь получить в морду!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Ну, ты сам напросился!
	NowWaitIntruder				= 	"SVM_6_NowWaitIntruder"				;//Я порублю тебя на куски!
	IWillTeachYouRespectForForeignProperty	=	"SVM_6_IWillTeachYouRespectForForeignProperty"	;//Я предупредил тебя. Дотронешься до моих вещей, и будет худо!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Вор! Я прикончу тебя!
	YouAttackedMyCharge			=	"SVM_6_YouAttackedMyCharge"			;//Никто не смеет обижать моих друзей!
	YouKilledOneOfUs			=	"SVM_6_YouKilledOneOfUs"			;//Ты убил одного из моих людей. Теперь я убью ТЕБЯ!
	Dead						=	"SVM_6_Dead"						;//Аааргл!
	Aargh_1						=	"SVM_6_Aargh_1"						;//Ааарг!
	Aargh_2						=	"SVM_6_Aargh_2"						;//Ааарг!
	Aargh_3						=	"SVM_6_Aargh_3"						;//Ааарг!
	Berzerk						=	"SVM_6_Berzerk"						;//УУАААРРГГГХХХ!!!
	YoullBeSorryForThis			=	"SVM_6_YoullBeSorryForThis"			;//Ты об этом пожалеешь!
	YesYes						=	"SVM_6_YesYes"						;//Да, да! Без паники! Ты победил.
	ShitWhatAMonster			=	"SVM_6_ShitWhatAMonster"			;//Черт, что за тварь! Исчезни отсюда, быстро!
	Help						=	"SVM_6_Help"						;//Черт!
	WeWillMeetAgain				=	"SVM_6_WeWillMeetAgain"				;//Ты меня еще узнаешь!
	NeverTryThatAgain			=	"SVM_6_NeverTryThatAgain"			;//Еще один раз, и ты пожалеешь об этом!
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"				;//Это оружие кажется довольно удобным!
	ITookYourOre				=	"SVM_6_ITookYourOre"				;//Спасибо за руду, я выпью за твое здоровье!
	ShitNoOre					=	"SVM_6_ShitNoOre"					;//Черт, у него даже нет руды...
	HandsOff					=	"SVM_6_HandsOff"					;//Убери руки!
	GetOutOfHere				=	"SVM_6_GetOutOfHere"				;//Убирайся отсюда!
	YouViolatedForbiddenTerritory=	"SVM_6_YouViolatedForbiddenTerritory";//Эй! Откуда ты?
	YouWannaFoolMe				=	"SVM_6_YouWannaFoolMe"				;//Да, ты думаешь, я тупой?
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"		;//Эй, что ты здесь шляешься?
	WhyAreYouInHere				=	"SVM_6_WhyYouAreInHere"				;//Убирайся отсюда, или я позову стражу!
	WhatDidYouInThere			=	"SVM_6_WhatDidYouInThere"			;//Что ты там делаешь?
	WiseMove					=	"SVM_6_WiseMove"					;//Вот это удача!
	Alarm						=	"SVM_6_Alarm"						;//Стража! Сюда!
	IntruderAlert				= 	"SVM_6_IntruderAlert"				;//ТРЕВОГА!!! ЧУЖОЙ!!!
	BehindYou					=	"SVM_6_BehindYou"					;//Сзади!
	TheresAFight				=	"SVM_6_TheresAFight"				;//А, драка!
	HeyHeyHey					=	"SVM_6_HeyHeyHey"					;//Сильнее!
	CheerFight					=	"SVM_6_CheerFight"					;//Ты дерешься как баба!
	CheerFriend					=	"SVM_6_CheerFriend"					;//Прикончи его!
	Ooh							=	"SVM_6_Ooh"							;//Давай, давай! Дай ему в морду!
	YeahWellDone				=	"SVM_6_YeahWellDone"				;//Врежь ему! Он еще шевелится!
	RunCoward					=	"SVM_6_RunCoward"					;//Возвращайся, трус!
	HeDefeatedHim				=	"SVM_6_HeDefeatedHim"				;//Хватит с него!
	HeDeservedIt				=	"SVM_6_HeDeservedIt"				;//Это послужит ему уроком!
	HeKilledHim					=	"SVM_6_HeKilledHim"					;//Готов! Это отучит тебя убивать людей!
	ItWasAGoodFight				=	"SVM_6_ItWasAGoodFight"				;//Ха, ха, ха! Ну, ты показал ему!
	Awake						=	"SVM_6_Awake"						;//[зевок]
	FriendlyGreetings			=	"SVM_6_FriendlyGreetings"			;//Привет!
	ALGreetings					=	"SVM_6_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_6_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_6_SectGreetings"				;//Проснись!
	ThereHeIs					= 	"SVM_6_ThereHeIs"					;//Он там.
	NoLearnNoPoints				= 	"SVM_6_NoLearnNoPoints"				;//Я не могу учить тебя, ты слишком неопытен.
	NoLearnOverMax				= 	"SVM_6_NoLearnOverMax"				;//Ты на пределе своих возможностей. Тебе нужно научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_6_NoLearnYouAlreadyKnow"		;//Тебе нужно набраться опыта, прежде чем ты сможешь стать мастером.
	NoLearnYoureBetter			=	"SVM_6_NoLearnYoureBetter"			;//Уже лучше!
	HeyYou						=	"SVM_6_HeyYou"						;//Эй, ты!
	NotNow						=	"SVM_6_NotNow"						;//Не сейчас.
	WhatDoYouWant				=	"SVM_6_WhatDoYouWant"				;//Что тебе нужно?
	ISaidWhatDoYouWant			=	"SVM_6_ISaidWhatDoYouWant"			;//Нашел что-нибудь?
	MakeWay						=	"SVM_6_MakeWay"						;//Дай мне пройти!
	OutOfMyWay					=	"SVM_6_OutOfMyWay"					;//Эй, посторонись!
	YouDeafOrWhat				=	"SVM_6_YouDeafOrWhat"				;//Исчезни! Мне что - нужно вбить это в твою тупую башку?
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"		;//Снова ищешь неприятностей?
	LookAway					=	"SVM_6_LookAway"					;//Я ничего не видел! Честно!
	OkayKeepIt					=	"SVM_6_OkayKeepIt"					;//Ладно, ладно, оставь себе!
	WhatsThat					=	"SVM_6_WhatsThat"					;//Что это было?
	ThatsMyWeapon				=	"SVM_6_ThatsMyWeapon"				;//Эй ты, шутник, я хочу получить назад свое оружие!
	GiveItToMe					=	"SVM_6_GiveItToMe"					;//Дай сюда, парень!
	YouCanKeeptheCrap			=	"SVM_6_YouCanKeeptheCrap"			;//Не имеет значения! Мне это больше все равно не нужно!
	TheyKilledMyFriend			=	"SVM_6_TheyKilledMyFriend"			;//Убили одного из наших! Если я доберусь до этого наглеца...
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"		;//Проклятье, зачем ты разбудил меня?
	SuckerGotSome				=	"SVM_6_SuckerGotSome"				;//Получил? Это послужит тебе уроком!
	SuckerDefeatedEBr			=	"SVM_6_SuckerDefeatedEBr"			;//Ты ударил Барона. Как же он зол!
	SuckerDefeatedGur			=	"SVM_6_SuckerDefeatedGur"			;//Ты ударил Гуру. Похоже, у тебя талант находить неприятности!
	SuckerDefeatedMage			=	"SVM_6_SuckerDefeatedMage"			;//Победить мага - дурацкая идея, парень!
	SuckerDefeatedNov_Guard		= 	"SVM_6_SuckerDefeatedNov_Guard"		;//Нельзя просто так бить новичков!
	SuckerDefeatedVlk_Guard		= 	"SVM_6_SuckerDefeatedVlk_Guard"		;//Оставь моих людей в покое!
	YouDefeatedMyComrade		=	"SVM_6_YouDefeatedMyComrade"		;//Ты ударил моего друга...
	YouDefeatedNOV_Guard		=	"SVM_6_YouDefeatedNOV_Guard"		;//Вряд ли все будут долго терпеть твои выходки!
	YouDefeatedVLK_Guard		=	"SVM_6_YouDefeatedVLK_Guard"		;//Прежде чем ударить того, кто находится под моей защитой, подумай о последствиях!
	YouStoleFromMe				=	"SVM_6_YouStoleFromMe"				;//Ты пытался обокрасть меня, ублюдок! Больше не попадайся мне на глаза!
	YouStoleFromUs				=	"SVM_6_YouStoleFromUs"				;//Мы хотим получить назад свои вещи! Дай их мне!
	YouStoleFromEBr				=	"SVM_6_YouStoleFromEBr"				;//Ты обокрал Баронов! Какого черта тебе это понадобилось?
	YouStoleFromGur				=	"SVM_6_YouStoleFromGur"				;//Воруешь у Гуру? Жаль, но тебя раскрыли.
	StoleFromMage				=	"SVM_6_StoleFromMage"				;//Ты обокрал магов! Паршивая идея, поверь!
	YouKilledMyFriend			=	"SVM_6_YouKilledMyFriend"			;//Жизнь одного из наших людей на твоей совести. Еще одна ошибка, и настанет твоя очередь!
	YouKilledEBr				=	"SVM_6_YouKilledEBr"				;//Ты убил Барона! Парень, ты окончательно спятил?!
	YouKilledGur				=	"SVM_6_YouKilledGur"				;//Ты убил Гуру! Я глазам своим не верю!
	YouKilledMage				=	"SVM_6_YouKilledMage"				;//Ты убил мага! Как ты собираешься объяснить это?
	YouKilledOCfolk				=	"SVM_6_YouKilledOCfolk"				;//Убит человек из Старого Лагеря, и кое-кто связывает тебя с этим убийством...
	YouKilledNCfolk				=	"SVM_6_YouKilledNCfolk"				;//Новый Лагерь понес тяжелую утрату, и, похоже, ты причастен к этому!
	YouKilledPSIfolk			=	"SVM_6_YouKilledPSIfolk"			;//Братство потеряло одного из своих членов, и эта жизнь на твоей совести!
	GetThingsRight				=	"SVM_6_GetThingsRight"				;//Тебе нелегко будет оправдаться!
	YouDefeatedMeWell			=	"SVM_6_YouDefeatedMeWell"			;//Ты задал мне хорошу трепку, парень. Это был хороший бой, но сейчас он окончен!
	Smalltalk01					=	"SVM_6_Smalltalk01"					;// ...если ты думаешь...
	Smalltalk02					=	"SVM_6_Smalltalk02"					;// ...может быть...
	Smalltalk03					=	"SVM_6_Smalltalk03"					;// ...это было не слишком умно...
	Smalltalk04					=	"SVM_6_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_6_Smalltalk05"					;// ...это точно не моя проблема...
	Smalltalk06					=	"SVM_6_Smalltalk06"					;// ...похоже, назревает проблема...
	Smalltalk07					=	"SVM_6_Smalltalk07"					;// ...держи это при себе, людям необязательно знать об этом.
	Smalltalk08					=	"SVM_6_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_6_Smalltalk09"					;// ...что-то не то в этой истории...
	Smalltalk10					=	"SVM_6_Smalltalk10"					;// ...ты должен следить за тем, что говоришь людям...
	Smalltalk11					=	"SVM_6_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_6_Smalltalk12"					;// ...ты не должен верить всему...
	Smalltalk13					=	"SVM_6_Smalltalk13"					;// ...не хотел бы я оказаться на его месте...
	Smalltalk14					=	"SVM_6_Smalltalk14"					;// ...каждый раз одна и та же история...
	Smalltalk15					=	"SVM_6_Smalltalk15"					;// ...некоторых людей ничего не учит...
	Smalltalk16					=	"SVM_6_Smalltalk16"					;// ...были времена, когда все было совсем по-другому...
	Smalltalk17					=	"SVM_6_Smalltalk17"					;// ...люди всегда болтают...
	Smalltalk18					=	"SVM_6_Smalltalk18"					;// ...я больше не слушаю всякую трепотню...
	Smalltalk19					=	"SVM_6_Smalltalk19"					;// ...веришь кому-то - и в результате попадаешь в неприятности, так всегда и бывает...
	Smalltalk20					=	"SVM_6_Smalltalk20"					;// ...я сомневаюсь, что это когда-нибудь изменится...
	Smalltalk21					=	"SVM_6_Smalltalk21"					;// ...скорее всего, ты прав...
	Smalltalk22					=	"SVM_6_Smalltalk22"					;// ...держись. Лучше ни на что не натыкаться...
	Smalltalk23					=	"SVM_6_Smalltalk23"					;// ...я думал, это выяснили еще очень давно...
	Smalltalk24					=	"SVM_6_Smalltalk24"					;// ...давай поговорим о чем-нибудь еще...
	Om							= 	"SVM_6_Om"							;//Оммм...
};

//////////////////////////////////////////
instance SVM_7 (C_SVM)				//Freak, Aggressiv. Spielt mit seiner Macht. Sadist. Org: Abschaum, den im AL keiner wollte. Nov (selten): Durchgeknallter Abschaum.
{
	StopMagic					=	"SVM_7_StopMagic"					;//Перестань! Перестань!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"				;//Перестань колдовать, перестань!
	WeaponDown					=	"SVM_7_WeaponDown"					;//Убери оружие, убери!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"				;//Я серьезно! Убери его!
	WatchYourAim				=	"SVM_7_WatchYourAim"				;//Ты целишься в меня? Смотри, что делаешь!
	WatchYourAimAngry			=	"SVM_7_WatchYourAimAngry"			;//Думаешь, можно угрожать мне? Подумай снова!
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"				;//Я запомню это! Смотри, что делаешь!
	LetsForgetOurLittleFight	=	"SVM_7_LetsForgetOurLittleFight"	;//Забудем об этом, ладно?
	Strange						=	"SVM_7_Strange"						;//Куда он делся? Этого не может быть! Это невозможно!
	DieMonster					=	"SVM_7_DieMonster"					;//Я уничтожу тебя, монстр!
	DieMortalEnemy				=	"SVM_7_DieMortalEnemy"				;//Я разрублю тебя на части! Пришел твой черед! Никакой пощады!
	NowWait						=	"SVM_7_NowWait"						;//Наконец-то ты дал мне повод!
	YouStillNotHaveEnough		=	"SVM_7_YouStillNotHaveEnough"		;//Ты ведь не хочешь повторить это, правда?
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Кровь! Твоя кровь!!!
	NowWaitIntruder				= 	"SVM_7_NowWaitIntruder"				;//Я порежу тебя на такие тоненькие полоски...
	IWillTeachYouRespectForForeignProperty	=	"SVM_7_IWillTeachYouRespectForForeignProperty"	;//За это следовало бы отрубить тебе руки!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Грязный вор! Чтоб тебе пусто было!
	YouAttackedMyCharge			=	"SVM_7_YouAttackedMyCharge"			;//Никому, кроме меня, не позволено затевать здесь драку!
	YouKilledOneOfUs			=	"SVM_7_YouKilledOneOfUs"			;//Ты убил одного из наших!
	Dead						=	"SVM_7_Dead"						;//Аааргл!
	Aargh_1						=	"SVM_7_Aargh_1"						;//Ааарг!
	Aargh_2						=	"SVM_7_Aargh_2"						;//Ааарг!
	Aargh_3						=	"SVM_7_Aargh_3"						;//Ааарг!
	Berzerk						=	"SVM_7_Berzerk"						;//УУАААРРГГГХХХ!!!
	YoullBeSorryForThis			=	"SVM_7_YoullBeSorryForThis"			;//У тебя даже не будет времени пожалеть об этом!
	YesYes						=	"SVM_7_YesYes"						;//Ладно, ладно!
	ShitWhatAMonster			=	"SVM_7_ShitWhatAMonster"			;//У меня нет подходящего оружия. Мы еще встретимся...
	Help						=	"SVM_7_Help"						;//Черт!
	WeWillMeetAgain				=	"SVM_7_WeWillMeetAgain"				;//Мы еще встретимся!
	NeverTryThatAgain			=	"SVM_7_NeverTryThatAgain"			;//Больше не делай этого!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"				;//Это оружие я оставлю себе!
	ITookYourOre				=	"SVM_7_ITookYourOre"				;//Конечно, я предпочел бы убить тебя, но руда - это тоже неплохо!
	ShitNoOre					=	"SVM_7_ShitNoOre"					;//Нет руды? Ты жалкий, бесполезный ублюдок!
	HandsOff					=	"SVM_7_HandsOff"					;//Держи свои руки подальше!
	GetOutOfHere				=	"SVM_7_GetOutOfHere"				;//Проваливай! Убирайся отсюда!
	YouViolatedForbiddenTerritory=	"SVM_7_YouViolatedForbiddenTerritory";//Как ты сюда попал?
	YouWannaFoolMe				=	"SVM_7_YouWannaFoolMe"				;//Тебе понравилось, да?
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"		;//Эй, ты! Что ты здесь шляешься?
	WhyAreYouInHere				=	"SVM_7_WhyYouAreInHere"				;//Исчезни, или я позову стражу!
	WhatDidYouInThere			=	"SVM_7_WhatDidYouInThere"			;//Тебе здесь нечего делать!
	WiseMove					=	"SVM_7_WiseMove"					;//Тебе повезло! Но я бы с удовольствием набил тебе морду!
	Alarm						=	"SVM_7_Alarm"						;//Стража, сюда!
	IntruderAlert				= 	"SVM_7_IntruderAlert"				;//ТРЕВОГА!!!
	BehindYou					=	"SVM_7_BehindYou"					;//Сзади!
	TheresAFight				=	"SVM_7_TheresAFight"				;//Драка!
	HeyHeyHey					=	"SVM_7_HeyHeyHey"					;//Сильнее!
	CheerFight					=	"SVM_7_CheerFight"					;//Я хочу увидеть твою кровь!
	CheerFriend					=	"SVM_7_CheerFriend"					;//Давай же!
	Ooh							=	"SVM_7_Ooh"							;//Бей в ответ, идиот!
	YeahWellDone				=	"SVM_7_YeahWellDone"				;//Даааа!
	RunCoward					=	"SVM_7_RunCoward"					;//Беги назад к мамочке!
	HeDefeatedHim				=	"SVM_7_HeDefeatedHim"				;//Хватит с него!
	HeDeservedIt				=	"SVM_7_HeDeservedIt"				;//Это твоя вина!
	HeKilledHim					=	"SVM_7_HeKilledHim"					;//Убить кого-нибудь на глазах у свидетелей - большей глупости нельзя и придумать.
	ItWasAGoodFight				=	"SVM_7_ItWasAGoodFight"				;//Хороший бой!
	Awake						=	"SVM_7_Awake"						;//Снова пора вставать!
	FriendlyGreetings			=	"SVM_7_FriendlyGreetings"			;//Привет!
	ALGreetings					=	"SVM_7_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_7_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_7_SectGreetings"				;//Проснись!
	ThereHeIs					= 	"SVM_7_ThereHeIs"					;//Ты что - ослеп? Сюда!
	NoLearnNoPoints				= 	"SVM_7_NoLearnNoPoints"				;//Я не могу учить тебя. Тебе нехватает опыта.
	NoLearnOverMax				= 	"SVM_7_NoLearnOverMax"				;//Ты на пределе своих возможностей. Тебе нужно научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_7_NoLearnYouAlreadyKnow"		;//Тебе нужно набраться опыта, прежде чем ты сможешь стать мастером.
	NoLearnYoureBetter			=	"SVM_7_NoLearnYoureBetter"			;//Уже лучше!
	HeyYou						=	"SVM_7_HeyYou"						;//Эй, ты!
	NotNow						=	"SVM_7_NotNow"						;//Не сейчас.
	WhatDoYouWant				=	"SVM_7_WhatDoYouWant"				;//Чего ты от меня хочешь?
	ISaidWhatDoYouWant			=	"SVM_7_ISaidWhatDoYouWant"			;//Могу ли я что-нибудь для тебя сделать?
	MakeWay						=	"SVM_7_MakeWay"						;//Дай мне пройти.
	OutOfMyWay					=	"SVM_7_OutOfMyWay"					;//С дороги!
	YouDeafOrWhat				=	"SVM_7_YouDeafOrWhat"				;//Ищешь неприятностей? Убирайся отсюда!
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"		;//Снова ищешь неприятностей?
	LookAway					=	"SVM_7_LookAway"					;//Я НИЧЕГО не видел... 
	OkayKeepIt					=	"SVM_7_OkayKeepIt"					;//Ладно, ладно! Забирай это!
	WhatsThat					=	"SVM_7_WhatsThat"					;//Что это было?
	ThatsMyWeapon				=	"SVM_7_ThatsMyWeapon"				;//Отдай мне мое оружие!
	GiveItToMe					=	"SVM_7_GiveItToMe"					;//Отдай!
	YouCanKeeptheCrap			=	"SVM_7_YouCanKeeptheCrap"			;//Ладно! Оставь себе! Я что-нибудь придумаю!
	TheyKilledMyFriend			=	"SVM_7_TheyKilledMyFriend"			;//Убили одного из наших! Мы должны отомстить!
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"		;//Зачем ты меня разбудил?
	SuckerGotSome				=	"SVM_7_SuckerGotSome"				;//Эта трепка послужит тебе уроком!
	SuckerDefeatedEBr			=	"SVM_7_SuckerDefeatedEBr"			;//Ты ударил Барона. Он так зол на тебя!
	SuckerDefeatedGur			=	"SVM_7_SuckerDefeatedGur"			;//Ты ударил Гуру! Похоже, у тебя талант находить неприятности!
	SuckerDefeatedMage			=	"SVM_7_SuckerDefeatedMage"			;//Победить мага - что за дурацкая идея!
	SuckerDefeatedNov_Guard		= 	"SVM_7_SuckerDefeatedNov_Guard"		;//Значит, ты и есть тот парень, который обижает новичков?
	SuckerDefeatedVlk_Guard		= 	"SVM_7_SuckerDefeatedVlk_Guard"		;//Оставь моих людей в покое!
	YouDefeatedMyComrade		=	"SVM_7_YouDefeatedMyComrade"		;//Не на того напал, приятель! Здесь мы держимся друг друга!
	YouDefeatedNOV_Guard		=	"SVM_7_YouDefeatedNOV_Guard"		;//Вряд ли все будут долго терпеть твои выходки!
	YouDefeatedVLK_Guard		=	"SVM_7_YouDefeatedVLK_Guard"		;//Прежде чем ударить того, кто находится под моей защитой, подумай о последствиях!
	YouStoleFromMe				=	"SVM_7_YouStoleFromMe"				;//Ты, задница, воруешь у меня?! Больше не возвращайся!
	YouStoleFromUs				=	"SVM_7_YouStoleFromUs"				;//Мы хотим получить назад свои вещи! Отдавай их!
	YouStoleFromEBr				=	"SVM_7_YouStoleFromEBr"				;//Ты обокрал Баронов! Какого черта тебе это понадобилось?!
	YouStoleFromGur				=	"SVM_7_YouStoleFromGur"				;//Воруешь у Гуру? Жаль, но тебя раскрыли.
	StoleFromMage				=	"SVM_7_StoleFromMage"				;//Ты обокрал магов! Что за дурацкая идея!
	YouKilledMyFriend			=	"SVM_7_YouKilledMyFriend"			;//Жизнь одного из наших людей на твоей совести. Еще одна ошибка, и настанет твоя очередь!
	YouKilledEBr				=	"SVM_7_YouKilledEBr"				;//Ты убил Барона! Парень, ты окончательно спятил?!
	YouKilledGur				=	"SVM_7_YouKilledGur"				;//Ты убил Гуру! Я глазам своим не верю!
	YouKilledMage				=	"SVM_7_YouKilledMage"				;//Ты убил мага! Как ты собираешься объяснить это?
	YouKilledOCfolk				=	"SVM_7_YouKilledOCfolk"				;//Убит человек из Старого Лагеря, и кое-кто связывает тебя с этим убийством...
	YouKilledNCfolk				=	"SVM_7_YouKilledNCfolk"				;//Новый Лагерь понес тяжелую утрату, и, похоже, ты причастен к этому!
	YouKilledPSIfolk			=	"SVM_7_YouKilledPSIfolk"			;//Братство потеряло одного из своих членов, и эта жизнь на твоей совести!
	GetThingsRight				=	"SVM_7_GetThingsRight"				;//Тебе будет нелегко оправдаться!
	YouDefeatedMeWell			=	"SVM_7_YouDefeatedMeWell"			;//Ты задал мне хорошу трепку, парень. Это был хороший бой, но сейчас он окончен!
	Smalltalk01					=	"SVM_7_Smalltalk01"					;// ...если ты думаешь...
	Smalltalk02					=	"SVM_7_Smalltalk02"					;// ...может быть...
	Smalltalk03					=	"SVM_7_Smalltalk03"					;// ...это было не слишком умно...
	Smalltalk04					=	"SVM_7_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_7_Smalltalk05"					;// ...это точно не моя проблема...
	Smalltalk06					=	"SVM_7_Smalltalk06"					;// ...похоже, назревает проблема...
	Smalltalk07					=	"SVM_7_Smalltalk07"					;// ...держи это при себе, людям необязательно знать об этом.
	Smalltalk08					=	"SVM_7_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_7_Smalltalk09"					;// ...что-то не то в этой истории...
	Smalltalk10					=	"SVM_7_Smalltalk10"					;// ...ты должен следить за тем, что говоришь людям...
	Smalltalk11					=	"SVM_7_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_7_Smalltalk12"					;// ...ты не должен верить всему...
	Smalltalk13					=	"SVM_7_Smalltalk13"					;// ...не хотел бы я оказаться на его месте...
	Smalltalk14					=	"SVM_7_Smalltalk14"					;// ...каждый раз одна и та же история...
	Smalltalk15					=	"SVM_7_Smalltalk15"					;// ...некоторых людей ничего не учит...
	Smalltalk16					=	"SVM_7_Smalltalk16"					;// ...были времена, когда все было совсем по-другому...
	Smalltalk17					=	"SVM_7_Smalltalk17"					;// ...люди всегда болтают...
	Smalltalk18					=	"SVM_7_Smalltalk18"					;// ...я больше не слушаю всякую трепотню...
	Smalltalk19					=	"SVM_7_Smalltalk19"					;// ...веришь кому-то - и в результате попадаешь в неприятности, так всегда и бывает...
	Smalltalk20					=	"SVM_7_Smalltalk20"					;// ...я сомневаюсь, что это когда-нибудь изменится...
	Smalltalk21					=	"SVM_7_Smalltalk21"					;// ...скорее всего, ты прав...
	Smalltalk22					=	"SVM_7_Smalltalk22"					;// ...держись. Лучше ни на что не натыкаться...
	Smalltalk23					=	"SVM_7_Smalltalk23"					;// ...я думал, это выяснили еще очень давно...
	Smalltalk24					=	"SVM_7_Smalltalk24"					;// ...давай поговорим о чем-нибудь еще...
	Om							= 	"SVM_7_Om"							;//Оммм...
};

//////////////////////////////////////////
instance SVM_8 (C_SVM)				// Elite-Garde. Ultra-cool. Pflichtbewusst, ernst, nьchtern! Klare Stimme
{
	StopMagic					=	"SVM_8_StopMagic"					;//Не смей здесь колдовать!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"				;//Перестань, я сказал! Немедленно!
	WeaponDown					=	"SVM_8_WeaponDown"					;//Убери оружие!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"				;//Убери эту штуковину или у тебя будут проблемы!
	WatchYourAim				=	"SVM_8_WatchYourAim"				;//Убери оружие, идиот!
	WatchYourAimAngry			=	"SVM_8_WatchYourAimAngry"			;//Червяк, как ты посмел целиться в меня?
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"				;//Смотри, что делаешь!
	LetsForgetOurLittleFight	=	"SVM_8_LetsForgetOurLittleFight"	;//Забудем об этом, ладно?
	Strange						=	"SVM_8_Strange"						;//Выходи! Я знаю, что ты меня слышишь!
	DieMonster					=	"SVM_8_DieMonster"					;//Проклятые твари!
	DieMortalEnemy				=	"SVM_8_DieMortalEnemy"				;//Теперь ты умрешь. Не принимай близко к сердцу!
	NowWait						=	"SVM_8_NowWait"						;//Червяк, ты напал на МЕНЯ! Подожди-ка...
	YouStillNotHaveEnough		=	"SVM_8_YouStillNotHaveEnough"		;//Разве я еще не вытирал тобой пыль? Придется повторить...
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Если не хочешь слушать, придется объяснить по-другому!
	NowWaitIntruder				= 	"SVM_8_NowWaitIntruder"				;//Кака ты посмел появиться ЗДЕСЬ? Подожди-ка...
	IWillTeachYouRespectForForeignProperty	=	"SVM_8_IWillTeachYouRespectForForeignProperty"	;//Похоже, стоит переломать тебе пальцы!
	DirtyThief					=	"SVM_8_DirtyThief"					;//Тебе не стоило красть это!
	YouAttackedMyCharge			=	"SVM_8_YouAttackedMyCharge"			;//Все, кто обижал моих друзей, потом сильно раскаивались в этом!
	YouKilledOneOfUs			=	"SVM_8_YouKilledOneOfUs"			;//Ты убил одного из наших. Это была твоя последняя ошибка!
	Dead						=	"SVM_8_Dead"						;//Аааргл!
	Aargh_1						=	"SVM_8_Aargh_1"						;//Ааарг!
	Aargh_2						=	"SVM_8_Aargh_2"						;//Ааарг!
	Aargh_3						=	"SVM_8_Aargh_3"						;//Ааарг!
	Berzerk						=	"SVM_8_Berzerk"						;//УУАААРРГГГХХХ!!!
	YoullBeSorryForThis			=	"SVM_8_YoullBeSorryForThis"			;//Ты об этом пожалеешь!
	YesYes						=	"SVM_8_YesYes"						;//Спокойно. Все нормально! 
	ShitWhatAMonster			=	"SVM_8_ShitWhatAMonster"			;//Я лучше погляжу на эту тварь издали!
	Help						=	"SVM_8_Help"						;//Быстро, уходим!
	WeWillMeetAgain				=	"SVM_8_WeWillMeetAgain"				;//Мы еще встретимся!
	NeverTryThatAgain			=	"SVM_8_NeverTryThatAgain"			;//Еще один раз, и ты покойник!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"				;//Мне нравится это оружие!
	ITookYourOre				=	"SVM_8_ITookYourOre"				;//Похоже, ты еще не заплатил мне пошлину!
	ShitNoOre					=	"SVM_8_ShitNoOre"					;//Разумеется, у такого неудачника просто не может быть руды!
	HandsOff					=	"SVM_8_HandsOff"					;//Убери руки!
	GetOutOfHere				=	"SVM_8_GetOutOfHere"				;//Убирайся отсюда!
	YouViolatedForbiddenTerritory=	"SVM_8_YouViolatedForbiddenTerritory";//Эй, как ТЫ сюда попал?
	YouWannaFoolMe				=	"SVM_8_YouWannaFoolMe"				;//Ты действительно умная задница, да?
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"		;//Эй, ты! Что ты здесь шляешься?
	WhyAreYouInHere				=	"SVM_8_WhyYouAreInHere"				;//Убирайся отсюда или я позову стражу!
	WhatDidYouInThere			=	"SVM_8_WhatDidYouInThere"			;//Что ты там делаешь?
	WiseMove					=	"SVM_8_WiseMove"					;//Тебе еще повезло.
	Alarm						=	"SVM_8_Alarm"						;//Стража! Сюда!
	IntruderAlert				= 	"SVM_8_IntruderAlert"				;//ТРЕВОГА!!! ЧУЖОЙ!!!
	BehindYou					=	"SVM_8_BehindYou"					;//Сзади!
	TheresAFight				=	"SVM_8_TheresAFight"				;//Посмотрим, кто там дерется!
	HeyHeyHey					=	"SVM_8_HeyHeyHey"					;//Сильнее!
	CheerFight					=	"SVM_8_CheerFight"					;//Да! Давай, давай!
	CheerFriend					=	"SVM_8_CheerFriend"					;//Хорошо! Не расслабляйся!
	Ooh							=	"SVM_8_Ooh"							;//Не останавливайся! Дай ему в морду!
	YeahWellDone				=	"SVM_8_YeahWellDone"				;//Да, врежь ему! Он еще шевелится!
	RunCoward					=	"SVM_8_RunCoward"					;//Больше не появляйся здесь!
	HeDefeatedHim				=	"SVM_8_HeDefeatedHim"				;//Скучный бой!
	HeDeservedIt				=	"SVM_8_HeDeservedIt"				;//Это послужит ему уроком!
	HeKilledHim					=	"SVM_8_HeKilledHim"					;//В этом не было необходимости. Подумай о последствиях.
	ItWasAGoodFight				=	"SVM_8_ItWasAGoodFight"				;//Это был хороший бой!
	Awake						=	"SVM_8_Awake"						;//[зевок]
	FriendlyGreetings			=	"SVM_8_FriendlyGreetings"			;//Привет!
	ALGreetings					=	"SVM_8_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_8_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_8_SectGreetings"				;//Проснись!
	ThereHeIs					= 	"SVM_8_ThereHeIs"					;//Он там.
	NoLearnNoPoints				= 	"SVM_8_NoLearnNoPoints"				;//Я не могу учить тебя, ты слишком неопытен.
	NoLearnOverMax				= 	"SVM_8_NoLearnOverMax"				;//Ты на пределе своих возможностей. Тебе нужно научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_8_NoLearnYouAlreadyKnow"		;//Тебе нужно набраться опыта, прежде чем ты сможешь стать мастером.
	NoLearnYoureBetter			=	"SVM_8_NoLearnYoureBetter"			;//Уже лучше!
	HeyYou						=	"SVM_8_HeyYou"						;//Эй, ты!
	NotNow						=	"SVM_8_NotNow"						;//Не сейчас.
	WhatDoYouWant				=	"SVM_8_WhatDoYouWant"				;//Тебе помочь?
	ISaidWhatDoYouWant			=	"SVM_8_ISaidWhatDoYouWant"			;//Что я могу для тебя сделать?
	MakeWay						=	"SVM_8_MakeWay"						;//Можно пройти?
	OutOfMyWay					=	"SVM_8_OutOfMyWay"					;//В сторону!
	YouDeafOrWhat				=	"SVM_8_YouDeafOrWhat"				;//Я что - должен вбить это в твою тупую башку? Убирайся отсюда!
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"		;//Снова ищешь неприятностей?
	LookAway					=	"SVM_8_LookAway"					;//А-хм... Хороший вид!
	OkayKeepIt					=	"SVM_8_OkayKeepIt"					;//Ладно! Теперь это твое.
	WhatsThat					=	"SVM_8_WhatsThat"					;//Эй? Что это было?
	ThatsMyWeapon				=	"SVM_8_ThatsMyWeapon"				;//У тебя мое оружие..?
	GiveItToMe					=	"SVM_8_GiveItToMe"					;//Отдай! Немедленно!
	YouCanKeeptheCrap			=	"SVM_8_YouCanKeeptheCrap"			;//Оставь себе, мне это все равно не нужно.
	TheyKilledMyFriend			=	"SVM_8_TheyKilledMyFriend"			;//Убили одного из наших. Если я доберусь до этого наглеца...
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"		;//Что случилось?
	SuckerGotSome				=	"SVM_8_SuckerGotSome"				;//А? Получил в морду? Это послужит тебе уроком!
	SuckerDefeatedEBr			=	"SVM_8_SuckerDefeatedEBr"			;//Ты ударил Барона. Это его впечатлило, да еще как!
	SuckerDefeatedGur			=	"SVM_8_SuckerDefeatedGur"			;//Ты победил одного из Гуру! Впечатляет. Но даже не пытайся сделать это еще раз.
	SuckerDefeatedMage			=	"SVM_8_SuckerDefeatedMage"			;//Победить мага... ты, должно быть, храбрый парень!
	SuckerDefeatedNov_Guard		= 	"SVM_8_SuckerDefeatedNov_Guard"		;//Ты знаешь, что новички здесь под моей защитой, и все равно осмеливаешься обижать их?
	SuckerDefeatedVlk_Guard		= 	"SVM_8_SuckerDefeatedVlk_Guard"		;//Обижая рудокопов, ты покушаешься на мой доход!
	YouDefeatedMyComrade		=	"SVM_8_YouDefeatedMyComrade"		;//Тебе не стоит обижать моих друзей.
	YouDefeatedNOV_Guard		=	"SVM_8_YouDefeatedNOV_Guard"		;//Еще раз обидишь новичка, и ты пожалеешь!
	YouDefeatedVLK_Guard		=	"SVM_8_YouDefeatedVLK_Guard"		;//Если будешь обижать тех, кого я защищаю, это может стоить тебе головы.
	YouStoleFromMe				=	"SVM_8_YouStoleFromMe"				;//Как ты посмел появиться здесь, грязный воришка?
	YouStoleFromUs				=	"SVM_8_YouStoleFromUs"				;//У тебя есть что-то, что принадлежит нам. Лучше бы тебе вернуть это назад!
	YouStoleFromEBr				=	"SVM_8_YouStoleFromEBr"				;//Парень! Ты обокрал Баронов! Они будут в ярости!
	YouStoleFromGur				=	"SVM_8_YouStoleFromGur"				;//Ты обокрал Гуру! Тебе не стоило попадаться на этом!
	StoleFromMage				=	"SVM_8_StoleFromMage"				;//Ты избавил магов от нескольких ненужных вещиц, так?
	YouKilledMyFriend			=	"SVM_8_YouKilledMyFriend"			;//Жизнь одного из наших людей на твоей совести. Еще одна ошибка, и настанет твоя очередь!
	YouKilledEBr				=	"SVM_8_YouKilledEBr"				;//Ты убил Барона! Парень, ты окончательно спятил?!
	YouKilledGur				=	"SVM_8_YouKilledGur"				;//Ты убил Гуру! Я глазам своим не верю!
	YouKilledMage				=	"SVM_8_YouKilledMage"				;//Ты убил мага! Как ты собираешься объяснить это?
	YouKilledOCfolk				=	"SVM_8_YouKilledOCfolk"				;//Убит человек из Старого Лагеря, и кое-кто связывает тебя с этим убийством...
	YouKilledNCfolk				=	"SVM_8_YouKilledNCfolk"				;//Новый Лагерь понес тяжелую утрату, и, похоже, ты причастен к этому!
	YouKilledPSIfolk			=	"SVM_8_YouKilledPSIfolk"			;//Братство потеряло одного из своих членов, и эта жизнь на твоей совести!
	GetThingsRight				=	"SVM_8_GetThingsRight"				;//Тебе будет нелегко оправдаться!
	YouDefeatedMeWell			=	"SVM_8_YouDefeatedMeWell"			;//Ты задал мне хорошую трепку, парень. Это был хороший бой, но сейчас он окончен!
	Smalltalk01					=	"SVM_8_Smalltalk01"					;// ...если ты думаешь...
	Smalltalk02					=	"SVM_8_Smalltalk02"					;// ...может быть...
	Smalltalk03					=	"SVM_8_Smalltalk03"					;// ...это было не слишком умно...
	Smalltalk04					=	"SVM_8_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_8_Smalltalk05"					;// ...это точно не моя проблема...
	Smalltalk06					=	"SVM_8_Smalltalk06"					;// ...похоже, назревает проблема...
	Smalltalk07					=	"SVM_8_Smalltalk07"					;// ...держи это при себе, людям необязательно знать об этом.
	Smalltalk08					=	"SVM_8_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_8_Smalltalk09"					;// ...что-то не то в этой истории...
	Smalltalk10					=	"SVM_8_Smalltalk10"					;// ...ты должен следить за тем, что говоришь людям...
	Smalltalk11					=	"SVM_8_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_8_Smalltalk12"					;// ...ты не должен верить всему...
	Smalltalk13					=	"SVM_8_Smalltalk13"					;// ...не хотел бы я оказаться на его месте...
	Smalltalk14					=	"SVM_8_Smalltalk14"					;// ...каждый раз одна и та же история...
	Smalltalk15					=	"SVM_8_Smalltalk15"					;// ...некоторых людей ничего не учит...
	Smalltalk16					=	"SVM_8_Smalltalk16"					;// ...были времена, когда все было совсем по-другому...
	Smalltalk17					=	"SVM_8_Smalltalk17"					;// ...люди всегда болтают...
	Smalltalk18					=	"SVM_8_Smalltalk18"					;// ...я больше не слушаю всякую трепотню...
	Smalltalk19					=	"SVM_8_Smalltalk19"					;// ...веришь кому-то - и в результате попадаешь в неприятности, так всегда и бывает...
	Smalltalk20					=	"SVM_8_Smalltalk20"					;// ...я сомневаюсь, что это когда-нибудь изменится...
	Smalltalk21					=	"SVM_8_Smalltalk21"					;// ...скорее всего, ты прав...
	Smalltalk22					=	"SVM_8_Smalltalk22"					;// ...держись. Лучше ни на что не натыкаться...
	Smalltalk23					=	"SVM_8_Smalltalk23"					;// ...я думал, это выяснили еще очень давно...
	Smalltalk24					=	"SVM_8_Smalltalk24"					;// ...давай поговорим о чем-нибудь еще...
	Om							= 	"SVM_8_Om"							;//Оммм...
};


instance SVM_9 (C_SVM)				// brummig		   gemьtlicher Hьne, Besonnen, Brummiger Bдr, Einfacher	Mensch
{
	StopMagic					=	"SVM_9_StopMagic"					;//Никакой магии здесь!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"				;//Прекрати, я сказал! Немедленно!
	WeaponDown					=	"SVM_9_WeaponDown"					;//Ты собираешься напасть на меня?
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"				;//Ты хочешь, чтобы я набил тебе морду, или сам уберешь эту штуковину?
	WatchYourAim				=	"SVM_9_WatchYourAim"				;//Смотри, куда целишься!
	WatchYourAimAngry			=	"SVM_9_WatchYourAimAngry"			;//Убери эту штуковину!
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"				;//Эй! Смотри, что делаешь!
	LetsForgetOurLittleFight	=	"SVM_9_LetsForgetOurLittleFight"	;//Я бы предложил просто забыть об этом...
	Strange						=	"SVM_9_Strange"						;//Покажись. Я знаю, что ты меня слышишь!
	DieMonster					=	"SVM_9_DieMonster"					;//Ну и здоровые же твари!
	DieMortalEnemy				=	"SVM_9_DieMortalEnemy"				;//Теперь тебе крышка!
	NowWait						=	"SVM_9_NowWait"						;//Ты еще меня узнаешь!
	YouStillNotHaveEnough		=	"SVM_9_YouStillNotHaveEnough"		;//Да ты чертовски упрямый!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Если не хочешь слушать, придется объяснить по-другому!
	NowWaitIntruder				= 	"SVM_9_NowWaitIntruder"				;//Попался, чужак!
	IWillTeachYouRespectForForeignProperty	=	"SVM_9_IWillTeachYouRespectForForeignProperty"	;//Я предупредил тебя. Дотронешься до моих вещей, и будет худо!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Вор! Я прикончу тебя!
	YouAttackedMyCharge			=	"SVM_9_YouAttackedMyCharge"			;//Никто не смеет обижать моих друзей!
	YouKilledOneOfUs			=	"SVM_9_YouKilledOneOfUs"			;//Ты убил одного из моих людей. Теперь я убью ТЕБЯ!
	Dead						=	"SVM_9_Dead"						;//Аааргл!
	Aargh_1						=	"SVM_9_Aargh_1"						;//Ааарг!
	Aargh_2						=	"SVM_9_Aargh_2"						;//Ааарг!
	Aargh_3						=	"SVM_9_Aargh_3"						;//Ааарг!
	Berzerk						=	"SVM_9_Berzerk"						;//УУАААРРГГГХХХ!!!
	YoullBeSorryForThis			=	"SVM_9_YoullBeSorryForThis"			;//Ты уже покойник, просто еще не знаешь об этом.
	YesYes						=	"SVM_9_YesYes"						;//Тише. Все в порядке!
	ShitWhatAMonster			=	"SVM_9_ShitWhatAMonster"			;//Черт, ну и тварь!
	Help						=	"SVM_9_Help"						;//Быстро, уходим!
	WeWillMeetAgain				=	"SVM_9_WeWillMeetAgain"				;//Мы еще встретимся!
	NeverTryThatAgain			=	"SVM_9_NeverTryThatAgain"			;//В следующий раз я убью тебя!
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"				;//Теперь это мое оружие!
	ITookYourOre				=	"SVM_9_ITookYourOre"				;//Руда! Ну, это лучше, чем ничего!
	ShitNoOre					=	"SVM_9_ShitNoOre"					;//У него даже нет руды!
	HandsOff					=	"SVM_9_HandsOff"					;//Убери руки, приятель!
	GetOutOfHere				=	"SVM_9_GetOutOfHere"				;//Убирайся отсюда!
	YouViolatedForbiddenTerritory=	"SVM_9_YouViolatedForbiddenTerritory";//Что ты здесь делаешь?
	YouWannaFoolMe				=	"SVM_9_YouWannaFoolMe"				;//Ты пытаешься меня одурачить, парень?
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"		;//Эй, ты! Что ты здесь шляешься?
	WhyAreYouInHere				=	"SVM_9_WhyYouAreInHere"				;//Убирайся отсюда, или я позову стражу!
	WhatDidYouInThere			=	"SVM_9_WhatDidYouInThere"			;//Что ты там делаешь?
	WiseMove					=	"SVM_9_WiseMove"					;//Молодец!
	Alarm						=	"SVM_9_Alarm"						;//Стража! Сюда!
	IntruderAlert				= 	"SVM_9_IntruderAlert"				;//ТРЕВОГА!!! ЧУЖОЙ!!!
	BehindYou					=	"SVM_9_BehindYou"					;//Сзади!
	TheresAFight				=	"SVM_9_TheresAFight"				;//Посмотрим, так ли они хороши...
	HeyHeyHey					=	"SVM_9_HeyHeyHey"					;//Получай!
	CheerFight					=	"SVM_9_CheerFight"					;//Да! Давай, давай!
	CheerFriend					=	"SVM_9_CheerFriend"					;//Хорошо!
	Ooh							=	"SVM_9_Ooh"							;//О, на этот раз в точку!
	YeahWellDone				=	"SVM_9_YeahWellDone"				;//Отличный контроль, парень!
	RunCoward					=	"SVM_9_RunCoward"					;//Больше здесь не показывайся!
	HeDefeatedHim				=	"SVM_9_HeDefeatedHim"				;//Исход уже предрешен.
	HeDeservedIt				=	"SVM_9_HeDeservedIt"				;//Это твоя вина!
	HeKilledHim					=	"SVM_9_HeKilledHim"					;//В этом не было необходимости. Подумай о последствиях.
	ItWasAGoodFight				=	"SVM_9_ItWasAGoodFight"				;//Это был хороший бой!
	Awake						=	"SVM_9_Awake"						;//[зевок]
	FriendlyGreetings			=	"SVM_9_FriendlyGreetings"			;//Привет!
	ALGreetings					=	"SVM_9_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_9_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_9_SectGreetings"				;//Проснись!
	ThereHeIs					= 	"SVM_13_ThereHeIs"					;//Ты что, ослеп? Сюда!
	NoLearnNoPoints				= 	"SVM_9_NoLearnNoPoints"				;//Я не могу учить тебя, тебе нехватает опыта.
	NoLearnOverMax				= 	"SVM_9_NoLearnOverMax"				;//Ты на пределе своих возможностей. Тебе нужно научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_9_NoLearnYouAlreadyKnow"		;//Тебе нужно набраться опыта, прежде чем ты сможешь стать мастером.
	NoLearnYoureBetter			=	"SVM_9_NoLearnYoureBetter"			;//Уже лучше!
	HeyYou						=	"SVM_9_HeyYou"						;//Эй, ты!
	NotNow						=	"SVM_9_NotNow"						;//Не сейчас.
	WhatDoYouWant				=	"SVM_9_WhatDoYouWant"				;//Тебе помочь?
	ISaidWhatDoYouWant			=	"SVM_9_ISaidWhatDoYouWant"			;//Я могу помочь?
	MakeWay						=	"SVM_9_MakeWay"						;//Дай мне пройти!
	OutOfMyWay					=	"SVM_9_OutOfMyWay"					;//Отойди!
	YouDeafOrWhat				=	"SVM_9_YouDeafOrWhat"				;//Ну же, отойди с дороги!
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"		;//Снова ищешь неприятностей? Почему ты каждый раз выбираешь для этого меня?
	LookAway					=	"SVM_9_LookAway"					;//О, да! Хорошая погода сегодня!
	OkayKeepIt					=	"SVM_9_OkayKeepIt"					;//Хорошо! Это теперь твое.
	WhatsThat					=	"SVM_9_WhatsThat"					;//Что это было?
	ThatsMyWeapon				=	"SVM_9_ThatsMyWeapon"				;//Я сосчитаю до трех, и ты отдашь мне мое оружие.
	GiveItToMe					=	"SVM_9_GiveItToMe"					;//Давай сюда! Немедленно!
	YouCanKeeptheCrap			=	"SVM_9_YouCanKeeptheCrap"			;//Оставь себе, мне это все равно не нужно.
	TheyKilledMyFriend			=	"SVM_9_TheyKilledMyFriend"			;//Убили одного из наших! Если я доберусь до этого наглеца...
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"		;//Что случилось?
	SuckerGotSome				=	"SVM_9_SuckerGotSome"				;//А? Получил в морду? Это послужит тебе уроком!
	SuckerDefeatedEBr			=	"SVM_9_SuckerDefeatedEBr"			;//Ты ударил Барона. Это его впечатлило, да еще как!
	SuckerDefeatedGur			=	"SVM_9_SuckerDefeatedGur"			;//Ты победил одного из Гуру! Впечатляет. Но даже не пытайся сделать это еще раз.
	SuckerDefeatedMage			=	"SVM_9_SuckerDefeatedMage"			;//Победить мага... ты, должно быть, храбрый парень!
	SuckerDefeatedNov_Guard		= 	"SVM_9_SuckerDefeatedNov_Guard"		;//Только идиот будет драться с новичками!
	SuckerDefeatedVlk_Guard		= 	"SVM_9_SuckerDefeatedVlk_Guard"		;//Думаешь, тебе позволено бить рудокопов?
	YouDefeatedMyComrade		=	"SVM_9_YouDefeatedMyComrade"		;//Ты ударил моего друга - какого черта?!
	YouDefeatedNOV_Guard		=	"SVM_9_YouDefeatedNOV_Guard"		;//Еще раз обидишь новичка, и ты пожалеешь!
	YouDefeatedVLK_Guard		=	"SVM_9_YouDefeatedVLK_Guard"		;//Ты храбрый парень, но никому не позволено обижать тех, кого я защищаю.
	YouStoleFromMe				=	"SVM_9_YouStoleFromMe"				;//Как ты посмел появиться здесь, грязный воришка?
	YouStoleFromUs				=	"SVM_9_YouStoleFromUs"				;//Воровать у нас - это худшее из того, что ты мог придумать! Ты об этом пожалеешь!
	YouStoleFromEBr				=	"SVM_9_YouStoleFromEBr"				;//Парень! Ты обокрал Баронов! Они будут в ярости!
	YouStoleFromGur				=	"SVM_9_YouStoleFromGur"				;//Ты избавил Гуру от нескольких ненужных вещиц, так?
	StoleFromMage				=	"SVM_9_StoleFromMage"				;//Ты избавил магов от нескольких ненужных вещиц, так?
	YouKilledMyFriend			=	"SVM_9_YouKilledMyFriend"			;//Жизнь одного из наших людей на твоей совести. Еще одна ошибка, и настанет твоя очередь!
	YouKilledEBr				=	"SVM_9_YouKilledEBr"				;//Ты убил Барона! Парень, ты окончательно спятил?!
	YouKilledGur				=	"SVM_9_YouKilledGur"				;//Ты убил Гуру! Я глазам своим не верю!
	YouKilledMage				=	"SVM_9_YouKilledMage"				;//Ты убил мага! Как ты собираешься объяснить это?
	YouKilledOCfolk				=	"SVM_9_YouKilledOCfolk"				;//Убит человек из Старого Лагеря, и кое-кто связывает тебя с этим убийством...
	YouKilledNCfolk				=	"SVM_9_YouKilledNCfolk"				;//Новый Лагерь понес тяжелую утрату, и, похоже, ты причастен к этому!
	YouKilledPSIfolk			=	"SVM_9_YouKilledPSIfolk"			;//Братство потеряло одного из своих членов, и эта жизнь на твоей совести!
	GetThingsRight				=	"SVM_9_GetThingsRight"				;//Тебе будет нелегко оправдаться!
	YouDefeatedMeWell			=	"SVM_9_YouDefeatedMeWell"			;//Хороший бой. Твоя учеба не прошла даром.
	Smalltalk01					=	"SVM_9_Smalltalk01"					;// ...да, если ты так думаешь...
	Smalltalk02					=	"SVM_9_Smalltalk02"					;// ...может быть...
	Smalltalk03					=	"SVM_9_Smalltalk03"					;// ...это было не слишком умно...
	Smalltalk04					=	"SVM_9_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_9_Smalltalk05"					;// ...это точно не моя проблема...
	Smalltalk06					=	"SVM_9_Smalltalk06"					;// ...похоже, назревает проблема...
	Smalltalk07					=	"SVM_9_Smalltalk07"					;// ...держи это при себе, людям необязательно знать об этом.
	Smalltalk08					=	"SVM_9_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_9_Smalltalk09"					;// ...что-то не то в этой истории...
	Smalltalk10					=	"SVM_9_Smalltalk10"					;// ...ты должен следить за тем, что говоришь людям...
	Smalltalk11					=	"SVM_9_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_9_Smalltalk12"					;// ...ты не должен верить всему...
	Smalltalk13					=	"SVM_9_Smalltalk13"					;// ...не хотел бы я оказаться на его месте...
	Smalltalk14					=	"SVM_9_Smalltalk14"					;// ...каждый раз одна и та же история...
	Smalltalk15					=	"SVM_9_Smalltalk15"					;// ...некоторых людей ничего не учит...
	Smalltalk16					=	"SVM_9_Smalltalk16"					;// ...были времена, когда все было совсем по-другому...
	Smalltalk17					=	"SVM_9_Smalltalk17"					;// ...люди всегда болтают...
	Smalltalk18					=	"SVM_9_Smalltalk18"					;// ...я больше не слушаю всякую трепотню...
	Smalltalk19					=	"SVM_9_Smalltalk19"					;// ...веришь кому-то - и в результате попадаешь в неприятности, так всегда и бывает...
	Smalltalk20					=	"SVM_9_Smalltalk20"					;// ...я сомневаюсь, что это когда-нибудь изменится...
	Smalltalk21					=	"SVM_9_Smalltalk21"					;// ...скорее всего, ты прав...
	Smalltalk22					=	"SVM_9_Smalltalk22"					;// ...держись. Лучше ни на что не натыкаться...
	Smalltalk23					=	"SVM_9_Smalltalk23"					;// ...я думал, это выяснили еще очень давно...
	Smalltalk24					=	"SVM_9_Smalltalk24"					;// ...давай поговорим о чем-нибудь еще...
	Om							= 	"SVM_9_Om"							;//Оммм...
};



instance SVM_10	(C_SVM)				// Schlau, verschlagen,	heimlich, Zwielichtig, zynisch,	intrigant Dealer (RAVEN, KALOM)
{
	StopMagic					=	"SVM_10_StopMagic"						;//Перестань колдовать!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"					;//Перестань немедленно!
	WeaponDown					=	"SVM_10_WeaponDown"						;//Убери оружие!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"				;//Что ты делаешь? Нарываешься на неприятности?
	WatchYourAim				=	"SVM_10_WatchYourAim"					;//Убери эту штуковину, или я сделаю это за тебя!
	WatchYourAimAngry			=	"SVM_10_WatchYourAimAngry"				;//Если ищешь неприятностей, продолжай целиться в меня!
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"				;//Эй! Смотри, что делаешь! Еще один раз, и у тебя будут проблемы!
	LetsForgetOurLittleFight	=	"SVM_10_LetsForgetOurLittleFight"		;//Эй, парень! Забудем об этом, ладно?
	Strange						=	"SVM_10_Strange"						;//Выходи! Покажи себя!
	DieMonster					=	"SVM_10_DieMonster"						;//Грязные твари!
	DieMortalEnemy				=	"SVM_10_DieMortalEnemy"					;//Теперь тебе крышка!
	NowWait						=	"SVM_10_NowWait"						;//Час расплаты!
	YouStillNotHaveEnough		=	"SVM_10_YouStillNotHaveEnough"			;//Похоже, ты хочешь получить в морду!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"					;//Ты сам напросился!
	NowWaitIntruder				= 	"SVM_10_NowWaitIntruder"				;//Теперь ты попался, чужак!
	IWillTeachYouRespectForForeignProperty	=	"SVM_10_IWillTeachYouRespectForForeignProperty"	;//Я предупредил тебя. Дотронешься до моих вещей, и будет худо!
	DirtyThief					=	"SVM_10_DirtyThief"						;//Вор! Я прикончу тебя!
	YouAttackedMyCharge			=	"SVM_10_YouAttackedMyCharge"			;//Никто не смеет обижать моих людей!
	YouKilledOneOfUs			=	"SVM_10_YouKilledOneOfUs"				;//Ты убил одного из моих людей. Теперь я убью ТЕБЯ!
	Dead						=	"SVM_10_Dead"							;//Аааргл!
	Aargh_1						=	"SVM_10_Aargh_1"						;//Ааарг!
	Aargh_2						=	"SVM_10_Aargh_2"						;//Ааарг!
	Aargh_3						=	"SVM_10_Aargh_3"						;//Ааарг!
	Berzerk						=	"SVM_10_Berzerk"						;//УУАААРРГГГХХХ!!!
	YoullBeSorryForThis			=	"SVM_10_YoullBeSorryForThis"			;//Ты об этом пожалеешь, ублюдок!
	YesYes						=	"SVM_10_YesYes"							;//Да, да! Без паники! Ты победил.
	ShitWhatAMonster			=	"SVM_10_ShitWhatAMonster"				;//Что за тварь! Беги, быстрее!
	Help						=	"SVM_10_Help"							;//Отступаем!
	WeWillMeetAgain				=	"SVM_10_WeWillMeetAgain"				;//Ты меня еще узнаешь!
	NeverTryThatAgain			=	"SVM_10_NeverTryThatAgain"				;//Еще один раз, и ты об этом пожалеешь!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"				;//Теперь это мое оружие!
	ITookYourOre				=	"SVM_10_ITookYourOre"					;//Я возьму у тебя немного руды!
	ShitNoOre					=	"SVM_10_ShitNoOre"						;//Руды нет, вот черт!
	HandsOff					=	"SVM_10_HandsOff"						;//Ты, крыса! Убери руки!
	GetOutOfHere				=	"SVM_10_GetOutOfHere"					;//Убирайся отсюда!
	YouViolatedForbiddenTerritory=	"SVM_10_YouViolatedForbiddenTerritory"	;//Эй! Откуда ты?
	YouWannaFoolMe				=	"SVM_10_YouWannaFoolMe"					;//Ты должно быть думаешь, что я тупой!
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"			;//Эй, ты! Что ты здесь шляешься?
	WhyAreYouInHere				=	"SVM_10_WhyYouAreInHere"				;//Убирайся отсюда, или я позову стражу!
	WhatDidYouInThere			=	"SVM_10_WhatDidYouInThere"				;//Что ты там делаешь?
	WiseMove					=	"SVM_10_WiseMove"						;//Тебе повезло.
	Alarm						=	"SVM_10_Alarm"							;//Стража! Сюда!
	IntruderAlert				= 	"SVM_10_IntruderAlert"					;//ТРЕВОГА!!! ЧУЖОЙ!!!
	BehindYou					=	"SVM_10_BehindYou"						;//Сзади!
	TheresAFight				=	"SVM_10_TheresAFight"					;//А, драка!
	HeyHeyHey					=	"SVM_10_HeyHeyHey"						;//Сильнее!
	CheerFight					=	"SVM_10_CheerFight"						;//Никакой пощады!
	CheerFriend					=	"SVM_10_CheerFriend"					;//Прикончи его!
	Ooh							=	"SVM_10_Ooh"							;//Не отвлекайся!
	YeahWellDone				=	"SVM_10_YeahWellDone"					;//Дай ему в морду!
	RunCoward					=	"SVM_10_RunCoward"						;//Вернись, трус!
	HeDefeatedHim				=	"SVM_10_HeDefeatedHim"					;//Небольшой порыв ветра, и он упадет сам.
	HeDeservedIt				=	"SVM_10_HeDeservedIt"					;//Это послужит ему уроком!
	HeKilledHim					=	"SVM_10_HeKilledHim"					;//Считай, ты уже покойник! Это отучит тебя убивать людей.
	ItWasAGoodFight				=	"SVM_10_ItWasAGoodFight"				;//Ты преподал ему хороший урок!
	Awake						=	"SVM_10_Awake"							;//[зевок]
	FriendlyGreetings			=	"SVM_10_FriendlyGreetings"				;//Привет!
	ALGreetings					=	"SVM_10_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_10_MageGreetings"					;//Во имя магии!
	SectGreetings				=	"SVM_10_SectGreetings"					;//Проснись!
	ThereHeIs					= 	"SVM_10_ThereHeIs"						;//Он там.
	NoLearnNoPoints				= 	"SVM_10_NoLearnNoPoints"				;//Я не могу учить тебя, ты слишком неопытен.
	NoLearnOverMax				= 	"SVM_10_NoLearnOverMax"					;//Ты на пределе своих возможностей. Тебе нужно научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_10_NoLearnYouAlreadyKnow"			;//Тебе нужно набраться опыта, прежде чем ты сможешь стать мастером.
	NoLearnYoureBetter			=	"SVM_10_NoLearnYoureBetter"				;//Уже лучше!
	HeyYou						=	"SVM_10_HeyYou"							;//Эй, ты!
	NotNow						=	"SVM_10_NotNow"							;//Не сейчас.
	WhatDoYouWant				=	"SVM_10_WhatDoYouWant"					;//Тебе помочь?
	ISaidWhatDoYouWant			=	"SVM_10_ISaidWhatDoYouWant"				;//Я могу чем-то помочь?
	MakeWay						=	"SVM_10_MakeWay"						;//Дай мне пройти!
	OutOfMyWay					=	"SVM_10_OutOfMyWay"						;//Прочь с дороги!
	YouDeafOrWhat				=	"SVM_10_YouDeafOrWhat"					;//Я что, должен вбить это в твою тупую башку? Убирайся отсюда!
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"			;//Снова ищешь неприятностей?
	LookAway					=	"SVM_10_LookAway"						;//Меня здесь не было...
	OkayKeepIt					=	"SVM_10_OkayKeepIt"						;//Забирай это себе!
	WhatsThat					=	"SVM_10_WhatsThat"						;//Что это было?
	ThatsMyWeapon				=	"SVM_10_ThatsMyWeapon"					;//Отдай мое оружие!
	GiveItToMe					=	"SVM_10_GiveItToMe"						;//Дай сюда!
	YouCanKeeptheCrap			=	"SVM_10_YouCanKeeptheCrap"				;//Возьми. Мне это все равно не нужно.
	TheyKilledMyFriend			=	"SVM_10_TheyKilledMyFriend"				;//Убили одного из наших. Теперь я действительно зол! 
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"			;//Зачем ты меня разбудил?
	SuckerGotSome				=	"SVM_10_SuckerGotSome"					;//А? Получил в морду? Это послужит тебе уроком!
	SuckerDefeatedEBr			=	"SVM_10_SuckerDefeatedEBr"				;//Ты ударил Барона!
	SuckerDefeatedGur			=	"SVM_10_SuckerDefeatedGur"				;//Ты победил одного из Гуру.
	SuckerDefeatedMage			=	"SVM_10_SuckerDefeatedMage"				;//Победить мага... 
	SuckerDefeatedNov_Guard		= 	"SVM_10_SuckerDefeatedNov_Guard"		;//Прежде чем обижать новичков, ты должен знать, кого этим раздражаешь!
	SuckerDefeatedVlk_Guard		= 	"SVM_10_SuckerDefeatedVlk_Guard"		;//Я должен поддерживать здесь порядок! Оставь моих людей в покое!
	YouDefeatedMyComrade		=	"SVM_10_YouDefeatedMyComrade"			;//Ты ударил моего друга.
	YouDefeatedNOV_Guard		=	"SVM_10_YouDefeatedNOV_Guard"			;//Еще раз поднимешь руку на новичка, и ты пожалеешь об этом!
	YouDefeatedVLK_Guard		=	"SVM_10_YouDefeatedVLK_Guard"			;//Ты обидел одного из моих подопечных и дорого заплатишь за это! 
	YouStoleFromMe				=	"SVM_10_YouStoleFromMe"					;//Не вздумай появиться здесь еще раз, вор!
	YouStoleFromUs				=	"SVM_10_YouStoleFromUs"					;//У тебя есть что-то, что принадлежит нам. Лучше бы тебе вернуть это назад!
	YouStoleFromEBr				=	"SVM_10_YouStoleFromEBr"				;//Парень! Ты обокрал Баронов! Они будут в ярости!
	YouStoleFromGur				=	"SVM_10_YouStoleFromGur"				;//Ты избавил Гуру от нескольких ненужных вещиц. Тебе не стоило попадаться на этом!
	StoleFromMage				=	"SVM_10_StoleFromMage"					;//Ты избавил магов от нескольких ненужных вещиц, так?
	YouKilledMyFriend			=	"SVM_10_YouKilledMyFriend"				;//Жизнь одного из наших людей на твоей совести. Еще одна ошибка, и настанет твоя очередь!
	YouKilledEBr				=	"SVM_10_YouKilledEBr"					;//Ты убил Барона! Парень, ты окончательно спятил?!
	YouKilledGur				=	"SVM_10_YouKilledGur"					;//Ты убил Гуру! Я глазам своим не верю!
	YouKilledMage				=	"SVM_10_YouKilledMage"					;//Ты убил мага! Как ты собираешься объяснить это?
	YouKilledOCfolk				=	"SVM_10_YouKilledOCfolk"				;//Убит человек из Старого Лагеря, и кое-кто связывает тебя с этим убийством...
	YouKilledNCfolk				=	"SVM_10_YouKilledNCfolk"				;//Новый Лагерь понес тяжелую утрату, и, похоже, ты причастен к этому!
	YouKilledPSIfolk			=	"SVM_10_YouKilledPSIfolk"				;//Братство потеряло одного из своих членов, и эта жизнь на твоей совести!
	GetThingsRight				=	"SVM_10_GetThingsRight"					;//Тебе будет нелегко оправдаться!
	YouDefeatedMeWell			=	"SVM_10_YouDefeatedMeWell"				;//Поздравляю! Ты победил. Это был хороший бой.
	Smalltalk01					=	"SVM_10_Smalltalk01"					;// ...если ты думаешь...
	Smalltalk02					=	"SVM_10_Smalltalk02"					;// ...может быть...
	Smalltalk03					=	"SVM_10_Smalltalk03"					;// ...это было не слишком умно...
	Smalltalk04					=	"SVM_10_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_10_Smalltalk05"					;// ...это точно не моя проблема...
	Smalltalk06					=	"SVM_10_Smalltalk06"					;// ...похоже, назревает проблема...
	Smalltalk07					=	"SVM_10_Smalltalk07"					;// ...держи это при себе, людям необязательно знать об этом.
	Smalltalk08					=	"SVM_10_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_10_Smalltalk09"					;// ...что-то не то в этой истории...
	Smalltalk10					=	"SVM_10_Smalltalk10"					;// ...ты должен следить за тем, что говоришь людям...
	Smalltalk11					=	"SVM_10_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_10_Smalltalk12"					;// ...ты не должен верить всему...
	Smalltalk13					=	"SVM_10_Smalltalk13"					;// ...не хотел бы я оказаться на его месте...
	Smalltalk14					=	"SVM_10_Smalltalk14"					;// ...каждый раз одна и та же история...
	Smalltalk15					=	"SVM_10_Smalltalk15"					;// ...некоторых людей ничего не учит...
	Smalltalk16					=	"SVM_10_Smalltalk16"					;// ...были времена, когда все было совсем по-другому...
	Smalltalk17					=	"SVM_10_Smalltalk17"					;// ...люди всегда болтают...
	Smalltalk18					=	"SVM_10_Smalltalk18"					;// ...я больше не слушаю всякую трепотню...
	Smalltalk19					=	"SVM_10_Smalltalk19"					;// ...веришь кому-то - и в результате попадаешь в неприятности, так всегда и бывает...
	Smalltalk20					=	"SVM_10_Smalltalk20"					;// ...я сомневаюсь, что это когда-нибудь изменится...
	Smalltalk21					=	"SVM_10_Smalltalk21"					;// ...скорее всего, ты прав...
	Smalltalk22					=	"SVM_10_Smalltalk22"					;// ...держись. Лучше ни на что не натыкаться...
	Smalltalk23					=	"SVM_10_Smalltalk23"					;// ...я думал, это выяснили еще очень давно...
	Smalltalk24					=	"SVM_10_Smalltalk24"					;// ...давай поговорим о чем-нибудь еще...
	Om							= 	"SVM_10_Om"							;//Оммм...
};



//////////////////////////////////////////
instance SVM_11	(C_SVM)				//Profi				Ruhig, abgezockt, Vernьnftig aberknallhart
{
	StopMagic					=	"SVM_11_StopMagic"						;//Не смей колдовать рядом со мной! 
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"					;//Прекрати, я сказал! Немедленно!
	WeaponDown					=	"SVM_11_WeaponDown"						;//Если ты ищешь неприятностей, просто подойди сюда!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Убери эту штуковину или тебе крышка!
	WatchYourAim				=	"SVM_11_WatchYourAim"					;//Убери это!
	WatchYourAimAngry			=	"SVM_11_WatchYourAimAngry"				;//Ты хочешь расстроить меня? Уверен?
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//Что ты делаешь? Прекрати!
	LetsForgetOurLittleFight	=	"SVM_11_LetsForgetOurLittleFight"		;//Ладно, забудем об этом.
	Strange						=	"SVM_11_Strange"						;//М-мм. Черт! Куда он делся?
	DieMonster					=	"SVM_11_DieMonster"						;//Они умрут, если встанут у меня на пути!
	DieMortalEnemy				=	"SVM_11_DieMortalEnemy"					;//Если заводишь себе врагов, нужно быть уверенным, что сумеешь с ними справиться. Умри.
	NowWait						=	"SVM_11_NowWait"						;//Тебе не стоило этого делать!
	YouStillNotHaveEnough		=	"SVM_11_YouStillNotHaveEnough"			;//Разве я еще не вытирал тобой пыль? Придется повторить...
	YouAskedForIt				=	"SVM_11_YouAskedForIt"					;//Если ты не слушаешь, что тебе говорят, это может кончиться плохо!
	NowWaitIntruder				= 	"SVM_11_NowWaitIntruder"				;//Эй, чужак! Пришло время научить тебя кое-чему!
	IWillTeachYouRespectForForeignProperty	=	"SVM_11_IWillTeachYouRespectForForeignProperty"	;//Похоже, стоит переломать тебе пальцы!
	DirtyThief					=	"SVM_11_DirtyThief"						;//Это не пройдет тебе даром, вор!
	YouAttackedMyCharge			=	"SVM_11_YouAttackedMyCharge"			;//Ты нарушаешь порядок на моей территории! За это я должен прикончить тебя!
	YouKilledOneOfUs			=	"SVM_11_YouKilledOneOfUs"				;//Это убийство было твоей последней ошибкой!
	Dead						=	"SVM_11_Dead"							;//Аааргл!
	Aargh_1						=	"SVM_11_Aargh_1"						;//Ааарг!
	Aargh_2						=	"SVM_11_Aargh_2"						;//Ааарг!
	Aargh_3						=	"SVM_11_Aargh_3"						;//Ааарг!
	Berzerk						=	"SVM_11_Berzerk"						;//УУАААРРГГГХХХ!!!
	YoullBeSorryForThis			=	"SVM_11_YoullBeSorryForThis"			;//Этого тебе не стоило делать!
	YesYes						=	"SVM_11_YesYes"							;//Ладно, ладно! Ты победил!
	ShitWhatAMonster			=	"SVM_11_ShitWhatAMonster"				;//Этот слишком большой!
	Help						=	"SVM_11_Help"							;//Отступаем!
	WeWillMeetAgain				=	"SVM_11_WeWillMeetAgain"				;//Этого я так не оставлю, приятель!
	NeverTryThatAgain			=	"SVM_11_NeverTryThatAgain"				;//Больше не делай этого!
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Я лучше тебя позабочусь об этом оружии!
	ITookYourOre				=	"SVM_11_ITookYourOre"					;//Спасибо за то, что оставил мне немного руды!
	ShitNoOre					=	"SVM_11_ShitNoOre"						;//Ничего! Руды нет!
	HandsOff					=	"SVM_11_HandsOff"						;//Убери свои грязные руки!
	GetOutOfHere				=	"SVM_11_GetOutOfHere"					;//Убирайся отсюда или я заставлю тебя сделать это!
	YouViolatedForbiddenTerritory=	"SVM_11_YouViolatedForbiddenTerritory"	;//Эй, как ТЫ сюда попал?
	YouWannaFoolMe				=	"SVM_11_YouWannaFoolMe"					;//Не со мной, приятель!
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"			;//Что это должно значить?
	WhyAreYouInHere				=	"SVM_11_WhyYouAreInHere"				;//Это мой дом. Вон, или я позову стражу!
	WhatDidYouInThere			=	"SVM_11_WhatDidYouInThere"				;//Что ты там делаешь? Исчезни, пока я окончательно не разозлился!
	WiseMove					=	"SVM_11_WiseMove"						;//Хорошо! Больше этого не делай!
	Alarm						=	"SVM_11_Alarm"							;//Стража! Сюда!
	IntruderAlert				= 	"SVM_11_IntruderAlert"					;//ТРЕВОГА!!! ЧУЖОЙ!!!
	BehindYou					=	"SVM_11_BehindYou"						;//Сзади!
	TheresAFight				=	"SVM_11_TheresAFight"					;//Посмотрим, кто победит на этот раз!
	HeyHeyHey					=	"SVM_11_HeyHeyHey"						;//Давай, сделай это!
	CheerFight					=	"SVM_11_CheerFight"						;//Перестань играть с ним!
	CheerFriend					=	"SVM_11_CheerFriend"					;//Да ладно, ты можешь с ним справиться, ведь так?
	Ooh							=	"SVM_11_Ooh"							;//Ох! Это уже не хорошо!
	YeahWellDone				=	"SVM_11_YeahWellDone"					;//М-мм. Неплохо!
	RunCoward					=	"SVM_11_RunCoward"						;//Больше не смей появляться здесь!
	HeDefeatedHim				=	"SVM_11_HeDefeatedHim"					;//Это был хороший удар!
	HeDeservedIt				=	"SVM_11_HeDeservedIt"					;//Не важно! Он заслужил это!
	HeKilledHim					=	"SVM_11_HeKilledHim"					;//Ты убил его, и у тебя будут серьезные проблемы!
	ItWasAGoodFight				=	"SVM_11_ItWasAGoodFight"				;//Хорошо! Отличное представление!
	Awake						=	"SVM_11_Awake"							;//[зевок]
	FriendlyGreetings			=	"SVM_11_FriendlyGreetings"				;//Привет!
	ALGreetings					=	"SVM_11_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_11_MageGreetings"					;//Во имя магии!
	SectGreetings				=	"SVM_11_SectGreetings"					;//Проснись!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Ты что, ослеп? Сюда!
	NoLearnNoPoints				= 	"SVM_11_NoLearnNoPoints"				;//Я не могу учить тебя, тебе нехватает опыта.
	NoLearnOverMax				= 	"SVM_11_NoLearnOverMax"					;//Ты на пределе своих возможностей. Тебе нужно научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_11_NoLearnYouAlreadyKnow"			;//Тебе нужно набраться опыта, прежде чем ты сможешь стать мастером.
	NoLearnYoureBetter			=	"SVM_11_NoLearnYoureBetter"				;//Ты можешь и лучше!
	HeyYou						=	"SVM_11_HeyYou"							;//Эй, ты!
	NotNow						=	"SVM_11_NotNow"							;//Не сейчас.
	WhatDoYouWant				=	"SVM_11_WhatDoYouWant"					;//Что тебе нужно?
	ISaidWhatDoYouWant			=	"SVM_11_ISaidWhatDoYouWant"				;//Могу ли я что-нибудь для тебя сделать?
	MakeWay						=	"SVM_11_MakeWay"						;//Можно пройти?
	OutOfMyWay					=	"SVM_11_OutOfMyWay"						;//Отойди!
	YouDeafOrWhat				=	"SVM_11_YouDeafOrWhat"					;//Я что, должен вбить это в твою тупую башку? Убирайся отсюда!
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"			;//Снова ищешь неприятностей?
	LookAway					=	"SVM_11_LookAway"						;//Я не хочу с этим связываться!
	OkayKeepIt					=	"SVM_11_OkayKeepIt"						;//Хорошо! Теперь это твое.
	WhatsThat					=	"SVM_11_WhatsThat"						;//Что это было?
	ThatsMyWeapon				=	"SVM_11_ThatsMyWeapon"					;//У тебя мое оружие..?
	GiveItToMe					=	"SVM_11_GiveItToMe"						;//Ладно, отдай его мне!
	YouCanKeeptheCrap			=	"SVM_11_YouCanKeeptheCrap"				;//Оставь себе, мне это все равно не нужно.
	TheyKilledMyFriend			=	"SVM_11_TheyKilledMyFriend"				;//Убили одного из наших! Если я доберусь до этого наглеца...
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"			;//Что произошло?
	SuckerGotSome				=	"SVM_11_SuckerGotSome"					;//Получил взбучку? Это послужит тебе уроком!
	SuckerDefeatedEBr			=	"SVM_11_SuckerDefeatedEBr"				;//Ты победил одного из Баронов. Это было впечатляюще, но глупо. Вообще-то, даже очень глупо.
	SuckerDefeatedGur			=	"SVM_11_SuckerDefeatedGur"				;//Ты победил одного из Гуру.
	SuckerDefeatedMage			=	"SVM_11_SuckerDefeatedMage"				;//Победить мага... Это было не слишком умно!
	SuckerDefeatedNov_Guard		= 	"SVM_11_SuckerDefeatedNov_Guard"		;//Я защищаю этих людей, а ты ударил одного из них...
	SuckerDefeatedVlk_Guard		= 	"SVM_11_SuckerDefeatedVlk_Guard"		;//Обижая рудокопов, ты покушаешься на мой доход!
	YouDefeatedMyComrade		=	"SVM_11_YouDefeatedMyComrade"			;//Тот, кто обижает моих друзей, обижает и меня.
	YouDefeatedNOV_Guard		=	"SVM_11_YouDefeatedNOV_Guard"			;//Еще раз обидишь новичка, и ты пожалеешь!
	YouDefeatedVLK_Guard		=	"SVM_11_YouDefeatedVLK_Guard"			;//Нападение на моих подопечных может стоить тебе головы.
	YouStoleFromMe				=	"SVM_11_YouStoleFromMe"					;//Как ты посмел появиться здесь, грязный воришка?
	YouStoleFromUs				=	"SVM_11_YouStoleFromUs"					;//У тебя есть что-то, что принадлежит нам. Лучше бы тебе вернуть это назад!
	YouStoleFromEBr				=	"SVM_11_YouStoleFromEBr"				;//Парень! Ты обокрал Баронов! Они будут в ярости!
	YouStoleFromGur				=	"SVM_11_YouStoleFromGur"				;//Ты избавил Гуру от нескольких ненужных вещиц, так?
	StoleFromMage				=	"SVM_11_StoleFromMage"					;//Ты избавил магов от нескольких ненужных вещиц, так?
	YouKilledMyFriend			=	"SVM_11_YouKilledMyFriend"				;//Ты нарушил первое правило: не убивать!
	YouKilledEBr				=	"SVM_11_YouKilledEBr"					;//Ты убил Барона! Парень, ты окончательно спятил?!
	YouKilledGur				=	"SVM_11_YouKilledGur"					;//Ты убил Гуру! Я глазам своим не верю!
	YouKilledMage				=	"SVM_11_YouKilledMage"					;//Ты убил мага! Как ты собираешься объяснить это?
	YouKilledOCfolk				=	"SVM_11_YouKilledOCfolk"				;//Убит человек из Старого Лагеря, и кое-кто связывает тебя с этим убийством...
	YouKilledNCfolk				=	"SVM_11_YouKilledNCfolk"				;//Новый Лагерь понес тяжелую утрату, и, похоже, ты причастен к этому!
	YouKilledPSIfolk			=	"SVM_11_YouKilledPSIfolk"				;//Братство потеряло одного из своих членов, и эта жизнь на твоей совести!
	GetThingsRight				=	"SVM_11_GetThingsRight"					;//Тебе будет нелегко оправдаться!
	YouDefeatedMeWell			=	"SVM_11_YouDefeatedMeWell"				;//Это был хороший бой, я его надолго запомню. Но сейчас он закончен!
	Smalltalk01					=	"SVM_11_Smalltalk01"					;// ...если ты думаешь...
	Smalltalk02					=	"SVM_11_Smalltalk02"					;// ...может быть...
	Smalltalk03					=	"SVM_11_Smalltalk03"					;// ...это было не слишком умно...
	Smalltalk04					=	"SVM_11_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_11_Smalltalk05"					;// ...это точно не моя проблема...
	Smalltalk06					=	"SVM_11_Smalltalk06"					;// ...похоже, назревает проблема...
	Smalltalk07					=	"SVM_11_Smalltalk07"					;// ...держи это при себе, людям необязательно знать об этом.
	Smalltalk08					=	"SVM_11_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_11_Smalltalk09"					;// ...что-то не то в этой истории...
	Smalltalk10					=	"SVM_11_Smalltalk10"					;// ...ты должен следить за тем, что говоришь людям...
	Smalltalk11					=	"SVM_11_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_11_Smalltalk12"					;// ...ты не должен верить всему, что слышишь...
	Smalltalk13					=	"SVM_11_Smalltalk13"					;// ...не хотел бы я оказаться на его месте...
	Smalltalk14					=	"SVM_11_Smalltalk14"					;// ...каждый раз одна и та же история...
	Smalltalk15					=	"SVM_11_Smalltalk15"					;// ...некоторых людей ничего не учит...
	Smalltalk16					=	"SVM_11_Smalltalk16"					;// ...были времена, когда все было совсем по-другому...
	Smalltalk17					=	"SVM_11_Smalltalk17"					;// ...люди всегда болтают...
	Smalltalk18					=	"SVM_11_Smalltalk18"					;// ...я больше не слушаю всякую трепотню...
	Smalltalk19					=	"SVM_11_Smalltalk19"					;// ...веришь кому-то - и в результате попадаешь в неприятности, так всегда и бывает...
	Smalltalk20					=	"SVM_11_Smalltalk20"					;// ...я сомневаюсь, что это когда-нибудь изменится...
	Smalltalk21					=	"SVM_11_Smalltalk21"					;// ...скорее всего, ты прав...
	Smalltalk22					=	"SVM_11_Smalltalk22"					;// ...держись. Лучше ни на что не натыкаться...
	Smalltalk23					=	"SVM_11_Smalltalk23"					;// ...я думал, это выяснили еще очень давно...
	Smalltalk24					=	"SVM_11_Smalltalk24"					;// ...давай поговорим о чем-нибудь еще...
	Om							= 	"SVM_11_Om"								;//Оммм...
};


instance SVM_12	(C_SVM)		//Bazaar-Hдndler		Nach auЯen freundlich,jovial,Innen hinterhдltig, raffgierig
{
	StopMagic					=	"SVM_12_StopMagic"						;//Перестань колдовать!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"					;//Когда я говорю 'Прекрати колдовать!', это означает - никакой магии! Ясно?
	WeaponDown					=	"SVM_12_WeaponDown"						;//Что ты собираешься делать с оружем, парень?
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"				;//Убери эту штуковину!
	WatchYourAim				=	"SVM_12_WatchYourAim"					;//Ты целишься в меня!
	WatchYourAimAngry			=	"SVM_12_WatchYourAimAngry"				;//Если не прекратишь, у тебя будут проблемы!
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"				;//Эй, ты слепой или как?
	LetsForgetOurLittleFight	=	"SVM_12_LetsForgetOurLittleFight"		;//Забудем об этом, ладно?
	Strange						=	"SVM_12_Strange"						;//Но он был здесь секунду назад!? Странно! 
	DieMonster					=	"SVM_12_DieMonster"						;//Твоя очередь, ублюдок!
	DieMortalEnemy				=	"SVM_12_DieMortalEnemy"					;//Пришло время расплаты!
	NowWait						=	"SVM_12_NowWait"						;//Ты напрашиваешься на хорошую взбучку!
	YouStillNotHaveEnough		=	"SVM_12_YouStillNotHaveEnough"			;//Тебе все еще мало?
	YouAskedForIt				=	"SVM_12_YouAskedForIt"					;//Ну, ты сам напросился!
	NowWaitIntruder				= 	"SVM_12_NowWaitIntruder"				;//Тебя должны вынести отсюда!
	IWillTeachYouRespectForForeignProperty	=	"SVM_12_IWillTeachYouRespectForForeignProperty"	;//Я предупредил тебя. Дотронешься до моих вещей, и будет худо!
	DirtyThief					=	"SVM_12_DirtyThief"						;//Вор! Я научу тебя хорошим манерам!
	YouAttackedMyCharge			=	"SVM_12_YouAttackedMyCharge"			;//Все, кто обижал моих друзей, потом сильно раскаивались в этом!
	YouKilledOneOfUs			=	"SVM_12_YouKilledOneOfUs"				;//Ты убил одного из моих людей. Теперь я убью ТЕБЯ!
	Dead						=	"SVM_12_Dead"							;//Аааргл!
	Aargh_1						=	"SVM_12_Aargh_1"						;//Ааарг!
	Aargh_2						=	"SVM_12_Aargh_2"						;//Ааарг!
	Aargh_3						=	"SVM_12_Aargh_3"						;//Ааарг!
	Berzerk						=	"SVM_12_Berzerk"						;//УУАААРРГГГХХХ!!!
	YoullBeSorryForThis			=	"SVM_12_YoullBeSorryForThis"			;//Ты об этом пожалеешь!
	YesYes						=	"SVM_12_YesYes"							;//Спокойно! Ты победил.
	ShitWhatAMonster			=	"SVM_12_ShitWhatAMonster"				;//Этот мне не по зубам!
	Help						=	"SVM_12_Help"							;//Черт!
	WeWillMeetAgain				=	"SVM_12_WeWillMeetAgain"				;//В следующий раз все будет по-другому!
	NeverTryThatAgain			=	"SVM_12_NeverTryThatAgain"				;//Больше не делай этого!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"				;//Мне нравится это оружие!
	ITookYourOre				=	"SVM_12_ITookYourOre"					;//Я постараюсь с пользой потратить твою руду!
	ShitNoOre					=	"SVM_12_ShitNoOre"						;//Проклятье! Руды нет!
	HandsOff					=	"SVM_12_HandsOff"						;//Убери руки!
	GetOutOfHere				=	"SVM_12_GetOutOfHere"					;//Убирайся отсюда!
	YouViolatedForbiddenTerritory=	"SVM_12_YouViolatedForbiddenTerritory";//Эй! Откуда ты?
	YouWannaFoolMe				=	"SVM_12_YouWannaFoolMe"					;//Ты думаешь, я настолько тупой?!
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"			;//Что ты здесь шляешься?
	WhyAreYouInHere				=	"SVM_12_WhyYouAreInHere"				;//Убирайся отсюда, или я позову стражу!
	WhatDidYouInThere			=	"SVM_12_WhatDidYouInThere"				;//Тебе здесь нечего делать!
	WiseMove					=	"SVM_12_WiseMove"						;//Ты быстро учишься!
	Alarm						=	"SVM_12_Alarm"							;//Стража! Сюда!
	IntruderAlert				= 	"SVM_12_IntruderAlert"					;//ТРЕВОГА!!!
	BehindYou					=	"SVM_12_BehindYou"						;//Смотри, что делаешь!
	TheresAFight				=	"SVM_12_TheresAFight"					;//Драка!
	HeyHeyHey					=	"SVM_12_HeyHeyHey"						;//Как тебе это?!
	CheerFight					=	"SVM_12_CheerFight"						;//Хорошо!
	CheerFriend					=	"SVM_12_CheerFriend"					;//Врежь ему еще разок!
	Ooh							=	"SVM_12_Ooh"							;//Осторожней!
	YeahWellDone				=	"SVM_12_YeahWellDone"					;//Как раз вовремя!
	RunCoward					=	"SVM_12_RunCoward"						;//Он удирает!
	HeDefeatedHim				=	"SVM_12_HeDefeatedHim"					;//Я бы сказал, чистая победа!
	HeDeservedIt				=	"SVM_12_HeDeservedIt"					;//Он это заслужил!
	HeKilledHim					=	"SVM_12_HeKilledHim"					;//Ты убиваешь людей. Теперь у тебя большие неприятности!
	ItWasAGoodFight				=	"SVM_12_ItWasAGoodFight"				;//Что за бой!
	Awake						=	"SVM_12_Awake"							;//[зевок]
	FriendlyGreetings			=	"SVM_12_FriendlyGreetings"				;//Привет, друг!
	ALGreetings					=	"SVM_12_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_12_MageGreetings"					;//Во имя магии!
	SectGreetings				=	"SVM_12_SectGreetings"					;//Проснись!
	ThereHeIs					= 	"SVM_12_ThereHeIs"						;//Сюда.
	NoLearnNoPoints				= 	"SVM_12_NoLearnNoPoints"				;//Я не могу учить тебя, ты слишком неопытен.
	NoLearnOverMax				= 	"SVM_12_NoLearnOverMax"					;//Ты на пределе своих возможностей. Тебе нужно научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_12_NoLearnYouAlreadyKnow"			;//Тебе нужно набраться опыта, прежде чем ты сможешь стать мастером.
	NoLearnYoureBetter			=	"SVM_12_NoLearnYoureBetter"				;//Уже лучше!
	HeyYou						=	"SVM_12_HeyYou"							;//Эй, ты!
	NotNow						=	"SVM_12_NotNow"							;//Не сейчас.
	WhatDoYouWant				=	"SVM_12_WhatDoYouWant"					;//Тебе помочь?
	ISaidWhatDoYouWant			=	"SVM_12_ISaidWhatDoYouWant"				;//Что ты хочешь?
	MakeWay						=	"SVM_12_MakeWay"						;//Дай мне пройти!
	OutOfMyWay					=	"SVM_12_OutOfMyWay"						;//Ну же, мне нужно пройти!
	YouDeafOrWhat				=	"SVM_12_YouDeafOrWhat"					;//Ты глухой или ищешь неприятностей?
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"			;//Снова ищешь неприятностей?
	LookAway					=	"SVM_12_LookAway"						;//Что-то случилось? Я НИЧЕГО не видел... 
	OkayKeepIt					=	"SVM_12_OkayKeepIt"						;//Ладно, забирай это!
	WhatsThat					=	"SVM_12_WhatsThat"						;//Что это было?
	ThatsMyWeapon				=	"SVM_12_ThatsMyWeapon"					;//Я хочу получить назад свое оружие!
	GiveItToMe					=	"SVM_12_GiveItToMe"						;//Давай сюда!
	YouCanKeeptheCrap			=	"SVM_12_YouCanKeeptheCrap"				;//Ну, не так уж плохо! У меня есть еще!
	TheyKilledMyFriend			=	"SVM_12_TheyKilledMyFriend"				;//Убили одного из наших! Если я доберусь до этого наглеца...
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"			;//Х-м, что еще? Зачем ты меня разбудил?
	SuckerGotSome				=	"SVM_12_SuckerGotSome"					;//А? Получил в морду? Это послужит тебе уроком!
	SuckerDefeatedEBr			=	"SVM_12_SuckerDefeatedEBr"				;//Ты ударил Барона. Это его впечатлило, да еще как!
	SuckerDefeatedGur			=	"SVM_12_SuckerDefeatedGur"				;//Ты победил одного из Гуру! Впечатляет. Но даже не пытайся сделать это еще раз.
	SuckerDefeatedMage			=	"SVM_12_SuckerDefeatedMage"				;//Победить мага... ты, должно быть, храбрый парень!
	SuckerDefeatedNov_Guard		= 	"SVM_12_SuckerDefeatedNov_Guard"		;//Только идиот будет драться с новичками!
	SuckerDefeatedVlk_Guard		= 	"SVM_12_SuckerDefeatedVlk_Guard"		;//Думаешь, тебе позволено бить рудокопов?
	YouDefeatedMyComrade		=	"SVM_12_YouDefeatedMyComrade"			;//Ты ударил моего друга - какого черта?!
	YouDefeatedNOV_Guard		=	"SVM_12_YouDefeatedNOV_Guard"			;//Еще раз обидишь новичка, и ты пожалеешь!
	YouDefeatedVLK_Guard		=	"SVM_12_YouDefeatedVLK_Guard"			;//Ты храбрый парень, но никому не позволено обижать тех, кого я защищаю.
	YouStoleFromMe				=	"SVM_12_YouStoleFromMe"					;//Как ты посмел появиться здесь, грязный воришка?
	YouStoleFromUs				=	"SVM_12_YouStoleFromUs"					;//У тебя есть что-то, что принадлежит нам. Лучше бы тебе вернуть это назад!
	YouStoleFromEBr				=	"SVM_12_YouStoleFromEBr"				;//Парень! Ты обокрал Баронов! Они будут в ярости!
	YouStoleFromGur				=	"SVM_12_YouStoleFromGur"				;//Ты обокрал Гуру! Тебе не стоило попадаться на этом!
	StoleFromMage				=	"SVM_12_StoleFromMage"					;//Маги не любят тех, кто роется в их вещах!
	YouKilledMyFriend			=	"SVM_12_YouKilledMyFriend"				;//Жизнь одного из наших людей на твоей совести. Еще одна ошибка, и настанет твоя очередь!
	YouKilledEBr				=	"SVM_12_YouKilledEBr"					;//Ты убил Барона! Парень, ты окончательно спятил?!
	YouKilledGur				=	"SVM_12_YouKilledGur"					;//Ты убил Гуру! Я глазам своим не верю!
	YouKilledMage				=	"SVM_12_YouKilledMage"					;//Ты убил мага! Как ты собираешься объяснить это?
	YouKilledOCfolk				=	"SVM_12_YouKilledOCfolk"				;//Убит человек из Старого Лагеря, и кое-кто связывает тебя с этим убийством...
	YouKilledNCfolk				=	"SVM_12_YouKilledNCfolk"				;//Новый Лагерь понес тяжелую утрату, и, похоже, ты причастен к этому!
	YouKilledPSIfolk			=	"SVM_12_YouKilledPSIfolk"				;//Братство потеряло одного из своих членов, и эта жизнь на твоей совести!
	GetThingsRight				=	"SVM_12_GetThingsRight"					;//Тебе будет нелегко оправдаться!
	YouDefeatedMeWell			=	"SVM_12_YouDefeatedMeWell"				;//Ты задал мне хорошу трепку, парень. Это был хороший бой, но сейчас он окончен!
	Smalltalk01					=	"SVM_12_Smalltalk01"					;// ...если ты думаешь...
	Smalltalk02					=	"SVM_12_Smalltalk02"					;// ...может быть...
	Smalltalk03					=	"SVM_12_Smalltalk03"					;// ...это было не слишком умно...
	Smalltalk04					=	"SVM_12_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_12_Smalltalk05"					;// ...это точно не моя проблема...
	Smalltalk06					=	"SVM_12_Smalltalk06"					;// ...похоже, назревает проблема...
	Smalltalk07					=	"SVM_12_Smalltalk07"					;// ...держи это при себе, людям необязательно знать об этом.
	Smalltalk08					=	"SVM_12_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_12_Smalltalk09"					;// ...что-то не то в этой истории...
	Smalltalk10					=	"SVM_12_Smalltalk10"					;// ...ты должен следить за тем, что говоришь людям...
	Smalltalk11					=	"SVM_12_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_12_Smalltalk12"					;// ...ты не должен верить всему...
	Smalltalk13					=	"SVM_12_Smalltalk13"					;// ...не хотел бы я оказаться на его месте...
	Smalltalk14					=	"SVM_12_Smalltalk14"					;// ...каждый раз одна и та же история...
	Smalltalk15					=	"SVM_12_Smalltalk15"					;// ...некоторых людей ничего не учит...
	Smalltalk16					=	"SVM_12_Smalltalk16"					;// ...были времена, когда все было совсем по-другому...
	Smalltalk17					=	"SVM_12_Smalltalk17"					;// ...люди всегда болтают...
	Smalltalk18					=	"SVM_12_Smalltalk18"					;// ...я больше не слушаю всякую трепотню...
	Smalltalk19					=	"SVM_12_Smalltalk19"					;// ...веришь кому-то - и в результате попадаешь в неприятности, так всегда и бывает...
	Smalltalk20					=	"SVM_12_Smalltalk20"					;// ...я сомневаюсь, что это когда-нибудь изменится...
	Smalltalk21					=	"SVM_12_Smalltalk21"					;// ...скорее всего, ты прав...
	Smalltalk22					=	"SVM_12_Smalltalk22"					;// ...держись. Лучше ни на что не натыкаться...
	Smalltalk23					=	"SVM_12_Smalltalk23"					;// ...я думал, это выяснили еще очень давно...
	Smalltalk24					=	"SVM_12_Smalltalk24"					;// ...давай поговорим о чем-нибудь еще...
	Om							= 	"SVM_12_Om"							;//Оммм...
};


instance SVM_13	(C_SVM)					// Fanatiker	Agressiv, ьbereifrig, Дhnlich wie Stimme7Freak,	aber klarer, Ruhm-und-Ehre-Typ,	Nov: Glauben an	Yґberion blind,	Mitlдufer
{
	StopMagic					=	"SVM_13_StopMagic"						;//Перестань колдовать!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"					;//Прекрати, ПРЕКРАТИ!
	WeaponDown					=	"SVM_13_WeaponDown"						;//Убери оружие!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"				;//Убери это оружие!
	WatchYourAim				=	"SVM_13_WatchYourAim"					;//Ты целишься в меня? Смотри, что делаешь!
	WatchYourAimAngry			=	"SVM_13_WatchYourAimAngry"				;//Ты нарываешься на неприятности. Выбери себе другую цель!
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"				;//Это еще зачем?
	LetsForgetOurLittleFight	=	"SVM_13_LetsForgetOurLittleFight"		;//Забудем об этом, ладно?
	Strange						=	"SVM_13_Strange"						;//Куда он делся? Этого не может быть! 
	DieMonster					=	"SVM_13_DieMonster"						;//На ужин у нас будет мясо!
	DieMortalEnemy				=	"SVM_13_DieMortalEnemy"					;//Пришел твой черед! Никакой пощады!
	NowWait						=	"SVM_13_NowWait"						;//Это означает хорошую взбучку...
	YouStillNotHaveEnough		=	"SVM_13_YouStillNotHaveEnough"			;//Больше не хочешь, а?
	YouAskedForIt				=	"SVM_13_YouAskedForIt"					;//Ты сам напросился!
	NowWaitIntruder				= 	"SVM_13_NowWaitIntruder"				;//Тебе крышка, чужак!
	IWillTeachYouRespectForForeignProperty	=	"SVM_13_IWillTeachYouRespctForForeignProperty"	;//Я должен отрубить тебе руки!
	DirtyThief					=	"SVM_13_DirtyThief"						;//Грязный воришка! Я сломаю тебе руки!
	YouAttackedMyCharge			=	"SVM_13_YouAttackedMyCharge"			;//Никому, кроме меня, не позволено затевать здесь драку!
	YouKilledOneOfUs			=	"SVM_13_YouKilledOneOfUs"				;//Ты убил одного из наших!
	Dead						=	"SVM_13_Dead"							;//Аааргл!
	Aargh_1						=	"SVM_13_Aargh_1"						;//Ааарг!
	Aargh_2						=	"SVM_13_Aargh_2"						;//Ааарг!
	Aargh_3						=	"SVM_13_Aargh_3"						;//Ааарг!
	Berzerk						=	"SVM_13_Berzerk"						;//УУАААРРГГГХХХ!!!
	YoullBeSorryForThis			=	"SVM_13_YoullBeSorryForThis"			;//У тебя не будет времени, чтобы пожалеть об этом!
	YesYes						=	"SVM_13_YesYes"							;//Нет проблем, никаких проблем!
	ShitWhatAMonster			=	"SVM_13_ShitWhatAMonster"				;//У меня нет подходящего оружия. Мы еще встретимся...
	Help						=	"SVM_13_Help"							;//Уоооооооааа! Убирайся отсюда!
	WeWillMeetAgain				=	"SVM_13_WeWillMeetAgain"				;//Мы еще встретимся!
	NeverTryThatAgain			=	"SVM_13_NeverTryThatAgain"				;//В следующий раз я убью тебя!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"				;//Хорошее оружие! Твое? Нет? Ладно!
	ITookYourOre				=	"SVM_13_ITookYourOre"					;//Я думаю, ты не будешь возражать, если я заберу немного руды.
	ShitNoOre					=	"SVM_13_ShitNoOre"						;//У тебя даже нет руды!
	HandsOff					=	"SVM_13_HandsOff"						;//Ты, крыса! Убери руки!
	GetOutOfHere				=	"SVM_13_GetOutOfHere"					;//Проваливай! Убирайся отсюда!
	YouViolatedForbiddenTerritory=	"SVM_13_YouViolatedForbiddenTerritory"	;//И вообще, что ты здесь делаешь?
	YouWannaFoolMe				=	"SVM_13_YouWannaFoolMe"					;//Ты действительно пытаешься меня одурачить?!
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"			;//Эй, ты! Что ты здесь шляешься?
	WhyAreYouInHere				=	"SVM_13_WhyYouAreInHere"				;//Что ты здесь делаешь? Удирай, или я позову стражу!
	WhatDidYouInThere			=	"SVM_13_WhatDidYouInThere"				;//Тебе здесь нечего делать!
	WiseMove					=	"SVM_13_WiseMove"						;//На этот раз тебе повезло! Но я бы с удовольствием набил тебе морду!
	Alarm						=	"SVM_13_Alarm"							;//Стража, сюда!
	IntruderAlert				= 	"SVM_13_IntruderAlert"					;//ТРЕВОГА!!!
	BehindYou					=	"SVM_13_BehindYou"						;//Сзади!
	TheresAFight				=	"SVM_13_TheresAFight"					;//Посмотрим-ка, кто сейчас окажется в пыли.
	HeyHeyHey					=	"SVM_13_HeyHeyHey"						;//Да, снова!
	CheerFight					=	"SVM_13_CheerFight"						;//Я хочу увидеть кровь!
	CheerFriend					=	"SVM_13_CheerFriend"					;//Давай же!
	Ooh							=	"SVM_13_Ooh"							;//Бей в ответ, идиот!
	YeahWellDone				=	"SVM_13_YeahWellDone"					;//Даааа!!!
	RunCoward					=	"SVM_13_RunCoward"						;//Да, проваливай!
	HeDefeatedHim				=	"SVM_13_HeDefeatedHim"					;//Печальное зрелище! Малейший ветерок, и он все равно свалится.
	HeDeservedIt				=	"SVM_13_HeDeservedIt"					;//Тьфу, это послужит ему хорошим уроком!
	HeKilledHim					=	"SVM_13_HeKilledHim"					;//Убить кого-то на глазах у свидетелей равносильно самоубийству.
	ItWasAGoodFight				=	"SVM_13_ItWasAGoodFight"				;//Хороший бой!
	Awake						=	"SVM_13_Awake"							;//[зевок]
	FriendlyGreetings			=	"SVM_13_FriendlyGreetings"				;//С тобой все в порядке?
	ALGreetings					=	"SVM_13_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_13_MageGreetings"					;//Во имя магии!
	SectGreetings				=	"SVM_13_SectGreetings"					;//Проснись!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Ты что, ослеп? Сюда!
	NoLearnNoPoints				= 	"SVM_13_NoLearnNoPoints"				;//Я не могу учить тебя, ты слишком неопытен.
	NoLearnOverMax				= 	"SVM_13_NoLearnOverMax"					;//Ты на пределе своих возможностей. Тебе нужно научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_13_NoLearnYouAlreadyKnow"			;//Тебе нужно набраться опыта, прежде чем ты сможешь стать мастером.
	NoLearnYoureBetter			=	"SVM_13_NoLearnYoureBetter"				;//Уже лучше!
	HeyYou						=	"SVM_13_HeyYou"							;//Эй, ты!
	NotNow						=	"SVM_13_NotNow"							;//Не сейчас.
	WhatDoYouWant				=	"SVM_13_WhatDoYouWant"					;//Чего ты от меня хочешь?
	ISaidWhatDoYouWant			=	"SVM_13_ISaidWhatDoYouWant"				;//Я могу что-то сделать?
	MakeWay						=	"SVM_13_MakeWay"						;//Дай мне пройти.
	OutOfMyWay					=	"SVM_13_OutOfMyWay"						;//Уйди с дороги!
	YouDeafOrWhat				=	"SVM_13_YouDeafOrWhat"					;//Ты ищешь неприятностей? Убирайся отсюда!
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"			;//Снова ищешь неприятностей?
	LookAway					=	"SVM_13_LookAway"						;//Я НИЧЕГО не видел... 
	OkayKeepIt					=	"SVM_13_OkayKeepIt"						;//Легче. Это теперь твое.
	WhatsThat					=	"SVM_13_WhatsThat"						;//Что это было?
	ThatsMyWeapon				=	"SVM_13_ThatsMyWeapon"					;//Отдай мое оружие!
	GiveItToMe					=	"SVM_13_GiveItToMe"						;//Давай сюда!
	YouCanKeeptheCrap			=	"SVM_13_YouCanKeeptheCrap"				;//Ладно! Оставь себе! Я что-нибудь придумаю!
	TheyKilledMyFriend			=	"SVM_13_TheyKilledMyFriend"				;//Убили одного из наших! Мы должны отомстить!
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"			;//Зачем ты меня разбудил?
	SuckerGotSome				=	"SVM_13_SuckerGotSome"					;//Эта взбучка послужит тебе хорошим уроком!
	SuckerDefeatedEBr			=	"SVM_13_SuckerDefeatedEBr"				;//Ты ударил Барона. Он так зол!
	SuckerDefeatedGur			=	"SVM_13_SuckerDefeatedGur"				;//Ты ударил Гуру. Похоже, у тебя талант находить неприятности!
	SuckerDefeatedMage			=	"SVM_13_SuckerDefeatedMage"				;//Победить мага... что за дурацкая идея!
	SuckerDefeatedNov_Guard		= 	"SVM_13_SuckerDefeatedNov_Guard"		;//Значит, ты и есть тот, кто обижает новичков!
	SuckerDefeatedVlk_Guard		= 	"SVM_13_SuckerDefeatedVlk_Guard"		;//Оставь моих людей в покое!
	YouDefeatedMyComrade		=	"SVM_13_YouDefeatedMyComrade"			;//Обижать моих друзей - это не очень хорошая идея.
	YouDefeatedNOV_Guard		=	"SVM_13_YouDefeatedNOV_Guard"			;//Едва ли все будут долго терпеть твои выходки!
	YouDefeatedVLK_Guard		=	"SVM_13_YouDefeatedVLK_Guard"			;//Прежде чем ударить того, кто находится под моей защитой, подумай о последствиях!
	YouStoleFromMe				=	"SVM_13_YouStoleFromMe"					;//Ты обокрал меня! Больше не попадайся мне на глаза!
	YouStoleFromUs				=	"SVM_13_YouStoleFromUs"					;//Мы хотим получить назад свои вещи! Отдавай их!
	YouStoleFromEBr				=	"SVM_13_YouStoleFromEBr"				;//Ты обокрал Баронов! Зачем тебе это понадобилось?
	YouStoleFromGur				=	"SVM_13_YouStoleFromGur"				;//Воруешь у Гуру? Жаль, что они раскрыли тебя.
	StoleFromMage				=	"SVM_13_StoleFromMage"					;//Ты обокрал магов! Что за дурацкая идея!
	YouKilledMyFriend			=	"SVM_13_YouKilledMyFriend"				;//Жизнь одного из наших людей на твоей совести. Еще одна ошибка, и настанет твоя очередь!
	YouKilledEBr				=	"SVM_13_YouKilledEBr"					;//Ты убил Барона! Парень, ты окончательно спятил?!
	YouKilledGur				=	"SVM_13_YouKilledGur"					;//Ты убил Гуру! Я глазам своим не верю!
	YouKilledMage				=	"SVM_13_YouKilledMage"					;//Ты убил мага! Как ты собираешься объяснить это?
	YouKilledOCfolk				=	"SVM_13_YouKilledOCfolk"				;//Убит человек из Старого Лагеря, и кое-кто связывает тебя с этим убийством...
	YouKilledNCfolk				=	"SVM_13_YouKilledNCfolk"				;//Новый Лагерь понес тяжелую утрату, и, похоже, ты причастен к этому!
	YouKilledPSIfolk			=	"SVM_13_YouKilledPSIfolk"				;//Братство потеряло одного из своих членов, и эта жизнь на твоей совести!
	GetThingsRight				=	"SVM_13_GetThingsRight"					;//Тебе нелегко будет оправдаться!
	YouDefeatedMeWell			=	"SVM_13_YouDefeatedMeWell"				;//Ты задал мне хорошу трепку, парень. Это был хороший бой, но сейчас он окончен!
	Smalltalk01					=	"SVM_13_Smalltalk01"					;// ...если ты думаешь...
	Smalltalk02					=	"SVM_13_Smalltalk02"					;// ...может быть...
	Smalltalk03					=	"SVM_13_Smalltalk03"					;// ...это было не слишком умно...
	Smalltalk04					=	"SVM_13_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_13_Smalltalk05"					;// ...это точно не моя проблема...
	Smalltalk06					=	"SVM_13_Smalltalk06"					;// ...похоже, назревает проблема...
	Smalltalk07					=	"SVM_13_Smalltalk07"					;// ...держи это при себе, людям необязательно знать об этом.
	Smalltalk08					=	"SVM_13_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_13_Smalltalk09"					;// ...что-то не то в этой истории...
	Smalltalk10					=	"SVM_13_Smalltalk10"					;// ...ты должен следить за тем, что говоришь людям...
	Smalltalk11					=	"SVM_13_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_13_Smalltalk12"					;// ...ты не должен верить всему, что слышишь...
	Smalltalk13					=	"SVM_13_Smalltalk13"					;// ...не хотел бы я оказаться на его месте...
	Smalltalk14					=	"SVM_13_Smalltalk14"					;// ...каждый раз одна и та же история...
	Smalltalk15					=	"SVM_13_Smalltalk15"					;// ...некоторых людей ничего не учит...
	Smalltalk16					=	"SVM_13_Smalltalk16"					;// ...были времена, когда все было совсем по-другому...
	Smalltalk17					=	"SVM_13_Smalltalk17"					;// ...люди всегда болтают...
	Smalltalk18					=	"SVM_13_Smalltalk18"					;// ...я больше не слушаю всякую трепотню...
	Smalltalk19					=	"SVM_13_Smalltalk19"					;// ...веришь кому-то - и в результате попадаешь в неприятности, так всегда и бывает...
	Smalltalk20					=	"SVM_13_Smalltalk20"					;// ...я сомневаюсь, что это когда-нибудь изменится...
	Smalltalk21					=	"SVM_13_Smalltalk21"					;// ...скорее всего, ты прав...
	Smalltalk22					=	"SVM_13_Smalltalk22"					;// ...держись. Лучше ни на что не натыкаться...
	Smalltalk23					=	"SVM_13_Smalltalk23"					;// ...я думал, это выяснили еще очень давно...
	Smalltalk24					=	"SVM_13_Smalltalk24"					;// ...давай поговорим о чем-нибудь еще...
	Om							= 	"SVM_13_Om"							;//Оммм...
};



//////////////////////////////////////////
instance SVM_14	(C_SVM)				// Xardas(DMB),Corristo,Erzдhler	alt	arrogant, gebildet
{
	StopMagic					=	"SVM_14_StopMagic"						;//Перестань колдовать!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"					;//Ты меня слышал: никакой магии!
	WeaponDown					=	"SVM_14_WeaponDown"						;//Что ты собираешься делать с этим оружем?
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Убери свое оружие!
	WatchYourAim				=	"SVM_14_WatchYourAim"					;//Ты целишься в меня!
	WatchYourAimAngry			=	"SVM_14_WatchYourAimAngry"				;//Ты не прекратишь целиться в меня?
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Смотри, что делаешь!
	LetsForgetOurLittleFight	=	"SVM_14_LetsForgetOurLittleFight"		;//Забудем об этом, ладно?
	Strange						=	"SVM_14_Strange"						;//Ловкий трюк: он попросту исчез!
	DieMonster					=	"SVM_14_DieMonster"						;//Надоедливая тварь!
	DieMortalEnemy				=	"SVM_14_DieMortalEnemy"					;//Я должен тебя убить... Ничего личного, ты же понимаешь!
	NowWait						=	"SVM_14_NowWait"						;//Пока хватит!
	YouStillNotHaveEnough		=	"SVM_14_YouStillNotHaveEnough"			;//Ты больше не хочешь неприятностей, так?
	YouAskedForIt				=	"SVM_14_YouAskedForIt"					;//Ты сам напросился!
	NowWaitIntruder				= 	"SVM_14_NowWaitIntruder"				;//Тебя сюда никто не звал!
	IWillTeachYouRespectForForeignProperty	=	"SVM_14_IWillTeachYouRespectForForeignProperty"	;//Это не для тебя!
	DirtyThief					=	"SVM_14_DirtyThief"						;//Ты прихватил кое-что из моих вещей! Теперь ты заплатишь за это!
	YouAttackedMyCharge			=	"SVM_14_YouAttackedMyCharge"			;//Ты должен научиться уважать законы!
	YouKilledOneOfUs			=	"SVM_14_YouKilledOneOfUs"				;//Ты убил кого-то!
	Dead						=	"SVM_14_Dead"							;//Аааргл!
	Aargh_1						=	"SVM_14_Aargh_1"						;//Ааарг!
	Aargh_2						=	"SVM_14_Aargh_2"						;//Ааарг!
	Aargh_3						=	"SVM_14_Aargh_3"						;//Ааарг!
	Berzerk						=	"SVM_14_Berzerk"						;//УУАААРРГГГХХХ!!!
	YoullBeSorryForThis			=	"SVM_14_YoullBeSorryForThis"			;//Ты об этом пожалеешь!
	YesYes						=	"SVM_14_YesYes"							;//Ладно, ладно!
	ShitWhatAMonster			=	"SVM_14_ShitWhatAMonster"				;//Я не хочу сейчас ввязываться в драку!
	Help						=	"SVM_14_Help"							;//Я должен вернуться к своим исследованиям!
	WeWillMeetAgain				=	"SVM_14_WeWillMeetAgain"				;//Уверен, мы еще встретимся!
	NeverTryThatAgain			=	"SVM_14_NeverTryThatAgain"				;//Больше не делай этого!
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Я возьму это оружие!
	ITookYourOre				=	"SVM_14_ITookYourOre"					;//Руда - штука полезная!
	ShitNoOre					=	"SVM_14_ShitNoOre"						;//У тебя совсем нет руды!
	HandsOff					=	"SVM_14_HandsOff"						;//Убери руки!
	GetOutOfHere				=	"SVM_14_GetOutOfHere"					;//Убирайся отсюда!
	YouViolatedForbiddenTerritory=	"SVM_14_YouViolatedForbiddenTerritory"	;//Как ты попал сюда?
	YouWannaFoolMe				=	"SVM_14_YouWannaFoolMe"					;//Ты, должно быть, шутишь!
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"			;//Зачем ты здесь шляешься?
	WhyAreYouInHere				=	"SVM_14_WhyYouAreInHere"				;//Исчезни, пока я не позвал стражу!
	WhatDidYouInThere			=	"SVM_14_WhatDidYouInThere"				;//Тебе здесь нечего делать! Понял?
	WiseMove					=	"SVM_14_WiseMove"						;//Правильное решение!
	Alarm						=	"SVM_14_Alarm"							;//Стража, сюда, сюда!
	IntruderAlert				= 	"SVM_14_IntruderAlert"					;//ЧУЖОЙ!!!
	BehindYou					=	"SVM_14_BehindYou"						;//Сзади!
	TheresAFight				=	"SVM_14_TheresAFight"					;//Драка!
	HeyHeyHey					=	"SVM_14_HeyHeyHey"						;//Хм.
	CheerFight					=	"SVM_14_CheerFight"						;//Как неумело!
	CheerFriend					=	"SVM_14_CheerFriend"					;//Выглядит довольно впечатляюще!
	Ooh							=	"SVM_14_Ooh"							;//Это было больно!
	YeahWellDone				=	"SVM_14_YeahWellDone"					;//Это один путь...
	RunCoward					=	"SVM_14_RunCoward"						;//Он чему-то научился!
	HeDefeatedHim				=	"SVM_14_HeDefeatedHim"					;//Ну, вот и все.
	HeDeservedIt				=	"SVM_14_HeDeservedIt"					;//Это послужит ему хорошим уроком!
	HeKilledHim					=	"SVM_14_HeKilledHim"					;//Не было необходимости убивать его, теперь у тебя будут неприятности!
	ItWasAGoodFight				=	"SVM_14_ItWasAGoodFight"				;//Эти драки меня утомляют!
	Awake						=	"SVM_14_Awake"							;//Я заснул?
	FriendlyGreetings			=	"SVM_14_FriendlyGreetings"				;//Приветствую.
	ALGreetings					=	"SVM_14_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_14_MageGreetings"					;//Во имя магии!
	SectGreetings				=	"SVM_14_SectGreetings"					;//Проснись!
	ThereHeIs					= 	"SVM_14_ThereHeIs"						;//Он там.
	NoLearnNoPoints				= 	"SVM_14_NoLearnNoPoints"				;//Я не могу учить тебя. Тебе нехватает опыта.
	NoLearnOverMax				= 	"SVM_14_NoLearnOverMax"					;//Ты на пределе своих возможностей. Тебе нужно научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_14_NoLearnYouAlreadyKnow"			;//Тебе нужно набраться опыта, прежде чем ты сможешь стать мастером.
	NoLearnYoureBetter			=	"SVM_14_NoLearnYoureBetter"				;//Уже лучше!
	HeyYou						=	"SVM_14_HeyYou"							;//Эй, ты!
	NotNow						=	"SVM_14_NotNow"							;//Не сейчас.
	WhatDoYouWant				=	"SVM_14_WhatDoYouWant"					;//Что я могу для тебя сделать?
	ISaidWhatDoYouWant			=	"SVM_14_ISaidWhatDoYouWant"				;//Я могу помочь?
	MakeWay						=	"SVM_14_MakeWay"						;//Отойди!
	OutOfMyWay					=	"SVM_14_OutOfMyWay"						;//Дай мне пройти.
	YouDeafOrWhat				=	"SVM_14_YouDeafOrWhat"					;//А теперь исчезни!
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"			;//Снова ищешь неприятностей?
	LookAway					=	"SVM_14_LookAway"						;//Меня не интересует, что ты здесь делаешь!
	OkayKeepIt					=	"SVM_14_OkayKeepIt"						;//Оставь себе!
	WhatsThat					=	"SVM_14_WhatsThat"						;//Что это было?
	ThatsMyWeapon				=	"SVM_14_ThatsMyWeapon"					;//Я хочу получить назад свое оружие!
	GiveItToMe					=	"SVM_14_GiveItToMe"						;//Дай сюда!
	YouCanKeeptheCrap			=	"SVM_14_YouCanKeeptheCrap"				;//Ладно. Мне это больше не нужно!
	TheyKilledMyFriend			=	"SVM_14_TheyKilledMyFriend"				;//Убит один из нас. Мы отыщем виновного...
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"			;//Ты оторвал меня от важных мыслей!
	SuckerGotSome				=	"SVM_14_SuckerGotSome"					;//Я слышал, у тебя были проблемы!
	SuckerDefeatedEBr			=	"SVM_14_SuckerDefeatedEBr"				;//Ты ударил Барона. Это его впечатлило, да еще как!
	SuckerDefeatedGur			=	"SVM_14_SuckerDefeatedGur"				;//Ты победил одного из Гуру! Это впечатляет. 
	SuckerDefeatedMage			=	"SVM_14_SuckerDefeatedMage"				;//Победить мага... 
	SuckerDefeatedNov_Guard		= 	"SVM_14_SuckerDefeatedNov_Guard"		;//Ты знаешь, что новички находятся под моей защитой, и все равно осмеливаешься обижать их? 
	SuckerDefeatedVlk_Guard		= 	"SVM_14_SuckerDefeatedVlk_Guard"		;//Если ты обижаешь рудокопов, ты покушаешься на мой доход!
	YouDefeatedMyComrade		=	"SVM_14_YouDefeatedMyComrade"			;//Держись подальше от моих друзей!
	YouDefeatedNOV_Guard		=	"SVM_14_YouDefeatedNOV_Guard"			;//Еще раз обидишь новичка, и ты пожалеешь!
	YouDefeatedVLK_Guard		=	"SVM_14_YouDefeatedVLK_Guard"			;//Еще раз обидишь одного из моих подопечных, и это может стоить тебе головы.
	YouStoleFromMe				=	"SVM_14_YouStoleFromMe"					;//Как ты посмел появиться здесь, грязный воришка?
	YouStoleFromUs				=	"SVM_14_YouStoleFromUs"					;//У тебя есть что-то, что принадлежит нам. Лучше бы тебе вернуть это назад.
	YouStoleFromEBr				=	"SVM_14_YouStoleFromEBr"				;//Парень! Ты обокрал Баронов! Они будут в ярости!
	YouStoleFromGur				=	"SVM_14_YouStoleFromGur"				;//Ты избавил Гуру от нескольких ненужных вещиц.
	StoleFromMage				=	"SVM_14_StoleFromMage"					;//Ты избавил магов от нескольких ненужных вещиц.
	YouKilledMyFriend			=	"SVM_14_YouKilledMyFriend"				;//Ты убил одного из наших людей. Еще одна ошибка, и придет твой черед!
	YouKilledEBr				=	"SVM_14_YouKilledEBr"					;//Ты убил Барона! Парень, ты окончательно спятил?!
	YouKilledGur				=	"SVM_14_YouKilledGur"					;//Ты убил Гуру! Я глазам своим не верю!
	YouKilledMage				=	"SVM_14_YouKilledMage"					;//Ты убил мага! Как ты собираешься объяснить это?
	YouKilledOCfolk				=	"SVM_14_YouKilledOCfolk"				;//Убит человек из Старого Лагеря, и кое-кто связывает тебя с этим убийством...
	YouKilledNCfolk				=	"SVM_14_YouKilledNCfolk"				;//Новый Лагерь понес тяжелую утрату, и, похоже, ты причастен к этому!
	YouKilledPSIfolk			=	"SVM_14_YouKilledPSIfolk"				;//Братство потеряло одного из своих членов, и эта жизнь на твоей совести!
	GetThingsRight				=	"SVM_14_GetThingsRight"					;//Тебе будет нелегко оправдаться!
	YouDefeatedMeWell			=	"SVM_14_YouDefeatedMeWell"				;//Ты задал мне хорошу трепку, парень. Это был хороший бой, но сейчас он окончен!
	Smalltalk01					=	"SVM_14_Smalltalk01"					;// ...если ты думаешь...
	Smalltalk02					=	"SVM_14_Smalltalk02"					;// ...может быть...
	Smalltalk03					=	"SVM_14_Smalltalk03"					;// ...это было не слишком умно...
	Smalltalk04					=	"SVM_14_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_14_Smalltalk05"					;// ...это точно не моя проблема...
	Smalltalk06					=	"SVM_14_Smalltalk06"					;// ...похоже, назревает проблема...
	Smalltalk07					=	"SVM_14_Smalltalk07"					;// ...держи это при себе, людям необязательно знать об этом.
	Smalltalk08					=	"SVM_14_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_14_Smalltalk09"					;// ...что-то не то в этой истории...
	Smalltalk10					=	"SVM_14_Smalltalk10"					;// ...ты должен следить за тем, что говоришь людям...
	Smalltalk11					=	"SVM_14_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_14_Smalltalk12"					;// ...ты не должен верить всему...
	Smalltalk13					=	"SVM_14_Smalltalk13"					;// ...не хотел бы я оказаться на его месте...
	Smalltalk14					=	"SVM_14_Smalltalk14"					;// ...каждый раз одна и та же история...
	Smalltalk15					=	"SVM_14_Smalltalk15"					;// ...некоторых людей ничего не учит...
	Smalltalk16					=	"SVM_14_Smalltalk16"					;// ...были времена, когда все было совсем по-другому...
	Smalltalk17					=	"SVM_14_Smalltalk17"					;// ...люди всегда болтают...
	Smalltalk18					=	"SVM_14_Smalltalk18"					;// ...я больше не слушаю всякую трепотню...
	Smalltalk19					=	"SVM_14_Smalltalk19"					;// ...веришь кому-то - и в результате попадаешь в неприятности, так всегда и бывает...
	Smalltalk20					=	"SVM_14_Smalltalk20"					;// ...я сомневаюсь, что это когда-нибудь изменится...
	Smalltalk21					=	"SVM_14_Smalltalk21"					;// ...скорее всего, ты прав...
	Smalltalk22					=	"SVM_14_Smalltalk22"					;// ...держись. Лучше ни на что не натыкаться...
	Smalltalk23					=	"SVM_14_Smalltalk23"					;// ...я думал, это выяснили еще очень давно...
	Smalltalk24					=	"SVM_14_Smalltalk24"					;// ...давай поговорим о чем-нибудь еще...
	Om							= 	"SVM_14_Om"							;//Оммм...
};


//////////////////////////////////////////
INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Эй, ты!
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Подождика-ка!

	SectGreetings			=	"SVM_15_SectGreetings"				;//Проснись!
	ALGreetings				=	"SVM_15_ALGreetings"				;//За Гомеза!
	MageGreetings			=	"SVM_15_MageGreetings"				;//Приветствую!
	FriendlyGreetings		=	"SVM_15_FriendlyGreetings"			;//Привет!
	Aargh_1					=	"SVM_15_Aargh_1"					;//Ааргх!
	Aargh_2					=	"SVM_15_Aargh_2"					;//Ааргх!
	Aargh_3					=	"SVM_15_Aargh_3"					;//Ааргх!
	Dead					=	"SVM_15_Dead"						;//Ааргхл!
	Awake					=	"SVM_15_Awake"						;//[просыпается]
	DoesntWork				= 	"SVM_15_DoesntWork"					;//Не работает.
	PickBroke				= 	"SVM_15_PickBroke"					;// Хм, он сломан.
	NeedKey					= 	"SVM_15_NeedKey"					;// Для этого мне нужен ключ...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;// Костяных ключей больше нет...
	InvFull					= 	"SVM_15_InvFull"					;// Я не могу нести еще больше.
};

//////////////////////////////////////////
INSTANCE SVM_16	(C_SVM)				// Stimmbeschreibung	:		Babes halt!!!!!
{
	NotNow						=	"SVM_16_NotNow"			;	//Идем! Ты не должен разговаривать со мной!
	Help						=	"SVM_16_Help"			;	//[крики]
	Aargh_1						=	"SVM_16_Aargh_1"		;	//Ааргх!
	Aargh_2						=	"SVM_16_Aargh_2"		;	//Ааргх!
	Aargh_3						=	"SVM_16_Aargh_3"		;	//Ааргх!
	Dead						=	"SVM_16_Dead"			;	//Ааргхл!
};

//////////////////////////////////////////
INSTANCE SVM_17	(C_SVM)							//Ork-Stimme (alle SVMs werden auf wenige guturalen, unverstдndlichen Laute umgeleitet)
												//Die Dialoge mit dem verbannten Ork-Shamanen im Kastell und dem Ork-Sklaven in der Freien Mine laufen auch
												//ьber Stimme 17, sind aber in halbwegsverstдndlichem orkisch-deutsch
												//Das hier ьberall vergebene SVM_17_OrcSound01 wird noch durch 9 weitere Variationen ergдnzt

// FIXME: mehr Varianten!?
{
	StopMagic					=	"SVM_17_OrcSound01"			;//КАРРОК УР ШАК ТОС КАРРАС ДА ГАК!
	ISaidStopMagic				=	"SVM_17_OrcSound02"			;//РОК КРУШАК КОР ГАНОРГ!
	WeaponDown					=	"SVM_17_OrcSound03"			;//НЕМРОК КА ВАРРОК!
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




