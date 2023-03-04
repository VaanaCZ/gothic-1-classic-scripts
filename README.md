**The scripts are located in separate branches!**

# Gothic 1 Classic Scripts
For a project I have wanted to do for several years now, I've been in need of the original Gothic scripts in several languages. By default the original scripts are only available in German *(from the MDK)* and in English *(from NicoDE's revised scripts)*, meaning the only other option was decompilation. 

However, because decompilation produces messy results *(in more ways than one)*, I have instead opted to meticulously recreate the scripts for other languages using Nico's revised scripts as a base.

### Original scripts
I started out with the English scripts, gradually comparing and matching all the changes between different translations.  After some work, I ended up with scripts that when compiled, produce files that are identical to the original .DAT files in terms of their size, information and symbol order.

This means you can now use the original, not-decompiled scripts with all of the comments and formatting. So far the English, German, Polish, Russian *(both Snowball/1-C and Russobit-M)*, Czech, French, Spanish and Italian scripts are available, although other versions might come later. The English scripts were originally published by NicoDE, with some minor adjustments.

There are minor differences in the OU caused by the fact that the translators often used different tools, which's effects I cannot reproduce by regular Spacer's reparsing process.

### Unified scripts
Here lies a problem, however. The translations were created by different companies at different times, meaning they have varying levels of up-to-dateness, and some of them are outright broken in some places *(like the Russian Russobit-M release)*. While this might not be a problem for your average playthrough, it does create a problem if you are trying to create a multilingual mod or patch.

Moreover, there are at least 3 separate versions of the default German scripts commonly shared.
Firstly, you have the 1.08h scripts, available from the German Steam version of Gothic. Then, you have the ones included in the MDK, which are newer, however even those are outdated. The newest scripts are the one in the German GOG release, which are even newer than the English scripts.

Therefore, I looked to solve this issue once and for all. I carefully compared all of the different scripts branches, to create a single most bug-free and up-to-date version of the scripts for 7 different languages.

It's important to state that **this is not a bugfix!** These scripts are only as up-to-date as Piranha Bytes made them, meaning there are still lots of issues, that are outside the scope of this project.

**tl;dr**
basically, if you are looking to download the scripts to do some modding, download the unified scripts, they are newer.

## A few things to mention

### Encoding
The scripts are encoded in Windows-1250 for Latin languages *(English, German, Polish, Czech, French, Spanish and Italian)* and in Windows-1251 for Cyrillic languages *(Russian, both Snowball/1-C and Russobit-M)*. This is because Gothic does not support multibyte encodings and Unicode. Please also note, that in order to display the characters properly in-game, your game must have the correct fontmap texture included.

### Extended ASCII trimming issue
When Spacer produces an OU file, it makes sure to trim any whitespace around the texts of dialogues. Sadly, there is a small oversight in the piece of code that performs this trimming, in that it also removes any Non-Standard ASCII characters. This means that if your dialogue ends with any of these `áąćčďéěęíłńňóřśšťůýžźż` the ending of the dialogue will be trimmed.

For example `aáącčć` becomes just `aáąc`.

This issue mainly affects the Polish, Czech and both Snowball/1-C and Russobit-M Russian releases.

Here are a few examples, before and after:

**Czech**
```d
AI_Output(self,other,"DIA_Homer_Hello_02_03");    //Jestli to bude pokračovat, celá hráz bude co nevidět podhrabaná
```
```d
AI_Output(self,other,"DIA_Homer_Hello_02_03");    //Jestli to bude pokračovat, celá hráz bude co nevidět podhraban
```
**Polish**
```d
"SVM_11_NowWait";    //Byłoby dla ciebie lepiej, gdybyś tego nie zrobił
```
```d
"SVM_11_NowWait";    //Byłoby dla ciebie lepiej, gdybyś tego nie zrobi
```
**Russian - Snowball/1-C** (here the whole sentences disappears)
```d
AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_01");	//Кирка и пот - вот и все, что здесь есть. Ты пришел и скоро уйдешь…
```
```d
AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_01");	//Кирка и пот - вот и все, что здесь есть.
```

The simplest way to solve this is to make sure that your dialogue always ends with a Standard ASCII character such as a dot, comma or an exclamation mark. This is also the reason why the OU in the scripts differs, since I purposefully added dots to the ends of sentences which were affected by this problem.

The reason the original translations did not have this issue is because they used other methods which did not perform any whitespace trimming *(some used hex editors :-) )*.

### Technical differences
To some of you it may be useful to know how all of the translations differ and what needed to be changed when recreating them. Here is a brief summary of everything noteworthy for each version.

<details>
  <summary>Click to expand</summary>

#### German
The newest German scripts have a few differences from the ones in the MDK. Mainly, the In Extremo concert has been disabled and some incorrectly set `self` and `other` keywords have been fixed. 

Sadly, this newest release also introduces an issue with some dialogues missing audio, due to an attempted fix of mistyped dialogue names. In the original release, the ambient info dialogues for SFB 5 and Mine_Vlk 2, 3 and 4 have an incorrect SVM number specified in their dialogue names.

The newest German release "fixed" this by renaming the dialogues to what they should be *(e.g. `Info_Mine_Vlk_4_Mine_01_01` -> `Info_Mine_Vlk_4_Mine_04_01`)*. However, they did so without renaming the audio files or even reparsing the Output Units, meaning that these dialogues are now broken in-game. 

In the Unified scripts I changed these back to the incorrect name, so that way you get to keep the audio.

**Full changelog of what PB changed in said release:**
- Removed unused constant defines [system\MENU\menu_defines.d]
- Changed Bathbabe's name definition to use the newly added constant in text.d [content\AI\Test_Skripts\Testmodelle_Markus.d]
- Added a condition for Orc scouts, warriors and shamans [content\Story\B\B_AssignAmbientInfos.d]
- Changed incorrect SVM numbers in the names of dialogues [content\Story\B\B_AssignAmbientInfos_Mine_Vlk_2.d] [content\Story\B\B_AssignAmbientInfos_Mine_Vlk_3.d] [content\Story\B\B_AssignAmbientInfos_Mine_Vlk_4.d] [content\Story\B\B_AssignAmbientInfos_Sfb_5.d]
- Changed incorrectly used `self` and `other` keywords due to which the hero was opening his mouth while the NPC was talking, and vice versa. [content\Story\B\B_AssignAmbientInfos_Nov_5.d] [content\Story\B\B_AssignAmbientInfos_Tpl_8.d]
- Added ambient infos for Orcs (SVM 17) [content\Story\B\B_AssignAmbientInfos_Orc_17.d]
- Changed functions in B_InExtremo.d to use the newly added `INEXTREMOONSTAGE` variable [content\Story\B\B_InExtremo.d]
- Changed introducechapter in B_Kapitelwechsel to use the newly added constants in text.d [content\Story\CHAPTERS\B_Kapitelwechsel.d]
- Removed In Extremo by preventing them to spawn in the Chapter 2 [content\Story\CHAPTERS\B_Kapitelwechsel.d]
- Changed a log entry back to German which was translated to English in the MDK scripts [content\Story\CHAPTERS\B_Kapitelwechsel.d]
- Added missing dialogue text [content\Story\MISSIONS\DIA_ORC_Shaman.d] [content\Story\MISSIONS\DIA_Vlk_564_Jesse.d]
- Changed at which specific dialogue is the hero given the teleportation spell in the Orc Graveyard (`Info_BaalLukor_RUNES` - > `Info_BaalLukor_DOOR`) and added a condition in case hero already has it [MISSIONS\DIA_GUR_1211_BaalLukor.d]
- Removed the function call to start the In Extermo concert and disabled the dialogue itself [content\Story\MISSIONS\DIA_IE_397_Announcer.d]
- Added dialogues for the In Extremo publikum [content\Story\MISSIONS\DIA_IE_Publikum.d]
- Changed the waypoint at which Kharim begins to sharpen his sword (`OCR_OUTSIDE_HUT_31` -> `OCR_ARENABATTLE_OUTSIDE`) [content\Story\NPC\SLD_729_Kharim.d]
- Added the `inextremoonstage` variable [content\Story\Story_Globals.d]
- Added the `STR_BADENIXE` and `KapWeschsel` constants [content\Story\Text.d]

#### Czech and Polish

The Czech and Polish translation seems to be the same branch, which is not surprising considering they were both made by CD Projekt.

Here is everything that I had to change during reconstruction using the English scripts as base:
- Removed the condition for Orc scouts, warriors and shamans [content\Story\B\B_AssignAmbientInfos.d]
- Removed ambient infos for Orcs (SVM 17) [content\Story\B\B_AssignAmbientInfos_Orc_17.d]
- Changed back the `self` and `other` keywords to be incorrect [content\Story\B\B_AssignAmbientInfos_Tpl_8.d]
- Commented out the condition to start the In Extremo concert completely [content\Story\Chapters\B_Kapitelwechsel.d]
- Removed dialogues for the In Extremo publikum [content\Story\MISSIONS\DIA_IE_Publikum.d]
- Changed the dialogue that starts In Extremo to be inaccessible [content\Story\MISSIONS\DIA_VLK_580_Grim.d]
- Changed the text in Use_XP_Map. Probably intended for font testing [content\Story\NPC\PC_Hero.d]

The Polish version version has some additional changes which are not present in the Czech version:
- Changed the order at strings in G_CanNotUse are concatenated to better fit the Polish language [content\_intern\G_Functions\G_CanNotUse.d] [content\AI\AI_Intern\B_Functions.d]
- Added a new horizontal line in the 6th circle book, meaning that there is now a line right bellow the title (like in all the other magic circle books). This was an inconsistency that CD Projekt corrected [content\Items\Written.d]
- Changed the order of the "Ore/Items given" constants to be more consistent [content\Story\NPC\Text.d]

#### Russian Snowball/1-C

The Snowball/1-C release appears to have been made using the same branch as the Czech and Polish releases. This makes sense as CD Projekt is mentioned in the credits, meaning there probably was some cooperation behind the scenes.

Other than that, the only real change is that `G_CanNotCast` and `G_CanNotUse` have been adjusted to better fit the Russian language.

#### Russian Russobit-M

The Russobit release was made without access to the original scripts by manually editing the compiled OU.bin and OU.dat files. This can be deduced by the symbol order *(which is identical to the German 1.08h Steam release)* and the fact that the ou.bin file still says `date 25.4.2001 13:6:38 user pankratz`. As a result, waypoint and routine names were sometimes translated causing further issues. 

The Russobit translation also seems to be based on an older version of the German scripts than the Snowball/1-C version, which is the reason why it contains In Extremo.

#### French

Same as the English release.

#### Spanish and Italian

The Spanish and Italian translations share some things in common with both the newest German and English versions. For one they already contain the `KapWechsel` constants and the broken dialogues from the German release. However, they are not completely identical as they don't have the In Extremo changes and also miss some other text constants.

</details>

---
**Tools used:**
- Spacer 1.5
- GothicSourcer 3.15
- DecDat
- WinMerge
- ...and a hanful custom-made scripts from dialogue/string comparison, stripping and replacement.

**Special thanks to:**
- NicoDE, for the English scripts
- MaGoth, for the LangPack