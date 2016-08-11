operations
convertSignal: aSignal
	^ self formatter
		formatSignal: aSignal
		logger: self