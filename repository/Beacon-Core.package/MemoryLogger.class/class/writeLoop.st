private
writeLoop
	"Write the default instance out to a file every WritePeriod"

	[ self instance saveStonFile: self writeFilename.
	self writePeriod wait ] repeat