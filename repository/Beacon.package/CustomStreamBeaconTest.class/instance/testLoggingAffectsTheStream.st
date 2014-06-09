tests
testLoggingAffectsTheStream
	| loggedResult |
	loggedResult := String streamContents: [ :stream |
		(CustomStringStreamBeacon with: stream)
			runDuring: [ 
				MessageSignal log: 'This is a message' ] ].
	self assert: loggedResult lines size = 1