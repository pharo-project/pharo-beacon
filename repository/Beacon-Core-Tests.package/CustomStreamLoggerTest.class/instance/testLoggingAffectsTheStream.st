tests
testLoggingAffectsTheStream
	| loggedResult |
	loggedResult := String streamContents: [ :stream |
		(CustomStreamLogger with: stream)
			runDuring: [ 
				StringSignal emit: 'This is a message' ] ].
	self assert: loggedResult lines size equals: 1