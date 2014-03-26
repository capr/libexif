gcc -arch i386 -O2 libexif/*.c libexif/*/*.c -shared -install_name @loader_path/libexif.dylib -o ../../bin/osx32/libexif.dylib -I. \
    -DHAVE_GETTEXT=1 -DGETTEXT_PACKAGE=\"libexif\" -DLOCALEDIR=\"UTF-8\"
