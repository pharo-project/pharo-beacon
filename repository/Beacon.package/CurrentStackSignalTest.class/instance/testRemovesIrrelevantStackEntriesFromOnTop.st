testing
testRemovesIrrelevantStackEntriesFromOnTop
	| signal |
	signal := CurrentStackSignal log.
	self assert: signal stack first = thisContext stack first