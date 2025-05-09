testing
testEmittingNonCoreSignalsAreLoggedTooRunDuring
	| logger |
	logger := MemoryLogger new.
	logger runDuring: [ 
		DummySignal new emit ].
	self assert: logger entryCount equals: 1