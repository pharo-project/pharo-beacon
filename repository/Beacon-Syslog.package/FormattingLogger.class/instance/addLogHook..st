adding
addLogHook: aLogEntry 
	"Convert the argument before handling it in some ways."
	self handleConvertedLog: (self convertLog: aLogEntry)