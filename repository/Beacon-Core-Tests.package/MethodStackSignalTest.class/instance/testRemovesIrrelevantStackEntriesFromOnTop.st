testing
testRemovesIrrelevantStackEntriesFromOnTop
	| signal |
	signal := MethodStackSignal emit.
	self assert: signal stack first = thisContext stack first method asRingDefinition