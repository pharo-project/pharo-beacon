initialization
entryCount: anInteger

	mutex critical: [
		maximumEntryCount := anInteger.
		self basicReset ]