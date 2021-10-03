**The scripts are located in separate branches!**

# Gothic 1 Classic Scripts
For a project I have wanted to do for several years now, I've been in need of the original Gothic scripts in several languages. By default the original scripts are only available in German (from the MDK) and in English (from NicoDE's revised scripts), meaning the only other option was decompilation. 

However, because decompilation produces messy results (in more ways than one), I have instead opted to meticulously recreate the scripts for other languages using Nico's revised scripts as a base.

### Original scripts
I started out with the English scripts, gradually comparing and matching all the changes between different translations.  After some work, I ended up with scripts that when compiled, produce files that are identical to the original .DAT files in terms of their size, information and symbol order.

This means you can now use the original, not-decompiled scripts with all of the comments and formatting. 

There are minor differences in the OU caused by the fact that the translators often used different tools, which's effects I cannot reproduce by regular Spacer's reparsing process.

### Unified scripts
Here lies a problem, however. The translations were created by different companies at different times, meaning they have varying levels of up-to-dateness, and some of them are outright broken in some places *(like the Russian Russobit-M release)*. While this might not be a problem for your average playthrough, it does create a problem if you are trying to create a multilingual mod or patch.

Moreover, there are at least 3 separate versions of the default German scripts commonly shared.
Firstly, you have the 1.08h scripts, available from the German Steam version of Gothic. Then, you have the ones included in the MDK, which are newer, however even those are outdated. The newest scripts are the one in the German GOG release, which are even newer than the English scripts.

Therefore, I looked to solve this issue once and for all. I carefully compared all of the different scripts branches, to create a single most bug-free and up-to-date version of the scripts for 7 different languages *(EN, DE, PL, RU with both Snowball and Russobit-M, CS, ES and IT)*.

It's important to state that **this is not a bugfix!** These scripts are only as up-to-date as Piranha Bytes made them, meaning there are still lots of issues, that are outside the scope of this project.

**tl;dr**
basically, if you are looking to download the scripts to do some modding, download the unified scripts, they are newer.

## A few things to mention

### Encoding
The scripts are encoded in Windows-1250 for Latin languages *(English, German, Polish, Czech, Spanish and Italian)* and in Windows-1251 for Cyrillic languages *(Russian, both Snowball and Russobit-M)*. This is because Gothic does not support multibyte encodings and Unicode. Please also note, that in order to display the charatacters properly in-game, your game must also have the correct fontmap texture included.

### Extended ASCII trimming issue
When Spacer produces an OU file, it makes sure to trim any whitespace around the text of dialogues. Sadly, there is a small oversight in the piece of code that performs this trimming, in that it also removes any Non-Standard ASCII characters. This means that if your dialogue ends with any of these `áąćčďéěęíłńňóřśšťůýžźż` the ending of the dialoge will be trimmed.

For example `aáącčć` becomes just `aáąc`.

This issue mainly affects the Polish, Czech and both Snowball and Russobit-M Russian releases.

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

**Russian Snowball** (here the whole sentences disappears)
```d
AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_01");	//Кирка и пот - вот и все, что здесь есть. Ты пришел и скоро уйдешь…
```
```d
AI_Output(self,other,"Info_Mine_Vlk_4_Mine_01_01");	//Кирка и пот - вот и все, что здесь есть.
```

The simplest way to solve this is to make sure that your dialogue always ends with a Standard ASCII character such as a dot, comma or an exclamation mark. This is also the reason why the OU in the scripts differs, since I purposefully added dots to the ends of sentences which were affected by this problem.

The reason the original translations did not have this issue is because they used other methods which did not perform any whitespace trimming *(some used hex editors :-) )*.

### Changes

- changes

**Special thanks to:**
- NicoDE, for the English scripts
- MaGoth, for the LangPack

**Tools used:**
- Spacer 1.5
- GothicSourcer 3.15
- DecDat
- WinMerge
- ...and a hanful custom-made scripts from dialogue/string comparison, stripping and replacement.