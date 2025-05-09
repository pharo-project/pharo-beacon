testing
testRunDuringStopsAtTheEnd
	| logger |
	logger := MemoryLogger new.
	logger runDuring: [
		self assert: logger isRunning ].
	self assert: logger isRunning not