testing
isLogging
	"Returns whether the receiver is actively logging log objects."
	isLogging isNil ifTrue: [isLogging := false].
	^isLogging
			