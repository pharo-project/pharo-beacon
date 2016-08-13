testing
testRecordTwoSignalsInTheRightOrder
	| logger |
	logger := InMemoryLogger new 
					runDuring: [ 
						StringSignal log: 'test1'.
						StringSignal log: 'test2' ].
	self assert: logger recordings size = 2.
	self assert: logger recordings first message = 'test1'.
	self assert: logger recordings last message = 'test2'