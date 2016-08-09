actions
stopLogging

	self isLogging ifFalse: [^self].
	isLogging := false.
	self emitStopLogging
			