local exif = require"libexif"
local ExifData = exif.openfile('media/jpeg/autumn-wallpaper.jpg')

local CompareTable = {
	ColorSpace = "sRGB",
	DateTime = "2007:12:18 07:24:35",
	ExifVersion = "Exif Version 2.1",
	FlashPixVersion = "FlashPix Version 1.0",
	Orientation = "Top-left",
	PixelXDimension = "1920",
	PixelYDimension = "1080",
	ResolutionUnit = "Inch",
	Software = "Adobe Photoshop Elements 4.0.1 Macintosh",
	XResolution = "72",
	YResolution = "72"
}

local CompareCheck = {}

for k, v in pairs(CompareTable) do
	CompareCheck[k] = false
end

if ExifData ~= nil then
	local tags = ExifData:GetTags()

	for k, v in pairs(tags) do
		if CompareTable[k] == v then
			CompareCheck[k] = true
		elseif CompareTable[k] == nil then
			print("[libexif] Image gets new unlisted tag!", k, v)
		else
			CompareCheck[k] = true
			print("[libexif] Image gets new value for tag!", k, v)
		end
	end

	local all = true

	for k, v in pairs(CompareCheck) do
		if v == false then
			print("[libexif] Image lost EXIF tag!", k)
			all = false
		end
	end

	if all then
		print("[libexif] All tags were found.")
	end
else
	print("[libexif] EXIF parsing fails")
end