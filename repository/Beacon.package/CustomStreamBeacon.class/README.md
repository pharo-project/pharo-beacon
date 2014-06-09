Example:
	String streamContents: [ :stream |
		(CustomStreamBeacon with: stream)
			runDuring: [ 
				MessageSignal log: 'This is a message' ] ]