testing
testRemovesIrrelevantStackEntriesFromOnTop
	| signal |
	signal := MethodStackSignal emit.
	self assert: signal stack first equals: thisContext stack first method asRingDefinition