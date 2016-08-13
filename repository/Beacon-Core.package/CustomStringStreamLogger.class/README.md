Example:
	String streamContents: [ :stream |
		(CustomStringStreamBeacon with: stream)
			runDuring: [ 
				StringSignal log: 'This is a message' ] ]