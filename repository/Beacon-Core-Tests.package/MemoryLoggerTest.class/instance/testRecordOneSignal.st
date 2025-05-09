testing
testRecordOneSignal

	| logger |
	logger := MemoryLogger new runDuring: [ StringSignal emit: 'test' ].
	self assert: logger entries size equals: 1.
	self assert: logger entries first message equals: 'test'