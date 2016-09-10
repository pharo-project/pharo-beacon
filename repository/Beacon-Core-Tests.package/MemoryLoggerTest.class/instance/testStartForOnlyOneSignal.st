testing
testStartForOnlyOneSignal
	| logger |
	logger := MemoryLogger new.
	logger runFor: StringSignal during: [ 
		StringSignal emit: 'This should be recorded.'.
		MethodStackSignal log ].
	self assert: logger recordings size equals: 1