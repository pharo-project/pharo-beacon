testing
testRecordTwoSignalsInTheRightOrder

	| logger |
	logger := MemoryLogger new runDuring: [
			          StringSignal emit: 'test1'.
			          StringSignal emit: 'test2' ].
	self assert: logger entries size equals: 2.
	self assert: logger entries first message equals: 'test1'.
	self assert: logger entries last message equals: 'test2'