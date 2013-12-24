gcc -s -O3 -shared -o ../../bin/linux32/libexif.so -g -Wall libexif/*.c libexif/*/*.c -I. -D__WATCOMC__

#cd ../.. && linux/bin/luajit libexif.lua
