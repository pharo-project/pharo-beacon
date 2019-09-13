*Beacon-Extra-Tests
testStartForOnlyOneSignal
	| logger |
	logger := MemoryLogger new.
	logger runFor: StringSignal during: [ 
		StringSignal emit: 'This should be recorded.'.
		MethodStackSignal emit ].
	self assert: logger recordings size equals: 1.
	self assert: logger recordings first message equals: 'This should be recorded.'