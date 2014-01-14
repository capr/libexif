gcc $CFLAGS libexif/*.c libexif/*/*.c -shared -o ../../bin/mingw32/exif.dll -Wall -I. -D__WATCOMC__

#cd ../.. && bin/luajit libexif.lua
