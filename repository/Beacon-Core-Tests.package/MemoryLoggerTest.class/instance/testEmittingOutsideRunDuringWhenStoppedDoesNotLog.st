testing
testEmittingOutsideRunDuringWhenStoppedDoesNotLog

	| logger |
	logger := MemoryLogger new.
	logger stop.
	logger runDuring: [ 'should be in the log' emit ].
	'Should not be in the log' emit.
	self assert: logger entryCount equals: 1