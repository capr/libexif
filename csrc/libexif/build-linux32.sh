gcc -O2 -s -static-libgcc libexif/*.c libexif/*/*.c -shared -o ../../bin/linux32/libexif.so -I. \
    -DHAVE_GETTEXT=1 -DGETTEXT_PACKAGE=\"libexif\" -DLOCALEDIR=\"UTF-8\"
