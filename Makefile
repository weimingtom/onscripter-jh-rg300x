# -*- Makefile -*-
#
# Makefile.Linux - Makefile rules for linux
#

#cross-compile configure freetype-2.3.12
#PATH=$PATH:/home/wmt/work_rg300x/gcw0-toolchain/usr/bin/ ./configure --prefix=/home/wmt/work_rg300x/local --host=mipsel-linux
#PATH=$PATH:/home/wmt/work_rg300x/gcw0-toolchain/usr/bin/ make

#copy this file from Makefile.Linux
#
#sudo apt-get install libsdl-dev
#(x)sudo apt-get install liblua5.1-0-dev
#sudo apt-get install libsdl-image1.2-dev 
#sudo apt-get install libsdl-ttf2.0-dev 
#sudo apt-get install libsdl-mixer1.2-dev 
#sudo apt-get install libbz2-dev
#(x)sudo apt-get install libfontconfig1-dev
#(x)sudo apt-get install libogg-dev
#(x)sudo apt-get install libvorbis-dev
#sudo apt-get install libfreetype-dev
#
GCWZERO:=1

#SDL_VIDEO_FBCON_ROTATION=NONE,CW,CCW,UD

EXESUFFIX =
OBJSUFFIX = .o

.SUFFIXES:
.SUFFIXES: $(OBJSUFFIX) .cpp .h

TARGET = onscripter$(EXESUFFIX) 
#\
#	sardec$(EXESUFFIX) \
#	nsadec$(EXESUFFIX) \
#	sarconv$(EXESUFFIX) \
#	nsaconv$(EXESUFFIX) 
EXT_OBJS = 

# mandatory: SDL, SDL_ttf, SDL_image, SDL_mixer, bzip2, libjpeg
ifeq ($(GCWZERO),1)
SYSROOT?=/home/wmt/work_rg300x/gcw0-toolchain/usr/mipsel-gcw0-linux-uclibc/sysroot
ARCH=
DEFS = -DLINUX -DNDEBUG -DGCWZERO 
#-DGCWZERO
INCS = -Os $(ARCH) -I./SDL_ttf-2.0.9_mod  -I${SYSROOT}/usr/include -I${SYSROOT}/usr/include/SDL -I${SYSROOT}/usr/include/freetype2 -ffunction-sections -fdata-sections -fpermissive
#-Wall
#-I./freetype-2.3.12/freetype2/freetype
LIBS = -L${SYSROOT}/usr/lib $(ARCH) -lSDL_image -lSDL_mixer -lSDL -lfreetype -ljpeg -lpng -lz -lbz2 -lpthread -lm
#-L./freetype-2.3.12/ 
#-L./libjpeg 
#-lSDL_ttf 
EXT_FLAGS =
else
DEFS = -DLINUX -DGCWZERO -g3 -O0 
#-DFREETYPE_HDR_DIRECTORY
INCS = -I./SDL_ttf-2.0.9_mod `sdl-config --cflags` -I/usr/include/freetype2
LIBS = `sdl-config --libs` -lSDL_mixer -lfreetype -lpng -ljpeg -lz -lm
#-lbz2 -lSDL_image -lSDL_ttf
endif

# recommended: smpeg
#DEFS += -DUSE_SMPEG
#INCS += `smpeg-config --cflags`
#LIBS += `smpeg-config --libs`

# recommended: fontconfig (to get default font)
#DEFS += -DUSE_FONTCONFIG
#LIBS += -lfontconfig

# recommended: OggVorbis 
#DEFS += -DUSE_OGG_VORBIS
#LIBS += -logg -lvorbis -lvorbisfile

# optional: Integer OggVorbis
#DEFS += -DUSE_OGG_VORBIS -DINTEGER_OGG_VORBIS
#LIBS += -lvorbisidec

# optional: support CD audio
#DEFS += -DUSE_CDROM

# optional: avifile
#DEFS += -DUSE_AVIFILE
#INCS += `avifile-config --cflags`
#LIBS += `avifile-config --libs`
#TARGET += simple_aviplay$(EXESUFFIX)
#EXT_OBJS += AVIWrapper$(OBJSUFFIX)

# optional: lua
#DEFS += -DUSE_LUA
#INCS += -I/usr/include/lua5.1
#LIBS += -llua5.1
#EXT_OBJS += LUAHandler$(OBJSUFFIX)

# optional: force screen width for PDA
#DEFS += -DPDA_WIDTH=640

# optional: enable English mode
#DEFS += -DENABLE_1BYTE_CHAR -DFORCE_1BYTE_CHAR


# for GNU g++
ifeq ($(GCWZERO),1)
CC = /home/wmt/work_rg300x/gcw0-toolchain/usr/bin/mipsel-linux-g++ 
LD = /home/wmt/work_rg300x/gcw0-toolchain/usr/bin/mipsel-linux-g++ -o
else
CC = g++ 
LD = g++ -o
endif

#CFLAGS = -g -Wall -pipe -c $(INCS) $(DEFS)
CFLAGS = -O3 -Wall -fomit-frame-pointer -pipe -c $(INCS) $(DEFS)

# for GCC on PowerPC specfied
#CC = powerpc-unknown-linux-gnu-g++
#LD = powerpc-unknown-linux-gnu-g++ -o

#CFLAGS = -O3 -mtune=G4 -maltivec -mabi=altivec -mpowerpc-gfxopt -mmultiple -mstring -Wall -fomit-frame-pointer -pipe -c $(INCS) $(DEFS)

# for Intel compiler
#CC = icc
#LD = icc -o

#CFLAGS = -O3 -tpp6 -xK -c $(INCS) $(DEFS)

RM = rm -f

include Makefile.onscripter
