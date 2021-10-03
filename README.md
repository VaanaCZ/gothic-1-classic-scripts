**The scripts are located in separate branches!**

# Gothic 1 Classic Scripts
For a project I have wanted to do for several years now, I've been in need of the original Gothic scripts in several languages. By default the original scripts are only available in German (from the MDK) and in English (from NicoDE's revised scripts), meaning the only other option was decompilation. 

However, because decompilation produces messy results (in more ways than one), I have instead opted to meticulously recreate the scripts for other languages using Nico's revised scripts as a base.

### Original scripts
I started out with the English scripts, gradually comparing and matching all the changes between different translations.  After some work, I ended up with scripts that when compiled, produce files that are identical to the original .DAT files in terms of their size, information and symbol order. 

There are minor differences in the OU caused by the fact that the translators often used different tools, which's effects I cannot reproduce by regular Spacer's reparsing process.

### Unified scripts
Here lies a problem, however. The translations were created by different companies at different times, meaning they have varying levels of up-to-dateness, and some of them are outright broken in some places *(like the Russian Russobit-M release)*. While this might not be a problem for your average playthrough, it does create a problem if you are trying to create a multilingual mod or patch.

Moreover, there are at least 3 separate versions of the default German scripts commonly shared.
Firstly, you have the 1.08h scripts, available from the German Steam version of Gothic. Then, you have the ones included in the MDK, which are newer, however even those are outdated. The newest scripts are the one in the German GOG release, which are even newer than the English scripts.

Therefore, I looked to solve this issue once and for all. I carefully compared all of the different scripts branches, to create a single most bug-free and up-to-date version of the scripts for 7 different languages *(EN, DE, PL, RU with both Snowball and Russobit-M, CS, ES and IT)*.

It's important to state that **this is not a bugfix!** These scripts are only as up-to-date as Piranha Bytes made them, meaning there are still lots of issues, that are outside the scope of this project.

**tl;dr**
basically, if you are looking to download the scripts to do some modding, download the unified scripts, they are newer.

### A few things to note
- encoding
- extended ASCII issue
- changes

**Tools used:**
- Spacer 1.5
- GothicSourcer 3.15
- DecDat
- WinMerge
- ...and a hanful custom-made scripts from dialogue/string comparison, stripping and replacement.