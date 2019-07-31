This signal only stores the RingMethodDefinition and like that it does not hold the real entire stack. This is safer and smaller to store and serialize.

Usage:
	MethodStackSignal emit
	
Full Example:
	TranscriptLogger new 
		runDuring: [ MethodStackSignal emit ].
