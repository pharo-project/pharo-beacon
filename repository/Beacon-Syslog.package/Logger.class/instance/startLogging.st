actions
startLogging

	self isLogging ifTrue: [^self].
	isLogging := true.
	self emitStartLogging
			