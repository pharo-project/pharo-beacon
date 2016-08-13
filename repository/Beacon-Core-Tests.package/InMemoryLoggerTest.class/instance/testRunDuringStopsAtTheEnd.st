testing
testRunDuringStopsAtTheEnd
	| logger |
	logger := InMemoryLogger new.
	logger runDuring: [ 
		self assert: logger isRunning ].
	self assert: logger isRunning not