testing
testStartForMultipleSignals
	| logger |
	logger := MemoryLogger new.
	logger runFor: StringSignal, MethodStackSignal during: [ 
		StringSignal emit: 'This should be recorded.'.
		MethodStackSignal log.
		DummySignal new log ].
	self assert: logger recordings size equals: 2