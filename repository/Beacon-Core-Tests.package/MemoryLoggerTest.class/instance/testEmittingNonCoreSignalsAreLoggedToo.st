testing
testEmittingNonCoreSignalsAreLoggedToo
	| logger |
	logger := MemoryLogger new.
	logger start. 
	DummySignal new emit.
	self assert: logger entryCount equals: 1