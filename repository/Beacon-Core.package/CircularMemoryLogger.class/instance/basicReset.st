initialize
basicReset
	"it simply removes all recordings without
	affecting the running status of the logger.
	This method must be called from within the mutex."

	recordings := Array new: entryCount.
	fullBuffer := false.
	loopCount := 0.
	index := 0.