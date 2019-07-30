testing
testRecordOneSignal
	| logger |
	logger := MemoryLogger new runDuring: [ StringSignal emit: 'test' ].
	self assert: logger recordings size equals: 1.
	self assert: logger recordings first message equals: 'test'