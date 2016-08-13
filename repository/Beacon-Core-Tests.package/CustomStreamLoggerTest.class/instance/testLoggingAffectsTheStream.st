tests
testLoggingAffectsTheStream
	| loggedResult |
	loggedResult := String streamContents: [ :stream |
		(CustomStringStreamLogger with: stream)
			runDuring: [ 
				StringSignal log: 'This is a message' ] ].
	self assert: loggedResult lines size = 1