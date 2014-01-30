gcc -O2 -s -static-libgcc -fPIC libexif/*.c libexif/*/*.c -shared -o ../../bin/linux64/libexif.so -I. \
    -DHAVE_GETTEXT=1 -DGETTEXT_PACKAGE=\"libexif\" -DLOCALEDIR=\"UTF-8\"
