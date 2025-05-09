initialization
basicReset
	"It simply removes all recordings without
	affecting the running status of the logger.
	This method must be called from within the mutex."

	entries := Array new: maximumEntryCount.
	fullBuffer := false.
	loopCount := 0.
	lastEntryIndex := 0