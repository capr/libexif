i686-w64-mingw32-gcc -m64 -O2 -s -static-libgcc libexif/*.c libexif/*/*.c -shared -o ../../bin/mingw64/exif.dll -I. \
    -DHAVE_GETTEXT=1 -DGETTEXT_PACKAGE=\"libexif\" -DLOCALEDIR=\"UTF-8\"
