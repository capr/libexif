gcc -s -O3 -shared -static-libgcc -o ../../bin/mingw32/exif.dll -g -Wall libexif/*.c libexif/*/*.c -I. -D__WATCOMC__

#cd ../.. && bin/luajit libexif.lua
