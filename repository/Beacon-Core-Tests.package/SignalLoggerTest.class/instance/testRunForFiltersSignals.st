tests
testRunForFiltersSignals

	| logger |
	logger := MemoryLogger new.
	logger runFor: StringSignal during: [
			StringSignal emit: 'This should be recorded.'.
			DummySignal new emit.
			StringSignal emit: 'This one too' ].
	self assert: logger entries size equals: 2