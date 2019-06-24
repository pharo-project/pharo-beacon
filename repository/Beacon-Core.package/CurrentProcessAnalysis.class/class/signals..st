instance creation
signals: aCollection
	"Open the receiver on the supplied set of signals"

	^self new initializeWith: (aCollection select: 
		[ :each | each class = CurrentProcessSignal ])