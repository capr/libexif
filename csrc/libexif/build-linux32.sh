gcc $CFLAGS libexif/*.c libexif/*/*.c -shared -o ../../bin/linux32/libexif.so -Wall -I. -D__WATCOMC__

#cd ../.. && linux/bin/luajit libexif.lua
