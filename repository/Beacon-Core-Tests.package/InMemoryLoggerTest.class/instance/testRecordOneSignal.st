testing
testRecordOneSignal
	| logger |
	logger := InMemoryLogger new 
					runDuring: [ StringSignal log: 'test' ].
	self assert: logger recordings size = 1.
	self assert: logger recordings first message = 'test'