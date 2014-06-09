Example:
	String streamContents: [ :stream |
		(CustomStringStreamBeacon with: stream)
			runDuring: [ 
				MessageSignal log: 'This is a message' ] ]