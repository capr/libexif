--libexif binding
local ffi = require'ffi'
local C = ffi.load'exif'
require'libexif_h'

local exif = {
	C = C
}

local eData = {}
eData.__index = eData

function eData:GetTags()
	local Tags = {}

	C.exif_data_foreach_content(self.raw, function(ExifContent)
		C.exif_content_fix(ExifContent)
		local IFD = C.exif_content_get_ifd(ExifContent)

		C.exif_content_foreach_entry(ExifContent, function(ExifEntry)
			C.exif_entry_fix(ExifEntry)
			local TagName = ffi.string(C.exif_tag_get_name_in_ifd(ExifEntry.tag, IFD))
			local TagValue = ffi.string(C.exif_entry_get_value(ExifEntry, ffi.new("char[1024]"), 1024))

			if TagValue == "Internal error (unknown value 0)" then
				TagValue = nil
			end -- Exception
			
			Tags[TagName] = TagValue
		end, newproxy())
	end, newproxy())

	return Tags
end

function eData:free()
	return C.exif_data_free(self.raw)
end

function exif.openfile(path)
	if type(path) ~= "string" then
		return false
	end

	local ExifData = C.exif_data_new_from_file(path)

	if ExifData == nil then
		C.exif_data_free(ExifData)

		return false
	end

	return setmetatable({
		raw = ExifData
	}, eData)
end

if not ... then
	local ExifData = exif.openfile('media/jpeg/autumn-wallpaper.jpg')

	if ExifData ~= nil then
		local tags = ExifData:GetTags()

		if tags.Software then
			print("This image was made in \"" .. tags.Software .. "\".")
		else
			print("The image doesn't have information about software in which it was created!")
		end

		ExifData:free()
	else
		print("Looks like image doesn't have EXIF informaton or path is not valid.")
	end
end

return exif