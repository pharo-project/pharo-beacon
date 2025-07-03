Extension { #name : 'MemoryLoggerTest' }

{ #category : '*Beacon-Extra-Tests' }
MemoryLoggerTest >> testStartForMultipleSignals [
	| logger |
	logger := MemoryLogger new.
	logger runFor: StringSignal, MethodStackSignal during: [ 
		StringSignal emit: 'This should be recorded.'.
		MethodStackSignal emit.
		DummySignal new emit ].
	self assert: logger recordings size equals: 2
]

{ #category : '*Beacon-Extra-Tests' }
MemoryLoggerTest >> testStartForOnlyOneSignal [
	| logger |
	logger := MemoryLogger new.
	logger runFor: StringSignal during: [ 
		StringSignal emit: 'This should be recorded.'.
		MethodStackSignal emit ].
	self assert: logger recordings size equals: 1.
	self assert: logger recordings first message equals: 'This should be recorded.'
]
