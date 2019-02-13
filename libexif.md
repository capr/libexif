---
tagline: EXIF reader & writer
---

## `local libexif = require'libexif'`

A ffi binding of [libexif][libexif site], the library for reading and writing
EXIF information from/to image files.

## API

------------------------------------ -----------------------------------------
`exif.C`                             the libexif ffi clib object/namespace
`exif.openfile(path) -> ExifData`    open file and get EXIF information
`ExifData:GetTags() -> table`        return table of written tags
`ExifData:free()`                    free the ExifData
`ExifData.raw -> cdata`              return cdata of ExifData
------------------------------------ -----------------------------------------

### `exif.openfile(path) -> ExifData`

Open a JPEG image and read EXIF data.
`path` is a path to image location.
Will return `false` if `path` is not a string, not valid path or no EXIF data was found.
Return ExifData as an lua object. The cdata object stored in `ExifData.raw`.

### `ExifData:GetTags() -> table`

Return table of tags from ExifData.
Internally calls a foreach for all ExifContent in `ExifData`, fixes them then calls a foreach for all ExifEntry in ExifContent, fixes them and converts tags names and values to printable strings.
Fixing ExifContent and ExifEntry allows you to get at least some EXIF tags if JPEG was corrupted.

### `ExifData:free()`

Free the ExifData.

## Help needed

Currently there's the binary, sanitized header and the module stub that
returns the `clib` object so the library is usable at ffi level with the aid
of [libexif docs]. A Lua-ized API is made only for reading EXIF tags, but the library is otherwise usable without it.

[libexif site]:   http://libexif.sourceforge.net/
[libexif docs]:   http://libexif.sourceforge.net/api/