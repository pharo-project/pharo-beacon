testing
testStartForMultipleSignals
	| logger |
	logger := InMemoryLogger new.
	logger runFor: StringSignal, MethodStackSignal during: [ 
		StringSignal log: 'This should be recorded.'.
		MethodStackSignal log.
		DummySignal new log ].
	self assert: logger recordings size equals: 2