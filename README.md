# onscripter-jh-rg300x
[WIP] My ONScripter-jh RG300X port

## bugs, todo  
* GCWZero / gcw0 opendingux mips (mipsel) gcc toolchain, only support building on 32bit OS    
* Font not shown
* Key mapping  
* 16/32 colors ???  

## GCWZero / gcw0 opendingux mips (mipsel) gcc toolchain  
* (origin) https://git.libretro.com/libretro-infrastructure/libretro-build-dingux/-/tree/master/toolchain  
* Only suppurt 32bit, I use ubuntu14 32bit
* opendingux-gcw0-toolchain.2014-08-20.tar.bz2
* (not tested) opendingux-gcw0-toolchain.2021-09-08.tar.bz2
* Got from libretro git  
```
https://github.com/Ninoh-FOX/toolchain/releases/tag/08-09-2021

(x) https://github.com/suchipi/gcw0-dev-container/blob/main/Dockerfile

https://github.com/gameblabla/OpenDingux_test_app/tree/master

https://yukihiko.sano-ya.org/d/dsearch.cgi?C-00000039

https://git.libretro.com/libretro-infrastructure/libretro-build-dingux/-/tree/master/toolchain
https://git.libretro.com/libretro-infrastructure/libretro-build-dingux/-/tree/master

https://yukihiko.sano-ya.org/d/dsearch.cgi?C-00000039
```

## Steward-fu version build, but some fonts are not shown well (like period mark), need to modify it  
* (origin) https://steward-fu.github.io/website/handheld/rg350/build_onscripter.htm   
* (my mod) https://github.com/weimingtom/onscripter-jh-rg300x/blob/master/vendor/steward-fu/onscripter_v2_change_screen_size.tar.gz
* (elf file) https://github.com/weimingtom/onscripter-jh-rg300x/blob/master/vendor/steward-fu/onscripter_v2  
* Anbernic RG350 and Anbernic RetroGame (RS97) version, all are mipsel  
RG350 version is similar to ln93/Onscripter-GameCase, but not same  
RS97 version is music code mod of RG350 version (?)  
ln93/Onscripter-GameCase is the SDL1 branch of ONScripter-Jh  
https://steward-fu.github.io/website/handheld/rg350/build_onscripter.htm  
https://steward-fu.github.io/website/handheld/rs97/build_onscripter.htm  
https://github.com/steward-fu/website/releases?q=rg350&expanded=true  
https://github.com/steward-fu/website/releases?q=rs97&expanded=true  
https://github.com/ln93/Onscripter-GameCase  
search ln93_Onscripter-GameCase-master.zip,   
steward-fu_website_rg350_src_onscripter.tar.gz,   
steward-fu_website_rs97_src_onscripter.7z
