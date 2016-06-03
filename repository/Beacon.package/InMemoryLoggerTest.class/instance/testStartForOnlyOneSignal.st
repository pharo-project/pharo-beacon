testing
testStartForOnlyOneSignal
	| logger |
	logger := InMemoryLogger new.
	logger runFor: StringSignal during: [ 
		StringSignal log: 'This should be recorded.'.
		MethodStackSignal log ].
	self assert: logger recordings size equals: 1