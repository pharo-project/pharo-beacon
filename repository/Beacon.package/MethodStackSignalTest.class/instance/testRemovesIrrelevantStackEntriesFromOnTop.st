testing
testRemovesIrrelevantStackEntriesFromOnTop
	| signal |
	signal := MethodStackSignal log.
	self assert: signal stack first = thisContext stack first method asRingDefinition