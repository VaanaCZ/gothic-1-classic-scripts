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
	VAR	STRING	Om;							//  (Meditation)

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
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Получить захотел? Прекрати сейчас же!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Убери оружие!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Убери это чертово оружие!
	WatchYourAim				=	"SVM_1_WatchYourAim"				;//Опусти оружие!
	WatchYourAimAngry			=	"SVM_1_WatchYourAimAngry"			;//Давай, целься в меня, если хочешь получить!
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Осторожно! Еще раз, и я поколочу тебя как следует!
	LetsForgetOurLittleFight	=	"SVM_1_LetsForgetOurLittleFight"	;//Давай забудем об этой ссоре, ладно?
	Strange						=	"SVM_1_Strange"						;//Убирайся!
	DieMonster					=	"SVM_1_DieMonster"					;//Проклятый зверь!
	DieMortalEnemy				=	"SVM_1_DieMortalEnemy"				;//Тебе конец!
	NowWait						=	"SVM_1_NowWait"						;//Ну, теперь ты точно получишь...
	YouStillNotHaveEnough		=	"SVM_1_YouStillNotHaveEnough"		;//Ты снова нарываешься?
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//Ты сам напросился!
	NowWaitIntruder				= 	"SVM_1_NowWaitIntruder"				;//Сейчас я тебе наломаю ребра!
	IWillTeachYouRespectForForeignProperty	=	"SVM_1_IWillTeachYouRespectForForeignProperty"	;//Я же предупреждал тебя не трогать мои вещи!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Я прикончу тебя, вор!
	YouAttackedMyCharge			=	"SVM_1_YouAttackedMyCharge"			;//Никто не смеет лезть к моим друзьям!
	YouKilledOneOfUs			=	"SVM_1_YouKilledOneOfUs"			;//Ты ударил нашего человека! Сейчас я ударю тебя! 
	Dead						=	"SVM_1_Dead"						;//
	Aargh_1						=	"SVM_1_Aargh_1"						;//
	Aargh_2						=	"SVM_1_Aargh_2"						;//
	Aargh_3						=	"SVM_1_Aargh_3"						;//
	Berzerk						=	"SVM_1_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_1_YoullBeSorryForThis"			;//Ты еще об этом пожалеешь!
	YesYes						=	"SVM_1_YesYes"						;//Не волнуйся! Ты победил!
	ShitWhatAMonster			=	"SVM_1_ShitWhatAMonster"			;//Пора уносить ноги!
	Help						=	"SVM_1_Help"						;//Проклятье!
	WeWillMeetAgain				=	"SVM_1_WeWillMeetAgain"				;//Мы с тобой еще поговорим!
	NeverTryThatAgain			=	"SVM_1_NeverTryThatAgain"			;//Только попробуй сделать это еще раз!
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Хорошее оружие! Я заберу его.
	ITookYourOre				=	"SVM_1_ITookYourOre"				;//Спасибо за руду, герой!
	ShitNoOre					=	"SVM_1_ShitNoOre"					;//Жалкий червяк, да у тебя же нет ни куска руды!
	HandsOff					=	"SVM_1_HandsOff"					;//Убери руки!
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Убирайся отсюда!
	YouViolatedForbiddenTerritory=	"SVM_1_YouViolatedForbiddenTerritory";//Эй! А ты откуда здесь взялся?
	YouWannaFoolMe				=	"SVM_1_YouWannaFoolMe"				;//Ты думаешь, меня так легко обмануть?
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Эй, ты! Что это ты здесь делаешь?
	WhyAreYouInHere				=	"SVM_1_WhyYouAreInHere"				;//Убирайся из моего дома, или тебя выкинет стража!
	WhatDidYouInThere			=	"SVM_1_WhatDidYouInThere"			;//Здесь ты ничего не найдешь! Исчезни!
	WiseMove					=	"SVM_1_WiseMove"					;//Молодец, послушный мальчик!
	Alarm						=	"SVM_1_Alarm"						;//Стража! Сюда!
	IntruderAlert				= 	"SVM_1_IntruderAlert"				;//Тревога! Здесь чужой!
	BehindYou					=	"SVM_1_BehindYou"					;//Будь осторожен!
	TheresAFight				=	"SVM_1_TheresAFight"				;//А, драка!
	HeyHeyHey					=	"SVM_1_HeyHeyHey"					;//Бей его!
	CheerFight					=	"SVM_1_CheerFight"					;//Деретесь как бабы!
	CheerFriend					=	"SVM_1_CheerFriend"					;//Прикончи его!
	Ooh							=	"SVM_1_Ooh"							;//Да бей же его!
	YeahWellDone				=	"SVM_1_YeahWellDone"				;//Врежь ему!
	RunCoward					=	"SVM_1_RunCoward"					;//Куда же ты, трус!
	HeDefeatedHim				=	"SVM_1_HeDefeatedHim"				;//Хватит с него!
	HeDeservedIt				=	"SVM_1_HeDeservedIt"				;//Так ему и надо!
	HeKilledHim					=	"SVM_1_HeKilledHim"					;//Зачем ты убил его? Теперь тебе не жить!
	ItWasAGoodFight				=	"SVM_1_ItWasAGoodFight"				;//Хороший бой!
	Awake						=	"SVM_1_Awake"						;//
	FriendlyGreetings			=	"SVM_1_FriendlyGreetings"			;//Привет!
	ALGreetings					=	"SVM_1_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_1_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_1_SectGreetings"				;//Пробудись!
	ThereHeIs					= 	"SVM_1_ThereHeIs"					;//Вот же он.
	NoLearnNoPoints				= 	"SVM_1_NoLearnNoPoints"				;//Приходи, когда будешь более опытен.
	NoLearnOverMax				= 	"SVM_1_NoLearnOverMax"				;//Ты больше не можешь этому научиться. Тебе стоит попробовать что-то другое.
	NoLearnYouAlreadyKnow		=	"SVM_1_NoLearnYouAlreadyKnow"		;//Тебе нужно изучить основы, прежде чем стать настоящим мастером.
	NoLearnYoureBetter			=	"SVM_1_NoLearnYoureBetter"			;//Ты уже стал умнее.
	HeyYou						=	"SVM_1_HeyYou"						;//Эй, ты!  
	NotNow						=	"SVM_1_NotNow"						;//Я занят!
	WhatDoYouWant				=	"SVM_1_WhatDoYouWant"				;//Что тебе нужно!
	ISaidWhatDoYouWant			=	"SVM_1_ISaidWhatDoYouWant"			;//Так тебе что-то нужно?
	MakeWay						=	"SVM_1_MakeWay"						;//Дай пройти!
	OutOfMyWay					=	"SVM_1_OutOfMyWay"					;//Уйди с дороги!
	YouDeafOrWhat				=	"SVM_1_YouDeafOrWhat"				;//Ты глухой? С дороги!
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//Ты снова ищешь неприятностей?
	LookAway					=	"SVM_1_LookAway"					;//Э, а я ничего не видел!
	OkayKeepIt					=	"SVM_1_OkayKeepIt"					;//Хорошо, как хочешь! Оставь себе!
	WhatsThat					=	"SVM_1_WhatsThat"					;//Что это было?
	ThatsMyWeapon				=	"SVM_1_ThatsMyWeapon"				;//Ты носишь мое оружие!
	GiveItToMe					=	"SVM_1_GiveItToMe"					;//Отдай его мне!
	YouCanKeeptheCrap			=	"SVM_1_YouCanKeeptheCrap"			;//Да, ладно, оставляй. Мне оно все равно не нужно.
	TheyKilledMyFriend			=	"SVM_1_TheyKilledMyFriend"			;//Кто-то убил одного из моих людей. Если я его найду...
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//Эй, ну зачем ты меня разбудил?
	SuckerGotSome				=	"SVM_1_SuckerGotSome"				;//Ну, что, получил? Поделом тебе!
	SuckerDefeatedEBr			=	"SVM_1_SuckerDefeatedEBr"			;//Ты избил Барона! Уж он то тебе отомстит!
	SuckerDefeatedGur			=	"SVM_1_SuckerDefeatedGur"			;//Ты ударил Гуру. Ты точно напрашиваешься на неприятности!
	SuckerDefeatedMage			=	"SVM_1_SuckerDefeatedMage"			;//Ты победил мага... и как только ты додумался до этого?!
	SuckerDefeatedNov_Guard		= 	"SVM_1_SuckerDefeatedNov_Guard"		;//Думаешь, ты можешь безнаказанно обижать здесь послушников?
	SuckerDefeatedVlk_Guard		= 	"SVM_1_SuckerDefeatedVlk_Guard"		;//Убери руки от моих людей!
	YouDefeatedMyComrade		=	"SVM_1_YouDefeatedMyComrade"		;//Ты ударил моего напарника...
	YouDefeatedNOV_Guard		=	"SVM_1_YouDefeatedNOV_Guard"		;//От тебя здесь одни неприятности. Так дальше не может продолжаться!
	YouDefeatedVLK_Guard		=	"SVM_1_YouDefeatedVLK_Guard"		;//Если ты тронешь кого-нибудь из моих подопечных, будешь иметь дело со мной!
	YouStoleFromMe				=	"SVM_1_YouStoleFromMe"				;//Ты обокрал меня! Только попробуй подойти ко мне еще раз!
	YouStoleFromUs				=	"SVM_1_YouStoleFromUs"				;//Я хочу получить свои вещи! А ну верни!
	YouStoleFromEBr				=	"SVM_1_YouStoleFromEBr"				;//Ты обокрал Баронов! Зачем ты это сделал?  
	YouStoleFromGur				=	"SVM_1_YouStoleFromGur"				;//Ты обокрал Гуру! А они уже знают об этом!
	StoleFromMage				=	"SVM_1_StoleFromMage"				;//Ты обокрал магов! Какая странная идея!
	YouKilledMyFriend			=	"SVM_1_YouKilledMyFriend"			;//Один из наших людей убит. Допустишь такую ошибку еще раз, и тебе конец!
	YouKilledEBr				=	"SVM_1_YouKilledEBr"				;//Ты убил Барона! Только сумасшедший мог пойти на это!
	YouKilledGur				=	"SVM_1_YouKilledGur"				;//Ты убил Гуру! Я не могу в это поверить!
	YouKilledMage				=	"SVM_1_YouKilledMage"				;//Ты убил мага! Можешь объяснить, зачем ты это сделал?
	YouKilledOCfolk				=	"SVM_1_YouKilledOCfolk"				;//В Старом лагере произошло убийство. Ходят слухи, что ты в этом замешан...
	YouKilledNCfolk				=	"SVM_1_YouKilledNCfolk"				;//В Новом лагере убили человека и поговаривают, что там без тебя не обошлось!
	YouKilledPSIfolk			=	"SVM_1_YouKilledPSIfolk"			;//Убит один из приверженцев новой веры, и его смерть на твоей совести!
	GetThingsRight				=	"SVM_1_GetThingsRight"				;//Ты не сможешь избежать ответственности!
	YouDefeatedMeWell			=	"SVM_1_YouDefeatedMeWell"			;//Это был хороший бой. Тебе удалось победить меня!
	Smalltalk01					=	"SVM_1_Smalltalk01"					;// ...хуже все то, что...
	Smalltalk02					=	"SVM_1_Smalltalk02"					;// ...может быть, но кому это надо...
	Smalltalk03					=	"SVM_1_Smalltalk03"					;// ...полная ерунда...
	Smalltalk04					=	"SVM_1_Smalltalk04"					;// ...не стоит в это ввязываться...
	Smalltalk05					=	"SVM_1_Smalltalk05"					;// ...а это уже не моя проблема...
	Smalltalk06					=	"SVM_1_Smalltalk06"					;// ...уже тогда было ясно, что этим дело не кончится...
	Smalltalk07					=	"SVM_1_Smalltalk07"					;// ...со мной это часто случается...
	Smalltalk08					=	"SVM_1_Smalltalk08"					;// ...не хочу пережить это снова...
	Smalltalk09					=	"SVM_1_Smalltalk09"					;// ...а в этой истории что-то есть...
	Smalltalk10					=	"SVM_1_Smalltalk10"					;// ...да ну, хватит болтать...
	Smalltalk11					=	"SVM_1_Smalltalk11"					;// ...я не имею к этому никакого отношения...
	Smalltalk12					=	"SVM_1_Smalltalk12"					;// ...нельзя верить всему, что говорят...
	Smalltalk13					=	"SVM_1_Smalltalk13"					;// ...не хотел бы оказаться на его месте...
	Smalltalk14					=	"SVM_1_Smalltalk14"					;// ...все время одно и то же...
	Smalltalk15					=	"SVM_1_Smalltalk15"					;// ...некоторых ничему нельзя научить...
	Smalltalk16					=	"SVM_1_Smalltalk16"					;// ...раньше все было совсем по-другому...
	Smalltalk17					=	"SVM_1_Smalltalk17"					;// ...люди слишком много болтают...
	Smalltalk18					=	"SVM_1_Smalltalk18"					;// ...больше не хочу это слушать...
	Smalltalk19					=	"SVM_1_Smalltalk19"					;// ...никому не доверяй, здесь кругом предатели...
	Smalltalk20					=	"SVM_1_Smalltalk20"					;// ...не думаю, что здесь можно хоть что-нибудь изменить...
	Smalltalk21					=	"SVM_1_Smalltalk21"					;// ...быть может, ты и прав...
	Smalltalk22					=	"SVM_1_Smalltalk22"					;// ...подожди. Не стоит принимать поспешные решения...
	Smalltalk23					=	"SVM_1_Smalltalk23"					;// ...я думал, об этом уже все давно знают...
	Smalltalk24					=	"SVM_1_Smalltalk24"					;// ...поговорим об этом в следующий раз...
	Om							= 	"SVM_1_Om"							;// 
};


//SVM_2	// Misstrauisch (Volk, Bauern, Novizen, MILTEN) Misstrauisch. Defensiv. Angst in was reingezogen zu werden. Klug. Nov: Glauben durch Einschьchterung

instance SVM_2 (C_SVM)				// Misstrauisch
{
	StopMagic					=	"SVM_2_StopMagic"					;//Никакой магии!
	ISaidStopMagic				=	"SVM_2_ISaidStopMagic"				;//Эй! Никакой магии. Я сказал!
	WeaponDown					=	"SVM_2_WeaponDown"					;//Давай, убирай это!
	ISaidWeaponDown				=	"SVM_2_ISaidWeaponDown"				;//Убери оружие!
	WatchYourAim				=	"SVM_2_WatchYourAim"				;//Не видишь куда целишься?
	WatchYourAimAngry			=	"SVM_2_WatchYourAimAngry"			;//Если ты и дальше собираешься целиться в меня, я могу это неправильно понять!
	WhatAreYouDoing				=	"SVM_2_WhatAreYouDoing"				;//Эй, для чего это?
	LetsForgetOurLittleFight	=	"SVM_2_LetsForgetOurLittleFight"	;//Забудем об этом, хорошо?
	Strange						=	"SVM_2_Strange"						;//Странно! Куда он пошел?!
	DieMonster					=	"SVM_2_DieMonster"					;//Еще один!
	DieMortalEnemy				=	"SVM_2_DieMortalEnemy"				;//Боюсь, мне придется убить тебя!
	NowWait						=	"SVM_2_NowWait"						;//Это твоя вина!
	YouStillNotHaveEnough		=	"SVM_2_YouStillNotHaveEnough"		;//Тебе что, мало?
	YouAskedForIt				=	"SVM_2_YouAskedForIt"				;//Ну, если ты этого хочешь...
	NowWaitIntruder				= 	"SVM_2_NowWaitIntruder"				;//Ты знаешь, что тебе нечего здесь делать!
	IWillTeachYouRespectForForeignProperty	=	"SVM_2_IWillTeachYouRespectForForeignProperty"	;//Почему ты роешься в чужих вещах?!
	DirtyThief					=	"SVM_2_DirtyThief"					;//Ты обокрал меня! Я это запомню!
	YouAttackedMyCharge			=	"SVM_2_YouAttackedMyCharge"			;//Никто не смеет обижать моих друзей!
	YouKilledOneOfUs			=	"SVM_2_YouKilledOneOfUs"			;//Ты убил одного из наших! Ты за это заплатишь!
	Dead						=	"SVM_2_Dead"						;//
	Aargh_1						=	"SVM_2_Aargh_1"						;//
	Aargh_2						=	"SVM_2_Aargh_2"						;//
	Aargh_3						=	"SVM_2_Aargh_3"						;//
	Berzerk						=	"SVM_2_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_2_YoullBeSorryForThis"			;//Ты об этом пожалеешь!
	YesYes						=	"SVM_2_YesYes"						;//Спокойно. Спокойно. Ты победил.
	ShitWhatAMonster			=	"SVM_2_ShitWhatAMonster"			;//Я, гм... мне просто нужна была помощь!
	Help						=	"SVM_2_Help"						;//Нет времени - спешное дело!
	WeWillMeetAgain				=	"SVM_2_WeWillMeetAgain"				;//Уверен, мы еще встретимся!
	NeverTryThatAgain			=	"SVM_2_NeverTryThatAgain"			;//Больше не делай этого!
	ITakeYourWeapon				=	"SVM_2_ITakeYourWeapon"				;//Я возьму это!
	ITookYourOre				=	"SVM_2_ITookYourOre"				;//В любом случае, эта руда тебе уже не пригодится!
	ShitNoOre					=	"SVM_2_ShitNoOre"					;//Что, преследуют неудачи, приятель. Совсем нет руды?
	HandsOff					=	"SVM_2_HandsOff"					;//Убери руки!
	GetOutOfHere				=	"SVM_2_GetOutOfHere"				;//Пошел прочь!
	YouViolatedForbiddenTerritory=	"SVM_2_YouViolatedForbiddenTerritory";//Эй! Как ты здесь оказался?
	YouWannaFoolMe				=	"SVM_2_YouWannaFoolMe"				;//По-твоему, я идиот?
	WhatsThisSupposedToBe		=	"SVM_2_WhatsThisSupposedToBe"		;//Что ты здесь шатаешься? 
	WhyAreYouInHere				=	"SVM_2_WhyYouAreInHere"				;//Убирайся из моего дома, или я позову стражу!
	WhatDidYouInThere			=	"SVM_2_WhatDidYouInThere"			;//Держись подальше от домов!
	WiseMove					=	"SVM_2_WiseMove"					;//Правильное решение!
	Alarm						=	"SVM_2_Alarm"						;//Стража! Сюда!
	IntruderAlert				= 	"SVM_2_IntruderAlert"				;//Тревога!
	BehindYou					=	"SVM_2_BehindYou"					;//Сзади!
	TheresAFight				=	"SVM_2_TheresAFight"				;//А, драка!
	HeyHeyHey					=	"SVM_2_HeyHeyHey"					;//И это все?!
	CheerFight					=	"SVM_2_CheerFight"					;//Просыпайся, копуша!
	CheerFriend					=	"SVM_2_CheerFriend"					;//Хороший удар!
	Ooh							=	"SVM_2_Ooh"							;//Больно!
	YeahWellDone				=	"SVM_2_YeahWellDone"				;//Он все еще двигается!
	RunCoward					=	"SVM_2_RunCoward"					;//Оставайся здесь, жалкий трус.
	HeDefeatedHim				=	"SVM_2_HeDefeatedHim"				;//Хватит с него!
	HeDeservedIt				=	"SVM_2_HeDeservedIt"				;//Он получил по заслугам.
	HeKilledHim					=	"SVM_2_HeKilledHim"					;//Ты убил его! Это что, было так необходимо?
	ItWasAGoodFight				=	"SVM_2_ItWasAGoodFight"				;//Упорный бой, но слишком стремительный.
	Awake						=	"SVM_2_Awake"						;// 
	FriendlyGreetings			=	"SVM_2_FriendlyGreetings"			;//Привет.
	ALGreetings					=	"SVM_2_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_2_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_2_SectGreetings"				;//Пробудись!
	ThereHeIs					= 	"SVM_2_ThereHeIs"					;//Сюда.
	NoLearnNoPoints				= 	"SVM_2_NoLearnNoPoints"				;//Я не смогу стать твоим учителем. У тебя недостаточно практических навыков.
	NoLearnOverMax				= 	"SVM_2_NoLearnOverMax"				;//Ты на пределе своих возможностей. Тебе нужно научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_2_NoLearnYouAlreadyKnow"		;//Тебе необходимо накопить богатый опыт, прежде чем ты станешь мастером.
	NoLearnYoureBetter			=	"SVM_2_NoLearnYoureBetter"			;//Уже лучше!
	HeyYou						=	"SVM_2_HeyYou"						;//Эй, ты!
	NotNow						=	"SVM_2_NotNow"						;//Не сейчас.
	WhatDoYouWant				=	"SVM_2_WhatDoYouWant"				;//Что тебе нужно?
	ISaidWhatDoYouWant			=	"SVM_2_ISaidWhatDoYouWant"			;//Что я могу для тебя сделать?
	MakeWay						=	"SVM_2_MakeWay"						;//Дай мне пройти!
	OutOfMyWay					=	"SVM_2_OutOfMyWay"					;//С дороги!
	YouDeafOrWhat				=	"SVM_2_YouDeafOrWhat"				;//Убирайся. Иначе тебе не поздоровится.
	LookingForTroubleAgain		=	"SVM_2_LookingForTroubleAgain"		;//Снова ищешь неприятностей?
	LookAway					=	"SVM_2_LookAway"					;//Я ничего не видел! Никаких проблем!
	OkayKeepIt					=	"SVM_2_OkayKeepIt"					;//Хорошо. Это твое.
	WhatsThat					=	"SVM_2_WhatsThat"					;//Эй? Что?
	ThatsMyWeapon				=	"SVM_2_ThatsMyWeapon"				;//Очень похоже на мое оружие.
	GiveItToMe					=	"SVM_2_GiveItToMe"					;//Давай, давай сюда!
	YouCanKeeptheCrap			=	"SVM_2_YouCanKeeptheCrap"			;//Мне это все равно не нужно!
	TheyKilledMyFriend			=	"SVM_2_TheyKilledMyFriend"			;//Убили одного из наших! Если найдем того, кто это сделал, ему не позавидуешь.
	YouDisturbedMySlumber		=	"SVM_2_YouDisturbedMySlumber"		;//Зачем ты меня поднял?
	SuckerGotSome				=	"SVM_2_SuckerGotSome"				;//Получил? Должен признаться, мне это нравится!
	SuckerDefeatedEBr			=	"SVM_2_SuckerDefeatedEBr"			;//Ты победил Барона!
	SuckerDefeatedGur			=	"SVM_2_SuckerDefeatedGur"			;//Ты победил Гуру! Даже не знаю, чего в этом больше - храбрости или безумия!
	SuckerDefeatedMage			=	"SVM_2_SuckerDefeatedMage"			;//Победить мага... ты, должно быть, отважный парень!
	SuckerDefeatedNov_Guard		= 	"SVM_2_SuckerDefeatedNov_Guard"		;//Я здесь слежу за порядком!
	SuckerDefeatedVlk_Guard		= 	"SVM_2_SuckerDefeatedVlk_Guard"		;//Мне безразлично из-за чего это произошло. Ты ударил рудокопа, и у тебя проблемы, парень!
	YouDefeatedMyComrade		=	"SVM_2_YouDefeatedMyComrade"		;//Ты ударил моего друга!
	YouDefeatedNOV_Guard		=	"SVM_2_YouDefeatedNOV_Guard"		;//Оставь новичков в покое!
	YouDefeatedVLK_Guard		=	"SVM_2_YouDefeatedVLK_Guard"		;//Никаких драк. Понял?
	YouStoleFromMe				=	"SVM_2_YouStoleFromMe"				;//Зачем ты обокрал меня?
	YouStoleFromUs				=	"SVM_2_YouStoleFromUs"				;//У тебя есть кое-что, принадлежащее нам. Лучше бы тебе это вернуть!
	YouStoleFromEBr				=	"SVM_2_YouStoleFromEBr"				;//Парень! Ты обокрал Баронов! Они придут в ярость!
	YouStoleFromGur				=	"SVM_2_YouStoleFromGur"				;//Ты обокрал Гуру! Большая удача, что тебя не поймали.
	StoleFromMage				=	"SVM_2_StoleFromMage"				;//Магам вовсе не нравится, когда кто-то роется в их вещах.
	YouKilledMyFriend			=	"SVM_2_YouKilledMyFriend"			;//Жизнь одного из наших людей на твоей совести. Еще один неверный шаг, и ты будешь следующим!
	YouKilledEBr				=	"SVM_2_YouKilledEBr"				;//Ты убил Барона! Парень, ты окончательно потерял рассудок?!
	YouKilledGur				=	"SVM_2_YouKilledGur"				;//Ты убил Гуру! Я глазам своим не верю!
	YouKilledMage				=	"SVM_2_YouKilledMage"				;//Ты убил мага! Как ты собираешься объяснить это?
	YouKilledOCfolk				=	"SVM_2_YouKilledOCfolk"				;//Убит человек из Старого лагеря, и кое-кто связывает тебя с этим убийством...
	YouKilledNCfolk				=	"SVM_2_YouKilledNCfolk"				;//Новый лагерь понес тяжелую утрату, и, видимо, ты причастен к этому!
	YouKilledPSIfolk			=	"SVM_2_YouKilledPSIfolk"			;//Братство потеряло одного из своих членов, и эта жизнь на твоей совести!
	GetThingsRight				=	"SVM_2_GetThingsRight"				;//Тебе будет нелегко оправдаться!
	YouDefeatedMeWell			=	"SVM_2_YouDefeatedMeWell"			;//Да, ты победил. Это был жестокий бой, но сейчас все позади!
	Smalltalk01					=	"SVM_2_Smalltalk01"					;// ...если ты думаешь...
	Smalltalk02					=	"SVM_2_Smalltalk02"					;// ..ну, может быть...
	Smalltalk03					=	"SVM_2_Smalltalk03"					;// ...ну, это было не слишком умно...
	Smalltalk04					=	"SVM_2_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_2_Smalltalk05"					;// ...это точно не моя проблема...
	Smalltalk06					=	"SVM_2_Smalltalk06"					;// ...да, назревает проблема...
	Smalltalk07					=	"SVM_2_Smalltalk07"					;// ...ну знаешь, держи это при себе, людям необязательно знать об этом.
	Smalltalk08					=	"SVM_2_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_2_Smalltalk09"					;// ...что-то не так в этой истории...
	Smalltalk10					=	"SVM_2_Smalltalk10"					;// ...ты должен следить за тем, что говоришь людям...
	Smalltalk11					=	"SVM_2_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_2_Smalltalk12"					;// ...ты не должен верить всему...
	Smalltalk13					=	"SVM_2_Smalltalk13"					;// ...не хотел бы я оказаться на его месте...
	Smalltalk14					=	"SVM_2_Smalltalk14"					;// ...каждый раз одна и та же история...
	Smalltalk15					=	"SVM_2_Smalltalk15"					;// ...некоторых людей ничего не учит...
	Smalltalk16					=	"SVM_2_Smalltalk16"					;// ...эх, были времена, когда все было совсем по-другому...
	Smalltalk17					=	"SVM_2_Smalltalk17"					;// ...да, люди всегда болтают...
	Smalltalk18					=	"SVM_2_Smalltalk18"					;// ...я больше не слушаю пустую болтовню...
	Smalltalk19					=	"SVM_2_Smalltalk19"					;// ...вот веришь кому-то - и в результате попадаешь в неприятности, так всегда и бывает...
	Smalltalk20					=	"SVM_2_Smalltalk20"					;// ...а я сомневаюсь, что это когда-нибудь изменится...
	Smalltalk21					=	"SVM_2_Smalltalk21"					;// ...скорее всего, ты прав...
	Smalltalk22					=	"SVM_2_Smalltalk22"					;// ...постой. Лучше ни во что не ввязываться сгоряча...
	Smalltalk23					=	"SVM_2_Smalltalk23"					;// ...я думал, это выяснили еще очень давно...
	Smalltalk24					=	"SVM_2_Smalltalk24"					;// ...давай поговорим о чем-нибудь еще...
	Om							= 	"SVM_2_Om"							;// 
};




instance SVM_3 (C_SVM)				 // Depressiv (Resigniert. Menschliches Gemьse. "Ich schau nochґn bisschen an die Decke.." , "Wir sind eh alle verloren..." Nov:Glauben an Drogen
{
	StopMagic					=	"SVM_3_StopMagic"					;//Перестань колдовать!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"				;//Я же сказал здесь нельзя колдовать.
	WeaponDown					=	"SVM_3_WeaponDown"					;//Убери свое оружие!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"				;//Если ты не уберешь оружие, я за себя не ручаюсь!
	WatchYourAim				=	"SVM_3_WatchYourAim"				;//Ты хочешь меня убить?
	WatchYourAimAngry			=	"SVM_3_WatchYourAimAngry"			;//Убери оружие, или тебе будет хуже!
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"				;//Эй! Это еще зачем?
	LetsForgetOurLittleFight	=	"SVM_3_LetsForgetOurLittleFight"	;//Ладно, это было всего лишь маленькое недоразумение.
	Strange						=	"SVM_3_Strange"						;//Он ушел от нас, исчез?!
	DieMonster					=	"SVM_3_DieMonster"					;//Как же ты мне надоел, сейчас я с тобой покончу!
	DieMortalEnemy				=	"SVM_3_DieMortalEnemy"				;//Я с тобой еще разберусь!
	NowWait						=	"SVM_3_NowWait"						;//Мое оружие будет яснее моих слов!
	YouStillNotHaveEnough		=	"SVM_3_YouStillNotHaveEnough"		;//Тебе этого мало? Еще захотел?
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Сам виноват!
	NowWaitIntruder				= 	"SVM_3_NowWaitIntruder"				;//Тебе здесь не место! Сейчас я тебе это докажу!
	IWillTeachYouRespectForForeignProperty	=	"SVM_3_IWillTeachYouRespectForForeignProperty"	;//Наверное, язык оружия тебе будет более понятен, раз уж слова на тебя не действуют!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Ты обокрал меня! Как ты посмел?!
	YouAttackedMyCharge			=	"SVM_3_YouAttackedMyCharge"			;//Не распускай руки! Тебе придется отвечать за свои поступки!
	YouKilledOneOfUs			=	"SVM_3_YouKilledOneOfUs"			;//Ты убил одного из наших людей! Ты за это ответишь!
	Dead						=	"SVM_3_Dead"						;//
	Aargh_1						=	"SVM_3_Aargh_1"						;//
	Aargh_2						=	"SVM_3_Aargh_2"						;//
	Aargh_3						=	"SVM_3_Aargh_3"						;//
	Berzerk						=	"SVM_3_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_3_YoullBeSorryForThis"			;//Ты еще об этом пожалеешь!
	YesYes						=	"SVM_3_YesYes"						;//Успокойся, ты победил!
	ShitWhatAMonster			=	"SVM_3_ShitWhatAMonster"			;//Черт! Пора бежать отсюда!
	Help						=	"SVM_3_Help"						;//Мне пора уходить!
	WeWillMeetAgain				=	"SVM_3_WeWillMeetAgain"				;//Тебе не избежать моей мести!
	NeverTryThatAgain			=	"SVM_3_NeverTryThatAgain"			;//Только попробуй сделать это еще раз!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"				;//Это оружие мне еще пригодится!
	ITookYourOre				=	"SVM_3_ITookYourOre"				;//Я возьму у тебя эту руду, ладно...
	ShitNoOre					=	"SVM_3_ShitNoOre"					;//У тебя нет руды? Ты огорчил меня. Как ты мог?
	HandsOff					=	"SVM_3_HandsOff"					;//Руки прочь!
	GetOutOfHere				=	"SVM_3_GetOutOfHere"				;//Убирайся!
	YouViolatedForbiddenTerritory=	"SVM_3_YouViolatedForbiddenTerritory";//Эй! Откуда ты здесь взялся?
	YouWannaFoolMe				=	"SVM_3_YouWannaFoolMe"				;//Я вижу тебя насквозь, парень! Даже не думай об этом!
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"		;//Убирайся отсюда!
	WhyAreYouInHere				=	"SVM_3_WhyYouAreInHere"				;//Это мой дом. Уходи, или я позову стражу!
	WhatDidYouInThere			=	"SVM_3_WhatDidYouInThere"			;//Что тебе нужно? Одно неверное движение, и ты труп!
	WiseMove					=	"SVM_3_WiseMove"					;//Ты сам виноват. Теперь ты будешь наказан!
	Alarm						=	"SVM_3_Alarm"						;//Стража, ко мне!
	IntruderAlert				= 	"SVM_3_IntruderAlert"				;//Тревога!
	BehindYou					=	"SVM_3_BehindYou"					;//Осторожно!
	TheresAFight				=	"SVM_3_TheresAFight"				;//О, драка!
	HeyHeyHey					=	"SVM_3_HeyHeyHey"					;//Так его!
	CheerFight					=	"SVM_3_CheerFight"					;//Что это ты задумал?
	CheerFriend					=	"SVM_3_CheerFriend"					;//Отличный удар!
	Ooh							=	"SVM_3_Ooh"							;//Ох!
	YeahWellDone				=	"SVM_3_YeahWellDone"				;//Да! Отлично!
	RunCoward					=	"SVM_3_RunCoward"					;//Он уходит от нас!
	HeDefeatedHim				=	"SVM_3_HeDefeatedHim"				;//Он же убил его!
	HeDeservedIt				=	"SVM_3_HeDeservedIt"				;//Давно надо было это сделать!
	HeKilledHim					=	"SVM_3_HeKilledHim"					;//Он же мертв. Ты убил его!
	ItWasAGoodFight				=	"SVM_3_ItWasAGoodFight"				;//Здесь только драться и умеют...
	Awake						=	"SVM_3_Awake"						;//Новый день, а кругом все по-старому...
	FriendlyGreetings			=	"SVM_3_FriendlyGreetings"			;//Эй, ты.
	ALGreetings					=	"SVM_3_ALGreetings"					;//За Гомеза.
	MageGreetings				=	"SVM_3_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_3_SectGreetings"				;//Пробудись!
	ThereHeIs					= 	"SVM_3_ThereHeIs"					;//Смотрите, вон он.
	NoLearnNoPoints				= 	"SVM_3_NoLearnNoPoints"				;// Ты недостаточно опытен. Я не смогу научить тебя.
	NoLearnOverMax				= 	"SVM_3_NoLearnOverMax"				;//Ты полностью освоил эту науку. Тебе стоит научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_3_NoLearnYouAlreadyKnow"		;//Ты должен проходить обучение шаг за шагом, только после этого ты станешь мастером!
	NoLearnYoureBetter			=	"SVM_3_NoLearnYoureBetter"			;//Теперь ты поумнее.
	HeyYou						=	"SVM_3_HeyYou"						;//Эй, ты!
	NotNow						=	"SVM_3_NotNow"						;//Я занят.
	WhatDoYouWant				=	"SVM_3_WhatDoYouWant"				;//Ты что-то хочешь от меня?
	ISaidWhatDoYouWant			=	"SVM_3_ISaidWhatDoYouWant"			;//Я могу чем-то помочь тебе?
	MakeWay						=	"SVM_3_MakeWay"						;//Уступи дорогу!
	OutOfMyWay					=	"SVM_3_OutOfMyWay"					;//Уйди с дороги!
	YouDeafOrWhat				=	"SVM_3_YouDeafOrWhat"				;//Я не буду больше повторять! Дай пройти!
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"		;//Ты снова напрашиваешься на неприятности?
	LookAway					=	"SVM_3_LookAway"					;//Я ничего не видел! Меня здесь не было!
	OkayKeepIt					=	"SVM_3_OkayKeepIt"					;//Хорошо, оставь это себе!
	WhatsThat					=	"SVM_3_WhatsThat"					;//Что это было?
	ThatsMyWeapon				=	"SVM_3_ThatsMyWeapon"				;//По-моему, это мое оружие!
	GiveItToMe					=	"SVM_3_GiveItToMe"					;//Верни на место!
	YouCanKeeptheCrap			=	"SVM_3_YouCanKeeptheCrap"			;//Как хочешь! Мне это все равно не нужно!
	TheyKilledMyFriend			=	"SVM_3_TheyKilledMyFriend"			;//Убит еще один из наших. Мы не уйдем отсюда живыми...
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"		;//Зачем ты прервал мой сон?
	SuckerGotSome				=	"SVM_3_SuckerGotSome"				;//Это будет тебе хорошим уроком!
	SuckerDefeatedEBr			=	"SVM_3_SuckerDefeatedEBr"			;//Ты победил Барона! Ты напрашиваешься на неприятности?
	SuckerDefeatedGur			=	"SVM_3_SuckerDefeatedGur"			;//Ты победил Гуру. Тебе точно не поздоровится!
	SuckerDefeatedMage			=	"SVM_3_SuckerDefeatedMage"			;//Победа над магом грозит тебе большими неприятностями!
	SuckerDefeatedNov_Guard		= 	"SVM_3_SuckerDefeatedNov_Guard"		;//В другой раз не будешь лезть к послушникам!
	SuckerDefeatedVlk_Guard		= 	"SVM_3_SuckerDefeatedVlk_Guard"		;//Я защищаю рудокопов. Не смей их трогать!
	YouDefeatedMyComrade		=	"SVM_3_YouDefeatedMyComrade"		;//Ты избил моего напарника!
	YouDefeatedNOV_Guard		=	"SVM_3_YouDefeatedNOV_Guard"		;//Я защищаю послушников. Оставь их в покое!
	YouDefeatedVLK_Guard		=	"SVM_3_YouDefeatedVLK_Guard"		;//Рудокопы платят мне за защиту от незваных гостей! Только попробуй их тронуть!
	YouStoleFromMe				=	"SVM_3_YouStoleFromMe"				;//Ты обокрал меня, мерзкий вор!
	YouStoleFromUs				=	"SVM_3_YouStoleFromUs"				;//У тебя есть то, что принадлежит нам. Верни немедленно!
	YouStoleFromEBr				=	"SVM_3_YouStoleFromEBr"				;//Вот это да! Ты обокрал Баронов! Они тебе этого не простят!
	YouStoleFromGur				=	"SVM_3_YouStoleFromGur"				;//Ты обокрал Гуру! Жаль, но они уже знают об этом!
	StoleFromMage				=	"SVM_3_StoleFromMage"				;//Ты не слишком ловок, куда уж тебе воровать вещи у магов!
	YouKilledMyFriend			=	"SVM_3_YouKilledMyFriend"			;//Ты убил одного из наших людей! Попробуй только поднять на кого-нибудь руку, и тебе не поздоровится!
	YouKilledEBr				=	"SVM_3_YouKilledEBr"				;//Ты убил Барона! У тебя что, ума не хватило не лезть к нему?
	YouKilledGur				=	"SVM_3_YouKilledGur"				;//Ты убил Гуру?! Этого не может быть. Я не верю!
	YouKilledMage				=	"SVM_3_YouKilledMage"				;//Ты убил мага! У тебя есть достойное оправдание?
	YouKilledOCfolk				=	"SVM_3_YouKilledOCfolk"				;//В Старом лагере убит человек. Ходят слухи, что ты в этом как-то замешан...
	YouKilledNCfolk				=	"SVM_3_YouKilledNCfolk"				;//В Новом лагере произошло убийство. Говорят, там без тебя не обошлось.
	YouKilledPSIfolk			=	"SVM_3_YouKilledPSIfolk"			;//Братство лишилось одного из своих последователей, и это твоих рук дело!
	GetThingsRight				=	"SVM_3_GetThingsRight"				;//Ты не сможешь уйти от ответственности!
	YouDefeatedMeWell			=	"SVM_3_YouDefeatedMeWell"			;//Ты победил меня в честном бою! Я не в обиде!
	Smalltalk01					=	"SVM_3_Smalltalk01"					;// ...так ты говоришь...
	Smalltalk02					=	"SVM_3_Smalltalk02"					;// ...возможно...
	Smalltalk03					=	"SVM_3_Smalltalk03"					;// ...не самое лучшее решение...
	Smalltalk04					=	"SVM_3_Smalltalk04"					;// ...уж лучше я посмотрю со стороны...
	Smalltalk05					=	"SVM_3_Smalltalk05"					;// ...чужие проблемы не мое дело...
	Smalltalk06					=	"SVM_3_Smalltalk06"					;// ...уже тогда было ясно, что дело этим не кончится...
	Smalltalk07					=	"SVM_3_Smalltalk07"					;// ...только между нами, другим не нужно рассказывать...
	Smalltalk08					=	"SVM_3_Smalltalk08"					;// ...такое со мной больше не случится...
	Smalltalk09					=	"SVM_3_Smalltalk09"					;// ...интересно, а в этом что-то есть...
	Smalltalk10					=	"SVM_3_Smalltalk10"					;// ...нужно думать, прежде чем что-нибудь говорить...
	Smalltalk11					=	"SVM_3_Smalltalk11"					;// ...я не имею отношения к этому делу...
	Smalltalk12					=	"SVM_3_Smalltalk12"					;// ...нельзя верить всему, что слышишь...
	Smalltalk13					=	"SVM_3_Smalltalk13"					;// ...не хотел бы я, чтобы со мной поступили так же...
	Smalltalk14					=	"SVM_3_Smalltalk14"					;// ...все время одно и то же...
	Smalltalk15					=	"SVM_3_Smalltalk15"					;// ...глупость неизлечима, я давно это знал...
	Smalltalk16					=	"SVM_3_Smalltalk16"					;// ...раньше все было намного лучше, не то, что сейчас...
	Smalltalk17					=	"SVM_3_Smalltalk17"					;// ...и почему нельзя держать язык за зубами...
	Smalltalk18					=	"SVM_3_Smalltalk18"					;// ...больше не хочу слышать эту болтовню...
	Smalltalk19					=	"SVM_3_Smalltalk19"					;// ...здесь никому нельзя доверять, вокруг слишком много предателей, слишком...
	Smalltalk20					=	"SVM_3_Smalltalk20"					;// ...не думаю, что здесь хоть что-нибудь изменится...
	Smalltalk21					=	"SVM_3_Smalltalk21"					;// ...наверное, ты прав...
	Smalltalk22					=	"SVM_3_Smalltalk22"					;// ...надо выждать время. Спешка не доведет до добра...
	Smalltalk23					=	"SVM_3_Smalltalk23"					;// ...я думал, это уже давно решенный вопрос...
	Smalltalk24					=	"SVM_3_Smalltalk24"					;// ...это не слишком интересно, поговорим о чем-нибудь другом...
	Om							= 	"SVM_3_Om"							;// 
};


instance SVM_4 (C_SVM)				// Alter Sack,  (Torrez, KDF-Magier, alte Buddler....), alter Hase. Kann Grьnschnдbeln noch was zeigen
{
	StopMagic					=	"SVM_4_StopMagic"					;//Здесь нельзя использовать магию!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"				;//Мой тебе совет: перестань колдовать!
	WeaponDown					=	"SVM_4_WeaponDown"					;//Убери оружие, если не хочешь проблем!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"				;//Сейчас же убери оружие!
	WatchYourAim				=	"SVM_4_WatchYourAim"				;//Перестань в меня целиться!
	WatchYourAimAngry			=	"SVM_4_WatchYourAimAngry"			;//Если не уберешь эту игрушку, я сам ее отберу!
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"				;//Эй! Смотри, что делаешь!
	LetsForgetOurLittleFight	=	"SVM_4_LetsForgetOurLittleFight"	;//Давай забудем об этой ссоре, ладно?
	Strange						=	"SVM_4_Strange"						;//Эй, выходи! Где ты?
	DieMonster					=	"SVM_4_DieMonster"					;//Ты смотри, я убиваю их, а они все идут и идут!
	DieMortalEnemy				=	"SVM_4_DieMortalEnemy"				;//Ну все, тебе не жить!
	NowWait						=	"SVM_4_NowWait"						;//Сейчас я тебя научу, как себя вести...
	YouStillNotHaveEnough		=	"SVM_4_YouStillNotHaveEnough"		;//Так тебе еще мало?
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Ты сам напросился!
	NowWaitIntruder				= 	"SVM_4_NowWaitIntruder"				;//Тебе не стоило сюда заходить!
	IWillTeachYouRespectForForeignProperty	=	"SVM_4_IWillTeachYouRespectForForeignProperty"	;//Ты думаешь, что можешь безнаказанно заходить сюда?
	DirtyThief					=	"SVM_4_DirtyThief"					;//Ты посмел меня обокрасть!
	YouAttackedMyCharge			=	"SVM_4_YouAttackedMyCharge"			;//Если ты будешь к нам лезть, это добром не кончится!
	YouKilledOneOfUs			=	"SVM_4_YouKilledOneOfUs"			;//Ты убил нашего человека! Теперь мы убьем тебя!
	Dead						=	"SVM_4_Dead"						;//
	Aargh_1						=	"SVM_4_Aargh_1"						;//
	Aargh_2						=	"SVM_4_Aargh_2"						;//
	Aargh_3						=	"SVM_4_Aargh_3"						;//
	Berzerk						=	"SVM_4_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_4_YoullBeSorryForThis"			;//Ты еще пожалеешь об этом!
	YesYes						=	"SVM_4_YesYes"						;//Хватит, хватит, ты победил!
	ShitWhatAMonster			=	"SVM_4_ShitWhatAMonster"			;//Уходим отсюда! Быстро!
	Help						=	"SVM_4_Help"						;//Я слишком стар для этого!
	WeWillMeetAgain				=	"SVM_4_WeWillMeetAgain"				;//Я это тебе припомню!
	NeverTryThatAgain			=	"SVM_4_NeverTryThatAgain"			;//Больше так не делай!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"				;//А это оружие я, пожалуй, заберу себе!
	ITookYourOre				=	"SVM_4_ITookYourOre"				;//Думаю, у меня лучше получится потратить твою руду.
	ShitNoOre					=	"SVM_4_ShitNoOre"					;//Надо же! Ни кусочка руды...
	HandsOff					=	"SVM_4_HandsOff"					;//Убери руки!
	GetOutOfHere				=	"SVM_4_GetOutOfHere"				;//Убирайся отсюда!
	YouViolatedForbiddenTerritory=	"SVM_4_YouViolatedForbiddenTerritory";//Тебе здесь нечего делать!
	YouWannaFoolMe				=	"SVM_4_YouWannaFoolMe"				;//Мне сейчас не до шуток!
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"		;//Эй! Что ты здесь делаешь?
	WhyAreYouInHere				=	"SVM_4_WhyYouAreInHere"				;//Убирайся, или тебя выгонит стража!
	WhatDidYouInThere			=	"SVM_4_WhatDidYouInThere"			;//Что ты здесь забыл?
	WiseMove					=	"SVM_4_WiseMove"					;//На этот раз тебе повезло.
	Alarm						=	"SVM_4_Alarm"						;//Стража! Сюда!
	IntruderAlert				= 	"SVM_4_IntruderAlert"				;//Чужой!
	BehindYou					=	"SVM_4_BehindYou"					;//Осторожно!
	TheresAFight				=	"SVM_4_TheresAFight"				;//Опять драка.
	HeyHeyHey					=	"SVM_4_HeyHeyHey"					;//Давай!
	CheerFight					=	"SVM_4_CheerFight"					;//И это все?
	CheerFriend					=	"SVM_4_CheerFriend"					;//Врежь ему!
	Ooh							=	"SVM_4_Ooh"							;//Да бей же его!
	YeahWellDone				=	"SVM_4_YeahWellDone"				;//Отлично!
	RunCoward					=	"SVM_4_RunCoward"					;//Этот трус хочет убежать!
	HeDefeatedHim				=	"SVM_4_HeDefeatedHim"				;//Когда-то люди были сильнее!
	HeDeservedIt				=	"SVM_4_HeDeservedIt"				;//Сам виноват!
	HeKilledHim					=	"SVM_4_HeKilledHim"					;//Ты убил его! Это была большая ошибка!
	ItWasAGoodFight				=	"SVM_4_ItWasAGoodFight"				;//Раньше даже сражались лучше, чем сейчас.
	Awake						=	"SVM_4_Awake"						;// 
	FriendlyGreetings			=	"SVM_4_FriendlyGreetings"			;//Приветствую тебя!
	ALGreetings					=	"SVM_4_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_4_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_4_SectGreetings"				;//Пробудись! 
	ThereHeIs					= 	"SVM_4_ThereHeIs"					;//Ты найдешь его вон там!
	NoLearnNoPoints				= 	"SVM_4_NoLearnNoPoints"				;//Я не смогу ничему научить тебя. Тебе не хватает опыта.
	NoLearnOverMax				= 	"SVM_4_NoLearnOverMax"				;//Ты не сможешь это выучить. Лучше поучи что-нибудь другое.
	NoLearnYouAlreadyKnow		=	"SVM_4_NoLearnYouAlreadyKnow"		;//Начинать следует с малого, только так ты сможешь дойти до настоящего мастерства.
	NoLearnYoureBetter			=	"SVM_4_NoLearnYoureBetter"			;//Теперь уже лучше!
	HeyYou						=	"SVM_4_HeyYou"						;//Эй, ты!
	NotNow						=	"SVM_4_NotNow"						;//Не сейчас!
	WhatDoYouWant				=	"SVM_4_WhatDoYouWant"				;//Что тебе нужно?
	ISaidWhatDoYouWant			=	"SVM_4_ISaidWhatDoYouWant"			;//Ты что-то хочешь от меня?
	MakeWay						=	"SVM_4_MakeWay"						;//Дай пройти!
	OutOfMyWay					=	"SVM_4_OutOfMyWay"					;//Уйди с дороги!
	YouDeafOrWhat				=	"SVM_4_YouDeafOrWhat"				;//С дороги или пожалеешь!
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"		;//Ты снова хочешь получить?
	LookAway					=	"SVM_4_LookAway"					;//Не вижу, не слышу и никому ничего не скажу...
	OkayKeepIt					=	"SVM_4_OkayKeepIt"					;//Ну, оставь себе!
	WhatsThat					=	"SVM_4_WhatsThat"					;//Что за чертовщина?
	ThatsMyWeapon				=	"SVM_4_ThatsMyWeapon"				;//А ну-ка, верни мое оружие!
	GiveItToMe					=	"SVM_4_GiveItToMe"					;//Давай сюда, я сказал!
	YouCanKeeptheCrap			=	"SVM_4_YouCanKeeptheCrap"			;//Ладно, как хочешь! Я давно хотел избавиться от этого хлама!
	TheyKilledMyFriend			=	"SVM_4_TheyKilledMyFriend"			;//Как только я найду того, кто убил нашего человека, я ему...
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"		;//Ну, зачем ты разбудил меня?
	SuckerGotSome				=	"SVM_4_SuckerGotSome"				;//Что, проиграл, да! Это пойдет тебе на пользу!
	SuckerDefeatedEBr			=	"SVM_4_SuckerDefeatedEBr"			;//Ты победил Барона.  
	SuckerDefeatedGur			=	"SVM_4_SuckerDefeatedGur"			;//Ты избил одного из Гуру. Только не думай, что тебе позволят повторить такой 'подвиг'.
	SuckerDefeatedMage			=	"SVM_4_SuckerDefeatedMage"			;//Так ты победил мага? Наглости тебе не занимать!
	SuckerDefeatedNov_Guard		= 	"SVM_4_SuckerDefeatedNov_Guard"		;//Да ты совсем из ума выжил! Нельзя бить наших послушников!
	SuckerDefeatedVlk_Guard		= 	"SVM_4_SuckerDefeatedVlk_Guard"		;//Что на тебя нашло? Думаешь, мы будем стоять в стороне, пока ты будешь бить рудокопов?
	YouDefeatedMyComrade		=	"SVM_4_YouDefeatedMyComrade"		;//Ты ударил одного из моих друзей! Не стоило этого делать!
	YouDefeatedNOV_Guard		=	"SVM_4_YouDefeatedNOV_Guard"		;//Только попробуй еще раз тронуть послушника. Ты сразу же об этом пожалеешь!
	YouDefeatedVLK_Guard		=	"SVM_4_YouDefeatedVLK_Guard"		;//Слишком ты расхрабрился. Перестань обижать моих подопечных, иначе получишь!
	YouStoleFromMe				=	"SVM_4_YouStoleFromMe"				;//Держи свои грязные руки подальше от моих вещей!
	YouStoleFromUs				=	"SVM_4_YouStoleFromUs"				;//У тебя есть наши вещи. Отдай мигом!
	YouStoleFromEBr				=	"SVM_4_YouStoleFromEBr"				;//С ума сойти! Ты обокрал Баронов! Они тебя в покое не оставят!
	YouStoleFromGur				=	"SVM_4_YouStoleFromGur"				;//Ты обокрал Гуру! Глупо было попасться на этом!
	StoleFromMage				=	"SVM_4_StoleFromMage"				;//Маги совсем не любят, когда кто-то покушается на их добро!
	YouKilledMyFriend			=	"SVM_4_YouKilledMyFriend"			;//Убийство одного из наших людей на твоей совести. Еще раз оступишься, и будешь следующим!
	YouKilledEBr				=	"SVM_4_YouKilledEBr"				;//Ты убил Барона! Только сумасшедший мог пойти на это!
	YouKilledGur				=	"SVM_4_YouKilledGur"				;//Ты убил Гуру! Нет, я не верю, этого не может быть!
	YouKilledMage				=	"SVM_4_YouKilledMage"				;//Ты убил мага! Что, для этого были серьезные причины?
	YouKilledOCfolk				=	"SVM_4_YouKilledOCfolk"				;//В Старом лагере нашли убитого человека. Кое-кто считает, что в этом виноват ты...
	YouKilledNCfolk				=	"SVM_4_YouKilledNCfolk"				;//В Новом лагере не досчитались одного человека, и говорят, что ты связан с этим убийством!
	YouKilledPSIfolk			=	"SVM_4_YouKilledPSIfolk"			;//В Братстве убит один из последователей. Люди думают, что ты виноват в его убийстве!
	GetThingsRight				=	"SVM_4_GetThingsRight"				;//Тебе не отвертеться. Ты за все заплатишь!
	YouDefeatedMeWell			=	"SVM_4_YouDefeatedMeWell"			;//Ты победил меня в честном бою! Но теперь все позади! Я не в обиде!
	Smalltalk01					=	"SVM_4_Smalltalk01"					;// ...так ты говоришь...
	Smalltalk02					=	"SVM_4_Smalltalk02"					;// ...возможно...
	Smalltalk03					=	"SVM_4_Smalltalk03"					;// ...не самое лучшее решение...
	Smalltalk04					=	"SVM_4_Smalltalk04"					;// ...уж лучше я посмотрю со стороны...
	Smalltalk05					=	"SVM_4_Smalltalk05"					;// ...чужие проблемы не мое дело...
	Smalltalk06					=	"SVM_4_Smalltalk06"					;// ...уже тогда было ясно, что этим дело не кончится...
	Smalltalk07					=	"SVM_4_Smalltalk07"					;// ...только между нами, другим не нужно рассказывать...
	Smalltalk08					=	"SVM_4_Smalltalk08"					;// ...такое со мной больше не случится...
	Smalltalk09					=	"SVM_4_Smalltalk09"					;// ...интересно, а в этом что-то есть...
	Smalltalk10					=	"SVM_4_Smalltalk10"					;// ...нужно думать, прежде чем что-нибудь говорить...
	Smalltalk11					=	"SVM_4_Smalltalk11"					;// ...я не имею отношения к этому делу...
	Smalltalk12					=	"SVM_4_Smalltalk12"					;// ...нельзя верить всему, что слышишь...
	Smalltalk13					=	"SVM_4_Smalltalk13"					;// ...не хотел бы я, чтобы со мной поступили так же...
	Smalltalk14					=	"SVM_4_Smalltalk14"					;// ...все время одно и то же...
	Smalltalk15					=	"SVM_4_Smalltalk15"					;// ...глупость неизлечима, я давно это знал...
	Smalltalk16					=	"SVM_4_Smalltalk16"					;// ...раньше все было намного лучше, не то, что сейчас...
	Smalltalk17					=	"SVM_4_Smalltalk17"					;// ...и почему нельзя держать язык за зубами...
	Smalltalk18					=	"SVM_4_Smalltalk18"					;// ...больше не хочу слушать эту болтовню...
	Smalltalk19					=	"SVM_4_Smalltalk19"					;// ...здесь никому нельзя доверять, вокруг слишком много предателей...
	Smalltalk20					=	"SVM_4_Smalltalk20"					;// ...не думаю, что здесь хоть что-нибудь изменится...
	Smalltalk21					=	"SVM_4_Smalltalk21"					;// ...наверное, ты прав...
	Smalltalk22					=	"SVM_4_Smalltalk22"					;// ...надо выждать время. Спешка не доведет до добра...
	Smalltalk23					=	"SVM_4_Smalltalk23"					;// ...я думал, это уже давно решенный вопрос...
	Smalltalk24					=	"SVM_4_Smalltalk24"					;// ...это не слишком интересно, поговорим о чем-нибудь другом...
	Om							= 	"SVM_4_Om"							;//
};


instance SVM_5 (C_SVM)				//Lebenskьnstler, offen, Frцhlich. humorvoller Verarscher. Auch: Fauler Verpisser. SelbstbewuЯt, wortgewandt, charismatisch. (Lester)
{
	StopMagic					=	"SVM_5_StopMagic"					;//Здесь запрещено колдовать!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Я же сказал: колдовать запрещено!
	WeaponDown					=	"SVM_5_WeaponDown"					;//Лучше бы ты спрятал свое оружие!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Быстро убери оружие!
	WatchYourAim				=	"SVM_5_WatchYourAim"				;//Ты в меня целишься, да?
	WatchYourAimAngry			=	"SVM_5_WatchYourAimAngry"			;//Прекрати! С моим мечом познакомиться захотел?
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//Эй, ты что, совсем ослеп?
	LetsForgetOurLittleFight	=	"SVM_5_LetsForgetOurLittleFight"	;//Давай забудем об этой ссоре, ладно?
	Strange						=	"SVM_5_Strange"						;//Он же только что был здесь! Куда он делся? 
	DieMonster					=	"SVM_5_DieMonster"					;//Теперь твоя очередь, негодяй!
	DieMortalEnemy				=	"SVM_5_DieMortalEnemy"				;//Настал час расплаты!
	NowWait						=	"SVM_5_NowWait"						;//Получить захотел? Сейчас я надаю тебе по шее!
	YouStillNotHaveEnough		=	"SVM_5_YouStillNotHaveEnough"		;//А, тебе все еще мало!
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Ну, сам виноват!
	NowWaitIntruder				= 	"SVM_5_NowWaitIntruder"				;//Тебя придется уносить отсюда!
	IWillTeachYouRespectForForeignProperty	=	"SVM_5_IWillTeachYouRespectForForeignProperty"	;//Я тебя предупредил. Только попробуй что-нибудь украсть!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Вор! Ну, сейчас ты получишь!
	YouAttackedMyCharge			=	"SVM_5_YouAttackedMyCharge"			;//Если будешь лезть ко мне, ты сильно пожалеешь!
	YouKilledOneOfUs			=	"SVM_5_YouKilledOneOfUs"			;//Ты убил одного из моих людей. Теперь твоя очередь!
	Dead						=	"SVM_5_Dead"					;//
	Aargh_1						=	"SVM_5_Aargh_1"						;//
	Aargh_2						=	"SVM_5_Aargh_2"						;//
	Aargh_3						=	"SVM_5_Aargh_3"						;//
	Berzerk						=	"SVM_5_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_5_YoullBeSorryForThis"			;//Ты еще пожалеешь об этом!
	YesYes						=	"SVM_5_YesYes"						;//Эй, спокойно! Ты ведь победил.
	ShitWhatAMonster			=	"SVM_5_ShitWhatAMonster"			;//Мне его не одолеть!
	Help						=	"SVM_5_Help"						;//Черт!
	WeWillMeetAgain				=	"SVM_5_WeWillMeetAgain"				;//В следующий раз я отомщу тебе!
	NeverTryThatAgain			=	"SVM_5_NeverTryThatAgain"			;//И не пытайся отомстить!
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Какое хорошее оружие!
	ITookYourOre				=	"SVM_5_ITookYourOre"				;//Да, твоя руда очень кстати! Я потрачу ее с пользой!
	ShitNoOre					=	"SVM_5_ShitNoOre"					;//Не повезло! Руды нет!
	HandsOff					=	"SVM_5_HandsOff"					;//Руки прочь!
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Пошел вон!
	YouViolatedForbiddenTerritory=	"SVM_5_YouViolatedForbiddenTerritory";//Эй! Откуда ты пришел?
	YouWannaFoolMe				=	"SVM_5_YouWannaFoolMe"				;//Удачная шутка!
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Что тебе здесь нужно? Что ты замышляешь?
	WhyAreYouInHere				=	"SVM_5_WhyYouAreInHere"				;//Убирайся, или тебя выгонит стража!
	WhatDidYouInThere			=	"SVM_5_WhatDidYouInThere"			;//Здесь тебе делать нечего!
	WiseMove					=	"SVM_5_WiseMove"					;//Ты все понял правильно!
	Alarm						=	"SVM_5_Alarm"						;//Стража! Сюда!
	IntruderAlert				= 	"SVM_5_IntruderAlert"				;//Тревога!
	BehindYou					=	"SVM_5_BehindYou"					;//Эй, осторожно!
	TheresAFight				=	"SVM_5_TheresAFight"				;//Здесь драка!
	HeyHeyHey					=	"SVM_5_HeyHeyHey"					;//Бей его!
	CheerFight					=	"SVM_5_CheerFight"					;//Так его!
	CheerFriend					=	"SVM_5_CheerFriend"					;//Поддай ему!
	Ooh							=	"SVM_5_Ooh"							;//Эй, будь осторожнее!
	YeahWellDone				=	"SVM_5_YeahWellDone"				;//Как удачно!
	RunCoward					=	"SVM_5_RunCoward"					;//Этот трус от нас уходит!
	HeDefeatedHim				=	"SVM_5_HeDefeatedHim"				;//Полная победа, да!
	HeDeservedIt				=	"SVM_5_HeDeservedIt"				;//Так ему и надо!
	HeKilledHim					=	"SVM_5_HeKilledHim"					;//Ты убийца! Это недопустимо! У тебя будут проблемы!
	ItWasAGoodFight				=	"SVM_5_ItWasAGoodFight"				;//Отличная драка!
	Awake						=	"SVM_5_Awake"						;// 
	FriendlyGreetings			=	"SVM_5_FriendlyGreetings"			;//Привет, дружище!
	ALGreetings					=	"SVM_5_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_5_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_5_SectGreetings"				;//Пробудись! 
	ThereHeIs					= 	"SVM_5_ThereHeIs"					;//Все сюда.
	NoLearnNoPoints				= 	"SVM_5_NoLearnNoPoints"				;//Я ничему не смогу научить тебя, тебе не хватает опыта.
	NoLearnOverMax				= 	"SVM_5_NoLearnOverMax"				;//Ты выучил все, что нужно. Тебе стоит поучиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_5_NoLearnYouAlreadyKnow"		;//Мастерство приходит со временем. Тебе нужно больше опыта!
	NoLearnYoureBetter			=	"SVM_5_NoLearnYoureBetter"			;//Твое мастерство растет!
	HeyYou						=	"SVM_5_HeyYou"						;//Эй, постой!
	NotNow						=	"SVM_5_NotNow"						;//У меня нет времени.
	WhatDoYouWant				=	"SVM_5_WhatDoYouWant"				;//Я могу помочь тебе?
	ISaidWhatDoYouWant			=	"SVM_5_ISaidWhatDoYouWant"			;//Что тебе нужно?
	MakeWay						=	"SVM_5_MakeWay"						;//Дай пройти!
	OutOfMyWay					=	"SVM_5_OutOfMyWay"					;//Давай, уходи с дороги!
	YouDeafOrWhat				=	"SVM_5_YouDeafOrWhat"				;//Тебе нужны неприятности? Я могу тебе это устроить!
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//Ты снова хочешь получить?
	LookAway					=	"SVM_5_LookAway"					;//Я ничего не видел... А что, что-то произошло?
	OkayKeepIt					=	"SVM_5_OkayKeepIt"					;//Ладно, забирай себе!
	WhatsThat					=	"SVM_5_WhatsThat"					;//Что случилось?
	ThatsMyWeapon				=	"SVM_5_ThatsMyWeapon"				;//Я хочу вернуть свое оружие!
	GiveItToMe					=	"SVM_5_GiveItToMe"					;//Просто отдай его мне!
	YouCanKeeptheCrap			=	"SVM_5_YouCanKeeptheCrap"			;//Ну, все не так уж и плохо! У меня еще есть!
	TheyKilledMyFriend			=	"SVM_5_TheyKilledMyFriend"			;//Убит наш человек. Уж я покажу тому, кто это сделал...
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//Эй, в чем дело? Зачем ты меня разбудил?
	SuckerGotSome				=	"SVM_5_SuckerGotSome"				;//Ну? Ты доволен? Это будет тебе уроком!
	SuckerDefeatedEBr			=	"SVM_5_SuckerDefeatedEBr"			;//Ты победил Барона. Как же он был удивлен!
	SuckerDefeatedGur			=	"SVM_5_SuckerDefeatedGur"			;//Ты победил Гуру. Ну ты даешь! Но даже не думай, что в следующий раз это сойдет тебе с рук.
	SuckerDefeatedMage			=	"SVM_5_SuckerDefeatedMage"			;//Ты победил мага... невероятно! Ну и силен же ты!
	SuckerDefeatedNov_Guard		= 	"SVM_5_SuckerDefeatedNov_Guard"		;//Не трогай послушников! Ты сошел с ума?
	SuckerDefeatedVlk_Guard		= 	"SVM_5_SuckerDefeatedVlk_Guard"		;//Ты зачем бьешь рудокопов? Тебе это зачтется!
	YouDefeatedMyComrade		=	"SVM_5_YouDefeatedMyComrade"		;//Зачем ты ударил моего напарника?
	YouDefeatedNOV_Guard		=	"SVM_5_YouDefeatedNOV_Guard"		;//Только тронь послушника, и мы с тебя шкуру спустим!
	YouDefeatedVLK_Guard		=	"SVM_5_YouDefeatedVLK_Guard"		;//Не распускай руки! Я защищаю этих людей. Тронешь их хоть пальцем, пеняй на себя! 
	YouStoleFromMe				=	"SVM_5_YouStoleFromMe"				;//Как ты смеешь являться сюда, грязный вор!
	YouStoleFromUs				=	"SVM_5_YouStoleFromUs"				;//У тебя есть то, что принадлежит нам. Лучше бы ты отдал это нам добровольно!
	YouStoleFromEBr				=	"SVM_5_YouStoleFromEBr"				;//Ну, ты даешь! Ты же обокрал рудных Баронов! Они не оставят тебя в покое!
	YouStoleFromGur				=	"SVM_5_YouStoleFromGur"				;//Ты обокрал Гуру! Постарайся не попадаться им на глаза!
	StoleFromMage				=	"SVM_5_StoleFromMage"				;//Не стоит воровать то, что принадлежит магам. Воров они убивают на месте!
	YouKilledMyFriend			=	"SVM_5_YouKilledMyFriend"			;//Ты убил одного из наших людей. Очередная подобная выходка, и тебе не поздоровится!
	YouKilledEBr				=	"SVM_5_YouKilledEBr"				;//Ты убил рудного Барона! Ты что, совсем потерял голову?
	YouKilledGur				=	"SVM_5_YouKilledGur"				;//Ты убил Гуру! Какой ужас!
	YouKilledMage				=	"SVM_5_YouKilledMage"				;//Ты убил мага! У тебя есть достойное оправдание?
	YouKilledOCfolk				=	"SVM_5_YouKilledOCfolk"				;//В Старом лагере был убит человек. Ходят слухи, что ты причастен к этому...
	YouKilledNCfolk				=	"SVM_5_YouKilledNCfolk"				;//В Новом лагере произошло убийство. Говорят, ты как-то замешан в этом!
	YouKilledPSIfolk			=	"SVM_5_YouKilledPSIfolk"			;//Братство лишилось одного из своих приверженцев. Это твоих рук дело!
	GetThingsRight				=	"SVM_5_GetThingsRight"				;//Не хотел бы я попасть в подобную переделку!
	YouDefeatedMeWell			=	"SVM_5_YouDefeatedMeWell"			;//Ты победил в честном бою. Но теперь забудем об этой ссоре!
	Smalltalk01					=	"SVM_5_Smalltalk01"					;// ...ты хочешь сказать...
	Smalltalk02					=	"SVM_5_Smalltalk02"					;// ...возможно...
	Smalltalk03					=	"SVM_5_Smalltalk03"					;// ...да, дурное дело нехитрое...
	Smalltalk04					=	"SVM_5_Smalltalk04"					;// ...я не буду вмешиваться...
	Smalltalk05					=	"SVM_5_Smalltalk05"					;// ...это же не мое дело...
	Smalltalk06					=	"SVM_5_Smalltalk06"					;// ...конечно, его злость тут не поможет...
	Smalltalk07					=	"SVM_5_Smalltalk07"					;// ...сохрани это в тайне, людям лучше этого не знать.
	Smalltalk08					=	"SVM_5_Smalltalk08"					;// ...со мной такого не случится...
	Smalltalk09					=	"SVM_5_Smalltalk09"					;// ...знаешь, а в этом что-то есть...
	Smalltalk10					=	"SVM_5_Smalltalk10"					;// ...здесь нельзя говорить что попало...
	Smalltalk11					=	"SVM_5_Smalltalk11"					;// ...я не причастен к этому делу...
	Smalltalk12					=	"SVM_5_Smalltalk12"					;// ...нельзя верить всему, что говорят...
	Smalltalk13					=	"SVM_5_Smalltalk13"					;// ...не хотел бы я попасть в подобную переделку...
	Smalltalk14					=	"SVM_5_Smalltalk14"					;// ...сколько можно повторять одно и то же...
	Smalltalk15					=	"SVM_5_Smalltalk15"					;// ...как можно не понимать этого...
	Smalltalk16					=	"SVM_5_Smalltalk16"					;// ...эх, раньше все было гораздо лучше...
	Smalltalk17					=	"SVM_5_Smalltalk17"					;// ...об этом слишком много болтают...
	Smalltalk18					=	"SVM_5_Smalltalk18"					;// ...мне уже надоело это слушать...
	Smalltalk19					=	"SVM_5_Smalltalk19"					;// ...здесь никому нельзя доверять, каждый может обмануть...
	Smalltalk20					=	"SVM_5_Smalltalk20"					;// ...не думаю, что здесь можно хоть что-нибудь изменить...
	Smalltalk21					=	"SVM_5_Smalltalk21"					;// ...может быть, это правда...
	Smalltalk22					=	"SVM_5_Smalltalk22"					;// ...в этом деле главное - выждать время, а потом видно будет...
	Smalltalk23					=	"SVM_5_Smalltalk23"					;// ...мне казалось, что эта проблема давно уже решена...
	Smalltalk24					=	"SVM_5_Smalltalk24"					;// ...давай лучше сменим тему...
	Om							= 	"SVM_5_Om"							;//
};

//////////////////////////////////////////
instance SVM_6 (C_SVM)				//Raufbold	(Will saufen und raufen	(Matrose) Alkoholiker. Grцlt viel)
{
	StopMagic					=	"SVM_6_StopMagic"					;//Здесь запрещено колдовать!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"				;//Я же сказал: колдовать запрещено!
	WeaponDown					=	"SVM_6_WeaponDown"					;//Лучше бы ты спрятал свое оружие!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"				;//Быстро убери оружие!
	WatchYourAim				=	"SVM_6_WatchYourAim"				;//Ты в меня целишься, да?
	WatchYourAimAngry			=	"SVM_6_WatchYourAimAngry"			;//Прекрати! С моим мечом познакомиться захотел?
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"				;//Эй, ты что, совсем ослеп?
	LetsForgetOurLittleFight	=	"SVM_6_LetsForgetOurLittleFight"	;//Давай забудем об этой ссоре, ладно?
	Strange						=	"SVM_6_Strange"						;//Он же только что был здесь! Куда он делся?
	DieMonster					=	"SVM_6_DieMonster"					;//Теперь твоя очередь, негодяй!
	DieMortalEnemy				=	"SVM_6_DieMortalEnemy"				;//Настал час расплаты!
	NowWait						=	"SVM_6_NowWait"						;//Получить захотел? Сейчас я надаю тебе по шее!
	YouStillNotHaveEnough		=	"SVM_6_YouStillNotHaveEnough"		;//А, тебе все еще мало!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Ну, сам виноват!
	NowWaitIntruder				= 	"SVM_6_NowWaitIntruder"				;//Тебя придется уносить отсюда!
	IWillTeachYouRespectForForeignProperty	=	"SVM_6_IWillTeachYouRespectForForeignProperty"	;//Я тебя предупредил. Только попробуй что-нибудь украсть!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Вор! Ну, сейчас ты получишь!
	YouAttackedMyCharge			=	"SVM_6_YouAttackedMyCharge"			;//Если будешь лезть ко мне, ты сильно пожалеешь!
	YouKilledOneOfUs			=	"SVM_6_YouKilledOneOfUs"			;//Ты убил одного из моих людей. Теперь твоя очередь!
	Dead						=	"SVM_6_Dead"						;//
	Aargh_1						=	"SVM_6_Aargh_1"						;//
	Aargh_2						=	"SVM_6_Aargh_2"						;//
	Aargh_3						=	"SVM_6_Aargh_3"						;//
	Berzerk						=	"SVM_6_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_6_YoullBeSorryForThis"			;//Ты еще пожалеешь об этом!
	YesYes						=	"SVM_6_YesYes"						;//Эй, спокойно! Ты ведь победил.
	ShitWhatAMonster			=	"SVM_6_ShitWhatAMonster"			;//Мне его не одолеть!
	Help						=	"SVM_6_Help"						;//Черт!
	WeWillMeetAgain				=	"SVM_6_WeWillMeetAgain"				;//В следующий раз я отомщу тебе!
	NeverTryThatAgain			=	"SVM_6_NeverTryThatAgain"			;//И не пытайся отомстить!
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"				;//Какое хорошее оружие!
	ITookYourOre				=	"SVM_6_ITookYourOre"				;//Да, твоя руда очень кстати! Я потрачу ее с пользой!
	ShitNoOre					=	"SVM_6_ShitNoOre"					;//Не повезло! Руды нет!
	HandsOff					=	"SVM_6_HandsOff"					;//Руки прочь!
	GetOutOfHere				=	"SVM_6_GetOutOfHere"				;//Пошел вон!
	YouViolatedForbiddenTerritory=	"SVM_6_YouViolatedForbiddenTerritory";//Эй! Откуда ты пришел?
	YouWannaFoolMe				=	"SVM_6_YouWannaFoolMe"				;//Удачная шутка!
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"		;//Что тебе здесь нужно? Что ты замышляешь?
	WhyAreYouInHere				=	"SVM_6_WhyYouAreInHere"				;//Убирайся, или тебя выгонит стража!
	WhatDidYouInThere			=	"SVM_6_WhatDidYouInThere"			;//Здесь тебе делать нечего!
	WiseMove					=	"SVM_6_WiseMove"					;//Ты все понял правильно!
	Alarm						=	"SVM_6_Alarm"						;//Стража! Сюда!
	IntruderAlert				= 	"SVM_6_IntruderAlert"				;//Тревога!
	BehindYou					=	"SVM_6_BehindYou"					;//Эй, осторожно!
	TheresAFight				=	"SVM_6_TheresAFight"				;//Здесь драка!
	HeyHeyHey					=	"SVM_6_HeyHeyHey"					;//Бей его!
	CheerFight					=	"SVM_6_CheerFight"					;//Так его!
	CheerFriend					=	"SVM_6_CheerFriend"					;//Убей его!
	Ooh							=	"SVM_6_Ooh"							;//Эй, будь осторожнее!
	YeahWellDone				=	"SVM_6_YeahWellDone"				;//Как удачно!
	RunCoward					=	"SVM_6_RunCoward"					;//Этот трус от нас уходит!
	HeDefeatedHim				=	"SVM_6_HeDefeatedHim"				;//Полная победа, да!
	HeDeservedIt				=	"SVM_6_HeDeservedIt"				;//Так ему и надо!
	HeKilledHim					=	"SVM_6_HeKilledHim"					;//Ты убийца! Это недопустимо! У тебя будут проблемы!
	ItWasAGoodFight				=	"SVM_6_ItWasAGoodFight"				;//Отличная драка!
	Awake						=	"SVM_6_Awake"						;//
	FriendlyGreetings			=	"SVM_6_FriendlyGreetings"			;//Привет, дружище!
	ALGreetings					=	"SVM_6_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_6_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_6_SectGreetings"				;//Пробудись!
	ThereHeIs					= 	"SVM_6_ThereHeIs"					;//Все сюда.
	NoLearnNoPoints				= 	"SVM_6_NoLearnNoPoints"				;//Я ничему не смогу научить тебя, тебе не хватает опыта.
	NoLearnOverMax				= 	"SVM_6_NoLearnOverMax"				;//Ты выучил все, что нужно. Тебе стоит поучиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_6_NoLearnYouAlreadyKnow"		;//Мастерство приходит со временем. Тебе нужно больше опыта!
	NoLearnYoureBetter			=	"SVM_6_NoLearnYoureBetter"			;//Твое мастерство растет!
	HeyYou						=	"SVM_6_HeyYou"						;//Эй, постой!
	NotNow						=	"SVM_6_NotNow"						;//У меня нет времени.
	WhatDoYouWant				=	"SVM_6_WhatDoYouWant"				;//Я могу помочь тебе?
	ISaidWhatDoYouWant			=	"SVM_6_ISaidWhatDoYouWant"			;//Что тебе нужно?
	MakeWay						=	"SVM_6_MakeWay"						;//Дай пройти!
	OutOfMyWay					=	"SVM_6_OutOfMyWay"					;//Давай, уходи с дороги!
	YouDeafOrWhat				=	"SVM_6_YouDeafOrWhat"				;//Тебе нужны неприятности? Я могу тебе это устроить!
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"		;//Ты снова хочешь получить?
	LookAway					=	"SVM_6_LookAway"					;//Я ничего не видел... А что, что-то произошло?
	OkayKeepIt					=	"SVM_6_OkayKeepIt"					;//Ладно, забирай себе!
	WhatsThat					=	"SVM_6_WhatsThat"					;//Что случилось?
	ThatsMyWeapon				=	"SVM_6_ThatsMyWeapon"				;//Я хочу вернуть свое оружие!
	GiveItToMe					=	"SVM_6_GiveItToMe"					;//Просто отдай его мне!
	YouCanKeeptheCrap			=	"SVM_6_YouCanKeeptheCrap"			;//Ну, все не так уж и плохо! У меня есть еще!
	TheyKilledMyFriend			=	"SVM_6_TheyKilledMyFriend"			;//Убит наш человек. Уж я покажу тому, кто это сделал...
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"		;//Эй, в чем дело? Зачем ты меня разбудил?
	SuckerGotSome				=	"SVM_6_SuckerGotSome"				;//Ну? Ты доволен? Это будет тебе уроком!
	SuckerDefeatedEBr			=	"SVM_6_SuckerDefeatedEBr"			;//Ты победил Барона. Как же он был удивлен!
	SuckerDefeatedGur			=	"SVM_6_SuckerDefeatedGur"			;//Ты победил Гуру. Ну, ты даешь! Но даже не думай, что в следующий раз это сойдет тебе с рук.
	SuckerDefeatedMage			=	"SVM_6_SuckerDefeatedMage"			;//Ты победил мага... невероятно! Ну и силен же ты!
	SuckerDefeatedNov_Guard		= 	"SVM_6_SuckerDefeatedNov_Guard"		;//Не трогай послушников! Ты сошел с ума?
	SuckerDefeatedVlk_Guard		= 	"SVM_6_SuckerDefeatedVlk_Guard"		;//Ты зачем бьешь рудокопов? Это тебе зачтется!
	YouDefeatedMyComrade		=	"SVM_6_YouDefeatedMyComrade"		;//Зачем ты ударил моего напарника?
	YouDefeatedNOV_Guard		=	"SVM_6_YouDefeatedNOV_Guard"		;//Только тронь послушника, и мы с тебя шкуру спустим!
	YouDefeatedVLK_Guard		=	"SVM_6_YouDefeatedVLK_Guard"		;//Не распускай руки! Я защищаю этих людей. Тронешь их хоть пальцем, пеняй на себя!
	YouStoleFromMe				=	"SVM_6_YouStoleFromMe"				;//Как ты смеешь являться сюда, грязный вор!
	YouStoleFromUs				=	"SVM_6_YouStoleFromUs"				;//У тебя есть то, что принадлежит нам. Лучше бы ты отдал это нам добровольно!
	YouStoleFromEBr				=	"SVM_6_YouStoleFromEBr"				;//Ну, ты даешь! Ты же обокрал Баронов! Они не оставят тебя в покое!
	YouStoleFromGur				=	"SVM_6_YouStoleFromGur"				;//Ты обокрал Гуру! Постарайся не попадаться им на глаза!
	StoleFromMage				=	"SVM_6_StoleFromMage"				;//Не стоит воровать то, что принадлежит магам. Воров они убивают на месте!
	YouKilledMyFriend			=	"SVM_6_YouKilledMyFriend"			;//Ты убил одного из наших людей. Очередная подобная выходка, и тебе не поздоровится!
	YouKilledEBr				=	"SVM_6_YouKilledEBr"				;//Ты убил Барона! Ты что, совсем потерял голову?
	YouKilledGur				=	"SVM_6_YouKilledGur"				;//Ты убил Гуру! Какой ужас!
	YouKilledMage				=	"SVM_6_YouKilledMage"				;//Ты убил мага! У тебя есть достойное оправдание?
	YouKilledOCfolk				=	"SVM_6_YouKilledOCfolk"				;//В Старом лагере был убит человек. Ходят слухи, что ты причастен к этому...
	YouKilledNCfolk				=	"SVM_6_YouKilledNCfolk"				;//В Новом лагере произошло убийство. Говорят, ты как-то замешан в этом!
	YouKilledPSIfolk			=	"SVM_6_YouKilledPSIfolk"			;//Братство лишилось одного из своих приверженцев. Это твоих рук дело!
	GetThingsRight				=	"SVM_6_GetThingsRight"				;//Ты не сможешь избежать ответственности!
	YouDefeatedMeWell			=	"SVM_6_YouDefeatedMeWell"			;//Ты победил в честном бою. Но теперь забудем об этой ссоре!
	Smalltalk01					=	"SVM_6_Smalltalk01"					;// ...ты хочешь сказать...
	Smalltalk02					=	"SVM_6_Smalltalk02"					;// ...возможно...
	Smalltalk03					=	"SVM_6_Smalltalk03"					;// ...да, дурное дело нехитрое...
	Smalltalk04					=	"SVM_6_Smalltalk04"					;// ...я не буду вмешиваться...
	Smalltalk05					=	"SVM_6_Smalltalk05"					;// ...это же не мое дело...
	Smalltalk06					=	"SVM_6_Smalltalk06"					;// ...конечно, его злость тут не поможет...
	Smalltalk07					=	"SVM_6_Smalltalk07"					;// ...сохрани это в тайне, людям лучше этого не знать.
	Smalltalk08					=	"SVM_6_Smalltalk08"					;// ...со мной такого не случится...
	Smalltalk09					=	"SVM_6_Smalltalk09"					;// ...знаешь, а в этом что-то есть...
	Smalltalk10					=	"SVM_6_Smalltalk10"					;// ...здесь нельзя говорить что попало...
	Smalltalk11					=	"SVM_6_Smalltalk11"					;// ...я не причастен к этому делу...
	Smalltalk12					=	"SVM_6_Smalltalk12"					;// ...нельзя верить всему, что говорят...
	Smalltalk13					=	"SVM_6_Smalltalk13"					;// ...не хотел бы я попасть в подобную переделку...
	Smalltalk14					=	"SVM_6_Smalltalk14"					;// ...сколько можно повторять одно и то же...
	Smalltalk15					=	"SVM_6_Smalltalk15"					;// ...как можно не понимать этого...
	Smalltalk16					=	"SVM_6_Smalltalk16"					;// ...раньше все было гораздо лучше...
	Smalltalk17					=	"SVM_6_Smalltalk17"					;// ...об этом слишком много болтают...
	Smalltalk18					=	"SVM_6_Smalltalk18"					;// ...мне уже надоело это слушать...
	Smalltalk19					=	"SVM_6_Smalltalk19"					;// ...здесь никому нельзя доверять, каждый может обмануть...
	Smalltalk20					=	"SVM_6_Smalltalk20"					;// ...не думаю, что здесь можно хоть что-нибудь изменить...
	Smalltalk21					=	"SVM_6_Smalltalk21"					;// ...может быть, это правда...
	Smalltalk22					=	"SVM_6_Smalltalk22"					;// ...в этом деле главное выждать время, а потом видно будет...
	Smalltalk23					=	"SVM_6_Smalltalk23"					;// ...мне казалось, что эта проблема давно уже решена...
	Smalltalk24					=	"SVM_6_Smalltalk24"					;// ...давай лучше сменим тему...
	Om							= 	"SVM_6_Om"							;//
};

//////////////////////////////////////////
instance SVM_7 (C_SVM)				//Freak, Aggressiv. Spielt mit seiner Macht. Sadist. Org: Abschaum, den im AL keiner wollte. Nov (selten): Durchgeknallter Abschaum.
{
	StopMagic					=	"SVM_7_StopMagic"					;//Перестань немедленно!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"				;//Перестань колдовать, говорю!
	WeaponDown					=	"SVM_7_WeaponDown"					;//Убери оружие!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"				;//Я не шучу! Убери его!
	WatchYourAim				=	"SVM_7_WatchYourAim"				;//Эй, ты в меня целишься?!
	WatchYourAimAngry			=	"SVM_7_WatchYourAimAngry"			;//Напугать меня захотел? Я тебя не боюсь!
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"				;//Я это тебе припомню! Смотри, что делаешь!
	LetsForgetOurLittleFight	=	"SVM_7_LetsForgetOurLittleFight"	;//Забудем об этом, хорошо?
	Strange						=	"SVM_7_Strange"						;//Куда... он ушел? Невозможно! Как такое может быть?!
	DieMonster					=	"SVM_7_DieMonster"					;//Сейчас я тебя уничтожу!
	DieMortalEnemy				=	"SVM_7_DieMortalEnemy"				;//Настал твой час! Пощады не жди!
	NowWait						=	"SVM_7_NowWait"						;//Теперь у меня есть повод убить тебя!
	YouStillNotHaveEnough		=	"SVM_7_YouStillNotHaveEnough"		;//Больше не будешь ко мне лезть, понял?
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Крови! Хочу крови!
	NowWaitIntruder				= 	"SVM_7_NowWaitIntruder"				;//Я разорву тебя на мелкие кусочки...
	IWillTeachYouRespectForForeignProperty	=	"SVM_7_IWillTeachYouRespectForForeignProperty"	;//Я разрублю тебя пополам!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Грязный вор! Ты еще пожалеешь!
	YouAttackedMyCharge			=	"SVM_7_YouAttackedMyCharge"			;//Здесь только я затеваю драки!
	YouKilledOneOfUs			=	"SVM_7_YouKilledOneOfUs"			;//Ты убил нашего человека!
	Dead						=	"SVM_7_Dead"						;//
	Aargh_1						=	"SVM_7_Aargh_1"						;//
	Aargh_2						=	"SVM_7_Aargh_2"						;//
	Aargh_3						=	"SVM_7_Aargh_3"						;//
	Berzerk						=	"SVM_7_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_7_YoullBeSorryForThis"			;//Ты даже не успеешь пожалеть об этом как следует!
	YesYes						=	"SVM_7_YesYes"						;//Ладно, не сердись!
	ShitWhatAMonster			=	"SVM_7_ShitWhatAMonster"			;//У меня нет хорошего оружия. Но мы еще встретимся...
	Help						=	"SVM_7_Help"						;//Проклятье!
	WeWillMeetAgain				=	"SVM_7_WeWillMeetAgain"				;//Мы еще встретимся!
	NeverTryThatAgain			=	"SVM_7_NeverTryThatAgain"			;//Только попробуй сделать это еще раз!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"				;//А оружие я, пожалуй, заберу!
	ITookYourOre				=	"SVM_7_ITookYourOre"				;//Я бы мог тебя убить. Но руда - это тоже не так уж плохо!
	ShitNoOre					=	"SVM_7_ShitNoOre"					;//Что, нет руды? Да от тебя нет никакого толка!
	HandsOff					=	"SVM_7_HandsOff"					;//Держи свои руки при себе!
	GetOutOfHere				=	"SVM_7_GetOutOfHere"				;//Убирайся! Пошел отсюда!
	YouViolatedForbiddenTerritory=	"SVM_7_YouViolatedForbiddenTerritory";//Как ты попал сюда?
	YouWannaFoolMe				=	"SVM_7_YouWannaFoolMe"				;//Ты пытаешься меня обдурить, да?
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"		;//Эй, ты! Что тебе здесь нужно?
	WhyAreYouInHere				=	"SVM_7_WhyYouAreInHere"				;//Убирайся, или я позову стражу!
	WhatDidYouInThere			=	"SVM_7_WhatDidYouInThere"			;//Тебе нечего здесь делать!
	WiseMove					=	"SVM_7_WiseMove"					;//На этот раз тебе повезло! Но я бы с удовольствием проучил тебя!
	Alarm						=	"SVM_7_Alarm"						;//Стража, сюда!
	IntruderAlert				= 	"SVM_7_IntruderAlert"				;//Тревога!
	BehindYou					=	"SVM_7_BehindYou"					;//Будь осторожен!
	TheresAFight				=	"SVM_7_TheresAFight"				;//О, драка!
	HeyHeyHey					=	"SVM_7_HeyHeyHey"					;//Бей сильнее!
	CheerFight					=	"SVM_7_CheerFight"					;//Я хочу видеть кровь!
	CheerFriend					=	"SVM_7_CheerFriend"					;//Врежь ему!
	Ooh							=	"SVM_7_Ooh"							;//Эй, ты, защищайся!
	YeahWellDone				=	"SVM_7_YeahWellDone"				;//Да!
	RunCoward					=	"SVM_7_RunCoward"					;//Беги, беги! Все равно догоним!
	HeDefeatedHim				=	"SVM_7_HeDefeatedHim"				;//Хватит с него!
	HeDeservedIt				=	"SVM_7_HeDeservedIt"				;//Сам виноват!
	HeKilledHim					=	"SVM_7_HeKilledHim"					;//Наверное, тебе жить надоело. Не стоило убивать его при свидетелях!
	ItWasAGoodFight				=	"SVM_7_ItWasAGoodFight"				;//Хорошая битва!
	Awake						=	"SVM_7_Awake"						;//Что, пора вставать?
	FriendlyGreetings			=	"SVM_7_FriendlyGreetings"			;//Привет!
	ALGreetings					=	"SVM_7_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_7_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_7_SectGreetings"				;//Пробудись!
	ThereHeIs					= 	"SVM_7_ThereHeIs"					;//Ты что, совсем ослеп?
	NoLearnNoPoints				= 	"SVM_7_NoLearnNoPoints"				;//Я не могу ничему научить тебя. Твоего опыта недостаточно.
	NoLearnOverMax				= 	"SVM_7_NoLearnOverMax"				;//Ты не можешь больше учить это, лучше выбери что-нибудь другое.
	NoLearnYouAlreadyKnow		=	"SVM_7_NoLearnYouAlreadyKnow"		;//Ты должен изучать эту науку постепенно. Только так ты сможешь стать мастером.
	NoLearnYoureBetter			=	"SVM_7_NoLearnYoureBetter"			;//О, у тебя уже больше опыта!
	HeyYou						=	"SVM_7_HeyYou"						;//Эй, ты!
	NotNow						=	"SVM_7_NotNow"						;//Сейчас не время!
	WhatDoYouWant				=	"SVM_7_WhatDoYouWant"				;//Что тебе от меня нужно?
	ISaidWhatDoYouWant			=	"SVM_7_ISaidWhatDoYouWant"			;//Ты хочешь попросить меня о чем-то?
	MakeWay						=	"SVM_7_MakeWay"						;//Дай пройти.
	OutOfMyWay					=	"SVM_7_OutOfMyWay"					;//Уйди с дороги!
	YouDeafOrWhat				=	"SVM_7_YouDeafOrWhat"				;//Хочешь со мной поссориться? Уйди с дороги!
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"		;//Ты снова ищешь ссоры?
	LookAway					=	"SVM_7_LookAway"					;//Я ничего не видел!
	OkayKeepIt					=	"SVM_7_OkayKeepIt"					;//Хорошо, хорошо! Оставь себе!
	WhatsThat					=	"SVM_7_WhatsThat"					;//Что это было?
	ThatsMyWeapon				=	"SVM_7_ThatsMyWeapon"				;//Верни мне оружие!
	GiveItToMe					=	"SVM_7_GiveItToMe"					;//Отдай, тебе говорят!
	YouCanKeeptheCrap			=	"SVM_7_YouCanKeeptheCrap"			;//Ну, ладно, оставь себе! А я найду себе что-то другое.
	TheyKilledMyFriend			=	"SVM_7_TheyKilledMyFriend"			;//Один из наших людей был убит! Мы отомстим за него!
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"		;//Зачем ты разбудил меня?
	SuckerGotSome				=	"SVM_7_SuckerGotSome"				;//Это послужит тебе хорошим уроком!
	SuckerDefeatedEBr			=	"SVM_7_SuckerDefeatedEBr"			;//Ты избил Барона! Он тебе отомстит!
	SuckerDefeatedGur			=	"SVM_7_SuckerDefeatedGur"			;//Ты ударил Гуру! Наверное, тебе нравится попадать в неприятности!
	SuckerDefeatedMage			=	"SVM_7_SuckerDefeatedMage"			;//Так ты вздумал победить мага, да?
	SuckerDefeatedNov_Guard		= 	"SVM_7_SuckerDefeatedNov_Guard"		;//Это ты обижаешь наших послушников?
	SuckerDefeatedVlk_Guard		= 	"SVM_7_SuckerDefeatedVlk_Guard"		;//Перестань лезть к моим людям!
	YouDefeatedMyComrade		=	"SVM_7_YouDefeatedMyComrade"		;//Ты не на тех напал! Мы здесь защищаем друг друга от таких, как ты!
	YouDefeatedNOV_Guard		=	"SVM_7_YouDefeatedNOV_Guard"		;//Мне совсем не нравится, что ты распускаешь руки!
	YouDefeatedVLK_Guard		=	"SVM_7_YouDefeatedVLK_Guard"		;//Если ты обидишь одного из моих подопечных, ты будешь иметь дело со мной!
	YouStoleFromMe				=	"SVM_7_YouStoleFromMe"				;//Ты же обокрал меня! В следующий раз это будет стоить тебе жизни!
	YouStoleFromUs				=	"SVM_7_YouStoleFromUs"				;//Мы хотим вернуть свои вещи! Отдай их нам!
	YouStoleFromEBr				=	"SVM_7_YouStoleFromEBr"				;//Ты обокрал Баронов! Зачем ты это сделал?
	YouStoleFromGur				=	"SVM_7_YouStoleFromGur"				;//Ты обокрал Гуру! Жаль, но они уже знают об этой краже!
	StoleFromMage				=	"SVM_7_StoleFromMage"				;//Ты обокрал магов! Какая бредовая идея!
	YouKilledMyFriend			=	"SVM_7_YouKilledMyFriend"			;//Ты убил одного из наших людей! Попробуй только поднять на кого-нибудь руку, и тебе не поздоровится!
	YouKilledEBr				=	"SVM_7_YouKilledEBr"				;//Ты убил Барона! У тебя что, ума не хватило не лезть к нему?
	YouKilledGur				=	"SVM_7_YouKilledGur"				;//Ты убил Гуру?! Этого не может быть. Я не верю!
	YouKilledMage				=	"SVM_7_YouKilledMage"				;//Ты убил мага! У тебя есть достойное оправдание?
	YouKilledOCfolk				=	"SVM_7_YouKilledOCfolk"				;//В Старом лагере убит человек. Ходят слухи, что ты в этом как-то замешан...
	YouKilledNCfolk				=	"SVM_7_YouKilledNCfolk"				;//В Новом лагере произошло убийство. Говорят, там без тебя не обошлось.
	YouKilledPSIfolk			=	"SVM_7_YouKilledPSIfolk"			;//Братство лишилось одного из своих последователей, и это твоих рук дело!
	GetThingsRight				=	"SVM_7_GetThingsRight"				;//Ты не сможешь уйти от ответственности!
	YouDefeatedMeWell			=	"SVM_7_YouDefeatedMeWell"			;//Ты уже показал, на что способен. Ты победил меня в честном бою, но теперь все позади!
	Smalltalk01					=	"SVM_7_Smalltalk01"					;// ...так ты говоришь...
	Smalltalk02					=	"SVM_7_Smalltalk02"					;// ...возможно...
	Smalltalk03					=	"SVM_7_Smalltalk03"					;// ...не самое лучшее решение...
	Smalltalk04					=	"SVM_7_Smalltalk04"					;// ...уж лучше я посмотрю со стороны...
	Smalltalk05					=	"SVM_7_Smalltalk05"					;// ...чужие проблемы не мое дело...
	Smalltalk06					=	"SVM_7_Smalltalk06"					;// ...уже тогда было ясно, что этим дело не кончится...
	Smalltalk07					=	"SVM_7_Smalltalk07"					;// ...только между нами, другим не нужно рассказывать...
	Smalltalk08					=	"SVM_7_Smalltalk08"					;// ...такое со мной больше не случится...
	Smalltalk09					=	"SVM_7_Smalltalk09"					;// ...интересно, а в этом что-то есть...
	Smalltalk10					=	"SVM_7_Smalltalk10"					;// ...нужно думать, прежде чем что-нибудь говорить...
	Smalltalk11					=	"SVM_7_Smalltalk11"					;// ...я не имею отношения к этому делу...
	Smalltalk12					=	"SVM_7_Smalltalk12"					;// ...нельзя верить всему, что слышишь...
	Smalltalk13					=	"SVM_7_Smalltalk13"					;// ...не хотел бы я, чтобы со мной поступили так же...
	Smalltalk14					=	"SVM_7_Smalltalk14"					;// ...все время одно и то же...
	Smalltalk15					=	"SVM_7_Smalltalk15"					;// ...глупость неизлечима, я давно это знал...
	Smalltalk16					=	"SVM_7_Smalltalk16"					;// ...раньше все было намного лучше, не то, что сейчас...
	Smalltalk17					=	"SVM_7_Smalltalk17"					;// ...и почему нельзя держать язык за зубами...
	Smalltalk18					=	"SVM_7_Smalltalk18"					;// ...больше не хочу слушать эту болтовню...
	Smalltalk19					=	"SVM_7_Smalltalk19"					;// ...здесь никому нельзя доверять, вокруг слишком много предателей, слишком...
	Smalltalk20					=	"SVM_7_Smalltalk20"					;// ...не думаю, что здесь хоть что-нибудь изменится...
	Smalltalk21					=	"SVM_7_Smalltalk21"					;// ...наверное, ты прав...
	Smalltalk22					=	"SVM_7_Smalltalk22"					;// ...надо выждать время. Спешка не доведет до добра...
	Smalltalk23					=	"SVM_7_Smalltalk23"					;// ...я думал, это уже давно решенный вопрос...
	Smalltalk24					=	"SVM_7_Smalltalk24"					;// ...это не слишком интересно, поговорим о чем-нибудь другом...
	Om							= 	"SVM_7_Om"							;//
};

//////////////////////////////////////////
instance SVM_8 (C_SVM)				// Elite-Garde. Ultra-cool. Pflichtbewusst, ernst, nьchtern! Klare Stimme
{
	StopMagic					=	"SVM_8_StopMagic"					;//Не смей при мне колдовать!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"				;//Прекрати колдовать, я сказал!
	WeaponDown					=	"SVM_8_WeaponDown"					;//Убери оружие!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"				;//Убери это или тебе будет плохо!
	WatchYourAim				=	"SVM_8_WatchYourAim"				;//Забери оружие, идиот!
	WatchYourAimAngry			=	"SVM_8_WatchYourAimAngry"			;//Ты еще смеешь целиться в меня?
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"				;//Смотри, куда целишься!
	LetsForgetOurLittleFight	=	"SVM_8_LetsForgetOurLittleFight"	;//Хорошо, забудем об этом.
	Strange						=	"SVM_8_Strange"						;//Выходи! Я же знаю, что ты слышишь меня!
	DieMonster					=	"SVM_8_DieMonster"					;//Проклятые твари!
	DieMortalEnemy				=	"SVM_8_DieMortalEnemy"				;//Приготовься к смерти. Ничего личного, поверь!
	NowWait						=	"SVM_8_NowWait"						;//Ты посмел напасть на меня, червяк! Ну, подожди...
	YouStillNotHaveEnough		=	"SVM_8_YouStillNotHaveEnough"		;//Тебе мало прошлого раза? Что, хочешь повторить?
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Не хочешь слушать, так я объясню по-другому!
	NowWaitIntruder				= 	"SVM_8_NowWaitIntruder"				;//И ты еще смеешь появляться здесь? Ну, подожди!
	IWillTeachYouRespectForForeignProperty	=	"SVM_8_IWillTeachYouRespectForForeignProperty"	;//За это я должен отрубить тебе руки!
	DirtyThief					=	"SVM_8_DirtyThief"					;//Тебе не стоило воровать у меня!
	YouAttackedMyCharge			=	"SVM_8_YouAttackedMyCharge"			;//Никто не смеет обижать моих людей безнаказанно!
	YouKilledOneOfUs			=	"SVM_8_YouKilledOneOfUs"			;//Ты совершил большую ошибку, убив одного из нас!
	Dead						=	"SVM_8_Dead"						;//
	Aargh_1						=	"SVM_8_Aargh_1"						;//
	Aargh_2						=	"SVM_8_Aargh_2"						;//
	Aargh_3						=	"SVM_8_Aargh_3"						;//
	Berzerk						=	"SVM_8_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_8_YoullBeSorryForThis"			;//Ты еще об этом пожалеешь!
	YesYes						=	"SVM_8_YesYes"						;//Тихо, тихо. Все в порядке!
	ShitWhatAMonster			=	"SVM_8_ShitWhatAMonster"			;//По-моему, к этой твари не стоит подходить слишком близко!
	Help						=	"SVM_8_Help"						;//Пора уходить отсюда!
	WeWillMeetAgain				=	"SVM_8_WeWillMeetAgain"				;//Мы еще встретимся!
	NeverTryThatAgain			=	"SVM_8_NeverTryThatAgain"			;//Еще одна такая выходка, и ты труп!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"				;//Какое хорошее оружие!
	ITookYourOre				=	"SVM_8_ITookYourOre"				;//О, кажется, ты еще не платил пошлину. Ну, теперь мы в расчете!
	ShitNoOre					=	"SVM_8_ShitNoOre"					;//Да разве у такого неудачника может быть руда?!
	HandsOff					=	"SVM_8_HandsOff"					;//Убери руки!
	GetOutOfHere				=	"SVM_8_GetOutOfHere"				;//Пошел вон!
	YouViolatedForbiddenTerritory=	"SVM_8_YouViolatedForbiddenTerritory";//Эй, что это ты здесь делаешь?
	YouWannaFoolMe				=	"SVM_8_YouWannaFoolMe"				;//Думаешь, ты один такой умный, да?
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"		;//Эй, ты! Что тебе здесь нужно?
	WhyAreYouInHere				=	"SVM_8_WhyYouAreInHere"				;//Убирайся или я позову на помощь!
	WhatDidYouInThere			=	"SVM_8_WhatDidYouInThere"			;//Что ты хочешь у меня найти?
	WiseMove					=	"SVM_8_WiseMove"					;//Ну, считай, что тебе повезло.
	Alarm						=	"SVM_8_Alarm"						;//Стража! Здесь вор!
	IntruderAlert				= 	"SVM_8_IntruderAlert"				;//Тревога! Здесь чужой!
	BehindYou					=	"SVM_8_BehindYou"					;//Будь осторожен!
	TheresAFight				=	"SVM_8_TheresAFight"				;//Ну-ка, кто это так дерется?!
	HeyHeyHey					=	"SVM_8_HeyHeyHey"					;//Бей сильнее!
	CheerFight					=	"SVM_8_CheerFight"					;//Да, так его, так!
	CheerFriend					=	"SVM_8_CheerFriend"					;//Хорошо! Давай еще!
	Ooh							=	"SVM_8_Ooh"							;//Да не стой как столб! Бей его!
	YeahWellDone				=	"SVM_8_YeahWellDone"				;//Да, врежь ему! Он еще жив!
	RunCoward					=	"SVM_8_RunCoward"					;//Только попробуй появиться здесь еще раз!
	HeDefeatedHim				=	"SVM_8_HeDefeatedHim"				;//Это не так интересно! 
	HeDeservedIt				=	"SVM_8_HeDeservedIt"				;//Это будет ему уроком!
	HeKilledHim					=	"SVM_8_HeKilledHim"					;//Зачем ты это сделал? Ты должен будешь ответить за свой поступок!
	ItWasAGoodFight				=	"SVM_8_ItWasAGoodFight"				;//Это был отличный бой!
	Awake						=	"SVM_8_Awake"						;//
	FriendlyGreetings			=	"SVM_8_FriendlyGreetings"			;//Привет!
	ALGreetings					=	"SVM_8_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_8_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_8_SectGreetings"				;//Пробудись!
	ThereHeIs					= 	"SVM_8_ThereHeIs"					;//Вон он.
	NoLearnNoPoints				= 	"SVM_8_NoLearnNoPoints"				;//Я не смогу учить тебя, пока у тебя недостаточно опыта.
	NoLearnOverMax				= 	"SVM_8_NoLearnOverMax"				;//Ты не сможешь изучить этот предмет лучше. Тебе стоит попробовать что-нибудь другое.
	NoLearnYouAlreadyKnow		=	"SVM_8_NoLearnYouAlreadyKnow"		;//Сначала ты должен изучить основы и только потом переходить к более сложным вещам.
	NoLearnYoureBetter			=	"SVM_8_NoLearnYoureBetter"			;//Теперь ты готов!
	HeyYou						=	"SVM_8_HeyYou"						;//Эй, ты!
	NotNow						=	"SVM_8_NotNow"						;//Сейчас не время.
	WhatDoYouWant				=	"SVM_8_WhatDoYouWant"				;//Тебе что-то нужно?
	ISaidWhatDoYouWant			=	"SVM_8_ISaidWhatDoYouWant"			;//Быть может, я могу помочь тебе?
	MakeWay						=	"SVM_8_MakeWay"						;//Я могу пройти?
	OutOfMyWay					=	"SVM_8_OutOfMyWay"					;//Уйди в сторону!
	YouDeafOrWhat				=	"SVM_8_YouDeafOrWhat"				;//Ты не слышал меня? Дай пройти!
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"		;//Ты хочешь со мной поссориться?
	LookAway					=	"SVM_8_LookAway"					;//Хм... Как хорошо вокруг! 
	OkayKeepIt					=	"SVM_8_OkayKeepIt"					;//Хорошо! Возьми себе!
	WhatsThat					=	"SVM_8_WhatsThat"					;//Эй! Что это было?
	ThatsMyWeapon				=	"SVM_8_ThatsMyWeapon"				;//Ты забрал мое оружие...
	GiveItToMe					=	"SVM_8_GiveItToMe"					;//Отдай его мне! Слышал?!
	YouCanKeeptheCrap			=	"SVM_8_YouCanKeeptheCrap"			;//Как хочешь, оставь себе. Мне оно все равно не нужно.
	TheyKilledMyFriend			=	"SVM_8_TheyKilledMyFriend"			;//Кто-то убил нашего человека. Пусть только этот наглец попробует появиться здесь...
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"		;//В чем дело?
	SuckerGotSome				=	"SVM_8_SuckerGotSome"				;//Ну, как? Понравилось? Тебя стоило проучить!
	SuckerDefeatedEBr			=	"SVM_8_SuckerDefeatedEBr"			;//Ты избил Барона. Ты же знаешь, что он будет мстить?
	SuckerDefeatedGur			=	"SVM_8_SuckerDefeatedGur"			;//Ты победил Гуру. Неплохо. Но только не пытайся сделать это еще раз.
	SuckerDefeatedMage			=	"SVM_8_SuckerDefeatedMage"			;//Ты победил мага... Наверное, ты очень храбрый, да?
	SuckerDefeatedNov_Guard		= 	"SVM_8_SuckerDefeatedNov_Guard"		;//Ты же знаешь, что все послушники находятся под моей защитой. И ты все равно пытаешься нападать на них?
	SuckerDefeatedVlk_Guard		= 	"SVM_8_SuckerDefeatedVlk_Guard"		;//Если будешь лезть к рудокопам, я лично прослежу, чтобы ты был наказан как следует!
	YouDefeatedMyComrade		=	"SVM_8_YouDefeatedMyComrade"		;//Не стоит тебе обижать моих друзей.
	YouDefeatedNOV_Guard		=	"SVM_8_YouDefeatedNOV_Guard"		;//Только попробуй обидеть одного из наших людей, и ты пожалеешь!
	YouDefeatedVLK_Guard		=	"SVM_8_YouDefeatedVLK_Guard"		;//Если будешь лезть к моим подопечным, можешь лишиться головы!
	YouStoleFromMe				=	"SVM_8_YouStoleFromMe"				;//И ты еще смеешь заявляться сюда, грязный вор?!
	YouStoleFromUs				=	"SVM_8_YouStoleFromUs"				;//У тебя есть вещи, которые принадлежат нам. Верни их назад!
	YouStoleFromEBr				=	"SVM_8_YouStoleFromEBr"				;//Вот это да! Ты обокрал Баронов! Они будут в ярости!
	YouStoleFromGur				=	"SVM_8_YouStoleFromGur"				;//Ты что-то украл у Гуру, да? Не стоило этого делать!
	StoleFromMage				=	"SVM_8_StoleFromMage"				;//Ты что-то украл у магов, правда? Ты же не станешь говорить, что это не так?
	YouKilledMyFriend			=	"SVM_8_YouKilledMyFriend"			;//Один из наших людей умер от твоей руки. Еще раз ошибешься, и мы найдем тебя!
	YouKilledEBr				=	"SVM_8_YouKilledEBr"				;//Ты убил Барона! Наверное, ты сошел с ума!
	YouKilledGur				=	"SVM_8_YouKilledGur"				;//Ты убил Гуру! Нет, я не могу в это поверить!
	YouKilledMage				=	"SVM_8_YouKilledMage"				;//Ты убил мага! Как ты можешь это объяснить?
	YouKilledOCfolk				=	"SVM_8_YouKilledOCfolk"				;//В Старом лагере убили человека. Кто-то из солдат думает, что это ты его убил...
	YouKilledNCfolk				=	"SVM_8_YouKilledNCfolk"				;//Убит человек из Нового лагеря. Некоторые думают, что ты связан с этим убийством!
	YouKilledPSIfolk			=	"SVM_8_YouKilledPSIfolk"			;//Один из приверженцев Братства был убит, и виноват в этом ты!
	GetThingsRight				=	"SVM_8_GetThingsRight"				;//Тебе нелегко будет исправить все, что ты сделал!
	YouDefeatedMeWell			=	"SVM_8_YouDefeatedMeWell"			;//Мне от тебя здорово досталось, но это был честный бой. А сейчас все кончено!
	Smalltalk01					=	"SVM_8_Smalltalk01"					;// ...если ты думаешь...
	Smalltalk02					=	"SVM_8_Smalltalk02"					;// ...возможно...
	Smalltalk03					=	"SVM_8_Smalltalk03"					;// ...не самое лучшее решение...
	Smalltalk04					=	"SVM_8_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_8_Smalltalk05"					;// ...чужие проблемы - не мое дело...
	Smalltalk06					=	"SVM_8_Smalltalk06"					;// ...уже тогда было ясно, что этим дело не кончится...
	Smalltalk07					=	"SVM_8_Smalltalk07"					;// ...только между нами, другим необязательно знать об этом.
	Smalltalk08					=	"SVM_8_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_8_Smalltalk09"					;// ...что-то не то в этой истории...
	Smalltalk10					=	"SVM_8_Smalltalk10"					;// ...нужно думать, прежде чем что-нибудь говорить...
	Smalltalk11					=	"SVM_8_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_8_Smalltalk12"					;// ...нельзя верить всему, что слышишь...
	Smalltalk13					=	"SVM_8_Smalltalk13"					;// ...не хотел бы я, чтобы со мной поступили так же...
	Smalltalk14					=	"SVM_8_Smalltalk14"					;// ...все время одно и то же...
	Smalltalk15					=	"SVM_8_Smalltalk15"					;// ...глупость неизлечима, я давно это знал...
	Smalltalk16					=	"SVM_8_Smalltalk16"					;// ...раньше все было намного лучше, не то, что сейчас...
	Smalltalk17					=	"SVM_8_Smalltalk17"					;// ...и почему нельзя держать язык за зубами...
	Smalltalk18					=	"SVM_8_Smalltalk18"					;// ...больше не хочу слушать эту болтовню...
	Smalltalk19					=	"SVM_8_Smalltalk19"					;// ...здесь никому нельзя доверять, вокруг слишком много предателей, слишком...
	Smalltalk20					=	"SVM_8_Smalltalk20"					;// ...не думаю, что здесь что-нибудь изменится...
	Smalltalk21					=	"SVM_8_Smalltalk21"					;// ...наверное, ты прав...
	Smalltalk22					=	"SVM_8_Smalltalk22"					;// ...держись. Лучше ни на что не натыкаться...
	Smalltalk23					=	"SVM_8_Smalltalk23"					;// ...я думал, это уже давно решенный вопрос...
	Smalltalk24					=	"SVM_8_Smalltalk24"					;// ...давай поговорим о чем-нибудь другом...
	Om							= 	"SVM_8_Om"							;//
};


instance SVM_9 (C_SVM)				// brummig		   gemьtlicher Hьne, Besonnen, Brummiger Bдr, Einfacher	Mensch
{
	StopMagic					=	"SVM_9_StopMagic"					;//Не вздумай использовать здесь магию!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"				;//Прекрати немедленно!
	WeaponDown					=	"SVM_9_WeaponDown"					;//Ты хочешь напасть на меня?
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"				;//Спрячь это, иначе пожалеешь!
	WatchYourAim				=	"SVM_9_WatchYourAim"				;//Смотри, куда целишься!
	WatchYourAimAngry			=	"SVM_9_WatchYourAimAngry"			;//Убери свое оружие!
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"				;//Эй! Осторожнее! 
	LetsForgetOurLittleFight	=	"SVM_9_LetsForgetOurLittleFight"	;//Может, стоит забыть об этом...
	Strange						=	"SVM_9_Strange"						;//Давай, покажись. Я знаю, ты меня слышишь!
	DieMonster					=	"SVM_9_DieMonster"					;//Эти твари действительно здоровые!
	DieMortalEnemy				=	"SVM_9_DieMortalEnemy"				;//Теперь тебе пришел конец!
	NowWait						=	"SVM_9_NowWait"						;//Ты еще меня узнаешь!
	YouStillNotHaveEnough		=	"SVM_9_YouStillNotHaveEnough"		;//Какой же ты упрямый баран!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Не хочешь слушать, тогда я объясню тебе иначе!
	NowWaitIntruder				= 	"SVM_9_NowWaitIntruder"				;//Вот ты и попался, зануда!
	IWillTeachYouRespectForForeignProperty	=	"SVM_9_IWillTeachYouRespectForForeignProperty"	;//Я тебя предупредил. Пальцем тронешь мои вещи, и у тебя будут проблемы!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Вор! Я прикончу тебя!
	YouAttackedMyCharge			=	"SVM_9_YouAttackedMyCharge"			;//Никто не имеет права трогать моих друзей!
	YouKilledOneOfUs			=	"SVM_9_YouKilledOneOfUs"			;//Я убью тебя, за то, что ты убил одного из моих людей!
	Dead						=	"SVM_9_Dead"						;//
	Aargh_1						=	"SVM_9_Aargh_1"						;//
	Aargh_2						=	"SVM_9_Aargh_2"						;//
	Aargh_3						=	"SVM_9_Aargh_3"						;//
	Berzerk						=	"SVM_9_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_9_YoullBeSorryForThis"			;//Ты уже труп, правда еще не знаешь об этом.
	YesYes						=	"SVM_9_YesYes"						;//Полегче. Все нормально!
	ShitWhatAMonster			=	"SVM_9_ShitWhatAMonster"			;//Черт, ну и тварь!
	Help						=	"SVM_9_Help"						;//Быстрее, уходим отсюда!
	WeWillMeetAgain				=	"SVM_9_WeWillMeetAgain"				;//Еще увидимся!
	NeverTryThatAgain			=	"SVM_9_NeverTryThatAgain"			;//В следующий раз ты будешь мертв!
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"				;//Это оружие теперь мое!
	ITookYourOre				=	"SVM_9_ITookYourOre"				;//Руда! Хоть что-то, и то хорошо!
	ShitNoOre					=	"SVM_9_ShitNoOre"					;//Даже руды нет!
	HandsOff					=	"SVM_9_HandsOff"					;//Эй, руки прочь!
	GetOutOfHere				=	"SVM_9_GetOutOfHere"				;//Пошел вон!
	YouViolatedForbiddenTerritory=	"SVM_9_YouViolatedForbiddenTerritory";//Что тебе надо, парень?
	YouWannaFoolMe				=	"SVM_9_YouWannaFoolMe"				;//Парень, ты что, пытаешься сделать из меня дурака?
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"		;//Эй, ты! Что ты здесь бродишь?
	WhyAreYouInHere				=	"SVM_9_WhyYouAreInHere"				;//Вали отсюда, или я позову стражу!
	WhatDidYouInThere			=	"SVM_9_WhatDidYouInThere"			;//Что тебе здесь надо?
	WiseMove					=	"SVM_9_WiseMove"					;//Умница!
	Alarm						=	"SVM_9_Alarm"						;//Стража! Сюда!
	IntruderAlert				= 	"SVM_9_IntruderAlert"				;//Тревога! Чужой!
	BehindYou					=	"SVM_9_BehindYou"					;//За тобой!
	TheresAFight				=	"SVM_9_TheresAFight"				;//А, ну...посмотрим, насколько они хороши...
	HeyHeyHey					=	"SVM_9_HeyHeyHey"					;//Получай!
	CheerFight					=	"SVM_9_CheerFight"					;//Давай, давай!
	CheerFriend					=	"SVM_9_CheerFriend"					;//Хорошо!
	Ooh							=	"SVM_9_Ooh"							;//О, теперь то, что надо!
	YeahWellDone				=	"SVM_9_YeahWellDone"				;//Отлично, парень!
	RunCoward					=	"SVM_9_RunCoward"					;//Больше не суй свой нос сюда!
	HeDefeatedHim				=	"SVM_9_HeDefeatedHim"				;//Исход боя уже и так понятен.
	HeDeservedIt				=	"SVM_9_HeDeservedIt"				;//Сам виноват!
	HeKilledHim					=	"SVM_9_HeKilledHim"					;//Незачем было все это. В следующий раз думай о последствиях.
	ItWasAGoodFight				=	"SVM_9_ItWasAGoodFight"				;//Отличный был бой!
	Awake						=	"SVM_9_Awake"						;//
	FriendlyGreetings			=	"SVM_9_FriendlyGreetings"			;//Здорово!
	ALGreetings					=	"SVM_9_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_9_MageGreetings"				;//Во имя магии!
	SectGreetings				=	"SVM_9_SectGreetings"				;//Пробудись!
	ThereHeIs					= 	"SVM_13_ThereHeIs"					;//Ты что, слепой? Вот же он!
	NoLearnNoPoints				= 	"SVM_9_NoLearnNoPoints"				;//Ты недостаточно опытен, чтобы я смог тебя учить.
	NoLearnOverMax				= 	"SVM_9_NoLearnOverMax"				;//Ты уже выучил все возможное. Лучше поучись чему-нибудь другому.
	NoLearnYouAlreadyKnow		=	"SVM_9_NoLearnYouAlreadyKnow"		;//Чтобы стать мастером, тебе нужно больше опыта.
	NoLearnYoureBetter			=	"SVM_9_NoLearnYoureBetter"			;//Теперь ты поумнее!
	HeyYou						=	"SVM_9_HeyYou"						;//Эй, ты! 
	NotNow						=	"SVM_9_NotNow"						;//Нет, не сейчас.
	WhatDoYouWant				=	"SVM_9_WhatDoYouWant"				;//Что тебе надо?
	ISaidWhatDoYouWant			=	"SVM_9_ISaidWhatDoYouWant"			;//Я могу помочь?
	MakeWay						=	"SVM_9_MakeWay"						;//Дай пройти!
	OutOfMyWay					=	"SVM_9_OutOfMyWay"					;//Отойди!
	YouDeafOrWhat				=	"SVM_9_YouDeafOrWhat"				;//Ну, давай, прочь с дороги!
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"		;//Опять нужны проблемы? Почему ты всегда выбираешь меня для этого?
	LookAway					=	"SVM_9_LookAway"					;//Да! Погода сегодня отличная!
	OkayKeepIt					=	"SVM_9_OkayKeepIt"					;//Ладно! Теперь это твое.
	WhatsThat					=	"SVM_9_WhatsThat"					;//Что это было?
	ThatsMyWeapon				=	"SVM_9_ThatsMyWeapon"				;//Считаю до трех, и ты возвращаешь мое оружие.
	GiveItToMe					=	"SVM_9_GiveItToMe"					;//Отдай мне! Немедленно!
	YouCanKeeptheCrap			=	"SVM_9_YouCanKeeptheCrap"			;//Мне это не нужно, можешь оставить себе.
	TheyKilledMyFriend			=	"SVM_9_TheyKilledMyFriend"			;//Один их наших убит! Как только я доберусь до этого подлеца...
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"		;//Что такое?
	SuckerGotSome				=	"SVM_9_SuckerGotSome"				;//Ну, что? Получил? Теперь будешь знать!
	SuckerDefeatedEBr			=	"SVM_9_SuckerDefeatedEBr"			;//Ударил Барона. Это его впечатлило!
	SuckerDefeatedGur			=	"SVM_9_SuckerDefeatedGur"			;//Победил Гуру! Да уж! Но лучше больше так не делать.
	SuckerDefeatedMage			=	"SVM_9_SuckerDefeatedMage"			;//Ты смельчак! Победить мага, это что-то...
	SuckerDefeatedNov_Guard		= 	"SVM_9_SuckerDefeatedNov_Guard"		;//Драка с новичком - для идиотов!
	SuckerDefeatedVlk_Guard		= 	"SVM_9_SuckerDefeatedVlk_Guard"		;//О чем ты думал, когда бил рудокопов?
	YouDefeatedMyComrade		=	"SVM_9_YouDefeatedMyComrade"		;//Какого черта, ты ударил моего приятеля?
	YouDefeatedNOV_Guard		=	"SVM_9_YouDefeatedNOV_Guard"		;//Обидишь новенького еще раз, и ты сильно пожалеешь!
	YouDefeatedVLK_Guard		=	"SVM_9_YouDefeatedVLK_Guard"		;//Никто не может трогать тех, кого я защищаю, даже такой храбрец как ты.
	YouStoleFromMe				=	"SVM_9_YouStoleFromMe"				;//Грязный вор, и ты осмелился появиться здесь?
	YouStoleFromUs				=	"SVM_9_YouStoleFromUs"				;//Не благородное дело это - воровать у нашего народа! Ты пожалеешь об этом!
	YouStoleFromEBr				=	"SVM_9_YouStoleFromEBr"				;//Парень! Ты обобрал Баронов! Они это так не оставят!
	YouStoleFromGur				=	"SVM_9_YouStoleFromGur"				;//Ты обокрал Гуру, не так ли?
	StoleFromMage				=	"SVM_9_StoleFromMage"				;//Из-за тебя маги не досчитаются своих вещей, не так ли?
	YouKilledMyFriend			=	"SVM_9_YouKilledMyFriend"			;//На твоей совести смерть одного из наших. Выкинешь еще что-то подобное, и наступит твой черед!
	YouKilledEBr				=	"SVM_9_YouKilledEBr"				;//Парень, ты что псих?! Подумать только, убил Барона!
	YouKilledGur				=	"SVM_9_YouKilledGur"				;//Не могу поверить, у тебя хватило ума убить Гуру!
	YouKilledMage				=	"SVM_9_YouKilledMage"				;//Убил мага! Какое этому может быть оправдание, а?
	YouKilledOCfolk				=	"SVM_9_YouKilledOCfolk"				;//Один парень из Старого лагеря мертв, и, кажется, ты в этом замешан...
	YouKilledNCfolk				=	"SVM_9_YouKilledNCfolk"				;//В Новом лагере одного постигла смерть, и, похоже, от твоей руки!
	YouKilledPSIfolk			=	"SVM_9_YouKilledPSIfolk"			;//В Братстве стало на одного верующего меньше, и эта жизнь на твоей совести!
	GetThingsRight				=	"SVM_9_GetThingsRight"				;//Не легко тебе будет оправдаться!
	YouDefeatedMeWell			=	"SVM_9_YouDefeatedMeWell"			;//Хороший бой! Учеба пошла тебе на пользу.
	Smalltalk01					=	"SVM_9_Smalltalk01"					;// ...да, если ты так думаешь...
	Smalltalk02					=	"SVM_9_Smalltalk02"					;// ...может...
	Smalltalk03					=	"SVM_9_Smalltalk03"					;// ...это было не слишком разумно...
	Smalltalk04					=	"SVM_9_Smalltalk04"					;// лучше я не буду в это вмешиваться...
	Smalltalk05					=	"SVM_9_Smalltalk05"					;// ...это не моя проблема...
	Smalltalk06					=	"SVM_9_Smalltalk06"					;// ...кажется, скоро появится проблема...
	Smalltalk07					=	"SVM_9_Smalltalk07"					;// ...держи язык за зубами, остальным незачем знать об этом.
	Smalltalk08					=	"SVM_9_Smalltalk08"					;// ...больше такое не случится...
	Smalltalk09					=	"SVM_9_Smalltalk09"					;// ...что-то не то в этой истории...
	Smalltalk10					=	"SVM_9_Smalltalk10"					;// ...контролируй, что говоришь людям...
	Smalltalk11					=	"SVM_9_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_9_Smalltalk12"					;// ...не стоит верить всему...
	Smalltalk13					=	"SVM_9_Smalltalk13"					;// ...не хотел бы я оказаться в его шкуре...
	Smalltalk14					=	"SVM_9_Smalltalk14"					;// ...каждый раз одно и тоже...
	Smalltalk15					=	"SVM_9_Smalltalk15"					;// ...некоторые люди никогда не учатся...
	Smalltalk16					=	"SVM_9_Smalltalk16"					;// ...было время - все было по-другому...
	Smalltalk17					=	"SVM_9_Smalltalk17"					;// ...людям свойственно болтать...
	Smalltalk18					=	"SVM_9_Smalltalk18"					;// ...больше я не слушаю эту болтовню...
	Smalltalk19					=	"SVM_9_Smalltalk19"					;// ...вечно так, поверишь кому-нибудь, а он тебя в неприятности втянет...
	Smalltalk20					=	"SVM_9_Smalltalk20"					;// ...не думаю, что это изменится когда-нибудь...
	Smalltalk21					=	"SVM_9_Smalltalk21"					;// ..да, похоже, ты прав....
	Smalltalk22					=	"SVM_9_Smalltalk22"					;// ...держись. Лучше ни на что не натыкаться...
	Smalltalk23					=	"SVM_9_Smalltalk23"					;// ..я полагал, это выяснили еще сто лет назад...
	Smalltalk24					=	"SVM_9_Smalltalk24"					;// ...давай лучше о другом поговорим...
	Om							= 	"SVM_9_Om"							;//
};



instance SVM_10	(C_SVM)				// Schlau, verschlagen,	heimlich, Zwielichtig, zynisch,	intrigant Dealer (RAVEN, KALOM)
{
	StopMagic					=	"SVM_10_StopMagic"						;//Перестань колдовать!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"					;//Прекрати немедленно!
	WeaponDown					=	"SVM_10_WeaponDown"						;//Убери оружие!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"				;//Что это значит? Получить захотел?
	WatchYourAim				=	"SVM_10_WatchYourAim"					;//Убери это, или я сделаю это за тебя?
	WatchYourAimAngry			=	"SVM_10_WatchYourAimAngry"				;//Хочешь проблем на свою голову? Сейчас они у тебя будут!
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"				;//Эй! Осторожно! Еще раз, и ты получишь!
	LetsForgetOurLittleFight	=	"SVM_10_LetsForgetOurLittleFight"		;//Эй! Давай забудем о нашей ссоре, хорошо?
	Strange						=	"SVM_10_Strange"						;//Эй, где ты? Выходи!
	DieMonster					=	"SVM_10_DieMonster"						;//Отвратительные твари!
	DieMortalEnemy				=	"SVM_10_DieMortalEnemy"					;//Теперь тебе конец!
	NowWait						=	"SVM_10_NowWait"						;//Сейчас ты за все заплатишь!
	YouStillNotHaveEnough		=	"SVM_10_YouStillNotHaveEnough"			;//Ты так и хочешь получить по голове!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"					;//Ты сам захотел!
	NowWaitIntruder				= 	"SVM_10_NowWaitIntruder"				;//Сейчас я сделаю из тебя котлету!
	IWillTeachYouRespectForForeignProperty	=	"SVM_10_IWillTeachYouRespectForForeignProperty"	;//Я тебя предупреждал. Не стоит трогать мои вещи!
	DirtyThief					=	"SVM_10_DirtyThief"						;//Вор! Сейчас я тебя прикончу!
	YouAttackedMyCharge			=	"SVM_10_YouAttackedMyCharge"			;//Никто не смеет обижать моих друзей!
	YouKilledOneOfUs			=	"SVM_10_YouKilledOneOfUs"				;//Ты убил одного из моих людей. Теперь твоя очередь!
	Dead						=	"SVM_10_Dead"							;//
	Aargh_1						=	"SVM_10_Aargh_1"						;//
	Aargh_2						=	"SVM_10_Aargh_2"						;//
	Aargh_3						=	"SVM_10_Aargh_3"						;//
	Berzerk						=	"SVM_10_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_10_YoullBeSorryForThis"			;//Сейчас ты за все заплатишь!
	YesYes						=	"SVM_10_YesYes"							;//Ладно, не волнуйся! Ты победил!
	ShitWhatAMonster			=	"SVM_10_ShitWhatAMonster"				;//Вот это зверюга! Бежим!
	Help						=	"SVM_10_Help"							;//Отступаем!
	WeWillMeetAgain				=	"SVM_10_WeWillMeetAgain"				;//Этого я тебе не спущу!
	NeverTryThatAgain			=	"SVM_10_NeverTryThatAgain"				;//Еще раз, и ты точно получишь!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"				;//Теперь это будет мое оружие!
	ITookYourOre				=	"SVM_10_ITookYourOre"					;//Ну, я возьму у тебя немного руды?
	ShitNoOre					=	"SVM_10_ShitNoOre"						;//Ни куска руды!
	HandsOff					=	"SVM_10_HandsOff"						;//Эй! Убери руки!
	GetOutOfHere				=	"SVM_10_GetOutOfHere"					;//Пошел вон!
	YouViolatedForbiddenTerritory=	"SVM_10_YouViolatedForbiddenTerritory"	;//Эй! А ты откуда здесь взялся?
	YouWannaFoolMe				=	"SVM_10_YouWannaFoolMe"					;//Думаешь, я совсем ничего не соображаю?!
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"			;//Эй, ты! Что ты здесь делаешь?
	WhyAreYouInHere				=	"SVM_10_WhyYouAreInHere"				;//Уйди отсюда, или я позову стражу!
	WhatDidYouInThere			=	"SVM_10_WhatDidYouInThere"				;//Что это ты здесь забыл?
	WiseMove					=	"SVM_10_WiseMove"						;//Тебе повезло.
	Alarm						=	"SVM_10_Alarm"							;//Стража! Сюда!
	IntruderAlert				= 	"SVM_10_IntruderAlert"					;//Тревога! Чужой!
	BehindYou					=	"SVM_10_BehindYou"						;//Осторожно!
	TheresAFight				=	"SVM_10_TheresAFight"					;//А, драка!
	HeyHeyHey					=	"SVM_10_HeyHeyHey"						;//Бей сильнее!
	CheerFight					=	"SVM_10_CheerFight"						;//Никакой пощады!
	CheerFriend					=	"SVM_10_CheerFriend"					;//Прикончи его!
	Ooh							=	"SVM_10_Ooh"							;//Давай, защищайся!
	YeahWellDone				=	"SVM_10_YeahWellDone"					;//Врежь ему как следует!
	RunCoward					=	"SVM_10_RunCoward"						;//Вернись, трус!
	HeDefeatedHim				=	"SVM_10_HeDefeatedHim"					;//Да его же пальцем тронь, и он рассыплется!
	HeDeservedIt				=	"SVM_10_HeDeservedIt"					;//Он это заслужил!
	HeKilledHim					=	"SVM_10_HeKilledHim"					;//Ходишь тут и людей убиваешь! Сейчас мы тебе покажем!
	ItWasAGoodFight				=	"SVM_10_ItWasAGoodFight"				;//Так ему и надо!
	Awake						=	"SVM_10_Awake"							;//
	FriendlyGreetings			=	"SVM_10_FriendlyGreetings"				;//Привет!
	ALGreetings					=	"SVM_10_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_10_MageGreetings"					;//Во имя магии!
	SectGreetings				=	"SVM_10_SectGreetings"					;//Пробудись!
	ThereHeIs					= 	"SVM_10_ThereHeIs"						;//Да вон он.
	NoLearnNoPoints				= 	"SVM_10_NoLearnNoPoints"				;//Сейчас ты не сможешь ничему научиться. Тебе нужен опыт.
	NoLearnOverMax				= 	"SVM_10_NoLearnOverMax"					;//Ты не сможешь это выучить. Попробуй что-нибудь другое.
	NoLearnYouAlreadyKnow		=	"SVM_10_NoLearnYouAlreadyKnow"			;//Сначала тебе нужно освоить основы, и только потом ты сможешь достичь мастерства.
	NoLearnYoureBetter			=	"SVM_10_NoLearnYoureBetter"				;//Да, так гораздо лучше!
	HeyYou						=	"SVM_10_HeyYou"							;//Эй, ты!
	NotNow						=	"SVM_10_NotNow"							;//У меня нет времени.
	WhatDoYouWant				=	"SVM_10_WhatDoYouWant"					;//Тебе что-то нужно?
	ISaidWhatDoYouWant			=	"SVM_10_ISaidWhatDoYouWant"				;//Я могу тебе помочь?
	MakeWay						=	"SVM_10_MakeWay"						;//Пропусти меня!
	OutOfMyWay					=	"SVM_10_OutOfMyWay"						;//Прочь с дороги!
	YouDeafOrWhat				=	"SVM_10_YouDeafOrWhat"					;//Ты хочешь, чтобы я применил силу? Уйди отсюда!
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"			;//Снова ищешь ссоры?
	LookAway					=	"SVM_10_LookAway"						;//А, не обращай на меня внимания...
	OkayKeepIt					=	"SVM_10_OkayKeepIt"						;//Просто оставь себе!
	WhatsThat					=	"SVM_10_WhatsThat"						;//Что это было?
	ThatsMyWeapon				=	"SVM_10_ThatsMyWeapon"					;//Отдай мое оружие!
	GiveItToMe					=	"SVM_10_GiveItToMe"						;//Дай его мне!
	YouCanKeeptheCrap			=	"SVM_10_YouCanKeeptheCrap"				;//Да, ладно, возьми. Мне оно все равно не нужно.
	TheyKilledMyFriend			=	"SVM_10_TheyKilledMyFriend"				;//Один из наших людей убит. Мне это так не нравится!
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"			;//Зачем ты меня разбудил?
	SuckerGotSome				=	"SVM_10_SuckerGotSome"					;//Ну? Получил? Так тебе и надо!
	SuckerDefeatedEBr			=	"SVM_10_SuckerDefeatedEBr"				;//Ты побил Барона!
	SuckerDefeatedGur			=	"SVM_10_SuckerDefeatedGur"				;//Ты победил одного и Гуру.
	SuckerDefeatedMage			=	"SVM_10_SuckerDefeatedMage"				;//Да, победить мага...
	SuckerDefeatedNov_Guard		= 	"SVM_10_SuckerDefeatedNov_Guard"		;//Если тронешь послушника хоть пальцем, будешь иметь дело со мной!
	SuckerDefeatedVlk_Guard		= 	"SVM_10_SuckerDefeatedVlk_Guard"		;//Я здесь слежу за порядком. Оставь моих людей в покое!
	YouDefeatedMyComrade		=	"SVM_10_YouDefeatedMyComrade"			;//Ты ударил одного из моих друзей!  
	YouDefeatedNOV_Guard		=	"SVM_10_YouDefeatedNOV_Guard"			;//Только попробуй ударить кого-нибудь. Тебе это даром не пройдет!
	YouDefeatedVLK_Guard		=	"SVM_10_YouDefeatedVLK_Guard"			;//Не трогай моих подопечных. Это может тебе дорого стоить!
	YouStoleFromMe				=	"SVM_10_YouStoleFromMe"					;//Не вздумай появиться здесь еще раз, вор!
	YouStoleFromUs				=	"SVM_10_YouStoleFromUs"					;//Ты взял то, что принадлежит нам. Верни это, пока цел.
	YouStoleFromEBr				=	"SVM_10_YouStoleFromEBr"				;//Ты обокрал Баронов! Они это так не оставят!
	YouStoleFromGur				=	"SVM_10_YouStoleFromGur"				;//Ты кое-что украл у Гуру! Жаль, но они уже все знают!
	StoleFromMage				=	"SVM_10_StoleFromMage"					;//Так ты украл у магов что-то ценное, да?
	YouKilledMyFriend			=	"SVM_10_YouKilledMyFriend"				;//Ты убил одного из наших людей. Еще одна ошибка, и мы поступим с тобой так же.
	YouKilledEBr				=	"SVM_10_YouKilledEBr"					;//Ты убил Барона! Чем ты думал?
	YouKilledGur				=	"SVM_10_YouKilledGur"					;//Ты убил одного из Гуру! Скажи еще, что это неправда!
	YouKilledMage				=	"SVM_10_YouKilledMage"					;//Ты убил мага! Как ты можешь это объяснить?
	YouKilledOCfolk				=	"SVM_10_YouKilledOCfolk"				;//В Старом лагере убит человек, и говорят, что его убил именно ты...
	YouKilledNCfolk				=	"SVM_10_YouKilledNCfolk"				;//В Новом лагере кого-то убили. Кажется, ты в этом замешан...
	YouKilledPSIfolk			=	"SVM_10_YouKilledPSIfolk"				;//Братство потеряло одного из своих последователей, и его смерть на твоей совести!
	GetThingsRight				=	"SVM_10_GetThingsRight"					;//Ты не сможешь оправдаться!
	YouDefeatedMeWell			=	"SVM_10_YouDefeatedMeWell"				;//Поздравляю! Это была чистая победа!
	Smalltalk01					=	"SVM_10_Smalltalk01"					;// ...так ты говоришь...
	Smalltalk02					=	"SVM_10_Smalltalk02"					;// ...возможно...
	Smalltalk03					=	"SVM_10_Smalltalk03"					;// ...не самое лучшее решение...
	Smalltalk04					=	"SVM_10_Smalltalk04"					;// ...уж лучше я посмотрю со стороны...
	Smalltalk05					=	"SVM_10_Smalltalk05"					;// ...чужие проблемы не мое дело...
	Smalltalk06					=	"SVM_10_Smalltalk06"					;// ...уже тогда было ясно, что этим дело не кончится...
	Smalltalk07					=	"SVM_10_Smalltalk07"					;// ...только между нами, другим не нужно рассказывать...
	Smalltalk08					=	"SVM_10_Smalltalk08"					;// ...такое со мной больше не случится...
	Smalltalk09					=	"SVM_10_Smalltalk09"					;// ...интересно, а в этом что-то есть...
	Smalltalk10					=	"SVM_10_Smalltalk10"					;// ...нужно думать, прежде чем что-нибудь говорить...
	Smalltalk11					=	"SVM_10_Smalltalk11"					;// ...я не имею отношения к этому делу...
	Smalltalk12					=	"SVM_10_Smalltalk12"					;// ...нельзя верить всему, что слышишь...
	Smalltalk13					=	"SVM_10_Smalltalk13"					;// ...не хотел бы я, чтобы со мной поступили так же...
	Smalltalk14					=	"SVM_10_Smalltalk14"					;// ...все время одно и то же...
	Smalltalk15					=	"SVM_10_Smalltalk15"					;// ...глупость неизлечима, я давно это знал...
	Smalltalk16					=	"SVM_10_Smalltalk16"					;// ...раньше все было намного лучше, не то, что сейчас...
	Smalltalk17					=	"SVM_10_Smalltalk17"					;// ...и почему нельзя держать язык за зубами...
	Smalltalk18					=	"SVM_10_Smalltalk18"					;// ...больше не хочу слушать эту болтовню...
	Smalltalk19					=	"SVM_10_Smalltalk19"					;// ...здесь никому нельзя доверять, вокруг слишком много предателей...
	Smalltalk20					=	"SVM_10_Smalltalk20"					;// ...не думаю, что здесь хоть что-нибудь изменится...
	Smalltalk21					=	"SVM_10_Smalltalk21"					;// ...наверное, ты прав...
	Smalltalk22					=	"SVM_10_Smalltalk22"					;// ...надо выждать время. Спешка не доведет до добра...
	Smalltalk23					=	"SVM_10_Smalltalk23"					;// ...я думал, это уже давно решенный вопрос...
	Smalltalk24					=	"SVM_10_Smalltalk24"					;// ...это не слишком интересно, поговорим о чем-нибудь другом...
	Om							= 	"SVM_10_Om"							;//
};



//////////////////////////////////////////
instance SVM_11	(C_SVM)				//Profi				Ruhig, abgezockt, Vernьnftig aberknallhart
{
	StopMagic					=	"SVM_11_StopMagic"						;//Не смей здесь колдовать!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"					;//Я же сказал: перестань колдовать!
	WeaponDown					=	"SVM_11_WeaponDown"						;//Если хочешь поссориться со мной, подойди ко мне!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Убери это, или я проучу тебя!
	WatchYourAim				=	"SVM_11_WatchYourAim"					;//Убери оружие!
	WatchYourAimAngry			=	"SVM_11_WatchYourAimAngry"				;//Так ты хочешь поссориться со мной? Да?
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//Что ты делаешь? Прекрати!
	LetsForgetOurLittleFight	=	"SVM_11_LetsForgetOurLittleFight"		;//Ладно, забудем об этой ссоре.
	Strange						=	"SVM_11_Strange"						;//Черт! Куда он подевался?
	DieMonster					=	"SVM_11_DieMonster"						;//Я убью их, если они будут мешать мне!
	DieMortalEnemy				=	"SVM_11_DieMortalEnemy"					;//Прежде чем заводить врагов, убедись, что сможешь с ними справиться. Умри.
	NowWait						=	"SVM_11_NowWait"						;//Ты не должен был этого делать!
	YouStillNotHaveEnough		=	"SVM_11_YouStillNotHaveEnough"			;//Тебе мало прошлого раза? Что, хочешь повторить?
	YouAskedForIt				=	"SVM_11_YouAskedForIt"					;//Не хочешь слушать, так я скажу это тебе по-другому!
	NowWaitIntruder				= 	"SVM_11_NowWaitIntruder"				;//Эй, чужак! Сейчас мы тебя научим, как себя вести!
	IWillTeachYouRespectForForeignProperty	=	"SVM_11_IWillTeachYouRespectForForeignProperty"	;//Ты заплатишь за это. 
	DirtyThief					=	"SVM_11_DirtyThief"						;//Не стоило у меня воровать!
	YouAttackedMyCharge			=	"SVM_11_YouAttackedMyCharge"			;//Ты хочешь мне все испортить? За это я должен тебя проучить!
	YouKilledOneOfUs			=	"SVM_11_YouKilledOneOfUs"				;//Ты убил нашего человека, это твоя последняя ошибка!
	Dead						=	"SVM_11_Dead"							;//
	Aargh_1						=	"SVM_11_Aargh_1"						;//
	Aargh_2						=	"SVM_11_Aargh_2"						;//
	Aargh_3						=	"SVM_11_Aargh_3"						;//
	Berzerk						=	"SVM_11_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_11_YoullBeSorryForThis"			;//Лучше бы ты этого не делал!
	YesYes						=	"SVM_11_YesYes"							;//Все в порядке! Ты же победил!
	ShitWhatAMonster			=	"SVM_11_ShitWhatAMonster"				;//Какой же он огромный!
	Help						=	"SVM_11_Help"							;//Отступаем!
	WeWillMeetAgain				=	"SVM_11_WeWillMeetAgain"				;//Ты еще пожалеешь об этом, приятель!
	NeverTryThatAgain			=	"SVM_11_NeverTryThatAgain"				;//В следующий раз тебе не уйти!
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Лучше я оставлю это оружие себе!
	ITookYourOre				=	"SVM_11_ITookYourOre"					;//Как хорошо, что ты поделился со мной этой рудой!
	ShitNoOre					=	"SVM_11_ShitNoOre"						;//Надо же! У тебя нет руды!
	HandsOff					=	"SVM_11_HandsOff"						;//Убери свои руки!
	GetOutOfHere				=	"SVM_11_GetOutOfHere"					;//Убирайся, или я вышвырну тебя отсюда!
	YouViolatedForbiddenTerritory=	"SVM_11_YouViolatedForbiddenTerritory"	;//Эй, а ты как сюда попал?
	YouWannaFoolMe				=	"SVM_11_YouWannaFoolMe"					;//Не шути со мной!
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"			;//А что это еще может значить?
	WhyAreYouInHere				=	"SVM_11_WhyYouAreInHere"				;//Это мой дом. Вон, или я стражу позову!
	WhatDidYouInThere			=	"SVM_11_WhatDidYouInThere"				;//Что это тебе здесь нужно? Убирайся, пока я не убрал тебя сам!
	WiseMove					=	"SVM_11_WiseMove"						;//Хорош! Больше так не делай!
	Alarm						=	"SVM_11_Alarm"							;//Стража! Сюда!
	IntruderAlert				= 	"SVM_11_IntruderAlert"					;//Тревога! Чужой!
	BehindYou					=	"SVM_11_BehindYou"						;//Осторожно!
	TheresAFight				=	"SVM_11_TheresAFight"					;//Посмотрим, кто сейчас победит!
	HeyHeyHey					=	"SVM_11_HeyHeyHey"						;//Давай, бей!
	CheerFight					=	"SVM_11_CheerFight"						;//Перестань с ним играть!
	CheerFriend					=	"SVM_11_CheerFriend"					;//Давай же, ты сможешь его победить!
	Ooh							=	"SVM_11_Ooh"							;//О! Не хорошо!
	YeahWellDone				=	"SVM_11_YeahWellDone"					;//Неплохой удар!
	RunCoward					=	"SVM_11_RunCoward"						;//Больше здесь не появляйся!
	HeDefeatedHim				=	"SVM_11_HeDefeatedHim"					;//Ух, какой удар!
	HeDeservedIt				=	"SVM_11_HeDeservedIt"					;//Не важно! Так ему и надо!
	HeKilledHim					=	"SVM_11_HeKilledHim"					;//Ты убил его! Теперь у тебя будут проблемы!
	ItWasAGoodFight				=	"SVM_11_ItWasAGoodFight"				;//Хорошо! Отличная была битва!
	Awake						=	"SVM_11_Awake"							;//
	FriendlyGreetings			=	"SVM_11_FriendlyGreetings"				;//Привет!
	ALGreetings					=	"SVM_11_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_11_MageGreetings"					;//Во имя магии!
	SectGreetings				=	"SVM_11_SectGreetings"					;//Пробудись!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Bist du blind? Da vorne! //*** 11er war falsch betont!***
	NoLearnNoPoints				= 	"SVM_11_NoLearnNoPoints"				;//Я не могу учить тебя. Ты еще недостаточно опытен.
	NoLearnOverMax				= 	"SVM_11_NoLearnOverMax"					;//Ты не сможешь этому больше научиться. Тебе нужно выучить что-нибудь другое.
	NoLearnYouAlreadyKnow		=	"SVM_11_NoLearnYouAlreadyKnow"			;//Сначала ты должен выучить основы, и только потом осваивать мастерство.
	NoLearnYoureBetter			=	"SVM_11_NoLearnYoureBetter"				;//Ты уже знаешь больше!
	HeyYou						=	"SVM_11_HeyYou"							;//Эй, ты!
	NotNow						=	"SVM_11_NotNow"							;//Не сейчас.
	WhatDoYouWant				=	"SVM_11_WhatDoYouWant"					;//Тебе что-нибудь нужно?
	ISaidWhatDoYouWant			=	"SVM_11_ISaidWhatDoYouWant"				;//Скажи, что ты хочешь?
	MakeWay						=	"SVM_11_MakeWay"						;//Можно пройти?
	OutOfMyWay					=	"SVM_11_OutOfMyWay"						;//Уйди с дороги!
	YouDeafOrWhat				=	"SVM_11_YouDeafOrWhat"					;//Ты хочешь, чтобы я лично занялся тобой? Убирайся!
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"			;//Ты все еще хочешь потягаться со мной?
	LookAway					=	"SVM_11_LookAway"						;//Я не хочу ни во что вмешиваться!
	OkayKeepIt					=	"SVM_11_OkayKeepIt"						;//Хорошо! Это твое.
	WhatsThat					=	"SVM_11_WhatsThat"						;//Что это было?
	ThatsMyWeapon				=	"SVM_11_ThatsMyWeapon"					;//Ты носишь мое оружие?..
	GiveItToMe					=	"SVM_11_GiveItToMe"						;//Давай, дай его сюда!
	YouCanKeeptheCrap			=	"SVM_11_YouCanKeeptheCrap"				;//Ну, как хочешь. Оставь себе. Мне оно все равно не нужно.
	TheyKilledMyFriend			=	"SVM_11_TheyKilledMyFriend"				;//Убит наш человек! Как только его убийца попадется мне, я его...
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"			;//Что случилось?
	SuckerGotSome				=	"SVM_11_SuckerGotSome"					;//Что, получил? Будешь знать!
	SuckerDefeatedEBr			=	"SVM_11_SuckerDefeatedEBr"				;//Ты победил одного из Баронов. Смело, но глупо. Очень глупо на самом деле.
	SuckerDefeatedGur			=	"SVM_11_SuckerDefeatedGur"				;//Ты победил одного из Гуру.
	SuckerDefeatedMage			=	"SVM_11_SuckerDefeatedMage"				;//Победить мага... не самое лучшее решение!
	SuckerDefeatedNov_Guard		= 	"SVM_11_SuckerDefeatedNov_Guard"		;//Эти люди под моей защитой. Ты ударил одного из них...
	SuckerDefeatedVlk_Guard		= 	"SVM_11_SuckerDefeatedVlk_Guard"		;//Не лезь к рудокопам, иначе тебе попадет!
	YouDefeatedMyComrade		=	"SVM_11_YouDefeatedMyComrade"			;//Враг моих друзей - мой враг.
	YouDefeatedNOV_Guard		=	"SVM_11_YouDefeatedNOV_Guard"			;//Еще раз обидишь моих людей, и ты пожалеешь!
	YouDefeatedVLK_Guard		=	"SVM_11_YouDefeatedVLK_Guard"			;//Поднимаешь руку на моих подопечных? Это может стоить тебе головы.
	YouStoleFromMe				=	"SVM_11_YouStoleFromMe"					;//И ты еще смеешь появляться мне на глаза, грязный вор?
	YouStoleFromUs				=	"SVM_11_YouStoleFromUs"					;//У тебя есть вещи, которые принадлежали нам. Лучше тебе их отдать.
	YouStoleFromEBr				=	"SVM_11_YouStoleFromEBr"				;//Ты же обокрал Баронов! Да, они такого не забывают!
	YouStoleFromGur				=	"SVM_11_YouStoleFromGur"				;//Ты обокрал Гуру! Это правда, да?
	StoleFromMage				=	"SVM_11_StoleFromMage"					;//У тебя хватило смелости обокрасть магов?
	YouKilledMyFriend			=	"SVM_11_YouKilledMyFriend"				;//Наше первое правило: не убивать. Ты его нарушил!
	YouKilledEBr				=	"SVM_11_YouKilledEBr"					;//Ты убил Барона! Да ты совсем с ума сошел!
	YouKilledGur				=	"SVM_11_YouKilledGur"					;//Ты убил Гуру! Это не может быть правдой!
	YouKilledMage				=	"SVM_11_YouKilledMage"					;//Ты убил мага! Как ты это можешь объяснить?
	YouKilledOCfolk				=	"SVM_11_YouKilledOCfolk"				;//В Старом лагере кто-то убит. Говорят, что ты в этом замешан...
	YouKilledNCfolk				=	"SVM_11_YouKilledNCfolk"				;//В Новом лагере убили человека. Кажется, ты приложил руку к этому убийству!
	YouKilledPSIfolk			=	"SVM_11_YouKilledPSIfolk"				;//Убит один из приверженцев Братства. Его жизнь на твоей совести!
	GetThingsRight				=	"SVM_11_GetThingsRight"					;//Ты не сможешь оправдать свой поступок!
	YouDefeatedMeWell			=	"SVM_11_YouDefeatedMeWell"				;//Мы честно сражались. Я еще долго буду вспоминать об этом поединке. Но сейчас все позади!
	Smalltalk01					=	"SVM_11_Smalltalk01"					;// ...так ты говоришь...
	Smalltalk02					=	"SVM_11_Smalltalk02"					;// ...возможно...
	Smalltalk03					=	"SVM_11_Smalltalk03"					;// ...не самое лучшее решение...
	Smalltalk04					=	"SVM_11_Smalltalk04"					;// ...уж лучше я посмотрю со стороны...
	Smalltalk05					=	"SVM_11_Smalltalk05"					;// ...чужие проблемы - не мое дело...
	Smalltalk06					=	"SVM_11_Smalltalk06"					;// ...уже тогда было ясно, что этим дело не кончится...
	Smalltalk07					=	"SVM_11_Smalltalk07"					;// ...только между нами, другим не нужно рассказывать...
	Smalltalk08					=	"SVM_11_Smalltalk08"					;// ...такое со мной больше не случится...
	Smalltalk09					=	"SVM_11_Smalltalk09"					;// ...интересно, а в этом что-то есть...
	Smalltalk10					=	"SVM_11_Smalltalk10"					;// ...нужно думать, прежде чем что-нибудь говорить...
	Smalltalk11					=	"SVM_11_Smalltalk11"					;// ...я не имею отношения к этому делу...
	Smalltalk12					=	"SVM_11_Smalltalk12"					;// ...нельзя верить всему, что слышишь...
	Smalltalk13					=	"SVM_11_Smalltalk13"					;// ...не хотел бы я, чтобы со мной поступили так же...
	Smalltalk14					=	"SVM_11_Smalltalk14"					;// ...все время одно и то же...
	Smalltalk15					=	"SVM_11_Smalltalk15"					;// ...глупость неизлечима, я давно это знал...
	Smalltalk16					=	"SVM_11_Smalltalk16"					;// ...раньше все было намного лучше, не то, что сейчас...
	Smalltalk17					=	"SVM_11_Smalltalk17"					;// ...и почему нельзя держать язык за зубами...
	Smalltalk18					=	"SVM_11_Smalltalk18"					;// ...больше не хочу слушать эту болтовню...
	Smalltalk19					=	"SVM_11_Smalltalk19"					;// ...здесь никому нельзя доверять, вокруг слишком много предателей...
	Smalltalk20					=	"SVM_11_Smalltalk20"					;// ...не думаю, что здесь хоть что-нибудь изменится...
	Smalltalk21					=	"SVM_11_Smalltalk21"					;// ...наверное, ты прав...
	Smalltalk22					=	"SVM_11_Smalltalk22"					;// ...надо выждать время. Спешка не доведет до добра...
	Smalltalk23					=	"SVM_11_Smalltalk23"					;// ...я думал, это уже давно решенный вопрос...
	Smalltalk24					=	"SVM_11_Smalltalk24"					;// ...это не слишком интересно, поговорим о чем-нибудь другом...
	Om							= 	"SVM_11_Om"							;//
};


instance SVM_12	(C_SVM)		//Bazaar-Hдndler		Nach auЯen freundlich,jovial,Innen hinterhдltig, raffgierig
{
	StopMagic					=	"SVM_12_StopMagic"						;//Колдовать запрещено!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"					;//Перестань колдовать, кому сказал!
	WeaponDown					=	"SVM_12_WeaponDown"						;//Зачем это тебе оружие, парень!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"				;//Спрячь оружие, я сказал!
	WatchYourAim				=	"SVM_12_WatchYourAim"					;//Ты собрался меня убить! Только попробуй!
	WatchYourAimAngry			=	"SVM_12_WatchYourAimAngry"				;//Перестань в меня целиться, иначе у тебя будут проблемы!
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"				;//Эй, ты слепой или что?
	LetsForgetOurLittleFight	=	"SVM_12_LetsForgetOurLittleFight"		;//Давай забудем эту ссору, ладно?
	Strange						=	"SVM_12_Strange"						;//Но он только что был здесь?! Странно! 
	DieMonster					=	"SVM_12_DieMonster"						;//Твоя очередь, ублюдок!
	DieMortalEnemy				=	"SVM_12_DieMortalEnemy"					;//Пришло время расплаты!
	NowWait						=	"SVM_12_NowWait"						;//Сейчас будет хорошая драка...
	YouStillNotHaveEnough		=	"SVM_12_YouStillNotHaveEnough"			;//Ну, что, хочешь еще?
	YouAskedForIt				=	"SVM_12_YouAskedForIt"					;//Ты сам напросился!
	NowWaitIntruder				= 	"SVM_12_NowWaitIntruder"				;//Теперь тебе от нас не уйти!
	IWillTeachYouRespectForForeignProperty	=	"SVM_12_IWillTeachYouRespectForForeignProperty"	;//Сейчас я тебе голову оторву!
	DirtyThief					=	"SVM_12_DirtyThief"						;//Грязный вор! Сейчас я тебя проучу!
	YouAttackedMyCharge			=	"SVM_12_YouAttackedMyCharge"			;//Никто не смеет трогать моих друзей!
	YouKilledOneOfUs			=	"SVM_12_YouKilledOneOfUs"				;//Ты убил одного из нас! Теперь твой черед!
	Dead						=	"SVM_12_Dead"							;//
	Aargh_1						=	"SVM_12_Aargh_1"						;//
	Aargh_2						=	"SVM_12_Aargh_2"						;//
	Aargh_3						=	"SVM_12_Aargh_3"						;//
	Berzerk						=	"SVM_12_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_12_YoullBeSorryForThis"			;//Ты еще об этом пожалеешь!
	YesYes						=	"SVM_12_YesYes"							;//Спокойно, парень! Ты победил.
	ShitWhatAMonster			=	"SVM_12_ShitWhatAMonster"				;//Драку придется отложить. Этот мне не по зубам!
	Help						=	"SVM_12_Help"							;//Пора уходить!
	WeWillMeetAgain				=	"SVM_12_WeWillMeetAgain"				;//Мы еще встретимся!
	NeverTryThatAgain			=	"SVM_12_NeverTryThatAgain"				;//В следующий раз тебе не выжить!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"				;//Отличное оружие! Не стоит оставлять его здесь.
	ITookYourOre				=	"SVM_12_ITookYourOre"					;//Ты, конечно, не будешь против, если я позаимствую немного руды?
	ShitNoOre					=	"SVM_12_ShitNoOre"						;//Да у тебя же совсем нет руды?!
	HandsOff					=	"SVM_12_HandsOff"						;//Ты, негодяй! Убери руки! Я тебе покажу!
	GetOutOfHere				=	"SVM_12_GetOutOfHere"					;//Сгинь! Здесь тебе не место!
	YouViolatedForbiddenTerritory=	"SVM_12_YouViolatedForbiddenTerritory";//Что это ты здесь делаешь?
	YouWannaFoolMe				=	"SVM_12_YouWannaFoolMe"					;//Обмануть меня захотел? Только попробуй!
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"			;//Эй, ты! Ты что здесь забыл?
	WhyAreYouInHere				=	"SVM_12_WhyYouAreInHere"				;//Что ты здесь делаешь? Уходи, иначе я позову стражу!
	WhatDidYouInThere			=	"SVM_12_WhatDidYouInThere"				;//Тебе нечего здесь делать!
	WiseMove					=	"SVM_12_WiseMove"						;//Ты быстро учишься!
	Alarm						=	"SVM_12_Alarm"							;//Стража, сюда!
	IntruderAlert				= 	"SVM_12_IntruderAlert"					;//Тревога!
	BehindYou					=	"SVM_12_BehindYou"						;//Будь осторожен!
	TheresAFight				=	"SVM_12_TheresAFight"					;//Сейчас мы посмотрим, кто кого.
	HeyHeyHey					=	"SVM_12_HeyHeyHey"						;//Как тебе это?!
	CheerFight					=	"SVM_12_CheerFight"						;//Хорошо!
	CheerFriend					=	"SVM_12_CheerFriend"					;//Бей сильнее!
	Ooh							=	"SVM_12_Ooh"							;//Защищайся, идиот!
	YeahWellDone				=	"SVM_12_YeahWellDone"					;//Да!
	RunCoward					=	"SVM_12_RunCoward"						;//Он удирает!
	HeDefeatedHim				=	"SVM_12_HeDefeatedHim"					;//Я бы сказал, чистая победа!
	HeDeservedIt				=	"SVM_12_HeDeservedIt"					;//Фу, так ему и надо!
	HeKilledHim					=	"SVM_12_HeKilledHim"					;//Ты убиваешь людей. Теперь у тебя большие неприятности!
	ItWasAGoodFight				=	"SVM_12_ItWasAGoodFight"				;//Отличная драка!
	Awake						=	"SVM_12_Awake"							;// 
	FriendlyGreetings			=	"SVM_12_FriendlyGreetings"				;//Привет!
	ALGreetings					=	"SVM_12_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_12_MageGreetings"					;//Во имя магии!
	SectGreetings				=	"SVM_12_SectGreetings"					;//Пробудись!
	ThereHeIs					= 	"SVM_12_ThereHeIs"						;//Сюда.
	NoLearnNoPoints				= 	"SVM_12_NoLearnNoPoints"				;//Я не могу обучить тебя. У тебя недостаточно опыта.
	NoLearnOverMax				= 	"SVM_12_NoLearnOverMax"					;//Ты уже освоил эту науку. Тебе стоит научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_12_NoLearnYouAlreadyKnow"			;//Тебе нужно набраться опыта, только так ты станешь настоящим мастером.
	NoLearnYoureBetter			=	"SVM_12_NoLearnYoureBetter"				;//Теперь ты намного лучше!
	HeyYou						=	"SVM_12_HeyYou"							;//Эй, ты!  
	NotNow						=	"SVM_12_NotNow"							;//Не сейчас.
	WhatDoYouWant				=	"SVM_12_WhatDoYouWant"					;//Чем могу помочь?
	ISaidWhatDoYouWant			=	"SVM_12_ISaidWhatDoYouWant"				;//Что ты хочешь?
	MakeWay						=	"SVM_12_MakeWay"						;//Дай мне пройти!
	OutOfMyWay					=	"SVM_12_OutOfMyWay"						;//Ну же, уйди с дороги!
	YouDeafOrWhat				=	"SVM_12_YouDeafOrWhat"					;//Ты глухой или у тебя мало проблем?
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"			;//Ты хочешь со мной поссориться?
	LookAway					=	"SVM_12_LookAway"						;//Что-то произошло? Я ничего не видел...
	OkayKeepIt					=	"SVM_12_OkayKeepIt"						;//Ладно. Можешь забрать это себе.
	WhatsThat					=	"SVM_12_WhatsThat"						;//Что это было?
	ThatsMyWeapon				=	"SVM_12_ThatsMyWeapon"					;//Отдай мне мое оружие!
	GiveItToMe					=	"SVM_12_GiveItToMe"						;//Отдай, тебе говорят!
	YouCanKeeptheCrap			=	"SVM_12_YouCanKeeptheCrap"				;//Ну, не так уж плохо! У меня есть еще!
	TheyKilledMyFriend			=	"SVM_12_TheyKilledMyFriend"				;//Убили одного из наших! Если я доберусь до этого наглеца...
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"			;//Ну, что такое? Зачем ты меня разбудил?
	SuckerGotSome				=	"SVM_12_SuckerGotSome"					;//А? Получил в морду? Это послужит тебе уроком!
	SuckerDefeatedEBr			=	"SVM_12_SuckerDefeatedEBr"				;//Ты избил Барона. Тебе не избежать его мести!
	SuckerDefeatedGur			=	"SVM_12_SuckerDefeatedGur"				;//Ты избил Гуру. Смотри, тебе это с рук не сойдет!
	SuckerDefeatedMage			=	"SVM_12_SuckerDefeatedMage"				;//Победить мага... ты, должно быть, храбрый парень!
	SuckerDefeatedNov_Guard		= 	"SVM_12_SuckerDefeatedNov_Guard"		;//Только идиот будет драться с новичками!
	SuckerDefeatedVlk_Guard		= 	"SVM_12_SuckerDefeatedVlk_Guard"		;//Думаешь, тебе позволено бить рудокопов?
	YouDefeatedMyComrade		=	"SVM_12_YouDefeatedMyComrade"			;//Ты ударил моего друга. Какого черта?!
	YouDefeatedNOV_Guard		=	"SVM_12_YouDefeatedNOV_Guard"			;//Еще раз обидишь новенького, и ты об этом пожалеешь!
	YouDefeatedVLK_Guard		=	"SVM_12_YouDefeatedVLK_Guard"			;//Если ты будешь лезть к моим подопечным, я лично с тобой разберусь!
	YouStoleFromMe				=	"SVM_12_YouStoleFromMe"					;//Как ты посмел появиться здесь, грязный воришка?
	YouStoleFromUs				=	"SVM_12_YouStoleFromUs"					;//Мы хотим получить наши вещи! Быстро отдай!
	YouStoleFromEBr				=	"SVM_12_YouStoleFromEBr"				;//Ты обокрал Баронов! Они будут в ярости!
	YouStoleFromGur				=	"SVM_12_YouStoleFromGur"				;//Ты обокрал Гуру! Тебе не стоило попадаться на этом!
	StoleFromMage				=	"SVM_12_StoleFromMage"					;//Ты обокрал магов! А они не любят тех, кто роется в их вещах!
	YouKilledMyFriend			=	"SVM_12_YouKilledMyFriend"				;//Один из наших был убит недавно. Кажется, эта смерть на твоей совести. В следующий раз мы тебе этого не простим!
	YouKilledEBr				=	"SVM_12_YouKilledEBr"					;//Ты убил Барона! Парень, ты окончательно спятил?!
	YouKilledGur				=	"SVM_12_YouKilledGur"					;//Ты убил Гуру! Этого не может быть, как ты мог?
	YouKilledMage				=	"SVM_12_YouKilledMage"					;//Ты убил мага! У тебя есть хоть какое-нибудь оправдание?
	YouKilledOCfolk				=	"SVM_12_YouKilledOCfolk"				;//Убит человек из Старого лагеря, и кое-кто связывает тебя с этим убийством...
	YouKilledNCfolk				=	"SVM_12_YouKilledNCfolk"				;//Убит один из людей Нового лагеря. Кажется, там без тебя не обошлось!
	YouKilledPSIfolk			=	"SVM_12_YouKilledPSIfolk"				;//Убит один из последователей Братства. Кто-то говорит, что ты принимал в этом участие.
	GetThingsRight				=	"SVM_12_GetThingsRight"					;//Ты не сможешь уйти от ответственности!
	YouDefeatedMeWell			=	"SVM_12_YouDefeatedMeWell"				;//Ты победил меня в честном бою. Но теперь все закончилось.
	Smalltalk01					=	"SVM_12_Smalltalk01"					;// ...ну, если ты думаешь...
	Smalltalk02					=	"SVM_12_Smalltalk02"					;// ...возможно...
	Smalltalk03					=	"SVM_12_Smalltalk03"					;// ...не самое лучшее решение...
	Smalltalk04					=	"SVM_12_Smalltalk04"					;// ...я не хочу в это ввязываться...
	Smalltalk05					=	"SVM_12_Smalltalk05"					;// ...чужие проблемы - не мое дело...
	Smalltalk06					=	"SVM_12_Smalltalk06"					;// ...уже тогда было ясно, что этим дело не кончится...
	Smalltalk07					=	"SVM_12_Smalltalk07"					;// ...только между нами, другим необязательно знать об этом.
	Smalltalk08					=	"SVM_12_Smalltalk08"					;// ...больше этого не случится...
	Smalltalk09					=	"SVM_12_Smalltalk09"					;// ...что-то не то в этой истории...
	Smalltalk10					=	"SVM_12_Smalltalk10"					;// ...нужно думать, прежде чем что-нибудь говорить...
	Smalltalk11					=	"SVM_12_Smalltalk11"					;// ...пока меня не впутали...
	Smalltalk12					=	"SVM_12_Smalltalk12"					;// ...нельзя верить всему, что слышишь...
	Smalltalk13					=	"SVM_12_Smalltalk13"					;// ...не хотел бы я, чтобы со мной поступили так же...
	Smalltalk14					=	"SVM_12_Smalltalk14"					;// ...все время одно и то же...
	Smalltalk15					=	"SVM_12_Smalltalk15"					;// ...глупость неизлечима, я давно это знал...
	Smalltalk16					=	"SVM_12_Smalltalk16"					;// ...раньше все было намного лучше, не то, что сейчас...
	Smalltalk17					=	"SVM_12_Smalltalk17"					;// ...и почему нельзя держать язык за зубами...
	Smalltalk18					=	"SVM_12_Smalltalk18"					;// ...больше не хочу слушать эту болтовню...
	Smalltalk19					=	"SVM_12_Smalltalk19"					;// ...здесь никому нельзя доверять, вокруг слишком много предателей, слишком...
	Smalltalk20					=	"SVM_12_Smalltalk20"					;// ...я не думаю, что здесь хоть что-нибудь изменится...
	Smalltalk21					=	"SVM_12_Smalltalk21"					;// ...наверное, ты прав...
	Smalltalk22					=	"SVM_12_Smalltalk22"					;// ...держись. Лучше ни на что не натыкаться...
	Smalltalk23					=	"SVM_12_Smalltalk23"					;// ...я думал, это уже давно решенный вопрос...
	Smalltalk24					=	"SVM_12_Smalltalk24"					;// ...давай поговорим о чем-нибудь другом...
	Om							= 	"SVM_12_Om"							;//
};


instance SVM_13	(C_SVM)					// Fanatiker	Agressiv, ьbereifrig, Дhnlich wie Stimme7Freak,	aber klarer, Ruhm-und-Ehre-Typ,	Nov: Glauben an	Yґberion blind,	Mitlдufer
{
	StopMagic					=	"SVM_13_StopMagic"						;//Колдовать запрещено!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"					;//Перестань колдовать, кому сказал!
	WeaponDown					=	"SVM_13_WeaponDown"						;//Убери оружие!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"				;//Спрячь оружие, я сказал!
	WatchYourAim				=	"SVM_13_WatchYourAim"					;//Ты собрался меня убить! Только попробуй!
	WatchYourAimAngry			=	"SVM_13_WatchYourAimAngry"				;//Смерти захотел? Перестань в меня целиться!
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"				;//Зачем ты это делаешь?
	LetsForgetOurLittleFight	=	"SVM_13_LetsForgetOurLittleFight"		;//Давай забудем эту ссору, ладно?
	Strange						=	"SVM_13_Strange"						;//Он ушел от нас! Куда же он делся?
	DieMonster					=	"SVM_13_DieMonster"						;//Из тебя получится отличный ужин!
	DieMortalEnemy				=	"SVM_13_DieMortalEnemy"					;//Настал твой черед! Пощады не жди!
	NowWait						=	"SVM_13_NowWait"						;//Сейчас будет хорошая драка...
	YouStillNotHaveEnough		=	"SVM_13_YouStillNotHaveEnough"			;//Ну что, хочешь еще?
	YouAskedForIt				=	"SVM_13_YouAskedForIt"					;//Ты сам напросился!
	NowWaitIntruder				= 	"SVM_13_NowWaitIntruder"				;//Теперь тебе от нас не уйти!
	IWillTeachYouRespectForForeignProperty	=	"SVM_13_IWillTeachYouRespctForForeignProperty"	;//Сейчас я тебе голову оторву!
	DirtyThief					=	"SVM_13_DirtyThief"						;//Грязный вор! Сейчас я тебя проучу!
	YouAttackedMyCharge			=	"SVM_13_YouAttackedMyCharge"			;//Здесь только я могу устраивать драки!
	YouKilledOneOfUs			=	"SVM_13_YouKilledOneOfUs"				;//Ты убил одного из нас!
	Dead						=	"SVM_13_Dead"							;//
	Aargh_1						=	"SVM_13_Aargh_1"						;//
	Aargh_2						=	"SVM_13_Aargh_2"						;//
	Aargh_3						=	"SVM_13_Aargh_3"						;//
	Berzerk						=	"SVM_13_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_13_YoullBeSorryForThis"			;//Поздно раскаиваться, сейчас я тебя убью!
	YesYes						=	"SVM_13_YesYes"							;//Что ты? Я же ничего не видел!
	ShitWhatAMonster			=	"SVM_13_ShitWhatAMonster"				;//Драку придется отложить. Мы еще встретимся...
	Help						=	"SVM_13_Help"							;//Пора уходить!
	WeWillMeetAgain				=	"SVM_13_WeWillMeetAgain"				;//Мы еще встретимся!
	NeverTryThatAgain			=	"SVM_13_NeverTryThatAgain"				;//В следующий раз тебе не выжить!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"				;//Отличное оружие! Не стоит оставлять его здесь.
	ITookYourOre				=	"SVM_13_ITookYourOre"					;//Ты, конечно, не будешь против, если я позаимствую немного руды?
	ShitNoOre					=	"SVM_13_ShitNoOre"						;//Да у тебя же совсем нет руды?!
	HandsOff					=	"SVM_13_HandsOff"						;//Ты, негодяй! Убери руки! Я тебе покажу!
	GetOutOfHere				=	"SVM_13_GetOutOfHere"					;//Сгинь! Здесь тебе не место!
	YouViolatedForbiddenTerritory=	"SVM_13_YouViolatedForbiddenTerritory"	;//Что это ты здесь делаешь?
	YouWannaFoolMe				=	"SVM_13_YouWannaFoolMe"					;//Обмануть меня захотел? Только попробуй!
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"			;//Эй, ты! Ты здесь что-то забыл?
	WhyAreYouInHere				=	"SVM_13_WhyYouAreInHere"				;//Что ты здесь делаешь? Уходи, иначе я позову стражу!
	WhatDidYouInThere			=	"SVM_13_WhatDidYouInThere"				;//Тебе нечего здесь делать!
	WiseMove					=	"SVM_13_WiseMove"						;//Тебе повезло! Но в следующий раз я тебе этого не прощу!
	Alarm						=	"SVM_13_Alarm"							;//Стража, сюда!
	IntruderAlert				= 	"SVM_13_IntruderAlert"					;//Тревога!
	BehindYou					=	"SVM_13_BehindYou"						;//Будь осторожен!
	TheresAFight				=	"SVM_13_TheresAFight"					;//Сейчас мы посмотрим, кто кого.
	HeyHeyHey					=	"SVM_13_HeyHeyHey"						;//Да, так его!
	CheerFight					=	"SVM_13_CheerFight"						;//Я хочу увидеть кровь!
	CheerFriend					=	"SVM_13_CheerFriend"					;//Бей сильнее!
	Ooh							=	"SVM_13_Ooh"							;//Защищайся, идиот!
	YeahWellDone				=	"SVM_13_YeahWellDone"					;//Да!
	RunCoward					=	"SVM_13_RunCoward"						;//Да, убирайся!
	HeDefeatedHim				=	"SVM_13_HeDefeatedHim"					;//Жалкое зрелище! Да его же малейший ветерок свалить сможет!
	HeDeservedIt				=	"SVM_13_HeDeservedIt"					;//Фу, так ему и надо!
	HeKilledHim					=	"SVM_13_HeKilledHim"					;//Тебе жить надоело, да? Хватило же у тебя ума затеять драку при свидетелях.
	ItWasAGoodFight				=	"SVM_13_ItWasAGoodFight"				;//Отличная драка!
	Awake						=	"SVM_13_Awake"							;//
	FriendlyGreetings			=	"SVM_13_FriendlyGreetings"				;//У тебя все в порядке?
	ALGreetings					=	"SVM_13_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_13_MageGreetings"					;//Во имя магии!
	SectGreetings				=	"SVM_13_SectGreetings"					;//Пробудись!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Bist du blind? Da vorne!
	NoLearnNoPoints				= 	"SVM_13_NoLearnNoPoints"				;//Я не могу обучить тебя. У тебя недостаточно опыта.
	NoLearnOverMax				= 	"SVM_13_NoLearnOverMax"					;//Ты уже освоил эту науку. Тебе стоит научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_13_NoLearnYouAlreadyKnow"			;//Обучение должно происходить постепенно, только так ты станешь настоящим мастером.
	NoLearnYoureBetter			=	"SVM_13_NoLearnYoureBetter"				;//Ты уже знаешь больше.
	HeyYou						=	"SVM_13_HeyYou"							;//Эй, ты!
	NotNow						=	"SVM_13_NotNow"							;//Не сейчас.
	WhatDoYouWant				=	"SVM_13_WhatDoYouWant"					;//Что тебе от меня нужно?
	ISaidWhatDoYouWant			=	"SVM_13_ISaidWhatDoYouWant"				;//Я могу что-нибудь для тебя сделать?
	MakeWay						=	"SVM_13_MakeWay"						;//Пропусти меня!
	OutOfMyWay					=	"SVM_13_OutOfMyWay"						;//Уйди с дороги!
	YouDeafOrWhat				=	"SVM_13_YouDeafOrWhat"					;//Ищешь неприятностей? Дай пройти!
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"			;//Ты хочешь со мной поссориться?
	LookAway					=	"SVM_13_LookAway"						;//Я ничего не видел!
	OkayKeepIt					=	"SVM_13_OkayKeepIt"						;//Спокойно. Можешь забрать это себе.
	WhatsThat					=	"SVM_13_WhatsThat"						;//Что это было?
	ThatsMyWeapon				=	"SVM_13_ThatsMyWeapon"					;//Отдай мне мое оружие!
	GiveItToMe					=	"SVM_13_GiveItToMe"						;//Отдай, тебе говорят!
	YouCanKeeptheCrap			=	"SVM_13_YouCanKeeptheCrap"				;//Хорошо! Оставь себе! Я найду себе что-нибудь другое!
	TheyKilledMyFriend			=	"SVM_13_TheyKilledMyFriend"				;//Один из наших людей был зверски убит. Его кровь взывает к мести!
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"			;//Зачем ты меня разбудил?
	SuckerGotSome				=	"SVM_13_SuckerGotSome"					;//Это послужит тебе хорошим уроком. Больше не будешь нарушать наши законы!
	SuckerDefeatedEBr			=	"SVM_13_SuckerDefeatedEBr"				;//Ты избил Барона. Тебе не избежать его мести!
	SuckerDefeatedGur			=	"SVM_13_SuckerDefeatedGur"				;//Ты избил Гуру. Смотри, тебе это с рук не сойдет!
	SuckerDefeatedMage			=	"SVM_13_SuckerDefeatedMage"				;//Надо быть полным идиотом, чтобы ввязываться в драку с магом.
	SuckerDefeatedNov_Guard		= 	"SVM_13_SuckerDefeatedNov_Guard"		;//Так ты обижаешь наших послушников?!
	SuckerDefeatedVlk_Guard		= 	"SVM_13_SuckerDefeatedVlk_Guard"		;//Не трогай моих людей!
	YouDefeatedMyComrade		=	"SVM_13_YouDefeatedMyComrade"			;//Не стоило поднимать руки на моих друзей, ты за это поплатишься.
	YouDefeatedNOV_Guard		=	"SVM_13_YouDefeatedNOV_Guard"			;//Нехорошо нарушать наш покой. Это может стоить тебе жизни!
	YouDefeatedVLK_Guard		=	"SVM_13_YouDefeatedVLK_Guard"			;//Если ты будешь лезть к моим подопечным, я лично с тобой разберусь!
	YouStoleFromMe				=	"SVM_13_YouStoleFromMe"					;//Ты обокрал меня! Тебе это зачтется!
	YouStoleFromUs				=	"SVM_13_YouStoleFromUs"					;//Мы хотим получить наши вещи! Быстро отдай!
	YouStoleFromEBr				=	"SVM_13_YouStoleFromEBr"				;//Ты обокрал Баронов! Зачем ты это сделал?
	YouStoleFromGur				=	"SVM_13_YouStoleFromGur"				;//Ты обокрал Гуру! Они уже знают, что это был ты.
	StoleFromMage				=	"SVM_13_StoleFromMage"					;//Ты обокрал магов! Это было неразумно с твоей стороны.
	YouKilledMyFriend			=	"SVM_13_YouKilledMyFriend"				;//Один из наших был убит недавно. Кажется, эта смерть на твоей совести. В следующий раз мы тебе этого не простим!
	YouKilledEBr				=	"SVM_13_YouKilledEBr"					;//Ты убил Барона! Думаешь, тебе это сойдет с рук?
	YouKilledGur				=	"SVM_13_YouKilledGur"					;//Ты убил Гуру! Этого не может быть, как ты мог?
	YouKilledMage				=	"SVM_13_YouKilledMage"					;//Ты убил мага! У тебя есть хоть какое-нибудь оправдание?
	YouKilledOCfolk				=	"SVM_13_YouKilledOCfolk"				;//В Старом лагере произошло убийство. Ходят слухи, что ты в этом замешан...
	YouKilledNCfolk				=	"SVM_13_YouKilledNCfolk"				;//Убит один из людей Нового лагеря. Кажется, там без тебя не обошлось!
	YouKilledPSIfolk			=	"SVM_13_YouKilledPSIfolk"				;//Убит один из последователей Братства. Кто-то говорит, что ты принимал в этом участие.
	GetThingsRight				=	"SVM_13_GetThingsRight"					;//Ты не сможешь уйти от ответственности!
	YouDefeatedMeWell			=	"SVM_13_YouDefeatedMeWell"				;//Ты победил меня в честном бою. Но теперь все закончилось, я не держу на тебя зла.
	Smalltalk01					=	"SVM_13_Smalltalk01"					;// ...так ты говоришь...
	Smalltalk02					=	"SVM_13_Smalltalk02"					;// ...возможно...
	Smalltalk03					=	"SVM_13_Smalltalk03"					;// ...не самое лучшее решение...
	Smalltalk04					=	"SVM_13_Smalltalk04"					;// ...уж лучше я посмотрю со стороны...
	Smalltalk05					=	"SVM_13_Smalltalk05"					;// ...чужие проблемы не мое дело...
	Smalltalk06					=	"SVM_13_Smalltalk06"					;// ...уже тогда было ясно, что этим дело не кончится...
	Smalltalk07					=	"SVM_13_Smalltalk07"					;// ...только между нами, другим не нужно рассказывать...
	Smalltalk08					=	"SVM_13_Smalltalk08"					;// ...такое со мной больше не случится...
	Smalltalk09					=	"SVM_13_Smalltalk09"					;// ...интересно, а в этом что-то есть...
	Smalltalk10					=	"SVM_13_Smalltalk10"					;// ...нужно думать, прежде чем что-нибудь говорить...
	Smalltalk11					=	"SVM_13_Smalltalk11"					;// ...я не имею отношения к этому делу...
	Smalltalk12					=	"SVM_13_Smalltalk12"					;// ...нельзя верить всему, что слышишь...
	Smalltalk13					=	"SVM_13_Smalltalk13"					;// ...не хотел бы я, чтобы со мной поступили так же...
	Smalltalk14					=	"SVM_13_Smalltalk14"					;// ...все время одно и то же...
	Smalltalk15					=	"SVM_13_Smalltalk15"					;// ...глупость неизлечима, я давно это знал...
	Smalltalk16					=	"SVM_13_Smalltalk16"					;// ...раньше все было намного лучше, не то, что сейчас...
	Smalltalk17					=	"SVM_13_Smalltalk17"					;// ...и почему нельзя держать язык за зубами...
	Smalltalk18					=	"SVM_13_Smalltalk18"					;// ...больше не хочу слушать эту болтовню...
	Smalltalk19					=	"SVM_13_Smalltalk19"					;// ...здесь никому нельзя доверять, вокруг слишком много предателей, слишком...
	Smalltalk20					=	"SVM_13_Smalltalk20"					;// ...не думаю, что здесь что-нибудь изменится...
	Smalltalk21					=	"SVM_13_Smalltalk21"					;// ...наверное, ты прав...
	Smalltalk22					=	"SVM_13_Smalltalk22"					;// ...надо выждать время. Спешка не доведет до добра...
	Smalltalk23					=	"SVM_13_Smalltalk23"					;// ...я думал, это уже давно решенный вопрос...
	Smalltalk24					=	"SVM_13_Smalltalk24"					;// ...это не слишком интересно, поговорим о чем-нибудь другом...
	Om							= 	"SVM_13_Om"							;//
};



//////////////////////////////////////////
instance SVM_14	(C_SVM)				// Xardas(DMB),Corristo,Erzдhler	alt	arrogant, gebildet
{
	StopMagic					=	"SVM_14_StopMagic"						;//Хватит колдовать!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"					;//Ты что не слышишь: никакой магии!
	WeaponDown					=	"SVM_14_WeaponDown"						;//Зачем тебе это оружие?
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Спрячь оружие!
	WatchYourAim				=	"SVM_14_WatchYourAim"					;//Ты мне угрожаешь?
	WatchYourAimAngry			=	"SVM_14_WatchYourAimAngry"				;//Может, хватит целиться в меня?
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Смотри, что ты делаешь!
	LetsForgetOurLittleFight	=	"SVM_14_LetsForgetOurLittleFight"		;//Давай забудем о наших разногласиях, хорошо?
	Strange						=	"SVM_14_Strange"						;//Вот это трюк: взял и исчез!
	DieMonster					=	"SVM_14_DieMonster"						;//Назойливая тварь!
	DieMortalEnemy				=	"SVM_14_DieMortalEnemy"					;//Я просто обязан тебя убить. Пойми, ничего личного!
	NowWait						=	"SVM_14_NowWait"						;//Пока хватит!
	YouStillNotHaveEnough		=	"SVM_14_YouStillNotHaveEnough"			;//Ведь тебе не нужны неприятности, да?
	YouAskedForIt				=	"SVM_14_YouAskedForIt"					;//Сам напросился!
	NowWaitIntruder				= 	"SVM_14_NowWaitIntruder"				;//Тебя сюда не приглашали!
	IWillTeachYouRespectForForeignProperty	=	"SVM_14_IWillTeachYouRespectForForeignProperty"	;//Это не для тебя!
	DirtyThief					=	"SVM_14_DirtyThief"						;//Похоже, ты взял кое-что мое. Ты заплатишь за это!
	YouAttackedMyCharge			=	"SVM_14_YouAttackedMyCharge"			;//Я тебя научу соблюдать закон!
	YouKilledOneOfUs			=	"SVM_14_YouKilledOneOfUs"				;//Ты убил кого-то!
	Dead						=	"SVM_14_Dead"							;//
	Aargh_1						=	"SVM_14_Aargh_1"						;//
	Aargh_2						=	"SVM_14_Aargh_2"						;//
	Aargh_3						=	"SVM_14_Aargh_3"						;//
	Berzerk						=	"SVM_14_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_14_YoullBeSorryForThis"			;//Ты будешь об этом жалеть!
	YesYes						=	"SVM_14_YesYes"							;//Ладно, хорошо!
	ShitWhatAMonster			=	"SVM_14_ShitWhatAMonster"				;//Я не хочу сейчас ввязываться в драку!
	Help						=	"SVM_14_Help"							;//Я должен вернуться к своему занятию!
	WeWillMeetAgain				=	"SVM_14_WeWillMeetAgain"				;//Но мы еще встретимся, будь уверен!
	NeverTryThatAgain			=	"SVM_14_NeverTryThatAgain"				;//Лучше тебе это больше не делать!
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Я возьму это оружие!
	ITookYourOre				=	"SVM_14_ITookYourOre"					;//Руда - вещь полезная!
	ShitNoOre					=	"SVM_14_ShitNoOre"						;//В твоих карманах совсем нет руды!
	HandsOff					=	"SVM_14_HandsOff"						;//Руки прочь!
	GetOutOfHere				=	"SVM_14_GetOutOfHere"					;//Вон отсюда!
	YouViolatedForbiddenTerritory=	"SVM_14_YouViolatedForbiddenTerritory"	;//Как ты здесь оказался?
	YouWannaFoolMe				=	"SVM_14_YouWannaFoolMe"					;//Шутишь что ли?
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"			;//Чего ты тут шатаешься?
	WhyAreYouInHere				=	"SVM_14_WhyYouAreInHere"				;//Убирайся или я позову стражу!
	WhatDidYouInThere			=	"SVM_14_WhatDidYouInThere"				;//Тебе здесь не место! Ясно?
	WiseMove					=	"SVM_14_WiseMove"						;//Вот это правильно!
	Alarm						=	"SVM_14_Alarm"							;//Стража, сюда, сюда!
	IntruderAlert				= 	"SVM_14_IntruderAlert"					;//Чужой!
	BehindYou					=	"SVM_14_BehindYou"						;//Осторожно!
	TheresAFight				=	"SVM_14_TheresAFight"					;//Драка!
	HeyHeyHey					=	"SVM_14_HeyHeyHey"						;//Хм.
	CheerFight					=	"SVM_14_CheerFight"						;//Как неумело!
	CheerFriend					=	"SVM_14_CheerFriend"					;//Выглядит довольно впечатляюще!
	Ooh							=	"SVM_14_Ooh"							;//Это было больно!
	YeahWellDone				=	"SVM_14_YeahWellDone"					;//Это единственный способ.
	RunCoward					=	"SVM_14_RunCoward"						;//Он немного подучился!
	HeDefeatedHim				=	"SVM_14_HeDefeatedHim"					;//Ну, вот и все.
	HeDeservedIt				=	"SVM_14_HeDeservedIt"					;//Это послужит ему хорошим уроком!
	HeKilledHim					=	"SVM_14_HeKilledHim"					;//Не стоило его убивать, теперь у тебя будут крупные неприятности!
	ItWasAGoodFight				=	"SVM_14_ItWasAGoodFight"				;//Эти драки меня утомляют!
	Awake						=	"SVM_14_Awake"							;//Я что? Спал?
	FriendlyGreetings			=	"SVM_14_FriendlyGreetings"				;//Приветствую.
	ALGreetings					=	"SVM_14_ALGreetings"					;//За Гомеза!
	MageGreetings				=	"SVM_14_MageGreetings"					;//Во имя магии!
	SectGreetings				=	"SVM_14_SectGreetings"					;//Проснись!
	ThereHeIs					= 	"SVM_14_ThereHeIs"						;//Он там.
	NoLearnNoPoints				= 	"SVM_14_NoLearnNoPoints"				;//Я не могу тебя обучить. У тебя недостаточно опыта.
	NoLearnOverMax				= 	"SVM_14_NoLearnOverMax"					;//Ты уже освоил эту науку. Тебе стоит научиться чему-нибудь еще.
	NoLearnYouAlreadyKnow		=	"SVM_14_NoLearnYouAlreadyKnow"			;//Обучение должно происходить постепенно, только так ты станешь настоящим мастером.
	NoLearnYoureBetter			=	"SVM_14_NoLearnYoureBetter"				;//Ты уже знаешь больше.
	HeyYou						=	"SVM_14_HeyYou"							;//Эй, ты! 
	NotNow						=	"SVM_14_NotNow"							;//Не сейчас.
	WhatDoYouWant				=	"SVM_14_WhatDoYouWant"					;//Что тебе от меня нужно?
	ISaidWhatDoYouWant			=	"SVM_14_ISaidWhatDoYouWant"				;//Я могу что-нибудь для тебя сделать?
	MakeWay						=	"SVM_14_MakeWay"						;//Пропусти меня!
	OutOfMyWay					=	"SVM_14_OutOfMyWay"						;//Уйди с дороги!
	YouDeafOrWhat				=	"SVM_14_YouDeafOrWhat"					;//Ищешь неприятностей? Дай пройти!
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"			;//Ты хочешь со мной поссориться?
	LookAway					=	"SVM_14_LookAway"						;//Меня не интересует, что ты здесь делаешь!
	OkayKeepIt					=	"SVM_14_OkayKeepIt"						;//Можешь оставить это себе.
	WhatsThat					=	"SVM_14_WhatsThat"						;//Что это было?
	ThatsMyWeapon				=	"SVM_14_ThatsMyWeapon"					;//Я хочу получить назад свое оружие!
	GiveItToMe					=	"SVM_14_GiveItToMe"						;//Отдай, тебе говорят!
	YouCanKeeptheCrap			=	"SVM_14_YouCanKeeptheCrap"				;//Хорошо! Оставь себе! Я найду себе что-нибудь другое!
	TheyKilledMyFriend			=	"SVM_14_TheyKilledMyFriend"				;//Один из наших людей был зверски убит. Его кровь взывает к мести!
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"			;//Ты оторвал меня от важных мыслей!
	SuckerGotSome				=	"SVM_14_SuckerGotSome"					;//Я слышал, у тебя были проблемы!
	SuckerDefeatedEBr			=	"SVM_14_SuckerDefeatedEBr"				;//Ты избил Барона. Тебе не избежать его мести!
	SuckerDefeatedGur			=	"SVM_14_SuckerDefeatedGur"				;//Ты избил Гуру. Смотри, тебе это с рук не сойдет!
	SuckerDefeatedMage			=	"SVM_14_SuckerDefeatedMage"				;//Победить мага...
	SuckerDefeatedNov_Guard		= 	"SVM_14_SuckerDefeatedNov_Guard"		;//Ты знаешь, что новички находятся под моей защитой, и все равно ты осмеливаешься обижать их?
	SuckerDefeatedVlk_Guard		= 	"SVM_14_SuckerDefeatedVlk_Guard"		;//Если ты обижаешь рудокопов, ты покушаешься на мой доход!
	YouDefeatedMyComrade		=	"SVM_14_YouDefeatedMyComrade"			;//Не стоило поднимать руки на моих друзей, ты за это поплатишься.
	YouDefeatedNOV_Guard		=	"SVM_14_YouDefeatedNOV_Guard"			;//Еще раз обидишь новичка, и ты пожалеешь!
	YouDefeatedVLK_Guard		=	"SVM_14_YouDefeatedVLK_Guard"			;//Если ты будешь лезть к моим подопечным, я лично с тобой разберусь!
	YouStoleFromMe				=	"SVM_14_YouStoleFromMe"					;//Как ты посмел появиться здесь, грязный воришка?
	YouStoleFromUs				=	"SVM_14_YouStoleFromUs"					;//Мы хотим получить наши вещи! Быстро отдай!
	YouStoleFromEBr				=	"SVM_14_YouStoleFromEBr"				;//Ты обокрал Баронов! Зачем ты это сделал? Они будут в ярости!
	YouStoleFromGur				=	"SVM_14_YouStoleFromGur"				;//Ты обокрал Гуру! Они уже знают, что это был ты.
	StoleFromMage				=	"SVM_14_StoleFromMage"					;//Ты обокрал магов! Это было неразумно с твоей стороны.
	YouKilledMyFriend			=	"SVM_14_YouKilledMyFriend"				;//Один из наших был убит недавно. Кажется, эта смерть на твоей совести. В следующий раз мы тебе этого не простим!
	YouKilledEBr				=	"SVM_14_YouKilledEBr"					;//Ты убил Барона! Думаешь, тебе это сойдет с рук?
	YouKilledGur				=	"SVM_14_YouKilledGur"					;//Ты убил Гуру! Этого не может быть, как ты мог?
	YouKilledMage				=	"SVM_14_YouKilledMage"					;//Ты убил мага! У тебя есть какое-нибудь оправдание?
	YouKilledOCfolk				=	"SVM_14_YouKilledOCfolk"				;//В Старом лагере произошло убийство. Ходят слухи, что ты в этом замешан...
	YouKilledNCfolk				=	"SVM_14_YouKilledNCfolk"				;//Убит один из людей Нового лагеря. Кажется, там без тебя не обошлось!
	YouKilledPSIfolk			=	"SVM_14_YouKilledPSIfolk"				;//Убит один из последователей Братства. Кто-то говорит, что ты принимал в этом участие.
	GetThingsRight				=	"SVM_14_GetThingsRight"					;//Ты не сможешь уйти от ответственности!
	YouDefeatedMeWell			=	"SVM_14_YouDefeatedMeWell"				;//Ты задал мне хорошую трепку, парень. Это был хороший бой, но сейчас он окончен!
	Smalltalk01					=	"SVM_14_Smalltalk01"					;// ...так ты говоришь...
	Smalltalk02					=	"SVM_14_Smalltalk02"					;// ...может быть...
	Smalltalk03					=	"SVM_14_Smalltalk03"					;// ...не самое лучшее решение...
	Smalltalk04					=	"SVM_14_Smalltalk04"					;// ...я не хочу в этом участвовать...
	Smalltalk05					=	"SVM_14_Smalltalk05"					;// ...чужие проблемы не мое дело...
	Smalltalk06					=	"SVM_14_Smalltalk06"					;// ...похоже, назревает проблема...
	Smalltalk07					=	"SVM_14_Smalltalk07"					;// ...только между нами, другим не нужно рассказывать...
	Smalltalk08					=	"SVM_14_Smalltalk08"					;// ...такое со мной больше не случится...
	Smalltalk09					=	"SVM_14_Smalltalk09"					;// ...интересно, а в этом что-то есть...
	Smalltalk10					=	"SVM_14_Smalltalk10"					;// ...нужно думать, прежде чем что-нибудь говорить...
	Smalltalk11					=	"SVM_14_Smalltalk11"					;// ...я не имею отношения к этому делу...
	Smalltalk12					=	"SVM_14_Smalltalk12"					;// ...нельзя верить всему, что слышишь...
	Smalltalk13					=	"SVM_14_Smalltalk13"					;// ...не хотел бы я, чтобы со мной поступили так же...
	Smalltalk14					=	"SVM_14_Smalltalk14"					;// ...каждый раз одна и та же история...
	Smalltalk15					=	"SVM_14_Smalltalk15"					;// ...глупость неизлечима, я давно это знал...
	Smalltalk16					=	"SVM_14_Smalltalk16"					;// ...раньше все было намного лучше, не то, что сейчас...
	Smalltalk17					=	"SVM_14_Smalltalk17"					;// ...и почему нельзя держать язык за зубами...
	Smalltalk18					=	"SVM_14_Smalltalk18"					;// ...я больше не слушаю пустую болтовню...
	Smalltalk19					=	"SVM_14_Smalltalk19"					;// ...веришь кому-то - и в результате попадаешь в неприятности, так всегда и бывает...
	Smalltalk20					=	"SVM_14_Smalltalk20"					;// ...не думаю, что здесь хоть что-нибудь изменится...
	Smalltalk21					=	"SVM_14_Smalltalk21"					;// ...наверное, ты прав...
	Smalltalk22					=	"SVM_14_Smalltalk22"					;// ...держись. Лучше ни на что не натыкаться...
	Smalltalk23					=	"SVM_14_Smalltalk23"					;// ...я думал, это уже давно решенный вопрос...
	Smalltalk24					=	"SVM_14_Smalltalk24"					;// ...это не слишком интересно, поговорим о чем-нибудь другом...
	Om							= 	"SVM_14_Om"							;//
};


//////////////////////////////////////////
INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Эй, ты!
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Подожди!

	SectGreetings			=	"SVM_15_SectGreetings"				;//Пробудись!
	ALGreetings				=	"SVM_15_ALGreetings"				;//За Гомеза!
	MageGreetings			=	"SVM_15_MageGreetings"				;//Приветствую!
	FriendlyGreetings		=	"SVM_15_FriendlyGreetings"			;//Привет!
	Aargh_1					=	"SVM_15_Aargh_1"					;//
	Aargh_2					=	"SVM_15_Aargh_2"					;//
	Aargh_3					=	"SVM_15_Aargh_3"					;//
	Dead					=	"SVM_15_Dead"						;//
	Awake					=	"SVM_15_Awake"						;//
	DoesntWork				= 	"SVM_15_DoesntWork"					;//Не работает.
	PickBroke				= 	"SVM_15_PickBroke"					;// Хм, сломан.
	NeedKey					= 	"SVM_15_NeedKey"					;// Для этого мне нужен ключ...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;// Костяных ключей больше нет...
	InvFull					= 	"SVM_15_InvFull"					;// Я не могу нести еще больше.
};

//////////////////////////////////////////
INSTANCE SVM_16	(C_SVM)				// Stimmbeschreibung	:		Babes halt!!!!!
{
	NotNow						=	"SVM_16_NotNow"			;	//Уходи! Тебе нельзя со мной разговаривать!
	Help						=	"SVM_16_Help"			;	//
	Aargh_1						=	"SVM_16_Aargh_1"		;	//
	Aargh_2						=	"SVM_16_Aargh_2"		;	//
	Aargh_3						=	"SVM_16_Aargh_3"		;	//
	Dead						=	"SVM_16_Dead"			;	//
};

//////////////////////////////////////////
INSTANCE SVM_17	(C_SVM)							//Ork-Stimme (alle SVMs werden auf wenige guturalen, unverstдndlichen Laute umgeleitet)
												//Die Dialoge mit dem verbannten Ork-Shamanen im Kastell und dem Ork-Sklaven in der Freien Mine laufen auch
												//ьber Stimme 17, sind aber in halbwegsverstдndlichem orkisch-deutsch
												//Das hier ьberall vergebene SVM_17_OrcSound01 wird noch durch 9 weitere Variationen ergдnzt

// FIXME: mehr Varianten!?
{
	StopMagic					=	"SVM_17_OrcSound01"			;//КАРРОК УР ШАК ТОС КАРРАС ДА ГАК!
	ISaidStopMagic				=	"SVM_17_OrcSound02"			;//РОК КРУШАК КОР ГАНГОРГ!
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




