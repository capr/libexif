gcc -arch x86_64 -O2 libexif/*.c libexif/*/*.c -shared -install_name @loader_path/libexif.dylib -o ../../bin/osx64/libexif.dylib -I. \
    -DHAVE_GETTEXT=1 -DGETTEXT_PACKAGE=\"libexif\" -DLOCALEDIR=\"UTF-8\"
