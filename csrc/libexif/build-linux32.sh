gcc -O2 -s -static-libgcc libexif/*.c libexif/*/*.c -shared -o ../../bin/linux32/libexif.so -Wall -I. -D__WATCOMC__

#cd ../.. && linux/bin/luajit libexif.lua
