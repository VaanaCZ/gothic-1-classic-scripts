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
	VAR	STRING	Om;							// Hmmm (Meditation)

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
	StopMagic					=	"SVM_1_StopMagic"					;//Pøestaò s tìmi èáry!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Chceš jednu koupit? Okamitì toho nech!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Dej pryè tu zbraò!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Dej tu zatracenou zbraò pryè!
	WatchYourAim				=	"SVM_1_WatchYourAim"				;//Pryè s ní!
	WatchYourAimAngry			=	"SVM_1_WatchYourAimAngry"			;//Jestli chceš poøádnou do zubù, tak na mì zkus ještì zamíøit!
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Dej si pozor! Ještì jednou a máš ji!
	LetsForgetOurLittleFight	=	"SVM_1_LetsForgetOurLittleFight"	;//Zapomeneme na tohle malé nedorozumìní, oukej?
	Strange						=	"SVM_1_Strange"						;//Odpal, ty bastarde!
	DieMonster					=	"SVM_1_DieMonster"					;//Ty proklatej èubèí synu!
	DieMortalEnemy				=	"SVM_1_DieMortalEnemy"				;//Teï si to odneseš!
	NowWait						=	"SVM_1_NowWait"						;//Napálím ti jí takovou...
	YouStillNotHaveEnough		=	"SVM_1_YouStillNotHaveEnough"		;//Vypadáš, jako kdybys chtìl jednu na tlamu!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//Øíkáš si o to!
	NowWaitIntruder				= 	"SVM_1_NowWaitIntruder"				;//Mám pocit, e tì odtud odnesou po kouskách.
	IWillTeachYouRespectForForeignProperty	=	"SVM_1_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem tì, abys dal pracky pryè od mıch vìcí!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Skonèím to s tebou, zlodìji!
	YouAttackedMyCharge			=	"SVM_1_YouAttackedMyCharge"			;//Na moje kamarády si nikdo dovolovat nebude!
	YouKilledOneOfUs			=	"SVM_1_YouKilledOneOfUs"			;//Vztáhl jsi ruku na jednoho z nás,  teï pøijde øada na tebe!
	Dead						=	"SVM_1_Dead"						;//Aaaaaargl!
	Aargh_1						=	"SVM_1_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_1_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_1_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_1_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_1_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_1_YesYes"						;//ádnı strach! Zvítìzil jsi!
	ShitWhatAMonster			=	"SVM_1_ShitWhatAMonster"			;//K sakru! Utíkej, jak nejrychleji umíš!
	Help						=	"SVM_1_Help"						;//K èertu!
	WeWillMeetAgain				=	"SVM_1_WeWillMeetAgain"				;//Ještì se uvidíme!
	NeverTryThatAgain			=	"SVM_1_NeverTryThatAgain"			;//Zkus to ještì jednou a budeš litovat!
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Pìkná zbraò! Dej mi ji!
	ITookYourOre				=	"SVM_1_ITookYourOre"				;//Díky, hrdino!
	ShitNoOre					=	"SVM_1_ShitNoOre"					;//Ty bídnej èerve, nemáš ani kousek rudy!
	HandsOff					=	"SVM_1_HandsOff"					;//Ruce od toho pryè!
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Kliï se odsuï!
	YouViolatedForbiddenTerritory=	"SVM_1_YouViolatedForbiddenTerritory";//Hej! Jak ses sem dostal?
	YouWannaFoolMe				=	"SVM_1_YouWannaFoolMe"				;//Myslíš, e jsem hlupák?
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Hej, ty! Co tady pohledáváš?
	WhyAreYouInHere				=	"SVM_1_WhyYouAreInHere"				;//Vypadni z mojí chatrèe nebo zavolám stráe!
	WhatDidYouInThere			=	"SVM_1_WhatDidYouInThere"			;//Tady nemáš co dìlat! Vypadni!
	WiseMove					=	"SVM_1_WiseMove"					;//Bystrej chlapík!
	Alarm						=	"SVM_1_Alarm"						;//Stráe! Sem!
	IntruderAlert				= 	"SVM_1_IntruderAlert"				;//POZOR!! VETØELEC!!
	BehindYou					=	"SVM_1_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_1_TheresAFight"				;//Hej, do boje!
	HeyHeyHey					=	"SVM_1_HeyHeyHey"					;//Poøádnì!
	CheerFight					=	"SVM_1_CheerFight"					;//Pereš se jako enská!
	CheerFriend					=	"SVM_1_CheerFriend"					;//Skonèi to s ním!
	Ooh							=	"SVM_1_Ooh"							;//Vyøiï ho!
	YeahWellDone				=	"SVM_1_YeahWellDone"				;//Dej mu co proto!
	RunCoward					=	"SVM_1_RunCoward"					;//Kliï se, ty nádhero!
	HeDefeatedHim				=	"SVM_1_HeDefeatedHim"				;//Ten má dost!
	HeDeservedIt				=	"SVM_1_HeDeservedIt"				;//Podej si ho!
	HeKilledHim					=	"SVM_1_HeKilledHim"					;//Proè jsi ho zabil? Jako bys byl mrtvej!
	ItWasAGoodFight				=	"SVM_1_ItWasAGoodFight"				;//Dobrá práce!
	Awake						=	"SVM_1_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_1_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_1_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_1_MageGreetings"				;//Za slávu magie!
	SectGreetings				=	"SVM_1_SectGreetings"				;//Vzbuï se!
	ThereHeIs					= 	"SVM_1_ThereHeIs"					;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_1_NoLearnNoPoints"				;//Vra se, a budeš moudøejší.
	NoLearnOverMax				= 	"SVM_1_NoLearnOverMax"				;//Jsi u konce svıch moností. Mìl by ses uèit nìco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_1_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vùdcem, musíš na sobì ještì pracovat!
	NoLearnYoureBetter			=	"SVM_1_NoLearnYoureBetter"			;//U je to s tebou lepší!
	HeyYou						=	"SVM_1_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_1_NotNow"						;//Teï ne!
	WhatDoYouWant				=	"SVM_1_WhatDoYouWant"				;//Co chceš?
	ISaidWhatDoYouWant			=	"SVM_1_ISaidWhatDoYouWant"			;//Mùu pro tebe nìco udìlat?
	MakeWay						=	"SVM_1_MakeWay"						;//Nech mì jít!
	OutOfMyWay					=	"SVM_1_OutOfMyWay"					;//Uhni mi z cesty, èlovìèe!
	YouDeafOrWhat				=	"SVM_1_YouDeafOrWhat"				;//Jseš hluchej? TAK UHNI!
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//Chceš mít problémy?
	LookAway					=	"SVM_1_LookAway"					;//Uhhh! Nic jsem nevidìl!
	OkayKeepIt					=	"SVM_1_OkayKeepIt"					;//Dobrá, dobrá! Tak si jí nech!
	WhatsThat					=	"SVM_1_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_1_ThatsMyWeapon"				;//Chodíš tu s MOJÍ zbraní!
	GiveItToMe					=	"SVM_1_GiveItToMe"					;//Dej mi tu vìcièku!
	YouCanKeeptheCrap			=	"SVM_1_YouCanKeeptheCrap"			;//Tak si jí nech! Já ji beztak nepotøebuju!
	TheyKilledMyFriend			=	"SVM_1_TheyKilledMyFriend"			;//Dostali jednoho z našich chlapíkù. A já toho lotra dostanu...
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//K èertu, proè mì budíš?
	SuckerGotSome				=	"SVM_1_SuckerGotSome"				;//Dostal jsi nakládaèku? Dobøe ti tak!
	SuckerDefeatedEBr			=	"SVM_1_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Má na tebe vztek!
	SuckerDefeatedGur			=	"SVM_1_SuckerDefeatedGur"			;//Porazil jsi Guru. Vypadá to, e pøitahuješ problémy jako magnet!
	SuckerDefeatedMage			=	"SVM_1_SuckerDefeatedMage"			;//Zvítìzit nad mágem není zrovna dobrı nápad!
	SuckerDefeatedNov_Guard		= 	"SVM_1_SuckerDefeatedNov_Guard"		;//Nemùeš se tu potloukat a mlátit novice!
	SuckerDefeatedVlk_Guard		= 	"SVM_1_SuckerDefeatedVlk_Guard"		;//Nech mé chlapy na pokoji!
	YouDefeatedMyComrade		=	"SVM_1_YouDefeatedMyComrade"		;//Odrovnal jsi mého kamaráda...
	YouDefeatedNOV_Guard		=	"SVM_1_YouDefeatedNOV_Guard"		;//Nebudeš tu dìlat problémy!
	YouDefeatedVLK_Guard		=	"SVM_1_YouDefeatedVLK_Guard"		;//Jestli vztáhneš ruku na nìkoho, kdo je pod mojí ochranou, tak si to schytáš!
	YouStoleFromMe				=	"SVM_1_YouStoleFromMe"				;//Seš mi ukradenej, ty zmetku! U to znovu nezkoušej!
	YouStoleFromUs				=	"SVM_1_YouStoleFromUs"				;//Chceme naše vìci zpátky! Vra nám je!
	YouStoleFromEBr				=	"SVM_1_YouStoleFromEBr"				;//Kradl jsi u Rudobaronù? Probùh, proè?
	YouStoleFromGur				=	"SVM_1_YouStoleFromGur"				;//Okradl jsi Guru? Jaká škoda, e tì nachytali!
	StoleFromMage				=	"SVM_1_StoleFromMage"				;//Kradl jsi u mágù! Jak stupidní nápad!
	YouKilledMyFriend			=	"SVM_1_YouKilledMyFriend"			;//Jeden z našich lidí zemøel a ty s tím máš co do èinìní! Staèí malá chybièka a pùjdeš za ním!
	YouKilledEBr				=	"SVM_1_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronù! Èlovìèe, úplnì ses pominul?
	YouKilledGur				=	"SVM_1_YouKilledGur"				;//Zabil jsi jednoho z Guru! Hochu, tomu nemùu uvìøit!
	YouKilledMage				=	"SVM_1_YouKilledMage"				;//Zabil jsi jednoho z mágù! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_1_YouKilledOCfolk"				;//Jeden z èlenù Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_1_YouKilledNCfolk"				;//Novı tábor utrpìl tìkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_1_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svıch vìøících a ty ho máš na svìdomí!
	GetThingsRight				=	"SVM_1_GetThingsRight"				;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_1_YouDefeatedMeWell"			;//Byl to dobrı boj! Poøádnì jsem to od tebe schytal, èlovìèe!
	Smalltalk01					=	"SVM_1_Smalltalk01"					;// ...nejhorší špína...
	Smalltalk02					=	"SVM_1_Smalltalk02"					;// ...moná, ale koho to zajímá?
	Smalltalk03					=	"SVM_1_Smalltalk03"					;// ...naprosto stupidní...
	Smalltalk04					=	"SVM_1_Smalltalk04"					;// ...udìlám nejlíp, kdy se budu dret dál...
	Smalltalk05					=	"SVM_1_Smalltalk05"					;// ...tohle opravdu není mùj problém...
	Smalltalk06					=	"SVM_1_Smalltalk06"					;// ...bylo jasné, e z toho bude mrzutost...
	Smalltalk07					=	"SVM_1_Smalltalk07"					;// ...proè se to dìlo poøád dál...
	Smalltalk08					=	"SVM_1_Smalltalk08"					;// ...u se to znovu nestane...
	Smalltalk09					=	"SVM_1_Smalltalk09"					;// ...a pøesto na tom musí nìco bıt...
	Smalltalk10					=	"SVM_1_Smalltalk10"					;// ...šetøi si dech, jo, jo...
	Smalltalk11					=	"SVM_1_Smalltalk11"					;// ...jestli se mì to netıká...
	Smalltalk12					=	"SVM_1_Smalltalk12"					;// ...nemìl bys všemu vìøit...
	Smalltalk13					=	"SVM_1_Smalltalk13"					;// ...pøesto bych nechtìl bıt v jeho kùi...
	Smalltalk14					=	"SVM_1_Smalltalk14"					;// ...poøád ta samá pohádka...
	Smalltalk15					=	"SVM_1_Smalltalk15"					;// ...nìkteøí lidé se nikdy nepouèí...
	Smalltalk16					=	"SVM_1_Smalltalk16"					;// ...døíve bıvalo všechno docela jinak...
	Smalltalk17					=	"SVM_1_Smalltalk17"					;// ...lidé øíkají...
	Smalltalk18					=	"SVM_1_Smalltalk18"					;// ...takové øeèi já nikdy neposlouchám...
	Smalltalk19					=	"SVM_1_Smalltalk19"					;// ...na nìkoho se spoléháš a dostaneš se do problémù, tak to chodí...
	Smalltalk20					=	"SVM_1_Smalltalk20"					;// ...pochybuji, e by se to mohlo zmìnit...
	Smalltalk21					=	"SVM_1_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_1_Smalltalk22"					;// ...vydr. Lepší je do nièeho se nepouštìt...
	Smalltalk23					=	"SVM_1_Smalltalk23"					;// ...myslel jsem, e u je to dávno za námi...
	Smalltalk24					=	"SVM_1_Smalltalk24"					;// ...pojïme radìji mluvit o nìèem jiném...
	Om							= 	"SVM_1_Om"							;//Hmmm
};


//SVM_2	// Misstrauisch (Volk, Bauern, Novizen, MILTEN) Misstrauisch. Defensiv. Angst in was reingezogen zu werden. Klug. Nov: Glauben durch Einschüchterung

instance SVM_2 (C_SVM)				// Misstrauisch
{
	StopMagic					=	"SVM_2_StopMagic"					;//ádná kouzla!
	ISaidStopMagic				=	"SVM_2_ISaidStopMagic"				;//HEJ! Øekl jsem ádné èáry!
	WeaponDown					=	"SVM_2_WeaponDown"					;//Dìlej! Dej tu vìc pryè!
	ISaidWeaponDown				=	"SVM_2_ISaidWeaponDown"				;//Dej tu zbraò pryè!
	WatchYourAim				=	"SVM_2_WatchYourAim"				;//Dívej se, kam míøíš!
	WatchYourAimAngry			=	"SVM_2_WatchYourAimAngry"			;//Jestli zamíøíš na mì, budu si to brát osobnì!
	WhatAreYouDoing				=	"SVM_2_WhatAreYouDoing"				;//Hej, co to má znamenat?
	LetsForgetOurLittleFight	=	"SVM_2_LetsForgetOurLittleFight"	;//Zapomeneme na to, dobrá?
	Strange						=	"SVM_2_Strange"						;//Zvláštní! Kam se podìl?
	DieMonster					=	"SVM_2_DieMonster"					;//A další!
	DieMortalEnemy				=	"SVM_2_DieMortalEnemy"				;//Obávám se, e tì budu muset zlikvidovat
	NowWait						=	"SVM_2_NowWait"						;//Tvoje chyba!
	YouStillNotHaveEnough		=	"SVM_2_YouStillNotHaveEnough"		;//Nemáš ještì dost?
	YouAskedForIt				=	"SVM_2_YouAskedForIt"				;//Jestli po tom opravdu touíš!
	NowWaitIntruder				= 	"SVM_2_NowWaitIntruder"				;//Víš, e tu nemáš co dìlat!
	IWillTeachYouRespectForForeignProperty	=	"SVM_2_IWillTeachYouRespectForForeignProperty"	;//Proè se pleteš do vìcí, do kterıch ti nic není?
	DirtyThief					=	"SVM_2_DirtyThief"					;//Tys tady kradl! Tohle ti nezapomenu!
	YouAttackedMyCharge			=	"SVM_2_YouAttackedMyCharge"			;//Na moje chlapy si nikdo vyskakovat nebude!
	YouKilledOneOfUs			=	"SVM_2_YouKilledOneOfUs"			;//Zabil jsi jednoho z nás! Za to zaplatíš!
	Dead						=	"SVM_2_Dead"						;//Aaargl
	Aargh_1						=	"SVM_2_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_2_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_2_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_2_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_2_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_2_YesYes"						;//Klid, klid, vyhrál jsi!
	ShitWhatAMonster			=	"SVM_2_ShitWhatAMonster"			;//Já - ehm - s malou pomocí!
	Help						=	"SVM_2_Help"						;//Nemám èas, jenom si vyøídím své vìci!
	WeWillMeetAgain				=	"SVM_2_WeWillMeetAgain"				;//Urèitì se ještì uvidíme!
	NeverTryThatAgain			=	"SVM_2_NeverTryThatAgain"			;//U to znova nezkoušej!
	ITakeYourWeapon				=	"SVM_2_ITakeYourWeapon"				;//Tuhle zbraò si vezmu!
	ITookYourOre				=	"SVM_2_ITookYourOre"				;//Tolik rudy nebudeš stejnì potøebovat!
	ShitNoOre					=	"SVM_2_ShitNoOre"					;//Ty nemáš ádnou rudu? Tohle nevypadá na tvùj šastnı den!
	HandsOff					=	"SVM_2_HandsOff"					;//Ruce od toho pryè!
	GetOutOfHere				=	"SVM_2_GetOutOfHere"				;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_2_YouViolatedForbiddenTerritory";//Hej! Jak ses sem dostal?
	YouWannaFoolMe				=	"SVM_2_YouWannaFoolMe"				;//Není od tebe chytré mít mì za hlupáka!
	WhatsThisSupposedToBe		=	"SVM_2_WhatsThisSupposedToBe"		;//Co tady pohledáváš?
	WhyAreYouInHere				=	"SVM_2_WhyYouAreInHere"				;//Vypadni z mojí chatrèe nebo zavolám stráe!
	WhatDidYouInThere			=	"SVM_2_WhatDidYouInThere"			;//Vypadni z mojí chatrèe!
	WiseMove					=	"SVM_2_WiseMove"					;//Správné rozhodnutí!
	Alarm						=	"SVM_2_Alarm"						;//Stráe! Sem!
	IntruderAlert				= 	"SVM_2_IntruderAlert"				;//POZOR!!
	BehindYou					=	"SVM_2_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_2_TheresAFight"				;//Hej, do boje!
	HeyHeyHey					=	"SVM_2_HeyHeyHey"					;//To je všechno!
	CheerFight					=	"SVM_2_CheerFight"					;//Vstávej, lenochu!
	CheerFriend					=	"SVM_2_CheerFriend"					;//Dobrá rána!
	Ooh							=	"SVM_2_Ooh"							;//Vyøiï ho!
	YeahWellDone				=	"SVM_2_YeahWellDone"				;//Ještì se hıbe!
	RunCoward					=	"SVM_2_RunCoward"					;//Kliï se, ty nádhero!
	HeDefeatedHim				=	"SVM_2_HeDefeatedHim"				;//Ten má dost!
	HeDeservedIt				=	"SVM_2_HeDeservedIt"				;//To mu patøí!
	HeKilledHim					=	"SVM_2_HeKilledHim"					;//Tys ho zabil! Bylo to nutné?
	ItWasAGoodFight				=	"SVM_2_ItWasAGoodFight"				;//Skvìlı boj, jen trochu krátkı!
	Awake						=	"SVM_2_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_2_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_2_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_2_MageGreetings"				;//Za slávu magie
	SectGreetings				=	"SVM_2_SectGreetings"				;//Vzbuï se!
	ThereHeIs					= 	"SVM_2_ThereHeIs"					;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_2_NoLearnNoPoints"				;//Nemùu tì nic nauèit. Nemáš dost zkušeností.
	NoLearnOverMax				= 	"SVM_2_NoLearnOverMax"				;//Jsi u konce svıch moností. Mìl by ses uèit nìco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_2_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vùdcem, musíš na sobì ještì pracovat!
	NoLearnYoureBetter			=	"SVM_2_NoLearnYoureBetter"			;//U je to s tebou lepší!
	HeyYou						=	"SVM_2_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_2_NotNow"						;//Teï ne!
	WhatDoYouWant				=	"SVM_2_WhatDoYouWant"				;//Co chceš?
	ISaidWhatDoYouWant			=	"SVM_2_ISaidWhatDoYouWant"			;//Mùu pro tebe nìco udìlat?
	MakeWay						=	"SVM_2_MakeWay"						;//Nech mì jít!
	OutOfMyWay					=	"SVM_2_OutOfMyWay"					;//Uhni mi z cesty, èlovìèe!
	YouDeafOrWhat				=	"SVM_2_YouDeafOrWhat"				;//Ztra se, nebo se po tobì projdu!
	LookingForTroubleAgain		=	"SVM_2_LookingForTroubleAgain"		;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_2_LookAway"					;//NIC jsem nevidìl! VŠECHNO je v poøádku!
	OkayKeepIt					=	"SVM_2_OkayKeepIt"					;//Dobrá! Je tvoje!
	WhatsThat					=	"SVM_2_WhatsThat"					;//Hej? Co?
	ThatsMyWeapon				=	"SVM_2_ThatsMyWeapon"				;//To, s èím tady chodíš, vypadá jako moje zbraò!
	GiveItToMe					=	"SVM_2_GiveItToMe"					;//Pojï a dej mi tu vìcièku!
	YouCanKeeptheCrap			=	"SVM_2_YouCanKeeptheCrap"			;//Já ji beztak nepotøebuju!
	TheyKilledMyFriend			=	"SVM_2_TheyKilledMyFriend"			;//Dostali jednoho z našich chlapíkù. A my toho lotra dostaneme...
	YouDisturbedMySlumber		=	"SVM_2_YouDisturbedMySlumber"		;//Proè mì budíš?
	SuckerGotSome				=	"SVM_2_SuckerGotSome"				;//Dostali tì! Musím pøiznat, e to bylo dobrı!
	SuckerDefeatedEBr			=	"SVM_2_SuckerDefeatedEBr"			;//Pøemohl jsi Rudobarona!
	SuckerDefeatedGur			=	"SVM_2_SuckerDefeatedGur"			;//Porazil jsi Guru. Nevím, jestli je to odvaha nebo bláznovství!
	SuckerDefeatedMage			=	"SVM_2_SuckerDefeatedMage"			;//Zvítìzit nad mágem... Musíš mít pro strach udìláno!
	SuckerDefeatedNov_Guard		= 	"SVM_2_SuckerDefeatedNov_Guard"		;//Musím tu sjednat poøádek!
	SuckerDefeatedVlk_Guard		= 	"SVM_2_SuckerDefeatedVlk_Guard"		;//Nezáleí na tom, co máš v úmyslu! Jestli odrovnáš nìkterého kopáèe, budeš v maléru!
	YouDefeatedMyComrade		=	"SVM_2_YouDefeatedMyComrade"		;//Odrovnal jsi jednoho z mıch kamarádù!
	YouDefeatedNOV_Guard		=	"SVM_2_YouDefeatedNOV_Guard"		;//Nech ty novice na pokoji!
	YouDefeatedVLK_Guard		=	"SVM_2_YouDefeatedVLK_Guard"		;//Moje chlapy necháš na pokoji! Jasnı?
	YouStoleFromMe				=	"SVM_2_YouStoleFromMe"				;//Proè jsi mì okradl?
	YouStoleFromUs				=	"SVM_2_YouStoleFromUs"				;//Sebral jsi nìco, co bylo naše. Chceme to zpátky!
	YouStoleFromEBr				=	"SVM_2_YouStoleFromEBr"				;//Èlovìèe, tys kradl u Rudobaronù? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_2_YouStoleFromGur"				;//Okradl jsi Guru? Máš štìstí, e tì nechytili!
	StoleFromMage				=	"SVM_2_StoleFromMage"				;//Mágové nemají rádi lidi, co se motají kolem jejich vìcí!
	YouKilledMyFriend			=	"SVM_2_YouKilledMyFriend"			;//Máš na svìdomí jednoho z našich muù. Staèí malá chybièka a pøijde øada na tebe!
	YouKilledEBr				=	"SVM_2_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronù! Èlovìèe, úplnì ses pominul?
	YouKilledGur				=	"SVM_2_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nemùu tomu uvìøit!
	YouKilledMage				=	"SVM_2_YouKilledMage"				;//Zabil jsi jednoho z mágù! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_2_YouKilledOCfolk"				;//Jeden z èlenù Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_2_YouKilledNCfolk"				;//Novı tábor utrpìl tìkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_2_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svıch vìøících a ty ho máš na svìdomí!
	GetThingsRight				=	"SVM_2_GetThingsRight"				;//Máš vùbec ponìtí, jak je tìké dát to zas do poøádku?
	YouDefeatedMeWell			=	"SVM_2_YouDefeatedMeWell"			;//Ano, vítìzíš. Byl to dobrı boj! Ale teï u je konec!
	Smalltalk01					=	"SVM_2_Smalltalk01"					;// ...kdy myslíš...
	Smalltalk02					=	"SVM_2_Smalltalk02"					;// ...moná...
	Smalltalk03					=	"SVM_2_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_2_Smalltalk04"					;// ...udìlám nejlíp, kdy se budu dret dál...
	Smalltalk05					=	"SVM_2_Smalltalk05"					;// ...tohle opravdu není mùj problém...
	Smalltalk06					=	"SVM_2_Smalltalk06"					;// ...bylo jasné, e z toho bude mrzutost...
	Smalltalk07					=	"SVM_2_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vìdìt...
	Smalltalk08					=	"SVM_2_Smalltalk08"					;// ...u se to znovu nestane...
	Smalltalk09					=	"SVM_2_Smalltalk09"					;// ...a pøesto na tom musí nìco bıt...
	Smalltalk10					=	"SVM_2_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem øíkáš...
	Smalltalk11					=	"SVM_2_Smalltalk11"					;// ...jestli se mì to netıká...
	Smalltalk12					=	"SVM_2_Smalltalk12"					;// ...nemìl bys všemu vìøit...
	Smalltalk13					=	"SVM_2_Smalltalk13"					;// ...pøesto bych nechtìl bıt v jeho kùi...
	Smalltalk14					=	"SVM_2_Smalltalk14"					;// ...poøád ta samá pohádka...
	Smalltalk15					=	"SVM_2_Smalltalk15"					;// ...nìkteøí lidé se nikdy nepouèí...
	Smalltalk16					=	"SVM_2_Smalltalk16"					;// ...døíve bıvalo všechno docela jinak...
	Smalltalk17					=	"SVM_2_Smalltalk17"					;// ...lidé øíkají...
	Smalltalk18					=	"SVM_2_Smalltalk18"					;// ...takové øeèi já nikdy neposlouchám...
	Smalltalk19					=	"SVM_2_Smalltalk19"					;// ...na nìkoho se spoléháš a dostaneš se do problémù, tak to chodí...
	Smalltalk20					=	"SVM_2_Smalltalk20"					;// ...pochybuji, e by se to mohlo zmìnit...
	Smalltalk21					=	"SVM_2_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_2_Smalltalk22"					;// ...vydr. Lepší je do nièeho se nepouštìt...
	Smalltalk23					=	"SVM_2_Smalltalk23"					;// ...myslel jsem, e u je to dávno za námi...
	Smalltalk24					=	"SVM_2_Smalltalk24"					;// ...pojïme radìji mluvit o nìèem jiném...
	Om							= 	"SVM_2_Om"							;// Hmmm
};




instance SVM_3 (C_SVM)				 // Depressiv (Resigniert. Menschliches Gemüse. "Ich schau noch´n bisschen an die Decke.." , "Wir sind eh alle verloren..." Nov:Glauben an Drogen
{
	StopMagic					=	"SVM_3_StopMagic"					;//ádné èarování!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"				;//Pøestaò u s tìmi kouzly!
	WeaponDown					=	"SVM_3_WeaponDown"					;//Polo tu zbraò!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"				;//Jestli se tu s tou zbraní budeš motat, dostanu vztek!
	WatchYourAim				=	"SVM_3_WatchYourAim"				;//Proè na mì míøíš?
	WatchYourAimAngry			=	"SVM_3_WatchYourAimAngry"			;//Polo tu zbraò nebo budu zlej!
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"				;//Hééj, co to má znamenat?
	LetsForgetOurLittleFight	=	"SVM_3_LetsForgetOurLittleFight"	;//Dobrá, berme tuhle hádku jako malé nedorozumìní.
	Strange						=	"SVM_3_Strange"						;//Je pryè! Kam se podìl?
	DieMonster					=	"SVM_3_DieMonster"					;//Ty prašivá bestie, ihned mì pøestaò obtìovat!
	DieMortalEnemy				=	"SVM_3_DieMortalEnemy"				;//Budu s tebou brzy hotovej!
	NowWait						=	"SVM_3_NowWait"						;//Asi budu muset mluvit jasnìji!
	YouStillNotHaveEnough		=	"SVM_3_YouStillNotHaveEnough"		;//Vypadá to, e ještì nemáš  dost!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Sám jsi to chtìl!
	NowWaitIntruder				= 	"SVM_3_NowWaitIntruder"				;//Nemáš tu co pohledávat! Budu tì odsuï muset vyrazit!
	IWillTeachYouRespectForForeignProperty	=	"SVM_3_IWillTeachYouRespectForForeignProperty"	;//Asi tì budu muset praštit pøes prsty. Jediná vìc, na kterou slyšíš!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Tys tady kradl! Tohle ti nezapomenu!
	YouAttackedMyCharge			=	"SVM_3_YouAttackedMyCharge"			;//Nemùeš tu na potkání hned kadého spráskat!
	YouKilledOneOfUs			=	"SVM_3_YouKilledOneOfUs"			;//Zabil jsi jednoho z nás! To byl tvùj poslední omyl!
	Dead						=	"SVM_3_Dead"						;//Aaargl
	Aargh_1						=	"SVM_3_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_3_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_3_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_3_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_3_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_3_YesYes"						;//Vyhrál jsi! Dobrá!
	ShitWhatAMonster			=	"SVM_3_ShitWhatAMonster"			;//K sakru! Utíkej, jak nejrychleji umíš!
	Help						=	"SVM_3_Help"						;//Musím jít!
	WeWillMeetAgain				=	"SVM_3_WeWillMeetAgain"				;//Ještì se uvidíme!
	NeverTryThatAgain			=	"SVM_3_NeverTryThatAgain"			;//U se o to nikdy nepokoušej!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"				;//Díky za tu zbraò!
	ITookYourOre				=	"SVM_3_ITookYourOre"				;//Vezmu si ještì víc tvojí rudy!
	ShitNoOre					=	"SVM_3_ShitNoOre"					;//Ty u nemáš rudu? To je smutné, èlovìèe, opravdu smutné!
	HandsOff					=	"SVM_3_HandsOff"					;//Ruce od toho pryè!
	GetOutOfHere				=	"SVM_3_GetOutOfHere"				;//Kliï se odsuï!
	YouViolatedForbiddenTerritory=	"SVM_3_YouViolatedForbiddenTerritory";//Hej! Odkud si pøišel?
	YouWannaFoolMe				=	"SVM_3_YouWannaFoolMe"				;//Nejsem tak hloupı, jak si myslíš!
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"		;//Pøestaò tu slídit!
	WhyAreYouInHere				=	"SVM_3_WhyYouAreInHere"				;//Kliï se z mojí chatrèe nebo zavolám stráe!
	WhatDidYouInThere			=	"SVM_3_WhatDidYouInThere"			;//Co tady pohledáváš? Jestli tì dostanu, bude to tvùj konec!
	WiseMove					=	"SVM_3_WiseMove"					;//Však ty víš, co pro tebe bude nejlepší!
	Alarm						=	"SVM_3_Alarm"						;//Stráe! Sem!
	IntruderAlert				= 	"SVM_3_IntruderAlert"				;//POZOR!!
	BehindYou					=	"SVM_3_BehindYou"					;//Dej pozor!
	TheresAFight				=	"SVM_3_TheresAFight"				;//Do boje!
	HeyHeyHey					=	"SVM_3_HeyHeyHey"					;//Dej mu!
	CheerFight					=	"SVM_3_CheerFight"					;//O co se to pokoušíš?
	CheerFriend					=	"SVM_3_CheerFriend"					;//Dobrá rána!
	Ooh							=	"SVM_3_Ooh"							;//Ooooh!
	YeahWellDone				=	"SVM_3_YeahWellDone"				;//Vıbornì! Dobrá práce!
	RunCoward					=	"SVM_3_RunCoward"					;//Utíká pryè!
	HeDefeatedHim				=	"SVM_3_HeDefeatedHim"				;//Dostal ho!
	HeDeservedIt				=	"SVM_3_HeDeservedIt"				;//To u se mìlo stát dávno!
	HeKilledHim					=	"SVM_3_HeKilledHim"					;//Ten u se ani nepohne! Zabil jsi ho!
	ItWasAGoodFight				=	"SVM_3_ItWasAGoodFight"				;//Poøád jen šarvátky...
	Awake						=	"SVM_3_Awake"						;//Zas další den a nic se nezmìnilo...
	FriendlyGreetings			=	"SVM_3_FriendlyGreetings"			;//Hej, èlovìèe.
	ALGreetings					=	"SVM_3_ALGreetings"					;//Za Gomeze! Hurá, hurá!
	MageGreetings				=	"SVM_3_MageGreetings"				;//Za slávu magie!
	SectGreetings				=	"SVM_3_SectGreetings"				;//Vzbuï se!
	ThereHeIs					= 	"SVM_3_ThereHeIs"					;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_3_NoLearnNoPoints"				;//Nemáš dost zkušeností. Tohle tì nemùu nauèit!
	NoLearnOverMax				= 	"SVM_3_NoLearnOverMax"				;//Jsi u konce svıch moností. Mìl by ses uèit nìco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_3_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vùdcem, musíš na sobì ještì pracovat!
	NoLearnYoureBetter			=	"SVM_3_NoLearnYoureBetter"			;//U je to s tebou lepší!
	HeyYou						=	"SVM_3_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_3_NotNow"						;//Teï ne!
	WhatDoYouWant				=	"SVM_3_WhatDoYouWant"				;//Chceš ode mì nìco?
	ISaidWhatDoYouWant			=	"SVM_3_ISaidWhatDoYouWant"			;//Mùu pro tebe nìco udìlat?
	MakeWay						=	"SVM_3_MakeWay"						;//Nech mì jít!
	OutOfMyWay					=	"SVM_3_OutOfMyWay"					;//Uhni mi z cesty, èlovìèe!
	YouDeafOrWhat				=	"SVM_3_YouDeafOrWhat"				;//Kolikrát to budu opakovat? Nech mì jít!
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"		;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_3_LookAway"					;//NIC jsem nevidìl! Ani tu vlastnì nejsem!
	OkayKeepIt					=	"SVM_3_OkayKeepIt"					;//Dobrá, dobrá! Tak si jí nech!
	WhatsThat					=	"SVM_3_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_3_ThatsMyWeapon"				;//Máš moji zbraò!
	GiveItToMe					=	"SVM_3_GiveItToMe"					;//Dej mi ji!
	YouCanKeeptheCrap			=	"SVM_3_YouCanKeeptheCrap"			;//Jak myslíš! Beztak ji nepotøebuju!
	TheyKilledMyFriend			=	"SVM_3_TheyKilledMyFriend"			;//Dostali dalšího. Nikdo z nás se odsud nedostane ivı...
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"		;//K èertu, proè mì budíš?
	SuckerGotSome				=	"SVM_3_SuckerGotSome"				;//Øíkal sis o poøádnou nakládaèku!
	SuckerDefeatedEBr			=	"SVM_3_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Asi si koleduješ o malér, viï?
	SuckerDefeatedGur			=	"SVM_3_SuckerDefeatedGur"			;//Porazil jsi jednoho z Guru. Budou mít na tebe poøádnı vztek!
	SuckerDefeatedMage			=	"SVM_3_SuckerDefeatedMage"			;//Vítìzství nad mágem znamená poøádnı malér!
	SuckerDefeatedNov_Guard		= 	"SVM_3_SuckerDefeatedNov_Guard"		;//Udìláš líp, kdy necháš pøíštì novice na pokoji!
	SuckerDefeatedVlk_Guard		= 	"SVM_3_SuckerDefeatedVlk_Guard"		;//Jestli zabiješ nìjakého kopáèe, tak ti to vrátím!
	YouDefeatedMyComrade		=	"SVM_3_YouDefeatedMyComrade"		;//Odrovnal jsi jednoho z mıch pøátel!
	YouDefeatedNOV_Guard		=	"SVM_3_YouDefeatedNOV_Guard"		;//Novicové jsou po mojí ochranou! Nech je na pokoji!
	YouDefeatedVLK_Guard		=	"SVM_3_YouDefeatedVLK_Guard"		;//Kopáèi mi platí, a tak nemají ádné problémy! A tak to taky zùstane!
	YouStoleFromMe				=	"SVM_3_YouStoleFromMe"				;//Seš mi ukradenej, ty zatracenej zlodìji!
	YouStoleFromUs				=	"SVM_3_YouStoleFromUs"				;//Máš u sebe nìco, co patøí nám. Udìláš nejlíp, kdy nám to vrátíš!
	YouStoleFromEBr				=	"SVM_3_YouStoleFromEBr"				;//Èlovìèe, tys kradl u Rudobaronù? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_3_YouStoleFromGur"				;//Okradl jsi Guru? Jaká škoda, e tì nachytali!
	StoleFromMage				=	"SVM_3_StoleFromMage"				;//Kdy u se pokoušíš okrást mágy, mìl bys bıt dùvtipnìjší!
	YouKilledMyFriend			=	"SVM_3_YouKilledMyFriend"			;//Máš na svìdomí jednoho z našich muù. Staèí malá chybièka a pøijde øada na tebe!
	YouKilledEBr				=	"SVM_3_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronù! Èlovìèe, úplnì ses pominul?
	YouKilledGur				=	"SVM_3_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nemùu tomu uvìøit!
	YouKilledMage				=	"SVM_3_YouKilledMage"				;//Zabil jsi jednoho z mágù! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_3_YouKilledOCfolk"				;//Jeden z èlenù Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_3_YouKilledNCfolk"				;//Novı tábor utrpìl tìkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_3_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svıch vìøících a ty ho máš na svìdomí!
	GetThingsRight				=	"SVM_3_GetThingsRight"				;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_3_YouDefeatedMeWell"			;//Byl to dobrı boj! Èert vem, es mì porazil!
	Smalltalk01					=	"SVM_3_Smalltalk01"					;// ...kdy myslíš...
	Smalltalk02					=	"SVM_3_Smalltalk02"					;// ...moná...
	Smalltalk03					=	"SVM_3_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_3_Smalltalk04"					;// ...udìlám nejlíp, kdy se budu dret dál...
	Smalltalk05					=	"SVM_3_Smalltalk05"					;// ...tohle opravdu není mùj problém...
	Smalltalk06					=	"SVM_3_Smalltalk06"					;// ...bylo jasné, e z toho bude mrzutost...
	Smalltalk07					=	"SVM_3_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vìdìt...
	Smalltalk08					=	"SVM_3_Smalltalk08"					;// ...u se to znovu nestane...
	Smalltalk09					=	"SVM_3_Smalltalk09"					;// ...a pøesto na tom musí nìco bıt...
	Smalltalk10					=	"SVM_3_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem øíkáš...
	Smalltalk11					=	"SVM_3_Smalltalk11"					;// ...jestli se mì to netıká...
	Smalltalk12					=	"SVM_3_Smalltalk12"					;// ...nemìl bys všemu vìøit...
	Smalltalk13					=	"SVM_3_Smalltalk13"					;// ...pøesto bych nechtìl bıt v jeho kùi...
	Smalltalk14					=	"SVM_3_Smalltalk14"					;// ...poøád ta samá pohádka...
	Smalltalk15					=	"SVM_3_Smalltalk15"					;// ...nìkteøí lidé se nikdy nepouèí...
	Smalltalk16					=	"SVM_3_Smalltalk16"					;// ...døíve bıvalo všechno docela jinak...
	Smalltalk17					=	"SVM_3_Smalltalk17"					;// ...lidé øíkají...
	Smalltalk18					=	"SVM_3_Smalltalk18"					;// ...takové øeèi já nikdy neposlouchám...
	Smalltalk19					=	"SVM_3_Smalltalk19"					;// ...na nìkoho se spoléháš a dostaneš se do problémù, tak to chodí...
	Smalltalk20					=	"SVM_3_Smalltalk20"					;// ...pochybuji, e by se to mohlo zmìnit...
	Smalltalk21					=	"SVM_3_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_3_Smalltalk22"					;// ...vydr. Lepší je do nièeho se nepouštìt...
	Smalltalk23					=	"SVM_3_Smalltalk23"					;// ...myslel jsem, e u je to dávno za námi...
	Smalltalk24					=	"SVM_3_Smalltalk24"					;// ...pojïme radìji mluvit o nìèem jiném...
	Om							= 	"SVM_3_Om"							;// Hmmm
};


instance SVM_4 (C_SVM)				// Alter Sack,  (Torrez, KDF-Magier, alte Buddler....), alter Hase. Kann Grünschnäbeln noch was zeigen
{
	StopMagic					=	"SVM_4_StopMagic"					;//Pøestaò s tìmi èáry!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"				;//Udìláš líp, kdy mì poslechneš a necháš toho èarování!
	WeaponDown					=	"SVM_4_WeaponDown"					;//Jestli se nechceš dostat do maléru, dej tu zbraò pryè!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"				;//Odlo tu zbraò!
	WatchYourAim				=	"SVM_4_WatchYourAim"				;//Mìl bys dávat pozor, kam míøíš!
	WatchYourAimAngry			=	"SVM_4_WatchYourAimAngry"			;//Jestli s tím nepøestaneš, tak ti tu hraèku seberu!
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"				;//Hej, ty tam! Dávej pozor!
	LetsForgetOurLittleFight	=	"SVM_4_LetsForgetOurLittleFight"	;//Zapomeòme na tohle malé nedorozumìní.
	Strange						=	"SVM_4_Strange"						;//Neschovávej se! Uka se!
	DieMonster					=	"SVM_4_DieMonster"					;//Nezáleí na tom, kolik muù zabiješ. Vdycky pøijdou další!
	DieMortalEnemy				=	"SVM_4_DieMortalEnemy"				;//A ty u tu nebudeš!
	NowWait						=	"SVM_4_NowWait"						;//Radím ti, aby ses se mnou nedostal do køíku...
	YouStillNotHaveEnough		=	"SVM_4_YouStillNotHaveEnough"		;//Ty ještì nemáš dost?
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Øíkáš si o to!
	NowWaitIntruder				= 	"SVM_4_NowWaitIntruder"				;//Bylo od tebe hloupé, e ses sem vetøel!
	IWillTeachYouRespectForForeignProperty	=	"SVM_4_IWillTeachYouRespectForForeignProperty"	;//Nemùeš se tu motat a nebıt potrestán!
	DirtyThief					=	"SVM_4_DirtyThief"					;//Troufl sis mì okrást!
	YouAttackedMyCharge			=	"SVM_4_YouAttackedMyCharge"			;//To, e ses s náma dostal do køíku, ti nic dobrého nepøinese!
	YouKilledOneOfUs			=	"SVM_4_YouKilledOneOfUs"			;//Zabil jsi jednoho z nás. Oko za oko!
	Dead						=	"SVM_4_Dead"						;//Aaaaaargl!
	Aargh_1						=	"SVM_4_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_4_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_4_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_4_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_4_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_4_YesYes"						;//Klídek! Zvítìzil jsi!
	ShitWhatAMonster			=	"SVM_4_ShitWhatAMonster"			;//Padej odsud jak nejrychleji umíš!
	Help						=	"SVM_4_Help"						;//Na to u jsem pøíliš starı!
	WeWillMeetAgain				=	"SVM_4_WeWillMeetAgain"				;//Tohle jen tak nezapomenu!
	NeverTryThatAgain			=	"SVM_4_NeverTryThatAgain"			;//Tohle u nikdy nezkoušej!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"				;//Radìji si tu zbraò vezmu sebou!
	ITookYourOre				=	"SVM_4_ITookYourOre"				;//Tvé rudì bude nejlépe v mıch rukách!
	ShitNoOre					=	"SVM_4_ShitNoOre"					;//U nikdy takové nedomrlé magické nugety.
	HandsOff					=	"SVM_4_HandsOff"					;//Ruce od toho pryè!
	GetOutOfHere				=	"SVM_4_GetOutOfHere"				;//Ztra se odsuï!
	YouViolatedForbiddenTerritory=	"SVM_4_YouViolatedForbiddenTerritory";//Tady nemáš co dìlat!
	YouWannaFoolMe				=	"SVM_4_YouWannaFoolMe"				;//Na takovéhle vtipy nemám náladu!
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"		;//Hej, ty! Co tady pohledáváš?
	WhyAreYouInHere				=	"SVM_4_WhyYouAreInHere"				;//Vypadni nebo zavolám stráe!
	WhatDidYouInThere			=	"SVM_4_WhatDidYouInThere"			;//Cos tady pohledával?
	WiseMove					=	"SVM_4_WiseMove"					;//Mìls štìstí!
	Alarm						=	"SVM_4_Alarm"						;//Stráe! Sem!
	IntruderAlert				= 	"SVM_4_IntruderAlert"				;//VETØELEC!!
	BehindYou					=	"SVM_4_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_4_TheresAFight"				;//Ještì jednou!
	HeyHeyHey					=	"SVM_4_HeyHeyHey"					;//Poøádnì!
	CheerFight					=	"SVM_4_CheerFight"					;//To je všechno, co umíš?
	CheerFriend					=	"SVM_4_CheerFriend"					;//Skonèi to s ním!
	Ooh							=	"SVM_4_Ooh"							;//Vra mu to!
	YeahWellDone				=	"SVM_4_YeahWellDone"				;//Dobrá práce!
	RunCoward					=	"SVM_4_RunCoward"					;//Ten zbabìlec prchá!
	HeDefeatedHim				=	"SVM_4_HeDefeatedHim"				;//Kdysi bıvali mui z oceli!
	HeDeservedIt				=	"SVM_4_HeDeservedIt"				;//Tvoje chyba!
	HeKilledHim					=	"SVM_4_HeKilledHim"					;//Proè jsi ho zabil? To byla velká chyba!
	ItWasAGoodFight				=	"SVM_4_ItWasAGoodFight"				;//Za starıch èasù, to se bojovalo jinak!
	Awake						=	"SVM_4_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_4_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_4_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_4_MageGreetings"				;//Za slávu magie!
	SectGreetings				=	"SVM_4_SectGreetings"				;//Vzbuï se!
	ThereHeIs					= 	"SVM_4_ThereHeIs"					;//Najdeš ho támhle!
	NoLearnNoPoints				= 	"SVM_4_NoLearnNoPoints"				;//Nemùu tì nic nauèit. Nemáš dost zkušeností.
	NoLearnOverMax				= 	"SVM_4_NoLearnOverMax"				;//Jsi u konce svıch moností. Mìl by ses uèit nìco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_4_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vùdcem, musíš na sobì ještì pracovat!
	NoLearnYoureBetter			=	"SVM_4_NoLearnYoureBetter"			;//U je to s tebou lepší ne tehdy!
	HeyYou						=	"SVM_4_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_4_NotNow"						;//Teï ne!
	WhatDoYouWant				=	"SVM_4_WhatDoYouWant"				;//Co chceš?
	ISaidWhatDoYouWant			=	"SVM_4_ISaidWhatDoYouWant"			;//Nìco po mnì chceš?
	MakeWay						=	"SVM_4_MakeWay"						;//Nech mì jít!
	OutOfMyWay					=	"SVM_4_OutOfMyWay"					;//Uhni mi z cesty!
	YouDeafOrWhat				=	"SVM_4_YouDeafOrWhat"				;//Uhni mi z cesty, jinak budeš litovat!
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"		;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_4_LookAway"					;//Nic zlého nevidím, neslyším, neøíkám...
	OkayKeepIt					=	"SVM_4_OkayKeepIt"					;//Tak si jí nech!
	WhatsThat					=	"SVM_4_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_4_ThatsMyWeapon"				;//Buï hodnej chlapec a vra mi mou zbraò!
	GiveItToMe					=	"SVM_4_GiveItToMe"					;//Pojï a dej mi ji!
	YouCanKeeptheCrap			=	"SVM_4_YouCanKeeptheCrap"			;//Stejnì jsem rád, e jsem se jí zbavil!
	TheyKilledMyFriend			=	"SVM_4_TheyKilledMyFriend"			;//Jestli zjistím, kdo zabil jednoho z nás...
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"		;//Rušíš mùj odpoèinek!
	SuckerGotSome				=	"SVM_4_SuckerGotSome"				;//Byls poraen! Potøeboval jsi poøádnı vıprask!
	SuckerDefeatedEBr			=	"SVM_4_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona!
	SuckerDefeatedGur			=	"SVM_4_SuckerDefeatedGur"			;//Porazil jsi jednoho z Guru. Obdivuhodné, ale u se o to znovu nepokoušej .
	SuckerDefeatedMage			=	"SVM_4_SuckerDefeatedMage"			;//Zvítìzit nad mágem... Musíš mít pro strach udìláno!
	SuckerDefeatedNov_Guard		= 	"SVM_4_SuckerDefeatedNov_Guard"		;//Musíš bıt šílenı, es srazil toho novice.
	SuckerDefeatedVlk_Guard		= 	"SVM_4_SuckerDefeatedVlk_Guard"		;//Co sis vlastnì myslel, e dìláš, kdy jsi zabíjel kopáèe?
	YouDefeatedMyComrade		=	"SVM_4_YouDefeatedMyComrade"		;//Dostal ses do maléru s jedním z mıch pøátel! To je dost zlı!
	YouDefeatedNOV_Guard		=	"SVM_4_YouDefeatedNOV_Guard"		;//Ještì jednou se dotkneš nìkterého novice a budeš litovat!
	YouDefeatedVLK_Guard		=	"SVM_4_YouDefeatedVLK_Guard"		;//Jsi pøíliš smìlı, problém s nìkterım z mıch chránìncù by pro tebe mohl znamenat nebezpeèí.
	YouStoleFromMe				=	"SVM_4_YouStoleFromMe"				;//Ruce pryè od mıch vìcí, jasnı?
	YouStoleFromUs				=	"SVM_4_YouStoleFromUs"				;//Máš u sebe nìco, co patøí nám. Vra nám to!
	YouStoleFromEBr				=	"SVM_4_YouStoleFromEBr"				;//Èlovìèe, tys kradl u Rudobaronù? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_4_YouStoleFromGur"				;//Okradl jsi Guru? Nemusel ses aspoò nechat chytit!
	StoleFromMage				=	"SVM_4_StoleFromMage"				;//Mágové nemají rádi lidi, co se motají kolem jejich vìcí!
	YouKilledMyFriend			=	"SVM_4_YouKilledMyFriend"			;//Máš na svìdomí jednoho z našich muù. Staèí malá chybièka a pøijde øada na tebe!
	YouKilledEBr				=	"SVM_4_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronù! Èlovìèe, úplnì ses pominul?
	YouKilledGur				=	"SVM_4_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nemùu tomu uvìøit!
	YouKilledMage				=	"SVM_4_YouKilledMage"				;//Zabil jsi jednoho z mágù! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_4_YouKilledOCfolk"				;//Jeden z èlenù Starého tábora je mrtev a tvé jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_4_YouKilledNCfolk"				;//Novı tábor utrpìl tìkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_4_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svıch vìøících a ty ho máš na svìdomí!
	GetThingsRight				=	"SVM_4_GetThingsRight"				;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_4_YouDefeatedMeWell"			;//Poøádnì jsi mi to nandal, èlovìèe. Byl to dobrı boj! Ale teï u je konec!
	Smalltalk01					=	"SVM_4_Smalltalk01"					;// ...kdy myslíš...
	Smalltalk02					=	"SVM_4_Smalltalk02"					;// ...moná...
	Smalltalk03					=	"SVM_4_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_4_Smalltalk04"					;// ...udìlám nejlíp, kdy se budu dret dál...
	Smalltalk05					=	"SVM_4_Smalltalk05"					;// ...tohle opravdu není mùj problém...
	Smalltalk06					=	"SVM_4_Smalltalk06"					;// ...bylo jasné, e z toho bude mrzutost...
	Smalltalk07					=	"SVM_4_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vìdìt...
	Smalltalk08					=	"SVM_4_Smalltalk08"					;// ...u se to znovu nestane...
	Smalltalk09					=	"SVM_4_Smalltalk09"					;// ...a pøesto na tom musí nìco bıt...
	Smalltalk10					=	"SVM_4_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem øíkáš...
	Smalltalk11					=	"SVM_4_Smalltalk11"					;// ...jestli se mì to netıká...
	Smalltalk12					=	"SVM_4_Smalltalk12"					;// ...nemìl bys všemu vìøit...
	Smalltalk13					=	"SVM_4_Smalltalk13"					;// ...pøesto bych nechtìl bıt v jeho kùi...
	Smalltalk14					=	"SVM_4_Smalltalk14"					;// ...poøád ta samá pohádka...
	Smalltalk15					=	"SVM_4_Smalltalk15"					;// ...nìkteøí lidé se nikdy nepouèí...
	Smalltalk16					=	"SVM_4_Smalltalk16"					;// ...døíve bıvalo všechno docela jinak...
	Smalltalk17					=	"SVM_4_Smalltalk17"					;// ...lidé øíkají...
	Smalltalk18					=	"SVM_4_Smalltalk18"					;// ...takové øeèi já nikdy neposlouchám...
	Smalltalk19					=	"SVM_4_Smalltalk19"					;// ...na nìkoho se spoléháš a dostaneš se do problémù, tak to chodí...
	Smalltalk20					=	"SVM_4_Smalltalk20"					;// ...pochybuji, e by se to mohlo zmìnit...
	Smalltalk21					=	"SVM_4_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_4_Smalltalk22"					;// ...vydr. Lepší je do nièeho se nepouštìt...
	Smalltalk23					=	"SVM_4_Smalltalk23"					;// ...myslel jsem, e u je to dávno za námi...
	Smalltalk24					=	"SVM_4_Smalltalk24"					;// ...pojïme radìji mluvit o nìèem jiném...
	Om							= 	"SVM_4_Om"							;//Hmmm
};


instance SVM_5 (C_SVM)				//Lebenskünstler, offen, Fröhlich. humorvoller Verarscher. Auch: Fauler Verpisser. Selbstbewußt, wortgewandt, charismatisch. (Lester)
{
	StopMagic					=	"SVM_5_StopMagic"					;//ádné èarování!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Pøestaò u s tìmi kouzly!
	WeaponDown					=	"SVM_5_WeaponDown"					;//Co chceš s tou zbraní dìlat, èlovìèe?
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Dìlej! Dej tu vìc pryè!
	WatchYourAim				=	"SVM_5_WatchYourAim"				;//Míøíš na mì, ty šašku!
	WatchYourAimAngry			=	"SVM_5_WatchYourAimAngry"			;//Jestli s tím nepøestaneš, ukáu ti, zaè je toho loket!
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//Hej, jseš slepej nebo co?
	LetsForgetOurLittleFight	=	"SVM_5_LetsForgetOurLittleFight"	;//Dobrá, zapomeòme na tuhle hádku, dobrı?
	Strange						=	"SVM_5_Strange"						;//Ještì pøed chvilkou tu byl! To je divné!
	DieMonster					=	"SVM_5_DieMonster"					;//Teï je øada na tobì, bastarde!
	DieMortalEnemy				=	"SVM_5_DieMortalEnemy"				;//Vyrovnáme úèty!
	NowWait						=	"SVM_5_NowWait"						;//Øíkáš si o poøádnou nakládaèku!
	YouStillNotHaveEnough		=	"SVM_5_YouStillNotHaveEnough"		;//Ty nemáš ještì dost?
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Dobrá! Øíkal sis o to!
	NowWaitIntruder				= 	"SVM_5_NowWaitIntruder"				;//Nemáš tu co pohledávat!
	IWillTeachYouRespectForForeignProperty	=	"SVM_5_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem tì. Jestli se dotkneš mıch vìcí, lítáš v prùšvihu!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Zlodìji! Však já tì nauèím!
	YouAttackedMyCharge			=	"SVM_5_YouAttackedMyCharge"			;//Není nikdo, kdo by mìl problém s mımi lidmi a pak toho nelitoval!
	YouKilledOneOfUs			=	"SVM_5_YouKilledOneOfUs"			;//Zabil jsi jednoho z mıch chlapù. Teï zabiju já TEBE!
	Dead						=	"SVM_5_Dead"					;//Aaargl
	Aargh_1						=	"SVM_5_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_5_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_5_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_5_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_5_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_5_YesYes"						;//Vyhrál jsi! Dobrá!
	ShitWhatAMonster			=	"SVM_5_ShitWhatAMonster"			;//To je na mì trochu moc!
	Help						=	"SVM_5_Help"						;//K èertu!
	WeWillMeetAgain				=	"SVM_5_WeWillMeetAgain"				;//Pøíštì to dopadne jinak!
	NeverTryThatAgain			=	"SVM_5_NeverTryThatAgain"			;//U to znovu nezkoušej!
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Ta zbraò se mi líbí!
	ITookYourOre				=	"SVM_5_ITookYourOre"				;//Podívám se, jak je tvá ruda dobøe uloená!
	ShitNoOre					=	"SVM_5_ShitNoOre"					;//U ádná ruda? To je smùla!
	HandsOff					=	"SVM_5_HandsOff"					;//Ruce od toho pryè!
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_5_YouViolatedForbiddenTerritory";//Hej! Odkud jsi pøišel?
	YouWannaFoolMe				=	"SVM_5_YouWannaFoolMe"				;//Dobrı vtip!
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Po èem tu slídíš?
	WhyAreYouInHere				=	"SVM_5_WhyYouAreInHere"				;//Kliï se odsud nebo zavolám stráe!
	WhatDidYouInThere			=	"SVM_5_WhatDidYouInThere"			;//Tady nemáš co dìlat!
	WiseMove					=	"SVM_5_WiseMove"					;//Uèíš se rychle!
	Alarm						=	"SVM_5_Alarm"						;//Stráe! Sem!
	IntruderAlert				= 	"SVM_5_IntruderAlert"				;//POZOR!!
	BehindYou					=	"SVM_5_BehindYou"					;//Dej pozor!
	TheresAFight				=	"SVM_5_TheresAFight"				;//Do boje!
	HeyHeyHey					=	"SVM_5_HeyHeyHey"					;//Dej mu!
	CheerFight					=	"SVM_5_CheerFight"					;//Dobøe!
	CheerFriend					=	"SVM_5_CheerFriend"					;//Vra mu ji!
	Ooh							=	"SVM_5_Ooh"							;//Tak dávej pozor!
	YeahWellDone				=	"SVM_5_YeahWellDone"				;//U bylo na èase!
	RunCoward					=	"SVM_5_RunCoward"					;//Ten chlapík utíká pryè!
	HeDefeatedHim				=	"SVM_5_HeDefeatedHim"				;//Jasné vítìzství, øekl bych!
	HeDeservedIt				=	"SVM_5_HeDeservedIt"				;//Zaslouil si to!
	HeKilledHim					=	"SVM_5_HeKilledHim"					;//Poøád zabíjíš lidi. Teï máš skuteènı problém!
	ItWasAGoodFight				=	"SVM_5_ItWasAGoodFight"				;//To byl ale boj!
	Awake						=	"SVM_5_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_5_FriendlyGreetings"			;//Nazdar, kamaráde!
	ALGreetings					=	"SVM_5_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_5_MageGreetings"				;//Za slávu magie!
	SectGreetings				=	"SVM_5_SectGreetings"				;//Vzbuï se!
	ThereHeIs					= 	"SVM_5_ThereHeIs"					;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_5_NoLearnNoPoints"				;//Nemùu tì nic nauèit, protoe nemáš ádné zkušenosti.
	NoLearnOverMax				= 	"SVM_5_NoLearnOverMax"				;//Jsi u konce svıch moností. Mìl by ses uèit nìco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_5_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vùdcem, musíš na sobì ještì pracovat!
	NoLearnYoureBetter			=	"SVM_5_NoLearnYoureBetter"			;//U je to s tebou lepší!
	HeyYou						=	"SVM_5_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_5_NotNow"						;//Teï ne!
	WhatDoYouWant				=	"SVM_5_WhatDoYouWant"				;//Mùu ti pomoci?
	ISaidWhatDoYouWant			=	"SVM_5_ISaidWhatDoYouWant"			;//Co chceš?
	MakeWay						=	"SVM_5_MakeWay"						;//Nech mì jít!
	OutOfMyWay					=	"SVM_5_OutOfMyWay"					;//Uhni, chci projít!
	YouDeafOrWhat				=	"SVM_5_YouDeafOrWhat"				;//Jseš hluchej nebo touíš po maléru?
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_5_LookAway"					;//NIC jsem nevidìl... Co se vlastnì stalo?
	OkayKeepIt					=	"SVM_5_OkayKeepIt"					;//Dobrá, nech si ten krám!
	WhatsThat					=	"SVM_5_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_5_ThatsMyWeapon"				;//Rád bych svou zbraò zpátky!
	GiveItToMe					=	"SVM_5_GiveItToMe"					;//Tak dej mi ji!
	YouCanKeeptheCrap			=	"SVM_5_YouCanKeeptheCrap"			;//Hm, není špatná! Sehnal jsem další!
	TheyKilledMyFriend			=	"SVM_5_TheyKilledMyFriend"			;//Dostali jednoho z našich chlapíkù. Jestli já toho lotra dostanu...
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;// Hej, co je? Proè mì budíš?
	SuckerGotSome				=	"SVM_5_SuckerGotSome"				;//Eh? Dostal jsi nakládaèku? Dobøe ti tak!
	SuckerDefeatedEBr			=	"SVM_5_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Nestaèil se divit!
	SuckerDefeatedGur			=	"SVM_5_SuckerDefeatedGur"			;//Porazil jsi jednoho z Guru. Skvìlé, ale u se o to nepokoušej znovu.
	SuckerDefeatedMage			=	"SVM_5_SuckerDefeatedMage"			;//Zvítìzit nad mágem... Musíš mít pro strach udìláno!
	SuckerDefeatedNov_Guard		= 	"SVM_5_SuckerDefeatedNov_Guard"		;//Musíš bıt šílenı, es srazil toho novice.
	SuckerDefeatedVlk_Guard		= 	"SVM_5_SuckerDefeatedVlk_Guard"		;//Co sis vlastnì myslel, e dìláš, kdy jsi zabíjel kopáèe?
	YouDefeatedMyComrade		=	"SVM_5_YouDefeatedMyComrade"		;//Srazil jsi mého pøítele, proè?
	YouDefeatedNOV_Guard		=	"SVM_5_YouDefeatedNOV_Guard"		;//Ještì jednou se dotkneš nìkterého novice a budeš litovat!
	YouDefeatedVLK_Guard		=	"SVM_5_YouDefeatedVLK_Guard"		;//Jsi pøíliš smìlı, problém s nìkterım z mıch chránìncù by pro tebe mohl znamenat nebezpeèí.
	YouStoleFromMe				=	"SVM_5_YouStoleFromMe"				;//Jak se tu opovauješ objevit, ty zlodìji?
	YouStoleFromUs				=	"SVM_5_YouStoleFromUs"				;//Máš u sebe nìco, co patøí nám. Vra nám to!
	YouStoleFromEBr				=	"SVM_5_YouStoleFromEBr"				;//Èlovìèe, tys kradl u Rudobaronù? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_5_YouStoleFromGur"				;//Okradl jsi Guru? Nemusel ses aspoò nechat chytit!
	StoleFromMage				=	"SVM_5_StoleFromMage"				;//Mágové nemají rádi lidi, co se motají kolem jejich vìcí!
	YouKilledMyFriend			=	"SVM_5_YouKilledMyFriend"			;//Máš na svìdomí jednoho z našich muù. Staèí malá chybièka a pøijde øada na tebe!
	YouKilledEBr				=	"SVM_5_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronù! Èlovìèe, úplnì ses pominul?
	YouKilledGur				=	"SVM_5_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nemùu tomu uvìøit!
	YouKilledMage				=	"SVM_5_YouKilledMage"				;//Zabil jsi jednoho z mágù! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_5_YouKilledOCfolk"				;//Jeden z èlenù Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_5_YouKilledNCfolk"				;//Novı tábor utrpìl tìkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_5_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svıch vìøících a ty ho máš na svìdomí!
	GetThingsRight				=	"SVM_5_GetThingsRight"				;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_5_YouDefeatedMeWell"			;//Poøádnì jsi mi to nandal, èlovìèe. Byl to dobrı boj! Ale teï u je konec!
	Smalltalk01					=	"SVM_5_Smalltalk01"					;// ...kdy myslíš...
	Smalltalk02					=	"SVM_5_Smalltalk02"					;// ...moná...
	Smalltalk03					=	"SVM_5_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_5_Smalltalk04"					;// ...udìlám nejlíp, kdy se budu dret dál...
	Smalltalk05					=	"SVM_5_Smalltalk05"					;// ...tohle opravdu není mùj problém...
	Smalltalk06					=	"SVM_5_Smalltalk06"					;// ...bylo jasné, e z toho bude mrzutost...
	Smalltalk07					=	"SVM_5_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vìdìt...
	Smalltalk08					=	"SVM_5_Smalltalk08"					;// ...u se to znovu nestane...
	Smalltalk09					=	"SVM_5_Smalltalk09"					;// ...a pøesto na tom musí nìco bıt...
	Smalltalk10					=	"SVM_5_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem øíkáš...
	Smalltalk11					=	"SVM_5_Smalltalk11"					;// ...jestli se mì to netıká...
	Smalltalk12					=	"SVM_5_Smalltalk12"					;// ...nemìl bys všemu vìøit...
	Smalltalk13					=	"SVM_5_Smalltalk13"					;// ...pøesto bych nechtìl bıt v jeho kùi...
	Smalltalk14					=	"SVM_5_Smalltalk14"					;// ...poøád ta samá pohádka...
	Smalltalk15					=	"SVM_5_Smalltalk15"					;// ...nìkteøí lidé se nikdy nepouèí...
	Smalltalk16					=	"SVM_5_Smalltalk16"					;// ...døíve bıvalo všechno docela jinak...
	Smalltalk17					=	"SVM_5_Smalltalk17"					;// ...lidé øíkají...
	Smalltalk18					=	"SVM_5_Smalltalk18"					;// ...takové øeèi já nikdy neposlouchám...
	Smalltalk19					=	"SVM_5_Smalltalk19"					;// ...na nìkoho se spoléháš a dostaneš se do problémù, tak to chodí...
	Smalltalk20					=	"SVM_5_Smalltalk20"					;// ...pochybuji, e by se to mohlo zmìnit...
	Smalltalk21					=	"SVM_5_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_5_Smalltalk22"					;// ...vydr. Lepší je do nièeho se nepouštìt...
	Smalltalk23					=	"SVM_5_Smalltalk23"					;// ...myslel jsem, e u je to dávno za námi...
	Smalltalk24					=	"SVM_5_Smalltalk24"					;// ...pojïme radìji mluvit o nìèem jiném...
	Om							= 	"SVM_5_Om"							;//Hmmm
};

//////////////////////////////////////////
instance SVM_6 (C_SVM)				//Raufbold	(Will saufen und raufen	(Matrose) Alkoholiker. Grölt viel)
{
	StopMagic					=	"SVM_6_StopMagic"					;//ádné èarování!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"				;//Pøestaò u s tìmi kouzly! Ihned!
	WeaponDown					=	"SVM_6_WeaponDown"					;//Dej tu zatracenou zbraò pryè!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"				;//Chceš ode mì nakládaèku? Dej tu vìc pryè!
	WatchYourAim				=	"SVM_6_WatchYourAim"				;//Dej tu vìc pryè nebo se nìco stane!
	WatchYourAimAngry			=	"SVM_6_WatchYourAimAngry"			;//Ještì jednou na mì namíøíš a dostaneš po tlamì!
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"				;//Hej! Dávej pozor!
	LetsForgetOurLittleFight	=	"SVM_6_LetsForgetOurLittleFight"	;//Hej, èlovìèe! Zapomeneme na tuhle hádku, dobrı?
	Strange						=	"SVM_6_Strange"						;//Vyjdi! Uka se!
	DieMonster					=	"SVM_6_DieMonster"					;//Nadìlám z tebe guláš, bastarde!
	DieMortalEnemy				=	"SVM_6_DieMortalEnemy"				;//To máš za to!
	NowWait						=	"SVM_6_NowWait"						;//Dostaneš jednu pøes tlamu...
	YouStillNotHaveEnough		=	"SVM_6_YouStillNotHaveEnough"		;//Jako by sis øíkal o poøádnou pøes tlamu!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Tumáš cos chtìl!
	NowWaitIntruder				= 	"SVM_6_NowWaitIntruder"				;//Rozsekám tì na madìru!
	IWillTeachYouRespectForForeignProperty	=	"SVM_6_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem tì. Jestli se dotkneš mıch vìcí, lítáš v prùšvihu!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Zlodìji! Tohle bude tvùj konec!
	YouAttackedMyCharge			=	"SVM_6_YouAttackedMyCharge"			;//Mıch chlapù se nikdo nedotkne!
	YouKilledOneOfUs			=	"SVM_6_YouKilledOneOfUs"			;//Zabil jsi jednoho z mıch chlapù. Teï zabiju já TEBE!
	Dead						=	"SVM_6_Dead"						;//Aaargl
	Aargh_1						=	"SVM_6_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_6_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_6_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_6_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_6_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_6_YesYes"						;//Dobrá, dobrá! Klid, vyhrál jsi!
	ShitWhatAMonster			=	"SVM_6_ShitWhatAMonster"			;//K èertu, taková bestie! Utíkej jak nejrychleji umíš!
	Help						=	"SVM_6_Help"						;//K èertu!
	WeWillMeetAgain				=	"SVM_6_WeWillMeetAgain"				;//Ještì mì poznáš!
	NeverTryThatAgain			=	"SVM_6_NeverTryThatAgain"			;//Ještì jednou to zkus a budeš litovat!
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"				;//Ta zbraò vypadá dobøe!
	ITookYourOre				=	"SVM_6_ITookYourOre"				;//Díky za rudu, pøipíjím na tebe!
	ShitNoOre					=	"SVM_6_ShitNoOre"					;//Sakra, u nemá ani kousek rudy...
	HandsOff					=	"SVM_6_HandsOff"					;//Ruce od toho pryè!
	GetOutOfHere				=	"SVM_6_GetOutOfHere"				;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_6_YouViolatedForbiddenTerritory";//Hej! Odkud si pøišel?
	YouWannaFoolMe				=	"SVM_6_YouWannaFoolMe"				;//Myslíš si, e jsem úplnì hloupı?
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"		;//Hej! Po èem tu slídíš?
	WhyAreYouInHere				=	"SVM_6_WhyYouAreInHere"				;//Kliï se odsud nebo zavolám stráe!
	WhatDidYouInThere			=	"SVM_6_WhatDidYouInThere"			;//Cos tady dìlal?
	WiseMove					=	"SVM_6_WiseMove"					;//To bylo štìstí!
	Alarm						=	"SVM_6_Alarm"						;//Stráe! Sem!
	IntruderAlert				= 	"SVM_6_IntruderAlert"				;//POZOR!!! VETØELEC!!!
	BehindYou					=	"SVM_6_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_6_TheresAFight"				;//Do boje!
	HeyHeyHey					=	"SVM_6_HeyHeyHey"					;//Poøádnì!
	CheerFight					=	"SVM_6_CheerFight"					;//Biješ se jak enská!
	CheerFriend					=	"SVM_6_CheerFriend"					;//Dora ho!
	Ooh							=	"SVM_6_Ooh"							;//Nepárej se s ním! Dej mu pøes tlamu!
	YeahWellDone				=	"SVM_6_YeahWellDone"				;//Dej mu! Ještì se hıbe!
	RunCoward					=	"SVM_6_RunCoward"					;//Vra se, zbabìlèe!
	HeDefeatedHim				=	"SVM_6_HeDefeatedHim"				;//Ten má dost!
	HeDeservedIt				=	"SVM_6_HeDeservedIt"				;//Zaslouil si to!
	HeKilledHim					=	"SVM_6_HeKilledHim"					;//Jsi jako samotná smrt! Ta tì nauèí takhle zabíjet!
	ItWasAGoodFight				=	"SVM_6_ItWasAGoodFight"				;//Ha ha ha! Dobøe jsi mu to ukázal!
	Awake						=	"SVM_6_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_6_FriendlyGreetings"			;//Nazdar!
	ALGreetings					=	"SVM_6_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_6_MageGreetings"				;//Za slávu magie!
	SectGreetings				=	"SVM_6_SectGreetings"				;//Vzbuï se!
	ThereHeIs					= 	"SVM_6_ThereHeIs"					;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_6_NoLearnNoPoints"				;//Nemùu tì nic nauèit. Nemáš dost zkušeností.
	NoLearnOverMax				= 	"SVM_6_NoLearnOverMax"				;//Jsi u konce svıch moností. Mìl by ses uèit nìco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_6_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vùdcem, musíš na sobì ještì pracovat!
	NoLearnYoureBetter			=	"SVM_6_NoLearnYoureBetter"			;//U je to s tebou lepší!
	HeyYou						=	"SVM_6_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_6_NotNow"						;//Teï ne!
	WhatDoYouWant				=	"SVM_6_WhatDoYouWant"				;//Co chceš?
	ISaidWhatDoYouWant			=	"SVM_6_ISaidWhatDoYouWant"			;//Bylo tam nìco, cos chtìl?
	MakeWay						=	"SVM_6_MakeWay"						;//Nech mì jít!
	OutOfMyWay					=	"SVM_6_OutOfMyWay"					;//Tak uhni!
	YouDeafOrWhat				=	"SVM_6_YouDeafOrWhat"				;//Kliï se! Nebo chceš, abych ti to vrazil do mozku?
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"		;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_6_LookAway"					;//Nic jsem nevidìl! Opravdu nic!
	OkayKeepIt					=	"SVM_6_OkayKeepIt"					;//Dobrá, nech si ten krám!
	WhatsThat					=	"SVM_6_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_6_ThatsMyWeapon"				;//Vra mi zbraò, ty šašku!
	GiveItToMe					=	"SVM_6_GiveItToMe"					;//Tak dej mi ji, èlovìèe!
	YouCanKeeptheCrap			=	"SVM_6_YouCanKeeptheCrap"			;//Nevadí! Stejnì ji u nebudu potøebovat!
	TheyKilledMyFriend			=	"SVM_6_TheyKilledMyFriend"			;//Dostali jednoho z našich chlapíkù. Jestli já toho lotra dostanu...
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"		;//Sakra, proè mì budíš?
	SuckerGotSome				=	"SVM_6_SuckerGotSome"				;//Dostal jsi nakládaèku? Dobøe ti tak!
	SuckerDefeatedEBr			=	"SVM_6_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Má na tebe opravdu vztek!
	SuckerDefeatedGur			=	"SVM_6_SuckerDefeatedGur"			;//Porazil jsi Guru. Pøitahuješ problémy jako magnet!
	SuckerDefeatedMage			=	"SVM_6_SuckerDefeatedMage"			;//Zvítìzit nad mágem je opravdu šílenı nápad, èlovìèe!
	SuckerDefeatedNov_Guard		= 	"SVM_6_SuckerDefeatedNov_Guard"		;//Nemùeš se tu potloukat a takhle mlátit novice!
	SuckerDefeatedVlk_Guard		= 	"SVM_6_SuckerDefeatedVlk_Guard"		;//Nech mé chlapy na pokoji!
	YouDefeatedMyComrade		=	"SVM_6_YouDefeatedMyComrade"		;//Odrovnal jsi mého kamaráda...
	YouDefeatedNOV_Guard		=	"SVM_6_YouDefeatedNOV_Guard"		;//Nebudeš tu dìlat problémy!
	YouDefeatedVLK_Guard		=	"SVM_6_YouDefeatedVLK_Guard"		;//Jestli vztáhneš ruku na nìkoho, kdo je pod mojí ochranou, tak si to schytáš!
	YouStoleFromMe				=	"SVM_6_YouStoleFromMe"				;//Seš mi ukradenej, ty zmetku! U to znovu nezkoušej!
	YouStoleFromUs				=	"SVM_6_YouStoleFromUs"				;//Chceme naše vìci zpátky! Vra nám je!
	YouStoleFromEBr				=	"SVM_6_YouStoleFromEBr"				;//Kradl jsi u Rudobaronù? Probùh, proè?
	YouStoleFromGur				=	"SVM_6_YouStoleFromGur"				;//Okradl jsi Guru? Jaká škoda, e tì nachytali!
	StoleFromMage				=	"SVM_6_StoleFromMage"				;//Kradl jsi u mágù! Jak stupidní nápad!
	YouKilledMyFriend			=	"SVM_6_YouKilledMyFriend"			;//Jeden z našich lidí zemøel a ty s tím máš co do èinìní! Staèí malá chybièka a pùjdeš za ním!
	YouKilledEBr				=	"SVM_6_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronù! Èlovìèe, úplnì ses pominul?
	YouKilledGur				=	"SVM_6_YouKilledGur"				;//Zabil jsi jednoho z Guru! Tomu, hochu, nemùu uvìøit!
	YouKilledMage				=	"SVM_6_YouKilledMage"				;//Zabil jsi jednoho z mágù! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_6_YouKilledOCfolk"				;//Jeden z èlenù Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_6_YouKilledNCfolk"				;//Novı tábor utrpìl tìkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_6_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svıch vìøících a ty ho máš na svìdomí!
	GetThingsRight				=	"SVM_6_GetThingsRight"				;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_6_YouDefeatedMeWell"			;//Poøádnì jsi mi to nandal, èlovìèe. Byl to dobrı boj! Ale teï u je konec!
	Smalltalk01					=	"SVM_6_Smalltalk01"					;// ...nejhorší špína...
	Smalltalk02					=	"SVM_6_Smalltalk02"					;// ...moná, ale koho to zajímá?
	Smalltalk03					=	"SVM_6_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_6_Smalltalk04"					;// ...udìlám nejlíp, kdy se budu dret dál...
	Smalltalk05					=	"SVM_6_Smalltalk05"					;// ...tohle opravdu není mùj problém...
	Smalltalk06					=	"SVM_6_Smalltalk06"					;// ...bylo jasné, e z toho bude mrzutost...
	Smalltalk07					=	"SVM_6_Smalltalk07"					;// ...proè se to dìlo poøád dál...
	Smalltalk08					=	"SVM_6_Smalltalk08"					;// ...u se to znovu nestane...
	Smalltalk09					=	"SVM_6_Smalltalk09"					;// ...a pøesto na tom musí nìco bıt...
	Smalltalk10					=	"SVM_6_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem øíkáš...
	Smalltalk11					=	"SVM_6_Smalltalk11"					;// ...jestli se mì to netıká...
	Smalltalk12					=	"SVM_6_Smalltalk12"					;// ...nemìl bys všemu vìøit...
	Smalltalk13					=	"SVM_6_Smalltalk13"					;// ...pøesto bych nechtìl bıt v jeho kùi...
	Smalltalk14					=	"SVM_6_Smalltalk14"					;// ...poøád ta samá pohádka...
	Smalltalk15					=	"SVM_6_Smalltalk15"					;// ...nìkteøí lidé se nikdy nepouèí...
	Smalltalk16					=	"SVM_6_Smalltalk16"					;// ...døíve bıvalo všechno docela jinak...
	Smalltalk17					=	"SVM_6_Smalltalk17"					;// ...lidé øíkají...
	Smalltalk18					=	"SVM_6_Smalltalk18"					;// ...takové øeèi já nikdy neposlouchám...
	Smalltalk19					=	"SVM_6_Smalltalk19"					;// ...na nìkoho se spoléháš a dostaneš se do problémù, tak to chodí...
	Smalltalk20					=	"SVM_6_Smalltalk20"					;// ...pochybuji, e by se to mohlo zmìnit...
	Smalltalk21					=	"SVM_6_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_6_Smalltalk22"					;// ...vydr. Lepší je do nièeho se nepouštìt...
	Smalltalk23					=	"SVM_6_Smalltalk23"					;// ...myslel jsem, e u je to dávno za námi...
	Smalltalk24					=	"SVM_6_Smalltalk24"					;// ...pojïme radìji mluvit o nìèem jiném...
	Om							= 	"SVM_6_Om"							;//Hmmm
};

//////////////////////////////////////////
instance SVM_7 (C_SVM)				//Freak, Aggressiv. Spielt mit seiner Macht. Sadist. Org: Abschaum, den im AL keiner wollte. Nov (selten): Durchgeknallter Abschaum.
{
	StopMagic					=	"SVM_7_StopMagic"					;//Dej to pryè! Dej to pryè!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"				;//Pøestaò s tìmi kouzly, dej to pryè!
	WeaponDown					=	"SVM_7_WeaponDown"					;//Dej tu zbraò pryè, dej jí pryè!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"				;//Myslím to vánì! Pryè s ní!
	WatchYourAim				=	"SVM_7_WatchYourAim"				;//Míøíš na mì? Dej si pozor!
	WatchYourAimAngry			=	"SVM_7_WatchYourAimAngry"			;//Myslíš, e se tì leknu? Jak chceš!
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"				;//Tohle si zapamatuju! Dej si pozor!
	LetsForgetOurLittleFight	=	"SVM_7_LetsForgetOurLittleFight"	;//Zapomeneme na to, dobrá?
	Strange						=	"SVM_7_Strange"						;//Kam se podìl? To není moné!
	DieMonster					=	"SVM_7_DieMonster"					;//Rozsekám tì, lotøe!
	DieMortalEnemy				=	"SVM_7_DieMortalEnemy"				;//Dostanu tì! Teï na tebe došla øada! ádné slitování!
	NowWait						=	"SVM_7_NowWait"						;//Koneènì jsi mi dal dùvod!
	YouStillNotHaveEnough		=	"SVM_7_YouStillNotHaveEnough"		;//U to nemáš chu zkusit podruhé, viï?
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Krev! Tvoje krev!
	NowWaitIntruder				= 	"SVM_7_NowWaitIntruder"				;//Rozpáøu tì na cáry!
	IWillTeachYouRespectForForeignProperty	=	"SVM_7_IWillTeachYouRespectForForeignProperty"	;//Mìl bych ti usekat prsty!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Ty všivej zlodìji! Chci tì vidìt, jak trpíš!
	YouAttackedMyCharge			=	"SVM_7_YouAttackedMyCharge"			;//Na moje chlapy si kromì mì nikdo vyskakovat nebude!
	YouKilledOneOfUs			=	"SVM_7_YouKilledOneOfUs"			;//Zabil jsi jednoho z nás!
	Dead						=	"SVM_7_Dead"						;//Aaargl
	Aargh_1						=	"SVM_7_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_7_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_7_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_7_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_7_YoullBeSorryForThis"			;//Nebudeš mít ani èas toho litovat!
	YesYes						=	"SVM_7_YesYes"						;//Dobøe, dobøe!
	ShitWhatAMonster			=	"SVM_7_ShitWhatAMonster"			;//Nemám tu správnou zbraò. Ještì se uvidíme...
	Help						=	"SVM_7_Help"						;//K èertu!
	WeWillMeetAgain				=	"SVM_7_WeWillMeetAgain"				;//Ještì se uvidíme!
	NeverTryThatAgain			=	"SVM_7_NeverTryThatAgain"			;//U to znova nezkoušej!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"				;//Tuhle zbraò si vezmu!
	ITookYourOre				=	"SVM_7_ITookYourOre"				;//Radši bych tì zabil, ta ruda ale není špatná!
	ShitNoOre					=	"SVM_7_ShitNoOre"					;//Ty nemáš ádnou rudu? Seš nicotná veš!
	HandsOff					=	"SVM_7_HandsOff"					;//Ruce od toho pryè!
	GetOutOfHere				=	"SVM_7_GetOutOfHere"				;//Vypadni odsud! Ven!
	YouViolatedForbiddenTerritory=	"SVM_7_YouViolatedForbiddenTerritory";//Jak ses sem dostal?
	YouWannaFoolMe				=	"SVM_7_YouWannaFoolMe"				;//Snaíš se mì pøechytraèit, co?
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"		;//Hej ty! Co tady pohledáváš?
	WhyAreYouInHere				=	"SVM_7_WhyYouAreInHere"				;//Vypadni odsud nebo zavolám stráe!
	WhatDidYouInThere			=	"SVM_7_WhatDidYouInThere"			;//Tady nemáš co dìlat!
	WiseMove					=	"SVM_7_WiseMove"					;//Máš štìstí! Mìl jsem chu ti rozmlátit tlamu!
	Alarm						=	"SVM_7_Alarm"						;//Stráe! Sem!
	IntruderAlert				= 	"SVM_7_IntruderAlert"				;//POZOR!!
	BehindYou					=	"SVM_7_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_7_TheresAFight"				;//Do boje!
	HeyHeyHey					=	"SVM_7_HeyHeyHey"					;//Poøádnì!
	CheerFight					=	"SVM_7_CheerFight"					;//Chci vidìt krev!
	CheerFriend					=	"SVM_7_CheerFriend"					;//Vyøiï ho!
	Ooh							=	"SVM_7_Ooh"							;//Vra mu to, idiote!
	YeahWellDone				=	"SVM_7_YeahWellDone"				;//Uaaah!!!!!!
	RunCoward					=	"SVM_7_RunCoward"					;//Uaaah!!!!!!
	HeDefeatedHim				=	"SVM_7_HeDefeatedHim"				;//Ten má dost!
	HeDeservedIt				=	"SVM_7_HeDeservedIt"				;//Jeho chyba!
	HeKilledHim					=	"SVM_7_HeKilledHim"					;//Zabít nìkoho pøed svìdky je sebevrada!
	ItWasAGoodFight				=	"SVM_7_ItWasAGoodFight"				;//Skvìlı boj!
	Awake						=	"SVM_7_Awake"						;//Je èas dát se dál!
	FriendlyGreetings			=	"SVM_7_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_7_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_7_MageGreetings"				;//Za slávu magie
	SectGreetings				=	"SVM_7_SectGreetings"				;//Probuï se!
	ThereHeIs					= 	"SVM_7_ThereHeIs"					;//Jsi slepı? Támhle!
	NoLearnNoPoints				= 	"SVM_7_NoLearnNoPoints"				;//Nemùu tì nic nauèit. Nemáš dost zkušeností.
	NoLearnOverMax				= 	"SVM_7_NoLearnOverMax"				;//Jsi u konce svıch moností. Mìl by ses uèit nìco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_7_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vùdcem, musíš na sobì ještì pracovat!
	NoLearnYoureBetter			=	"SVM_7_NoLearnYoureBetter"			;//U je to s tebou lepší!
	HeyYou						=	"SVM_7_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_7_NotNow"						;//Teï ne!
	WhatDoYouWant				=	"SVM_7_WhatDoYouWant"				;//Co ode mì chceš?
	ISaidWhatDoYouWant			=	"SVM_7_ISaidWhatDoYouWant"			;//Mùu pro tebe nìco udìlat?
	MakeWay						=	"SVM_7_MakeWay"						;//Nech mì jít!
	OutOfMyWay					=	"SVM_7_OutOfMyWay"					;//Uhni mi z cesty!
	YouDeafOrWhat				=	"SVM_7_YouDeafOrWhat"				;//Chceš mít problémy? Kliï se odsud!
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"		;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_7_LookAway"					;//NIC jsem nevidìl!
	OkayKeepIt					=	"SVM_7_OkayKeepIt"					;//Dobrá! Je tvoje!
	WhatsThat					=	"SVM_7_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_7_ThatsMyWeapon"				;//Vra mi mou zbraò!
	GiveItToMe					=	"SVM_7_GiveItToMe"					;//Vra mi ji!
	YouCanKeeptheCrap			=	"SVM_7_YouCanKeeptheCrap"			;//Dobøe! Nech si ji! Vyøeším to jinak!
	TheyKilledMyFriend			=	"SVM_7_TheyKilledMyFriend"			;//Jeden z nás je mrtev! To si zasluhuje odplatu!
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"		;//Proè jsi mì vzbudil?
	SuckerGotSome				=	"SVM_7_SuckerGotSome"				;//Dostal jsi nakládaèku, o kterou sis koledoval!
	SuckerDefeatedEBr			=	"SVM_7_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Má na tebe vztek!
	SuckerDefeatedGur			=	"SVM_7_SuckerDefeatedGur"			;//Porazil jsi Guru. Pøitahuješ problémy jako magnet!
	SuckerDefeatedMage			=	"SVM_7_SuckerDefeatedMage"			;//Zvítìzit nad mágem, to je šílenı nápad!
	SuckerDefeatedNov_Guard		= 	"SVM_7_SuckerDefeatedNov_Guard"		;//Tak ty jsi ten, co mlátí novice!
	SuckerDefeatedVlk_Guard		= 	"SVM_7_SuckerDefeatedVlk_Guard"		;//Nech mé chlapy na pokoji!
	YouDefeatedMyComrade		=	"SVM_7_YouDefeatedMyComrade"		;//Odrovnal jsi, koho jsi nemìl! Táhneme tu za jeden provaz!
	YouDefeatedNOV_Guard		=	"SVM_7_YouDefeatedNOV_Guard"		;//Nebudeš tu dìlat problémy!
	YouDefeatedVLK_Guard		=	"SVM_7_YouDefeatedVLK_Guard"		;//Jestli vztáhneš ruku na nìkoho, kdo je pod mojí ochranou, tak si to schytáš!
	YouStoleFromMe				=	"SVM_7_YouStoleFromMe"				;//Seš mi ukradenej, ty zmetku! U to znovu nezkoušej!
	YouStoleFromUs				=	"SVM_7_YouStoleFromUs"				;//Chceme naše vìci zpátky! Vra nám je!
	YouStoleFromEBr				=	"SVM_7_YouStoleFromEBr"				;//Kradl jsi u Rudobaronù? Probùh, proè?
	YouStoleFromGur				=	"SVM_7_YouStoleFromGur"				;//Okradl jsi Guru? Jaká škoda, e tì nachytali!
	StoleFromMage				=	"SVM_7_StoleFromMage"				;//Kradl jsi u mágù! Jak stupidní nápad!
	YouKilledMyFriend			=	"SVM_7_YouKilledMyFriend"			;//Jeden z našich lidí zemøel a ty s tím máš co do èinìní! Staèí malá chybièka a pùjdeš za ním!
	YouKilledEBr				=	"SVM_7_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronù! Èlovìèe, úplnì ses pominul?
	YouKilledGur				=	"SVM_7_YouKilledGur"				;//Zabil jsi jednoho z Guru! Tomu, hochu, nemùu uvìøit!
	YouKilledMage				=	"SVM_7_YouKilledMage"				;//Zabil jsi jednoho z mágù! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_7_YouKilledOCfolk"				;//Jeden z èlenù Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_7_YouKilledNCfolk"				;//Novı tábor utrpìl tìkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_7_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svıch vìøících a ty ho máš na svìdomí!
	GetThingsRight				=	"SVM_7_GetThingsRight"				;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_7_YouDefeatedMeWell"			;//Poøádnì jsi mi to nandal, èlovìèe. Byl to dobrı boj! Ale teï u je konec!
	Smalltalk01					=	"SVM_7_Smalltalk01"					;// ...kdy myslíš...
	Smalltalk02					=	"SVM_7_Smalltalk02"					;// ...moná...
	Smalltalk03					=	"SVM_7_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_7_Smalltalk04"					;// ...udìlám nejlíp, kdy se budu dret dál...
	Smalltalk05					=	"SVM_7_Smalltalk05"					;// ...tohle opravdu není mùj problém...
	Smalltalk06					=	"SVM_7_Smalltalk06"					;// ...bylo jasné, e z toho bude mrzutost...
	Smalltalk07					=	"SVM_7_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vìdìt...
	Smalltalk08					=	"SVM_7_Smalltalk08"					;// ...u se to znovu nestane...
	Smalltalk09					=	"SVM_7_Smalltalk09"					;// ...a pøesto na tom musí nìco bıt...
	Smalltalk10					=	"SVM_7_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem øíkáš...
	Smalltalk11					=	"SVM_7_Smalltalk11"					;// ...jestli se mì to netıká...
	Smalltalk12					=	"SVM_7_Smalltalk12"					;// ...nemìl bys všemu vìøit...
	Smalltalk13					=	"SVM_7_Smalltalk13"					;// ...pøesto bych nechtìl bıt v jeho kùi...
	Smalltalk14					=	"SVM_7_Smalltalk14"					;// ...poøád ta samá pohádka...
	Smalltalk15					=	"SVM_7_Smalltalk15"					;// ...nìkteøí lidé se nikdy nepouèí...
	Smalltalk16					=	"SVM_7_Smalltalk16"					;// ...døíve bıvalo všechno docela jinak...
	Smalltalk17					=	"SVM_7_Smalltalk17"					;// ...lidé øíkají...
	Smalltalk18					=	"SVM_7_Smalltalk18"					;// ...takové øeèi já nikdy neposlouchám...
	Smalltalk19					=	"SVM_7_Smalltalk19"					;// ...na nìkoho se spoléháš a dostaneš se do problémù, tak to chodí...
	Smalltalk20					=	"SVM_7_Smalltalk20"					;// ...pochybuji, e by se to mohlo zmìnit...
	Smalltalk21					=	"SVM_7_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_7_Smalltalk22"					;// ...vydr. Lepší je do nièeho se nepouštìt...
	Smalltalk23					=	"SVM_7_Smalltalk23"					;// ...myslel jsem, e u je to dávno za námi...
	Smalltalk24					=	"SVM_7_Smalltalk24"					;// ...pojïme radìji mluvit o nìèem jiném...
	Om							= 	"SVM_7_Om"							;//Hmmm
};

//////////////////////////////////////////
instance SVM_8 (C_SVM)				// Elite-Garde. Ultra-cool. Pflichtbewusst, ernst, nüchtern! Klare Stimme
{
	StopMagic					=	"SVM_8_StopMagic"					;//Nezkoušej tady ádné èáry!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"				;//Pøestaò u s tím! Ihned!
	WeaponDown					=	"SVM_8_WeaponDown"					;//Polo tu zbraò!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"				;//Dej tu vìc pryè nebo to schytáš!
	WatchYourAim				=	"SVM_8_WatchYourAim"				;//Dej tu zbraò pryè, idiote!
	WatchYourAimAngry			=	"SVM_8_WatchYourAimAngry"			;//Ty se na mì odvauješ míøit?
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"				;//Dávej pozor!
	LetsForgetOurLittleFight	=	"SVM_8_LetsForgetOurLittleFight"	;//Dobrá, zapomeneme na tohle malé nedorozumìní.
	Strange						=	"SVM_8_Strange"						;//Uka se! Vím, e mì slyšíš!
	DieMonster					=	"SVM_8_DieMonster"					;//Prašivé bestie!
	DieMortalEnemy				=	"SVM_8_DieMortalEnemy"				;//Teï zemøeš! Neber si to osobnì!
	NowWait						=	"SVM_8_NowWait"						;//Tys MÌ napadl, èerve! Jen poèkej...
	YouStillNotHaveEnough		=	"SVM_8_YouStillNotHaveEnough"		;//Nezašlapal jsem tì u jednou do prachu? Tak si to zopakujeme...
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Kdy neposloucháš, tak si to vyzkoušíš na vlastní kùi!
	NowWaitIntruder				= 	"SVM_8_NowWaitIntruder"				;//Jak ses SEM opováil? Poèkej za moment!
	IWillTeachYouRespectForForeignProperty	=	"SVM_8_IWillTeachYouRespectForForeignProperty"	;//Asi tì budu muset praštit pøes prsty.
	DirtyThief					=	"SVM_8_DirtyThief"					;//Tak tohles krást nemìl!
	YouAttackedMyCharge			=	"SVM_8_YouAttackedMyCharge"			;//Není nikdo, kdo by mìl problém s mımi lidmi a pak toho nelitoval!
	YouKilledOneOfUs			=	"SVM_8_YouKilledOneOfUs"			;//Zabil jsi jednoho z nás! To byl tvùj poslední omyl!
	Dead						=	"SVM_8_Dead"						;//Aaargl
	Aargh_1						=	"SVM_8_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_8_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_8_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_8_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_8_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_8_YesYes"						;//Dobrá! Všechno je v poøádku!
	ShitWhatAMonster			=	"SVM_8_ShitWhatAMonster"			;//Mìl jsem se od té bestie dret radìji dál!
	Help						=	"SVM_8_Help"						;//Rychle odsud!
	WeWillMeetAgain				=	"SVM_8_WeWillMeetAgain"				;//Ještì se uvidíme!
	NeverTryThatAgain			=	"SVM_8_NeverTryThatAgain"			;//Ještì jednou to zkusíš a jsi mrtvej!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"				;//Dobrá zbraò!
	ITookYourOre				=	"SVM_8_ITookYourOre"				;//Mám dojem, es mi ještì nezaplatil daò z rudy!
	ShitNoOre					=	"SVM_8_ShitNoOre"					;//Uboák, jako jsi ty, samozøejmì nemá ádnou rudu!
	HandsOff					=	"SVM_8_HandsOff"					;//Ruce od toho pryè!
	GetOutOfHere				=	"SVM_8_GetOutOfHere"				;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_8_YouViolatedForbiddenTerritory";//Hej! Kde TY ses tu vzal?
	YouWannaFoolMe				=	"SVM_8_YouWannaFoolMe"				;//Ty jsi opravdu vykutálenej otrava, co?
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"		;//Hej, ty! Po èem tu poøád slídíš?
	WhyAreYouInHere				=	"SVM_8_WhyYouAreInHere"				;//Kliï se odsud nebo zavolám stráe!
	WhatDidYouInThere			=	"SVM_8_WhatDidYouInThere"			;//Po èem jsi sem pøišel slídit?
	WiseMove					=	"SVM_8_WiseMove"					;//Mìls štìstí!
	Alarm						=	"SVM_8_Alarm"						;//Stráe! Sem!
	IntruderAlert				= 	"SVM_8_IntruderAlert"				;//VETØELEC!!
	BehindYou					=	"SVM_8_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_8_TheresAFight"				;//Podívejme, kdo se to tu bije!
	HeyHeyHey					=	"SVM_8_HeyHeyHey"					;//Poøádnì!
	CheerFight					=	"SVM_8_CheerFight"					;//Tak pojï, pojï!
	CheerFriend					=	"SVM_8_CheerFriend"					;//Dobøe! Nepolevuj!
	Ooh							=	"SVM_8_Ooh"							;//Nepárej se s ním! Dej mu poøádnou po tlamì!
	YeahWellDone				=	"SVM_8_YeahWellDone"				;//Dej mu! Ještì se hıbe!
	RunCoward					=	"SVM_8_RunCoward"					;//U se tu nikdy neukazuj!
	HeDefeatedHim				=	"SVM_8_HeDefeatedHim"				;//Nudnı boj!
	HeDeservedIt				=	"SVM_8_HeDeservedIt"				;//Ukázals mu to!
	HeKilledHim					=	"SVM_8_HeKilledHim"					;//To nebylo nutné. Poneseš za to následky.
	ItWasAGoodFight				=	"SVM_8_ItWasAGoodFight"				;//Byl to dobrı boj!
	Awake						=	"SVM_8_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_8_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_8_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_8_MageGreetings"				;//Za slávu magie!
	SectGreetings				=	"SVM_8_SectGreetings"				;//Vzbuï se!
	ThereHeIs					= 	"SVM_8_ThereHeIs"					;//Támhle je.
	NoLearnNoPoints				= 	"SVM_8_NoLearnNoPoints"				;//Nemùu tì nic nauèit. Nemáš dost zkušeností.
	NoLearnOverMax				= 	"SVM_8_NoLearnOverMax"				;//Jsi u konce svıch moností. Mìl by ses uèit nìco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_8_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vùdcem, musíš na sobì ještì pracovat!
	NoLearnYoureBetter			=	"SVM_8_NoLearnYoureBetter"			;//U je to s tebou lepší ne tehdy!
	HeyYou						=	"SVM_8_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_8_NotNow"						;//Teï ne!
	WhatDoYouWant				=	"SVM_8_WhatDoYouWant"				;//Co chceš?
	ISaidWhatDoYouWant			=	"SVM_8_ISaidWhatDoYouWant"			;//Mùu pro tebe nìco udìlat?
	MakeWay						=	"SVM_8_MakeWay"						;//Mùu tudy projít?
	OutOfMyWay					=	"SVM_8_OutOfMyWay"					;//Tak uhni!
	YouDeafOrWhat				=	"SVM_8_YouDeafOrWhat"				;//Kliï se! Nebo chceš, abych ti to vrazil do mozku? Vypadni odsud!
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"		;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_8_LookAway"					;//Ehm... Opravdu pìknı pohled!
	OkayKeepIt					=	"SVM_8_OkayKeepIt"					;//Dobrá, je tvoje!
	WhatsThat					=	"SVM_8_WhatsThat"					;//Ha? Co to bylo?
	ThatsMyWeapon				=	"SVM_8_ThatsMyWeapon"				;//Ty nosíš moji zbraò...?
	GiveItToMe					=	"SVM_8_GiveItToMe"					;//Tak dej mi ji, ihned!
	YouCanKeeptheCrap			=	"SVM_8_YouCanKeeptheCrap"			;//Nech si ji, stejnì ji u nebudu potøebovat!
	TheyKilledMyFriend			=	"SVM_8_TheyKilledMyFriend"			;//Dostali jednoho z našich chlapíkù. Jestli já toho lotra dostanu...
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"		;//Co se dìje?
	SuckerGotSome				=	"SVM_8_SuckerGotSome"				;//Eh? Dostal jsi nakládaèku? Dobøe ti tak!
	SuckerDefeatedEBr			=	"SVM_8_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Nestaèil se divit!
	SuckerDefeatedGur			=	"SVM_8_SuckerDefeatedGur"			;//Porazil jsi jednoho z Guru. Skvìlé, ale u se o to nepokoušej znovu.
	SuckerDefeatedMage			=	"SVM_8_SuckerDefeatedMage"			;//Zvítìzit nad mágem... Musíš mít pro strach udìláno!
	SuckerDefeatedNov_Guard		= 	"SVM_8_SuckerDefeatedNov_Guard"		;//Víš, e tihle novicové jsou pod mojí ochranou. A pøesto na nì poøád doráíš!
	SuckerDefeatedVlk_Guard		= 	"SVM_8_SuckerDefeatedVlk_Guard"		;//Jestli se dotkneš kopáèù, jako bys sahal na moje pøíjmy!
	YouDefeatedMyComrade		=	"SVM_8_YouDefeatedMyComrade"		;//Nemìl by ses zaplétat s mımi pøáteli.
	YouDefeatedNOV_Guard		=	"SVM_8_YouDefeatedNOV_Guard"		;//Ještì jednou se dotkneš nìkterého novice a budeš litovat!
	YouDefeatedVLK_Guard		=	"SVM_8_YouDefeatedVLK_Guard"		;//Jestli se pustíš do nìkterého z mıch chránìncù, mohlo by tì to stát hlavu!
	YouStoleFromMe				=	"SVM_8_YouStoleFromMe"				;//Jak se tu opovauješ objevit, ty zlodìji?
	YouStoleFromUs				=	"SVM_8_YouStoleFromUs"				;//Máš u sebe nìco, co patøí nám. Vra nám to!
	YouStoleFromEBr				=	"SVM_8_YouStoleFromEBr"				;//Èlovìèe, tys kradl u Rudobaronù? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_8_YouStoleFromGur"				;//Okradl jsi Guru o pár vìcí, viï?
	StoleFromMage				=	"SVM_8_StoleFromMage"				;//Okradl jsi mágy o pár vìcí, viï?
	YouKilledMyFriend			=	"SVM_8_YouKilledMyFriend"			;//Máš na svìdomí jednoho z našich muù. Staèí malá chybièka a pøijde øada na tebe!
	YouKilledEBr				=	"SVM_8_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronù! Èlovìèe, úplnì ses pominul?
	YouKilledGur				=	"SVM_8_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nemùu tomu uvìøit!
	YouKilledMage				=	"SVM_8_YouKilledMage"				;//Zabil jsi jednoho z mágù! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_8_YouKilledOCfolk"				;//Jeden z èlenù Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_8_YouKilledNCfolk"				;//Novı tábor utrpìl tìkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_8_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svıch vìøících a ty ho máš na svìdomí!
	GetThingsRight				=	"SVM_8_GetThingsRight"				;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_8_YouDefeatedMeWell"			;//Poøádnì jsi mi to nandal, èlovìèe. Byl to dobrı boj! Ale teï u je konec!
	Smalltalk01					=	"SVM_8_Smalltalk01"					;// ...kdy myslíš...
	Smalltalk02					=	"SVM_8_Smalltalk02"					;// ...moná...
	Smalltalk03					=	"SVM_8_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_8_Smalltalk04"					;// ...udìlám nejlíp, kdy se budu dret dál...
	Smalltalk05					=	"SVM_8_Smalltalk05"					;// ...tohle opravdu není mùj problém...
	Smalltalk06					=	"SVM_8_Smalltalk06"					;// ...bylo jasné, e z toho bude mrzutost...
	Smalltalk07					=	"SVM_8_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vìdìt...
	Smalltalk08					=	"SVM_8_Smalltalk08"					;// ...u se to znovu nestane...
	Smalltalk09					=	"SVM_8_Smalltalk09"					;// ...a pøesto na tom musí nìco bıt...
	Smalltalk10					=	"SVM_8_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem øíkáš...
	Smalltalk11					=	"SVM_8_Smalltalk11"					;// ...jestli se mì to netıká...
	Smalltalk12					=	"SVM_8_Smalltalk12"					;// ...nemìl bys všemu vìøit...
	Smalltalk13					=	"SVM_8_Smalltalk13"					;// ...pøesto bych nechtìl bıt v jeho kùi...
	Smalltalk14					=	"SVM_8_Smalltalk14"					;// ...poøád ta samá pohádka...
	Smalltalk15					=	"SVM_8_Smalltalk15"					;// ...nìkteøí lidé se nikdy nepouèí...
	Smalltalk16					=	"SVM_8_Smalltalk16"					;// ...døíve bıvalo všechno docela jinak...
	Smalltalk17					=	"SVM_8_Smalltalk17"					;// ...lidé øíkají...
	Smalltalk18					=	"SVM_8_Smalltalk18"					;// ...takové øeèi já nikdy neposlouchám...
	Smalltalk19					=	"SVM_8_Smalltalk19"					;// ...na nìkoho se spoléháš a dostaneš se do problémù, tak to chodí...
	Smalltalk20					=	"SVM_8_Smalltalk20"					;// ...pochybuji, e by se to mohlo zmìnit...
	Smalltalk21					=	"SVM_8_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_8_Smalltalk22"					;// ...vydr. Lepší je do nièeho se nepouštìt...
	Smalltalk23					=	"SVM_8_Smalltalk23"					;// ...myslel jsem, e u je to dávno za námi...
	Smalltalk24					=	"SVM_8_Smalltalk24"					;// ...pojïme radìji mluvit o nìèem jiném...
	Om							= 	"SVM_8_Om"							;//Hmmm
};


instance SVM_9 (C_SVM)				// brummig		   gemütlicher Hüne, Besonnen, Brummiger Bär, Einfacher	Mensch
{
	StopMagic					=	"SVM_9_StopMagic"					;//Nechci tu ádné èarování!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"				;//Øíkám pøestaò! Ihned!
	WeaponDown					=	"SVM_9_WeaponDown"					;//Chystáš se do mì pustit?
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"				;//Chceš ode mì nakládaèku? Dej tu vìc pryè!
	WatchYourAim				=	"SVM_9_WatchYourAim"				;//Dávej pozor, kam míøíš!
	WatchYourAimAngry			=	"SVM_9_WatchYourAimAngry"			;//Dej tu vìc pryè!
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"				;//Hej! Dávej pozor!
	LetsForgetOurLittleFight	=	"SVM_9_LetsForgetOurLittleFight"	;//Radìji bych na tohle malé nedorozumìní zapomnìl...
	Strange						=	"SVM_9_Strange"						;//Uka se! Vím, e mì slyšíš!
	DieMonster					=	"SVM_9_DieMonster"					;//Tahle zvìø je opravdu stupidní!
	DieMortalEnemy				=	"SVM_9_DieMortalEnemy"				;//To máš za to!
	NowWait						=	"SVM_9_NowWait"						;//Teï poznáš, kdo jsem!
	YouStillNotHaveEnough		=	"SVM_9_YouStillNotHaveEnough"		;//Ty máš ale vıdr!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Kdy neposloucháš, tak si to vyzkoušíš na vlastní kùi!
	NowWaitIntruder				= 	"SVM_9_NowWaitIntruder"				;//Teï tì dostanu, vetøelèe!
	IWillTeachYouRespectForForeignProperty	=	"SVM_9_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem tì. Jestli se dotkneš mıch vìcí, lítáš v prùšvihu!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Zlodìji! Tohle bude tvùj konec!
	YouAttackedMyCharge			=	"SVM_9_YouAttackedMyCharge"			;//Mıch chlapù se nikdo nedotkne!
	YouKilledOneOfUs			=	"SVM_9_YouKilledOneOfUs"			;//Zabil jsi jednoho z nás!
	Dead						=	"SVM_9_Dead"						;//Aaargl
	Aargh_1						=	"SVM_9_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_9_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_9_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_9_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_9_YoullBeSorryForThis"			;//Jseš mrtvej mu, akorát o tom ještì nevíš.
	YesYes						=	"SVM_9_YesYes"						;//Dobøe. Všechno dobrı!
	ShitWhatAMonster			=	"SVM_9_ShitWhatAMonster"			;//Sakra, takovı zvíøe!
	Help						=	"SVM_9_Help"						;//Rychle odsud!
	WeWillMeetAgain				=	"SVM_9_WeWillMeetAgain"				;//Ještì se uvidíme!
	NeverTryThatAgain			=	"SVM_9_NeverTryThatAgain"			;//Ještì jednou a zabiju tì!
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"				;//Tahle zbraò je teï moje!
	ITookYourOre				=	"SVM_9_ITookYourOre"				;//Ruda! Je to lepší ne nic!
	ShitNoOre					=	"SVM_9_ShitNoOre"					;//U nemá ani kousek rudy!
	HandsOff					=	"SVM_9_HandsOff"					;//Ruce od toho pryè!
	GetOutOfHere				=	"SVM_9_GetOutOfHere"				;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_9_YouViolatedForbiddenTerritory";//Co tady dìláš?
	YouWannaFoolMe				=	"SVM_9_YouWannaFoolMe"				;//Snaíš se mì pøechytraèit, co?
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"		;//Hej ty! Co tady pohledáváš?
	WhyAreYouInHere				=	"SVM_9_WhyYouAreInHere"				;//Vypadni odsud nebo zavolám stráe!
	WhatDidYouInThere			=	"SVM_9_WhatDidYouInThere"			;//Cos tady dìlal?
	WiseMove					=	"SVM_9_WiseMove"					;//Chytrá hlavièka!
	Alarm						=	"SVM_9_Alarm"						;//Stráe! Sem!
	IntruderAlert				= 	"SVM_9_IntruderAlert"				;//POZOR!! VETØELEC!!!
	BehindYou					=	"SVM_9_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_9_TheresAFight"				;//Uvidíme, jak jsou dobrı...
	HeyHeyHey					=	"SVM_9_HeyHeyHey"					;//Poøádnì!
	CheerFight					=	"SVM_9_CheerFight"					;//Táák! Pokraèuj, pokraèuj!
	CheerFriend					=	"SVM_9_CheerFriend"					;//Vıbornì!
	Ooh							=	"SVM_9_Ooh"							;//Ah, dobøe míøená rána!
	YeahWellDone				=	"SVM_9_YeahWellDone"				;//Vıborná práce, hochu!
	RunCoward					=	"SVM_9_RunCoward"					;//Uaaah!!!!!!
	HeDefeatedHim				=	"SVM_9_HeDefeatedHim"				;//O tomhle boji u je rozhodnuto.
	HeDeservedIt				=	"SVM_9_HeDeservedIt"				;//Tvoje chyba!
	HeKilledHim					=	"SVM_9_HeKilledHim"					;//To nebylo nutné. Poneseš za to následky.
	ItWasAGoodFight				=	"SVM_9_ItWasAGoodFight"				;//Skvìlı boj!
	Awake						=	"SVM_9_Awake"						;//Jo
	FriendlyGreetings			=	"SVM_9_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_9_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_9_MageGreetings"				;//Za slávu magie
	SectGreetings				=	"SVM_9_SectGreetings"				;//Probuï se!
	ThereHeIs					= 	"SVM_13_ThereHeIs"					;//Jsi slepı? Támhle!
	NoLearnNoPoints				= 	"SVM_9_NoLearnNoPoints"				;//Nemùu tì nic nauèit. Nemáš dost zkušeností..
	NoLearnOverMax				= 	"SVM_9_NoLearnOverMax"				;//Jsi u konce svıch moností. Mìl by ses uèit nìco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_9_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vùdcem, musíš na sobì ještì pracovat!
	NoLearnYoureBetter			=	"SVM_9_NoLearnYoureBetter"			;//U je to s tebou lepší!
	HeyYou						=	"SVM_9_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_9_NotNow"						;//Teï ne!
	WhatDoYouWant				=	"SVM_9_WhatDoYouWant"				;//Co ode mì chceš?
	ISaidWhatDoYouWant			=	"SVM_9_ISaidWhatDoYouWant"			;//Mùu pro tebe nìco udìlat?
	MakeWay						=	"SVM_9_MakeWay"						;//Nech mì jít!
	OutOfMyWay					=	"SVM_9_OutOfMyWay"					;//Uhni stranou!
	YouDeafOrWhat				=	"SVM_9_YouDeafOrWhat"				;//Dìlej, jdi z cesty!
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"		;//Chceš mít zas se mnou problémy? Proè si mì poøád dobíráš?
	LookAway					=	"SVM_9_LookAway"					;//Nojo! To máme dneska pìkné poèasí!
	OkayKeepIt					=	"SVM_9_OkayKeepIt"					;//Dobrá! Je tvoje!
	WhatsThat					=	"SVM_9_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_9_ThatsMyWeapon"				;//Ne napoèítám do tøí, chci svou zbraò zpátky!
	GiveItToMe					=	"SVM_9_GiveItToMe"					;//Vra mi ji! Hned!
	YouCanKeeptheCrap			=	"SVM_9_YouCanKeeptheCrap"			;//Nech si ji! U ji nebudu potøebovat.
	TheyKilledMyFriend			=	"SVM_9_TheyKilledMyFriend"			;//Dostali jednoho z našich klukù. Jestli já toho lotra...
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"		;//Co se dìje?
	SuckerGotSome				=	"SVM_9_SuckerGotSome"				;//Eh? Dostal jsi nakládaèku? Dobøe ti tak!
	SuckerDefeatedEBr			=	"SVM_9_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Má na tebe vztek!
	SuckerDefeatedGur			=	"SVM_9_SuckerDefeatedGur"			;//Porazil jsi jednoho z Guru. Obdivuhodné, ale u se o to znovu nepokoušej.
	SuckerDefeatedMage			=	"SVM_9_SuckerDefeatedMage"			;//Zvítìzit nad mágem... Musíš mít pro strach udìláno!
	SuckerDefeatedNov_Guard		= 	"SVM_9_SuckerDefeatedNov_Guard"		;//Musíš bıt šílenı, es srazil toho novice.
	SuckerDefeatedVlk_Guard		= 	"SVM_9_SuckerDefeatedVlk_Guard"		;//Co sis vlastnì myslel, e dìláš, kdy jsi zabíjel kopáèe?
	YouDefeatedMyComrade		=	"SVM_9_YouDefeatedMyComrade"		;//Srazil jsi mého pøítele, proè?
	YouDefeatedNOV_Guard		=	"SVM_9_YouDefeatedNOV_Guard"		;//Ještì jednou se dotkneš nìkterého novice a budeš litovat!
	YouDefeatedVLK_Guard		=	"SVM_9_YouDefeatedVLK_Guard"		;//Jsi pøíliš smìlı, problém s nìkterım z chránìncù by pro tebe mohl znamenat nebezpeèí.
	YouStoleFromMe				=	"SVM_9_YouStoleFromMe"				;//Jak se tu opovauješ objevit, ty zlodìji?
	YouStoleFromUs				=	"SVM_9_YouStoleFromUs"				;//Krást u naší rodiny je horší ne cokoliv jiného! Toho budeš litovat!
	YouStoleFromEBr				=	"SVM_9_YouStoleFromEBr"				;//Èlovìèe, tys kradl u Rudobaronù? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_9_YouStoleFromGur"				;//Okradl jsi Guru o pár vìcí, viï?
	StoleFromMage				=	"SVM_9_StoleFromMage"				;//Okradl jsi mágy o pár vìcí, viï?
	YouKilledMyFriend			=	"SVM_9_YouKilledMyFriend"			;//Máš na svìdomí jednoho z našich muù. Staèí malá chybièka a pøijde øada na tebe!
	YouKilledEBr				=	"SVM_9_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronù! Èlovìèe, úplnì ses pominul?
	YouKilledGur				=	"SVM_9_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nemùu tomu uvìøit!
	YouKilledMage				=	"SVM_9_YouKilledMage"				;//Zabil jsi jednoho z mágù! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_9_YouKilledOCfolk"				;//Jeden z èlenù Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_9_YouKilledNCfolk"				;//Novı tábor utrpìl tìkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_9_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svıch vìøících a ty ho máš na svìdomí!
	GetThingsRight				=	"SVM_9_GetThingsRight"				;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_9_YouDefeatedMeWell"			;//Dobrı boj! Tvá pøíprava stála za to!
	Smalltalk01					=	"SVM_9_Smalltalk01"					;// ...kdy myslíš...
	Smalltalk02					=	"SVM_9_Smalltalk02"					;// ...moná...
	Smalltalk03					=	"SVM_9_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_9_Smalltalk04"					;// ...udìlám nejlíp, kdy se budu dret dál...
	Smalltalk05					=	"SVM_9_Smalltalk05"					;// ...tohle opravdu není mùj problém...
	Smalltalk06					=	"SVM_9_Smalltalk06"					;// ...bylo jasné, e z toho bude mrzutost...
	Smalltalk07					=	"SVM_9_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vìdìt...
	Smalltalk08					=	"SVM_9_Smalltalk08"					;// ...u se to znovu nestane...
	Smalltalk09					=	"SVM_9_Smalltalk09"					;// ...a pøesto na tom musí nìco bıt...
	Smalltalk10					=	"SVM_9_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem øíkáš...
	Smalltalk11					=	"SVM_9_Smalltalk11"					;// ...jestli se mì to netıká...
	Smalltalk12					=	"SVM_9_Smalltalk12"					;// ...nemìl bys všemu vìøit...
	Smalltalk13					=	"SVM_9_Smalltalk13"					;// ...pøesto bych nechtìl bıt v jeho kùi...
	Smalltalk14					=	"SVM_9_Smalltalk14"					;// ...poøád ta samá pohádka...
	Smalltalk15					=	"SVM_9_Smalltalk15"					;// ...nìkteøí lidé se nikdy nepouèí...
	Smalltalk16					=	"SVM_9_Smalltalk16"					;// ...døíve bıvalo všechno docela jinak...
	Smalltalk17					=	"SVM_9_Smalltalk17"					;// ...lidé øíkají...
	Smalltalk18					=	"SVM_9_Smalltalk18"					;// ...takové øeèi já nikdy neposlouchám...
	Smalltalk19					=	"SVM_9_Smalltalk19"					;// ...na nìkoho se spoléháš a dostaneš se do problémù, tak to chodí...
	Smalltalk20					=	"SVM_9_Smalltalk20"					;// ...pochybuji, e by se to mohlo zmìnit...
	Smalltalk21					=	"SVM_9_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_9_Smalltalk22"					;// ...vydr. Lepší je do nièeho se nepouštìt...
	Smalltalk23					=	"SVM_9_Smalltalk23"					;// ...myslel jsem, e u je to dávno za námi...
	Smalltalk24					=	"SVM_9_Smalltalk24"					;// ...pojïme radìji mluvit o nìèem jiném...
	Om							= 	"SVM_9_Om"							;// Hmmm   
};



instance SVM_10	(C_SVM)				// Schlau, verschlagen,	heimlich, Zwielichtig, zynisch,	intrigant Dealer (RAVEN, KALOM)
{
	StopMagic					=	"SVM_10_StopMagic"						;//ádné èarování!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"					;//Pøestaò u s tìmi kouzly! Ihned!
	WeaponDown					=	"SVM_10_WeaponDown"						;//Dej tu zbraò pryè!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"				;//Co tady pohledáváš? Chceš mít se mnou problémy?
	WatchYourAim				=	"SVM_10_WatchYourAim"					;//Dej to pryè nebo ti ukáu!
	WatchYourAimAngry			=	"SVM_10_WatchYourAimAngry"				;//Jestli chceš mít problémy, tak na mì ještì jednou zamiø!
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"				;//Hej! Dávej pozor! Ještì jednou a schytáš to!
	LetsForgetOurLittleFight	=	"SVM_10_LetsForgetOurLittleFight"		;//Poslyš, èlovìèe! Zapomeneme na tuhle malou hádku, jo?
	Strange						=	"SVM_10_Strange"						;//Vystup! Uka se!
	DieMonster					=	"SVM_10_DieMonster"						;//Prašivé bestie!
	DieMortalEnemy				=	"SVM_10_DieMortalEnemy"					;//Teï zemøeš!
	NowWait						=	"SVM_10_NowWait"						;//Je èas zúètování!
	YouStillNotHaveEnough		=	"SVM_10_YouStillNotHaveEnough"			;//Vypadá to, jako bys chtìl ještì jednu do tlamy!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"					;//Øíkal sis o to!
	NowWaitIntruder				= 	"SVM_10_NowWaitIntruder"				;//Teï tì dostanu, vetøelèe!
	IWillTeachYouRespectForForeignProperty	=	"SVM_10_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem tì. Jestli se dotkneš mıch vìcí, lítáš v prùšvihu!
	DirtyThief					=	"SVM_10_DirtyThief"						;//Zlodìji! Tohle bude tvùj konec!
	YouAttackedMyCharge			=	"SVM_10_YouAttackedMyCharge"			;//Mıch chlapù se nikdo nedotkne!
	YouKilledOneOfUs			=	"SVM_10_YouKilledOneOfUs"				;//Zabil jsi jednoho z mıch chlapù. Teï zabiju já TEBE!
	Dead						=	"SVM_10_Dead"							;//Aaargl
	Aargh_1						=	"SVM_10_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_10_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_10_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_10_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_10_YoullBeSorryForThis"			;//Toho budeš litovat! Bastarde!
	YesYes						=	"SVM_10_YesYes"							;//Dobrá, dobrá! Klid, vyhrál jsi!
	ShitWhatAMonster			=	"SVM_10_ShitWhatAMonster"				;//Taková bestie! Utíkej jak nejrychleji umíš!
	Help						=	"SVM_10_Help"							;//Pryè!
	WeWillMeetAgain				=	"SVM_10_WeWillMeetAgain"				;//Ještì mì poznáš!
	NeverTryThatAgain			=	"SVM_10_NeverTryThatAgain"				;//Ještì jednou to zkus a budeš litovat!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"				;//Ta zbraò je teï moje!
	ITookYourOre				=	"SVM_10_ITookYourOre"					;//Vezmu si trochu tvojí rudy!
	ShitNoOre					=	"SVM_10_ShitNoOre"						;//Sakra, ádná RUDA!
	HandsOff					=	"SVM_10_HandsOff"						;//Ruce od toho pryè!Ty kryso!
	GetOutOfHere				=	"SVM_10_GetOutOfHere"					;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_10_YouViolatedForbiddenTerritory"	;//Hej! Odkud si pøišel?
	YouWannaFoolMe				=	"SVM_10_YouWannaFoolMe"					;//Myslíš si, e jsem úplnì hloupı?
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"			;//Hej! Po èem tu slídíš?
	WhyAreYouInHere				=	"SVM_10_WhyYouAreInHere"				;//Kliï se odsud nebo zavolám stráe!
	WhatDidYouInThere			=	"SVM_10_WhatDidYouInThere"				;//Cos tady dìlal?
	WiseMove					=	"SVM_10_WiseMove"						;//To bylo štìstí!
	Alarm						=	"SVM_10_Alarm"							;//Stráe! Sem!
	IntruderAlert				= 	"SVM_10_IntruderAlert"					;//POZOR!!! VETØELEC!!!
	BehindYou					=	"SVM_10_BehindYou"						;//Za tebou!
	TheresAFight				=	"SVM_10_TheresAFight"					;//Do boje!
	HeyHeyHey					=	"SVM_10_HeyHeyHey"						;//Poøádnì!
	CheerFight					=	"SVM_10_CheerFight"						;//ádnou lítost!
	CheerFriend					=	"SVM_10_CheerFriend"					;//Dora ho!
	Ooh							=	"SVM_10_Ooh"							;//Nepárej se s ním!
	YeahWellDone				=	"SVM_10_YeahWellDone"					;//Dej mu pøes tlamu!
	RunCoward					=	"SVM_10_RunCoward"						;//Vra se, zbabìlèe!
	HeDefeatedHim				=	"SVM_10_HeDefeatedHim"					;//Jenom závan vìtru a hned by to s ním praštilo!
	HeDeservedIt				=	"SVM_10_HeDeservedIt"					;//Zaslouil si to!
	HeKilledHim					=	"SVM_10_HeKilledHim"					;//Jsi jako samotná smrt! Ta tì nauèí takhle zabíjet!
	ItWasAGoodFight				=	"SVM_10_ItWasAGoodFight"				;//Tys mu dal lekci!
	Awake						=	"SVM_10_Awake"							;//Uaah
	FriendlyGreetings			=	"SVM_10_FriendlyGreetings"				;//Nazdar.
	ALGreetings					=	"SVM_10_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_10_MageGreetings"					;//Za slávu magie!
	SectGreetings				=	"SVM_10_SectGreetings"					;//Vzbuï se!
	ThereHeIs					= 	"SVM_10_ThereHeIs"						;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_10_NoLearnNoPoints"				;//Nemùu tì nic nauèit. Nemáš dost zkušeností.
	NoLearnOverMax				= 	"SVM_10_NoLearnOverMax"					;//Jsi u konce svıch moností. Mìl by ses uèit nìco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_10_NoLearnYouAlreadyKnow"			;//Aby ses mohl stát vùdcem, musíš na sobì ještì pracovat!
	NoLearnYoureBetter			=	"SVM_10_NoLearnYoureBetter"				;//U je to s tebou lepší!
	HeyYou						=	"SVM_10_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_10_NotNow"							;//Teï ne!
	WhatDoYouWant				=	"SVM_10_WhatDoYouWant"					;//Co chceš?
	ISaidWhatDoYouWant			=	"SVM_10_ISaidWhatDoYouWant"				;//Mùu ti pomoci?
	MakeWay						=	"SVM_10_MakeWay"						;//Nech mì jít!
	OutOfMyWay					=	"SVM_10_OutOfMyWay"						;//Uhni mi z cesty!
	YouDeafOrWhat				=	"SVM_10_YouDeafOrWhat"					;//Kliï se! Nebo chceš, abych ti to vrazil do mozku?
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"			;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_10_LookAway"						;//Nejsem vlastnì tady...
	OkayKeepIt					=	"SVM_10_OkayKeepIt"						;//Dobrá, nech si ten krám!
	WhatsThat					=	"SVM_10_WhatsThat"						;//Co to bylo?
	ThatsMyWeapon				=	"SVM_10_ThatsMyWeapon"					;//Vra mi mou zbraò!
	GiveItToMe					=	"SVM_10_GiveItToMe"						;//Tak dej mi ji!
	YouCanKeeptheCrap			=	"SVM_10_YouCanKeeptheCrap"				;//Nech si ji! U ji nebudu potøebovat.
	TheyKilledMyFriend			=	"SVM_10_TheyKilledMyFriend"				;//Dostali jednoho z našich chlapíkù. To mì doopravdy štve!
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"			;// Hej, co je? Proè mì budíš?
	SuckerGotSome				=	"SVM_10_SuckerGotSome"					;//Eh? Dostal jsi nakládaèku? Dobøe ti tak!
	SuckerDefeatedEBr			=	"SVM_10_SuckerDefeatedEBr"				;//Porazil jsi Rudobarona!
	SuckerDefeatedGur			=	"SVM_10_SuckerDefeatedGur"				;//Porazil jsi jednoho z Guru.
	SuckerDefeatedMage			=	"SVM_10_SuckerDefeatedMage"				;//Zvítìzit nad mágem...
	SuckerDefeatedNov_Guard		= 	"SVM_10_SuckerDefeatedNov_Guard"		;//Moná bys mìl vìdìt, s kım si zaèínáš, kdy takhle sráíš novice!
	SuckerDefeatedVlk_Guard		= 	"SVM_10_SuckerDefeatedVlk_Guard"		;//Musím tu sjednat poøádek! Nech mé lidi na pokoji!
	YouDefeatedMyComrade		=	"SVM_10_YouDefeatedMyComrade"			;//Srazil jsi mého pøítele.
	YouDefeatedNOV_Guard		=	"SVM_10_YouDefeatedNOV_Guard"			;//Ještì jednou se dotkneš nìkterého novice a budeš litovat!
	YouDefeatedVLK_Guard		=	"SVM_10_YouDefeatedVLK_Guard"			;//Dotkni se nìkterého z mıch chránìncù a pøijde tì to draho.
	YouStoleFromMe				=	"SVM_10_YouStoleFromMe"					;//U to nezkoušej znova, zlodìji!
	YouStoleFromUs				=	"SVM_10_YouStoleFromUs"					;//Máš u sebe nìco, co patøí nám. Mìl bys nám to vrátit.
	YouStoleFromEBr				=	"SVM_10_YouStoleFromEBr"				;//Èlovìèe, tys kradl u Rudobaronù? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_10_YouStoleFromGur"				;//Okradl jsi Guru o pár vìcí. To nebylo moudré nechat se pøitom chytit!
	StoleFromMage				=	"SVM_10_StoleFromMage"					;//Okradl jsi mágy o pár vìcí, viï?
	YouKilledMyFriend			=	"SVM_10_YouKilledMyFriend"				;//Máš na svìdomí jednoho z našich muù. Staèí malá chybièka a pøijde øada na tebe!
	YouKilledEBr				=	"SVM_10_YouKilledEBr"					;//Zabil jsi jednoho z Rudobaronù! Èlovìèe, úplnì ses pominul?
	YouKilledGur				=	"SVM_10_YouKilledGur"					;//Zabil jsi jednoho z Guru! Nemùu tomu uvìøit!
	YouKilledMage				=	"SVM_10_YouKilledMage"					;//Zabil jsi jednoho z mágù! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_10_YouKilledOCfolk"				;//Jeden z èlenù Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_10_YouKilledNCfolk"				;//Novı tábor utrpìl tìkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_10_YouKilledPSIfolk"				;//Bratrstvo ztratilo jednoho ze svıch vìøících a ty ho máš na svìdomí!
	GetThingsRight				=	"SVM_10_GetThingsRight"					;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_10_YouDefeatedMeWell"				;//Vıbornì! Vyhrál jsi, ale byl to dobrı boj.
	Smalltalk01					=	"SVM_10_Smalltalk01"					;// ...kdy myslíš...
	Smalltalk02					=	"SVM_10_Smalltalk02"					;// ...moná...
	Smalltalk03					=	"SVM_10_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_10_Smalltalk04"					;// ...udìlám nejlíp, kdy se budu dret dál...
	Smalltalk05					=	"SVM_10_Smalltalk05"					;// ...tohle opravdu není mùj problém...
	Smalltalk06					=	"SVM_10_Smalltalk06"					;// ...bylo jasné, e z toho bude mrzutost...
	Smalltalk07					=	"SVM_10_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vìdìt...
	Smalltalk08					=	"SVM_10_Smalltalk08"					;// ...u se to znovu nestane...
	Smalltalk09					=	"SVM_10_Smalltalk09"					;// ...a pøesto na tom musí nìco bıt...
	Smalltalk10					=	"SVM_10_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem øíkáš...
	Smalltalk11					=	"SVM_10_Smalltalk11"					;// ...jestli se mì to netıká...
	Smalltalk12					=	"SVM_10_Smalltalk12"					;// ...nemìl bys všemu vìøit...
	Smalltalk13					=	"SVM_10_Smalltalk13"					;// ...pøesto bych nechtìl bıt v jeho kùi...
	Smalltalk14					=	"SVM_10_Smalltalk14"					;// ...poøád ta samá pohádka...
	Smalltalk15					=	"SVM_10_Smalltalk15"					;// ...nìkteøí lidé se nikdy nepouèí...
	Smalltalk16					=	"SVM_10_Smalltalk16"					;// ...døíve bıvalo všechno docela jinak...
	Smalltalk17					=	"SVM_10_Smalltalk17"					;// ...lidé øíkají...
	Smalltalk18					=	"SVM_10_Smalltalk18"					;// ...takové øeèi já nikdy neposlouchám...
	Smalltalk19					=	"SVM_10_Smalltalk19"					;// ...na nìkoho se spoléháš a dostaneš se do problémù, tak to chodí...
	Smalltalk20					=	"SVM_10_Smalltalk20"					;// ...pochybuji, e by se to mohlo zmìnit...
	Smalltalk21					=	"SVM_10_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_10_Smalltalk22"					;// ...vydr. Lepší je do nièeho se nepouštìt...
	Smalltalk23					=	"SVM_10_Smalltalk23"					;// ...myslel jsem, e u je to dávno za námi...
	Smalltalk24					=	"SVM_10_Smalltalk24"					;// ...pojïme radìji mluvit o nìèem jiném...
	Om							= 	"SVM_10_Om"							;//Hmmm
};



//////////////////////////////////////////
instance SVM_11	(C_SVM)				//Profi				Ruhig, abgezockt, Vernünftig aberknallhart
{
	StopMagic					=	"SVM_11_StopMagic"						;//Nepokoušej se tu èarovat!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"					;//Pøestaò u s tìmi kouzly! Ihned!
	WeaponDown					=	"SVM_11_WeaponDown"						;//Jestli hledáš problémy, tak pokraèuj!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Ruce od toho pryè nebo tì oddìlám!
	WatchYourAim				=	"SVM_11_WatchYourAim"					;//Dej tu vìc pryè!
	WatchYourAimAngry			=	"SVM_11_WatchYourAimAngry"				;//Tak ty chceš mít se mnou problémy? Víš to jistì?
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//Co to dìláš! Pøestaò!
	LetsForgetOurLittleFight	=	"SVM_11_LetsForgetOurLittleFight"		;//Dobrá, zapomeneme na tuhle hádku.
	Strange						=	"SVM_11_Strange"						;//Hmm! Sakra! Jak se sem dostal?
	DieMonster					=	"SVM_11_DieMonster"						;//Jestli mi zkøíí cestu, bude to jejich smrt!
	DieMortalEnemy				=	"SVM_11_DieMortalEnemy"					;//Pokud si udìláš nepøátele, pak se s nimi musíš dokázat vypoøádat. Zemøi.
	NowWait						=	"SVM_11_NowWait"						;//Tos nemìl dìlat!
	YouStillNotHaveEnough		=	"SVM_11_YouStillNotHaveEnough"			;//Copak jsem ti u jednu nevrazil? Tumáš další...
	YouAskedForIt				=	"SVM_11_YouAskedForIt"					;//Kdy neumíš poslouchat, bude tì to mrzet!
	NowWaitIntruder				= 	"SVM_11_NowWaitIntruder"				;//Hej, vetøelèe! Teï dostaneš lekci!
	IWillTeachYouRespectForForeignProperty	=	"SVM_11_IWillTeachYouRespectForForeignProperty"	;//Asi tì budu muset praštit pøes prsty.
	DirtyThief					=	"SVM_11_DirtyThief"						;//Kráde za to nestojí.
	YouAttackedMyCharge			=	"SVM_11_YouAttackedMyCharge"			;//Narušil jsi moje území! Teï tì oddìlám!
	YouKilledOneOfUs			=	"SVM_11_YouKilledOneOfUs"				;//Zabil jsi jednoho z mıch chlapù. To byla tvoje poslední chyba!
	Dead						=	"SVM_11_Dead"							;//Aaargl
	Aargh_1						=	"SVM_11_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_11_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_11_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_11_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_11_YoullBeSorryForThis"			;//Tos nemìl dìlat!
	YesYes						=	"SVM_11_YesYes"							;//Dobrá, dobrá! Klid, vyhrál jsi!
	ShitWhatAMonster			=	"SVM_11_ShitWhatAMonster"				;//To je na mì moc!
	Help						=	"SVM_11_Help"							;//Kliï se!
	WeWillMeetAgain				=	"SVM_11_WeWillMeetAgain"				;//Tohle bude mít následky, kamaráde!
	NeverTryThatAgain			=	"SVM_11_NeverTryThatAgain"				;//U to znova nezkoušej!
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//O tvojí zbraò se postarám líp ne ty!
	ITookYourOre				=	"SVM_11_ITookYourOre"					;//Dík, es mi nechal trochu své rudy!
	ShitNoOre					=	"SVM_11_ShitNoOre"						;//Nic, ádná ruda!
	HandsOff					=	"SVM_11_HandsOff"						;//Dej ty svı špinavı pracky pryè!
	GetOutOfHere				=	"SVM_11_GetOutOfHere"					;//Kliï se odsuï nebo tì proenu!
	YouViolatedForbiddenTerritory=	"SVM_11_YouViolatedForbiddenTerritory"	;//Hej! Kde TY ses tu vzal?
	YouWannaFoolMe				=	"SVM_11_YouWannaFoolMe"					;//Se mnou ne, pøíteli!
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"			;//Po èem tu slídíš?
	WhyAreYouInHere				=	"SVM_11_WhyYouAreInHere"				;//Ta chatrè je moje! Kliï se nebo zavolám stráe!
	WhatDidYouInThere			=	"SVM_11_WhatDidYouInThere"				;//Cos tady dìlal? Vypadni, ne tì sejmu!
	WiseMove					=	"SVM_11_WiseMove"						;//Dobrá! U to znovu nedìlej!
	Alarm						=	"SVM_11_Alarm"							;//Stráe! Sem!
	IntruderAlert				= 	"SVM_11_IntruderAlert"					;//POZOR!!! VETØELEC!!!
	BehindYou					=	"SVM_11_BehindYou"						;//Za tebou!
	TheresAFight				=	"SVM_11_TheresAFight"					;//Uvidíme tentokrát, kdo z koho!
	HeyHeyHey					=	"SVM_11_HeyHeyHey"						;//Poøádnì! Do toho!
	CheerFight					=	"SVM_11_CheerFight"						;//Pøestaò si s ním hrát!
	CheerFriend					=	"SVM_11_CheerFriend"					;//Dìlej, snad na nìj staèíš, ne?
	Ooh							=	"SVM_11_Ooh"							;//Oh! Nic moc!
	YeahWellDone				=	"SVM_11_YeahWellDone"					;//Hmm! To nebylo zlı!
	RunCoward					=	"SVM_11_RunCoward"						;//U se tu nikdy neukazuj!
	HeDefeatedHim				=	"SVM_11_HeDefeatedHim"					;//Dobrá rána!
	HeDeservedIt				=	"SVM_11_HeDeservedIt"					;//Co dìlat! Zaslouil si to!
	HeKilledHim					=	"SVM_11_HeKilledHim"					;//Tys ho zabil! Z toho bude velká mrzutost!
	ItWasAGoodFight				=	"SVM_11_ItWasAGoodFight"				;//Vıborná práce! Krásné pøedstavení!
	Awake						=	"SVM_11_Awake"							;//Uaah
	FriendlyGreetings			=	"SVM_11_FriendlyGreetings"				;//Nazdar!
	ALGreetings					=	"SVM_11_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_11_MageGreetings"					;//Za slávu magie!
	SectGreetings				=	"SVM_11_SectGreetings"					;//Vzbuï se!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Jsi slepı? Támhle!
	NoLearnNoPoints				= 	"SVM_11_NoLearnNoPoints"				;//Nemùu tì nic nauèit, protoe nemáš ádné zkušenosti.
	NoLearnOverMax				= 	"SVM_11_NoLearnOverMax"					;//Jsi u konce svıch moností. Mìl by ses uèit nìco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_11_NoLearnYouAlreadyKnow"			;//Aby ses mohl stát vùdcem, musíš na sobì ještì pracovat!
	NoLearnYoureBetter			=	"SVM_11_NoLearnYoureBetter"				;//U je to s tebou lepší!
	HeyYou						=	"SVM_11_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_11_NotNow"							;//Teï ne!
	WhatDoYouWant				=	"SVM_11_WhatDoYouWant"					;//Co chceš?
	ISaidWhatDoYouWant			=	"SVM_11_ISaidWhatDoYouWant"				;//Mùu pro tebe nìco udìlat?
	MakeWay						=	"SVM_11_MakeWay"						;//Mùu tudy projít?
	OutOfMyWay					=	"SVM_11_OutOfMyWay"						;//Ustup stranou!
	YouDeafOrWhat				=	"SVM_11_YouDeafOrWhat"					;//Kliï se! Nebo chceš, abych ti to vrazil do mozku?
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"			;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_11_LookAway"						;//Nechci se do toho zaplést!
	OkayKeepIt					=	"SVM_11_OkayKeepIt"						;//Dobrá, je tvoje!
	WhatsThat					=	"SVM_11_WhatsThat"						;//Co to bylo?
	ThatsMyWeapon				=	"SVM_11_ThatsMyWeapon"					;//Ty máš moji zbraò...?
	GiveItToMe					=	"SVM_11_GiveItToMe"						;//Tak dej mi ji, dìlej!
	YouCanKeeptheCrap			=	"SVM_11_YouCanKeeptheCrap"				;//Nech si ji! Stejnì ji u nebudu potøebovat!
	TheyKilledMyFriend			=	"SVM_11_TheyKilledMyFriend"				;//Dostali jednoho z našich chlapíkù. Jestli já toho lotra dostanu...
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"			;//Co poøád je?
	SuckerGotSome				=	"SVM_11_SuckerGotSome"					;//Dostal jsi nakládaèku? Dobøe ti tak!
	SuckerDefeatedEBr			=	"SVM_11_SuckerDefeatedEBr"				;//Porazil jsi jednoho z Rudobaronù! Skvìlé, ale hloupé! Velmi hloupé!
	SuckerDefeatedGur			=	"SVM_11_SuckerDefeatedGur"				;//Porazil jsi jednoho z Guru.
	SuckerDefeatedMage			=	"SVM_11_SuckerDefeatedMage"				;//Zvítìzit nad mágem... to není právì moudré!
	SuckerDefeatedNov_Guard		= 	"SVM_11_SuckerDefeatedNov_Guard"		;//Tihle hoši jsou pod mojí ochranou, a tys jednoho z nich srazil...
	SuckerDefeatedVlk_Guard		= 	"SVM_11_SuckerDefeatedVlk_Guard"		;//Jestli se dotkneš kopáèù, jako bys sahal na moje pøíjmy!
	YouDefeatedMyComrade		=	"SVM_11_YouDefeatedMyComrade"			;//Kdo je proti mému  pøíteli, jakoby byl proti mnì!
	YouDefeatedNOV_Guard		=	"SVM_11_YouDefeatedNOV_Guard"			;//Ještì jednou se dotkneš nìkterého novice a budeš litovat!
	YouDefeatedVLK_Guard		=	"SVM_11_YouDefeatedVLK_Guard"			;//Jestli vztáhneš ruku na nìkoho, kdo je pod mojí ochranou, bude tì to stát hlavu!
	YouStoleFromMe				=	"SVM_11_YouStoleFromMe"					;//Jak se sem opovauješ vrátit, ty zlodìji?
	YouStoleFromUs				=	"SVM_11_YouStoleFromUs"					;//Máš nìco, co patøí nám. Mìl bys nám to vrátit.
	YouStoleFromEBr				=	"SVM_11_YouStoleFromEBr"				;//Èlovìèe, tys kradl u Rudobaronù? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_11_YouStoleFromGur"				;//Okradl jsi Guru o pár vìcí, viï?
	StoleFromMage				=	"SVM_11_StoleFromMage"					;//Okradl jsi mágy o pár vìcí, viï?
	YouKilledMyFriend			=	"SVM_11_YouKilledMyFriend"				;//Porušil jsi naše pravidlo èíslo 1. Nezabíjet!
	YouKilledEBr				=	"SVM_11_YouKilledEBr"					;//Zabil jsi jednoho z Rudobaronù! Èlovìèe, úplnì ses pominul?
	YouKilledGur				=	"SVM_11_YouKilledGur"					;//Zabil jsi jednoho z Guru! Tomu, hochu, nemùu uvìøit!
	YouKilledMage				=	"SVM_11_YouKilledMage"					;//Zabil jsi jednoho z mágù! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_11_YouKilledOCfolk"				;//Jeden z èlenù Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_11_YouKilledNCfolk"				;//Novı tábor utrpìl tìkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_11_YouKilledPSIfolk"				;//Bratrstvo ztratilo jednoho ze svıch vìøících a ty ho máš na svìdomí!
	GetThingsRight				=	"SVM_11_GetThingsRight"					;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_11_YouDefeatedMeWell"				;//Byl to dobrı boj! Poøádnì jsem to od tebe schytal, èlovìèe!
	Smalltalk01					=	"SVM_11_Smalltalk01"					;// ...kdy myslíš...
	Smalltalk02					=	"SVM_11_Smalltalk02"					;// ...moná...
	Smalltalk03					=	"SVM_11_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_11_Smalltalk04"					;// ...udìlám nejlíp, kdy se budu dret dál...
	Smalltalk05					=	"SVM_11_Smalltalk05"					;// ...tohle opravdu není mùj problém...
	Smalltalk06					=	"SVM_11_Smalltalk06"					;// ...bylo jasné, e z toho bude mrzutost...
	Smalltalk07					=	"SVM_11_Smalltalk07"					;// ...nech si to pro sebe, lidé to nemusejí vìdìt...
	Smalltalk08					=	"SVM_11_Smalltalk08"					;// ...u se to znovu nestane...
	Smalltalk09					=	"SVM_11_Smalltalk09"					;// ...a pøesto na tom musí nìco bıt...
	Smalltalk10					=	"SVM_11_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem øíkáš...
	Smalltalk11					=	"SVM_11_Smalltalk11"					;// ...jestli se mì to netıká...
	Smalltalk12					=	"SVM_11_Smalltalk12"					;// ...nemìl bys všemu vìøit...
	Smalltalk13					=	"SVM_11_Smalltalk13"					;// ...pøesto bych nechtìl bıt v jeho kùi...
	Smalltalk14					=	"SVM_11_Smalltalk14"					;// ...poøád ta samá pohádka...
	Smalltalk15					=	"SVM_11_Smalltalk15"					;// ...nìkteøí lidé se nikdy nepouèí...
	Smalltalk16					=	"SVM_11_Smalltalk16"					;// ...døíve bıvalo všechno docela jinak...
	Smalltalk17					=	"SVM_11_Smalltalk17"					;// ...lidé øíkají...
	Smalltalk18					=	"SVM_11_Smalltalk18"					;// ...takové øeèi já nikdy neposlouchám...
	Smalltalk19					=	"SVM_11_Smalltalk19"					;// ...na nìkoho se spoléháš a dostaneš se do problémù, tak to chodí...
	Smalltalk20					=	"SVM_11_Smalltalk20"					;// ...pochybuji, e by se to mohlo zmìnit...
	Smalltalk21					=	"SVM_11_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_11_Smalltalk22"					;// ...vydr. Lepší je do nièeho se nepouštìt...
	Smalltalk23					=	"SVM_11_Smalltalk23"					;// ...myslel jsem, e u je to dávno za námi...
	Smalltalk24					=	"SVM_11_Smalltalk24"					;// ...pojïme radìji mluvit o nìèem jiném...
	Om							= 	"SVM_11_Om"								;//Hmmm
};


instance SVM_12	(C_SVM)		//Bazaar-Händler		Nach außen freundlich,jovial,Innen hinterhältig, raffgierig
{
	StopMagic					=	"SVM_12_StopMagic"						;//Pøestaò s tìmi kouzly!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"					;//Kdy øíkám: pøestaò s tìmi kouzly, tak to myslím vánì!
	WeaponDown					=	"SVM_12_WeaponDown"						;//Co chceš s tou zbraní udìlat, èlovìèe!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"				;//Dej to pryè!
	WatchYourAim				=	"SVM_12_WatchYourAim"					;//Míøíš na mì!
	WatchYourAimAngry			=	"SVM_12_WatchYourAimAngry"				;//Jestli s tím nepøestaneš, budeš mít problémy!
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"				;//Hej, seš slepej, nebo co?
	LetsForgetOurLittleFight	=	"SVM_12_LetsForgetOurLittleFight"		;//Zapomeneme na to malé nedorozumìní, dobrá?
	Strange						=	"SVM_12_Strange"						;//Ještì pøed chvilkou tu byl! Divné!
	DieMonster					=	"SVM_12_DieMonster"						;//Tvùj èas nadešel, bastarde!
	DieMortalEnemy				=	"SVM_12_DieMortalEnemy"					;//Je èas zúètování!
	NowWait						=	"SVM_12_NowWait"						;//Øíkáš si o poøádnou nakládaèku!
	YouStillNotHaveEnough		=	"SVM_12_YouStillNotHaveEnough"			;//Ty ještì nemáš dost?
	YouAskedForIt				=	"SVM_12_YouAskedForIt"					;//Dobrá, øíkal sis o to!
	NowWaitIntruder				= 	"SVM_12_NowWaitIntruder"				;//Oni tì odsud vynesou!
	IWillTeachYouRespectForForeignProperty	=	"SVM_12_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem tì. Jestli se dotkneš mıch vìcí, lítáš v prùšvihu!
	DirtyThief					=	"SVM_12_DirtyThief"						;//Ty všivej zlodìji! Já tì nauèím!
	YouAttackedMyCharge			=	"SVM_12_YouAttackedMyCharge"			;//Není nikdo, kdo by mìl problém s mımi lidmi a pak toho nelitoval!
	YouKilledOneOfUs			=	"SVM_12_YouKilledOneOfUs"				;//Zabil jsi jednoho z nás! Teï zabiju já TEBE!
	Dead						=	"SVM_12_Dead"							;//Aaargl
	Aargh_1						=	"SVM_12_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_12_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_12_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_12_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_12_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_12_YesYes"							;//Klid, klid, vyhrál jsi!
	ShitWhatAMonster			=	"SVM_12_ShitWhatAMonster"				;//To je na mì moc! Na to nestaèím!
	Help						=	"SVM_12_Help"							;//K èertu!
	WeWillMeetAgain				=	"SVM_12_WeWillMeetAgain"				;//Ještì se uvidíme!
	NeverTryThatAgain			=	"SVM_12_NeverTryThatAgain"				;//U to znova nezkoušej!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"				;//Tahle zbraò se mi líbí!
	ITookYourOre				=	"SVM_12_ITookYourOre"					;//Podívám se, jak je tvá ruda dobøe uloená!
	ShitNoOre					=	"SVM_12_ShitNoOre"						;//K èertu! ádná ruda!
	HandsOff					=	"SVM_12_HandsOff"						;//Ruce od toho pryè!
	GetOutOfHere				=	"SVM_12_GetOutOfHere"					;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_12_YouViolatedForbiddenTerritory";//Hej! Jak ses sem dostal?
	YouWannaFoolMe				=	"SVM_12_YouWannaFoolMe"					;//Myslíš, e jsem tak hloupı?
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"			;//Co tady pohledáváš?
	WhyAreYouInHere				=	"SVM_12_WhyYouAreInHere"				;//Vypadni odsud nebo zavolám stráe!
	WhatDidYouInThere			=	"SVM_12_WhatDidYouInThere"				;//Tady nemáš co dìlat!
	WiseMove					=	"SVM_12_WiseMove"						;//Uèíš se rychle!
	Alarm						=	"SVM_12_Alarm"							;//Stráe! Sem!
	IntruderAlert				= 	"SVM_12_IntruderAlert"					;//POZOR!!
	BehindYou					=	"SVM_12_BehindYou"						;//Za tebou!
	TheresAFight				=	"SVM_12_TheresAFight"					;//Do boje!
	HeyHeyHey					=	"SVM_12_HeyHeyHey"						;//Poøádnì!
	CheerFight					=	"SVM_12_CheerFight"						;//Vıbornì!
	CheerFriend					=	"SVM_12_CheerFriend"					;//Vyøiï ho!
	Ooh							=	"SVM_12_Ooh"							;//Tak dávej pozor!
	YeahWellDone				=	"SVM_12_YeahWellDone"					;//U bylo na èase!
	RunCoward					=	"SVM_12_RunCoward"						;//Ten chlapík utíká pryè!
	HeDefeatedHim				=	"SVM_12_HeDefeatedHim"					;//Jasnı vítìz, jak jsem øek!
	HeDeservedIt				=	"SVM_12_HeDeservedIt"					;//Zaslouil si to!
	HeKilledHim					=	"SVM_12_HeKilledHim"					;//Akorát zabíjíš lidi. Máš teï poøádnej problém.
	ItWasAGoodFight				=	"SVM_12_ItWasAGoodFight"				;//Skvìlı boj!
	Awake						=	"SVM_12_Awake"							;//Uuaah
	FriendlyGreetings			=	"SVM_12_FriendlyGreetings"				;//Nazdar
	ALGreetings					=	"SVM_12_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_12_MageGreetings"					;//Za slávu magie
	SectGreetings				=	"SVM_12_SectGreetings"					;//Probuï se!
	ThereHeIs					= 	"SVM_12_ThereHeIs"						;//Támhle!
	NoLearnNoPoints				= 	"SVM_12_NoLearnNoPoints"				;//Nemùu tì nic nauèit. Nemáš dost zkušeností..
	NoLearnOverMax				= 	"SVM_12_NoLearnOverMax"					;//Jsi u konce svıch moností. Mìl by ses uèit nìco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_12_NoLearnYouAlreadyKnow"			;//Aby ses mohl stát vùdcem, musíš na sobì ještì pracovat!
	NoLearnYoureBetter			=	"SVM_12_NoLearnYoureBetter"				;//U je to s tebou lepší!
	HeyYou						=	"SVM_12_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_12_NotNow"							;//Teï ne!
	WhatDoYouWant				=	"SVM_12_WhatDoYouWant"					;//Mùu ti pomoci?
	ISaidWhatDoYouWant			=	"SVM_12_ISaidWhatDoYouWant"				;//Co chceš?
	MakeWay						=	"SVM_12_MakeWay"						;//Nech mì jít!
	OutOfMyWay					=	"SVM_12_OutOfMyWay"						;//Dìlej, uhni mi z cesty!
	YouDeafOrWhat				=	"SVM_12_YouDeafOrWhat"					;//Jseš hluchej nebo touíš po maléru?
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"			;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_12_LookAway"						;//Stalo se nìco? Nevidìl jsem NIC...
	OkayKeepIt					=	"SVM_12_OkayKeepIt"						;//Dobrá! Tak si ji nech!
	WhatsThat					=	"SVM_12_WhatsThat"						;//Co to bylo?
	ThatsMyWeapon				=	"SVM_12_ThatsMyWeapon"					;//Opravdu chci svoji zbraò zpátky!
	GiveItToMe					=	"SVM_12_GiveItToMe"						;//Tak dej mi ji!
	YouCanKeeptheCrap			=	"SVM_12_YouCanKeeptheCrap"				;//Hm, není špatná! Sehnal jsem další!
	TheyKilledMyFriend			=	"SVM_12_TheyKilledMyFriend"				;//Dostali jednoho z našich klukù. Jestli já toho lotra...
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"			;//Hm, co to je? Proè mì budíš?
	SuckerGotSome				=	"SVM_12_SuckerGotSome"					;//Eh? Dostal jsi nakládaèku? Dobøe ti tak!
	SuckerDefeatedEBr			=	"SVM_12_SuckerDefeatedEBr"				;//Porazil jsi Rudobarona! Má na tebe vztek!
	SuckerDefeatedGur			=	"SVM_12_SuckerDefeatedGur"				;//Porazil jsi jednoho z Guru. Skvìlé, ale u se o to znovu nepokoušej.
	SuckerDefeatedMage			=	"SVM_12_SuckerDefeatedMage"				;//Zvítìzit nad mágem... Musíš mít pro strach udìláno!
	SuckerDefeatedNov_Guard		= 	"SVM_12_SuckerDefeatedNov_Guard"		;//Musíš bıt šílenı, es srazil toho novice.
	SuckerDefeatedVlk_Guard		= 	"SVM_12_SuckerDefeatedVlk_Guard"		;//Co sis vlastnì myslel, e dìláš, kdy jsi zabíjel kopáèe?
	YouDefeatedMyComrade		=	"SVM_12_YouDefeatedMyComrade"			;//Srazil jsi mého pøítele, proè?
	YouDefeatedNOV_Guard		=	"SVM_12_YouDefeatedNOV_Guard"			;//Ještì jednou se dotkneš nìkterého novice a budeš litovat!
	YouDefeatedVLK_Guard		=	"SVM_12_YouDefeatedVLK_Guard"			;//Jsi pøíliš smìlı, problém s nìkterım z mıch chránìncù by pro tebe mohl znamenat nebezpeèí.
	YouStoleFromMe				=	"SVM_12_YouStoleFromMe"					;//Jak se sem opovauješ vrátit, ty zlodìji?
	YouStoleFromUs				=	"SVM_12_YouStoleFromUs"					;//Máš nìco, co patøí nám. Mìl bys nám to vrátit.
	YouStoleFromEBr				=	"SVM_12_YouStoleFromEBr"				;//Èlovìèe, tys kradl u Rudobaronù? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_12_YouStoleFromGur"				;//Kradl jsi u Guru! Nemusel ses aspoò nechat nachytat!
	StoleFromMage				=	"SVM_12_StoleFromMage"					;//Mágové nemají rádi lidi, co se motají kolem jejich vìcí!
	YouKilledMyFriend			=	"SVM_12_YouKilledMyFriend"				;//Máš na svìdomí jednoho z našich muù. Staèí malá chybièka a pøijde øada na tebe!
	YouKilledEBr				=	"SVM_12_YouKilledEBr"					;//Zabil jsi jednoho z Rudobaronù! Èlovìèe, úplnì ses pominul?
	YouKilledGur				=	"SVM_12_YouKilledGur"					;//Zabil jsi jednoho z Guru! Tomu, hochu, nemùu uvìøit!
	YouKilledMage				=	"SVM_12_YouKilledMage"					;//Zabil jsi jednoho z mágù! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_12_YouKilledOCfolk"				;//Jeden z èlenù Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_12_YouKilledNCfolk"				;//Novı tábor utrpìl tìkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_12_YouKilledPSIfolk"				;//Bratrstvo ztratilo jednoho ze svıch vìøících a ty ho máš na svìdomí!
	GetThingsRight				=	"SVM_12_GetThingsRight"					;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_12_YouDefeatedMeWell"				;//Poøádnì jsi mi to nandal, èlovìèe. Byl to dobrı boj! Ale teï u je konec!
	Smalltalk01					=	"SVM_12_Smalltalk01"					;// ...kdy myslíš...
	Smalltalk02					=	"SVM_12_Smalltalk02"					;// ...moná...
	Smalltalk03					=	"SVM_12_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_12_Smalltalk04"					;// ...udìlám nejlíp, kdy se budu dret dál...
	Smalltalk05					=	"SVM_12_Smalltalk05"					;// ...tohle opravdu není mùj problém...
	Smalltalk06					=	"SVM_12_Smalltalk06"					;// ...bylo jasné, e z toho bude mrzutost...
	Smalltalk07					=	"SVM_12_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vìdìt...
	Smalltalk08					=	"SVM_12_Smalltalk08"					;// ...u se to znovu nestane...
	Smalltalk09					=	"SVM_12_Smalltalk09"					;// ...a pøesto na tom musí nìco bıt...
	Smalltalk10					=	"SVM_12_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem øíkáš...
	Smalltalk11					=	"SVM_12_Smalltalk11"					;// ...jestli se mì to netıká...
	Smalltalk12					=	"SVM_12_Smalltalk12"					;// ...nemìl bys všemu vìøit...
	Smalltalk13					=	"SVM_12_Smalltalk13"					;// ...pøesto bych nechtìl bıt v jeho kùi...
	Smalltalk14					=	"SVM_12_Smalltalk14"					;// ...poøád ta samá pohádka...
	Smalltalk15					=	"SVM_12_Smalltalk15"					;// ...nìkteøí lidé se nikdy nepouèí...
	Smalltalk16					=	"SVM_12_Smalltalk16"					;// ...døíve bıvalo všechno docela jinak...
	Smalltalk17					=	"SVM_12_Smalltalk17"					;// ...lidé øíkají...
	Smalltalk18					=	"SVM_12_Smalltalk18"					;// ...takové øeèi já nikdy neposlouchám...
	Smalltalk19					=	"SVM_12_Smalltalk19"					;// ...na nìkoho se spoléháš a dostaneš se do problémù, tak to chodí...
	Smalltalk20					=	"SVM_12_Smalltalk20"					;// ...pochybuji, e by se to mohlo zmìnit...
	Smalltalk21					=	"SVM_12_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_12_Smalltalk22"					;// ...vydr. Lepší je do nièeho se nepouštìt...
	Smalltalk23					=	"SVM_12_Smalltalk23"					;// ...myslel jsem, e u je to dávno za námi...
	Smalltalk24					=	"SVM_12_Smalltalk24"					;// ...pojïme radìji mluvit o nìèem jiném...
	Om							= 	"SVM_12_Om"							;//Hmmm
};


instance SVM_13	(C_SVM)					// Fanatiker	Agressiv, übereifrig, Ähnlich wie Stimme7Freak,	aber klarer, Ruhm-und-Ehre-Typ,	Nov: Glauben an	Y´berion blind,	Mitläufer
{
	StopMagic					=	"SVM_13_StopMagic"						;//Pøestaò u s tìmi kouzly!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"					;//Dej to pryè! IHNED!
	WeaponDown					=	"SVM_13_WeaponDown"						;//Polo tu zbraò!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"				;//Polo tu zbraò!
	WatchYourAim				=	"SVM_13_WatchYourAim"					;//Ty na mì míøíš? Dej si pozor!
	WatchYourAimAngry			=	"SVM_13_WatchYourAimAngry"				;//Jdeš si rovnou pro smrt! Mìl bys radìji míøit jinam!
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"				;//Co to mìlo znamenat?
	LetsForgetOurLittleFight	=	"SVM_13_LetsForgetOurLittleFight"		;//Dobrá, zapomeòme na tuhle hádku, dobrı?
	Strange						=	"SVM_13_Strange"						;//Kam se podìl? To není moné!
	DieMonster					=	"SVM_13_DieMonster"						;//Dnes veèer budeme mít maso!
	DieMortalEnemy				=	"SVM_13_DieMortalEnemy"					;//Teï je øada na tobì! Bez milosti!
	NowWait						=	"SVM_13_NowWait"						;//To znamená poøádnı vıprask!
	YouStillNotHaveEnough		=	"SVM_13_YouStillNotHaveEnough"			;//U to znova nezkoušej! Jasnı?
	YouAskedForIt				=	"SVM_13_YouAskedForIt"					;//Sám jsi to chtìl!
	NowWaitIntruder				= 	"SVM_13_NowWaitIntruder"				;//Nemáš tu co pohledávat, vetøelèe!
	IWillTeachYouRespectForForeignProperty	=	"SVM_13_IWillTeachYouRespctForForeignProperty"	;//Asi tì budu muset praštit pøes prsty!
	DirtyThief					=	"SVM_13_DirtyThief"						;//Zlodìji prašivej! Zpøeráím ti hnáty...
	YouAttackedMyCharge			=	"SVM_13_YouAttackedMyCharge"			;//Tady se nikdo nikoho nedotkne, s vıjimkou mì!
	YouKilledOneOfUs			=	"SVM_13_YouKilledOneOfUs"				;//Zabil jsi jednoho z nás!
	Dead						=	"SVM_13_Dead"							;//Aaargl
	Aargh_1						=	"SVM_13_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_13_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_13_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_13_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_13_YoullBeSorryForThis"			;//Nebudeš mít moc èasu toho litovat!
	YesYes						=	"SVM_13_YesYes"							;//Nic se nedìje, vùbec nic!
	ShitWhatAMonster			=	"SVM_13_ShitWhatAMonster"				;//Nemám tu správnou zbraò. Ještì se uvidíme...
	Help						=	"SVM_13_Help"							;//Uuuuaaaaahh! Zmiz!
	WeWillMeetAgain				=	"SVM_13_WeWillMeetAgain"				;//Ještì se uvidíme!
	NeverTryThatAgain			=	"SVM_13_NeverTryThatAgain"				;//Pøíštì tì zabiju!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"				;//Pìkná zbraò! Tvoje? Ne? Dobrá!
	ITookYourOre				=	"SVM_13_ITookYourOre"					;//Doufám, e se na mì nenaštveš, kdy si vezmu trochu rudy.
	ShitNoOre					=	"SVM_13_ShitNoOre"						;//Ty u nemáš ani kousek rudy!
	HandsOff					=	"SVM_13_HandsOff"						;//Ty kryso! Ruce pryè, nebo tì zabiju!
	GetOutOfHere				=	"SVM_13_GetOutOfHere"					;//Padej odsud! Kliï se odsuï!
	YouViolatedForbiddenTerritory=	"SVM_13_YouViolatedForbiddenTerritory"	;//Co tady pohledáváš?
	YouWannaFoolMe				=	"SVM_13_YouWannaFoolMe"					;//Ty se mì snad snaíš pøechytraèit?
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"			;//Hej, ty! Co tady pohledáváš?
	WhyAreYouInHere				=	"SVM_13_WhyYouAreInHere"				;//Co tady dìláš? Upaluj nebo zavolám stráe!
	WhatDidYouInThere			=	"SVM_13_WhatDidYouInThere"				;//Tady nemáš co dìlat!
	WiseMove					=	"SVM_13_WiseMove"						;//Máš štìstí! Nejradši bych ti dal jednu po tlamì!
	Alarm						=	"SVM_13_Alarm"							;//Stráe! Sem!
	IntruderAlert				= 	"SVM_13_IntruderAlert"					;//POZOR!!
	BehindYou					=	"SVM_13_BehindYou"						;//Za tebou!
	TheresAFight				=	"SVM_13_TheresAFight"					;//Uvidíme, kdo bude rát hlínu první.
	HeyHeyHey					=	"SVM_13_HeyHeyHey"						;//Vıbornì! Ještì!
	CheerFight					=	"SVM_13_CheerFight"						;//Chci vidìt krev!
	CheerFriend					=	"SVM_13_CheerFriend"					;//Uka mu!
	Ooh							=	"SVM_13_Ooh"							;//Stáhni se, idiote!
	YeahWellDone				=	"SVM_13_YeahWellDone"					;//Uuaahh!!!
	RunCoward					=	"SVM_13_RunCoward"						;//Uahh, upaluj pryè!
	HeDefeatedHim				=	"SVM_13_HeDefeatedHim"					;//Trapné vystoupení! Slabounkı závan vìtru a uletìl jako vìchet slámy!
	HeDeservedIt				=	"SVM_13_HeDeservedIt"					;//Uh! Nandej mu to!
	HeKilledHim					=	"SVM_13_HeKilledHim"					;//To je sebevrada, zabít nìkoho pøed svìdky!
	ItWasAGoodFight				=	"SVM_13_ItWasAGoodFight"				;//Pìknı boj!
	Awake						=	"SVM_13_Awake"							;//Uuahh
	FriendlyGreetings			=	"SVM_13_FriendlyGreetings"				;//Jsi v poøádku?
	ALGreetings					=	"SVM_13_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_13_MageGreetings"					;//Za slávu magie!
	SectGreetings				=	"SVM_13_SectGreetings"					;//Vzbuï se!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Jsi slepı? Támhle!
	NoLearnNoPoints				= 	"SVM_13_NoLearnNoPoints"				;//Nemùu tì nic nauèit. Nemáš dost zkušeností.
	NoLearnOverMax				= 	"SVM_13_NoLearnOverMax"					;//Jsi u konce svıch moností. Mìl by ses uèit nìco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_13_NoLearnYouAlreadyKnow"			;//Aby ses mohl stát vùdcem, musíš na sobì ještì pracovat!
	NoLearnYoureBetter			=	"SVM_13_NoLearnYoureBetter"				;//U je to s tebou lepší!
	HeyYou						=	"SVM_13_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_13_NotNow"							;//Teï ne!
	WhatDoYouWant				=	"SVM_13_WhatDoYouWant"					;//Chceš ode mì nìco?
	ISaidWhatDoYouWant			=	"SVM_13_ISaidWhatDoYouWant"				;//Mùu pro tebe nìco udìlat?
	MakeWay						=	"SVM_13_MakeWay"						;//Nech mì jít!
	OutOfMyWay					=	"SVM_13_OutOfMyWay"						;//Uhni mi z cesty, èlovìèe!
	YouDeafOrWhat				=	"SVM_13_YouDeafOrWhat"					;//Hledáš problémy? Uhni!
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"			;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_13_LookAway"						;//NIC jsem nevidìl!
	OkayKeepIt					=	"SVM_13_OkayKeepIt"						;//Dobrá. Je tvoje.
	WhatsThat					=	"SVM_13_WhatsThat"						;//Co to bylo?
	ThatsMyWeapon				=	"SVM_13_ThatsMyWeapon"					;//Vra mi moji zbraò!
	GiveItToMe					=	"SVM_13_GiveItToMe"						;//Dej mi ji!
	YouCanKeeptheCrap			=	"SVM_13_YouCanKeeptheCrap"				;//Dobrá! Nech si ji! Najdu jiné øešení!
	TheyKilledMyFriend			=	"SVM_13_TheyKilledMyFriend"				;//Jeden z nás je mrtev. To si zasluhuje odplatu!
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"			;//Proè jsi mì vzbudil?
	SuckerGotSome				=	"SVM_13_SuckerGotSome"					;//Dostal jsi nakládaèku, o kterou sis koledoval!
	SuckerDefeatedEBr			=	"SVM_13_SuckerDefeatedEBr"				;//Porazil jsi Rudobarona! Bude na tebe poøádnì naštvanı!
	SuckerDefeatedGur			=	"SVM_13_SuckerDefeatedGur"				;//Porazil jsi jednoho z Guru. Vypadá to, e pøitahuješ problémy jako magnet!
	SuckerDefeatedMage			=	"SVM_13_SuckerDefeatedMage"				;//Zvítìzit nad mágem je opravdu šílenı nápad, èlovìèe!
	SuckerDefeatedNov_Guard		= 	"SVM_13_SuckerDefeatedNov_Guard"		;//Tak ty jsi ten, kdo mlátí novice!
	SuckerDefeatedVlk_Guard		= 	"SVM_13_SuckerDefeatedVlk_Guard"		;//Nech mé hochy na pokoji!
	YouDefeatedMyComrade		=	"SVM_13_YouDefeatedMyComrade"			;//Motat se kolem mıch pøátel není rozumné!
	YouDefeatedNOV_Guard		=	"SVM_13_YouDefeatedNOV_Guard"			;//Nebudeš tu dìlat problémy!
	YouDefeatedVLK_Guard		=	"SVM_13_YouDefeatedVLK_Guard"			;//Jestli vztáhneš ruku na nìkoho, kdo je pod mojí ochranou, tak si to schytáš!
	YouStoleFromMe				=	"SVM_13_YouStoleFromMe"					;//Seš mi ukradenej, ty zmetku! U to znovu nezkoušej!
	YouStoleFromUs				=	"SVM_13_YouStoleFromUs"					;//Chceme naše vìci zpátky! Vra nám je!
	YouStoleFromEBr				=	"SVM_13_YouStoleFromEBr"				;//Kradl jsi u Rudobaronù? Probùh, proè?
	YouStoleFromGur				=	"SVM_13_YouStoleFromGur"				;//Okradl jsi Guru? Jaká škoda, e tì nachytali!
	StoleFromMage				=	"SVM_13_StoleFromMage"					;//Kradl jsi u mágù! Jak stupidní nápad!
	YouKilledMyFriend			=	"SVM_13_YouKilledMyFriend"				;//Jeden z našich lidí zemøel a ty s tím máš co do èinìní! Staèí malá chybièka a pùjdeš za ním!
	YouKilledEBr				=	"SVM_13_YouKilledEBr"					;//Zabil jsi jednoho z Rudobaronù! Èlovìèe, úplnì ses pominul?
	YouKilledGur				=	"SVM_13_YouKilledGur"					;//Zabil jsi jednoho z Guru! Tomu, hochu, nemùu uvìøit!
	YouKilledMage				=	"SVM_13_YouKilledMage"					;//Zabil jsi jednoho z mágù! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_13_YouKilledOCfolk"				;//Jeden z èlenù Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_13_YouKilledNCfolk"				;//Novı tábor utrpìl tìkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_13_YouKilledPSIfolk"				;//Bratrstvo ztratilo jednoho ze svıch vìøících a ty ho máš na svìdomí!
	GetThingsRight				=	"SVM_13_GetThingsRight"					;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_13_YouDefeatedMeWell"				;//Poøádnì jsi mi to nandal, èlovìèe. Byl to dobrı boj! Ale teï u je konec!
	Smalltalk01					=	"SVM_13_Smalltalk01"					;// ...kdy myslíš...
	Smalltalk02					=	"SVM_13_Smalltalk02"					;// ...moná...
	Smalltalk03					=	"SVM_13_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_13_Smalltalk04"					;// ...udìlám nejlíp, kdy se budu dret dál...
	Smalltalk05					=	"SVM_13_Smalltalk05"					;// ...tohle opravdu není mùj problém...
	Smalltalk06					=	"SVM_13_Smalltalk06"					;// ...bylo jasné, e z toho bude mrzutost...
	Smalltalk07					=	"SVM_13_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vìdìt...
	Smalltalk08					=	"SVM_13_Smalltalk08"					;// ...u se to znovu nestane...
	Smalltalk09					=	"SVM_13_Smalltalk09"					;// ...a pøesto na tom musí nìco bıt...
	Smalltalk10					=	"SVM_13_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem øíkáš...
	Smalltalk11					=	"SVM_13_Smalltalk11"					;// ...jestli se mì to netıká...
	Smalltalk12					=	"SVM_13_Smalltalk12"					;// ...nemìl bys všemu vìøit...
	Smalltalk13					=	"SVM_13_Smalltalk13"					;// ...pøesto bych nechtìl bıt v jeho kùi...
	Smalltalk14					=	"SVM_13_Smalltalk14"					;// ...poøád ta samá pohádka...
	Smalltalk15					=	"SVM_13_Smalltalk15"					;// ...nìkteøí lidé se nikdy nepouèí...
	Smalltalk16					=	"SVM_13_Smalltalk16"					;// ...døíve bıvalo všechno docela jinak...
	Smalltalk17					=	"SVM_13_Smalltalk17"					;// ...lidé øíkají...
	Smalltalk18					=	"SVM_13_Smalltalk18"					;// ...takové øeèi já nikdy neposlouchám...
	Smalltalk19					=	"SVM_13_Smalltalk19"					;// ...na nìkoho se spoléháš a dostaneš se do problémù, tak to chodí...
	Smalltalk20					=	"SVM_13_Smalltalk20"					;// ...pochybuji, e by se to mohlo zmìnit...
	Smalltalk21					=	"SVM_13_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_13_Smalltalk22"					;// ...vydr. Lepší je do nièeho se nepouštìt...
	Smalltalk23					=	"SVM_13_Smalltalk23"					;// ...myslel jsem, e u je to dávno za námi...
	Smalltalk24					=	"SVM_13_Smalltalk24"					;// ...pojïme radìji mluvit o nìèem jiném...
	Om							= 	"SVM_13_Om"							;//Hmmm
};



//////////////////////////////////////////
instance SVM_14	(C_SVM)				// Xardas(DMB),Corristo,Erzähler	alt	arrogant, gebildet
{
	StopMagic					=	"SVM_14_StopMagic"						;//Pøestaò u s tìmi kouzly!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"					;//Slyšel jsi mì! Pøestaò s tìmi kouzly!
	WeaponDown					=	"SVM_14_WeaponDown"						;//Co chceš s tou zbraní udìlat, èlovìèe!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Dej tu zbraò pryè!
	WatchYourAim				=	"SVM_14_WatchYourAim"					;//Míøíš na mì!
	WatchYourAimAngry			=	"SVM_14_WatchYourAimAngry"				;//Tak pøestaneš na mì míøit?
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Tak dávej pozor!
	LetsForgetOurLittleFight	=	"SVM_14_LetsForgetOurLittleFight"		;//Zapomeòme na tuhle malou neshodu názorù!
	Strange						=	"SVM_14_Strange"						;//Dobrı trik, najednou zmizel!
	DieMonster					=	"SVM_14_DieMonster"						;//Otravná stvùra.
	DieMortalEnemy				=	"SVM_14_DieMortalEnemy"					;//Musím tì zabít... Nic osobního, chápeš!
	NowWait						=	"SVM_14_NowWait"						;//Pro dnešek dost!
	YouStillNotHaveEnough		=	"SVM_14_YouStillNotHaveEnough"			;//U nechceš mít znova problémy, viï?
	YouAskedForIt				=	"SVM_14_YouAskedForIt"					;//Takhle jsi to chtìl!
	NowWaitIntruder				= 	"SVM_14_NowWaitIntruder"				;//Nebyl jsi pozvanı!
	IWillTeachYouRespectForForeignProperty	=	"SVM_14_IWillTeachYouRespectForForeignProperty"	;//Do mıch vìcí ti nic není!
	DirtyThief					=	"SVM_14_DirtyThief"						;//Nìco sis ode mì vypùjèil! Teï mi to budeš muset zaplatit!
	YouAttackedMyCharge			=	"SVM_14_YouAttackedMyCharge"			;//Musíš se nauèit dodrovat pravidla!
	YouKilledOneOfUs			=	"SVM_14_YouKilledOneOfUs"				;//Nìkoho jsi zabil!
	Dead						=	"SVM_14_Dead"							;//Aaargl
	Aargh_1						=	"SVM_14_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_14_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_14_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_14_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_14_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_14_YesYes"							;//Dobøe, dobøe!
	ShitWhatAMonster			=	"SVM_14_ShitWhatAMonster"				;//Tuhle vızvu teï nechci pøijmout!
	Help						=	"SVM_14_Help"							;//Potøebuji se vrátit k svım studiím!
	WeWillMeetAgain				=	"SVM_14_WeWillMeetAgain"				;//Urèitì se ještì uvidíme!
	NeverTryThatAgain			=	"SVM_14_NeverTryThatAgain"				;//Radìji u to znova nedìlej!
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Vezmu si tu zbraò!
	ITookYourOre				=	"SVM_14_ITookYourOre"					;//Ta ruda je jistì znamenitá!
	ShitNoOre					=	"SVM_14_ShitNoOre"						;//Nemáš ádnou rudu!
	HandsOff					=	"SVM_14_HandsOff"						;//Ruce pryè!
	GetOutOfHere				=	"SVM_14_GetOutOfHere"					;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_14_YouViolatedForbiddenTerritory"	;//Jak jsi se sem dostal?
	YouWannaFoolMe				=	"SVM_14_YouWannaFoolMe"					;//Ty si snad dìláš legraci!
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"			;//Po èem tady slídíš?
	WhyAreYouInHere				=	"SVM_14_WhyYouAreInHere"				;//Vypadni nebo zavolám stráe!
	WhatDidYouInThere			=	"SVM_14_WhatDidYouInThere"				;//Tady nemáš co dìlat! Rozumíš?
	WiseMove					=	"SVM_14_WiseMove"						;//Chytré rozhodnutí!
	Alarm						=	"SVM_14_Alarm"							;//Stráe, sem!
	IntruderAlert				= 	"SVM_14_IntruderAlert"					;//VETØELEC!!!
	BehindYou					=	"SVM_14_BehindYou"						;//Za tebou!
	TheresAFight				=	"SVM_14_TheresAFight"					;//Do boje!
	HeyHeyHey					=	"SVM_14_HeyHeyHey"						;//Hmmm.
	CheerFight					=	"SVM_14_CheerFight"						;//Jak neschopnı!
	CheerFriend					=	"SVM_14_CheerFriend"					;//Vypadá snaivì!
	Ooh							=	"SVM_14_Ooh"							;//To bylo trapné!
	YeahWellDone				=	"SVM_14_YeahWellDone"					;//To je jedinı zpùsob, jako to udìlat....
	RunCoward					=	"SVM_14_RunCoward"						;//Nìco se nauèil!
	HeDefeatedHim				=	"SVM_14_HeDefeatedHim"					;//To bylo a potom!
	HeDeservedIt				=	"SVM_14_HeDeservedIt"					;//Dobøe mu tak!
	HeKilledHim					=	"SVM_14_HeKilledHim"					;//Nebylo nutné ho zabíjet, budeš mít z toho velkou nepøíjemnost!
	ItWasAGoodFight				=	"SVM_14_ItWasAGoodFight"				;//Takovéhle šarvátky mì nudí!
	Awake						=	"SVM_14_Awake"							;//Zaspal jsem?
	FriendlyGreetings			=	"SVM_14_FriendlyGreetings"				;//Nazdar.
	ALGreetings					=	"SVM_14_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_14_MageGreetings"					;//Za slávu magie!
	SectGreetings				=	"SVM_14_SectGreetings"					;//Vzbuï se!
	ThereHeIs					= 	"SVM_14_ThereHeIs"						;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_14_NoLearnNoPoints"				;//Nemùu tì nic nauèit. Nemáš dost zkušeností.
	NoLearnOverMax				= 	"SVM_14_NoLearnOverMax"					;//Jsi u konce svıch moností. Mìl by ses uèit nìco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_14_NoLearnYouAlreadyKnow"			;//Aby ses mohl stát vùdcem, musíš na sobì ještì pracovat!
	NoLearnYoureBetter			=	"SVM_14_NoLearnYoureBetter"				;//U je to s tebou lepší!
	HeyYou						=	"SVM_14_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_14_NotNow"							;//Teï ne!
	WhatDoYouWant				=	"SVM_14_WhatDoYouWant"					;//Co pro tebe mùu udìlat?
	ISaidWhatDoYouWant			=	"SVM_14_ISaidWhatDoYouWant"				;//Mùu ti pomoci?
	MakeWay						=	"SVM_14_MakeWay"						;//Ustup stranou!
	OutOfMyWay					=	"SVM_14_OutOfMyWay"						;//Nech mì jít!
	YouDeafOrWhat				=	"SVM_14_YouDeafOrWhat"					;//Teï se ztra!
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"			;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_14_LookAway"						;//Nezajímá mì, co máš za lubem!
	OkayKeepIt					=	"SVM_14_OkayKeepIt"						;//Nech si ji!
	WhatsThat					=	"SVM_14_WhatsThat"						;//Co to bylo?
	ThatsMyWeapon				=	"SVM_14_ThatsMyWeapon"					;//Vra mi moji zbraò!
	GiveItToMe					=	"SVM_14_GiveItToMe"						;//Vra mi ji!
	YouCanKeeptheCrap			=	"SVM_14_YouCanKeeptheCrap"				;//Dobøe. U ji nechci!
	TheyKilledMyFriend			=	"SVM_14_TheyKilledMyFriend"				;//Dostali jednoho z našich chlapíkù. Najdeme viníka...
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"			;//Rušíš mì pøi studiích!
	SuckerGotSome				=	"SVM_14_SuckerGotSome"					;//Slyšel jsem, e máš problémy!
	SuckerDefeatedEBr			=	"SVM_14_SuckerDefeatedEBr"				;//Porazil jsi Rudobarona! Nestaèil se divit!
	SuckerDefeatedGur			=	"SVM_14_SuckerDefeatedGur"				;//Porazil jsi jednoho z Guru. Skvìlé.
	SuckerDefeatedMage			=	"SVM_14_SuckerDefeatedMage"				;//Zvítìzit nad mágem...
	SuckerDefeatedNov_Guard		= 	"SVM_14_SuckerDefeatedNov_Guard"		;//Víš, e tihle novicové jsou pod mojí ochranou. A pøesto na nì poøád doráíš!
	SuckerDefeatedVlk_Guard		= 	"SVM_14_SuckerDefeatedVlk_Guard"		;//Jestli se dotkneš kopáèù, jako bys sahal na moje pøíjmy!
	YouDefeatedMyComrade		=	"SVM_14_YouDefeatedMyComrade"			;//Nemìl by ses zaplétat s mımi pøáteli.
	YouDefeatedNOV_Guard		=	"SVM_14_YouDefeatedNOV_Guard"			;//Ještì jednou se dotkneš nìkterého novice a budeš litovat!
	YouDefeatedVLK_Guard		=	"SVM_14_YouDefeatedVLK_Guard"			;//Jestli se pustíš do nìkterého z mıch chránìncù, mohlo by tì to stát hlavu!
	YouStoleFromMe				=	"SVM_14_YouStoleFromMe"					;//Jak se tu opovauješ objevit, ty zlodìji?
	YouStoleFromUs				=	"SVM_14_YouStoleFromUs"					;//Máš u sebe nìco, co patøí nám. Vra nám to!
	YouStoleFromEBr				=	"SVM_14_YouStoleFromEBr"				;//Èlovìèe, tys kradl u Rudobaronù? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_14_YouStoleFromGur"				;//Okradl jsi Guru o pár vìcí, viï?
	StoleFromMage				=	"SVM_14_StoleFromMage"					;//Okradl jsi mágy o pár vìcí, viï?
	YouKilledMyFriend			=	"SVM_14_YouKilledMyFriend"				;//Máš na svìdomí jednoho z našich muù. Staèí malá chybièka a pøijde øada na tebe!
	YouKilledEBr				=	"SVM_14_YouKilledEBr"					;//Zabil jsi jednoho z Rudobaronù! Èlovìèe, úplnì ses pominul?
	YouKilledGur				=	"SVM_14_YouKilledGur"					;//Zabil jsi jednoho z Guru! Nemùu tomu uvìøit!
	YouKilledMage				=	"SVM_14_YouKilledMage"					;//Zabil jsi jednoho z mágù! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_14_YouKilledOCfolk"				;//Jeden z èlenù Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_14_YouKilledNCfolk"				;//Novı tábor utrpìl tìkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_14_YouKilledPSIfolk"				;//Bratrstvo ztratilo jednoho ze svıch vìøících a ty ho máš na svìdomí!
	GetThingsRight				=	"SVM_14_GetThingsRight"					;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_14_YouDefeatedMeWell"				;//Poøádnì jsi mi to nandal, èlovìèe. Byl to dobrı boj! Ale teï u je konec!
	Smalltalk01					=	"SVM_14_Smalltalk01"					;// ...kdy myslíš...
	Smalltalk02					=	"SVM_14_Smalltalk02"					;// ...moná...
	Smalltalk03					=	"SVM_14_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_14_Smalltalk04"					;// ...udìlám nejlíp, kdy se budu dret dál...
	Smalltalk05					=	"SVM_14_Smalltalk05"					;// ...tohle opravdu není mùj problém...
	Smalltalk06					=	"SVM_14_Smalltalk06"					;// ...bylo jasné, e z toho bude mrzutost...
	Smalltalk07					=	"SVM_14_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vìdìt...
	Smalltalk08					=	"SVM_14_Smalltalk08"					;// ...u se to znovu nestane...
	Smalltalk09					=	"SVM_14_Smalltalk09"					;// ...a pøesto na tom musí nìco bıt...
	Smalltalk10					=	"SVM_14_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem øíkáš...
	Smalltalk11					=	"SVM_14_Smalltalk11"					;// ...jestli se mì to netıká...
	Smalltalk12					=	"SVM_14_Smalltalk12"					;// ...nemìl bys všemu vìøit...
	Smalltalk13					=	"SVM_14_Smalltalk13"					;// ...pøesto bych nechtìl bıt v jeho kùi...
	Smalltalk14					=	"SVM_14_Smalltalk14"					;// ...poøád ta samá pohádka...
	Smalltalk15					=	"SVM_14_Smalltalk15"					;// ...nìkteøí lidé se nikdy nepouèí...
	Smalltalk16					=	"SVM_14_Smalltalk16"					;// ...døíve bıvalo všechno docela jinak...
	Smalltalk17					=	"SVM_14_Smalltalk17"					;// ...lidé øíkají...
	Smalltalk18					=	"SVM_14_Smalltalk18"					;// ...takové øeèi já nikdy neposlouchám...
	Smalltalk19					=	"SVM_14_Smalltalk19"					;// ...na nìkoho se spoléháš a dostaneš se do problémù, tak to chodí...
	Smalltalk20					=	"SVM_14_Smalltalk20"					;// ...pochybuji, e by se to mohlo zmìnit...
	Smalltalk21					=	"SVM_14_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_14_Smalltalk22"					;// ...vydr. Lepší je do nièeho se nepouštìt...
	Smalltalk23					=	"SVM_14_Smalltalk23"					;// ...myslel jsem, e u je to dávno za námi...
	Smalltalk24					=	"SVM_14_Smalltalk24"					;// ...pojïme radìji mluvit o nìèem jiném...
	Om							= 	"SVM_14_Om"							;//Hmmm
};


//////////////////////////////////////////
INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Hej, ty!
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Poèkej!

	SectGreetings			=	"SVM_15_SectGreetings"				;//Vzbuï se!
	ALGreetings				=	"SVM_15_ALGreetings"				;//Za Gomeze!
	MageGreetings			=	"SVM_15_MageGreetings"				;//Zdravím.
	FriendlyGreetings		=	"SVM_15_FriendlyGreetings"			;//Zdar.
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaargl
	Awake					=	"SVM_15_Awake"						;//(probouzí se)
	DoesntWork				= 	"SVM_15_DoesntWork"					;//Nejde to.
	PickBroke				= 	"SVM_15_PickBroke"					;// Hm, je to rozbité.
	NeedKey					= 	"SVM_15_NeedKey"					;// Potøebuji od toho klíè...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;// U ádnı další paklíè není...
	InvFull					= 	"SVM_15_InvFull"					;// Nemùu s tím nic víc udìlat.
};

//////////////////////////////////////////
INSTANCE SVM_16	(C_SVM)				// Stimmbeschreibung	:		Babes halt!!!!!
{
	NotNow						=	"SVM_16_NotNow"			;	//Jdi pryè! Se mnou nesmíš mluvit!
	Help						=	"SVM_16_Help"			;	//(vıkøiky)
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




