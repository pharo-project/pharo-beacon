initialize
entryCount: anInteger

	mutex critical: [
		entryCount := anInteger.
		self basicReset ]