testing
testRemovesIrrelevantStackEntriesFromOnTop
	| signal |
	signal := StackSignal log.
	self assert: signal stack first = thisContext stack first method asRingDefinition