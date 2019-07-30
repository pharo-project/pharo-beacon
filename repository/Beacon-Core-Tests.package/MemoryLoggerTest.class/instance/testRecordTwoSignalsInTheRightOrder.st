testing
testRecordTwoSignalsInTheRightOrder
	| logger |
	logger := MemoryLogger new 
					runDuring: [ 
						StringSignal emit: 'test1'.
						StringSignal emit: 'test2' ].
	self assert: logger recordings size equals: 2.
	self assert: logger recordings first message equals: 'test1'.
	self assert: logger recordings last message equals: 'test2'