Example:
	String streamContents: [ :stream |
		CustomStreamBeacon new 
			stream: stream;
			runDuring: [ 
				MessageSignal log: 'This is a message' ] ]