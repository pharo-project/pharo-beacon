*Beacon-Extra-Tests
testStartForMultipleSignals
	| logger |
	logger := MemoryLogger new.
	logger runFor: StringSignal, MethodStackSignal during: [ 
		StringSignal emit: 'This should be recorded.'.
		MethodStackSignal emit.
		DummySignal new emit ].
	self assert: logger recordings size equals: 2