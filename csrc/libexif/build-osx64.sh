gcc -O2 libexif/*.c libexif/*/*.c -shared -o ../../bin/osx64/libexif.dylib -I. \
    -DHAVE_GETTEXT=1 -DGETTEXT_PACKAGE=\"libexif\" -DLOCALEDIR=\"UTF-8\"
